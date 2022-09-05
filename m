Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B114C71
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 20:02:04 +0000 (UTC)
Received: from dslb-178-004-201-030.178.004.pools.vodafone-ip.de ([178.4.201.30] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oVIID-00063M-FJ; Mon, 05 Sep 2022 22:02:01 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/7] staging: r8188eu: simplify the LED_CTL_POWER_OFF case
Date: Mon,  5 Sep 2022 22:01:40 +0200
Message-Id: <20220905200146.82259-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220905200146.82259-1-martin@kaiser.cx>
References: <20220905200146.82259-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a caller of rtw_led_control requests that the led be switched off,
we should cancel the blink worker and set all blinking state variables
to false. This does not depend on the current blinking state.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index c57059eeda34..dd3f0169ff94 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -381,26 +381,12 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	case LED_CTL_POWER_OFF:
 		pLed->CurrLedState = RTW_LED_OFF;
 		pLed->BlinkingLedState = RTW_LED_OFF;
-		if (pLed->bLedNoLinkBlinkInProgress) {
-			cancel_delayed_work(&pLed->blink_work);
-			pLed->bLedNoLinkBlinkInProgress = false;
-		}
-		if (pLed->bLedLinkBlinkInProgress) {
-			cancel_delayed_work(&pLed->blink_work);
-			pLed->bLedLinkBlinkInProgress = false;
-		}
-		if (pLed->bLedBlinkInProgress) {
-			cancel_delayed_work(&pLed->blink_work);
-			pLed->bLedBlinkInProgress = false;
-		}
-		if (pLed->bLedWPSBlinkInProgress) {
-			cancel_delayed_work(&pLed->blink_work);
-			pLed->bLedWPSBlinkInProgress = false;
-		}
-		if (pLed->bLedScanBlinkInProgress) {
-			cancel_delayed_work(&pLed->blink_work);
-			pLed->bLedScanBlinkInProgress = false;
-		}
+		pLed->bLedNoLinkBlinkInProgress = false;
+		pLed->bLedLinkBlinkInProgress = false;
+		pLed->bLedBlinkInProgress = false;
+		pLed->bLedWPSBlinkInProgress = false;
+		pLed->bLedScanBlinkInProgress = false;
+		cancel_delayed_work(&pLed->blink_work);
 		SwLedOff(padapter, pLed);
 		break;
 	default:
-- 
2.30.2

