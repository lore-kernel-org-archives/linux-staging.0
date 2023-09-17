Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C9539E
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 17:18:34 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c43fe0c0bfso11911775ad.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694971114; x=1695575914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GiSVKgYJxVHCVtKrcyUKlXuWoI9S1vK1ZruE0hhSplw=;
        b=mttin9WiyFzYTVLGXRaazgm5A2F3h4kuSnk0u01gmNXANjBeqljehb7QhZyPeY2DrJ
         rmEhmsSX4z60dxgHnyuaQgeclapuxh0FiAsa+2nJV4S0Bt0ZKm+mawYVC4MRhK/p92V1
         mUdh6mz5S/43gSGx5XYtyX2subr8T0X0KQXzJ3+IMGH6L2kHcjd4UGB5WCBkyFNpvU5R
         4PghNDoLN6gsDqOFDwx6PHzsdE/9ywC4ohh66t5wCdlrsEzzKYsOKT+V2wXh0yGSLK/X
         7m/eD+QmuEAJYHdJpFBAgQc0e0835IT5orjE8v1df/5yoRlV0MStfT0Db7Ibf/Nmgs4C
         /ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694971114; x=1695575914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiSVKgYJxVHCVtKrcyUKlXuWoI9S1vK1ZruE0hhSplw=;
        b=HghSJqz1fbUQ7TWqYRPiibv/2VABI5W9/KpNm+io/L88qKW2lm2UvTdiWZzTsDBtdw
         4pbbLRDTyNUB9LeIRQbUIF5M8G8aRNuJZ6DVUz93Yk6Z/HA1owJ/Szyr0gnnU5vdUh4V
         ThJTUdoPq5f6Ws4yvANoAh4y4Nw8liNdy8fcD7RgWG9ekPWt6fS9N4m/SVevfZv1VScJ
         gjfuzRyi99Xkx+XZhcyxpDCakFggr/DQ05FSfMi+Hxq9WGQ2KQWO9IT+SXA9vIykTfIv
         QI/6cH9OwQZRBVUHFfB1LJnbLa5gMDM6YHRTEnBjzvp1wWO4/7d1BR2kYRna5te7dLXl
         ikyQ==
X-Gm-Message-State: AOJu0YwGnOr3QSokgpXZreyUxUNB91oI9qTvKayLV4N8crIFLG6Vz1km
	a1hAakTh92ncoJsMi5BOxSY=
X-Google-Smtp-Source: AGHT+IGeV3O1nN7wPPzHmQzKjU51HCy/x7Nat68GXBaSKNA2YZ22HO0CgTDOAnby/1BomJSsTwP4uA==
X-Received: by 2002:a17:902:d342:b0:1c5:64aa:b97a with SMTP id l2-20020a170902d34200b001c564aab97amr854515plk.38.1694971114276;
        Sun, 17 Sep 2023 10:18:34 -0700 (PDT)
Received: from yqt-VirtualBox ([139.227.189.216])
        by smtp.gmail.com with ESMTPSA id bb6-20020a170902bc8600b001bba7aab822sm6829335plb.5.2023.09.17.10.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 10:18:34 -0700 (PDT)
From: Piro Yang <piroyangg@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piro Yang <piroyangg@gmail.com>
Subject: [PATCH] staging: vme_user: Fixed prink formatting issues
Date: Mon, 18 Sep 2023 01:18:24 +0800
Message-Id: <20230917171824.76702-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed issues relating to prink message including:

a. using __func__ to replace function's name
b. using pr_warn to replace "printk(KERN_ERR"

Issue found by checkpatch

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 drivers/staging/vme_user/vme.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5960562dcd96..56c528628e7d 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -418,7 +418,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_get) {
-		printk(KERN_ERR "vme_slave_get not supported\n");
+		pr_warn("%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -568,7 +568,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (!bridge->master_set) {
-		printk(KERN_WARNING "vme_master_set not supported\n");
+		pr_warn("%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -618,7 +618,7 @@ int vme_master_get(struct vme_resource *resource, int *enabled,
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (!bridge->master_get) {
-		printk(KERN_WARNING "%s not supported\n", __func__);
+		pr_warn("%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1552,7 +1552,7 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_set) {
-		printk(KERN_ERR "vme_lm_set not supported\n");
+		pr_warn("%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1588,7 +1588,7 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_get) {
-		printk(KERN_ERR "vme_lm_get not supported\n");
+		printk(KERN_ERR "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1625,7 +1625,7 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_attach) {
-		printk(KERN_ERR "vme_lm_attach not supported\n");
+		printk(KERN_ERR "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1658,7 +1658,7 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_detach) {
-		printk(KERN_ERR "vme_lm_detach not supported\n");
+		printk(KERN_ERR "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1725,7 +1725,7 @@ int vme_slot_num(struct vme_dev *vdev)
 	}
 
 	if (!bridge->slot_get) {
-		printk(KERN_WARNING "vme_slot_num not supported\n");
+		printk(KERN_WARNING "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.25.1

