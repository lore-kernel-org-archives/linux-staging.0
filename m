Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772B2CA2
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n14-20020a7bcbce000000b00332f4abf43fso7439500wmi.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fq5juEOTi76Ho3pqz6a84Y5x4oefXL3HjI7ksvNnre4=;
        b=aTlifOqlUocEoolvrf6BCPc14OcPgjlJgVfDoCufA70tzmYfbZOxfUpAA3UQz4BHGy
         kekth1KUYIUhjj0TEQ6vOYU1g4FQh0bNBRlIRUhGlasKrrSTfa+a2g8SllGwpQeKk7WK
         aNj9deOqRgsDFx1Ny0Eaffymxy9pcUCpoJVHTI3Mc2v3oxgAuphNZIf39bYJNF254asK
         4yLTLnDRqwpEa6K/ZISGTmmdIlwRzhLkXGjZ5uw+G8cNnamJi6ZvrZqWab8OOWc3Y9P1
         vIK8Gwf6dBbTEnDtO5QvxyKrsvmKCOhFHv5HMRtfR+swEBMY7EmU5nHKBKT8hGwKVYZq
         OZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fq5juEOTi76Ho3pqz6a84Y5x4oefXL3HjI7ksvNnre4=;
        b=RHzilMiVplhoFFqNlF/qXYOXeE+oKC5sKHIX8Ww89/aLXoa/X3TcXsfGU7+2AFwVYv
         RHRcNkU+0J8E36crryHle/tX5wq9X6NunpXX0H/aD9sh9BF84+wucGLXWRXT03cVdR+T
         e5ky09kDjsDoBDpYSW1Ah/CAFMyMD2mNMXn+eBzfA1qEih3/YLr5VvrC1Q7awhdAmtWN
         md3iC+kXmha8DRm9XEdnHUfGgaRJVEMIEdDK16DJDyrz087l4bC0r0YnEFWC8ODCqfcr
         GQ+oDORVtTHCJEzaUpEBmViMD4gF29jPFuPHnUhUkhEaJMHsBtrcPiZ6bn+IXFawgQZ5
         G+Gg==
X-Gm-Message-State: AOAM5309f9W33l/5xQjKjQ5WWmfsB4ACFaZOK94aodTXwrCwJFINjdvT
	kOC8tvW2dlFGXB5+j8PkJjPSaGdqGQ4=
X-Google-Smtp-Source: ABdhPJy5k35jqwR/stmBhmeBbKukfcTQtmRLssRtaGnpH8nT6BYkZooSRv+WXxGc17EkkPUYw5JbmA==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr23427396wmc.187.1640811103013;
        Wed, 29 Dec 2021 12:51:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 23/32] staging: r8188eu: make odm_CCKPacketDetectionThresh() static
Date: Wed, 29 Dec 2021 21:50:59 +0100
Message-Id: <20211229205108.26373-24-straube.linux@gmail.com>
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

Function odm_CCKPacketDetectionThresh() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 58 +++++++++----------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 6e3325721c7b..88ce6675fb30 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -429,6 +429,33 @@ static void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm)
 	FalseAlmCnt->Cnt_CCA_all = FalseAlmCnt->Cnt_OFDM_CCA + FalseAlmCnt->Cnt_CCK_CCA;
 }
 
+static void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm)
+{
+	u8 CurCCK_CCAThres;
+	struct false_alarm_stats *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
+
+	if (!(pDM_Odm->SupportAbility & (ODM_BB_CCK_PD | ODM_BB_FA_CNT)))
+		return;
+	if (pDM_Odm->bLinked) {
+		if (pDM_Odm->RSSI_Min > 25) {
+			CurCCK_CCAThres = 0xcd;
+		} else if ((pDM_Odm->RSSI_Min <= 25) && (pDM_Odm->RSSI_Min > 10)) {
+			CurCCK_CCAThres = 0x83;
+		} else {
+			if (FalseAlmCnt->Cnt_Cck_fail > 1000)
+				CurCCK_CCAThres = 0x83;
+			else
+				CurCCK_CCAThres = 0x40;
+		}
+	} else {
+		if (FalseAlmCnt->Cnt_Cck_fail > 1000)
+			CurCCK_CCAThres = 0x83;
+		else
+			CurCCK_CCAThres = 0x40;
+	}
+	ODM_Write_CCK_CCA_Thres(pDM_Odm, CurCCK_CCAThres);
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -563,37 +590,6 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 	}
 }
 
-/* 3============================================================ */
-/* 3 CCK Packet Detect Threshold */
-/* 3============================================================ */
-
-void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm)
-{
-	u8 CurCCK_CCAThres;
-	struct false_alarm_stats *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
-
-	if (!(pDM_Odm->SupportAbility & (ODM_BB_CCK_PD | ODM_BB_FA_CNT)))
-		return;
-	if (pDM_Odm->bLinked) {
-		if (pDM_Odm->RSSI_Min > 25) {
-			CurCCK_CCAThres = 0xcd;
-		} else if ((pDM_Odm->RSSI_Min <= 25) && (pDM_Odm->RSSI_Min > 10)) {
-			CurCCK_CCAThres = 0x83;
-		} else {
-			if (FalseAlmCnt->Cnt_Cck_fail > 1000)
-				CurCCK_CCAThres = 0x83;
-			else
-				CurCCK_CCAThres = 0x40;
-		}
-	} else {
-		if (FalseAlmCnt->Cnt_Cck_fail > 1000)
-			CurCCK_CCAThres = 0x83;
-		else
-			CurCCK_CCAThres = 0x40;
-	}
-	ODM_Write_CCK_CCA_Thres(pDM_Odm, CurCCK_CCAThres);
-}
-
 void ODM_Write_CCK_CCA_Thres(struct odm_dm_struct *pDM_Odm, u8 CurCCK_CCAThres)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index de95948c7325..71f3cd6eb9cd 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -33,7 +33,6 @@
 
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
-void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1

