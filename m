Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00A22CA1
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:29 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zd4-0000Fz-JW; Sun, 26 Dec 2021 20:56:26 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 18/21] staging: r8188eu: summarize some BlinkingLedState
Date: Sun, 26 Dec 2021 20:55:53 +0100
Message-Id: <20211226195556.159471-19-martin@kaiser.cx>
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

Move BlinkingLedState updates out of if clauses where the same update
is done for all possible paths.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 32 +++++++-------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index e554fef89c56..d1fdd5a4a3ad 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -95,60 +95,44 @@ static void SwLedBlink1(struct LED_871x *pLed)
 		schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
 		break;
 	case LED_BLINK_SCAN:
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
 		pLed->BlinkTimes--;
 		if (pLed->BlinkTimes == 0) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_NORMAL;
-				if (pLed->bLedOn)
-					pLed->BlinkingLedState = RTW_LED_OFF;
-				else
-					pLed->BlinkingLedState = RTW_LED_ON;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
-				if (pLed->bLedOn)
-					pLed->BlinkingLedState = RTW_LED_OFF;
-				else
-					pLed->BlinkingLedState = RTW_LED_ON;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
 			}
 			pLed->bLedScanBlinkInProgress = false;
 		} else {
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
 			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
 		}
 		break;
 	case LED_BLINK_TXRX:
+		if (pLed->bLedOn)
+			pLed->BlinkingLedState = RTW_LED_OFF;
+		else
+			pLed->BlinkingLedState = RTW_LED_ON;
 		pLed->BlinkTimes--;
 		if (pLed->BlinkTimes == 0) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_NORMAL;
-				if (pLed->bLedOn)
-					pLed->BlinkingLedState = RTW_LED_OFF;
-				else
-					pLed->BlinkingLedState = RTW_LED_ON;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
-				if (pLed->bLedOn)
-					pLed->BlinkingLedState = RTW_LED_OFF;
-				else
-					pLed->BlinkingLedState = RTW_LED_ON;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
 			}
 			pLed->bLedBlinkInProgress = false;
 		} else {
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
 			schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
 		}
 		break;
-- 
2.30.2

