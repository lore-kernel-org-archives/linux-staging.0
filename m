Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2B61871
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 19:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655149949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0quel2Aopod/+dmOJOtUL6sqWicZhRk2Kk07cHOMpU=;
	b=OMUvH0F4gNsFwPR+MC6YcrkuTwrGd5IHvfqRko7xX8rOb0K4qoraCAxePOMA+evL8D5bUH
	m2C2wYByXnss8z1C1semoZ2a8Vcw27bqJRWOYz3lnn8PQABtyPYugWX1zK1vW6mJjPyBdG
	8AOtmkNE6HUIDPGqbgXoIVanMlQOT9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-zvg2jagmNf-nj68sQ-OE4A-1; Mon, 13 Jun 2022 15:52:25 -0400
X-MC-Unique: zvg2jagmNf-nj68sQ-OE4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EE0A185A7B2;
	Mon, 13 Jun 2022 19:52:24 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B076A2166B26;
	Mon, 13 Jun 2022 19:52:22 +0000 (UTC)
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
Subject: [PATCH 25/40] media: atomisp: drop ATOMISP_MAP_FLAG_CLEARED
Date: Mon, 13 Jun 2022 21:51:22 +0200
Message-Id: <20220613195137.8117-26-hdegoede@redhat.com>
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

This flag is only used by one hmm_alloc() caller, drop it and make
the caller call hmm_set(ptr, 0, size) itself to do the clearing.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h      |  1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c    |  3 ---
 .../staging/media/atomisp/pci/sh_css_params.c  | 18 ++++++++++--------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 99348f677fa4..752c09e64a5d 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -827,7 +827,6 @@ struct atomisp_s_runmode {
 
 #define ATOMISP_MAP_FLAG_NOFLUSH	0x0001	/* Do not flush cache */
 #define ATOMISP_MAP_FLAG_CACHED		0x0002	/* Enable cache */
-#define ATOMISP_MAP_FLAG_CLEARED	0x0004
 
 struct atomisp_update_exposure {
 	unsigned int gain;
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 03e6d766381f..5fd29dbab9cd 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -208,9 +208,6 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 		goto bind_err;
 	}
 
-	if (attrs & ATOMISP_MAP_FLAG_CLEARED)
-		hmm_set(bo->start, 0, bytes);
-
 	dev_dbg(atomisp_dev,
 		"%s: pages: 0x%08x (%zu bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
 		__func__, bo->start, bytes, type, from_highmem, userptr, cached);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 09f87c285b8d..b5a10725d263 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2585,13 +2585,11 @@ sh_css_params_init(void)
 			xmem_sp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
 						  hmm_alloc(sizeof(struct sh_css_sp_stage),
-							    HMM_BO_PRIVATE, 0, NULL,
-							    ATOMISP_MAP_FLAG_CLEARED));
+							    HMM_BO_PRIVATE, 0, NULL, 0));
 			xmem_isp_stage_ptrs[p][i] =
 			ia_css_refcount_increment(-1,
 						  hmm_alloc(sizeof(struct sh_css_sp_stage),
-							    HMM_BO_PRIVATE, 0, NULL,
-							    ATOMISP_MAP_FLAG_CLEARED));
+							    HMM_BO_PRIVATE, 0, NULL, 0));
 
 			if ((xmem_sp_stage_ptrs[p][i] == mmgr_NULL) ||
 			    (xmem_isp_stage_ptrs[p][i] == mmgr_NULL)) {
@@ -2599,6 +2597,9 @@ sh_css_params_init(void)
 				IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 				return -ENOMEM;
 			}
+
+			hmm_set(xmem_sp_stage_ptrs[p][i], 0, sizeof(struct sh_css_sp_stage));
+			hmm_set(xmem_isp_stage_ptrs[p][i], 0, sizeof(struct sh_css_sp_stage));
 		}
 	}
 
@@ -2610,12 +2611,10 @@ sh_css_params_init(void)
 	sp_ddr_ptrs = ia_css_refcount_increment(-1,
 						hmm_alloc(CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
 								   HIVE_ISP_DDR_WORD_BYTES),
-							  HMM_BO_PRIVATE, 0, NULL,
-							  ATOMISP_MAP_FLAG_CLEARED));
+							  HMM_BO_PRIVATE, 0, NULL, 0));
 	xmem_sp_group_ptrs = ia_css_refcount_increment(-1,
 						       hmm_alloc(sizeof(struct sh_css_sp_group),
-								 HMM_BO_PRIVATE, 0, NULL,
-								 ATOMISP_MAP_FLAG_CLEARED));
+								 HMM_BO_PRIVATE, 0, NULL, 0));
 
 	if ((sp_ddr_ptrs == mmgr_NULL) ||
 	    (xmem_sp_group_ptrs == mmgr_NULL)) {
@@ -2623,6 +2622,9 @@ sh_css_params_init(void)
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
+	hmm_set(sp_ddr_ptrs, 0, CEIL_MUL(sizeof(struct sh_css_ddr_address_map),
+					 HIVE_ISP_DDR_WORD_BYTES));
+	hmm_set(xmem_sp_group_ptrs, 0, sizeof(struct sh_css_sp_group));
 	IA_CSS_LEAVE_ERR_PRIVATE(0);
 	return 0;
 }
-- 
2.36.0

