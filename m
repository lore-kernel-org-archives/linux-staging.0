Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF1429CA
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 16:17:02 +0000 (UTC)
Received: from dslb-178-004-202-058.178.004.pools.vodafone-ip.de ([178.4.202.58] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mjkqp-0002GA-Gy; Sun, 07 Nov 2021 17:16:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/2] staging: r8188eu: remove write support from rtl8188e_EfusePowerSwitch
Date: Sun,  7 Nov 2021 17:16:23 +0100
Message-Id: <20211107161624.9452-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211107161624.9452-1-martin@kaiser.cx>
References: <20211107161624.9452-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8188e_EfusePowerSwitch function has a write parameter that is
set to false by its callers.

Remove the parameter and resulting dead code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_efuse.c        |  4 ++--
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 17 +----------------
 drivers/staging/r8188eu/include/hal_intf.h      |  2 +-
 3 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 39c77f6b06ef..bcdacae1b058 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -241,13 +241,13 @@ static void Efuse_ReadAllMap(struct adapter *pAdapter, u8 efuseType, u8 *Efuse,
 {
 	u16 mapLen = 0;
 
-	rtl8188e_EfusePowerSwitch(pAdapter, false, true);
+	rtl8188e_EfusePowerSwitch(pAdapter, true);
 
 	rtl8188e_EFUSE_GetEfuseDefinition(pAdapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, pseudo);
 
 	rtl8188e_ReadEFuse(pAdapter, efuseType, 0, mapLen, Efuse, pseudo);
 
-	rtl8188e_EfusePowerSwitch(pAdapter, false, false);
+	rtl8188e_EfusePowerSwitch(pAdapter, false);
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index c12c3b37d889..7f732f3ee53c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -673,9 +673,8 @@ hal_EfusePgPacketWriteData(
 		struct pgpkt *pTargetPkt,
 		bool bPseudoTest);
 
-void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 PwrState)
 {
-	u8 tempval;
 	u16	tmpV16;
 
 	if (PwrState) {
@@ -700,22 +699,8 @@ void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
 			tmpV16 |= (LOADER_CLK_EN | ANA8M);
 			rtw_write16(pAdapter, REG_SYS_CLKR, tmpV16);
 		}
-
-		if (bWrite) {
-			/*  Enable LDO 2.5V before read/write action */
-			tempval = rtw_read8(pAdapter, EFUSE_TEST + 3);
-			tempval &= 0x0F;
-			tempval |= (VOLTAGE_V25 << 4);
-			rtw_write8(pAdapter, EFUSE_TEST + 3, (tempval | 0x80));
-		}
 	} else {
 		rtw_write8(pAdapter, REG_EFUSE_ACCESS, EFUSE_ACCESS_OFF);
-
-		if (bWrite) {
-			/*  Disable LDO 2.5V after read/write action */
-			tempval = rtw_read8(pAdapter, EFUSE_TEST + 3);
-			rtw_write8(pAdapter, EFUSE_TEST + 3, (tempval & 0x7F));
-		}
 	}
 }
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index d777ad9071e2..8d9c31bd3f3c 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -120,7 +120,7 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter,
 			   enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
 void rtl8188e_free_hal_data(struct adapter *padapter);
-void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState);
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 PwrState);
 void rtl8188e_ReadEFuse(struct adapter *Adapter, u8 efuseType,
 			u16 _offset, u16 _size_byte, u8 *pbuf,
 			bool bPseudoTest);
-- 
2.20.1

