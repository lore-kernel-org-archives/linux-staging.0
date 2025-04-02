Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF7469D
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 00:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743554296; cv=none; b=rdslovoqAdKzVVJHdIzPjKvoyybC33vfsjGt6W4w6Nh63McHdM+3EYMC443YhlJatHRfrhI0NiEd2/objFIiTmWI/u3gM9ZR/Y4O+ta91NXCKhQx/+dhiIhQpQHfdei6TTy2TmDeP1JXRnWYJ/ifUlJyGIxsA4zVru3lk1F5zvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743554296; c=relaxed/simple;
	bh=z0M9uNd/pSvVj6ex9nzvCEQD7uBUnyIhUAt3OMqzQHU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=YefWYKDVB5d4vqoXpuburbCzeGLs1t+baaKwaoGh/a1vaV18AkKq+owEhJlKa/cnyPRgwjFTuk5dx7vQSGyl+rzeT8KJketQvKkVxJ5np91EnbxDNLC1/rXMCK7W+dp8/Bhcfei0aebYXFYSVbcgCcmfD2Rhug/iGNKFT7RcSrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RA1nRmcr; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RA1nRmcr"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8ec399427so50733476d6.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 17:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743554294; x=1744159094; darn=lists.linux.dev;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8AWwYoeLIRBS+7sAQHa//FhJUXYT9j+mlCuz/L01liI=;
        b=RA1nRmcruDPdf41PTSUxibZNkkBsb4RPZsg5u94yg6mlErQdjcGcsWejZtgPtMIO0U
         pg1a3ai0IZQUMMzDUUSYXDpOa/Hjz+7XOAQiqEDp5Vl+syMO145cQEgc9nusxLGp0qeB
         z8ZOZw0XHQBRuVIL6qLgSH7JcQZPiXZ7T7VhIDO2O3pkyhW7BUhmCTPDszh8IQWXfxTV
         LcXEgGlqZjCG/RPcUkiRpMBChJfp4EPKGV6e9BO+A0x48W69Aj+hx93eKBdnWdf+8f3s
         47WYo+yUiotAQHzXjwkXkYp7uaPfHQQHGHsaruOkZn5Jt1XswvaddokPUxJAjERNZVoV
         ZXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743554294; x=1744159094;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AWwYoeLIRBS+7sAQHa//FhJUXYT9j+mlCuz/L01liI=;
        b=u+gGb3hFfRvLJQnBqaQYed7Z9274LvLAkVf9/RGxIrNcbMdIOX/+RFhzNcKs3nQ6BY
         pY+ECGQj14kXCrjuoPLdZ9QB6zAoI95hXSWzbrkN9T5z2pWbjkqF+oWlrBObbPntSbxE
         la5EmGP4PNlufXXnD2JYD/V0ZAcGKGJZ+K0jNcoD/6CI4PkF73JTCWqIs1DgnFSJCjNo
         u5x9RufL9EcolDgXaugqHPRbz1snaLIED7nnnJp9RloLyBw8CQO3lMsS224GCCFzLueT
         E7IkIRjSfY02OY4H8A8OaRGPenYHCI07UyFRwt0/C1FlL35zHryvokGCYX092RD3WT1F
         66CA==
X-Gm-Message-State: AOJu0YwR48C3hR2WNHrlPiRpu8G1IqFESyV4GwnOnjPd6rXSfOEwM+OP
	VR+U0raHpJhbyV2zGkfJ+ylqloarVYezvgx5nkLXsR4xfb+0sBl8
X-Gm-Gg: ASbGncuuLynZ+l6YUCR9KY7X7ApTjQUzW2bcivbEMsCKhnGmwC84VX38bo5Qvimj1ii
	PThJ29MenIt5tK6D3pX5z2lW9xj72Hn+7NsbxNm3qMu2WXiStqq+NHXU3a1Px1nepEq+Cpl7V8I
	fJvfqkBc6OJb7o1ocxzGj4x1Y8dTEf0eMMSG8TBhYk3g63efcMfq30dDU6Wl87C2iFsyPkGyhYF
	in8oyK0B4F5c2efNegIZoQGnh4jNTxqk/RyzGW66fNtMSCdZi6wUoSqzV4GYPdQkkvkRpvKsLYT
	hkRNrcWzieYmaUoKS+6Ejkt3535Q3iax89jmJHqVwlXnXQ==
X-Google-Smtp-Source: AGHT+IFEhiCS8eCnq8NYUvlP8USM+0CMd1MK5pPBJtdugFm6EBu/miHksDoPGhJavjzTu8ZXzEqMxA==
X-Received: by 2002:a05:6214:268f:b0:6e6:646e:a0f0 with SMTP id 6a1803df08f44-6ef02bc43c1mr10828756d6.12.1743554294073;
        Tue, 01 Apr 2025 17:38:14 -0700 (PDT)
Received: from [127.0.1.1] ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9627e9bsm68240356d6.15.2025.04.01.17.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 17:38:13 -0700 (PDT)
Message-ID: <67ec86f5.d40a0220.2fb67c.97f0@mx.google.com>
Date: Tue, 01 Apr 2025 17:38:13 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2284820769746903825=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-media@vger.kernel.org
Cc: 
 linux-staging@lists.linux.dev,slongerbeam@gmail.com,p.zabel@pengutronix.de,mchehab@kernel.org,gregkh@linuxfoundation.org,skhan@linuxfoundation.org,kernelmentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media: Remove unnecessary braces for single

--===============2284820769746903825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From 2414aa327e8a2b2f8b7cb5673c20bcdea3c5763e Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 1 Apr 2025 20:22:22 -0400
Subject: [PATCH] staging: media: Remove unnecessary braces for single
 statement block

Remove unnecessary braces in single statement block to comply with kernel
coding style.
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


--===============2284820769746903825==--
