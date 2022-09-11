Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4FA7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 14:51:43 +0000 (UTC)
Received: from ipservice-092-217-076-063.092.217.pools.vodafone-ip.de ([92.217.76.63] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oXOJA-000829-Jf; Sun, 11 Sep 2022 16:51:40 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 7/9] staging: r8188eu: simplify the code to prevent link blinking restart
Date: Sun, 11 Sep 2022 16:51:20 +0200
Message-Id: <20220911145122.15444-8-martin@kaiser.cx>
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

The blinking code to signal that a link is up has the same big if clause
around it as most other blink events.

Revert this if condition and exit if we're already blinking to show that
the link is up.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 37 +++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 270880050c64..7cd6ed5385bb 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -237,25 +237,26 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 		schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
 		break;
 	case LED_CTL_LINK:
-		if (!pLed->bLedLinkBlinkInProgress) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
-				return;
-			if (pLed->bLedNoLinkBlinkInProgress) {
-				cancel_delayed_work(&pLed->blink_work);
-				pLed->bLedNoLinkBlinkInProgress = false;
-			}
-			if (pLed->bLedBlinkInProgress) {
-				cancel_delayed_work(&pLed->blink_work);
-				pLed->bLedBlinkInProgress = false;
-			}
-			pLed->bLedLinkBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_NORMAL;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
+		if (!pLed->bLedLinkBlinkInProgress)
+			return;
+
+		if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
+			return;
+		if (pLed->bLedNoLinkBlinkInProgress) {
+			cancel_delayed_work(&pLed->blink_work);
+			pLed->bLedNoLinkBlinkInProgress = false;
+		}
+		if (pLed->bLedBlinkInProgress) {
+			cancel_delayed_work(&pLed->blink_work);
+			pLed->bLedBlinkInProgress = false;
 		}
+		pLed->bLedLinkBlinkInProgress = true;
+		pLed->CurrLedState = LED_BLINK_NORMAL;
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
+		schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
 		break;
 	case LED_CTL_SITE_SURVEY:
 		if ((pmlmepriv->LinkDetectInfo.bBusyTraffic) && (check_fwstate(pmlmepriv, _FW_LINKED)))
-- 
2.30.2

