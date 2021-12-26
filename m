Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCB12CA3
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:23 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcy-0000Fz-Na; Sun, 26 Dec 2021 20:56:20 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 12/21] staging: r8188eu: use bool for boolean values
Date: Sun, 26 Dec 2021 20:55:47 +0100
Message-Id: <20211226195556.159471-13-martin@kaiser.cx>
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

Change some boolean variables from u8 to bool.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_led.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index 6f44da69c3c9..ffd23b73f852 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -46,18 +46,18 @@ struct LED_871x {
 	enum LED_STATE_871x	BlinkingLedState; /*  Next state for blinking,
 				   * either RTW_LED_ON or RTW_LED_OFF are. */
 
-	u8 bLedOn; /*  true if LED is ON, false if LED is OFF. */
+	bool bLedOn; /*  true if LED is ON, false if LED is OFF. */
 
-	u8 bLedBlinkInProgress; /*  true if it is blinking, false o.w.. */
+	bool bLedBlinkInProgress; /*  true if it is blinking, false o.w.. */
 
-	u8 bLedWPSBlinkInProgress;
+	bool bLedWPSBlinkInProgress;
 
 	u32 BlinkTimes; /*  Number of times to toggle led state for blinking. */
 
 	/*  ALPHA, added by chiyoko, 20090106 */
-	u8 bLedNoLinkBlinkInProgress;
-	u8 bLedLinkBlinkInProgress;
-	u8 bLedScanBlinkInProgress;
+	bool bLedNoLinkBlinkInProgress;
+	bool bLedLinkBlinkInProgress;
+	bool bLedScanBlinkInProgress;
 	struct delayed_work blink_work;
 };
 
@@ -66,7 +66,7 @@ void LedControl8188eu(struct adapter *padapter, enum LED_CTL_MODE	LedAction);
 struct led_priv{
 	/* add for led control */
 	struct LED_871x			SwLed0;
-	u8	bRegUseLed;
+	bool	bRegUseLed;
 	void (*LedControlHandler)(struct adapter *padapter,
 				  enum LED_CTL_MODE LedAction);
 	/* add for led control */
-- 
2.30.2

