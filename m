Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA7D483BE8
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832765; cv=none; b=dDpXC9zCgu6k5gFVpYGBFkhbtMgHtd1A7FYkGvG/fsjO9RMk7IxGabR+wMxzqgdKs7JiCSFxva/ROXkUlNtX+NBC2PhZkIvW7d6OPpP+GnRRpKpaevdrFQXYfCdmnmP8xKIZeu/eQfg6W0pwYDjomMH/FYnWAv0SYNl6Vc3L+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832765; c=relaxed/simple;
	bh=417PvZV6MLha7RW5u+XT5AoGUeViXQS0dSHinR0tdNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQWLv72jajXNUFKe2U9UjclqKYAPZODcBIsYGVlDBh+zXeyRKFFOtmwqpliIR4HTavxdVOUdaZc4CmbfAUepo19GYjKY6Wm3PTtts+EK8petEO2R3xvJh3tWo9xWHFz/pHrgDxo0DOhfPe48H18Kfa70+6zKP4vbOisscc2Q0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvDbOO/f; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvDbOO/f"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so8425901fa.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832752; x=1785437552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6YqaPjKVmdDMcCcfhFit+qzoapYrDK7L6d0hrzWx1A=;
        b=SvDbOO/fW70N/eqvJdSqw8EZlEoKhvd85Z7nstoIWYCSnWW3qeR2v0/8q9wmRNQ1rf
         wkEvePtzLYo+Do+xqdNKxtig6MZqlaek1lejPBPBVQMpwBy3TpBR9AOKJp1Z+p8q/jaz
         MmV0lUf6acd46ubs14qwq9mMxbkKXCVACrvDi8L+YzeMdR+Sm5VZcCMK9Qb4FijlJj7P
         H1aSfwWhtgEhjKK31wTtuWXelFwzsRW1Ppwi1erhNupd7wAk6u2a/IaV9d6MJZ+aoLIg
         l7Vw93HcQ+GfhCYDzXH0vo2U5nPHwdyfgnims3mXOA5qhA25us0rqfu1aECQ0uOrMQE1
         pxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832752; x=1785437552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6YqaPjKVmdDMcCcfhFit+qzoapYrDK7L6d0hrzWx1A=;
        b=PjV+t8boZjgWnMYfkarAb35oAW6DAINyfkm402Poa3KitjJJd7pWvlhkwdAsfof816
         6nnbmr9bR+9lITPnfi3Xjky/3SaUfwzR6gKiNI9rBQfl+Ipf2KWlOERnIFLmKqZxwK/x
         c1Iicx71GGLpV41NKpYP44HDYnfMH1CRnVCWXL0o8XPI2EO9lduudjLwenyNPq3httP2
         mI7a6KJUVRtTgcKO26MnN6A41bSJsbqQdExQnGptis2u5Jo+gD3qFFfoBrLrKJlnSooc
         d0KRKgynXae+r6ah6Uy8c+YWhZXk11sPapOI+TRDCcvspuxRipvtuaJcCrkIBYSid8l9
         KwOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoN62J6Mt2fin0Qbgy/8U2q29rozX6omkEcSA2hYkkkFrTETvx94ufuuHMZViGyGhCC1H5xta7oSVXcglIc@lists.linux.dev
X-Gm-Message-State: AOJu0YwhYzbW/a8cjzNAhQE5rnTGHdyZHH8gMBqtNo7TT27I28zmvTqc
	juUihjSita47jKLVOlkneB2WXRBMaCTbEu50g6Rp2OJRaR+1QzvDKFup
X-Gm-Gg: AR+sD11orpyQfNyXVeTR1lMvGOvo3lB3RSO5lVzzvDYcS6KyQbG8XAyQjYoIe9mcbd2
	5T4OIuxh44LLyuoTIaiE19/8neKFUNG6ye9wgwqKvrqIBBjBLd/Rb4q3Z9YjWIt0r8p49F6V7Y7
	x2qnkvBAKas7YgiydV+g5zCn6Tx+x6UBf/QVsKPu+xWK1ub7RVv8NzmvTBkIDU/LZhop8w5vQ4C
	KL0LpEYoj4wBxc1tVAWVT0iaZC+U/ybgBvexzA40kiL+fmokLWHFRdGaCKOWfYc06CV1v3eIu8h
	RoUXAXWcLrsfi/iD4nRJRfEwhSIIU/9oQuHR++FxvAi4aaUhyAaiTpb9+eznJGBk3RUbB6ZdwAm
	t3THbO5zFnS85rlGM8ZVbugz509+P1lfdHJMnukeqhtGrZrbNSAxuFpu92ILdI932b6DdLRh3Dr
	0=
X-Received: by 2002:a05:651c:881:b0:39b:2323:b700 with SMTP id 38308e7fff4ca-39f07c63c7emr8542801fa.10.1784832752086;
        Thu, 23 Jul 2026 11:52:32 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm11601731fa.10.2026.07.23.11.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:52:31 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 3/4] staging: media: atomisp: inline the check_bo_status_*() macros
Date: Thu, 23 Jul 2026 21:51:20 +0300
Message-ID: <20260723185217.317981-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723185217.317981-1-nikolayof23@gmail.com>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These macros check a bit in the bo->status field. Replace them with
conditional expressions to make the code clearer.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        | 12 --------
 .../media/atomisp/include/hmm/hmm_common.h    | 18 -----------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 30 ++++++++++++-------
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
index b9949cc080e5..e92538ab025e 100644
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

