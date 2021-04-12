Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80FF72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 11:22:25 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id z16so9116201pga.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AagLpiU/5w+hbS3rSIWdhh9pnQqTVxdZ8rB4CC9+7cc=;
        b=FLTR6RBmPhwEinIlAiy2/1Ym/PLTq4voDNISociO5qk2JAVweN4mIVaj+wCS2Kb3q4
         bNButkxGaBeVmgyKYTOhCVvz6OZVpR23bCFynDvfZDa5zZT5XD0oz/0mjVGjsQVNTEXG
         cWJhJ2hb/ZFjC2bkUPsDKJM1vKQtfqLjboRFLvMrzBAZeCLKoE1m+CQNX2jIpAnOwZRh
         nby45/7cC+my89h/rZHYtdcbQrmvDYnSYLwzlRuV9O9dBvM3fwyhX+exK4Agce8PZXSf
         jbXDeMHJ5Hnhr2cuW1cMgQ0hKpIHEKGoAOUtPQMBFAqLAXn9up+/wqFAbOTxT3PDgN1f
         1zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AagLpiU/5w+hbS3rSIWdhh9pnQqTVxdZ8rB4CC9+7cc=;
        b=eGCVEsHy0OL0Y9lnqcU0ivd4InrpWbMfyi7dAx3x05kG+h631Q/p/XtUK2RS+/jvP+
         en29y36Z7AAqam4Wge8/JcjaxOqZw2UQOD4QsesVEaQRmtGizvhZX6ZPCTbIBfb5q17Z
         IKRt5Re/0kd081WgPpduyr3Oc+6v/us2Ub8EFlCI4SqyiC753DL3k7brwXrbWD72lg9X
         a+5MOdJBBuT636lQssprMqia193vi4DenaFn/GZOaHUE3tZvtp45G51s4k3pUe6KKvWr
         Sx/FYHdvOrddhzyo+b1ES9hQPvQ+rF8otgxTIvgvZNEVxtSn+pq4kqvEFABwZTrCB7u9
         s8aQ==
X-Gm-Message-State: AOAM531K8RbvbjlDkhypNkwSEvpBe1e/ebiQgW9KMwCpbCrLbNLz172j
	JTNP3fzeA/5JFP9UVS1w91c=
X-Google-Smtp-Source: ABdhPJz2LiuZnGHPVLAo0QQuXPbLVH1BQ/Fk7LABV/WHMKUBiZ966VP/dcczpkZJHnHgdug+7Z7x4g==
X-Received: by 2002:a62:de83:0:b029:23e:6d5f:b166 with SMTP id h125-20020a62de830000b029023e6d5fb166mr24149312pfg.78.1618226545431;
        Mon, 12 Apr 2021 04:22:25 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id 123sm7085090pfx.180.2021.04.12.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 04:22:25 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:52:16 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4 3/3] staging: rtl8192e: remove unnecessary parentheses
Message-ID: <29464cba775f9529db30b7fb4168198975098b55.1618224838.git.mitaliborkar810@gmail.com>
References: <cover.1618224838.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618224838.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses because they must be used only when it
is necessary or they improve readability.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v3:- No changes.
Changes from v2:- Rectified spelling mistake in subject description.
Changes has been made in v3.
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

