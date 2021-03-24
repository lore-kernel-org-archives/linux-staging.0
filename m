Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67526F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id o16so24327033wrn.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VCBfsvGHQgr9uRMXT8woUOh4p9ueQAQfWE9bBV1w8dc=;
        b=XYqXEvUkvKIaPmWGkPCJxj0quaWCwrquudbKja+H+nSr4QIQLjYVXKeV2hBOCeuJV4
         SWZy+ZERzK50HSJKhY8QIT+doVnV/SN+ddK21OY63h+pprdr2biR3K61tG8WACjkiW+O
         lTUP431uG73umX6tFunR6shmhY1zW7R1NZYUIlaF8nTmRILf5vn1vd3P08SaNNl241JY
         6I4PVlWAvSm265NCyQJYtHoNkj8RG0IQqzamW7yuCYsZkfG6x2J5hJ3x3D4QUvWkwIyP
         xN8GfOkLuqiSyvrnQWOlLi8LgSP8xJLoOeTeh1a7ey1zqN+eD9RgO57/kMvZouVfzeOr
         FBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VCBfsvGHQgr9uRMXT8woUOh4p9ueQAQfWE9bBV1w8dc=;
        b=X8Q7JtwaQLc5oVjwTOMlrcc0cNSzOKtn1cn+pxHjeYtsxqifsGLARkfpF41oVjEDFW
         n8WmZY6YncPtBPCI4rUasD9t5J8Kv8hLzeqf1HuehDlh2zcuu+Qqm6Ybo0rQ3kYA89tf
         wosW0hiPvenRZO3104XlfplfmUnoS3oZLH7j+4JWqQsPZdszTXhNBSWfXzZNMLX2w+eQ
         vMxO/cakpp3sV5NhH0usLycVtmmyx9PktvBENymvxlJFGQ/o2PhEVA0as6bWZk7DTLBH
         ZAbqpzR3VAfpTcxSJIAU822EapVa0XJJnDWkgLqbwLUcOPUtJ4zjEnMHJv5ttNKl//2q
         9blQ==
X-Gm-Message-State: AOAM531OlUfXfhGF66bNWQbRKwXEol8e5Dzr6lyWux3IpnI9UdtdLFg5
	KWLfwb9LaF3K3jxwKg5W5V8=
X-Google-Smtp-Source: ABdhPJzceX9H52zvWJWrr0yvwjsirEH+WVeNjFL+hbujHaZ36NdlkTv8zp8+KTyZ790PTs3o5sZQnw==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr3355359wrp.269.1616589916315;
        Wed, 24 Mar 2021 05:45:16 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:16 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 32/33] Staging: rtl8723bs: remove named enums in odm.h
Date: Wed, 24 Mar 2021 13:44:55 +0100
Message-Id: <20210324124456.25221-33-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
hal/odm.h:

	enum ODM_Ability_E		[definition]
	enum odm_ability_e		[name]
	enum odm_interface_e		[name]
	enum odm_ic_type_e		[name]
	enum odm_cut_version_e		[name]
	enum odm_fab_e			[name]
	enum odm_rf_path_e		[definition]
	enum odm_rf_type_e		[name]
	enum odm_mac_phy_mode_e		[definition]
	enum odm_bt_coexist_e		[definition]
	enum odm_operation_mode_e	[definition]
	enum odm_wireless_mode_e	[name]
	enum odm_band_type_e		[name]
	enum odm_sec_chnl_offset_e	[definition]
	enum odm_security_e		[definition]
	enum odm_bw_e			[name]
	enum odm_board_type_e		[definition]
	enum ODM_Package_TYPE_E		[definition]
	enum odm_cca_path_e		[definition]
	enum fat_state_e		[definition]
	enum ant_div_type_e		[name]
	enum rt_status			[definition]
	enum dm_1r_cca_e		[name]
	enum dm_rf_e			[name]
	enum dm_swas_e			[definition]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 150 +++-------------------------
 1 file changed, 12 insertions(+), 138 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 981de3710709..dd0c4616086d 100644
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
@@ -386,7 +370,7 @@ enum odm_cmninfo_e {
 };
 
 /*  2011/10/20 MH Define ODM support ability.  ODM_CMNINFO_ABILITY */
