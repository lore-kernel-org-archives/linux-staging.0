Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895311F3BAC
	for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745550; cv=none; b=JmsLi5ZkOO3agHSDxSKtuC5FC0s/3c7bCJyGI1RxL98u3p2fnEyQAIuQdcL1l0oQyjq8AmSHgO8BGG0fTTroxzdaQ8CyfRBy+6mJlbhYQLmdtmoVXEuKbUkL+fv6npDMFaIvC0dNpKu7/bcsW4vhMzesqkw4mbSVsF7iXNP+kGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745550; c=relaxed/simple;
	bh=DGBpbhXvuQ0xEpNrO0isiwgt3s6etMZ8qjti7C0evdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJXqXB/l+9PXrSVU1S72Nt/8HC/B2l0cUbynTqU+yEw84uhGFr5rfeIHw/4uI1ZxqaFMJWoIKg/HGYQoBRqrTfV0jW5pQMkgjXsUy+PUDcDxmCyWAtByk4H4xlAIRyYAVEbsxjMw2GriY/G5RlZq2VD7CKFv7/KsTHauJBZeGrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KExfiCeg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KExfiCeg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf848528aso26576895e9.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745546; x=1746350346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLe9Nl33nhWrZdDvjcJcQXnden9NZdZx4I15zXBAdL8=;
        b=KExfiCegXHwVkqQsvIVNnKl5llOvEl+kofM7sWO6KdObZmot0pxNMzvkoS98Ga/TQN
         69hOB/0O3gcf8+jX2Ylep/udGyWbd9dckDXznjCwO41ejbVSQoXZuxI3wX0+jdoTmy7s
         vCMZEGOaYv756AcvqVP6HBpPoLxACGMi+NQw0MAee53fA+gresucen4gwn0Oy5SdW/hE
         zPtJEXxxzk1siSH5HLjwX+j0u5RrZ5GQlyJfBpSCLCbWOjfzFtClzsVagZVswwoUeXCO
         OfvGrS7LPiao8GvhrVBfL7wNxRhITFLKNvoHYsK8rgotQP4xvGldNuV/kmW/NjGnV7oc
         Atow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745546; x=1746350346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLe9Nl33nhWrZdDvjcJcQXnden9NZdZx4I15zXBAdL8=;
        b=JHmv51Y5RGnY1HFrYj8pxghVFS9/pfGWGfALb5XfiT5r/nk0Lnb4XpbUtcRTqGTl9n
         ehH/a5Cv2mul6TaB7LPDzQ3T+fpOWIe9w4bjMmrOXJT/h+kxMDGsZoZmNwxHFrdB2rYk
         5UeiFFRbabWpF83gFJ0W4abw54BEqk56JmaXMUjKH7/epJz1EFzQbcef0kmNVfnwDOIY
         RXuBEfU+/NfFzBWjFO8mdiHIvYvzC8FkGDuqejBjFaJAeqs3R1Vp8nTXzqPA/W6ATkiB
         Csth9nvVaWbj4CtEThw0CpHfn1xk/mFHn2MwvFLP46WTuzx6ukdQSZQ5YZsePFT0Rivu
         brLA==
X-Forwarded-Encrypted: i=1; AJvYcCUZJ+erax/0MDf6Ux5wWJdpOoaiMcf01Lkj8S5L9GrHGjVqUT3k5Yr81K9u2qfrZ3tn5qkC/MVQMQndrtUk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9PwUqdpgDgCuANlBw8MgXClleb5dPsYGt9Qwq29vtZjw7Bl1Y
	0Wkf9A0pn0kj880ZEJE/ayWhikyLf2wsxAe9tMpA32XDRPXU/TdWJ8/Zl/Xy
X-Gm-Gg: ASbGncuilhatHDKQk5IPMk6Am7gy5uvR4NzeTGsIjUG5kQCSUNhrTAoWrISzvUNhIYg
	QjLbewbi3LtBe1i1c29eYNOv4pBS2/RNv58rsYvdN4ydlst6yqqX2U5AuE+H/1LR5N+TAvuIHQ5
	/zf+cSv1CeHP2IKAUfk5pivZJqy3iRtf/1OWu4/fjQNExf3wFfhbVzknP2cbtEmOa2qquLf0scU
	+eFRru5N6wOW5kHJBVf0iYToNDBGfl4v49VzAI9uZwslZxN3B7qRXjLsiScgSEm/heKJsAtEUce
	PVIraeMtErShNvZhXED1bgDbnnOJB+UnuZJFSFwlIzkfJLz+uFrKJ/zRz4eHzH+cHAEGDdUxpqh
	Q
X-Google-Smtp-Source: AGHT+IG917R/W1vcqTTec0X9u5YY6XbXjMGwUWW2UkxaRZJWw0xk7JcR7AOuU4kg2ET7KWpRyWH6AA==
X-Received: by 2002:a05:600c:3b0d:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-440a669994dmr58408145e9.21.1745745545636;
        Sun, 27 Apr 2025 02:19:05 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d04802fsm98730625e9.1.2025.04.27.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:19:04 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/3 V2] staging: gpib: Avoid unused variable warning
Date: Sun, 27 Apr 2025 11:19:02 +0200
Message-ID: <20250427091902.16301-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses a warning produced by make W=1 with the configuration
parameter CONFIG_GPIB_PCMCIA=y

ines/ines_gpib.c:1115:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]

Remove the declaration and assignment of the unused variable.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
V1 -> V2
  Remove the setting of the unused variable and say so in
  the commit message

 drivers/staging/gpib/ines/ines_gpib.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index a16219c0f7c8..c851fd014f48 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1112,12 +1112,9 @@ static int ines_gpib_config_iteration(struct pcmcia_device *link, void *priv_dat
  */
 static int ines_gpib_config(struct pcmcia_device *link)
 {
-	struct local_info *dev;
 	int retval;
 	void __iomem *virt;
 
-	dev = link->priv;
-
 	retval = pcmcia_loop_config(link, &ines_gpib_config_iteration, NULL);
 	if (retval) {
 		dev_warn(&link->dev, "no configuration found\n");
-- 
2.49.0

