Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657802C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 20:08:33 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zco-0000Fz-NT; Sun, 26 Dec 2021 20:56:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/21] staging: r8188eu: move SwLedOn and SwLedOff into rtw_led.c
Date: Sun, 26 Dec 2021 20:55:37 +0100
Message-Id: <20211226195556.159471-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211226195556.159471-1-martin@kaiser.cx>
References: <20211226195556.159471-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the low-level functions SwLedOn and SwLedOff from the hal layer
into rtw_led.c. This is the only place where they're used.

There's no need to go through the hal layer for a simple register access
if the driver supports only a single chipset.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c      | 31 ++++++++++++++++++++
 drivers/staging/r8188eu/hal/rtl8188eu_led.c | 32 ---------------------
 drivers/staging/r8188eu/include/rtw_led.h   |  3 --
 3 files changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 25fab7bce7dc..2e3a689fb2fd 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -3,6 +3,7 @@
 
 #include "../include/drv_types.h"
 #include "../include/rtw_led.h"
+#include "../include/rtl8188e_spec.h"
 
 void BlinkWorkItemCallback(struct work_struct *work)
 {
@@ -28,6 +29,36 @@ void ResetLedStatus(struct LED_871x *pLed)
 	pLed->bLedScanBlinkInProgress = false;
 }
 
+static void SwLedOn(struct adapter *padapter, struct LED_871x *pLed)
+{
+	u8	LedCfg;
+
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
+		return;
+
+	LedCfg = rtw_read8(padapter, REG_LEDCFG2);
+	rtw_write8(padapter, REG_LEDCFG2, (LedCfg & 0xf0) | BIT(5) | BIT(6)); /*  SW control led0 on. */
+	pLed->bLedOn = true;
+}
+
+static void SwLedOff(struct adapter *padapter, struct LED_871x *pLed)
+{
+	u8	LedCfg;
+
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
+		goto exit;
+
+	LedCfg = rtw_read8(padapter, REG_LEDCFG2);/* 0x4E */
+
+	LedCfg &= 0x90; /*  Set to software control. */
+	rtw_write8(padapter, REG_LEDCFG2, (LedCfg | BIT(3)));
+	LedCfg = rtw_read8(padapter, REG_MAC_PINMUX_CFG);
+	LedCfg &= 0xFE;
+	rtw_write8(padapter, REG_MAC_PINMUX_CFG, LedCfg);
+exit:
+	pLed->bLedOn = false;
+}
+
 void InitLed871x(struct adapter *padapter, struct LED_871x *pLed)
 {
 	pLed->padapter = padapter;
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_led.c b/drivers/staging/r8188eu/hal/rtl8188eu_led.c
index 6fd1d1d476c7..46dd8c6703b7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_led.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_led.c
@@ -6,38 +6,6 @@
 #include "../include/rtl8188e_hal.h"
 #include "../include/rtl8188e_led.h"
 
-/*  LED object. */
-
-void SwLedOn(struct adapter *padapter, struct LED_871x *pLed)
-{
-	u8	LedCfg;
-
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
-		return;
-
-	LedCfg = rtw_read8(padapter, REG_LEDCFG2);
-	rtw_write8(padapter, REG_LEDCFG2, (LedCfg & 0xf0) | BIT(5) | BIT(6)); /*  SW control led0 on. */
-	pLed->bLedOn = true;
-}
-
-void SwLedOff(struct adapter *padapter, struct LED_871x *pLed)
-{
-	u8	LedCfg;
-
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
-		goto exit;
-
-	LedCfg = rtw_read8(padapter, REG_LEDCFG2);/* 0x4E */
-
-	LedCfg &= 0x90; /*  Set to software control. */
-	rtw_write8(padapter, REG_LEDCFG2, (LedCfg | BIT(3)));
-	LedCfg = rtw_read8(padapter, REG_MAC_PINMUX_CFG);
-	LedCfg &= 0xFE;
-	rtw_write8(padapter, REG_MAC_PINMUX_CFG, LedCfg);
-exit:
-	pLed->bLedOn = false;
-}
-
 /*  Interface to manipulate LED objects. */
 /*  Default LED behavior. */
 
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index e9b6d7768c2d..37f1dbc111f1 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -107,9 +107,6 @@ void ResetLedStatus(struct LED_871x * pLed);
 void InitLed871x(struct adapter *padapter, struct LED_871x *pLed);
 void DeInitLed871x(struct LED_871x *pLed);
 
-/* hal... */
 void BlinkHandler(struct LED_871x * pLed);
-void SwLedOn(struct adapter *padapter, struct LED_871x *pLed);
-void SwLedOff(struct adapter *padapter, struct LED_871x *pLed);
 
 #endif /* __RTW_LED_H_ */
-- 
2.30.2

