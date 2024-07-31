Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647A61A8C02
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722422043; cv=none; b=lerFxz2kcuRaxa8vfiTF00zcq3gQY93kkvQ3sMaP6yw/OZbJn0/bSaTh+mb1RFCPRJRbCobzvQ8YOPBF8RKSqKYv2KEdqmPeRueORde064uZCxAU3Nft1xgVF0hG+V2HBmr9qJ2zIwcEiurPVxIx19g5k+4P0eBTvx32oxtKN6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722422043; c=relaxed/simple;
	bh=dOa8hT4xWqQ2AnDtQygL24wv+0L76YIYrzot6K+GRtw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o0yja5SCdznpeBC+MjsUh6rI35LfWnTcm4eonpDPQJcX8kYBDKbmYxnnvMofp2EG6c8LZBR2GU1iw4h38MWGktLxkTPKAigs6qe48weUzCbmrt8n4Ckhdxrn6LzrRi1tp2hdmbeFLgF78GynWlq5Y9rxi+I+REGb1OkSdcaMYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBgBAMBI; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBgBAMBI"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-260f81f7fb5so3591669fac.0
        for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722422041; x=1723026841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLpJAlwrYnKpG4yNN+f5PTDXi5Vm9RWGLixCvfhYZ0w=;
        b=RBgBAMBIPpnpnPuPa220KP0ZUloP5v/L24W2ZbeGigKrk9IERxYbH+J0fZeSlRwUA7
         9JDKc7BWYlgwcnkqZNKKUBCNFXNWRUFJy7umM5tEP6FN4psEyBn0yhQFlsGCAyVqdZEE
         MjWuFmIfE8GFys7Dpixry3CH9ajtXqeSmHn3DwdhpnCH+Rpj+gdn0aCTixVxj9W3SJuI
         CB8Mlk9mqBqklZsaTzyoVftdA/+vVbWMsjcq4DHSkLHcTr7Z/kVY5tVbbEfSZXuV9mPG
         iAc4ZQxmGcHvMOBD+XtK9d9Gb0TwNgQHEUfVsQDd+MhBwZZ+Xqyg6S9jdv1Tz+v64mwE
         bkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722422041; x=1723026841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLpJAlwrYnKpG4yNN+f5PTDXi5Vm9RWGLixCvfhYZ0w=;
        b=PiGfFGtAXOH4yjw1zMmoho2QU50Bi9XlYGZFiY00EI+lrNLciLE0FBZSod7hVBJLyA
         Un9FkX3ghJVZdmz7DK93TyQnN0JzepsjK8YJPCio/iGTEdMFcQjVn0sQfS50/3KkQLMF
         3Z6SYrbJAreWOn2OZOR6+l34xgwIP/rcdqcrBjBFsg+Pj4vU27R+XpJET+bNWVu/OacZ
         sikBztCO5RV+vd33N000/xDGSFhXGtUougrjxLfpZfDeLvJRDccdzD5eDYZJY5U6+0TF
         s9t2wLj7Nm320mo4iUOw6Ki2gDwi7flq8kUQlEi5f1++l5RjRTcOR3CB1djVaaOpwP+m
         YE0A==
X-Forwarded-Encrypted: i=1; AJvYcCU56u6naxDQX5jiDj5XFcP22j33R0DjbjGCaxs8v5pMTVtdltsrMgKoaYpUIEoEp1H+XjR5fl/CoVFK2vFtHngJS4zmQaB0qbkkLpICIA==
X-Gm-Message-State: AOJu0Yw2PF+VrRdBeXe7QfsLpNYs2eIh17KtfnxfOp0LD4YijcC9G9zo
	CT7tkolUGQNiQ4H3w8y7Oqd4cbDjkFf/oONUlcGT4byJe04P4aRv
X-Google-Smtp-Source: AGHT+IG0a80aavBWEprMsVQIzBNeMtP25uSHl/X9jrMtPKSQsZSgH8vwwvHyW892+ooHawHz5yMqIw==
X-Received: by 2002:a05:6870:6488:b0:260:faa1:4453 with SMTP id 586e51a60fabf-267d4cfc02dmr16644539fac.8.1722422041368;
        Wed, 31 Jul 2024 03:34:01 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e1a89sm9734940b3a.30.2024.07.31.03.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 03:34:00 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com,
	kartik.koolks@gmail.com
Subject: [PATCH v2] staging: atomisp: bnr: fix trailing statement
Date: Wed, 31 Jul 2024 10:33:53 +0000
Message-Id: <20240731103353.39245-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error trailing statements should be on next line in
ia_css_bnr.host.c:48

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
---
v2: Move Signed-off-by line above the exclusion block
---
 .../atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
index 457a004e1..b75cfd309 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
@@ -45,7 +45,8 @@ ia_css_bnr_dump(
     const struct sh_css_isp_bnr_params *bnr,
     unsigned int level)
 {
-	if (!bnr) return;
+	if (!bnr)
+		return;
 	ia_css_debug_dtrace(level, "Bayer Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "bnr_gain_all", bnr->gain_all);
-- 
2.20.1

