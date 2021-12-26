Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5782CA3
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:24 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcz-0000Fz-MT; Sun, 26 Dec 2021 20:56:21 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/21] staging: r8188eu: remove obsolete comments
Date: Sun, 26 Dec 2021 20:55:48 +0100
Message-Id: <20211226195556.159471-14-martin@kaiser.cx>
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

Remove some comments that don't make sense any more.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_led.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index ffd23b73f852..2672ab165784 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -18,8 +18,8 @@ enum LED_CTL_MODE {
 	LED_CTL_START_TO_LINK = 8,
 	LED_CTL_START_WPS = 9,
 	LED_CTL_STOP_WPS = 10,
-	LED_CTL_START_WPS_BOTTON = 11, /* added for runtop */
-	LED_CTL_STOP_WPS_FAIL = 12, /* added for ALPHA */
+	LED_CTL_START_WPS_BOTTON = 11,
+	LED_CTL_STOP_WPS_FAIL = 12,
 };
 
 enum LED_STATE_871x {
@@ -35,7 +35,7 @@ enum LED_STATE_871x {
 				    * Server case */
 	LED_BLINK_TXRX = 9,
 	LED_BLINK_WPS = 10,	/*  LED is blinkg during WPS communication */
-	LED_BLINK_WPS_STOP = 11,	/* for ALPHA */
+	LED_BLINK_WPS_STOP = 11,
 	LED_BLINK_RUNTOP = 13, /*  Customized for RunTop */
 };
 
@@ -54,7 +54,6 @@ struct LED_871x {
 
 	u32 BlinkTimes; /*  Number of times to toggle led state for blinking. */
 
-	/*  ALPHA, added by chiyoko, 20090106 */
 	bool bLedNoLinkBlinkInProgress;
 	bool bLedLinkBlinkInProgress;
 	bool bLedScanBlinkInProgress;
@@ -64,12 +63,10 @@ struct LED_871x {
 void LedControl8188eu(struct adapter *padapter, enum LED_CTL_MODE	LedAction);
 
 struct led_priv{
-	/* add for led control */
 	struct LED_871x			SwLed0;
 	bool	bRegUseLed;
 	void (*LedControlHandler)(struct adapter *padapter,
 				  enum LED_CTL_MODE LedAction);
-	/* add for led control */
 };
 
 #define rtw_led_control(adapt, action) \
-- 
2.30.2

