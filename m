Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DCF2CA1
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 20:08:27 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcn-0000Fz-MX; Sun, 26 Dec 2021 20:56:09 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	stable@vger.kernel.org
Subject: [PATCH 01/21] staging: r8188eu: switch the led off during deinit
Date: Sun, 26 Dec 2021 20:55:36 +0100
Message-Id: <20211226195556.159471-2-martin@kaiser.cx>
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

When the driver is unloaded or when the system goes into standby mode,
DeInitLed871x is called to stop the led layer. In this case, we stop
the blinking worker but we do not switch the led off explicitly. On my
system, I can go into standby mode with the LED enabled.

Add a call to SwLedOff to fix this.

Cc: stable@vger.kernel.org
Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index e1be1ba189cb..25fab7bce7dc 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -41,6 +41,7 @@ void DeInitLed871x(struct LED_871x *pLed)
 {
 	cancel_delayed_work_sync(&pLed->blink_work);
 	ResetLedStatus(pLed);
+	SwLedOff(pLed->padapter, pLed);
 }
 
 static void SwLedBlink1(struct LED_871x *pLed)
-- 
2.30.2

