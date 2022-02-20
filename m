Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2AC5A35
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 10:02:21 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id u18so23430566edt.6
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PvjuSNwJ8S2bAfJeYCb6vqgAaUeufjbgam2qLYBulCE=;
        b=IWyTuQ9QU3bxQYW4bVMBvLJ/2j7QXL7x4dcZ6FZxSeWS6fWDqJCwgRCBusT81WzwDK
         nfUjLwsdxpxFrMSfckvEoxnCmR3bz/dkc//ItMXow+wiPGDcG6X7E7Z3hM8fUrIrn8iQ
         UtlKwzkGFdRnxLpjvj8DnBydIy4sF1aAB9Se/4LndqM6cP2fIchvgtTlomVBEh+1bwmy
         ERkl4ULYmKX/hnR2N6sxZaIUKB5kGuR2vGQpOKF/xHjQkdUUopQQl+0M40rHxjGaCJE/
         ZD8biY+HHp+hLWxwPCdkh8/FZiYXJWyAxM9ZWWLlEVnKKDi48eicBKIdRvdRoOnMATpB
         TGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PvjuSNwJ8S2bAfJeYCb6vqgAaUeufjbgam2qLYBulCE=;
        b=AiYAtnnRxhooDzkutW4UVfVgMGXI3vIcm9+JmL52s7EPjTbCW+/rLIcB27RWaLpjVN
         bO6AGghkZ0TUeas5605DThpwRHFYNlGqXytu2oYVjHaAbXtAAgHbRE03rby3+fiXT42K
         c0L/3u7FkS6hWGF768JxmP8CBfBuc/Ldu8dtTXoy96WKZaeToDd/yr0+1oLWGrRHmaqO
         nyNmmjJYr7HEonHuMD0Pg5PKcDF9xdMWOqd1829c7iQTBx7kWvsDiOyMxWM7Gwn7QaY1
         VVELOhk1vIDIoi8gETYCa8LppI9VUp5ekyG+PYwtvZWS6VVoOgYcgsBKIC40yamYnczA
         2Whg==
X-Gm-Message-State: AOAM531uatB+XU8DjjyZGB60zraJmw2BRiywU2BJRaL3TB6i7PPyo2Km
	iPyZ0ZVdYzplMorZWwmDH0U=
X-Google-Smtp-Source: ABdhPJzylaPtQT7mAPX4yfG6fnOqCWzjjIWykVIZG1NnOeHK3b8Y9JWsjDsSPBi/x0vBfek+pjKLjQ==
X-Received: by 2002:a05:6402:2801:b0:40f:f179:c3ca with SMTP id h1-20020a056402280100b0040ff179c3camr16321779ede.226.1645351339825;
        Sun, 20 Feb 2022 02:02:19 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id dx7sm3265223ejb.23.2022.02.20.02.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 02:02:19 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: r8188eu: remove ODM_CmnInfoHook()
Date: Sun, 20 Feb 2022 11:02:08 +0100
Message-Id: <20220220100212.7466-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220100212.7466-1-straube.linux@gmail.com>
References: <20220220100212.7466-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each case in ODM_CmnInfoHook() just sets a single variable. Set the
variables directly and remove ODM_CmnInfoHook().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c         | 31 -----------------------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 13 +++++-----
 drivers/staging/r8188eu/include/odm.h     | 14 ----------
 3 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index e0824eefd83a..6f594ae33c6e 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -639,37 +639,6 @@ void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	pDM_Odm->BbSwingFlagOfdm		= false;
 }
 
-void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def CmnInfo, void *pValue)
-{
-	/*  */
-	/*  Hook call by reference pointer. */
-	/*  */
-	switch	(CmnInfo) {
-	/*  Dynamic call by reference pointer. */
-	case	ODM_CMNINFO_WM_MODE:
-		pDM_Odm->pWirelessMode = (u8 *)pValue;
-		break;
-	case	ODM_CMNINFO_SEC_CHNL_OFFSET:
-		pDM_Odm->pSecChOffset = (u8 *)pValue;
-		break;
-	case	ODM_CMNINFO_BW:
-		pDM_Odm->pBandWidth = (u8 *)pValue;
-		break;
-	case	ODM_CMNINFO_CHNL:
-		pDM_Odm->pChannel = (u8 *)pValue;
-		break;
-	case	ODM_CMNINFO_SCAN:
-		pDM_Odm->pbScanInProcess = (bool *)pValue;
-		break;
-	case	ODM_CMNINFO_POWER_SAVING:
-		pDM_Odm->pbPowerSaving = (bool *)pValue;
-		break;
-	default:
-		/* do nothing */
-		break;
-	}
-}
-
 /*  Update Band/CHannel/.. The values are dynamic but non-per-packet. */
 void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index a05d8687c18d..09e78c4855f9 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -38,12 +38,13 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 
 	ODM_CmnInfoUpdate(dm_odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_WM_MODE, &pmlmeext->cur_wireless_mode);
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_SEC_CHNL_OFFSET, &hal_data->nCur40MhzPrimeSC);
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_BW, &hal_data->CurrentChannelBW);
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_CHNL, &hal_data->CurrentChannel);
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_SCAN, &pmlmepriv->bScanInProcess);
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_POWER_SAVING, &pwrctrlpriv->bpower_saving);
+	dm_odm->pWirelessMode = &pmlmeext->cur_wireless_mode;
+	dm_odm->pSecChOffset = &hal_data->nCur40MhzPrimeSC;
+	dm_odm->pBandWidth = (u8 *)&hal_data->CurrentChannelBW;
+	dm_odm->pChannel = &hal_data->CurrentChannel;
+	dm_odm->pbScanInProcess = (bool *)&pmlmepriv->bScanInProcess;
+	dm_odm->pbPowerSaving = (bool *)&pwrctrlpriv->bpower_saving;
+
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_RF_ANTENNA_TYPE, hal_data->TRxAntDivType);
 
 	for (i = 0; i < NUM_STA; i++)
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 9fb09e0a0df9..0e85bd88ab8a 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -126,17 +126,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_MP_TEST_CHIP,
 	/* HOOK BEFORE REG INIT-----------  */
 
-	/*  Dynamic value: */
-/*  POINTER REFERENCE-----------  */
-	ODM_CMNINFO_WM_MODE,		/*  ODM_WIRELESS_MODE_E */
-	ODM_CMNINFO_SEC_CHNL_OFFSET,	/*  ODM_SEC_CHNL_OFFSET_E */
-	ODM_CMNINFO_BW,			/*  ODM_BW_E */
-	ODM_CMNINFO_CHNL,
-
-	ODM_CMNINFO_SCAN,
-	ODM_CMNINFO_POWER_SAVING,
-/*  POINTER REFERENCE----------- */
-
 /* CALL BY VALUE------------- */
 	ODM_CMNINFO_LINK,
 	ODM_CMNINFO_RSSI_MIN,
@@ -472,9 +461,6 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm);
 void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm,
 		     enum odm_common_info_def CmnInfo, u32 Value);
 
-void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm,
-		     enum odm_common_info_def CmnInfo, void *pValue);
-
 void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value);
 
 #endif
-- 
2.35.1

