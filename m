Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4814A32
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 20:29:46 +0000 (UTC)
Received: from dslb-188-096-142-076.188.096.pools.vodafone-ip.de ([188.96.142.76] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oQDnq-0000pA-SZ; Mon, 22 Aug 2022 22:13:42 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/3] staging: r8188eu: don't restart "no link" blinking unnecessarily
Date: Mon, 22 Aug 2022 22:13:27 +0200
Message-Id: <20220822201329.95559-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822201329.95559-1-martin@kaiser.cx>
References: <20220822201329.95559-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify one of the cases in rtw_led_control. If we're already blinking
because we have no link, we don't have to restart this blinking when the
caller requests it again. We can simply return and keep on blinking.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 37 +++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index d5c6c5e29621..d3299fd1e39d 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -217,26 +217,27 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	switch (LedAction) {
 	case LED_CTL_START_TO_LINK:
 	case LED_CTL_NO_LINK:
-		if (!pLed->bLedNoLinkBlinkInProgress) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
-				return;
-			if (pLed->bLedLinkBlinkInProgress) {
-				cancel_delayed_work(&pLed->blink_work);
-				pLed->bLedLinkBlinkInProgress = false;
-			}
-			if (pLed->bLedBlinkInProgress) {
-				cancel_delayed_work(&pLed->blink_work);
-				pLed->bLedBlinkInProgress = false;
-			}
+		if (pLed->bLedNoLinkBlinkInProgress)
+			return;
 
-			pLed->bLedNoLinkBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_SLOWLY;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
+		if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
+			return;
+		if (pLed->bLedLinkBlinkInProgress) {
+			cancel_delayed_work(&pLed->blink_work);
+			pLed->bLedLinkBlinkInProgress = false;
 		}
+		if (pLed->bLedBlinkInProgress) {
+			cancel_delayed_work(&pLed->blink_work);
+			pLed->bLedBlinkInProgress = false;
+		}
+
+		pLed->bLedNoLinkBlinkInProgress = true;
+		pLed->CurrLedState = LED_BLINK_SLOWLY;
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
+		schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
 		break;
 	case LED_CTL_LINK:
 		if (!pLed->bLedLinkBlinkInProgress) {
-- 
2.30.2

