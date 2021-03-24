Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002CA72
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so1777656wml.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h19HygU54SozugqqSjgZUpwGXkZFxEhOXbYY1giLlqI=;
        b=lRRF5qoEJ0OdUO9DI6O87JA/7ENayIs12GcXapNLX5F4xeV1BEpdNCgrQbSIk2oNBP
         Qg7u/ujiLAYVK9bZq0uyD6G29EyD/hF9R5IbIYl1FjhVY8X7r6v+5B06hqPDc42wWoVH
         uW78CI89dEqTs0GGIAXPkWtUc5JRONcA4I/KrS5J4eBk6tBy17Tb99avhrou+ecVw2EI
         XTF1EsGI9UcOwagNyr1eA1LGYz30rLAwZ1Cm5Qg1Y6lAnADjGphQXZIk3UDpXSz+9AHy
         gURtvwC0t5r11ghJIXbVsk/9MSY7rKIf2fTPwtgX9GaHZHRCWEneH6rNR9CNgBm9bnMu
         be0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h19HygU54SozugqqSjgZUpwGXkZFxEhOXbYY1giLlqI=;
        b=tpOns+fZfUwqU1vT+CDqg3RAdnpY093FTbRZlkVFednUd6eQAaVTlO3o84qH0H3IhK
         aCne3gmND9P6Gh4FVseYbgwGxolhL5uycluyyudIlrsFq1qgiBpAkb6yPO4ABZMPYLeo
         SbsyvU8QTwLH4SoPjcuhn4appGE7dgxiY/Gg1h4CmJn0bjAdcwKWTnv+bZfOSNuZxfOp
         OlHPH2sN1nirTuyB61UUHnbDglJX3ZxiZVLYgvC12BE06R3XL+SrHtdM93rdWmoPqyFo
         3WNkX+dHFuwwC62oZFcW3OdHlyQxMpBMay0ySJyPhSEqyVFmD4zc1oDCyIArNUI5BnQ2
         DNTA==
X-Gm-Message-State: AOAM532FzYgkolc1zh4muUgnmPXbGkh4VW15+j0wJ2qyjX91gVN0Xqsr
	CVFnumdGzp6JdKUumRCfZYk=
X-Google-Smtp-Source: ABdhPJygHWBFwGMcwEP1iQ2QVtkQkDxjMFxOKq4X6a+E3tD3FYG9jjgbBNOsKe1GjfzAZ5cAmFyeOA==
X-Received: by 2002:a05:600c:4a18:: with SMTP id c24mr4081140wmp.173.1616611136517;
        Wed, 24 Mar 2021 11:38:56 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:56 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 21/21] Staging: rtl8723bs: remove enums in odm.h
Date: Wed, 24 Mar 2021 19:38:47 +0100
Message-Id: <20210324183847.5595-22-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
hal/odm.h:

	enum ODM_Ability_E
	enum odm_rf_path_e
	enum odm_mac_phy_mode_e
	enum odm_bt_coexist_e
	enum odm_operation_mode_e
	enum odm_sec_chnl_offset_e
	enum odm_security_e
	enum odm_board_type_e
	enum ODM_Package_TYPE_E
	enum odm_cca_path_e
	enum fat_state_e
	enum rt_status
	enum dm_swas_e

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 117 ----------------------------
 1 file changed, 117 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 981de3710709..956357abfcaf 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -277,22 +277,6 @@ struct odm_mac_status_info {
 	u8 test;
 };
 
-enum ODM_Ability_E { /* tag_Dynamic_ODM_Support_Ability_Type */
-	/*  BB Team */
-	ODM_DIG				= 0x00000001,
-	ODM_HIGH_POWER		= 0x00000002,
-	ODM_CCK_CCA_TH		= 0x00000004,
-	ODM_FA_STATISTICS	= 0x00000008,
-	ODM_RAMASK			= 0x00000010,
-	ODM_RSSI_MONITOR	= 0x00000020,
-	ODM_SW_ANTDIV		= 0x00000040,
-	ODM_HW_ANTDIV		= 0x00000080,
-	ODM_BB_PWRSV		= 0x00000100,
-	ODM_2TPATHDIV		= 0x00000200,
-	ODM_1TPATHDIV		= 0x00000400,
-	ODM_PSD2AFH			= 0x00000800
-};
-
 /*  */
 /*  2011/10/20 MH Define Common info enum for all team. */
 /*  */
