Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38717F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 14:51:41 +0000 (UTC)
Received: from ipservice-092-217-076-063.092.217.pools.vodafone-ip.de ([92.217.76.63] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oXOJ8-000829-CZ; Sun, 11 Sep 2022 16:51:38 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/9] staging: r8188eu: simplify the code to prevent tx/rx blinking restart
Date: Sun, 11 Sep 2022 16:51:17 +0200
Message-Id: <20220911145122.15444-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220911145122.15444-1-martin@kaiser.cx>
References: <20220911145122.15444-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code for tx/rx blinking is wrapped into a big if clause to prevent
restarting if tx/rx blinking is already running.

Revert the if condition and exit if tx/rx blinking is running. This does
not change the behaviour.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 39 +++++++++++++-------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 75328e6c9a8d..a723f592e939 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -284,26 +284,27 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 		break;
 	case LED_CTL_TX:
 	case LED_CTL_RX:
-		if (!pLed->bLedBlinkInProgress) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
-				return;
-			if (pLed->bLedNoLinkBlinkInProgress) {
-				cancel_delayed_work(&pLed->blink_work);
-				pLed->bLedNoLinkBlinkInProgress = false;
-			}
-			if (pLed->bLedLinkBlinkInProgress) {
-				cancel_delayed_work(&pLed->blink_work);
-				pLed->bLedLinkBlinkInProgress = false;
-			}
-			pLed->bLedBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_TXRX;
-			pLed->BlinkTimes = 2;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
+		if (pLed->bLedBlinkInProgress)
+			return;
+
+		if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
+			return;
+		if (pLed->bLedNoLinkBlinkInProgress) {
+			cancel_delayed_work(&pLed->blink_work);
+			pLed->bLedNoLinkBlinkInProgress = false;
+		}
+		if (pLed->bLedLinkBlinkInProgress) {
+			cancel_delayed_work(&pLed->blink_work);
+			pLed->bLedLinkBlinkInProgress = false;
 		}
+		pLed->bLedBlinkInProgress = true;
+		pLed->CurrLedState = LED_BLINK_TXRX;
+		pLed->BlinkTimes = 2;
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
+		schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
 		break;
 	case LED_CTL_START_WPS: /* wait until xinpin finish */
 		if (pLed->bLedWPSBlinkInProgress)
-- 
2.30.2

