Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB083FE1
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 20:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655326284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOGsHPFBbgfyOB5YS/i0tFlmJ7V8OIZ658LY9rBpbto=;
	b=F3xBeiaCC0j7ZTGb4Z7szmkHitOQ+3uXzxJ3awrATi2U+s0mPmk9aOo+Y3hSooNlcKxj5m
	tJTNLpIrC+qv0yiUjje3kNAzGExU60VA0wOL9c5ZehaIY57r4chQ05knyuCMq1mml5fCMe
	fgaiYGhm6gxbw4TTypPDc2MI0t3YUcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-l3uU4SPyNC2ApwDolR1Xsw-1; Wed, 15 Jun 2022 16:51:08 -0400
X-MC-Unique: l3uU4SPyNC2ApwDolR1Xsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C711101E166;
	Wed, 15 Jun 2022 20:51:07 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3A271131D;
	Wed, 15 Jun 2022 20:51:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 15/40] media: atomisp: drop hmm_page_type
Date: Wed, 15 Jun 2022 22:50:12 +0200
Message-Id: <20220615205037.16549-16-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5

Since the hmm-pool code has been removed this now always gets set
to HMM_PAGE_TYPE_GENERAL, so just remove it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  7 ----
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 42 +++++++------------
 2 files changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index b9bae51e3814..1e9ccfd64c00 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -81,12 +81,6 @@ enum hmm_bo_type {
 	HMM_BO_LAST,
 };
 
-enum hmm_page_type {
-	HMM_PAGE_TYPE_RESERVED,
-	HMM_PAGE_TYPE_DYNAMIC,
-	HMM_PAGE_TYPE_GENERAL,
-};
-
 #define	HMM_BO_MASK		0x1
 #define	HMM_BO_FREE		0x0
 #define	HMM_BO_ALLOCED	0x1
@@ -123,7 +117,6 @@ struct hmm_bo_device {
 
 struct hmm_page_object {
 	struct page		*page;
-	enum hmm_page_type	type;
 };
 
 struct hmm_buffer_object {
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0118c0b5acc8..1f0e62182fa3 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -631,32 +631,22 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 	int i, ret;
 
 	for (i = 0; i < free_pgnr; i++) {
-		switch (bo->page_obj[i].type) {
-		case HMM_PAGE_TYPE_RESERVED:
-			break;
-		case HMM_PAGE_TYPE_DYNAMIC:
-		case HMM_PAGE_TYPE_GENERAL:
-		default:
-			ret = set_pages_wb(bo->page_obj[i].page, 1);
-			if (ret)
-				dev_err(atomisp_dev,
-					"set page to WB err ...ret = %d\n",
-					ret);
-			/*
-			W/A: set_pages_wb seldom return value = -EFAULT
-			indicate that address of page is not in valid
-			range(0xffff880000000000~0xffffc7ffffffffff)
-			then, _free_pages would panic; Do not know why page
-			address be valid,it maybe memory corruption by lowmemory
-			*/
-			if (!ret) {
-				__free_pages(bo->page_obj[i].page, 0);
-			}
-			break;
+		ret = set_pages_wb(bo->page_obj[i].page, 1);
+		if (ret)
+			dev_err(atomisp_dev,
+				"set page to WB err ...ret = %d\n",
+				ret);
+		/*
+		W/A: set_pages_wb seldom return value = -EFAULT
+		indicate that address of page is not in valid
+		range(0xffff880000000000~0xffffc7ffffffffff)
+		then, _free_pages would panic; Do not know why page
+		address be valid,it maybe memory corruption by lowmemory
+		*/
+		if (!ret) {
+			__free_pages(bo->page_obj[i].page, 0);
 		}
 	}
-
-	return;
 }
 
 /*Allocate pages which will be used only by ISP*/
@@ -755,9 +745,8 @@ static int alloc_private_pages(struct hmm_buffer_object *bo,
 				}
 			}
 
-			for (j = 0; j < blk_pgnr; j++) {
+			for (j = 0; j < blk_pgnr; j++, i++) {
 				bo->page_obj[i].page = pages + j;
-				bo->page_obj[i++].type = HMM_PAGE_TYPE_GENERAL;
 			}
 
 			pgnr -= blk_pgnr;
@@ -878,7 +867,6 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 
 	for (i = 0; i < bo->pgnr; i++) {
 		bo->page_obj[i].page = pages[i];
-		bo->page_obj[i].type = HMM_PAGE_TYPE_GENERAL;
 	}
 
 	return 0;
-- 
2.36.0

