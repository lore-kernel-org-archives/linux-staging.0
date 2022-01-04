Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE9168
	for <linux-staging@lists.linux.dev>; Tue,  4 Jan 2022 09:07:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l4so22768710wmq.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Jan 2022 01:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1fAWmtIbHY+TLsrmfv7xwB1FP3iqDL3J1ctkHm7L3Y=;
        b=RnE9OQ9E9MYC9jgncyvWkoCCO79N/l8EerNDdIFnj59FyqEqk5JYYY6j/g4EDnVlTx
         852ZNK5roMDt6sljd0mAbneCTNyRgmpT/Kll8yJ9agPjb5P7wL2BPE4r9QcqB264+GBg
         Yenl45zSQFQjn23DhDixG5zN122S5xQWVqFgadLGAvtvYYtbnDUZv8KHdmz+d96sIExY
         tznEA7EZYybFd3q5M1aCU4s6q8qoKRgRCofavVCH3BveHw20auN/jsvu0s1P4gN4Y4JU
         STZZ7ANlgkYeUEFT6/bIO/eul4VwiUuurc0cnfKVO9J0hYS2WNiq59pzlu5W815zkWSP
         215w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1fAWmtIbHY+TLsrmfv7xwB1FP3iqDL3J1ctkHm7L3Y=;
        b=g9yqb3UEOEDW6880g/bFazzDAjqt5SXXm8kJhKBoiu75eUfmckgVfL9+67GoGI92ni
         LCwk8eMNWadEpJhNl6HZD8Dbs6IbHuSP3vmrYtYOXUjqXfWZoYdipxHy3ykAk56CmVyW
         Lz3l3DYb84A+llPHH4BtBZ3HtVQkiplm2YRC2Gt7CgM/piidnzVihQQf9K2g4oGw0wWZ
         VLNX2ZkF3Xv2sIa7RIQ5ElKwMjeKyNamjM94dW2Q3ipM01I3tpV8Ih7KImQ2a9SmAPO+
         GZv8B91pvL3dnWdBaJI+/mHQraEmjgvSQmvqvaSffPPSf6S5FaK4EAz4DlwScw1pfdXD
         I1MA==
X-Gm-Message-State: AOAM533/bBj0nsrJCHmwkrBzGNx3qsTVUOohZY8o2SvarySqM8qDy3G5
	MBP7UF4ujzetX8m0x9yb1FE=
X-Google-Smtp-Source: ABdhPJyc2jQXXlurVxi7/JWwcBjC1PoE5n3/pPMgh4YDqWQVHAmY8Hfh1/aQ2phVCaV1SyU4RNWYkg==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr41318220wme.132.1641287261082;
        Tue, 04 Jan 2022 01:07:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b8a2])
        by smtp.gmail.com with ESMTPSA id s207sm36253419wme.2.2022.01.04.01.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 01:07:40 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unneeded parameter from rtl8188e_SetHalODMVar
Date: Tue,  4 Jan 2022 10:07:32 +0100
Message-Id: <20220104090732.13994-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtl8188e_SetHalODMVar is always called with HAL_ODM_STA_INFO.
Remove the unneeded parameter eVariable from the function.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c         |  4 +--
 drivers/staging/r8188eu/core/rtw_mlme.c       |  4 +--
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  2 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 28 +++++++------------
 drivers/staging/r8188eu/include/hal_intf.h    |  7 +----
 5 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 47bd84b67a08..1675e2e8439c 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -447,7 +447,7 @@ void update_bmc_sta(struct adapter *padapter)
 		init_rate = get_highest_rate_idx(tx_ra_bitmap & 0x0fffffff) & 0x3f;
 
 		/* ap mode */
