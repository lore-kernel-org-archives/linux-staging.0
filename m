Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7DC2C80
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 19:56:21 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1Zcw-0000Fz-P5; Sun, 26 Dec 2021 20:56:18 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/21] staging: r8188eu: bLedStartToLinkBlinkInProgress is set but not used
Date: Sun, 26 Dec 2021 20:55:45 +0100
Message-Id: <20211226195556.159471-11-martin@kaiser.cx>
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

Remove bLedStartToLinkBlinkInProgress from struct LED_871x.
It's set but not used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_led.c    | 1 -
 drivers/staging/r8188eu/include/rtw_led.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 63b811cba277..7eade85302c8 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -23,7 +23,6 @@ static void ResetLedStatus(struct LED_871x *pLed)
 
 	pLed->bLedNoLinkBlinkInProgress = false;
 	pLed->bLedLinkBlinkInProgress = false;
-	pLed->bLedStartToLinkBlinkInProgress = false;
 	pLed->bLedScanBlinkInProgress = false;
 }
 
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index e7fd3966326b..fd7b0cbd64ac 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -63,7 +63,6 @@ struct LED_871x {
 	/*  ALPHA, added by chiyoko, 20090106 */
 	u8 bLedNoLinkBlinkInProgress;
 	u8 bLedLinkBlinkInProgress;
-	u8 bLedStartToLinkBlinkInProgress;
 	u8 bLedScanBlinkInProgress;
 	struct delayed_work blink_work;
 };
-- 
2.30.2

