Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CEC4404
	for <linux-staging@lists.linux.dev>; Mon,  8 Aug 2022 20:14:42 +0000 (UTC)
Received: from dslb-188-096-136-209.188.096.pools.vodafone-ip.de ([188.96.136.209] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oL98x-0000V9-BU; Mon, 08 Aug 2022 22:14:31 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/5] staging: r8188eu: change all num...Q variables to u8
Date: Mon,  8 Aug 2022 22:14:03 +0200
Message-Id: <20220808201405.68966-4-martin@kaiser.cx>
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

All of numPubQ, numHQ and numLQ variables store only u8 values. Change
their types to u8. We can then simplify the REG_RQPN expression. The
macros and the temporary variable are not needed any more.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c       | 10 ++++------
 drivers/staging/r8188eu/include/rtl8188e_spec.h |  4 ----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 18465e5ce9cc..25fd6b46e76d 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -154,11 +154,10 @@ static void _InitQueueReservedPage(struct adapter *Adapter)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
 	struct registry_priv	*pregistrypriv = &Adapter->registrypriv;
-	u32 numHQ	= 0;
-	u32 numLQ	= 0;
+	u8 numHQ = 0;
+	u8 numLQ = 0;
 	u8 numNQ = 0;
-	u32 numPubQ;
-	u32 value32;
+	u8 numPubQ;
 
 	if (pregistrypriv->wifi_spec) {
 		if (haldata->OutEpQueueSel & TX_SELE_HQ)
@@ -176,8 +175,7 @@ static void _InitQueueReservedPage(struct adapter *Adapter)
 		numPubQ = 0xA8 - numHQ - numLQ - numNQ;
 
 		/*  TX DMA */
-		value32 = _HPQ(numHQ) | _LPQ(numLQ) | _PUBQ(numPubQ) | LD_RQPN;
-		rtw_write32(Adapter, REG_RQPN, value32);
+		rtw_write32(Adapter, REG_RQPN, LD_RQPN | numPubQ << 16 | numLQ << 8 | numHQ);
 	} else {
 		rtw_write16(Adapter, REG_RQPN_NPQ, 0x0000);/* Just follow MP Team,??? Georgia 03/28 */
 		rtw_write16(Adapter, REG_RQPN_NPQ, 0x0d);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index d9a85fd13230..011da538df5f 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -924,10 +924,6 @@ Current IOREG MAP
 #define _LLT_OP_VALUE(x)		(((x) >> 30) & 0x3)
 
 /* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
-/* 2RQPN */
-#define _HPQ(x)				((x) & 0xFF)
-#define _LPQ(x)				(((x) & 0xFF) << 8)
-#define _PUBQ(x)			(((x) & 0xFF) << 16)
 
 #define HPQ_PUBLIC_DIS			BIT(24)
 #define LPQ_PUBLIC_DIS			BIT(25)
-- 
2.30.2

