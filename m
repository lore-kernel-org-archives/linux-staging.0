Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701072
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:34:53 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so6948401pji.5
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 21:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T2DCR+pBRj77mnajpSp0QIz6gQyKylZyF8pvYWlFKCA=;
        b=Cnv3VZMvBNQpIlTF30kymRPMQrSvVe3fkJYRDqsHjQHiiI65jQxEUulF0dyfT3+2k7
         zHVBKdpDjs0E797AU7Ti5dSzp3KjuIn4NG6AQuEaHHkIJYExvNcC6ddfTtHUQDBpt1Lr
         STsZw71UMU2WLpcCBjJsnGOh6DlDaGE3JDjfF5rTPS83zma1M5WPeYOd2wz+mCJMJeX4
         0OReNZM10rTBwHFSMphTIpN0avoyr5U1CRQ3G92NH6i4MLwOZSNFGeukltHjhT5avzAx
         Mp8TgGjkqMB5um3ZxWKpxBj1fWgIgHgLRS70Lxh/rg82x7bT3s4BbOIjH3KNqhBwUYXc
         2HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T2DCR+pBRj77mnajpSp0QIz6gQyKylZyF8pvYWlFKCA=;
        b=OsGzlMvSXDnd/nCOQFm1eZMo5Vjw/wO4gO9olHNOQcBYMoBdbEuofCT49I4z7Pu7uo
         aVb2KeU1dqe9acgocS0Wr6RAUm36V1NO+CqQgnpDDxW76+7ugiw/2uOGIw4f6X02fjzi
         hhMpdd8C2Lb/dXXU7QbR6UI0Hnyb6llSB1rOWJ0ZChOTyORvWm+DHthq66mjbGvFMwzO
         d/brHrTbJidA+PFC2xPad3F4Qvl3LhC6yQIEzlwGci6lHn7badTfkCTFXH1UhtBPCMYX
         c+8d73DJo7oLZFedtndB4TenPhECUVdQz39LLwGXM78fGoWIxbO6uqWa2DjsNW/yAivn
         IIKw==
X-Gm-Message-State: AOAM530OdmleUpcRDaLlUmZXazZGxQrRrcwR7zhY+Nmgr3CIqmiXvmSB
	mrWlSly+mccKCswzyY7i7jo=
X-Google-Smtp-Source: ABdhPJw0Gr1/G08jbHMa4Woz9j/Esc6kGoPMgZSgZGq7dAjUvpgkuPJRHEUAr6zUoStB+Y4boBDuVA==
X-Received: by 2002:a17:90a:1502:: with SMTP id l2mr21502228pja.149.1618115693009;
        Sat, 10 Apr 2021 21:34:53 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id y29sm6250926pfp.206.2021.04.10.21.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 21:34:52 -0700 (PDT)
Date: Sun, 11 Apr 2021 10:04:46 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 3/3] staging: rtl8192e: remove unncessary parentheses
Message-ID: <1365e7d8dc76842e6fd9d9842bfef1ddd548b4f9.1618110617.git.mitaliborkar810@gmail.com>
References: <cover.1618110617.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618110617.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses because they must be used only when it
is necessary or they improve readability.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- No changes. 

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 89d0e9ec188d..b1fa8e9a4f28 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -287,7 +287,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 		u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};
 
 		memcpy(posHTCap, EWC11NHTCap, sizeof(EWC11NHTCap));
-		pCapELE = (struct ht_capab_ele *)&(posHTCap[4]);
+		pCapELE = (struct ht_capab_ele *)&posHTCap[4];
 		*len = 30 + 2;
 	} else {
 		pCapELE = (struct ht_capab_ele *)posHTCap;
@@ -646,13 +646,13 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->CurrentMPDUDensity = pHTInfo->MPDU_Density;
 	pHTInfo->CurrentAMPDUFactor = pHTInfo->AMPDU_Factor;
 
-	memset((void *)(&(pHTInfo->SelfHTCap)), 0,
+	memset((void *)(&pHTInfo->SelfHTCap), 0,
 	       sizeof(pHTInfo->SelfHTCap));
-	memset((void *)(&(pHTInfo->SelfHTInfo)), 0,
+	memset((void *)(&pHTInfo->SelfHTInfo), 0,
 	       sizeof(pHTInfo->SelfHTInfo));
-	memset((void *)(&(pHTInfo->PeerHTCapBuf)), 0,
+	memset((void *)(&pHTInfo->PeerHTCapBuf), 0,
 	       sizeof(pHTInfo->PeerHTCapBuf));
-	memset((void *)(&(pHTInfo->PeerHTInfoBuf)), 0,
+	memset((void *)(&pHTInfo->PeerHTInfoBuf), 0,
 	       sizeof(pHTInfo->PeerHTInfoBuf));
 
 	pHTInfo->bSwBwInProgress = false;
@@ -668,7 +668,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->IOTRaFunc = 0;
 
 	{
-		u8 *RegHTSuppRateSets = &(ieee->RegHTSuppRateSet[0]);
+		u8 *RegHTSuppRateSets = &ieee->RegHTSuppRateSet[0];
 
 		RegHTSuppRateSets[0] = 0xFF;
 		RegHTSuppRateSets[1] = 0xFF;
-- 
2.30.2

