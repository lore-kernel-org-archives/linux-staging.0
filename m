Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DCB2F5F
	for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 14:04:32 +0000 (UTC)
Received: from dslb-188-096-144-033.188.096.pools.vodafone-ip.de ([188.96.144.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ocSF5-0002Rl-AY; Sun, 25 Sep 2022 16:04:23 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/2] staging: r8188eu: don't check bSurpriseRemoved in SwLedOff
Date: Sun, 25 Sep 2022 16:04:05 +0200
Message-Id: <20220925140406.112991-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220925140406.112991-1-martin@kaiser.cx>
References: <20220925140406.112991-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SwLedOff function calls rtw_read8 which in turn calls usb_read.

bSurpriseRemoved is checked in usb_read. We don't have to check it again
in SwLedOff.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 989808a2b171..d3bd9a97efdc 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -51,7 +51,7 @@ static void SwLedOff(struct adapter *padapter, struct led_priv *pLed)
 	u8	LedCfg;
 	int res;
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
+	if (padapter->bDriverStopped)
 		goto exit;
 
 	res = rtw_read8(padapter, REG_LEDCFG2, &LedCfg);/* 0x4E */
-- 
2.30.2

