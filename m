Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F6168
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 15:56:00 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqGSb-0005zf-Fc; Thu, 25 Nov 2021 16:14:53 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/6] staging: r8188eu: do not extract eeprom version from the fuses
Date: Thu, 25 Nov 2021 16:14:34 +0100
Message-Id: <20211125151436.5895-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211125151436.5895-1-martin@kaiser.cx>
References: <20211125151436.5895-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EEPROMVersion in struct hal_data_8188e is not used. There's no need to
parse the fuses and extract the version.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 13 -------------
 drivers/staging/r8188eu/hal/usb_halinit.c       |  1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  3 ---
 drivers/staging/r8188eu/include/rtl8188e_spec.h |  1 -
 4 files changed, 18 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index b7d5b5775ff5..d5aee084def9 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1218,19 +1218,6 @@ void Hal_EfuseParseBoardType88E(struct adapter *pAdapter, u8 *hwinfo, bool AutoL
 	DBG_88E("Board Type: 0x%2x\n", pHalData->BoardType);
 }
 
-void Hal_EfuseParseEEPROMVer88E(struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail)
-{
-	struct hal_data_8188e *pHalData = GET_HAL_DATA(padapter);
-
-	if (!AutoLoadFail) {
-		pHalData->EEPROMVersion = hwinfo[EEPROM_VERSION_88E];
-		if (pHalData->EEPROMVersion == 0xFF)
-			pHalData->EEPROMVersion = EEPROM_Default_Version;
-	} else {
-		pHalData->EEPROMVersion = 1;
-	}
-}
-
 void rtl8188e_EfuseParseChnlPlan(struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail)
 {
 	padapter->mlmepriv.ChannelPlan =
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 902afbb4aeb8..fdaaf6e5bdda 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1020,7 +1020,6 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 
 	Hal_ReadPowerSavingMode88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_ReadTxPowerInfo88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
-	Hal_EfuseParseEEPROMVer88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	rtl8188e_EfuseParseChnlPlan(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_EfuseParseXtal_8188E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_ReadAntennaDiversity88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 31a46f204954..e4d6922bc703 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -176,7 +176,6 @@ struct hal_data_8188e {
 	/*  EEPROM setting. */
 	u16	EEPROMSVID;
 	u16	EEPROMSDID;
-	u8	EEPROMVersion;
 	u8	EEPROMRegulatory;
 
 	u8	bTXPowerDataReadFromEEPORM;
@@ -319,8 +318,6 @@ void Hal_EfuseParseIDCode88E(struct adapter *padapter, u8 *hwinfo);
 void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *hwinfo,
 			    bool AutoLoadFail);
 
-void Hal_EfuseParseEEPROMVer88E(struct adapter *padapter, u8 *hwinfo,
-				bool AutoLoadFail);
 void rtl8188e_EfuseParseChnlPlan(struct adapter *padapter, u8 *hwinfo,
 				 bool AutoLoadFail);
 void Hal_ReadAntennaDiversity88E(struct adapter *pAdapter,u8 *PROMContent,
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index 7dd55212e1be..d56e1c052b84 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -1284,7 +1284,6 @@ Current IOREG MAP
 #define	EEPROM_RF_BOARD_OPTION_88E		0xC1
 #define	EEPROM_RF_FEATURE_OPTION_88E		0xC2
 #define	EEPROM_RF_BT_SETTING_88E		0xC3
-#define	EEPROM_VERSION_88E			0xC4
 #define	EEPROM_CUSTOMERID_88E			0xC5
 #define	EEPROM_RF_ANTENNA_OPT_88E		0xC9
 
-- 
2.20.1

