Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF5D2CA0
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id e5so13954566wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eo0tfBwpFHKmaR9uiricUJYGewJt0PxAB46raXgX+vQ=;
        b=OCvcOZjiP3MfnVzjNKa/Pd4TQMzgNtpZeV5QTlf8gykItJ0aH7mviqOXdjnM8PUDAC
         kFSHImHNx360vVlosGk1Sp0s4myY2TUed0an0H5JVUvLKX7mECAP6vhguZtIeNAyo9FO
         jirb0R/oXEJjEGsUd0IpLs//qCFMveUGitwPp7uFJO8we8Y/u4fQdP1v2mmTlmhaP8aQ
         pJoe6qdnyfJTN6u9Xr2t5D5T3l8712rW3RWPd2mFx8nOR0iDe+Mu6QAYpTTdAiKq4DMT
         Rx/n0ozGMKp5VLXgh8aJQdv1WbV6ZAP3hynVdPzlaweWG1YkezKE0JBijpF0ydO+q5WP
         VRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eo0tfBwpFHKmaR9uiricUJYGewJt0PxAB46raXgX+vQ=;
        b=cHX9KoBqlp+mA49isL04T/BqsOHPGqHW8KWH9WTo/eZTX/LDt/GTSmPKimWawnnURc
         mL02NKvKSHPQKRrRSKsP1DL3kyaUMkEg/iskXYGH6NOIzAtVRcs/eaJxv4iFdpBljjkj
         Xa8u1wr0BTlYoLdzHs887i3Sc62iAwU0BPGXnkfzfK+z2IZCirs2SksRWEJgcxuzMadv
         omuqPGi00q2w1ZXLGP86VlVJUndWxZJN/xHWQI39vCMYo0PadbtxV53jrGX+Upy1uqkH
         HscX7eyXPxlAElxKbMQHek0wqpyHreGmF8DZ4P5ZfgkteIsRck4COAqyOV8TnZFpMD5x
         m7uQ==
X-Gm-Message-State: AOAM531QjiH+fwVYBkNr7f1CXkjHECp/AZ9+xho1weGOqlAkt8mjs/bw
	zCeonzWwcTcei9MEcCbeSlQ=
X-Google-Smtp-Source: ABdhPJx1uxF1NI04/LcRERUu4LP2wJXu5LEcCa3YTkeGs3L3pYG9ffLBsfNkIaebsIqIixTWUozUrw==
X-Received: by 2002:a7b:c08c:: with SMTP id r12mr23494060wmh.161.1640811097140;
        Wed, 29 Dec 2021 12:51:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:36 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 15/32] staging: r8188eu: make odm_DIGInit() static
Date: Wed, 29 Dec 2021 21:50:51 +0100
Message-Id: <20211229205108.26373-16-straube.linux@gmail.com>
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

Function odm_DIGInit() is used only in odm.c. Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 58 +++++++++----------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index c50f5219df36..cb1882f8a8bd 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -142,6 +142,35 @@ u8 CCKSwingTable_Ch14[CCK_TABLE_SIZE][8] = {
 #define		RxDefaultAnt1		0x65a9
 #define	RxDefaultAnt2		0x569a
 
+static void odm_DIGInit(struct odm_dm_struct *pDM_Odm)
+{
+	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
+	struct adapter *adapter = pDM_Odm->Adapter;
+
+	pDM_DigTable->CurIGValue = (u8)rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_IGI_A_11N, ODM_BIT_IGI_11N);
+	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
+	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
+	pDM_DigTable->FALowThresh	= DM_false_ALARM_THRESH_LOW;
+	pDM_DigTable->FAHighThresh	= DM_false_ALARM_THRESH_HIGH;
+	pDM_DigTable->rx_gain_range_max = DM_DIG_MAX_NIC;
+	pDM_DigTable->rx_gain_range_min = DM_DIG_MIN_NIC;
+	pDM_DigTable->BackoffVal = DM_DIG_BACKOFF_DEFAULT;
+	pDM_DigTable->BackoffVal_range_max = DM_DIG_BACKOFF_MAX;
+	pDM_DigTable->BackoffVal_range_min = DM_DIG_BACKOFF_MIN;
+	pDM_DigTable->PreCCK_CCAThres = 0xFF;
+	pDM_DigTable->CurCCK_CCAThres = 0x83;
+	pDM_DigTable->ForbiddenIGI = DM_DIG_MIN_NIC;
+	pDM_DigTable->LargeFAHit = 0;
+	pDM_DigTable->Recover_cnt = 0;
+	pDM_DigTable->DIG_Dynamic_MIN_0 = DM_DIG_MIN_NIC;
+	pDM_DigTable->DIG_Dynamic_MIN_1 = DM_DIG_MIN_NIC;
+	pDM_DigTable->bMediaConnect_0 = false;
+	pDM_DigTable->bMediaConnect_1 = false;
+
+	/* To Initialize pDM_Odm->bDMInitialGainEnable == false to avoid DIG error */
+	pDM_Odm->bDMInitialGainEnable = true;
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -310,35 +339,6 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 	}
 }
 
-void odm_DIGInit(struct odm_dm_struct *pDM_Odm)
-{
-	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
-	struct adapter *adapter = pDM_Odm->Adapter;
-
-	pDM_DigTable->CurIGValue = (u8)rtl8188e_PHY_QueryBBReg(adapter, ODM_REG_IGI_A_11N, ODM_BIT_IGI_11N);
-	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
-	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
-	pDM_DigTable->FALowThresh	= DM_false_ALARM_THRESH_LOW;
-	pDM_DigTable->FAHighThresh	= DM_false_ALARM_THRESH_HIGH;
-	pDM_DigTable->rx_gain_range_max = DM_DIG_MAX_NIC;
-	pDM_DigTable->rx_gain_range_min = DM_DIG_MIN_NIC;
-	pDM_DigTable->BackoffVal = DM_DIG_BACKOFF_DEFAULT;
-	pDM_DigTable->BackoffVal_range_max = DM_DIG_BACKOFF_MAX;
-	pDM_DigTable->BackoffVal_range_min = DM_DIG_BACKOFF_MIN;
-	pDM_DigTable->PreCCK_CCAThres = 0xFF;
-	pDM_DigTable->CurCCK_CCAThres = 0x83;
-	pDM_DigTable->ForbiddenIGI = DM_DIG_MIN_NIC;
-	pDM_DigTable->LargeFAHit = 0;
-	pDM_DigTable->Recover_cnt = 0;
-	pDM_DigTable->DIG_Dynamic_MIN_0 = DM_DIG_MIN_NIC;
-	pDM_DigTable->DIG_Dynamic_MIN_1 = DM_DIG_MIN_NIC;
-	pDM_DigTable->bMediaConnect_0 = false;
-	pDM_DigTable->bMediaConnect_1 = false;
-
-	/* To Initialize pDM_Odm->bDMInitialGainEnable == false to avoid DIG error */
-	pDM_Odm->bDMInitialGainEnable = true;
-}
-
 void odm_DIG(struct odm_dm_struct *pDM_Odm)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 7f08f2d0a671..258119e2c4b9 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -31,7 +31,6 @@
 #include "odm_RegConfig8188E.h"
 #include "odm_RTL8188E.h"
 
-void odm_DIGInit(struct odm_dm_struct *pDM_Odm);
 void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm);
 void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1

