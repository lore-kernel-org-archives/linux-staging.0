Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A1B20E4
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:11:41 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojip8-0006sp-Mt; Sat, 15 Oct 2022 17:11:38 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/10] staging: r8188eu: set two more state variables
Date: Sat, 15 Oct 2022 17:11:14 +0200
Message-Id: <20221015151115.232095-10-martin@kaiser.cx>
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

Set two more state variables in the blink worker when scan blinking and
tx/rx blinking are finished.

bLedBlinkInProgress is true during tx/rx blinking, bLedScanBlinkInProgress
is true during scan blinking. If we doing neither of the two, we may
safely set both variables to false.

This change makes the scan and tx/rx cases almost identical, we are now
ready to summarize the two cases.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 2dbd7b5ffdd0..f8bd183fba1e 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -90,6 +90,7 @@ static void blink_work(struct work_struct *work)
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
 			}
+			pLed->bLedBlinkInProgress = false;
 			pLed->bLedScanBlinkInProgress = false;
 		} else {
 			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
@@ -106,6 +107,7 @@ static void blink_work(struct work_struct *work)
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
 			}
 			pLed->bLedBlinkInProgress = false;
+			pLed->bLedScanBlinkInProgress = false;
 		} else {
 			schedule_delayed_work(&pLed->blink_work, LED_BLINK_FASTER_INTVL);
 		}
-- 
2.30.2

