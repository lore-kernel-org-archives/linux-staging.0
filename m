Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A722CAC
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 15:13:16 +0000 (UTC)
Received: from dslb-188-097-212-203.188.097.pools.vodafone-ip.de ([188.97.212.203] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mttCM-0007gF-Vs; Sun, 05 Dec 2021 16:13:07 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/10] staging: r8188eu: bLedOpenDrain is always true for r8188eu
Date: Sun,  5 Dec 2021 16:12:42 +0100
Message-Id: <20211205151251.6861-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211205151251.6861-1-martin@kaiser.cx>
References: <20211205151251.6861-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the bLedOpenDrain variable and code that would be executed only
if bLedOpenDrain was false.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188eu_led.c    | 16 +++++-----------
 drivers/staging/r8188eu/hal/usb_halinit.c      |  2 --
 drivers/staging/r8188eu/include/rtl8188e_hal.h |  2 --
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_led.c b/drivers/staging/r8188eu/hal/rtl8188eu_led.c
index 452d4bb87aba..2dd9b4518f13 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_led.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_led.c
@@ -36,7 +36,6 @@ void SwLedOn(struct adapter *padapter, struct LED_871x *pLed)
 void SwLedOff(struct adapter *padapter, struct LED_871x *pLed)
 {
 	u8	LedCfg;
-	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
 
 	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
 		goto exit;
@@ -45,16 +44,11 @@ void SwLedOff(struct adapter *padapter, struct LED_871x *pLed)
 
 	switch (pLed->LedPin) {
 	case LED_PIN_LED0:
-		if (pHalData->bLedOpenDrain) {
-			/*  Open-drain arrangement for controlling the LED) */
-			LedCfg &= 0x90; /*  Set to software control. */
-			rtw_write8(padapter, REG_LEDCFG2, (LedCfg | BIT(3)));
-			LedCfg = rtw_read8(padapter, REG_MAC_PINMUX_CFG);
-			LedCfg &= 0xFE;
-			rtw_write8(padapter, REG_MAC_PINMUX_CFG, LedCfg);
-		} else {
-			rtw_write8(padapter, REG_LEDCFG2, (LedCfg | BIT(3) | BIT(5) | BIT(6)));
-		}
+		LedCfg &= 0x90; /*  Set to software control. */
+		rtw_write8(padapter, REG_LEDCFG2, (LedCfg | BIT(3)));
+		LedCfg = rtw_read8(padapter, REG_MAC_PINMUX_CFG);
+		LedCfg &= 0xFE;
+		rtw_write8(padapter, REG_MAC_PINMUX_CFG, LedCfg);
 		break;
 	case LED_PIN_LED1:
 		LedCfg &= 0x0f; /*  Set to software control. */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index e995904cf85c..b1372a349e47 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -942,10 +942,8 @@ unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
 static void _ReadLEDSetting(struct adapter *Adapter, u8 *PROMContent, bool AutoloadFail)
 {
 	struct led_priv *pledpriv = &Adapter->ledpriv;
-	struct hal_data_8188e	*haldata = GET_HAL_DATA(Adapter);
 
 	pledpriv->bRegUseLed = true;
-	haldata->bLedOpenDrain = true;/*  Support Open-drain arrangement for controlling the LED. */
 }
 
 static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool AutoLoadFail)
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 0ebfcb732032..39dd547a033b 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -221,8 +221,6 @@ struct hal_data_8188e {
 	u32	AntennaRxPath;			/*  Antenna path Rx */
 	u8	ExternalPA;
 
-	u8	bLedOpenDrain; /* Open-drain support for controlling the LED.*/
-
 	u8	b1x1RecvCombine;	/*  for 1T1R receive combining */
 
 	u32	AcParam_BE; /* Original parameter for BE, use for EDCA turbo. */
-- 
2.20.1

