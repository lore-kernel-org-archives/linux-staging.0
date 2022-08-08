Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF357A
	for <linux-staging@lists.linux.dev>; Mon,  8 Aug 2022 20:14:43 +0000 (UTC)
Received: from dslb-188-096-136-209.188.096.pools.vodafone-ip.de ([188.96.136.209] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oL98z-0000V9-54; Mon, 08 Aug 2022 22:14:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: the high prio queue is always selected
Date: Mon,  8 Aug 2022 22:14:05 +0200
Message-Id: <20220808201405.68966-6-martin@kaiser.cx>
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

The high priority queue is always selected, regardless of the number of
out endpoints.

Therefore, haldata->OutEpQueueSel & TX_SELE_HQ is always true. We can
remove the check and use a define instead of the numHQ variable.

This check was the last user of TX_SELE_HQ. Rename haldata->OutEpQueueSel
to haldata->out_ep_extra_queues and store only the queues that are selected
in addition to the high priority queue.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c       | 17 ++++++-----------
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  3 +--
 drivers/staging/r8188eu/include/rtl8188e_spec.h |  2 ++
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 25fd6b46e76d..63c5cec655d5 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -69,15 +69,14 @@ int rtl8188eu_interface_configure(struct adapter *adapt)
 
 	switch (pdvobjpriv->RtNumOutPipes) {
 	case 3:
-		haldata->OutEpQueueSel = TX_SELE_HQ | TX_SELE_LQ | TX_SELE_NQ;
+		haldata->out_ep_extra_queues = TX_SELE_LQ | TX_SELE_NQ;
 		three_out_pipe(adapt, wifi_cfg);
 		break;
 	case 2:
-		haldata->OutEpQueueSel = TX_SELE_HQ | TX_SELE_NQ;
+		haldata->out_ep_extra_queues = TX_SELE_NQ;
 		two_out_pipe(adapt, wifi_cfg);
 		break;
 	case 1:
-		haldata->OutEpQueueSel = TX_SELE_HQ;
 		one_out_pipe(adapt);
 		break;
 	default:
@@ -154,28 +153,24 @@ static void _InitQueueReservedPage(struct adapter *Adapter)
 {
 	struct hal_data_8188e *haldata = &Adapter->haldata;
 	struct registry_priv	*pregistrypriv = &Adapter->registrypriv;
-	u8 numHQ = 0;
 	u8 numLQ = 0;
 	u8 numNQ = 0;
 	u8 numPubQ;
 
 	if (pregistrypriv->wifi_spec) {
-		if (haldata->OutEpQueueSel & TX_SELE_HQ)
-			numHQ =  0x29;
-
-		if (haldata->OutEpQueueSel & TX_SELE_LQ)
+		if (haldata->out_ep_extra_queues & TX_SELE_LQ)
 			numLQ = 0x1C;
 
 		/*  NOTE: This step shall be proceed before writing REG_RQPN. */
-		if (haldata->OutEpQueueSel & TX_SELE_NQ)
+		if (haldata->out_ep_extra_queues & TX_SELE_NQ)
 			numNQ = 0x1C;
 
 		rtw_write8(Adapter, REG_RQPN_NPQ, numNQ);
 
-		numPubQ = 0xA8 - numHQ - numLQ - numNQ;
+		numPubQ = 0xA8 - NUM_HQ - numLQ - numNQ;
 
 		/*  TX DMA */
-		rtw_write32(Adapter, REG_RQPN, LD_RQPN | numPubQ << 16 | numLQ << 8 | numHQ);
+		rtw_write32(Adapter, REG_RQPN, LD_RQPN | numPubQ << 16 | numLQ << 8 | NUM_HQ);
 	} else {
 		rtw_write16(Adapter, REG_RQPN_NPQ, 0x0000);/* Just follow MP Team,??? Georgia 03/28 */
 		rtw_write16(Adapter, REG_RQPN_NPQ, 0x0d);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index ff0a4ce19dde..64cdc2fad20e 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -36,7 +36,6 @@
       0x2400 /* 9k for 88E nornal chip , MaxRxBuff=10k-max(TxReportSize(64*8),
 	      * WOLPattern(16*24)) */
 
-#define TX_SELE_HQ			BIT(0)		/*  High Queue */
 #define TX_SELE_LQ			BIT(1)		/*  Low Queue */
 #define TX_SELE_NQ			BIT(2)		/*  Normal Queue */
 
@@ -149,7 +148,7 @@ struct hal_data_8188e {
 	u8	AntDivCfg;
 	u8	TRxAntDivType;
 
-	u8	OutEpQueueSel;
+	u8	out_ep_extra_queues;
 
 	struct P2P_PS_Offload_t	p2p_ps_offload;
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index 5d12ba46e205..e34619140e33 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -925,6 +925,8 @@ Current IOREG MAP
 
 /* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
 
+#define NUM_HQ 0x29
+
 #define LD_RQPN				BIT(31)
 
 /* 2TDECTRL */
-- 
2.30.2

