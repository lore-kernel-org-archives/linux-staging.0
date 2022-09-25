Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD5C3205
	for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 14:04:33 +0000 (UTC)
Received: from dslb-188-096-144-033.188.096.pools.vodafone-ip.de ([188.96.144.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ocSF6-0002Rl-TS; Sun, 25 Sep 2022 16:04:24 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] staging: r8188eu: don't check for stop/removal in the blink worker
Date: Sun, 25 Sep 2022 16:04:06 +0200
Message-Id: <20220925140406.112991-3-martin@kaiser.cx>
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

The blink_work function calls either SwLedOff or SwLedOn. These two
functions handle bSurpriseRemoved and bDriverStopped.

There's no need to check bSurpriseRemoved and bDriverStopped again in the
blink worker.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index d3bd9a97efdc..1e316e6358ea 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -77,9 +77,6 @@ static void blink_work(struct work_struct *work)
 	struct adapter *padapter = pLed->padapter;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if ((padapter->bSurpriseRemoved) || (padapter->bDriverStopped))
-		return;
-
 	if (padapter->pwrctrlpriv.rf_pwrstate != rf_on) {
 		SwLedOff(padapter, pLed);
 		ResetLedStatus(pLed);
-- 
2.30.2

