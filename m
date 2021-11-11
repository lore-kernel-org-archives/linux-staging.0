Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0EC29CA
	for <linux-staging@lists.linux.dev>; Thu, 11 Nov 2021 21:27:12 +0000 (UTC)
Received: from ipservice-092-217-091-158.092.217.pools.vodafone-ip.de ([92.217.91.158] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mlHb4-0006fH-Vj; Thu, 11 Nov 2021 22:27:03 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/7] staging: r8188eu: remove haldata's EEPROMCustomerID
Date: Thu, 11 Nov 2021 22:26:39 +0100
Message-Id: <20211111212644.9011-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211111212644.9011-1-martin@kaiser.cx>
References: <20211111212644.9011-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is used only in a (disabled) debug print.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 7 +------
 drivers/staging/r8188eu/hal/usb_halinit.c       | 4 +---
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
 drivers/staging/r8188eu/include/rtl8188e_spec.h | 2 --
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 84f3cfd571c6..9efdc846ba33 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1588,13 +1588,8 @@ void Hal_EfuseParseCustomerID88E(struct adapter *padapter, u8 *hwinfo, bool Auto
 {
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
 
-	if (!AutoLoadFail) {
-		pHalData->EEPROMCustomerID = hwinfo[EEPROM_CUSTOMERID_88E];
-	} else {
-		pHalData->EEPROMCustomerID = 0;
+	if (AutoLoadFail)
 		pHalData->EEPROMSubCustomerID = 0;
-	}
-	DBG_88E("EEPROM Customer ID: 0x%2x\n", pHalData->EEPROMCustomerID);
 }
 
 void Hal_ReadAntennaDiversity88E(struct adapter *pAdapter, u8 *PROMContent, bool AutoLoadFail)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 563b7c0a2c90..caef99d0926f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -986,15 +986,13 @@ static void Hal_EfuseParsePIDVID_8188EU(struct adapter *adapt, u8 *hwinfo, bool
 
 	if (!AutoLoadFail) {
 		/*  Customer ID, 0x00 and 0xff are reserved for Realtek. */
-		haldata->EEPROMCustomerID = *(u8 *)&hwinfo[EEPROM_CUSTOMERID_88E];
 		haldata->EEPROMSubCustomerID = EEPROM_Default_SubCustomerID;
 	} else {
 		/*  Customer ID, 0x00 and 0xff are reserved for Realtek. */
-		haldata->EEPROMCustomerID		= EEPROM_Default_CustomerID;
 		haldata->EEPROMSubCustomerID	= EEPROM_Default_SubCustomerID;
 	}
 
-	DBG_88E("Customer ID: 0x%02X, SubCustomer ID: 0x%02X\n", haldata->EEPROMCustomerID, haldata->EEPROMSubCustomerID);
+	DBG_88E("SubCustomer ID: 0x%02X\n", haldata->EEPROMSubCustomerID);
 }
 
 static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool AutoLoadFail)
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 84fa65972039..19aac5c7cffb 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -177,7 +177,6 @@ struct hal_data_8188e {
 	/*  EEPROM setting. */
 	u16	EEPROMSVID;
 	u16	EEPROMSDID;
-	u8	EEPROMCustomerID;
 	u8	EEPROMSubCustomerID;
 	u8	EEPROMVersion;
 	u8	EEPROMRegulatory;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index cfab7ad08947..8c62e8a2ca40 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -1345,8 +1345,6 @@ Current IOREG MAP
 #define	EEPROM_DEFAULT_BT_OPTION		0x10
 
 /*  For debug */
-#define EEPROM_Default_CustomerID		0xAB
-#define	EEPROM_Default_CustomerID_8188E		0x00
 #define EEPROM_Default_SubCustomerID		0xCD
 #define EEPROM_Default_Version			0
 
-- 
2.20.1

