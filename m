Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CE72C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:27 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zd1-0000Fz-IC; Sun, 26 Dec 2021 20:56:23 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 15/21] staging: r8188eu: LED_CTL_POWER_ON is not used
Date: Sun, 26 Dec 2021 20:55:50 +0100
Message-Id: <20211226195556.159471-16-martin@kaiser.cx>
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

The LED_CTL_POWER_ON mode is not used by this driver.
Remove the define and related dead code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 4 +---
 drivers/staging/r8188eu/include/rtw_led.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 86c6c1a3b8bf..42d7a645389a 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -197,7 +197,6 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	switch (LedAction) {
-	case LED_CTL_POWER_ON:
 	case LED_CTL_START_TO_LINK:
 	case LED_CTL_NO_LINK:
 		if (!pLed->bLedNoLinkBlinkInProgress) {
@@ -447,8 +446,7 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	    (LedAction == LED_CTL_TX || LedAction == LED_CTL_RX ||
 	     LedAction == LED_CTL_SITE_SURVEY ||
 	     LedAction == LED_CTL_LINK ||
-	     LedAction == LED_CTL_NO_LINK ||
-	     LedAction == LED_CTL_POWER_ON))
+	     LedAction == LED_CTL_NO_LINK))
 		return;
 
 	SwLedControlMode1(padapter, LedAction);
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index 5c7b33e70732..e170db6f3e37 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -8,7 +8,6 @@
 #include "drv_types.h"
 
 enum LED_CTL_MODE {
-	LED_CTL_POWER_ON = 1,
 	LED_CTL_LINK = 2,
 	LED_CTL_NO_LINK = 3,
 	LED_CTL_TX = 4,
-- 
2.30.2

