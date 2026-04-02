Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6497437C900
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154858; cv=none; b=PJho6rQ5WY06DiI6NfOcz5+dQbYDbdmK9CdL1kr06jQOaFDIQwgTxurwZepHgWu4PtvjIlL6YrTI5kJMAloiAelczXkWH8Hf8pAm2X00l1bdAdz2+DfTJ/UU9un59cqTeBpwP7yxCRruck/85rUSInSbc0U6lrKkWNf7gio9i3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154858; c=relaxed/simple;
	bh=G2LiP/nMT2KkVlegs7AcS102qYzLjyaDSQu2Wg0AbH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/3cRnxy6VaV+WXLqOQRp+tXwh9fnzyxsFBjqbLMK7dIiQcRRJZIr0xbPjdELJ/LB+DZW9wENRzdSAorN5nIi9MiSRBbeBCvD96loY/Sef826AaM4boo4790Q9aJ7mx6ILecL0k/7EQycErptjHm1L6f7KlWH8FDk3vRLfR9ZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJycNMvC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJycNMvC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb439299so10725785e9.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154855; x=1775759655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6yjfxpYPYFMWVyjMIQNMKPqFadWr1YU9eOzubcyd/4=;
        b=rJycNMvC2Kmf1lU3lzTbsGrzrqxniCovLRED5sEYUxmoVk59WbYXKFnV8JaA70mJNK
         yZU+zYnAVspCELT8EBl3WFtHde4qG/to4fil5mSECJNRpEmBYI18RhI/QYqk65x+DX8I
         oL9yvCTsGTCCfPjQR45bNMbCklJukTtP+S3VRl8fes6y/5HKdSZUcfEc6tl8+EOkg0Pl
         PBRVfRTkdzER0IXVviQICubQrcAPiPFJblkkoGrXDhr5bOVporCiRpbLNvC974QZLY/m
         kgxr6ZiSAQsGBtk4zLCfp9QKU5KpVRGGseq7bTn+0c6/htaagvOKyQfLxZxplj9qY0HL
         GRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154855; x=1775759655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6yjfxpYPYFMWVyjMIQNMKPqFadWr1YU9eOzubcyd/4=;
        b=Md3kkZGS7+o3IDk7KSh3pJpNUcjJsHRW7LpGO/F8tJ0tQeS312DoExzylnVSQUlEVO
         rmhrT4d/q5JPInZEKRcPmROqigaD1An2ml509hMajlbFuL5bYgdAQ2w6e7zHvs+AiPWi
         fmypCbCH+e9nDP+Q1Y00KOaLaI+mR6gLAO0L1vI7u/cBU2ewvPDs4vStBppu8ZJYx+zg
         YsJSNW1SH9aBNci0Mw+lIBFHrVvGI5tfng+egudH20uqev3RWPwyGzPtLu00rsqOovrN
         XjzHoSfoIlbuAGUPkV8CEgX8CFg42H98FJRwDsIUDcSjmFfZMbvyhOYHsiVOYy2BDX/V
         DHfg==
X-Gm-Message-State: AOJu0YzqN4f0Ni6j0oLPv8ReYaNTLk6WysVhb01LNHWuh1yHe4ryrGZR
	5+RCWapVudg9yCwi1AUJiLCJOnFAVjAl9sFMZQiWXFLtoHOxrtnC8vbcBaUoYA==
X-Gm-Gg: ATEYQzxZwGNg4jUIDcEHtZkhp2182S/L96kYdwA5CYMDai/QW6PFE0sJq9yqaiJeRmq
	8KyQlaPywQRYGamq7KDoDzRVjbhYEN3dgsuARIbL+RCq8XPbec3rGaSXaj208Hx6EXgD9l3oKvO
	4k1Dc4IVLNvjWvD87/ACdgDUsEwI6sXttYxPb26qR9WPzT3fWRei1nGKg9VWMYYYtIBhRRvEKt0
	DRilQaX1yqweUCoLbARk574M+I6pbqVtXcW+SiTVC825spWJvlEZEpm/Hpu59d/r9kmAYVB/Ap5
	QETjBXL9ygxoSZekvQXUb2DWdHF+LhQ1uJnL6FE+eNIztZ3Z24OO4wqrUcqg+uc4e1dkn4NmJzz
	qxMeq1bUm2N2dQEylLDv6LSzoI5GMwifyWDbNGv4XzM3ONmQEKZ/uMqOqvibTtyN4wWuZCr1WgX
	MsmJyF3JF3kXMugc7GCDTLwh+8ImP2eSlTQuVnfKd/RGhG
X-Received: by 2002:a05:600c:a318:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-488997dd6camr596125e9.25.1775154855371;
        Thu, 02 Apr 2026 11:34:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm205797825e9.1.2026.04.02.11.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:34:14 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/2] media: atomisp: clean up ISP configuration path
Date: Thu,  2 Apr 2026 20:33:43 +0200
Message-ID: <20260402183402.444630-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NOT TESTED, REVIEW CAREFULLY.

This series cleans up technical debt in the ISP configuration path of
the AtomISP driver.

Resolves a long-standing FIXME by gating ref and TNR frame configuration
behind the ISP feature flags that already govern their allocation,
rather than unconditionally attempting to use frames that may not have
been built into the pipeline, and removes a duplicate call that
overwrites the same cached state with identical values.

v3:
- Picked up RB tag from Andy Shevchenko.
- Fixed typo. (either -> neither)
- Removed 'staging:' from subject lines.
- Added links to previous versions.

v2:
- Replaced NULL checks with feature flag guards to address the root
  cause rather than the symptom.
- Updated subject line and commit message accordingly in patch 1/2.
- Expanded commit message to explain why the duplicate call is safe to
  remove in patch 2/2.
- Updated subject line in patch 2/2.

Link [v2]: https://lore.kernel.org/linux-staging/20260331211649.421777-1-azpijr@gmail.com/
Link [v1]: https://lore.kernel.org/linux-staging/20260328192721.255493-1-azpijr@gmail.com/

Jose A. Perez de Azpillaga (2):
  media: atomisp: gate ref and tnr frame config behind ISP enable flags
  media: atomisp: remove redundant call to ia_css_output0_configure()

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)

--
2.53.0

