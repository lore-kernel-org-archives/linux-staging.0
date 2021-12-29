Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F022CA0
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:42 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f134-20020a1c1f8c000000b00345c05bc12dso12313503wmf.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sYWhROV3J/dITq6IQ2WM54SGEN8Pa5CA7vyqizdoDJo=;
        b=g3j8V9HI+zmxeGUf0AmdTSwkd5A3NIpf90l7o1y9tBfmeLDVAnfoZHsX72qg+RgwCg
         WWu+ASx/OIozQf/ZbXFPmQ3/UHbhGt4DPq8JCzgDOWX6pobXWyUpqHjD4cJkh9ANw9Rr
         mkLpBgXd1J0yYkZ2EVx6Zpiqu7bAy6BO/A6S6Y69vNDDFn29c9HyZAQ9BG2jhUKinzWm
         NXH8HIQys31HFQv1aXIQK9GKSGMM5AFlQTYH63q+6T5Q56wT8gV3AhyrrEknEg+W71L0
         Ocwl24yoGg1Vw1Tpy3t7DlixMxBK5nChnGJqg1iG1eFTi5pSirFfCOuAR1aXpcSYY3Hk
         Sqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sYWhROV3J/dITq6IQ2WM54SGEN8Pa5CA7vyqizdoDJo=;
        b=32zS8+8ylluSadsa/22Eqw4eZkbd4A+4ZxC2yAobQprS1/J+paekIeXZSu65XsQAtS
         d/3Q43VecSHkw7xobv8qbK6cTjR/YyWTYBHx4AiNbTiLuqyLI2i3BewU5a32vRbZOlag
         s36GWBgw1NxJCSijkRmPdXgmOAieukLqZmwPBLusz5xGTWCQLUZyCOOQy1745Go3iplR
         y+Qmoe6qpFyp1Gc4SqM23/fQGF/EpI5KqptJ8Gb9obQgm+ap7/nHXnTuJQzOR4Ix6zbb
         e3ecLsHKChF6WuwtiAo7yj447KjZIKgdj26hYJcNy7cv+5mMyz8t809zql52GuGuJQLp
         sbqw==
X-Gm-Message-State: AOAM5322BsO2cJT9UPOorG0ivgxbE32I+abmmWlnnuDxwyZCKbVue8oN
	pZflpnmBoyaavnNVxeX5EKs=
X-Google-Smtp-Source: ABdhPJxbdgpyhowcJ/hjAWz2gc6wA8vccXbzKoFri2DjmTESmIi0I9HB8wXTbgPS3wy55/04PNi9Wg==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr23097400wmj.156.1640811100863;
        Wed, 29 Dec 2021 12:51:40 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:40 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 20/32] staging: r8188eu: make odm_RefreshRateAdaptiveMask() static
Date: Wed, 29 Dec 2021 21:50:56 +0100
Message-Id: <20211229205108.26373-21-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_RefreshRateAdaptiveMask() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 51 +++++++------------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 7394dff4f7ff..41e954ec4e86 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -346,6 +346,24 @@ static void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm)
 	pOdmRA->LowRSSIThresh = 20;
 }
 
+static void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm)
+{
+	u8 i;
+	struct adapter *pAdapter = pDM_Odm->Adapter;
+
+	if (pAdapter->bDriverStopped)
+		return;
+
+	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
+		struct sta_info *pstat = pDM_Odm->pODM_StaInfo[i];
+
+		if (IS_STA_VALID(pstat)) {
+			if (ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level))
+				rtw_hal_update_ra_mask(pAdapter, i, pstat->rssi_level);
+		}
+	}
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -703,39 +721,6 @@ u32 ODM_Get_Rate_Bitmap(struct odm_dm_struct *pDM_Odm, u32 macid, u32 ra_mask, u
 	return rate_bitmap;
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	odm_RefreshRateAdaptiveMask()
- *
- * Overview:	Update rate table mask according to rssi
- *
- * Input:		NONE
- *
- * Output:		NONE
- *
- * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	05/27/2009	hpfan	Create Version 0.
- *
- *---------------------------------------------------------------------------*/
-void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm)
-{
-	u8 i;
-	struct adapter *pAdapter = pDM_Odm->Adapter;
-
-	if (pAdapter->bDriverStopped)
-		return;
-
-	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
-		struct sta_info *pstat = pDM_Odm->pODM_StaInfo[i];
-		if (IS_STA_VALID(pstat)) {
-			if (ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level))
-				rtw_hal_update_ra_mask(pAdapter, i, pstat->rssi_level);
-		}
-	}
-}
-
 /*  Return Value: bool */
 /*  - true: RATRState is changed. */
 bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI, bool bForceUpdate, u8 *pRATRState)
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index bb4ea0b57f08..c2287d00aa60 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -38,7 +38,6 @@ void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
 void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
-void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm);
 void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm);
 void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1

