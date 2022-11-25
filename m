Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B410D23D8
	for <linux-staging@lists.linux.dev>; Fri, 25 Nov 2022 08:39:17 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJSv51yLRzmWBx;
	Fri, 25 Nov 2022 16:38:41 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 25 Nov
 2022 16:39:15 +0800
From: Yuan Can <yuancan@huawei.com>
To: <gregkh@linuxfoundation.org>, <horms+renesas@verge.net.au>,
	<damm+renesas@opensource.se>, <linux-staging@lists.linux.dev>
CC: <yuancan@huawei.com>
Subject: [PATCH] staging: emxx_udc: Add checks for dma_alloc_coherent()
Date: Fri, 25 Nov 2022 08:37:11 +0000
Message-ID: <20221125083711.1837-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected

As the dma_alloc_coherent() may return NULL, the return value needs to be
checked to avoid NULL poineter dereference.

Fixes: 33aa8d45a4fe ("staging: emxx_udc: Add Emma Mobile USB Gadget driver")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/staging/emxx_udc/emxx_udc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index b6abd3770e81..3c0c9c5eb733 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2594,6 +2594,10 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
 			ep->virt_buf = dma_alloc_coherent(udc->dev, PAGE_SIZE,
 							  &ep->phys_buf,
 							  GFP_ATOMIC | GFP_DMA);
+		if (!ep->virt_buf) {
+			spin_unlock_irqrestore(&udc->lock, flags);
+			return -ENOMEM;
+		}
 		if (ep->epnum > 0)  {
 			if (ep->direct == USB_DIR_IN)
 				memcpy(ep->virt_buf, req->req.buf,
-- 
2.17.1

