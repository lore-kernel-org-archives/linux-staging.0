Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CADC20E0
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:11:37 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojip4-0006sp-CF; Sat, 15 Oct 2022 17:11:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/10] staging: r8188eu: SwLedOn needs no padapter parameter
Date: Sat, 15 Oct 2022 17:11:09 +0200
Message-Id: <20221015151115.232095-5-martin@kaiser.cx>
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

Remove the padapter parameter from the SwLedOn function. padapter can be
derived from the pLed parameter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 38433296d327..aa8f41edfade 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -29,8 +29,10 @@ static void ResetLedStatus(struct led_priv *pLed)
 	pLed->bLedScanBlinkInProgress = false;
 }
 
-static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
+static void SwLedOn(struct led_priv *pLed)
 {
+	struct adapter *padapter = container_of(pLed, struct adapter, ledpriv);
+
 	if (padapter->bDriverStopped)
 		return;
 
@@ -67,7 +69,7 @@ static void blink_work(struct work_struct *work)
 	if (pLed->bLedOn)
 		SwLedOff(padapter, pLed);
 	else
-		SwLedOn(padapter, pLed);
+		SwLedOn(pLed);
 
 	switch (pLed->CurrLedState) {
 	case LED_BLINK_SLOWLY:
-- 
2.30.2

