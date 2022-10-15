Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916B20F8
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:11:42 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojip9-0006sp-Iy; Sat, 15 Oct 2022 17:11:39 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/10] staging: r8188eu: summarize tx/rx and scan blinking
Date: Sat, 15 Oct 2022 17:11:15 +0200
Message-Id: <20221015151115.232095-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221015151115.232095-1-martin@kaiser.cx>
References: <20221015151115.232095-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Summarize the code for tx/rx blinking and for scan blinking in blink_work.
The only difference is the delay for scheduling the next worker.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index f8bd183fba1e..ce8de2eb7845 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -81,21 +81,6 @@ static void blink_work(struct work_struct *work)
 		schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
 		break;
 	case LED_BLINK_SCAN:
-		pLed->BlinkTimes--;
-		if (pLed->BlinkTimes == 0) {
-			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-				pLed->CurrLedState = LED_BLINK_NORMAL;
-				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
-			} else {
-				pLed->CurrLedState = LED_BLINK_SLOWLY;
-				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
-			}
-			pLed->bLedBlinkInProgress = false;
-			pLed->bLedScanBlinkInProgress = false;
-		} else {
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
-		}
-		break;
 	case LED_BLINK_TXRX:
 		pLed->BlinkTimes--;
 		if (pLed->BlinkTimes == 0) {
@@ -109,7 +94,9 @@ static void blink_work(struct work_struct *work)
 			pLed->bLedBlinkInProgress = false;
 			pLed->bLedScanBlinkInProgress = false;
 		} else {
-			schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
+			schedule_delayed_work(&pLed->blink_work,
+					      pLed->CurrLedState == LED_BLINK_SCAN ?
+					      LED_BLINK_SCAN_INTVL : LED_BLINK_FASTER_INTVL);
 		}
 		break;
 	case LED_BLINK_WPS:
-- 
2.30.2

