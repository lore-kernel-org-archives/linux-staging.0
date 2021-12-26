Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C73168
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:21 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcv-0000Fz-RC; Sun, 26 Dec 2021 20:56:17 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/21] staging: r8188eu: remove unused blink mode defines
Date: Sun, 26 Dec 2021 20:55:44 +0100
Message-Id: <20211226195556.159471-10-martin@kaiser.cx>
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

Remove defines for led blink modes which are not used by this driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_led.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index 69656da76d19..e7fd3966326b 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -34,21 +34,15 @@ enum LED_STATE_871x {
 	RTW_LED_OFF = 2,
 	LED_BLINK_NORMAL = 3,
 	LED_BLINK_SLOWLY = 4,
-	LED_BLINK_POWER_ON = 5,
 	LED_BLINK_SCAN = 6, /*  LED is blinking during scanning period,
 			     * the # of times to blink is depend on time
 			     * for scanning. */
-	LED_BLINK_NO_LINK = 7, /*  LED is blinking during no link state. */
 	LED_BLINK_StartToBlink = 8,/*  Customzied for Sercomm Printer
 				    * Server case */
 	LED_BLINK_TXRX = 9,
 	LED_BLINK_WPS = 10,	/*  LED is blinkg during WPS communication */
 	LED_BLINK_WPS_STOP = 11,	/* for ALPHA */
-	LED_BLINK_WPS_STOP_OVERLAP = 12,	/* for BELKIN */
 	LED_BLINK_RUNTOP = 13, /*  Customized for RunTop */
-	LED_BLINK_CAMEO = 14,
-	LED_BLINK_XAVI = 15,
-	LED_BLINK_ALWAYS_ON = 16,
 };
 
 struct LED_871x {
-- 
2.30.2

