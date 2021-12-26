Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D362C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 20:08:56 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zct-0000Fz-Tm; Sun, 26 Dec 2021 20:56:15 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/21] staging: r8188eu: clean up the blink worker code
Date: Sun, 26 Dec 2021 20:55:42 +0100
Message-Id: <20211226195556.159471-8-martin@kaiser.cx>
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

Merge the BlinkWorkItemCallback and BlinkHandler functions.
Rename the resulting function to blink_work and make it
internal to the led layer.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 13 ++++---------
 drivers/staging/r8188eu/include/rtw_led.h |  4 ----
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 52e31d3307df..517aef664bfc 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -5,13 +5,6 @@
 #include "../include/rtw_led.h"
 #include "../include/rtl8188e_spec.h"
 
-void BlinkWorkItemCallback(struct work_struct *work)
-{
-	struct delayed_work *dwork = to_delayed_work(work);
-	struct LED_871x *pLed = container_of(dwork, struct LED_871x, blink_work);
-	BlinkHandler(pLed);
-}
-
 static void ResetLedStatus(struct LED_871x *pLed)
 {
 	pLed->CurrLedState = RTW_LED_OFF; /*  Current LED state. */
@@ -391,8 +384,10 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 	}
 }
 
-void BlinkHandler(struct LED_871x *pLed)
+static void blink_work(struct work_struct *work)
 {
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct LED_871x *pLed = container_of(dwork, struct LED_871x, blink_work);
 	struct adapter *padapter = pLed->padapter;
 
 	if ((padapter->bSurpriseRemoved) || (padapter->bDriverStopped))
@@ -410,7 +405,7 @@ void rtl8188eu_InitSwLeds(struct adapter *padapter)
 
 	pLed->padapter = padapter;
 	ResetLedStatus(pLed);
-	INIT_DELAYED_WORK(&pLed->blink_work, BlinkWorkItemCallback);
+	INIT_DELAYED_WORK(&pLed->blink_work, blink_work);
 }
 
 void rtl8188eu_DeInitSwLeds(struct adapter *padapter)
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index 984fba6363ad..cd9e40aa7c65 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -100,11 +100,7 @@ struct led_priv{
 			(adapt)->ledpriv.LedControlHandler((adapt), (action)); \
 	} while (0)
 
-void BlinkWorkItemCallback(struct work_struct *work);
-
 void rtl8188eu_InitSwLeds(struct adapter *padapter);
 void rtl8188eu_DeInitSwLeds(struct adapter *padapter);
 
-void BlinkHandler(struct LED_871x * pLed);
-
 #endif /* __RTW_LED_H_ */
-- 
2.30.2

