Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8813B2586
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 17:57:16 +0000 (UTC)
Received: from dslb-188-096-149-102.188.096.pools.vodafone-ip.de ([188.96.149.102] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oZyXU-0006VL-C6; Sun, 18 Sep 2022 19:57:08 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/6] staging: r8188eu: update status before wps success blinking
Date: Sun, 18 Sep 2022 19:56:56 +0200
Message-Id: <20220918175700.215170-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220918175700.215170-1-martin@kaiser.cx>
References: <20220918175700.215170-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always update the status variables in rtw_led_control when we start
blinking to show that wps was successful. The if statements are not
necessary.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 389fb2cc7379..eac35f048f52 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -324,20 +324,11 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	case LED_CTL_STOP_WPS:
 		cancel_delayed_work(&pLed->blink_work);
 
-		if (pLed->bLedNoLinkBlinkInProgress)
-			pLed->bLedNoLinkBlinkInProgress = false;
-
-		if (pLed->bLedLinkBlinkInProgress)
-			pLed->bLedLinkBlinkInProgress = false;
-
-		if (pLed->bLedBlinkInProgress)
-			pLed->bLedBlinkInProgress = false;
-
-		if (pLed->bLedScanBlinkInProgress)
-			pLed->bLedScanBlinkInProgress = false;
-
-		if (!pLed->bLedWPSBlinkInProgress)
-			pLed->bLedWPSBlinkInProgress = true;
+		pLed->bLedNoLinkBlinkInProgress = false;
+		pLed->bLedLinkBlinkInProgress = false;
+		pLed->bLedBlinkInProgress = false;
+		pLed->bLedScanBlinkInProgress = false;
+		pLed->bLedWPSBlinkInProgress = true;
 
 		pLed->CurrLedState = LED_BLINK_WPS_STOP;
 		if (pLed->bLedOn) {
-- 
2.30.2

