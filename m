Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE820F05
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 07:15:07 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVy7H1mYgzNnDn;
	Wed, 23 Aug 2023 15:11:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 15:14:57 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux-staging@lists.linux.dev>, <alexondunkan@gmail.com>, Martyn Welch
	<martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] staging: vme_user: Use list_for_each_entry() helper
Date: Wed, 23 Aug 2023 15:14:37 +0800
Message-ID: <20230823071437.450460-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Convert list_for_each() to list_for_each_entry() so that the
slave/master/dma/handler/lm_pos list_head pointer and list_entry()
call are no longer needed, which can reduce a few lines
of code. No functional changed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/staging/vme_user/vme.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5eb0d780c77f..cc8ead48a4e0 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -282,7 +282,6 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 				       u32 cycle)
 {
 	struct vme_bridge *bridge;
-	struct list_head *slave_pos = NULL;
 	struct vme_slave_resource *allocated_image = NULL;
 	struct vme_slave_resource *slave_image = NULL;
 	struct vme_resource *resource = NULL;
@@ -294,10 +293,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 	}
 
 	/* Loop through slave resources */
-	list_for_each(slave_pos, &bridge->slave_resources) {
-		slave_image = list_entry(slave_pos,
-					 struct vme_slave_resource, list);
-
+	list_for_each_entry(slave_image, &bridge->slave_resources, list) {
 		if (!slave_image) {
 			printk(KERN_ERR "Registered NULL Slave resource\n");
 			continue;
@@ -483,7 +479,6 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 					u32 cycle, u32 dwidth)
 {
 	struct vme_bridge *bridge;
-	struct list_head *master_pos = NULL;
 	struct vme_master_resource *allocated_image = NULL;
 	struct vme_master_resource *master_image = NULL;
 	struct vme_resource *resource = NULL;
@@ -495,10 +490,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 	}
 
 	/* Loop through master resources */
-	list_for_each(master_pos, &bridge->master_resources) {
-		master_image = list_entry(master_pos,
-					  struct vme_master_resource, list);
-
+	list_for_each_entry(master_image, &bridge->master_resources, list) {
 		if (!master_image) {
 			printk(KERN_WARNING "Registered NULL master resource\n");
 			continue;
@@ -860,7 +852,6 @@ EXPORT_SYMBOL(vme_master_free);
 struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 {
 	struct vme_bridge *bridge;
-	struct list_head *dma_pos = NULL;
 	struct vme_dma_resource *allocated_ctrlr = NULL;
 	struct vme_dma_resource *dma_ctrlr = NULL;
 	struct vme_resource *resource = NULL;
@@ -875,9 +866,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	}
 
 	/* Loop through DMA resources */
-	list_for_each(dma_pos, &bridge->dma_resources) {
-		dma_ctrlr = list_entry(dma_pos,
-				       struct vme_dma_resource, list);
+	list_for_each_entry(dma_ctrlr, &bridge->dma_resources, list) {
 		if (!dma_ctrlr) {
 			printk(KERN_ERR "Registered NULL DMA resource\n");
 			continue;
@@ -1245,14 +1234,11 @@ EXPORT_SYMBOL(vme_dma_free);
 void vme_bus_error_handler(struct vme_bridge *bridge,
 			   unsigned long long address, int am)
 {
-	struct list_head *handler_pos = NULL;
 	struct vme_error_handler *handler;
 	int handler_triggered = 0;
 	u32 aspace = vme_get_aspace(am);
 
-	list_for_each(handler_pos, &bridge->vme_error_handlers) {
-		handler = list_entry(handler_pos, struct vme_error_handler,
-				     list);
+	list_for_each_entry(handler, &bridge->vme_error_handlers, list) {
 		if ((aspace == handler->aspace) &&
 		    (address >= handler->start) &&
 		    (address < handler->end)) {
@@ -1465,7 +1451,6 @@ EXPORT_SYMBOL(vme_irq_generate);
 struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 {
 	struct vme_bridge *bridge;
-	struct list_head *lm_pos = NULL;
 	struct vme_lm_resource *allocated_lm = NULL;
 	struct vme_lm_resource *lm = NULL;
 	struct vme_resource *resource = NULL;
@@ -1477,9 +1462,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 	}
 
 	/* Loop through LM resources */
-	list_for_each(lm_pos, &bridge->lm_resources) {
-		lm = list_entry(lm_pos,
-				struct vme_lm_resource, list);
+	list_for_each_entry(lm, &bridge->lm_resources, list) {
 		if (!lm) {
 			printk(KERN_ERR "Registered NULL Location Monitor resource\n");
 			continue;
-- 
2.34.1

