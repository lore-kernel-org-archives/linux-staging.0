Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCAA2C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 20:08:50 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcr-0000Fz-SE; Sun, 26 Dec 2021 20:56:13 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/21] staging: r8188eu: merge DeInitLed871x and rtl8188eu_DeInitSwLeds
Date: Sun, 26 Dec 2021 20:55:40 +0100
Message-Id: <20211226195556.159471-6-martin@kaiser.cx>
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

Merge DeInitLed871x and rtl8188eu_DeInitSwLeds, both of which are
small and simple.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 12 ++++--------
 drivers/staging/r8188eu/include/rtw_led.h |  2 --
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 541aba6faaf0..1eb70f33c158 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -59,13 +59,6 @@ static void SwLedOff(struct adapter *padapter, struct LED_871x *pLed)
 	pLed->bLedOn = false;
 }
 
-void DeInitLed871x(struct LED_871x *pLed)
-{
-	cancel_delayed_work_sync(&pLed->blink_work);
-	ResetLedStatus(pLed);
-	SwLedOff(pLed->padapter, pLed);
-}
-
 static void SwLedBlink1(struct LED_871x *pLed)
 {
 	struct adapter *padapter = pLed->padapter;
@@ -423,8 +416,11 @@ void rtl8188eu_InitSwLeds(struct adapter *padapter)
 void rtl8188eu_DeInitSwLeds(struct adapter *padapter)
 {
 	struct led_priv	*ledpriv = &padapter->ledpriv;
+	struct LED_871x *pLed = &ledpriv->SwLed0;
 
-	DeInitLed871x(&ledpriv->SwLed0);
+	cancel_delayed_work_sync(&pLed->blink_work);
+	ResetLedStatus(pLed);
+	SwLedOff(padapter, pLed);
 }
 
 void LedControl8188eu(struct adapter *padapter, enum LED_CTL_MODE LedAction)
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index 2c4dc361e469..ed8574c88288 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -104,8 +104,6 @@ void BlinkWorkItemCallback(struct work_struct *work);
 
 void ResetLedStatus(struct LED_871x * pLed);
 
-void DeInitLed871x(struct LED_871x *pLed);
-
 void rtl8188eu_InitSwLeds(struct adapter *padapter);
 void rtl8188eu_DeInitSwLeds(struct adapter *padapter);
 
-- 
2.30.2

