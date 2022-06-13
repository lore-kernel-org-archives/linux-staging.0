Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE2F1871
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655149953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4MaMxnDtdOMQQxFKt8xUuklfy1dl88lSymo/fs+Jvpc=;
	b=i4KKfpA9jg0q24MCT/7vJEyQDOGw8jz6byHKgv97rYv602wdQwX6sj4I6rl9eScf5Yk90s
	bFK7yXN3l0GeC+bkV9CUknkYDVkeAPV5Q1aX1/guCDqVD+1YIDQbupM1bYOp+ri8W+a9Ic
	cGJyJtwo+bFBhBxyfiN5LBCq+VXXpVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-OQkV0nbLOc6Ztu6ZQDAnYA-1; Mon, 13 Jun 2022 15:52:26 -0400
X-MC-Unique: OQkV0nbLOc6Ztu6ZQDAnYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3762F85A580;
	Mon, 13 Jun 2022 19:52:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95A622166B26;
	Mon, 13 Jun 2022 19:52:24 +0000 (UTC)
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
	linux-staging@lists.linux.dev
Subject: [PATCH 26/40] media: atomisp: drop unused ATOMISP_MAP_FLAG_* flags
Date: Mon, 13 Jun 2022 21:51:23 +0200
Message-Id: <20220613195137.8117-27-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

Drop the ATOMISP_MAP_FLAG_CACHED flag, it is never set anywhere;
also drop the matching "cached" parameter to hmm[_bo]_alloc which
value was derived form the never set flag.

Drop the ATOMISP_MAP_FLAG_NOFLUSH, it is not used anywhere.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  2 +-
 .../media/atomisp/include/linux/atomisp.h     |  3 --
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  7 ++---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 31 +++++++++----------
 4 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index 654e329b7a6b..44eb4d3039f5 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -221,7 +221,7 @@ int hmm_bo_allocated(struct hmm_buffer_object *bo);
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type, int from_highmem,
-		       const void __user *userptr, bool cached);
+		       const void __user *userptr);
 void hmm_bo_free_pages(struct hmm_buffer_object *bo);
 int hmm_bo_page_allocated(struct hmm_buffer_object *bo);
 
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 752c09e64a5d..f96f5adbd9de 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -825,9 +825,6 @@ struct atomisp_s_runmode {
 	__u32 mode;
 };
 
-#define ATOMISP_MAP_FLAG_NOFLUSH	0x0001	/* Do not flush cache */
-#define ATOMISP_MAP_FLAG_CACHED		0x0002	/* Enable cache */
-
 struct atomisp_update_exposure {
 	unsigned int gain;
 	unsigned int digi_gain;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 5fd29dbab9cd..7de941d2c40a 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -174,7 +174,6 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 {
 	unsigned int pgnr;
 	struct hmm_buffer_object *bo;
-	bool cached = attrs & ATOMISP_MAP_FLAG_CACHED;
 	int ret;
 
 	/*
@@ -195,7 +194,7 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	}
 
 	/* Allocate pages for memory */
-	ret = hmm_bo_alloc_pages(bo, type, from_highmem, userptr, cached);
+	ret = hmm_bo_alloc_pages(bo, type, from_highmem, userptr);
 	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_alloc_pages failed.\n");
 		goto alloc_page_err;
@@ -209,8 +208,8 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	}
 
 	dev_dbg(atomisp_dev,
-		"%s: pages: 0x%08x (%zu bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
-		__func__, bo->start, bytes, type, from_highmem, userptr, cached);
+		"%s: pages: 0x%08x (%zu bytes), type: %d from highmem %d, user ptr %p\n",
+		__func__, bo->start, bytes, type, from_highmem, userptr);
 
 	return bo->start;
 
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 72124a38c756..357f34fb7aef 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -651,8 +651,7 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 
 /*Allocate pages which will be used only by ISP*/
 static int alloc_private_pages(struct hmm_buffer_object *bo,
-			       int from_highmem,
-			       bool cached)
+			       int from_highmem)
 {
 	int ret;
 	unsigned int pgnr, order, blk_pgnr, alloc_pgnr;
@@ -730,19 +729,17 @@ static int alloc_private_pages(struct hmm_buffer_object *bo,
 		} else {
 			blk_pgnr = order_to_nr(order);
 
-			if (!cached) {
-				/*
-				 * set memory to uncacheable -- UC_MINUS
-				 */
-				ret = set_pages_uc(pages, blk_pgnr);
-				if (ret) {
-					dev_err(atomisp_dev,
-						"set page uncacheablefailed.\n");
+			/*
+			 * set memory to uncacheable -- UC_MINUS
+			 */
+			ret = set_pages_uc(pages, blk_pgnr);
+			if (ret) {
+				dev_err(atomisp_dev,
+					"set page uncacheablefailed.\n");
 
-					__free_pages(pages, order);
+				__free_pages(pages, order);
 
-					goto cleanup;
-				}
+				goto cleanup;
 			}
 
 			for (j = 0; j < blk_pgnr; j++, i++) {
@@ -797,7 +794,7 @@ static void free_user_pages(struct hmm_buffer_object *bo,
  * Convert user space virtual address into pages list
  */
 static int alloc_user_pages(struct hmm_buffer_object *bo,
-			    const void __user *userptr, bool cached)
+			    const void __user *userptr)
 {
 	int page_nr;
 	int i;
@@ -895,7 +892,7 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
  */
 int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type, int from_highmem,
-		       const void __user *userptr, bool cached)
+		       const void __user *userptr)
 {
 	int ret = -EINVAL;
 
@@ -909,9 +906,9 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	 * add HMM_BO_USER type
 	 */
 	if (type == HMM_BO_PRIVATE) {
-		ret = alloc_private_pages(bo, from_highmem, cached);
+		ret = alloc_private_pages(bo, from_highmem);
 	} else if (type == HMM_BO_USER) {
-		ret = alloc_user_pages(bo, userptr, cached);
+		ret = alloc_user_pages(bo, userptr);
 	} else {
 		dev_err(atomisp_dev, "invalid buffer type.\n");
 		ret = -EINVAL;
-- 
2.36.0

