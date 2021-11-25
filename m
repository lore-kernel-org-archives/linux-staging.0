Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862F68
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 15:56:06 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqGSe-0005zf-2g; Thu, 25 Nov 2021 16:14:56 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/6] staging: r8188eu: hal data's board type is unused
Date: Thu, 25 Nov 2021 16:14:36 +0100
Message-Id: <20211125151436.5895-7-martin@kaiser.cx>
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

BoardType in struct hal_data_8188e is not used. Remove the variable and the
function to extract the board type from the efuses.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 11 -----------
 drivers/staging/r8188eu/hal/usb_halinit.c       |  1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  4 ----
 3 files changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index d5aee084def9..001e4a198630 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1207,17 +1207,6 @@ void Hal_EfuseParseXtal_8188E(struct adapter *pAdapter, u8 *hwinfo, bool AutoLoa
 	DBG_88E("CrystalCap: 0x%2x\n", pHalData->CrystalCap);
 }
 
-void Hal_EfuseParseBoardType88E(struct adapter *pAdapter, u8 *hwinfo, bool AutoLoadFail)
-{
-	struct hal_data_8188e *pHalData = GET_HAL_DATA(pAdapter);
-
-	if (!AutoLoadFail)
-		pHalData->BoardType = ((hwinfo[EEPROM_RF_BOARD_OPTION_88E] & 0xE0) >> 5);
-	else
-		pHalData->BoardType = 0;
-	DBG_88E("Board Type: 0x%2x\n", pHalData->BoardType);
-}
-
 void rtl8188e_EfuseParseChnlPlan(struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail)
 {
 	padapter->mlmepriv.ChannelPlan =
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index fdaaf6e5bdda..04518e9838ea 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1023,7 +1023,6 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 	rtl8188e_EfuseParseChnlPlan(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_EfuseParseXtal_8188E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_ReadAntennaDiversity88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
-	Hal_EfuseParseBoardType88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_ReadThermalMeter_88E(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 
 	_ReadLEDSetting(Adapter, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index e4d6922bc703..5848f1d4191a 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -171,8 +171,6 @@ struct hal_data_8188e {
 	/* rf_ctrl */
 	u8	rf_type;
 
-	u8	BoardType;
-
 	/*  EEPROM setting. */
 	u16	EEPROMSVID;
 	u16	EEPROMSDID;
@@ -326,8 +324,6 @@ void Hal_ReadThermalMeter_88E(struct adapter *	dapter, u8 *PROMContent,
 			      bool AutoloadFail);
 void Hal_EfuseParseXtal_8188E(struct adapter *pAdapter, u8 *hwinfo,
 			      bool AutoLoadFail);
-void Hal_EfuseParseBoardType88E(struct adapter *pAdapter, u8 *hwinfo,
-				bool AutoLoadFail);
 void Hal_ReadPowerSavingMode88E(struct adapter *pAdapter, u8 *hwinfo,
 				bool AutoLoadFail);
 
-- 
2.20.1

