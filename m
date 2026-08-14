Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F358E48094C
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720293; cv=none; b=QYG2w0oW3p+2COzUTFOjKO34UkmF42kX4o++TbOrJHKKtksnVS/kDNvE9IQkp+6y2V4uIRcVNlD/Jjm/C78mp6A81Y3CmZhj/L2cNrJLjDyt7luYdpuaVc6nGK+X5MA6Q5KLArUHTUkCC7h+h428yKXM+HUVObGt0JQfSLMgzVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720293; c=relaxed/simple;
	bh=DOnPf8mbkyDpezzGvvZK9+aNOSxPc/LfJq7ezpXpACc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pClqzbMMv20eBmsVVnzuUT0g41aOmgy3ZjnHWcSbuTJpOz+WYF5gHRXq9GzoRNVUAV92HZdetlqyDIZWaFE1TGnmvRk3ax9OfyiRnCNN2kZrlAP3XHslc3sp8EGisrQo8TXua7RsQiZPyrhMm1OSWTJC9VzMhu4srZUH6+5P6gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RF1qq3tE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RF1qq3tE"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso10069311fa.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720289; x=1787325089; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjjx4OZPtT3/3k2f1Byd/EarM4nIT+IrMxJaUq8W3q8=;
        b=RF1qq3tExUVCwd6DuHCyCb2ix2NdV90TFGZKK3J1LsGHEX9FDoFTNv/zG6fNG6ufyV
         w4k/oq67xC6Hs74fPs1d8bLfJj7aaLcpfDvFXl74Dc4cxVbduzrIuJgzs4vLvSWA0AX+
         kfFAATRmKvheL/sswYS/bUlHW+EsW6J3oIjJQpD8NonphsshfYG0LtewymkzoCJiFeQf
         wgGPTtxCElV0fMAvpf/35sJu8cMWNaHgjyZGNPssPWHRYThwR3SxE8hpLgnyvjk8Y6m8
         aFn5q+nIEdQ4dylCGw8Z9q7bAxYOLiTUWx7MDrDVgZjnARVkx9C9cc2KXlP1Ei0PNj7w
         iBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720289; x=1787325089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjjx4OZPtT3/3k2f1Byd/EarM4nIT+IrMxJaUq8W3q8=;
        b=ZMW67tYRRLWtpR0mzQlJqdqTP28YEw/6OI4vftvW6yKvUowVq1HdOmG7dEEJSUAsBY
         YLcQZZ7t4RkNBPiJVT9slY9llnIBIhchnilzWoCSjee2LseYgDeC/0zPXS418zBBQnFv
         AjqMDRunC1iWl7tJ81JX5FK1qIZGOaqXUXQF8422moBkL5eNHe/X97RDuqQotANYAVoC
         gTpN6Yyhzyt1R+pAWKSxSy1sjTUZt+YOQDkZKWXBUZERzITBPvxwN4LfI7YZIBbJJMey
         R2MB63TofDWIIiB7FYbDm0LpIf0McURWeWN5loNvC9t/izaBK5Khgt/m8qgjouvdMg2s
         bEeA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7GLdYG6Xj6DgS98XD1tcUoubMnTLj4AhGBRUecT2ymj+GzEDvaH3lU1+mtXfIqsfdJwiwzrjr4Ce1rf4l@lists.linux.dev
X-Gm-Message-State: AOJu0YyJi2sF2i/MhKmjqXGN+haHj4c9M28KKDgPt52u6z/AXQrXMQOD
	TT7aEA3ohKowM/DAoFTiE7i1eCPng1NjXK2J88Kwzy/9T1gMwrvEBQfy
X-Gm-Gg: AR+sD12IduZ8SL4EW4AH5GMe7dv15v7x0lU4JxN3M8Qt7VRM0CJffwzdUh/NiA0Wsox
	Fdr1bfhqsOUY/4kP2DZcF5AHMHmaOrlTAnkR99gysx0J7rnMpiZjmK9est3Vsw8qC3bqe+TPF+g
	k7iK2banUXkwJYJvXJ3TnudSX3Uj488VQwQ6Q/8DekA1/H9vF8N5mRFKdDlqWPqP2O2dz2f3Wi9
	G0o23ZbbpyeMsqSS2C7+oadgS5H+Tyc/2chYMOUprYzAmdAfi5xsX2opdLnCkW2Bif/RRB8i33o
	r8To9C1p8njb0r7Ge87D5RFktT99c0Fd/cm8p0nsfaZ+y2GkQvQk7YrP9YP/Rpw4fgPUTbfXpVQ
	RmySKv584afqwgu/1gUrZuCvQAHAano/fsVoCLNVnjoAquznrg9UlLVq0vnVJ2JGD4mN6IfD3lS
	/oZL3+cmwjViSAHkqmv2cY7jo5YxoX8PrgUbjJFKbFfNXt+qsUeF2q4H/k/E9kvfPOfB9TEw==
