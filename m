Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E102285068
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775381467; cv=none; b=j5DmUJiuosz3GkJAMnlEHAl6ZcmGbHEm6M/qpctpPWaDnSKlwrSGQZMQWu8eFDs9MPD35HSDFiYKlHsLZlHorfno0bBBpHupaO/47B8LkaioJP2I3Yi1eZ+UQJb8w53PJxsfn6Id1IrN+t1W0huF7paEblwH9tw3QqfDxEea2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775381467; c=relaxed/simple;
	bh=I1QQxUsSNrQ50lyL1JZyBC4jdCaPKFPub8EGFfbJjqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TYfupY0RzXIU31XyAlh3Jf4OBGXH+9lSODuTQ1nl3l1S4n4ZoXipGRRMC2n4xm1+BeBYvory/IXgC3cIIxkq64FZ2lXaolL7y2uh6WfUooV8u+grtF1FD36Dk8Jc8RBzpsvbZ7bTt+y8L01a4jAYKZbV+AhlvnPtBP0lv2F1cwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+eVTgrI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+eVTgrI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so78605e9.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 02:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775381464; x=1775986264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bk6jQ+DS/ptDGbi6xpzIUAs6Ea35R0oXfWRyiGUH/U=;
        b=o+eVTgrIuKgGruaA4Yrw/+30AnPL75omUToMnBLLl4Lw8Be6g4YJnttg/BpUB8Uc7U
         jrnq58eYfDamgGsIa3OaYq4/2sQOgL34Zi5N/ojKvFehJk/P0IcDGGXDRrhuObAdfhjW
         ngmvLWPOeAdlT7EYdMpKGWjPQTLMk+aPODkNDtfTk5yB6Mp7AyK1w/yNgbp8YINUzKcK
         muUKl9tJBQ2zyjKi03b8dSRx1jiDKptaKWI4nrrNGJQKikUn/i5eExB2LjCbQOYSLEB2
         Zr/VfAevpJCPeie/3P3buQm7+fthS/N/THLnlV4S4xNKQiZY6lfsvNky16nu90MOAxe4
         jbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775381464; x=1775986264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bk6jQ+DS/ptDGbi6xpzIUAs6Ea35R0oXfWRyiGUH/U=;
        b=N5j4pG2GhCMKvjoiiCHKwoAPuPw/5yF/m+RDphp9hnlyZywqZxA8Iool2/D3H6x50U
         xOMnANFMLmD4pDs5S0A1uZ0DDZoD4++3bm5NtTa0G4QZPZlhJaSUVM9EoTBXwUCYE3xI
         5l4YF5r/NlIf7OlCWKimMat6Vew0JZbL6rfThhOLpGAziDGk82FDbqXGyFGmGyDHHt6Z
         U5WL/CjYdE7yRvDJBy6geMz1OTRIEVuoXuwFEWpoOJxvpMV6mt22bm6ycwp2sLa3LwgE
         H0a01AQzKmQkDl0xBZtunCz9divsQNTqRNeTLObm7VQgpXCRyvBR+qKVfrL93IE1hvPd
         isMg==
X-Gm-Message-State: AOJu0YxiEiRxoqJ26ciN/vvhGS1YMK7WBnat2nLiWdVketV+7lAOEi6+
	0nGELRYy+THE4mslM5LAg4UQ0xhz4imWG5ZMcWrkIv1NMbe3S/cQAcXtFYrq1Q==
X-Gm-Gg: AeBDievAbM75JlDUU9/X3hGpD0JdAVW2eflGRlA/D8pGF1mle8aEQmKKT+YesoSnQXt
	FLVXfuAie+THRAVqb/MtvHTH/8Cpya5o07HwpuQxSOcKHVxqv4QU+Vna4JJF36GIuHWCTht+ELo
	K6T7e2qLyCDarMRu285dVP41yuiAlxBua6RfWvG2ZGzWnndnbQdjhC8NNOaMhMYvja5cAM5tMts
	2tEe84RdXXxPIdYohERreOaU0KfHSzFcKozKCAi1KW4dRphNkI88B1uW7m2gL9mtG/aWAbJS/v7
	wtGUS6mTkldy7ZGIPShVfdWxTGLaWNWxAkBzR5IjwYdue6QjayG7YI3U39RO2cMh+Hn73wvdJQn
	i9ASwcnB51QrBHMFWJ3roOuFZnG6SQnaHY5VNv1Y/Yr3KjuRKikRLsZckTaiQloXWlXOGYjQUWB
	Ol90cnhsH+JQXdcgOIY4qh6Td/8qEm449r1BKlHpv7tIb4bw==
X-Received: by 2002:a05:600c:c167:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-488997810bcmr138229235e9.14.1775381464113;
        Sun, 05 Apr 2026 02:31:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c83:b0bd:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm29156707f8f.29.2026.04.05.02.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:31:03 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 0/2] media: atomisp: clean up ISP configuration path
Date: Sun,  5 Apr 2026 11:30:42 +0200
Message-ID: <20260405093051.515222-1-azpijr@gmail.com>
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

v4:
- Added more information on why it is safe to remove the duplicate
  call.
- Added link to v3.

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

Link [v3]: https://lore.kernel.org/linux-staging/20260402183402.444630-1-azpijr@gmail.com/
Link [v2]: https://lore.kernel.org/linux-staging/20260331211649.421777-1-azpijr@gmail.com/
Link [v1]: https://lore.kernel.org/linux-staging/20260328192721.255493-1-azpijr@gmail.com/

Jose A. Perez de Azpillaga (2):
  media: atomisp: gate ref and tnr frame config behind ISP enable flags
  media: atomisp: remove redundant call to ia_css_output0_configure()

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)

--
2.53.0

