Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202742C85
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 12:32:40 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id h7so48464774ede.8
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aiYCoD8qvxf9gzy6j6frpewzfpqYT6XMr/kJQ5IHEZI=;
        b=ZKMVPC48gMKkWxV+tG8Wuv05+0OhsZF5pJd6c7tOMzdQASMWoAh6h55XRmlvugPKYx
         8zCLC2aP4U06+q1fwQMXf6oupMZWOZNuEFC1SjZEnzqHfOhAt8Ol/9Gqy3NpLdYubJkO
         TPvkJ5vukOdcOY1LoRims7KYLq3uqlePO91zBirhustHsiYt+eIcrTRzjpp3UuWiyYYB
         FhwHHnm9piE7RqNYOcA2R9BsnzjCAoxRjwn08lj+i0ns5r7y0mV0DzHxrtGUzWPNU1bD
         jpFuhiNh/EopZxrYu7FEnqtAPLSKqe8D/GDGy5+spycexRxiYV/agN+CVl2htVfzRezi
         GfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aiYCoD8qvxf9gzy6j6frpewzfpqYT6XMr/kJQ5IHEZI=;
        b=rzTsJy0sEN8bwnx7F/KiAUITkuirAVlXdeczly3pduFN61Wim6hMIRwWnKWgKXrqEu
         o1QD70wUFhwIpgO6G4jJuamPTjT0kYYARB3M7SeKD8J2H6z9pV8lgZXlo7/1o1ef58gs
         9VuPPPSCgoBQ7iGa2cjZ9f2PJN7iYauuwj0PYNiPxJE6InReBmB037S2pJ41BuJXyky5
         YyNKZl/C6znQz6Aqno7101zmNXJN6zL23gN47Bn+IAwN2nwfxGdQMlKQlmuEJCqvW4N5
         WAeHmbtqotGAJmPm9wszC8YMWsRKiuqTNOd3OSJ73B1cKpY0epgAjL+hzSj7FiX4nRt3
         gr7w==
X-Gm-Message-State: AOAM531AVBO15n2JX382+B8oBvqLUwrFxpEDtVO6w0FiZWU1kFF4aQen
	DMhobvxDddvYAs3HH+dzpEU=
X-Google-Smtp-Source: ABdhPJyWF1VGHaeeymtl4JgPXWJeeIFbhcXI7EnhUoVhmki4st6WHFfls1xtRy1InYJfWib3ZqTYRg==
X-Received: by 2002:a50:d4d1:: with SMTP id e17mr23615038edj.348.1635597158507;
        Sat, 30 Oct 2021 05:32:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::9d40])
        by smtp.gmail.com with ESMTPSA id z4sm6056458edd.46.2021.10.30.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 05:32:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove some set but never used variables
Date: Sat, 30 Oct 2021 14:32:28 +0200
Message-Id: <20211030123228.20500-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fields

pNumTxBytesUnicast
pNumRxBytesUnicast
pSecurity
pbNet_closed

