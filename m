Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA06D4A32
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 20:29:39 +0000 (UTC)
Received: from dslb-188-096-142-076.188.096.pools.vodafone-ip.de ([188.96.142.76] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oQDnt-0000pA-JH; Mon, 22 Aug 2022 22:13:45 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/3] staging: r8188eu: always update the status variables
Date: Mon, 22 Aug 2022 22:13:29 +0200
Message-Id: <20220822201329.95559-4-martin@kaiser.cx>
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

Always update the status variables in rtw_led_control when we start
blinking because of no link. The code is easier to understand without
the if conditions.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index e63bcf9c0e84..c57059eeda34 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -225,13 +225,10 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 
 		cancel_delayed_work(&pLed->blink_work);
 
-		if (pLed->bLedLinkBlinkInProgress)
-			pLed->bLedLinkBlinkInProgress = false;
-
-		if (pLed->bLedBlinkInProgress)
-			pLed->bLedBlinkInProgress = false;
-
+		pLed->bLedLinkBlinkInProgress = false;
+		pLed->bLedBlinkInProgress = false;
 		pLed->bLedNoLinkBlinkInProgress = true;
+
 		pLed->CurrLedState = LED_BLINK_SLOWLY;
 		if (pLed->bLedOn)
 			pLed->BlinkingLedState = RTW_LED_OFF;
-- 
2.30.2

