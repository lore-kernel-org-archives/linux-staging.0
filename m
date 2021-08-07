Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4412FB3
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h14so14290259wrx.10
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sisHZ1HhRCasFIE/noc0qjfPi9WbEki57MFY3ucpKDM=;
        b=UIFxBgN75Mtqw4f/Uo83Ee658k58wj0efRZRHLck0eU12wHHjLc/2BTxljrVCLZaIH
         +ueIPSaEZRouXsbaClYp8Ewhw++fMphTcZCh918DK9UH2B2tYW5Ss98ZycxozlBQQlUa
         NSaz9dBCifyfW8YHsifbglt1eEpQwr+NoVa2KlKaO64KeuVx+eqD0L+bf9dL1ZO9hbT8
         5SwBnbWLL6TMwupIf9mG6mPNmb7mqtn0xqieQCX3/VRzGCVWEvDEclLAuEv4Gn+uIL4T
         KxUQKpBxOBdORZmgIo++efFE8gL9Dql3xZ4AMx98PTO83zySPm4/sznlRFllvRDOQ2A5
         7eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sisHZ1HhRCasFIE/noc0qjfPi9WbEki57MFY3ucpKDM=;
        b=X3L38YAgc8o5F71764byuq92/jEPOhZB+Fri7/Fe+9Js14blSclVLP68raKHkpG8Qs
         0NB7oGZkHh44p9cMzdK+TdkYoQuEy7yHwQaRLG3/5khzMWTi9x1EQygCTsJmPtFqfnKB
         fGe3/VOk+jMJNFtoxkPsG2RTMnHBE85Td9lWwwiPXPhkuZ3cMg//Dw+dJmcUYToD12My
         6G8mWAXsqp08VVtO0aT+I5lZQTHGFEcOV8fqfSei6vp+KcN9Hw3icy8GEkmEI9gxN4DV
         Ouj1p7iAQPHK+cMabbvvDRn7X2mqAQtDfbzV51a7kjtq4ExcC1JVIq+yFVx9aghT1gyW
         I4AQ==
X-Gm-Message-State: AOAM532OFjpa9wVstCJc+HpKkJGY69akox8P4W28Rgk08ktCNFjVlgnr
	7HmNffvfHOz8yk3uVNTwUmL69aFp22U=
X-Google-Smtp-Source: ABdhPJzxSOU0NhRqIO+qCfgQyhQrJ005nuQqrX62ffMu6UxXsOXmgHXcZzZYgE6D6PONGe93xt/DxQ==
X-Received: by 2002:a5d:5751:: with SMTP id q17mr14890162wrw.48.1628329711310;
        Sat, 07 Aug 2021 02:48:31 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id b14sm12964427wrm.43.2021.08.07.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:31 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/21] staging: rtl8723bs: remove rf type branching (first patch)
Date: Sat,  7 Aug 2021 11:48:04 +0200
Message-Id: <72ce98106bb172fce0f43315bc4dbbb7065afef5.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove rf type branching, for the baseband works only on
1T1R rf type, so just keep code branches related to 1T1R.
Remove RFType from hal_version struct, and all
related code.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c        | 10 +---------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  8 +-------
 drivers/staging/rtl8723bs/include/HalVerDef.h  | 18 ------------------
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 7dd49c8538e4..65987e3076a3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -70,15 +70,7 @@ void dump_chip_info(struct hal_version	ChipVersion)
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt,
 				"UNKNOWN_CUT(%d)_", ChipVersion.CUTVersion);
 
-	if (IS_1T1R(ChipVersion))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "1T1R_");
-	else if (IS_1T2R(ChipVersion))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "1T2R_");
-	else if (IS_2T2R(ChipVersion))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "2T2R_");
-	else
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt,
-				"UNKNOWN_RFTYPE(%d)_", ChipVersion.RFType);
+	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "1T1R_");
 
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", ChipVersion.ROMVer);
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ce4f81828a65..5da8e21bb02f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1640,7 +1640,6 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	ChipVersion.ICType = CHIP_8723B;
 	ChipVersion.ChipType = ((value32 & RTL_ID) ? TEST_CHIP : NORMAL_CHIP);
-	ChipVersion.RFType = RF_TYPE_1T1R;
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK)>>CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
 
@@ -1661,12 +1660,7 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	dump_chip_info(ChipVersion);
 #endif
 	pHalData->VersionID = ChipVersion;
-	if (IS_1T2R(ChipVersion))
-		pHalData->rf_type = RF_1T2R;
-	else if (IS_2T2R(ChipVersion))
-		pHalData->rf_type = RF_2T2R;
-	else
-		pHalData->rf_type = RF_1T1R;
+	pHalData->rf_type = RF_1T1R;
 
 	return ChipVersion;
 }
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index bab226f77b24..8f654a49fb9d 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -50,23 +50,11 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 	CHIP_VENDOR_SMIC	=	2,
 };
 
-enum hal_rf_type_e { /* tag_HAL_RF_Type_Definition */
-	RF_TYPE_1T1R	=	0,
-	RF_TYPE_1T2R	=	1,
-	RF_TYPE_2T2R	=	2,
-	RF_TYPE_2T3R	=	3,
-	RF_TYPE_2T4R	=	4,
-	RF_TYPE_3T3R	=	5,
-	RF_TYPE_3T4R	=	6,
-	RF_TYPE_4T4R	=	7,
-};
-
 struct hal_version { /* tag_HAL_VERSION */
 	enum hal_ic_type_e		ICType;
 	enum hal_chip_type_e		ChipType;
 	enum hal_cut_version_e	CUTVersion;
 	enum hal_vendor_e		VendorType;
-	enum hal_rf_type_e		RFType;
 	u8 			ROMVer;
 };
 
@@ -76,7 +64,6 @@ struct hal_version { /* tag_HAL_VERSION */
 /*  Get element */
 #define GET_CVID_IC_TYPE(version)			((enum hal_ic_type_e)((version).ICType))
 #define GET_CVID_CHIP_TYPE(version)			((enum hal_chip_type_e)((version).ChipType))
-#define GET_CVID_RF_TYPE(version)			((enum hal_rf_type_e)((version).RFType))
 #define GET_CVID_MANUFACTUER(version)		((enum hal_vendor_e)((version).VendorType))
 #define GET_CVID_CUT_VERSION(version)		((enum hal_cut_version_e)((version).CUTVersion))
 #define GET_CVID_ROM_VERSION(version)		(((version).ROMVer) & ROM_VERSION_MASK)
@@ -105,9 +92,4 @@ struct hal_version { /* tag_HAL_VERSION */
 #define IS_CHIP_VENDOR_UMC(version)	((GET_CVID_MANUFACTUER(version) == CHIP_VENDOR_UMC) ? true : false)
 #define IS_CHIP_VENDOR_SMIC(version)	((GET_CVID_MANUFACTUER(version) == CHIP_VENDOR_SMIC) ? true : false)
 
-/* hal_rf_type_e */
-#define IS_1T1R(version)					((GET_CVID_RF_TYPE(version) == RF_TYPE_1T1R) ? true : false)
-#define IS_1T2R(version)					((GET_CVID_RF_TYPE(version) == RF_TYPE_1T2R) ? true : false)
-#define IS_2T2R(version)					((GET_CVID_RF_TYPE(version) == RF_TYPE_2T2R) ? true : false)
-
 #endif
-- 
2.20.1

