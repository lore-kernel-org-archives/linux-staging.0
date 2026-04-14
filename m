Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5572798F8
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173971; cv=none; b=d2hCbXWBC1ZqIuFMKqtWEwg9w8s7aFTMzPgm4h2YZsUeZkI/xLy3zFl2YBsJp2utuFeUEc+2ZqQAdiM6oOpSd2tEIs3u45rQfRzVP4W01vsIQB3yReMGOl16A9dKei/iFKck+uunDOug8/VPUwcgZbQcURBN1m+JcKDbQAf2Q/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173971; c=relaxed/simple;
	bh=sDaQFxLTkjoIffTMqMpszpu0OFsHnNQ6LoD1FkhfNq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jz229KgTw9klXa8j7WSINt2BBxgm1yGfCuwvkCmfQa8n13Gh7kv6g8tu7fWtunO6/8pU9aZ4ua7eQod5FPwPoJK2AnUnl5lxI+8dZyypE8P4mPdBQ1ICOCeDYAPxBfDHdO936Shuwl2YcO9OGotz6Mt531Qs5mRiIIfMVuAmr3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+xesqss; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+xesqss"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f41fce3e6so982303b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776173970; x=1776778770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBonaSCvxV4C0hh6Qe1hA8mEAIoGG4QBXFvpQ6M/8jw=;
        b=M+xesqssCdyDdy6J6skYwjiTFC69C/Xew3bTPuXP8Pu7oUOplloIo+20QIm6Wy7CGE
         gqDixVD9y+/zhEaOvnQAVnUcNXHI3YHtmYq9A9jjLIpGMakj59IUJFAF2uvGFk1UASsB
         b1lfQmBy7RVCO3IXre7XcSBhsAwxWfDnb8UtKP64Qcbcco9UBhanAlZSp3/aB4m2ZBQ0
         D/9eQwDiC2yZ2gcX9d9QWKtMpAAS7vEnnsVoxBcdvDmdWfdIniWtvA6f207IWI1t0PKH
         ElSqdBPOg2HbJprRTsNrSP3/4did+2HMjdvBkvchMn7+0N7tHP7Achg9RBpUi81n4V0y
         VPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776173970; x=1776778770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBonaSCvxV4C0hh6Qe1hA8mEAIoGG4QBXFvpQ6M/8jw=;
        b=C0h2arPPE7a0IYHpGzBETMEmP/DkhrGxnR+ClzK3/HVBT8LbVwsuArjLyYFlWdMRHU
         geSV2PeWI3iE+5npGijJyMSyewx/enA/K0a1MIjYddMoRwRqX3RczlPyXXdd12dtixWa
         yLd7PAsyrIPGqIPTvqdsIWGcI1gAz7o+mH6VR+qz9lFL8+Gc3iVhJqeqgL97saN+wt5l
         bpvOQtz+4XjG1gqdrzDFoz2tYW/MddtvT02X6jyiBnPtTZIyg+N+bkfFx72gl+O85xgD
         w6Jx5fY9oKxbktIEAw4H/RglXjYUmjQkyMILDxzxEimCD1NYL1Pg57yi1axVHCumDCMM
         6tfA==
X-Gm-Message-State: AOJu0YxH74sDBprdeWpbS+UZmqkayJF2qvLb45dHLQWmh0CUdkd7I04E
	GiW0lZeO7FLL8W6sSkB6eSW2cginMAz6GVGTx8sl8X6DLYYx3Qhg3fd1
X-Gm-Gg: AeBDieu42XnYZrCt1fTYkcxLCzElovAMJ0D9o40yAhZ3RLtTTpDLI88AQts+YfZ0gHD
	Pmjk7N3S9vrZDPU277oVYhGxJ4HVLcagqeTiNqdLkFiOXLvMiEPv6yYD1c9ktSn2VLyRcR0iTAp
	rSHSejS9sXEC8sfmGGhGMZVimFtaNEYH67mXjATg+9RRWOP6zFz5U4Ha700l1T4QRyuAw0nIDcj
	Qh8dTjsz4EO2SLHmF4FMqAm7SC7KTkv3BjH9gMvSGhgj46204XVJt9fX+tcvcYPw2A7vW9m3y3m
	aFD/XMCdMwUXYB9hBWy7tFSSTLq96FTCp17PHOOHTtnBdd7d/z7lwy5jmgzbqG8ScEqe8YXbe67
	KYQ0+EpJQACYcr8e8rwTq2RHE3tqOWXblHPX69nFTVGLnk2YsCWvq5qx0zOdXWC4PFQDqCQJK5f
	mKSY9wH4sNWdwU+flaBvFKsmcBdNzMu5bTNZzAruj3JKqqPXTDTO/0OjQgU0LpAQvcX9Nx2tM8S
	HFnd2Vtqx7kKQls/iWGXH6qqpHz6u4=
X-Received: by 2002:a05:6a00:12dd:b0:82c:215d:5e9d with SMTP id d2e1a72fcca58-82f0c2f73a5mr18004443b3a.32.1776173969350;
        Tue, 14 Apr 2026 06:39:29 -0700 (PDT)
Received: from codespaces-29a85a.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a70csm13558842b3a.55.2026.04.14.06.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:39:28 -0700 (PDT)
From: Enthusiastic-coder999 <souradiptodas6@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	kees@kernel.org,
	nadzya.info@gmail.com,
	linux-kernel@vger.kernel.org,
	Enthusiastic-coder999 <souradiptodas6@gmail.com>
Subject: [PATCH] staging: vme_user: add blank lines to struct fake_driver
Date: Tue, 14 Apr 2026 13:37:34 +0000
Message-ID: <20260414133734.22106-1-souradiptodas6@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings regarding missing blank lines after
declarations. This improves readability by grouping related
Location Monitor variables together.

Signed-off-by: Enthusiastic-coder999 <souradiptodas6@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index be4ad47ed526..7ec14bf15fbe 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -67,8 +67,10 @@ struct fake_driver {
 	unsigned long long lm_base;
 	u32 lm_aspace;
 	u32 lm_cycle;
+
 	void (*lm_callback[4])(void *);
 	void *lm_data[4];
+
 	struct tasklet_struct int_tasklet;
 	int int_level;
 	int int_statid;
-- 
2.52.0

