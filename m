Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1CC20E4
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:11:38 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojip5-0006sp-9a; Sat, 15 Oct 2022 17:11:35 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/10] staging: r8188eu: SwLedOff needs no padapter parameter
Date: Sat, 15 Oct 2022 17:11:10 +0200
Message-Id: <20221015151115.232095-6-martin@kaiser.cx>
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

Remove the padapter parameter from the SwLedOff function. padapter can
be derived from the pLed parameter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index aa8f41edfade..56f043d8ff38 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -42,8 +42,10 @@ static void SwLedOn(struct led_priv *pLed)
 	pLed->bLedOn = true;
 }
 
-static void SwLedOff(struct adapter *padapter, struct led_priv *pLed)
+static void SwLedOff(struct led_priv *pLed)
 {
+	struct adapter *padapter = container_of(pLed, struct adapter, ledpriv);
+
 	if (padapter->bDriverStopped)
 		return;
 
@@ -61,13 +63,13 @@ static void blink_work(struct work_struct *work)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (padapter->pwrctrlpriv.rf_pwrstate != rf_on) {
-		SwLedOff(padapter, pLed);
+		SwLedOff(pLed);
 		ResetLedStatus(pLed);
 		return;
 	}
 
 	if (pLed->bLedOn)
-		SwLedOff(padapter, pLed);
+		SwLedOff(pLed);
 	else
 		SwLedOn(pLed);
 
@@ -141,7 +143,7 @@ void rtl8188eu_DeInitSwLeds(struct adapter *padapter)
 
 	cancel_delayed_work_sync(&ledpriv->blink_work);
 	ResetLedStatus(ledpriv);
-	SwLedOff(padapter, ledpriv);
+	SwLedOff(ledpriv);
 }
 
 void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
@@ -258,7 +260,7 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 		pLed->bLedWPSBlinkInProgress = false;
 		pLed->bLedScanBlinkInProgress = false;
 		cancel_delayed_work(&pLed->blink_work);
-		SwLedOff(padapter, pLed);
+		SwLedOff(pLed);
 		break;
 	default:
 		break;
-- 
2.30.2

