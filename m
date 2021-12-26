Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4F2CA1
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:30 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zd5-0000Fz-Ks; Sun, 26 Dec 2021 20:56:27 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 19/21] staging: r8188eu: merge blink_work and SwLedBlink1
Date: Sun, 26 Dec 2021 20:55:54 +0100
Message-Id: <20211226195556.159471-20-martin@kaiser.cx>
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

blink_work is the only caller of SwLedBlink1. Merge the two functions.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 199 ++++++++++++-------------
 1 file changed, 96 insertions(+), 103 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index d1fdd5a4a3ad..2b550e5821e0 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -62,108 +62,6 @@ static void SwLedOff(struct adapter *padapter, struct LED_871x *pLed)
 	pLed->bLedOn = false;
 }
 
-static void SwLedBlink1(struct LED_871x *pLed)
-{
-	struct adapter *padapter = pLed->padapter;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-
-	/*  Change LED according to BlinkingLedState specified. */
-	if (pLed->BlinkingLedState == RTW_LED_ON)
-		SwLedOn(padapter, pLed);
-	else
-		SwLedOff(padapter, pLed);
-
-	if (padapter->pwrctrlpriv.rf_pwrstate != rf_on) {
-		SwLedOff(padapter, pLed);
-		ResetLedStatus(pLed);
-		return;
-	}
-
-	switch (pLed->CurrLedState) {
-	case LED_BLINK_SLOWLY:
-		if (pLed->bLedOn)
-			pLed->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed->BlinkingLedState = RTW_LED_ON;
-		schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
-		break;
-	case LED_BLINK_NORMAL:
-		if (pLed->bLedOn)
-			pLed->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed->BlinkingLedState = RTW_LED_ON;
-		schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
-		break;
-	case LED_BLINK_SCAN:
-		if (pLed->bLedOn)
-			pLed->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed->BlinkingLedState = RTW_LED_ON;
-		pLed->BlinkTimes--;
-		if (pLed->BlinkTimes == 0) {
-			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-				pLed->bLedLinkBlinkInProgress = true;
-				pLed->CurrLedState = LED_BLINK_NORMAL;
-				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
-			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
-				pLed->bLedNoLinkBlinkInProgress = true;
-				pLed->CurrLedState = LED_BLINK_SLOWLY;
-				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
-			}
-			pLed->bLedScanBlinkInProgress = false;
-		} else {
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
-		}
-		break;
-	case LED_BLINK_TXRX:
-		if (pLed->bLedOn)
-			pLed->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed->BlinkingLedState = RTW_LED_ON;
-		pLed->BlinkTimes--;
-		if (pLed->BlinkTimes == 0) {
-			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-				pLed->bLedLinkBlinkInProgress = true;
-				pLed->CurrLedState = LED_BLINK_NORMAL;
-				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
-			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
-				pLed->bLedNoLinkBlinkInProgress = true;
-				pLed->CurrLedState = LED_BLINK_SLOWLY;
-				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
-			}
-			pLed->bLedBlinkInProgress = false;
-		} else {
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
-		}
-		break;
-	case LED_BLINK_WPS:
-		if (pLed->bLedOn)
-			pLed->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed->BlinkingLedState = RTW_LED_ON;
-		schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
-		break;
-	case LED_BLINK_WPS_STOP:	/* WPS success */
-		if (pLed->BlinkingLedState != RTW_LED_ON) {
-			pLed->bLedLinkBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_NORMAL;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
-
-			pLed->bLedWPSBlinkInProgress = false;
-		} else {
-			pLed->BlinkingLedState = RTW_LED_OFF;
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_WPS_SUCESS_INTVL);
-		}
-		break;
-	default:
-		break;
-	}
-}
-
 static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 {
 	struct led_priv *ledpriv = &padapter->ledpriv;
@@ -371,11 +269,106 @@ static void blink_work(struct work_struct *work)
 	struct delayed_work *dwork = to_delayed_work(work);
 	struct LED_871x *pLed = container_of(dwork, struct LED_871x, blink_work);
 	struct adapter *padapter = pLed->padapter;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if ((padapter->bSurpriseRemoved) || (padapter->bDriverStopped))
 		return;
 
-	SwLedBlink1(pLed);
+	/*  Change LED according to BlinkingLedState specified. */
+	if (pLed->BlinkingLedState == RTW_LED_ON)
+		SwLedOn(padapter, pLed);
+	else
+		SwLedOff(padapter, pLed);
+
+	if (padapter->pwrctrlpriv.rf_pwrstate != rf_on) {
+		SwLedOff(padapter, pLed);
+		ResetLedStatus(pLed);
+		return;
+	}
+
+	switch (pLed->CurrLedState) {
+	case LED_BLINK_SLOWLY:
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
+		schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
+		break;
+	case LED_BLINK_NORMAL:
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
+		schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
+		break;
+	case LED_BLINK_SCAN:
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
+		pLed->BlinkTimes--;
+		if (pLed->BlinkTimes == 0) {
+			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
+				pLed->bLedLinkBlinkInProgress = true;
+				pLed->CurrLedState = LED_BLINK_NORMAL;
+				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
+			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
+				pLed->bLedNoLinkBlinkInProgress = true;
+				pLed->CurrLedState = LED_BLINK_SLOWLY;
+				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
+			}
+			pLed->bLedScanBlinkInProgress = false;
+		} else {
+			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
+		}
+		break;
+	case LED_BLINK_TXRX:
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
+		pLed->BlinkTimes--;
+		if (pLed->BlinkTimes == 0) {
+			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
+				pLed->bLedLinkBlinkInProgress = true;
+				pLed->CurrLedState = LED_BLINK_NORMAL;
+				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
+			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
+				pLed->bLedNoLinkBlinkInProgress = true;
+				pLed->CurrLedState = LED_BLINK_SLOWLY;
+				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
+			}
+			pLed->bLedBlinkInProgress = false;
+		} else {
+			schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
+		}
+		break;
+	case LED_BLINK_WPS:
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
+		schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
+		break;
+	case LED_BLINK_WPS_STOP:	/* WPS success */
+		if (pLed->BlinkingLedState != RTW_LED_ON) {
+			pLed->bLedLinkBlinkInProgress = true;
+			pLed->CurrLedState = LED_BLINK_NORMAL;
+			if (pLed->bLedOn)
+				pLed->BlinkingLedState = RTW_LED_OFF;
+			else
+				pLed->BlinkingLedState = RTW_LED_ON;
+			schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
+
+			pLed->bLedWPSBlinkInProgress = false;
+		} else {
+			pLed->BlinkingLedState = RTW_LED_OFF;
+			schedule_delayed_work(&pLed->blink_work, LED_BLINK_WPS_SUCESS_INTVL);
+		}
+		break;
+	default:
+		break;
+	}
 }
 
 void rtl8188eu_InitSwLeds(struct adapter *padapter)
-- 
2.30.2

