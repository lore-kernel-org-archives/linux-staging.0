Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533F2C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:23 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcx-0000Fz-PB; Sun, 26 Dec 2021 20:56:19 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/21] staging: r8188eu: make blink interval defines internal
Date: Sun, 26 Dec 2021 20:55:46 +0100
Message-Id: <20211226195556.159471-12-martin@kaiser.cx>
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

The defines for led blink intervals are used only by the led layer.
Move them into rtw_led.c.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 6 ++++++
 drivers/staging/r8188eu/include/rtw_led.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 7eade85302c8..8223bddc490b 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -5,6 +5,12 @@
 #include "../include/rtw_led.h"
 #include "../include/rtl8188e_spec.h"
 
+#define LED_BLINK_NO_LINK_INTVL			msecs_to_jiffies(1000)
+#define LED_BLINK_LINK_INTVL			msecs_to_jiffies(500)
+#define LED_BLINK_SCAN_INTVL			msecs_to_jiffies(180)
+#define LED_BLINK_FASTER_INTVL			msecs_to_jiffies(50)
+#define LED_BLINK_WPS_SUCESS_INTVL		msecs_to_jiffies(5000)
+
 #define IS_LED_WPS_BLINKING(l) \
 	((l)->CurrLedState == LED_BLINK_WPS || \
 	(l)->CurrLedState == LED_BLINK_WPS_STOP || \
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index fd7b0cbd64ac..6f44da69c3c9 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -7,12 +7,6 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-#define LED_BLINK_NO_LINK_INTVL			msecs_to_jiffies(1000)
-#define LED_BLINK_LINK_INTVL			msecs_to_jiffies(500)
-#define LED_BLINK_SCAN_INTVL			msecs_to_jiffies(180)
-#define LED_BLINK_FASTER_INTVL			msecs_to_jiffies(50)
-#define LED_BLINK_WPS_SUCESS_INTVL		msecs_to_jiffies(5000)
-
 enum LED_CTL_MODE {
 	LED_CTL_POWER_ON = 1,
 	LED_CTL_LINK = 2,
-- 
2.30.2

