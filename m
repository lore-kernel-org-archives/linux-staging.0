Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01BC258E
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 17:57:17 +0000 (UTC)
Received: from dslb-188-096-149-102.188.096.pools.vodafone-ip.de ([188.96.149.102] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oZyXa-0006VL-7c; Sun, 18 Sep 2022 19:57:14 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/6] staging: r8188eu: remove two unused enum entries
Date: Sun, 18 Sep 2022 19:57:00 +0200
Message-Id: <20220918175700.215170-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220918175700.215170-1-martin@kaiser.cx>
References: <20220918175700.215170-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both LED_BLINK_StartToBlink and LED_BLINK_RUNTOP in enum LED_STATE_871x
are not used in the r8188eu driver. Remove them.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_led.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index 7b1775b9fa64..8520f022a67f 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -27,12 +27,9 @@ enum LED_STATE_871x {
 	LED_BLINK_SCAN = 6, /*  LED is blinking during scanning period,
 			     * the # of times to blink is depend on time
 			     * for scanning. */
-	LED_BLINK_StartToBlink = 8,/*  Customzied for Sercomm Printer
-				    * Server case */
 	LED_BLINK_TXRX = 9,
 	LED_BLINK_WPS = 10,	/*  LED is blinkg during WPS communication */
 	LED_BLINK_WPS_STOP = 11,
-	LED_BLINK_RUNTOP = 13, /*  Customized for RunTop */
 };
 
 struct led_priv {
-- 
2.30.2