-		rtl8188e_SetHalODMVar(padapter, HAL_ODM_STA_INFO, psta, true);
+		rtl8188e_SetHalODMVar(padapter, psta, true);
 
 		{
 			u8 arg = 0;
@@ -499,7 +499,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	DBG_88E("%s\n", __func__);
 
 	/* ap mode */
-	rtl8188e_SetHalODMVar(padapter, HAL_ODM_STA_INFO, psta, true);
+	rtl8188e_SetHalODMVar(padapter, psta, true);
 
 	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
 		psta->ieee8021x_blocked = true;
diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index a3996a7ee814..394e8a5ce03c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -913,7 +913,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		psta->aid  = pnetwork->join_res;
 		psta->mac_id = 0;
 		/* sta mode */
-		rtl8188e_SetHalODMVar(padapter, HAL_ODM_STA_INFO, psta, true);
+		rtl8188e_SetHalODMVar(padapter, psta, true);
 		/* security related */
 		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
 			padapter->securitypriv.binstallGrpkey = false;
@@ -1198,7 +1198,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	psta->mac_id = (uint)pstassoc->cam_id;
 	DBG_88E("%s\n", __func__);
 	/* for ad-hoc mode */
-	rtl8188e_SetHalODMVar(adapter, HAL_ODM_STA_INFO, psta, true);
+	rtl8188e_SetHalODMVar(adapter, psta, true);
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
 		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index a3d4d5d8a785..54561ff239a0 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -310,7 +310,7 @@ u32	rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	}
 
 	if (!(psta->state & WIFI_AP_STATE))
-		rtl8188e_SetHalODMVar(padapter, HAL_ODM_STA_INFO, psta, false);
+		rtl8188e_SetHalODMVar(padapter, psta, false);
 
 	spin_lock_bh(&pstapriv->auth_list_lock);
 	if (!list_empty(&psta->auth_list)) {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index cce291ca44b1..33bad50ed3b8 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -845,27 +845,19 @@ void rtl8188e_read_chip_version(struct adapter *padapter)
 	pHalData->VersionID = ChipVersion;
 }
 
-void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
+void rtl8188e_SetHalODMVar(struct adapter *Adapter, void *pValue1, bool bSet)
 {
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
 	struct odm_dm_struct *podmpriv = &pHalData->odmpriv;
-	switch (eVariable) {
-	case HAL_ODM_STA_INFO:
-		{
-			struct sta_info *psta = (struct sta_info *)pValue1;
-
-			if (bSet) {
-				DBG_88E("### Set STA_(%d) info\n", psta->mac_id);
-				podmpriv->pODM_StaInfo[psta->mac_id] = psta;
-				ODM_RAInfo_Init(podmpriv, psta->mac_id);
-			} else {
-				DBG_88E("### Clean STA_(%d) info\n", psta->mac_id);
-				podmpriv->pODM_StaInfo[psta->mac_id] = NULL;
-		       }
-		}
-		break;
-	default:
-		break;
+	struct sta_info *psta = (struct sta_info *)pValue1;
+
+	if (bSet) {
+		DBG_88E("### Set STA_(%d) info\n", psta->mac_id);
+		podmpriv->pODM_StaInfo[psta->mac_id] = psta;
+		ODM_RAInfo_Init(podmpriv, psta->mac_id);
+	} else {
+		DBG_88E("### Clean STA_(%d) info\n", psta->mac_id);
+		podmpriv->pODM_StaInfo[psta->mac_id] = NULL;
 	}
 }
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index b5474d199c10..b4a7e0ce3116 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -94,10 +94,6 @@ enum hal_def_variable {
 	HAL_DEF_DBG_DUMP_TXPKT,
 };
 
-enum hal_odm_variable {
-	HAL_ODM_STA_INFO,
-};
-
 typedef s32 (*c2h_id_filter)(u8 id);
 
 #define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
@@ -105,8 +101,7 @@ typedef s32 (*c2h_id_filter)(u8 id);
 void rtl8188eu_interface_configure(struct adapter *adapt);
 void ReadAdapterInfo8188EU(struct adapter *Adapter);
 void rtl8188eu_init_default_value(struct adapter *adapt);
-void rtl8188e_SetHalODMVar(struct adapter *Adapter,
-			   enum hal_odm_variable eVariable, void *pValue1, bool bSet);
+void rtl8188e_SetHalODMVar(struct adapter *Adapter, void *pValue1, bool bSet);
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
 void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 PwrState);
 void rtl8188e_ReadEFuse(struct adapter *Adapter, u16 _offset, u16 _size_byte, u8 *pbuf);
-- 
2.34.1

