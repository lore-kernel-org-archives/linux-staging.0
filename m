Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD234A3CD
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981559; cv=none; b=IlBXQCnhMI0LFra84DwrB+PO76oRjSs2hB8TxhWCBqxyODaTiFUWd2RPcwI20wp6ni8ykI0kZM6satAq2/jXuOTUp7j1PJvOAP43T/xafE+G9UbKoWBFPjj6Y3Sg+6VwVTRf7ArEcR3HYXXUcj2xMURTl+G5FvD+oeqNfUQ6QqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981559; c=relaxed/simple;
	bh=DMGvhM2Vw1cW9Og5Yd3o2dfXp0dNnt7ehKfAreg/Ldc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbAPdFFeKw3LjGD/d+PQFV9L4Xa5CZ2MZbGVLvwUdpk6meQ7D4oPWSDPV4ASAujvMhaeByQeaZcokfMzJ2mk/C96FpfT+t3m7ofpXfnbT/KoF6i4/Gu2koDjQD/hxxyaJEWQOVIWX2dPjfVuDBLyDSQCbYXwIT4DyHjgcsth4BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=On9Wmlwv; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="On9Wmlwv"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-349bb6f9c86so7481977a91.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 06:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765981555; x=1766586355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II+LGaawjlQbAy9TSGZyPCcQFd4XRjhnL/wD+DvcjYQ=;
        b=On9Wmlwvip4RB4OXCcP47tsSjn8TNiCyUc8+11Y1VZD3t2QDlnxnNk0a9102Cq427o
         VpR7CAaHL0I6msFYRRMYyNvoay3CDNNwxLXkglxD638GId/ozefco163YUSszUzhTWO0
         5+5TbBdU9s30fQknaoMiTNTqs/L6ebrJ24Q2VBkyf6FV2cy1Vx+cKgcDwRQizvjv9JZR
         /tE4Gl5OVDSOdhh1gLX3LNCpZWTNB7ytOjnv84yXayEHYwmyPSbUf2ZsOchc/eDPS8ZG
         XwRw9dzR9IhiSj2Zy/whcfQHe4ElEwbs26VwzwfszctkShbzdgbW4NulzO6MwA/qcLoQ
         935Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765981555; x=1766586355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=II+LGaawjlQbAy9TSGZyPCcQFd4XRjhnL/wD+DvcjYQ=;
        b=QfL76srSjmd9nCGp4HjCswFxITBKuxeezXZJ4uDrNc5n4qEJ3zCmv5FVBYQIZfCLAz
         rFAXF6vfQoiMf8KIDgkqUU3shHIQ2c1H9Bl37ft630KPk8BKDmRXx7b31kXcR2Rwmz5f
         SBk8pI2tijiX4uJu2d8KMo30LUH9R4LNjhZSr9eXZoQY5IQas8jSfGyOeTaskKI+dzGc
         gnsS0VuqMYgoSW+bJ+wabhKWzoW5KRJUwmEisiFBQ6IHODFdhl2chwSxsLGbO6DGVU3T
         1JQEENaKZwjIMqu6i5GcYdwhxd7cBJFELD3++2juHXUI/Fu6FxyxELBRlHdxQDMQWA3D
         2t9Q==
X-Gm-Message-State: AOJu0YxRXOeRtFLKkGAx6TWOKh0GSWRM1Ge8ajaL5e1QgbFYBleA0SrH
	FJRAWhpjYSEHmaVjjHTfVqncDbOlBxpdDAkwAc3gAFfUYlFB5WIW/vOg
X-Gm-Gg: AY/fxX6tRFN1yAenVPm5cXcQFfsnXT6b5Nx83YhKlyn1lm51gA8u5v4C9/2nCtDhXfP
	u8ogXerfvmnY6uNxtVHPfQJ7KOmyDMN2FDnMPQ1797hfMRXGZGBIInduUssb3XDkCwAGBNEzpzZ
	f8BkrTWac8VIS1XQGDmrA19XjZVxUTI8S+I5MNU6+IiM23pY+B2Uou9MAcXS8h8k1DzS2fTmix0
	ROXlYw4WawT0iHPZ5/jV3iaQ3QZhGUYFB4ZxqB9crgMJfZzKm923b6YVEO75ksCnwByagYz5vtp
	Fg+AUxqVJU3+j6MfqC86jmd7TR/y0caUD5G7F1dFLzyBoFoLnkWUHZtJQdhjTzWI/rGS1BW2OkV
	sc8ggntcMV/1x5Z07cRZeaMS1Xnj6Hp/lMqKCzD3elZYF9UoJigz+Q34M96Aw2RBP+LC17wNs6j
	HNpiOaXKG0
X-Google-Smtp-Source: AGHT+IHacezrT1Sm5KfpUQSjEyy3IS5tPCNiCyC8an/zoomO5QPaNUWLg3jR1qarKOBgxGtuA7iDZw==
X-Received: by 2002:a17:90b:2e0c:b0:341:8c8b:b8e6 with SMTP id 98e67ed59e1d1-34abd734244mr16178920a91.16.1765981555428;
        Wed, 17 Dec 2025 06:25:55 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cdbacc1dasm1544331a91.10.2025.12.17.06.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:25:55 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org,
	karanja99erick@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove unnecessary braces
Date: Wed, 17 Dec 2025 14:24:43 +0000
Message-ID: <20251217142444.5530-2-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217142444.5530-1-sanghae778@gmail.com>
References: <20251217142444.5530-1-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes coding style issues reported by checkpatch.pl in
odm_CfoTracking.c

The change include:
1. Removing unnecessary braces {} from single-line conditional
   statements.

The change verify clean with checkpatch.pl.

thanks,

Sanghyeon Lee

Signed-off-by: Sanghyeon Lee <sanghae778@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 666a9f44012d..0b70509f553b 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -100,9 +100,8 @@ void ODM_CfoTracking(void *pDM_VOID)
 	u8 Adjust_Xtal = 1;
 
 	/* 4 Support ability */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING))
 		return;
-	}
 
 	if (!pDM_Odm->bLinked || !pDM_Odm->bOneEntryOnly) {
 		/* 4 No link or more than one entry */
@@ -110,9 +109,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 	} else {
 		/* 3 1. CFO Tracking */
 		/* 4 1.1 No new packet */
-		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre) {
+		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre)
 			return;
-		}
+
 		pCfoTrack->packetCount_pre = pCfoTrack->packetCount;
 
 		/* 4 1.2 Calculate CFO */
@@ -176,11 +175,10 @@ void ODM_CfoTracking(void *pDM_VOID)
 		}
 
 		/* 3 2. Dynamic ATC switch */
-		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC) {
+		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC)
 			odm_SetATCStatus(pDM_Odm, false);
-		} else {
+		else
 			odm_SetATCStatus(pDM_Odm, true);
-		}
 	}
 }
 
-- 
2.43.0

