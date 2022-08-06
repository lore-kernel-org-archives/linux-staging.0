Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCEC321F
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:56:05 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPtw-0004Tu-NG; Sat, 06 Aug 2022 21:56:00 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/13] staging: r8188eu: simplify _InitNormalChipTwoOutEpPriority
Date: Sat,  6 Aug 2022 21:55:40 +0200
Message-Id: <20220806195540.777390-14-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220806195540.777390-1-martin@kaiser.cx>
References: <20220806195540.777390-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the _InitNormalChipTwoOutEpPriority function, now that we have
only one configuration for the queues.

Remove the variables which are constant. Keep only those settings that
depend on wifi_spec.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index fc4d25b835d3..e1d56370a471 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -228,26 +228,17 @@ static void _InitNormalChipRegPriority(struct adapter *Adapter, u16 beQ,
 static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
 {
 	struct registry_priv *pregistrypriv = &Adapter->registrypriv;
-	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
-	u16 valueHi = QUEUE_HIGH;
-	u16 valueLow = QUEUE_NORMAL;
+	u16 bkQ, voQ;
 
 	if (!pregistrypriv->wifi_spec) {
-		beQ	= valueLow;
-		bkQ	= valueLow;
-		viQ	= valueHi;
-		voQ	= valueHi;
-		mgtQ	= valueHi;
-		hiQ	= valueHi;
+		bkQ	= QUEUE_NORMAL;
+		voQ	= QUEUE_HIGH;
 	} else {/* for WMM ,CONFIG_OUT_EP_WIFI_MODE */
-		beQ	= valueLow;
-		bkQ	= valueHi;
-		viQ	= valueHi;
-		voQ	= valueLow;
-		mgtQ	= valueHi;
-		hiQ	= valueHi;
+		bkQ	= QUEUE_HIGH;
+		voQ	= QUEUE_NORMAL;
 	}
-	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
+	_InitNormalChipRegPriority(Adapter, QUEUE_NORMAL, bkQ, QUEUE_HIGH,
+				   voQ, QUEUE_HIGH, QUEUE_HIGH);
 }
 
 static void _InitNormalChipThreeOutEpPriority(struct adapter *Adapter)
-- 
2.30.2

