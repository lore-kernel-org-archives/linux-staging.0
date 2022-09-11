Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4E27F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 14:51:45 +0000 (UTC)
Received: from ipservice-092-217-076-063.092.217.pools.vodafone-ip.de ([92.217.76.63] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oXOJC-000829-8r; Sun, 11 Sep 2022 16:51:42 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 9/9] staging: r8188eu: update status before link blinking
Date: Sun, 11 Sep 2022 16:51:22 +0200
Message-Id: <20220911145122.15444-10-martin@kaiser.cx>
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

Always update the status variables in rtw_led_control when we start link
blinking. The if statements are not necessary.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 0881c81f4c74..98eebe3e4119 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -244,13 +244,11 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 			return;
 
 		cancel_delayed_work(&pLed->blink_work);
-		if (pLed->bLedNoLinkBlinkInProgress)
-			pLed->bLedNoLinkBlinkInProgress = false;
-
-		if (pLed->bLedBlinkInProgress)
-			pLed->bLedBlinkInProgress = false;
 
+		pLed->bLedNoLinkBlinkInProgress = false;
+		pLed->bLedBlinkInProgress = false;
 		pLed->bLedLinkBlinkInProgress = true;
+
 		pLed->CurrLedState = LED_BLINK_NORMAL;
 		if (pLed->bLedOn)
 			pLed->BlinkingLedState = RTW_LED_OFF;
-- 
2.30.2

