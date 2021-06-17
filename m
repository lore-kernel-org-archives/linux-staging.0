Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9023971
	for <linux-staging@lists.linux.dev>; Thu, 17 Jun 2021 14:00:41 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G5Nrj5bfZz6yTd;
	Thu, 17 Jun 2021 21:56:37 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 22:00:30 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 17 Jun
 2021 22:00:29 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <libaokun1@huawei.com>, <mchehab@kernel.org>,
	<sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<andriy.shevchenko@linux.intel.com>, <kaixuxia@tencent.com>,
	<gustavoars@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
	<yangjihong1@huawei.com>, <yukuai3@huawei.com>, Hulk Robot
	<hulkci@huawei.com>
Subject: [PATCH -next v6] media: staging: atomisp: use list_splice_init in atomisp_compat_css20.c
Date: Thu, 17 Jun 2021 22:09:26 +0800
Message-ID: <20210617140926.887680-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected


Using list_splice_init() instead of entire while-loops
in atomisp_compat_css20.c.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
V1->V2:
        CC mailist
V2->V3:
        Using list_move_tail() -> Using list_splice_init()
V3->V4:
        Remove redundant 'asd->'
V4->V5:
        Add the version information for 'V3->V4:'
V5->V6:
        Remove unused variable 'md_buf','dis_buf','s3a_buf'

 .../media/atomisp/pci/atomisp_compat_css20.c  | 38 +++----------------
 1 file changed, 5 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index f60198bb8a1a..99a632f33d2d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2102,9 +2102,6 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 		      enum ia_css_pipe_id pipe_id, bool in_reset)
 {
 	struct atomisp_device *isp = asd->isp;
-	struct atomisp_s3a_buf *s3a_buf;
-	struct atomisp_dis_buf *dis_buf;
-	struct atomisp_metadata_buf *md_buf;
 	unsigned long irqflags;
 	unsigned int i;
 
@@ -2144,42 +2141,17 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 	}
 
 	/* move stats buffers to free queue list */
-	while (!list_empty(&asd->s3a_stats_in_css)) {
-		s3a_buf = list_entry(asd->s3a_stats_in_css.next,
-				     struct atomisp_s3a_buf, list);
-		list_del(&s3a_buf->list);
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-	}
-	while (!list_empty(&asd->s3a_stats_ready)) {
-		s3a_buf = list_entry(asd->s3a_stats_ready.next,
-				     struct atomisp_s3a_buf, list);
-		list_del(&s3a_buf->list);
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-	}
+	list_splice_init(&asd->s3a_stats_in_css, &asd->s3a_stats);
+	list_splice_init(&asd->s3a_stats_ready, &asd->s3a_stats);
 
 	spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
-	while (!list_empty(&asd->dis_stats_in_css)) {
-		dis_buf = list_entry(asd->dis_stats_in_css.next,
-				     struct atomisp_dis_buf, list);
-		list_del(&dis_buf->list);
-		list_add_tail(&dis_buf->list, &asd->dis_stats);
-	}
+	list_splice_init(&asd->dis_stats_in_css, &asd->dis_stats);
 	asd->params.dis_proj_data_valid = false;
 	spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 
 	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
-		while (!list_empty(&asd->metadata_in_css[i])) {
-			md_buf = list_entry(asd->metadata_in_css[i].next,
-					    struct atomisp_metadata_buf, list);
-			list_del(&md_buf->list);
-			list_add_tail(&md_buf->list, &asd->metadata[i]);
-		}
-		while (!list_empty(&asd->metadata_ready[i])) {
-			md_buf = list_entry(asd->metadata_ready[i].next,
-					    struct atomisp_metadata_buf, list);
-			list_del(&md_buf->list);
-			list_add_tail(&md_buf->list, &asd->metadata[i]);
-		}
+		list_splice_init(&asd->metadata_in_css[i], &asd->metadata[i]);
+		list_splice_init(&asd->metadata_ready[i], &asd->metadata[i]);
 	}
 
 	atomisp_flush_params_queue(&asd->video_out_capture);
-- 
2.31.1

