Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70012CA1
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:27 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zd2-0000Fz-JT; Sun, 26 Dec 2021 20:56:24 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 16/21] staging: r8188eu: LED_CTL_START_WPS_BOTTON is not used
Date: Sun, 26 Dec 2021 20:55:51 +0100
Message-Id: <20211226195556.159471-17-martin@kaiser.cx>
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

None of the callers sets LED_CTL_START_WPS_BOTTON. Remove the define
and related dead code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 1 -
 drivers/staging/r8188eu/include/rtw_led.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 42d7a645389a..20e805718557 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -293,7 +293,6 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 		}
 		break;
 	case LED_CTL_START_WPS: /* wait until xinpin finish */
-	case LED_CTL_START_WPS_BOTTON:
 		 if (!pLed->bLedWPSBlinkInProgress) {
 			if (pLed->bLedNoLinkBlinkInProgress) {
 				cancel_delayed_work(&pLed->blink_work);
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index e170db6f3e37..2c14cb23d9ad 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -17,7 +17,6 @@ enum LED_CTL_MODE {
 	LED_CTL_START_TO_LINK = 8,
 	LED_CTL_START_WPS = 9,
 	LED_CTL_STOP_WPS = 10,
-	LED_CTL_START_WPS_BOTTON = 11,
 	LED_CTL_STOP_WPS_FAIL = 12,
 };
 
-- 
2.30.2

