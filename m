Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D52193
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 02:36:45 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ny68H1mmRzqV74;
	Thu, 19 Jan 2023 10:31:43 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Jan
 2023 10:36:37 +0800
From: Yuan Can <yuancan@huawei.com>
To: <gregkh@linuxfoundation.org>, <drv@mailo.com>,
	<damm+renesas@opensource.se>, <horms+renesas@verge.net.au>,
	<linux-staging@lists.linux.dev>
CC: <yuancan@huawei.com>
Subject: [PATCH v2] staging: emxx_udc: Add checks for dma_alloc_coherent()
Date: Thu, 19 Jan 2023 02:34:30 +0000
Message-ID: <20230119023430.95919-1-yuancan@huawei.com>
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

As the dma_alloc_coherent may return NULL, the return value needs to be
checked to avoid NULL poineter dereference.

Fixes: 33aa8d45a4fe ("staging: emxx_udc: Add Emma Mobile USB Gadget driver")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
changes in v2:
- do the null pointer check right before the memcpy().

 drivers/staging/emxx_udc/emxx_udc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index b4e19174bef2..4fce1a9a659c 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2592,9 +2592,15 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
 							  &ep->phys_buf,
 							  GFP_ATOMIC | GFP_DMA);
 		if (ep->epnum > 0)  {
-			if (ep->direct == USB_DIR_IN)
-				memcpy(ep->virt_buf, req->req.buf,
-				       req->req.length);
+			if (ep->direct == USB_DIR_IN) {
+				if (!ep->virt_buf) {
+					spin_unlock_irqrestore(&udc->lock,
+							       flags);
+					return -ENOMEM;
+				} else
+					memcpy(ep->virt_buf, req->req.buf,
+					       req->req.length);
+			}
 		}
 	}
 
-- 
2.17.1

