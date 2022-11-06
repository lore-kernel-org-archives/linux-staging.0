Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571132592
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 12:49:20 +0000 (UTC)
Received: from ipservice-092-217-068-220.092.217.pools.vodafone-ip.de ([92.217.68.220] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1orf5M-0008Dj-20; Sun, 06 Nov 2022 13:49:12 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/9] staging: r8188eu: remove state checks in rtw_led_control
Date: Sun,  6 Nov 2022 13:48:57 +0100
Message-Id: <20221106124901.720785-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221106124901.720785-1-martin@kaiser.cx>
References: <20221106124901.720785-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to check for bSurpriseRemoved or bDriverStopped in the
rtw_led_control function. This function schedules a delayed worker which
calls SwLedOn or SwLedOff (or the function calls SwLedOff directly).

SwLedOn and SwLedOff check bDriverStopped themselves or they initiate a
USB control transfer via usb_write, where bSurpriseRemoved is checked.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index ce8de2eb7845..48725ce9d369 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -140,8 +140,7 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	struct registry_priv *registry_par;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if ((padapter->bSurpriseRemoved) || (padapter->bDriverStopped) ||
-	    (!padapter->hw_init_completed))
+	if (!padapter->hw_init_completed)
 		return;
 
 	if (!pLed->bRegUseLed)
-- 
2.30.2