X-Received: by 2002:a05:651c:54e:b0:39a:fc8e:84e2 with SMTP id 38308e7fff4ca-3a132400ebemr7614641fa.7.1786720288952;
        Fri, 14 Aug 2026 08:11:28 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:28 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:10 +0300
Subject: [PATCH v4 3/5] staging: media: atomisp: inline the
 check_bo_status_*() macros
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-3-c3c954a12b51@gmail.com>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=4285;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=DOnPf8mbkyDpezzGvvZK9+aNOSxPc/LfJq7ezpXpACc=;
 b=RlSiFB3sQfxO1qseXHX0zJ0Y/1QZuVJ0b3dKk4O/FhFvRxE+JcScDlvY+NmNXcuyxJsFTEXli
 7N5fM3sFtZfCHPdWqniuC+xuqwgbR1wgUK5CzEqXMKuT2M42LlXxyjW
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These macros check a bit in the bo->status field. Replace them with
conditional expressions to make the code clearer.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 12 ---------
 .../staging/media/atomisp/include/hmm/hmm_common.h | 18 -------------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 30 ++++++++++++++--------
 3 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index e974ab5ca2fc..69cf490bd88c 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -19,18 +19,6 @@
 #include "hmm/hmm_common.h"
 #include "ia_css_types.h"
 
-#define	check_bo_status_yes_goto(bo, _status, label) \
-	var_not_equal_goto((bo->status & (_status)), (_status), \
-			label, \
-			"HMM buffer status not contain %s.\n", \
-			#_status)
-
-#define	check_bo_status_no_goto(bo, _status, label) \
-	var_equal_goto((bo->status & (_status)), (_status), \
-			label, \
-			"HMM buffer status contains %s.\n", \
-			#_status)
-
 #define rbtree_node_to_hmm_bo(root_node)	\
 	container_of((root_node), struct hmm_buffer_object, node)
 
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index f215130e5e17..c406fe8b1345 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -33,22 +33,4 @@
 		} \
 	} while (0)
 
-#define	var_equal_goto(var1, var2, label, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			goto label;\
-		} \
-	} while (0)
-
-#define	var_not_equal_goto(var1, var2, label, fmt, arg ...)	\
-	do { \
-		if ((var1) != (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			goto label;\
-		} \
-	} while (0)
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 9b29b6381abf..46ee077026b3 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -687,7 +687,10 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	}
 
 	mutex_lock(&bo->mutex);
-	check_bo_status_no_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
+	if (bo->status & HMM_BO_PAGE_ALLOCED) {
+		dev_err(atomisp_dev, "HMM buffer status contains HMM_BO_PAGE_ALLOCED.\n");
+		goto status_err;
+	}
 
 	bo->pages = kzalloc_objs(struct page *, bo->pgnr);
 	if (unlikely(!bo->pages)) {
@@ -738,7 +741,10 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 
 	mutex_lock(&bo->mutex);
 
-	check_bo_status_yes_goto(bo, HMM_BO_PAGE_ALLOCED, status_err2);
+	if (!(bo->status & HMM_BO_PAGE_ALLOCED)) {
+		dev_err(atomisp_dev, "HMM buffer status not contain HMM_BO_PAGE_ALLOCED.\n");
+		goto status_err2;
+	}
 
 	/* clear the flag anyway. */
 	bo->status &= (~HMM_BO_PAGE_ALLOCED);
@@ -788,11 +794,15 @@ int hmm_bo_bind(struct hmm_buffer_object *bo)
 
 	mutex_lock(&bo->mutex);
 
-	check_bo_status_yes_goto(bo,
-				 HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED,
-				 status_err1);
+	if (!(bo->status & (HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED))) {
+		dev_err(atomisp_dev, "HMM buffer status not contain HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED.\n");
+		goto status_err1;
+	}
 
-	check_bo_status_no_goto(bo, HMM_BO_BINDED, status_err2);
+	if (bo->status & HMM_BO_BINDED) {
+		dev_err(atomisp_dev, "HMM buffer status contains HMM_BO_BINDED.\n");
+		goto status_err2;
+	}
 
 	bdev = bo->bdev;
 
@@ -868,10 +878,10 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 
 	mutex_lock(&bo->mutex);
 
-	check_bo_status_yes_goto(bo,
-				 HMM_BO_PAGE_ALLOCED |
-				 HMM_BO_ALLOCED |
-				 HMM_BO_BINDED, status_err);
+	if (!(bo->status & (HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED | HMM_BO_BINDED))) {
+		dev_err(atomisp_dev, "HMM buffer status not contain HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED | HMM_BO_BINDED.\n");
+		goto status_err;
+	}
 
 	bdev = bo->bdev;
 

-- 
2.55.0

