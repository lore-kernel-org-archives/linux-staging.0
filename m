Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B2E2584
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 17:57:16 +0000 (UTC)
Received: from dslb-188-096-149-102.188.096.pools.vodafone-ip.de ([188.96.149.102] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oZyXY-0006VL-Vs; Sun, 18 Sep 2022 19:57:13 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/6] staging: r8188eu: remove duplicate bSurpriseRemoved check
Date: Sun, 18 Sep 2022 19:56:59 +0200
Message-Id: <20220918175700.215170-6-martin@kaiser.cx>
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

We don't have to check bSurpriseRemoved in the SwLedOn function.

SwLedOn calls rtw_read8 which in turn calls usb_read. This function checks
bSurpriseRemoved for us.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 744247af5956..989808a2b171 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -35,7 +35,7 @@ static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
 	u8	LedCfg;
 	int res;
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
+	if (padapter->bDriverStopped)
 		return;
 
 	res = rtw_read8(padapter, REG_LEDCFG2, &LedCfg);
-- 
2.30.2

