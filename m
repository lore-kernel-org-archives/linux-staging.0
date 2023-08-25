Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE639621
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 01:52:45 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RX2wn1vJczrSgq;
	Fri, 25 Aug 2023 09:51:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 09:52:37 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <gregkh@linuxfoundation.org>, <philipp.g.hortmann@gmail.com>,
	<straube.linux@gmail.com>, <Larry.Finger@lwfinger.net>,
	<wlanfae@realtek.com>, <mikem@ring3k.org>, <seanm@seanm.ca>,
	<linux-staging@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 3/3] Staging: rtl8192e: rtllib_softmac: Do not call kfree_skb() under spin_lock_irqsave()
Date: Fri, 25 Aug 2023 09:52:13 +0800
Message-ID: <20230825015213.2697347-4-ruanjinjie@huawei.com>
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

Fixes: 94a799425eee ("From: wlanfae <wlanfae@realtek.com> [PATCH 1/8] rtl8192e: Import new version of driver from realtek")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Update the commit title and subject prefix.
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 0e52b207942d..398fb354d342 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2353,8 +2353,10 @@ void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee)
 	unsigned long flags;
 	int  i;
 	struct cb_desc *tcb_desc = NULL;
+	struct sk_buff_head free_list;
 	unsigned long queue_len = 0;
 
+	skb_queue_head_init(&free_list);
 	spin_lock_irqsave(&ieee->lock, flags);
 
 	/* called with 2nd parm 0, no tx mgmt lock required */
@@ -2382,7 +2384,7 @@ void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee)
 				skb_queue_tail(&ieee->skb_waitQ[queue_index],
 					       txb->fragments[i]);
 			else
-				kfree_skb(txb->fragments[i]);
+				__skb_queue_tail(&free_list, txb->fragments[i]);
 		} else {
 			ieee->softmac_data_hard_start_xmit(
 					txb->fragments[i],
@@ -2393,6 +2395,8 @@ void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee)
 	rtllib_txb_free(txb);
 
 	spin_unlock_irqrestore(&ieee->lock, flags);
+
+	__skb_queue_purge(&free_list);
 }
 
 void rtllib_reset_queue(struct rtllib_device *ieee)
-- 
2.34.1

