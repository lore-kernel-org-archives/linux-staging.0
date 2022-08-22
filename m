Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79B5256C
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661180801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TK8RHeppPin3WkyBtzFXwqJrHtqEF0ei6wcnGrb/6/k=;
	b=Zbo2vX1CcY4fHyS/dxjFm/aeILLvJCOAsMwqLuClU2mUbOr7bEBbXyufL4HxR9xvvJQQ5B
	jlVwdraxiLDdxbIn16Kx/83DKlEZmEilgKCyr1HfiN5+vYxdmPj1o3fBrVnLoUFPrgy2+u
	HiSGqkruA1UM/Ejs21QF9YsQ5LEx4Dk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-UGo6M3aOOe6OI8I4iXK2lQ-1; Mon, 22 Aug 2022 11:06:37 -0400
X-MC-Unique: UGo6M3aOOe6OI8I4iXK2lQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43F0C299E769;
	Mon, 22 Aug 2022 15:06:36 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 100F840CF8E8;
	Mon, 22 Aug 2022 15:06:33 +0000 (UTC)
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
Subject: [PATCH v2 10/13] media: atomisp: hmm_bo: Rewrite alloc_private_pages() using pages_array helper funcs
Date: Mon, 22 Aug 2022 17:06:07 +0200
Message-Id: <20220822150610.45186-10-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
References: <20220822150610.45186-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1

Rewrite alloc_private_pages() using pages_array helper funcs.

Note alloc_pages_bulk_array() skips non NULL pages, so switch
the allocating of the pages pointer array to kcalloc to ensure
the pages are initially all set to NULL.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 48 ++++++++-----------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index bb52171a9d87..40b1137dcc31 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -615,6 +615,14 @@ struct hmm_buffer_object *hmm_bo_device_search_vmap_start(
 	return bo;
 }
 
+static void free_pages_bulk_array(unsigned long nr_pages, struct page **page_array)
+{
+	unsigned long i;
+
+	for (i = 0; i < nr_pages; i++)
+		__free_pages(page_array[i], 0);
+}
+
 static void free_private_bo_pages(struct hmm_buffer_object *bo,
 				  int free_pgnr)
 {
@@ -643,38 +651,22 @@ static void free_private_bo_pages(struct hmm_buffer_object *bo,
 static int alloc_private_pages(struct hmm_buffer_object *bo)
 {
 	const gfp_t gfp = __GFP_NOWARN | __GFP_RECLAIM | __GFP_FS;
-	struct page *pages;
-	int i, ret;
-
-	for (i = 0; i < bo->pgnr; i++) {
-		pages = alloc_pages(gfp, 0); // alloc 1 page
-		if (unlikely(!pages)) {
-			dev_err(atomisp_dev,
-				"%s: cannot allocate pages\n",
-				__func__);
-			goto cleanup;
-		} else {
-			/*
-			 * set memory to uncacheable -- UC_MINUS
-			 */
-			ret = set_pages_uc(pages, 1);
-			if (ret) {
-				dev_err(atomisp_dev,
-					"set page uncacheablefailed.\n");
-
-				__free_pages(pages, 0);
+	int ret;
 
-				goto cleanup;
-			}
+	ret = alloc_pages_bulk_array(gfp, bo->pgnr, bo->pages);
+	if (ret != bo->pgnr) {
+		free_pages_bulk_array(ret, bo->pages);
+		return -ENOMEM;
+	}
 
-			bo->pages[i] = pages;
-		}
+	ret = set_pages_array_uc(bo->pages, bo->pgnr);
+	if (ret) {
+		dev_err(atomisp_dev, "set pages uncacheable failed.\n");
+		free_pages_bulk_array(bo->pgnr, bo->pages);
+		return ret;
 	}
 
 	return 0;
-cleanup:
-	free_private_bo_pages(bo, i);
-	return -ENOMEM;
 }
 
 static void free_user_pages(struct hmm_buffer_object *bo,
@@ -774,7 +766,7 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	mutex_lock(&bo->mutex);
 	check_bo_status_no_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
 
-	bo->pages = kmalloc_array(bo->pgnr, sizeof(struct page *), GFP_KERNEL);
+	bo->pages = kcalloc(bo->pgnr, sizeof(struct page *), GFP_KERNEL);
 	if (unlikely(!bo->pages)) {
 		ret = -ENOMEM;
 		goto alloc_err;
-- 
2.36.1

