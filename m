Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D20E151985;
	Wed,  2 Apr 2025 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636593; cv=none; b=pdR3MNJYf/mxbxKZpwLFdwJc8DAQNMenDsRYEa+fjT3PC1nhQhgQqw1aojuuhgJQXb8w2nrN76Ub2siotLZsm5O/8dsqgwxtLTC3pFNL8udrK5tN2nNrtGK1PJjNh3JzCyr3L4LD8MC7yXI+h8bq0RVEnIqtibuvDG2KWrSxu+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636593; c=relaxed/simple;
	bh=N+690Dl8x2S4PXkBw33aF7TsFud2SHoTXZUfjjRjn5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q0sxqPnf/tPf2ZXdWVjpMrDsDnocEpB8KefISBlTVSz6zY2hPxYkT9s7Il3P7BAEr5tcEpzy1ovKIABx2j/73wwmw8eiQAVfHuM5s/nqe6LdHI1NjBSmLKbRstN+7EpmhC8w0ukVvrYBHuE6WA8dwKeedslExCy5uNO56OEGh6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFqIQir0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFqIQir0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2aeada833so66417466b.0;
        Wed, 02 Apr 2025 16:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743636588; x=1744241388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dofhp4vd16EdUWCHkTI0LpG1Ae8tGGiEAhl+4/0E1XE=;
        b=RFqIQir0PalMZFGlbaXGHd+SEvpBAZ9tK4NoTHN2ZUbK2EHP6an0Y12IXCEMUCdZsn
         dVteChx7x93h3ApEugmJMHq2YaVkxeeqtcd8fl+Qu5aMAwKtJz5A6CsmOqKppyTkk6hM
         4Pzjbg2qVAL65uxyea1u0icyu/3ygocm2q/tjtcublZdtaArzIO2wbdVMkrW2fSfq6gU
         mvKGpOuEruEweFRko+Oz5hUX0aLmNtQFHE62nB0YmkcA76gaQaVPrCYdo2JxkhHKuf1f
         hYHH6KgY3jUajqky54jWC3rrLNdXMPpxJ9z7vLsMVeGtdpayAnToro5lk2ncTB0R2N/E
         toAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636588; x=1744241388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dofhp4vd16EdUWCHkTI0LpG1Ae8tGGiEAhl+4/0E1XE=;
        b=J1cMlHy66ri25WUyNdsWMpUkY+QA9eRrHR0ZdtOjvIWQJ4WoGkSPSTeydAQYKIbo3D
         TU9P+AM935546iA1n20cMtYwIR9n8XBnaRMln3djyT0xK40pL8eBFnttE8nNBwue0BqS
         O/yLZiTzJN1KH+IeY1nTaUJheMOms4o8Yw2Lc+172cmk+mMCTLk7v6eosPZImiza09EJ
         UWs/+HEc5yEUXN3F+sFjf5o4EnhAlmCRL39nkaFmeGUKQL/xgA4wqsezTf1D/DHQjzAr
         mPfPFZ9r+7ybYAeMCXeIdbV+uifiFjHU9DM2jQ3fJkHq5ZCKpj342plGo0OGXll2/lyQ
         x7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVSOQD1Ti+E8FUIZSgDYyEvk1ACABK11SWO6fpSAwWGdyTqnxC0H6cmtf/QsdhSUnIkyJQHa5p2bSfqtfzD@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx0e4xU6jiHecBYD+6vgFcLczPbim30XXPXUnIa9Xc/ScY0eYp
	Gk94/XVEU8l/8H4j0CxmyNkPAnOnv/P+ykOX+ruk0wfaioA6R0fV
X-Gm-Gg: ASbGncsXAImhgCR3DydJ58O2xdb4iNcPR/iFTnsYYR2gwTf9nVAfXl4h36VauMbevXN
	9LBcHrVij5Suki9fpWQAHCA8ppG3HSnJ+RyBsg+L63q+0NkXlsuzQ9GIYlrlpfUj6QaiU9LReFT
	ZFmtZ76Xtip2PlmuT8WiXnUqhw0hoWV2ZunUxFMN9kxUcniW12wbAdrtpkEQqVYE9bSto9f+q1V
	0bfURkCQfbYiH37XcY4ooBUhC2aENMwIgA+4xkTxUgHjwiH2RDRcLMb1zXQAVv818KOf6z1yccj
	JYUW2TLYf/Z3SwU6QSm3Qm31nV0u7gpNAzxZB7TC4t6iKfaizA==
X-Google-Smtp-Source: AGHT+IFYFgbrqDbUHntBMUKQVCmrIm0uA2yEG5AMH8rCPKf5xiNlmRPEsS+wGXetxPIV/AYGXPKIWg==
X-Received: by 2002:a17:907:7206:b0:ac7:b231:9554 with SMTP id a640c23a62f3a-ac7b6c46485mr144505166b.11.1743636588239;
        Wed, 02 Apr 2025 16:29:48 -0700 (PDT)
Received: from HP-650 ([105.112.231.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9868asm2439466b.41.2025.04.02.16.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 16:29:47 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 0/2] Unnecessary code cleanup patches
Date: Thu,  3 Apr 2025 00:28:59 +0100
Message-Id: <cover.1743635480.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset modifies unnecessary duplicate NULL test
on a value in an expression, when the value has been NULL
tested in a previous expression.

Abraham Samuel Adekunle (2):
  staging: media: Remove NULL test on an already tested value
  staging: rtl8723bs: Prevent duplicate NULL tests on a value

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 drivers/staging/media/av7110/sp8870.c                     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c             | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1