@@ -452,16 +436,6 @@ enum odm_fab_e { /* tag_ODM_Fab_Version_Definition */
 /*  */
 /*  For example 1T2R (A+AB = BIT0|BIT4|BIT5) */
 /*  */
-enum odm_rf_path_e { /* tag_ODM_RF_Path_Bit_Definition */
-	ODM_RF_TX_A	=	BIT0,
-	ODM_RF_TX_B	=	BIT1,
-	ODM_RF_TX_C	=	BIT2,
-	ODM_RF_TX_D	=	BIT3,
-	ODM_RF_RX_A	=	BIT4,
-	ODM_RF_RX_B	=	BIT5,
-	ODM_RF_RX_C	=	BIT6,
-	ODM_RF_RX_D	=	BIT7,
-};
 
 enum odm_rf_type_e { /* tag_ODM_RF_Type_Definition */
 	ODM_1T1R	=	0,
@@ -484,31 +458,6 @@ enum odm_rf_type_e { /* tag_ODM_RF_Type_Definition */
 /* 	DUALMAC_SINGLEPHY, */
 /* MACPHY_MODE_8192D,*PMACPHY_MODE_8192D; */
 /*  Above is the original define in MP driver. Please use the same define. THX. */
-enum odm_mac_phy_mode_e { /* tag_ODM_MAC_PHY_Mode_Definition */
-	ODM_SMSP	= 0,
-	ODM_DMSP	= 1,
-	ODM_DMDP	= 2,
-};
-
-enum odm_bt_coexist_e { /* tag_BT_Coexist_Definition */
-	ODM_BT_BUSY		= 1,
-	ODM_BT_ON		= 2,
-	ODM_BT_OFF		= 3,
-	ODM_BT_NONE		= 4,
-};
-
-/*  ODM_CMNINFO_OP_MODE */
-enum odm_operation_mode_e { /* tag_Operation_Mode_Definition */
-	ODM_NO_LINK      = BIT0,
-	ODM_LINK         = BIT1,
-	ODM_SCAN         = BIT2,
-	ODM_POWERSAVE    = BIT3,
-	ODM_AP_MODE      = BIT4,
-	ODM_CLIENT_MODE  = BIT5,
-	ODM_AD_HOC       = BIT6,
-	ODM_WIFI_DIRECT  = BIT7,
-	ODM_WIFI_DISPLAY = BIT8,
-};
 
 /*  ODM_CMNINFO_WM_MODE */
 enum odm_wireless_mode_e { /* tag_Wireless_Mode_Definition */
@@ -530,25 +479,6 @@ enum odm_band_type_e { /* tag_Band_Type_Definition */
 	ODM_BANDMAX
 };
 
-/*  ODM_CMNINFO_SEC_CHNL_OFFSET */
-enum odm_sec_chnl_offset_e { /* tag_Secondary_Channel_Offset_Definition */
-	ODM_DONT_CARE	= 0,
-	ODM_BELOW		= 1,
-	ODM_ABOVE		= 2
-};
-
-/*  ODM_CMNINFO_SEC_MODE */
-enum odm_security_e { /* tag_Security_Definition */
-	ODM_SEC_OPEN		= 0,
-	ODM_SEC_WEP40		= 1,
-	ODM_SEC_TKIP		= 2,
-	ODM_SEC_RESERVE		= 3,
-	ODM_SEC_AESCCMP		= 4,
-	ODM_SEC_WEP104		= 5,
-	ODM_WEP_WPA_MIXED	= 6, /*  WEP + WPA */
-	ODM_SEC_SMS4		= 7,
-};
-
 /*  ODM_CMNINFO_BW */
 enum odm_bw_e { /* tag_Bandwidth_Definition */
 	ODM_BW20M		= 0,
@@ -561,24 +491,6 @@ enum odm_bw_e { /* tag_Bandwidth_Definition */
 /*  ODM_CMNINFO_BOARD_TYPE */
 /*  For non-AC-series IC , ODM_BOARD_5G_EXT_PA and ODM_BOARD_5G_EXT_LNA are ignored */
 /*  For AC-series IC, external PA & LNA can be indivisuallly added on 2.4G and/or 5G */
-enum odm_board_type_e { /* tag_Board_Definition */
-	ODM_BOARD_DEFAULT    = 0,      /*  The DEFAULT case. */
-	ODM_BOARD_MINICARD   = BIT(0), /*  0 = non-mini card, 1 = mini card. */
-	ODM_BOARD_SLIM       = BIT(1), /*  0 = non-slim card, 1 = slim card */
-	ODM_BOARD_BT         = BIT(2), /*  0 = without BT card, 1 = with BT */
-	ODM_BOARD_EXT_PA     = BIT(3), /*  0 = no 2G ext-PA, 1 = existing 2G ext-PA */
-	ODM_BOARD_EXT_LNA    = BIT(4), /*  0 = no 2G ext-LNA, 1 = existing 2G ext-LNA */
-	ODM_BOARD_EXT_TRSW   = BIT(5), /*  0 = no ext-TRSW, 1 = existing ext-TRSW */
-	ODM_BOARD_EXT_PA_5G  = BIT(6), /*  0 = no 5G ext-PA, 1 = existing 5G ext-PA */
-	ODM_BOARD_EXT_LNA_5G = BIT(7), /*  0 = no 5G ext-LNA, 1 = existing 5G ext-LNA */
-};
-
-enum ODM_Package_TYPE_E { /* tag_ODM_Package_Definition */
-	ODM_PACKAGE_DEFAULT      = 0,
-	ODM_PACKAGE_QFN68        = BIT(0),
-	ODM_PACKAGE_TFBGA90      = BIT(1),
-	ODM_PACKAGE_TFBGA79      = BIT(2),
-};
 
 enum odm_type_gpa_e { /* tag_ODM_TYPE_GPA_Definition */
 	TYPE_GPA0 = 0,
@@ -604,13 +516,6 @@ enum odm_type_alna_e { /* tag_ODM_TYPE_ALNA_Definition */
 	TYPE_ALNA3 = BIT(3)|BIT(2)|BIT(1)|BIT(0)
 };
 
-/*  ODM_CMNINFO_ONE_PATH_CCA */
-enum odm_cca_path_e { /* tag_CCA_Path */
-	ODM_CCA_2R			= 0,
-	ODM_CCA_1R_A		= 1,
-	ODM_CCA_1R_B		= 2,
-};
-
 struct iqk_matrix_regs_setting { /* _IQK_MATRIX_REGS_SETTING */
 	bool bIQKDone;
 	s32 Value[3][IQK_Matrix_REG_NUM];
@@ -764,11 +669,6 @@ struct fat_t { /* _FAST_ANTENNA_TRAINNING_ */
 
 };
 
-enum fat_state_e {
-	FAT_NORMAL_STATE			= 0,
-	FAT_TRAINING_STATE		= 1,
-};
-
 enum ant_div_type_e {
 	NO_ANTDIV			= 0xFF,
 	CG_TRX_HW_ANTDIV		= 0x01,
@@ -1197,18 +1097,6 @@ enum ODM_FW_Config_Type {
 	CONFIG_FW_BT,
 };
 
-/*  Status code */
-enum rt_status {
-	RT_STATUS_SUCCESS,
-	RT_STATUS_FAILURE,
-	RT_STATUS_PENDING,
-	RT_STATUS_RESOURCE,
-	RT_STATUS_INVALID_CONTEXT,
-	RT_STATUS_INVALID_PARAMETER,
-	RT_STATUS_NOT_SUPPORT,
-	RT_STATUS_OS_API_FAILED,
-};
-
 #ifdef REMOVE_PACK
 #pragma pack()
 #endif
@@ -1270,11 +1158,6 @@ enum dm_rf_e { /* tag_RF_Type_Definition */
 /* 3 =========================================================== */
 /* 3 Antenna Diversity */
 /* 3 =========================================================== */
-enum dm_swas_e { /* tag_SW_Antenna_Switch_Definition */
-	Antenna_A = 1,
-	Antenna_B = 2,
-	Antenna_MAX = 3,
-};
 
 /*  Maximal number of antenna detection mechanism needs to perform, added by Roger, 2011.12.28. */
 #define	MAX_ANTENNA_DETECTION_CNT	10
-- 
2.30.2

