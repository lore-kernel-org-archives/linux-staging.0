Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4690471
	for <linux-staging@lists.linux.dev>; Sat, 17 Apr 2021 18:01:12 +0000 (UTC)
Received: from ipservice-092-217-095-235.092.217.pools.vodafone-ip.de ([92.217.95.235] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lXpFm-0002pi-FE; Sat, 17 Apr 2021 20:01:10 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: rtl8188eu: remove unused function parameters
Date: Sat, 17 Apr 2021 20:00:37 +0200
Message-Id: <20210417180037.17806-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417180037.17806-1-martin@kaiser.cx>
References: <20210417180037.17806-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Enable and Linked parameters of _BeaconFunctionEnable are not used.
Remove them.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index abe58cf2de16..80cdcf6f7879 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -574,8 +574,7 @@ static void _InitBeaconParameters(struct adapter *Adapter)
 	haldata->RegCR_1 = usb_read8(Adapter, REG_CR + 1);
 }
 
-static void _BeaconFunctionEnable(struct adapter *Adapter,
-				  bool Enable, bool Linked)
+static void _BeaconFunctionEnable(struct adapter *Adapter)
 {
 	usb_write8(Adapter, REG_BCN_CTRL, (BIT(4) | BIT(3) | BIT(1)));
 
@@ -1961,7 +1960,7 @@ void beacon_timing_control(struct adapter *adapt)
 	usb_write8(adapt,  REG_RXTSF_OFFSET_CCK, 0x50);
 	usb_write8(adapt, REG_RXTSF_OFFSET_OFDM, 0x50);
 
-	_BeaconFunctionEnable(adapt, true, true);
+	_BeaconFunctionEnable(adapt);
 
 	ResumeTxBeacon(adapt);
 
-- 
2.20.1

