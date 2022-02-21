Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC34211D
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 07:33:17 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id q17so27519117edd.4
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 23:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GygaqrnptWbGRKfUQnwAPPKWiQdpM61jTZJHob6nbtc=;
        b=a4vK4Slurn80v0GcEbZhj3E5dz1U+rEx6E9kOq1YgwC2RFddMjCemcnRU+xDhb68Z9
         2z1ryStDhoth611iAu2B39GjnRTdXwae2s/AXvy6aWgvUvHSOaHpKxSYimMroktBwQ7T
         BvJxv3acdVLg1R0ZkYyF8VEJX/wb8A/ToVef9m6dy3LYCr8/yeYljF4m7MdzRVYMJ2lK
         Vx6FcvL2t+LFMTaAWk2CznV4A5VbjxesXt7DH17snKETnmq0/Mcbwecm5tBhyHTeZx/m
         GneFqOkYDZ8/MNNVD1E6Fi1V8C6huExLTnymM+baErXjrPcbkSPnDW7EZ1vFZtLhOV06
         Zl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GygaqrnptWbGRKfUQnwAPPKWiQdpM61jTZJHob6nbtc=;
        b=RqLZm6Nb3zdaEKd/4Xf3gT7KpWj5DiIM4DZ1PcYeXm7fwsVVNiktQK8EVeYvg81+TG
         xtLLWXBLFkxndPkG39eQLZm64aB6xD6RC6vHuj9m8p9JfAykmm0Cc/8/kZe+6zMw08tL
         VG0TFki9B8SStuQCDyTXBQ/wLfVcklRVB7YWeIQQL0JjutuWX9Rnt4kYd7kZCjYQloVG
         8xt2LGbNWVq/XObJGhCiLDQWWHMvBZeHnIEyy9K9BPnvpe1gm4rUly7/lSg+464xmtq0
         r9lEazyegjZ/T7pVFjXN8HhyNtfOv2IREIh2XiTMG1HCRmW3Zpi1hFRYMkPFCDvGLJIC
         L/uw==
X-Gm-Message-State: AOAM532MAnvhsYfR9S8oL2jsIG3JdZ3k1SCRvy7p7cZi67OIdg7sjZfL
	RgvQt4Vk7fr62frp38oAEPY=
X-Google-Smtp-Source: ABdhPJxjql3GmCyCpnZqwfYhPqgIJzQIhr6UBSwPupEjDAJc8LihhbWXT8uxgjsQbfeVRmKd2vkDYA==
X-Received: by 2002:a05:6402:168e:b0:410:d2a4:b0dd with SMTP id a14-20020a056402168e00b00410d2a4b0ddmr19744492edv.403.1645428796050;
        Sun, 20 Feb 2022 23:33:16 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id c11sm8673128edx.42.2022.02.20.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 23:33:15 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/5] staging: r8188eu: remove ODM_CmnInfoHook()
Date: Mon, 21 Feb 2022 08:33:02 +0100
Message-Id: <20220221073306.16636-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221073306.16636-1-straube.linux@gmail.com>
References: <20220221073306.16636-1-straube.linux@gmail.com>
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
v2:
no changes

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

