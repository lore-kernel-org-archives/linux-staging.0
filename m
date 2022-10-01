Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B267B
	for <linux-staging@lists.linux.dev>; Sat,  1 Oct 2022 17:06:35 +0000 (UTC)
Received: from dslb-188-104-058-002.188.104.pools.vodafone-ip.de ([188.104.58.2] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oefwX-0008H7-Mz; Sat, 01 Oct 2022 19:06:25 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: remove bLedLinkBlinkInProgress
Date: Sat,  1 Oct 2022 19:06:18 +0200
Message-Id: <20221001170618.444444-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the bLedLinkBlinkInProgress component from struct led_priv. Its
only use is to block requests for "link blinking" when this blinking
pattern is already active.

The "link blinking" pattern is a continuous blinking pattern (as opposed
to other patterns where we blink N times), it's no problem to restart this
pattern when it's already running.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 14 --------------
 drivers/staging/r8188eu/include/rtw_led.h |  1 -
 2 files changed, 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 1e316e6358ea..2527c252c3e9 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -26,7 +26,6 @@ static void ResetLedStatus(struct led_priv *pLed)
 
 	pLed->BlinkTimes = 0; /*  Number of times to toggle led state for blinking. */
 
-	pLed->bLedLinkBlinkInProgress = false;
 	pLed->bLedScanBlinkInProgress = false;
 }
 
@@ -99,7 +98,6 @@ static void blink_work(struct work_struct *work)
 		pLed->BlinkTimes--;
 		if (pLed->BlinkTimes == 0) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-				pLed->bLedLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_NORMAL;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
 			} else {
@@ -115,7 +113,6 @@ static void blink_work(struct work_struct *work)
 		pLed->BlinkTimes--;
 		if (pLed->BlinkTimes == 0) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-				pLed->bLedLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_NORMAL;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
 			} else {
@@ -132,7 +129,6 @@ static void blink_work(struct work_struct *work)
 		break;
 	case LED_BLINK_WPS_STOP:	/* WPS success */
 		if (!pLed->bLedOn) {
-			pLed->bLedLinkBlinkInProgress = true;
 			pLed->CurrLedState = LED_BLINK_NORMAL;
 			schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
 
@@ -189,23 +185,18 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 
 		cancel_delayed_work(&pLed->blink_work);
 
-		pLed->bLedLinkBlinkInProgress = false;
 		pLed->bLedBlinkInProgress = false;
 
 		pLed->CurrLedState = LED_BLINK_SLOWLY;
 		schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
 		break;
 	case LED_CTL_LINK:
-		if (!pLed->bLedLinkBlinkInProgress)
-			return;
-
 		if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
 			return;
 
 		cancel_delayed_work(&pLed->blink_work);
 
 		pLed->bLedBlinkInProgress = false;
-		pLed->bLedLinkBlinkInProgress = true;
 
 		pLed->CurrLedState = LED_BLINK_NORMAL;
 		schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
@@ -222,7 +213,6 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 
 		cancel_delayed_work(&pLed->blink_work);
 
-		pLed->bLedLinkBlinkInProgress = false;
 		pLed->bLedBlinkInProgress = false;
 		pLed->bLedScanBlinkInProgress = true;
 
@@ -240,7 +230,6 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 
 		cancel_delayed_work(&pLed->blink_work);
 
-		pLed->bLedLinkBlinkInProgress = false;
 		pLed->bLedBlinkInProgress = true;
 
 		pLed->CurrLedState = LED_BLINK_TXRX;
@@ -253,7 +242,6 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 
 		cancel_delayed_work(&pLed->blink_work);
 
-		pLed->bLedLinkBlinkInProgress = false;
 		pLed->bLedBlinkInProgress = false;
 		pLed->bLedScanBlinkInProgress = false;
 		pLed->bLedWPSBlinkInProgress = true;
@@ -263,7 +251,6 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	case LED_CTL_STOP_WPS:
 		cancel_delayed_work(&pLed->blink_work);
 
-		pLed->bLedLinkBlinkInProgress = false;
 		pLed->bLedBlinkInProgress = false;
 		pLed->bLedScanBlinkInProgress = false;
 		pLed->bLedWPSBlinkInProgress = true;
@@ -283,7 +270,6 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 		break;
 	case LED_CTL_POWER_OFF:
 		pLed->CurrLedState = RTW_LED_OFF;
-		pLed->bLedLinkBlinkInProgress = false;
 		pLed->bLedBlinkInProgress = false;
 		pLed->bLedWPSBlinkInProgress = false;
 		pLed->bLedScanBlinkInProgress = false;
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index 8520f022a67f..f57dcf6c8b24 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -47,7 +47,6 @@ struct led_priv {
 
 	u32 BlinkTimes; /*  Number of times to toggle led state for blinking. */
 
-	bool bLedLinkBlinkInProgress;
 	bool bLedScanBlinkInProgress;
 	struct delayed_work blink_work;
 };
-- 
2.30.2