of odm_dm_struct are set but never used, remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c         | 12 ------------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c |  4 ----
 drivers/staging/r8188eu/include/odm.h     | 11 -----------
 3 files changed, 27 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 21f115194df8..1e1db5d8d0b3 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -225,21 +225,12 @@ void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	/*  */
 	switch	(CmnInfo) {
 	/*  Dynamic call by reference pointer. */
-	case	ODM_CMNINFO_TX_UNI:
-		pDM_Odm->pNumTxBytesUnicast = (u64 *)pValue;
-		break;
-	case	ODM_CMNINFO_RX_UNI:
-		pDM_Odm->pNumRxBytesUnicast = (u64 *)pValue;
-		break;
 	case	ODM_CMNINFO_WM_MODE:
 		pDM_Odm->pWirelessMode = (u8 *)pValue;
 		break;
 	case	ODM_CMNINFO_SEC_CHNL_OFFSET:
 		pDM_Odm->pSecChOffset = (u8 *)pValue;
 		break;
-	case	ODM_CMNINFO_SEC_MODE:
-		pDM_Odm->pSecurity = (u8 *)pValue;
-		break;
 	case	ODM_CMNINFO_BW:
 		pDM_Odm->pBandWidth = (u8 *)pValue;
 		break;
@@ -252,9 +243,6 @@ void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	case	ODM_CMNINFO_POWER_SAVING:
 		pDM_Odm->pbPowerSaving = (bool *)pValue;
 		break;
-	case	ODM_CMNINFO_NET_CLOSED:
-		pDM_Odm->pbNet_closed = (bool *)pValue;
-		break;
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
 	default:
 		/* do nothing */
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 5d76f6ea91c4..75b438e1ce78 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -68,14 +68,10 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 
 	ODM_CmnInfoUpdate(dm_odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_TX_UNI, &Adapter->xmitpriv.tx_bytes);
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_RX_UNI, &Adapter->recvpriv.rx_bytes);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_WM_MODE, &pmlmeext->cur_wireless_mode);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_SEC_CHNL_OFFSET, &hal_data->nCur40MhzPrimeSC);
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_SEC_MODE, &Adapter->securitypriv.dot11PrivacyAlgrthm);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_BW, &hal_data->CurrentChannelBW);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_CHNL, &hal_data->CurrentChannel);
-	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_NET_CLOSED, &Adapter->net_closed);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_SCAN, &pmlmepriv->bScanInProcess);
 	ODM_CmnInfoHook(dm_odm, ODM_CMNINFO_POWER_SAVING, &pwrctrlpriv->bpower_saving);
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_RF_ANTENNA_TYPE, hal_data->TRxAntDivType);
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index f08655208b32..7b644d41ce34 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -230,17 +230,13 @@ enum odm_common_info_def {
 
 	/*  Dynamic value: */
 /*  POINTER REFERENCE-----------  */
-	ODM_CMNINFO_TX_UNI,
-	ODM_CMNINFO_RX_UNI,
 	ODM_CMNINFO_WM_MODE,		/*  ODM_WIRELESS_MODE_E */
 	ODM_CMNINFO_SEC_CHNL_OFFSET,	/*  ODM_SEC_CHNL_OFFSET_E */
-	ODM_CMNINFO_SEC_MODE,		/*  ODM_SECURITY_E */
 	ODM_CMNINFO_BW,			/*  ODM_BW_E */
 	ODM_CMNINFO_CHNL,
 
 	ODM_CMNINFO_SCAN,
 	ODM_CMNINFO_POWER_SAVING,
-	ODM_CMNINFO_NET_CLOSED,
 /*  POINTER REFERENCE----------- */
 
 /* CALL BY VALUE------------- */
@@ -490,16 +486,10 @@ struct odm_dm_struct {
 	bool	bool_temp;
 	struct adapter *adapter_temp;
 
-	/* TX Unicast byte count */
-	u64	*pNumTxBytesUnicast;
-	/* RX Unicast byte count */
-	u64	*pNumRxBytesUnicast;
 	/*  Wireless mode B/G/A/N = BIT(0)/BIT(1)/BIT(2)/BIT(3) */
 	u8	*pWirelessMode; /* ODM_WIRELESS_MODE_E */
 	/*  Secondary channel offset don't_care/below/above = 0/1/2 */
 	u8	*pSecChOffset;
-	/*  Security mode Open/WEP/AES/TKIP = 0/1/2/3 */
-	u8	*pSecurity;
 	/*  BW info 20M/40M/80M = 0/1/2 */
 	u8	*pBandWidth;
 	/*  Central channel location Ch1/Ch2/.... */
@@ -516,7 +506,6 @@ struct odm_dm_struct {
 	u8	*pOnePathCCA;
 	/* pMgntInfo->AntennaTest */
 	u8	*pAntennaTest;
-	bool	*pbNet_closed;
 /*  POINTER REFERENCE----------- */
 	/*  */
 /* CALL BY VALUE------------- */
-- 
2.33.1

