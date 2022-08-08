Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FDF7A
	for <linux-staging@lists.linux.dev>; Mon,  8 Aug 2022 20:14:41 +0000 (UTC)
Received: from dslb-188-096-136-209.188.096.pools.vodafone-ip.de ([188.96.136.209] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oL98w-0000V9-CX; Mon, 08 Aug 2022 22:14:30 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/5] staging: r8188eu: make numNQ a u8
Date: Mon,  8 Aug 2022 22:14:02 +0200
Message-Id: <20220808201405.68966-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808201405.68966-1-martin@kaiser.cx>
References: <20220808201405.68966-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The numNQ variable in _InitQueueReservedPage is defined as u32. It is
either set to 0 or to 0x1C. Change its type to u8 and remove the code that
casts the u32 value to u8.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c       | 7 +++----
 drivers/staging/r8188eu/include/rtl8188e_spec.h | 2 --
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index b63f5bb21017..18465e5ce9cc 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -156,10 +156,9 @@ static void _InitQueueReservedPage(struct adapter *Adapter)
 	struct registry_priv	*pregistrypriv = &Adapter->registrypriv;
 	u32 numHQ	= 0;
 	u32 numLQ	= 0;
-	u32 numNQ	= 0;
+	u8 numNQ = 0;
 	u32 numPubQ;
 	u32 value32;
-	u8 value8;
 
 	if (pregistrypriv->wifi_spec) {
 		if (haldata->OutEpQueueSel & TX_SELE_HQ)
@@ -171,8 +170,8 @@ static void _InitQueueReservedPage(struct adapter *Adapter)
 		/*  NOTE: This step shall be proceed before writing REG_RQPN. */
 		if (haldata->OutEpQueueSel & TX_SELE_NQ)
 			numNQ = 0x1C;
-		value8 = (u8)_NPQ(numNQ);
-		rtw_write8(Adapter, REG_RQPN_NPQ, value8);
+
+		rtw_write8(Adapter, REG_RQPN_NPQ, numNQ);
 
 		numPubQ = 0xA8 - numHQ - numLQ - numNQ;
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index 9e7b1f89037c..d9a85fd13230 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -928,8 +928,6 @@ Current IOREG MAP
 #define _HPQ(x)				((x) & 0xFF)
 #define _LPQ(x)				(((x) & 0xFF) << 8)
 #define _PUBQ(x)			(((x) & 0xFF) << 16)
-/*  NOTE: in RQPN_NPQ register */
-#define _NPQ(x)				((x) & 0xFF)
 
 #define HPQ_PUBLIC_DIS			BIT(24)
 #define LPQ_PUBLIC_DIS			BIT(25)
-- 
2.30.2

