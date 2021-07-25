Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03705168
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 15:59:28 +0000 (UTC)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m7gXG-0000SM-KY; Sun, 25 Jul 2021 17:59:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/18] staging: rtl8188eu: simplify Hal_EfuseParseMACAddr_8188EU
Date: Sun, 25 Jul 2021 17:58:48 +0200
Message-Id: <20210725155902.32433-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hwinfo and AutoLoadFail parameters can be obtained from
struct adapter, there's no need to pass them as separate
function parameters.

Use memcpy instead of bytewise copy if we have to fall back to the
hard-coded mac address.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 79e86ed8798e..6af411e0c28e 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -952,19 +952,16 @@ static void Hal_EfuseParsePIDVID_8188EU(struct adapter *adapt, u8 *hwinfo, bool
 	}
 }
 
-static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool AutoLoadFail)
+static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt)
 {
-	u16 i;
-	u8 sMacAddr[6] = {0x00, 0xE0, 0x4C, 0x81, 0x88, 0x02};
+	u8 sMacAddr[] = {0x00, 0xE0, 0x4C, 0x81, 0x88, 0x02};
 	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(adapt);
+	u8 *hwinfo = eeprom->efuse_eeprom_data;
 
-	if (AutoLoadFail) {
-		for (i = 0; i < 6; i++)
-			eeprom->mac_addr[i] = sMacAddr[i];
-	} else {
-		/* Read Permanent MAC address */
+	if (eeprom->bautoload_fail_flag)
+		memcpy(eeprom->mac_addr, sMacAddr, sizeof(sMacAddr));
+	else
 		memcpy(eeprom->mac_addr, &hwinfo[EEPROM_MAC_ADDR_88EU], ETH_ALEN);
-	}
 }
 
 static void readAdapterInfo_8188EU(struct adapter *adapt)
@@ -974,7 +971,7 @@ static void readAdapterInfo_8188EU(struct adapter *adapt)
 	/* parse the eeprom/efuse content */
 	Hal_EfuseParseIDCode88E(adapt, eeprom->efuse_eeprom_data);
 	Hal_EfuseParsePIDVID_8188EU(adapt, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
-	Hal_EfuseParseMACAddr_8188EU(adapt, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
+	Hal_EfuseParseMACAddr_8188EU(adapt);
 
 	Hal_ReadPowerSavingMode88E(adapt, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_ReadTxPowerInfo88E(adapt, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
-- 
2.20.1

