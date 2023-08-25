Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34800642
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 01:52:38 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RX2vt0BJ9zVkWY;
	Fri, 25 Aug 2023 09:50:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 09:52:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <gregkh@linuxfoundation.org>, <philipp.g.hortmann@gmail.com>,
	<straube.linux@gmail.com>, <Larry.Finger@lwfinger.net>,
	<wlanfae@realtek.com>, <mikem@ring3k.org>, <seanm@seanm.ca>,
	<linux-staging@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 2/3] staging: rtl8192e: rtl_core: Do not call kfree_skb() under spin_lock_irqsave() for _rtl92e_irq()
Date: Fri, 25 Aug 2023 09:52:12 +0800
Message-ID: <20230825015213.2697347-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825015213.2697347-1-ruanjinjie@huawei.com>
References: <20230825015213.2697347-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

It is not allowed to call kfree_skb() from hardware interrupt
context or with hardware interrupts being disabled. All the SKBs have
been dequeued from the old queue, so it's safe to enqueue these
SKBs to a free queue, then free them after spin_unlock_irqrestore()
at once. Compile tested only.

Fixes: 3d461c912462 ("rtl8192e: Split into two directories")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Update the commit title and subject prefix.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 22 ++++++++++++--------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 5a613b116925..953a4faa9a49 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1431,7 +1431,7 @@ static int _rtl92e_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	return ret;
 }
 
-static void _rtl92e_tx_isr(struct net_device *dev, int prio)
+static void _rtl92e_tx_isr(struct net_device *dev, struct sk_buff_head *free_list, int prio)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
@@ -1451,7 +1451,7 @@ static void _rtl92e_tx_isr(struct net_device *dev, int prio)
 		dma_unmap_single(&priv->pdev->dev, entry->TxBuffAddr,
 				 skb->len, DMA_TO_DEVICE);
 
-		kfree_skb(skb);
+		__skb_queue_tail(free_list, skb);
 	}
 	if (prio != BEACON_QUEUE)
 		tasklet_schedule(&priv->irq_tx_tasklet);
@@ -1971,12 +1971,14 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 {
 	struct net_device *dev = netdev;
 	struct r8192_priv *priv = rtllib_priv(dev);
+	struct sk_buff_head free_list;
 	unsigned long flags;
 	u32 inta;
 
 	if (priv->irq_enabled == 0)
 		goto done;
 
+	skb_queue_head_init(&free_list);
 	spin_lock_irqsave(&priv->irq_th_lock, flags);
 
 	rtl92e_ack_irq(dev, &inta);
@@ -1997,7 +1999,7 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 	}
 
 	if (inta  & IMR_MGNTDOK) {
-		_rtl92e_tx_isr(dev, MGNT_QUEUE);
+		_rtl92e_tx_isr(dev, &free_list, MGNT_QUEUE);
 		spin_unlock_irqrestore(&priv->irq_th_lock, flags);
 		if (priv->rtllib->ack_tx_to_ieee) {
 			if (_rtl92e_is_tx_queue_empty(dev)) {
@@ -2009,10 +2011,10 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 	}
 
 	if (inta & IMR_COMDOK)
-		_rtl92e_tx_isr(dev, TXCMD_QUEUE);
+		_rtl92e_tx_isr(dev, &free_list, TXCMD_QUEUE);
 
 	if (inta & IMR_HIGHDOK)
-		_rtl92e_tx_isr(dev, HIGH_QUEUE);
+		_rtl92e_tx_isr(dev, &free_list, HIGH_QUEUE);
 
 	if (inta & IMR_ROK)
 		tasklet_schedule(&priv->irq_rx_tasklet);
@@ -2031,26 +2033,28 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 
 	if (inta & IMR_BKDOK) {
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
-		_rtl92e_tx_isr(dev, BK_QUEUE);
+		_rtl92e_tx_isr(dev, &free_list, BK_QUEUE);
 	}
 
 	if (inta & IMR_BEDOK) {
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
-		_rtl92e_tx_isr(dev, BE_QUEUE);
+		_rtl92e_tx_isr(dev, &free_list, BE_QUEUE);
 	}
 
 	if (inta & IMR_VIDOK) {
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
-		_rtl92e_tx_isr(dev, VI_QUEUE);
+		_rtl92e_tx_isr(dev, &free_list, VI_QUEUE);
 	}
 
 	if (inta & IMR_VODOK) {
 		priv->rtllib->link_detect_info.NumTxOkInPeriod++;
-		_rtl92e_tx_isr(dev, VO_QUEUE);
+		_rtl92e_tx_isr(dev, &free_list, VO_QUEUE);
 	}
 
 	spin_unlock_irqrestore(&priv->irq_th_lock, flags);
 
+	__skb_queue_purge(&free_list);
+
 done:
 
 	return IRQ_HANDLED;
-- 
2.34.1