-enum odm_ability_e { /* _ODM_Support_Ability_Definition */
+enum { /* _ODM_Support_Ability_Definition */
 	/*  */
 	/*  BB ODM section BIT 0-15 */
 	/*  */
@@ -417,18 +401,18 @@ enum odm_ability_e { /* _ODM_Support_Ability_Definition */
 };
 
 /* 	ODM_CMNINFO_INTERFACE */
-enum odm_interface_e { /* tag_ODM_Support_Interface_Definition */
+enum { /* tag_ODM_Support_Interface_Definition */
 	ODM_ITRF_SDIO	=	0x4,
 	ODM_ITRF_ALL	=	0x7,
 };
 
 /*  ODM_CMNINFO_IC_TYPE */
-enum odm_ic_type_e { /* tag_ODM_Support_IC_Type_Definition */
+enum { /* tag_ODM_Support_IC_Type_Definition */
 	ODM_RTL8723B	=	BIT8,
 };
 
 /* ODM_CMNINFO_CUT_VER */
-enum odm_cut_version_e { /* tag_ODM_Cut_Version_Definition */
+enum { /* tag_ODM_Cut_Version_Definition */
 	ODM_CUT_A		=	0,
 	ODM_CUT_B		=	1,
 	ODM_CUT_C		=	2,
@@ -443,7 +427,7 @@ enum odm_cut_version_e { /* tag_ODM_Cut_Version_Definition */
 };
 
 /*  ODM_CMNINFO_FAB_VER */
-enum odm_fab_e { /* tag_ODM_Fab_Version_Definition */
+enum { /* tag_ODM_Fab_Version_Definition */
 	ODM_TSMC	=	0,
 	ODM_UMC		=	1,
 };
@@ -452,18 +436,7 @@ enum odm_fab_e { /* tag_ODM_Fab_Version_Definition */
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
-
-enum odm_rf_type_e { /* tag_ODM_RF_Type_Definition */
+enum { /* tag_ODM_RF_Type_Definition */
 	ODM_1T1R	=	0,
 	ODM_1T2R	=	1,
 	ODM_2T2R	=	2,
@@ -478,40 +451,8 @@ enum odm_rf_type_e { /* tag_ODM_RF_Type_Definition */
 /*  ODM Dynamic common info value definition */
 /*  */
 
-/* typedef enum _MACPHY_MODE_8192D{ */
-/* 	SINGLEMAC_SINGLEPHY, */
-/* 	DUALMAC_DUALPHY, */
-/* 	DUALMAC_SINGLEPHY, */
-/* MACPHY_MODE_8192D,*PMACPHY_MODE_8192D; */
-/*  Above is the original define in MP driver. Please use the same define. THX. */
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
-
 /*  ODM_CMNINFO_WM_MODE */
-enum odm_wireless_mode_e { /* tag_Wireless_Mode_Definition */
+enum { /* tag_Wireless_Mode_Definition */
 	ODM_WM_UNKNOWN    = 0x0,
 	ODM_WM_B          = BIT0,
 	ODM_WM_G          = BIT1,
@@ -523,34 +464,15 @@ enum odm_wireless_mode_e { /* tag_Wireless_Mode_Definition */
 };
 
 /*  ODM_CMNINFO_BAND */
-enum odm_band_type_e { /* tag_Band_Type_Definition */
+enum { /* tag_Band_Type_Definition */
 	ODM_BAND_2_4G = 0,
 	ODM_BAND_5G,
 	ODM_BAND_ON_BOTH,
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
-enum odm_bw_e { /* tag_Bandwidth_Definition */
+enum { /* tag_Bandwidth_Definition */
 	ODM_BW20M		= 0,
 	ODM_BW40M		= 1,
 	ODM_BW80M		= 2,
@@ -561,24 +483,6 @@ enum odm_bw_e { /* tag_Bandwidth_Definition */
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
@@ -604,13 +508,6 @@ enum odm_type_alna_e { /* tag_ODM_TYPE_ALNA_Definition */
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
@@ -764,12 +661,7 @@ struct fat_t { /* _FAST_ANTENNA_TRAINNING_ */
 
 };
 
-enum fat_state_e {
-	FAT_NORMAL_STATE			= 0,
-	FAT_TRAINING_STATE		= 1,
-};
-
-enum ant_div_type_e {
+enum {
 	NO_ANTDIV			= 0xFF,
 	CG_TRX_HW_ANTDIV		= 0x01,
 	CGCS_RX_HW_ANTDIV	= 0x02,
@@ -1197,18 +1089,6 @@ enum ODM_FW_Config_Type {
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
@@ -1255,13 +1135,13 @@ enum rt_status {
 /* 3 BB Power Save */
 /* 3 =========================================================== */
 
-enum dm_1r_cca_e { /* tag_1R_CCA_Type_Definition */
+enum { /* tag_1R_CCA_Type_Definition */
 	CCA_1R = 0,
 	CCA_2R = 1,
 	CCA_MAX = 2,
 };
 
-enum dm_rf_e { /* tag_RF_Type_Definition */
+enum { /* tag_RF_Type_Definition */
 	RF_Save = 0,
 	RF_Normal = 1,
 	RF_MAX = 2,
@@ -1270,12 +1150,6 @@ enum dm_rf_e { /* tag_RF_Type_Definition */
 /* 3 =========================================================== */
 /* 3 Antenna Diversity */
 /* 3 =========================================================== */
-enum dm_swas_e { /* tag_SW_Antenna_Switch_Definition */
-	Antenna_A = 1,
-	Antenna_B = 2,
-	Antenna_MAX = 3,
-};
-
 /*  Maximal number of antenna detection mechanism needs to perform, added by Roger, 2011.12.28. */
 #define	MAX_ANTENNA_DETECTION_CNT	10
 
-- 
2.30.2

