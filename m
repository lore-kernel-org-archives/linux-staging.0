Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990C02C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 20:08:53 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcq-0000Fz-Qg; Sun, 26 Dec 2021 20:56:12 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/21] staging: r8188eu: merge InitLed871x and rtl8188eu_InitSwLeds
Date: Sun, 26 Dec 2021 20:55:39 +0100
Message-Id: <20211226195556.159471-5-martin@kaiser.cx>
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

Copy InitLed871x into rtl8188eu_InitSwLeds. There's no need for two
separate functions.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 14 ++++----------
 drivers/staging/r8188eu/include/rtw_led.h |  1 -
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 50dabc3d2e29..541aba6faaf0 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -59,15 +59,6 @@ static void SwLedOff(struct adapter *padapter, struct LED_871x *pLed)
 	pLed->bLedOn = false;
 }
 
-void InitLed871x(struct adapter *padapter, struct LED_871x *pLed)
-{
-	pLed->padapter = padapter;
-
-	ResetLedStatus(pLed);
-
-	INIT_DELAYED_WORK(&pLed->blink_work, BlinkWorkItemCallback);
-}
-
 void DeInitLed871x(struct LED_871x *pLed)
 {
 	cancel_delayed_work_sync(&pLed->blink_work);
@@ -420,10 +411,13 @@ void BlinkHandler(struct LED_871x *pLed)
 void rtl8188eu_InitSwLeds(struct adapter *padapter)
 {
 	struct led_priv *pledpriv = &padapter->ledpriv;
+	struct LED_871x *pLed = &pledpriv->SwLed0;
 
 	pledpriv->LedControlHandler = LedControl8188eu;
 
-	InitLed871x(padapter, &pledpriv->SwLed0);
+	pLed->padapter = padapter;
+	ResetLedStatus(pLed);
+	INIT_DELAYED_WORK(&pLed->blink_work, BlinkWorkItemCallback);
 }
 
 void rtl8188eu_DeInitSwLeds(struct adapter *padapter)
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index d4ba5ac3e48a..2c4dc361e469 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -104,7 +104,6 @@ void BlinkWorkItemCallback(struct work_struct *work);
 
 void ResetLedStatus(struct LED_871x * pLed);
 
-void InitLed871x(struct adapter *padapter, struct LED_871x *pLed);
 void DeInitLed871x(struct LED_871x *pLed);
 
 void rtl8188eu_InitSwLeds(struct adapter *padapter);
-- 
2.30.2

