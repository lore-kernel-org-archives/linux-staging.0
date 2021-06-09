Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4770
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 07:15:17 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G0JCY72S6zWtG7;
	Wed,  9 Jun 2021 15:10:17 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 15:15:01 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 9 Jun 2021
 15:15:00 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Sakari Ailus" <sakari.ailus@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Kaixu Xia <kaixuxia@tencent.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
	<yangjihong1@huawei.com>, <yukuai3@huawei.com>, <libaokun1@huawei.com>,
	<linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] media: staging: atomisp: use list_move_tail instead of list_del/list_add_tail in atomisp_compat_css20.c
Date: Wed, 9 Jun 2021 15:24:09 +0800
Message-ID: <20210609072409.1357327-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected

Using list_move_tail() instead of list_del() + list_add_tail() in atomisp_compat_css20.c.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
V1->V2:
	CC mailist

 .../pci/atomisp_compat_css20.c        | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index f60198bb8a1a..3bd4c616655d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2147,22 +2147,19 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 	while (!list_empty(&asd->s3a_stats_in_css)) {
 		s3a_buf = list_entry(asd->s3a_stats_in_css.next,
 				     struct atomisp_s3a_buf, list);
-		list_del(&s3a_buf->list);
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
+		list_move_tail(&s3a_buf->list, &asd->s3a_stats);
 	}
 	while (!list_empty(&asd->s3a_stats_ready)) {
 		s3a_buf = list_entry(asd->s3a_stats_ready.next,
 				     struct atomisp_s3a_buf, list);
-		list_del(&s3a_buf->list);
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
+		list_move_tail(&s3a_buf->list, &asd->s3a_stats);
 	}
 
 	spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
 	while (!list_empty(&asd->dis_stats_in_css)) {
 		dis_buf = list_entry(asd->dis_stats_in_css.next,
 				     struct atomisp_dis_buf, list);
-		list_del(&dis_buf->list);
-		list_add_tail(&dis_buf->list, &asd->dis_stats);
+		list_move_tail(&dis_buf->list, &asd->dis_stats);
 	}
 	asd->params.dis_proj_data_valid = false;
 	spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
@@ -2171,14 +2168,12 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 		while (!list_empty(&asd->metadata_in_css[i])) {
 			md_buf = list_entry(asd->metadata_in_css[i].next,
 					    struct atomisp_metadata_buf, list);
-			list_del(&md_buf->list);
-			list_add_tail(&md_buf->list, &asd->metadata[i]);
+			list_move_tail(&md_buf->list, &asd->metadata[i]);
 		}
 		while (!list_empty(&asd->metadata_ready[i])) {
 			md_buf = list_entry(asd->metadata_ready[i].next,
 					    struct atomisp_metadata_buf, list);
-			list_del(&md_buf->list);
-			list_add_tail(&md_buf->list, &asd->metadata[i]);
+			list_move_tail(&md_buf->list, &asd->metadata[i]);
 		}
 	}
 

