Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C173D2C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 20:08:43 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcu-0000Fz-TH; Sun, 26 Dec 2021 20:56:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/21] staging: r8188eu: clean up blinking macros
Date: Sun, 26 Dec 2021 20:55:43 +0100
Message-Id: <20211226195556.159471-9-martin@kaiser.cx>
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

Clean up the macros that check the blinking mode of a LED.

The macro IS_LED_BLINKING is not used and can be removed.

The IS_LED_WPS_BLINKING macro is used only by rtw_led.c. Move the macro
into this file. The macro parameter is always a struct LED_871x *,
there's no need for a cast. Rename the parameter to l and put it in
parentheses, which is good practice for macro parameters.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 5 +++++
 drivers/staging/r8188eu/include/rtw_led.h | 9 ---------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 517aef664bfc..63b811cba277 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -5,6 +5,11 @@
 #include "../include/rtw_led.h"
 #include "../include/rtl8188e_spec.h"
 
+#define IS_LED_WPS_BLINKING(l) \
+	((l)->CurrLedState == LED_BLINK_WPS || \
+	(l)->CurrLedState == LED_BLINK_WPS_STOP || \
+	(l)->bLedWPSBlinkInProgress)
+
 static void ResetLedStatus(struct LED_871x *pLed)
 {
 	pLed->CurrLedState = RTW_LED_OFF; /*  Current LED state. */
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index cd9e40aa7c65..69656da76d19 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -74,15 +74,6 @@ struct LED_871x {
 	struct delayed_work blink_work;
 };
 
-#define IS_LED_WPS_BLINKING(_LED_871x)					\
-	(((struct LED_871x *)_LED_871x)->CurrLedState == LED_BLINK_WPS || \
-	((struct LED_871x *)_LED_871x)->CurrLedState == LED_BLINK_WPS_STOP || \
-	((struct LED_871x *)_LED_871x)->bLedWPSBlinkInProgress)
-
-#define IS_LED_BLINKING(_LED_871x)					\
-	(((struct LED_871x *)_LED_871x)->bLedWPSBlinkInProgress	||	\
-	((struct LED_871x *)_LED_871x)->bLedScanBlinkInProgress)
-
 void LedControl8188eu(struct adapter *padapter, enum LED_CTL_MODE	LedAction);
 
 struct led_priv{
-- 
2.30.2

