Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD47621
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 01:52:37 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RX2wl3978z1L9ZT;
	Fri, 25 Aug 2023 09:51:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 09:52:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <gregkh@linuxfoundation.org>, <philipp.g.hortmann@gmail.com>,
	<straube.linux@gmail.com>, <Larry.Finger@lwfinger.net>,
	<wlanfae@realtek.com>, <mikem@ring3k.org>, <seanm@seanm.ca>,
	<linux-staging@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 1/3] staging: rtl8192e: rtl_core: Call dev_kfree_skb_irq() instead of kfree_skb() under spin_lock_irqsave()
Date: Fri, 25 Aug 2023 09:52:11 +0800
Message-ID: <20230825015213.2697347-2-ruanjinjie@huawei.com>
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
context or with hardware interrupts being disabled.
So replace kfree_skb() with dev_kfree_skb_irq() under
spin_lock_irqsave(). Compile tested only.

Fixes: 94a799425eee ("From: wlanfae <wlanfae@realtek.com> [PATCH 1/8] rtl8192e: Import new version of driver from realtek")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Larry Finger <Larry.Finger@lwfinger.net>
---
v2:
- Update the commit title and subject prefix.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 50eb8f3494ec..5a613b116925 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1663,7 +1663,7 @@ void rtl92e_reset_desc_ring(struct net_device *dev)
 				dma_unmap_single(&priv->pdev->dev,
 						 entry->TxBuffAddr, skb->len,
 						 DMA_TO_DEVICE);
-				kfree_skb(skb);
+				dev_kfree_skb_irq(skb);
 				ring->idx = (ring->idx + 1) % ring->entries;
 			}
 			ring->idx = 0;
-- 
2.34.1

