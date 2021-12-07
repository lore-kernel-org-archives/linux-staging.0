Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C12CAE
	for <linux-staging@lists.linux.dev>; Tue,  7 Dec 2021 21:05:52 +0000 (UTC)
Received: from 250.57.4.146.static.wline.lns.sme.cust.swisscom.ch ([146.4.57.250] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1muhei-00060K-Rw; Tue, 07 Dec 2021 22:05:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/3] staging: r8188eu: remove SwLed1
Date: Tue,  7 Dec 2021 22:05:35 +0100
Message-Id: <20211207210537.23382-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207210537.23382-1-martin@kaiser.cx>
References: <20211207210537.23382-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The r8188eu driver does not use SwLed1. Calls from other layers to modify
the led state end up in SwLedControlMode1, where SwLed0 is hard-coded.

This patch removes the code to initialise and deinitialise SwLed1 and
the SwLed1 struct itself.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188eu_led.c | 3 ---
 drivers/staging/r8188eu/include/rtw_led.h   | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_led.c b/drivers/staging/r8188eu/hal/rtl8188eu_led.c
index 2dd9b4518f13..0d2d658af5bb 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_led.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_led.c
@@ -73,8 +73,6 @@ void rtl8188eu_InitSwLeds(struct adapter *padapter)
 	pledpriv->LedControlHandler = LedControl8188eu;
 
 	InitLed871x(padapter, &pledpriv->SwLed0, LED_PIN_LED0);
-
-	InitLed871x(padapter, &pledpriv->SwLed1, LED_PIN_LED1);
 }
 
 /*	Description: */
@@ -84,5 +82,4 @@ void rtl8188eu_DeInitSwLeds(struct adapter *padapter)
 	struct led_priv	*ledpriv = &padapter->ledpriv;
 
 	DeInitLed871x(&ledpriv->SwLed0);
-	DeInitLed871x(&ledpriv->SwLed1);
 }
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index f0272a7e8aa7..87c41ac6f701 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -95,7 +95,6 @@ void LedControl8188eu(struct adapter *padapter, enum LED_CTL_MODE	LedAction);
 struct led_priv{
 	/* add for led control */
 	struct LED_871x			SwLed0;
-	struct LED_871x			SwLed1;
 	u8	bRegUseLed;
 	void (*LedControlHandler)(struct adapter *padapter,
 				  enum LED_CTL_MODE LedAction);
-- 
2.20.1

