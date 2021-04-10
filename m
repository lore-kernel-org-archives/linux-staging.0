Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578F71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:13:16 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id b26so262274pfr.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 19:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nPOFyIIlua33yWGhXrEphFLgIKlagAmifofs3UcXjLU=;
        b=pou+hH1r5XCVI4nwllZpV2muFqU45ynq/ro4ciJaA15IfBIAgZuzBR19o4diZVKePh
         36c4fWXFHl+jr+z+s1t5UsmCJ/RfLoAoVBoh6kvWbGZSjRzfdpIdGeqU/1iQwa1dJEY1
         Lxr1ZC2/d1vESMsWWKJfGfAAHEO4T4FLBOHi29ePiItf25XvdKD4yPLdaUcs9Pu8XAgc
         H0akB4IjgvYEODSOGouQIi8/1LFEqD4CNfByXfiHRIm4d/VBSvaLysXI5EUsIsAiCbyG
         NEaIoIYff9bryGVI9wye4Mk3FIn1TbRJuA1sFhY+FT3wLspysiXjh0k9+rOxLI7PE5uP
         AXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nPOFyIIlua33yWGhXrEphFLgIKlagAmifofs3UcXjLU=;
        b=bruV0MmvXAUe4kTDYYZZ4UGJyM2GUeDyc9HlpEMZyAgIMdJ0y3bXKrN7q5cC4/YX3g
         m82a6+xWF1EemkxS2i0AQ2yUr4pLHWUa2Q1KWe8kcbvluUtFcP7BUwv0/x7aI1sjKJ85
         mgbKqAbQw2XQZAEFtgh/2aoWP8ShtVwXYHPhEZJfAguGoD+X6l1GlPDsx30f9aBBEmg0
         pQytvdMhNXjGZ5rpitkgW01WN+bycq6Y/T8kaTfT/dLvNgHPCwbgP3gsYEC1rHbwWoI7
         iEX8cPv7T6lg1zIHqBAPlYLifnOQEpc7EaGz3g8+/8vHAkn16OD9h0da2I21r7sxiZtm
         qOtA==
X-Gm-Message-State: AOAM533xFa1zF7Q0MIhY3hufYSeZBBya1JeqCmw5hKgrWNi5Wvl214iu
	6TqwsMtjKwPszGIECy7x7eWv9bBlYA1qug==
X-Google-Smtp-Source: ABdhPJx6A9m9dxKB1E5XyPPTqYzNk5zTivMr3wfmnlGaTgzuVo7/6vOwyx0MQ2nOOYcBD+UNxuUEhA==
X-Received: by 2002:a63:544e:: with SMTP id e14mr16749833pgm.288.1618020795974;
        Fri, 09 Apr 2021 19:13:15 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id q14sm4174933pgt.54.2021.04.09.19.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 19:13:15 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:43:10 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 3/3] staging: rtl8192e: remove unncessary parentheses
Message-ID: <YHEJtkbGtHmajJIt@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed unnecessary parentheses because they must be used only when it
is necessary or they improve readability.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
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

