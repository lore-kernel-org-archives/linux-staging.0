Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353CB6FA7
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 19:24:39 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68fb7074348so3204891b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694978678; x=1695583478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liqGEr9UFPdrElQV4uCx69VR3VFDoL4doPQNoIoMyEc=;
        b=mWf2DgdU2OrmQhDzE6hS9U3v7ACOFyiT8FX5D+BBGgMv752kbq+LN8HsxrZ0qDHaCO
         uZ0ir2Nk01Fdy5cqAyN+pkh9wTtBwYb8Gz2UNAE8WpSj1EdF+zZAPCd2FoT3ARJL/d5v
         SsRvlXDsAaXYJHL8DgNNfL/NvCbX9Fh93G+cUsLHDuJal/4yaPFSYnsehjceXQ7qB2pU
         IxfzQaTCjb+KVPCO6rIR6HZIT4ZSnLdBn5c/Aqrdrk002EC/2PYzwqYE2PXaH7FBeVWl
         eX+JTfGJeGq2H+9my15BgV6ZDpXT9zNgw4mkFqmL4sEkzrknPOJscDfcJMnUOGZwU+Nd
         pEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694978678; x=1695583478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liqGEr9UFPdrElQV4uCx69VR3VFDoL4doPQNoIoMyEc=;
        b=DHQXukgv6EcL+rFWj647J3XqRPe89VlZQe7rUgdjO0/94AYLtdG9A+5r/N9Il5vodA
         /360WpN4jgtkBrK4vZ6+dzdqVl7L1FPUCHxj3W01WliWjOHxwLpM2C12Q8fy/k+G4hm0
         uZwBgEBPOAUg1qjBupoeoNTg7qWaAYz6oapZzvRt449VFIrzakiDBa773oF4BKnQ5j9q
         yYQ8oFtusZ9PbJqj0vDhNERUgHuwlyGf7+J6TVTrFWY3r5edrguvkn3EwRaUbnRpIBa3
         VNydgbveek2IeV/iop/Dv4OO/2zHJKFOYMgXVba0jDrohEQVn1z5Jb93GRd22BZ/WSTf
         nNeA==
X-Gm-Message-State: AOJu0YwWw8sCiLiAVuztAhWZxjRpIkvv8zPLpKu6P++xco7YjE/eW7P7
	VuK26m1UidImh33vXqg3jWo=
X-Google-Smtp-Source: AGHT+IEaZqIkyA5mn+EiqRJamhFF6C+Z1z310akMunD3A1z9HyqFd1WQA682tst1SfOrmFPg1dWZWQ==
X-Received: by 2002:a05:6a00:21cb:b0:68c:5cec:30d4 with SMTP id t11-20020a056a0021cb00b0068c5cec30d4mr7552770pfj.27.1694978678441;
        Sun, 17 Sep 2023 12:24:38 -0700 (PDT)
Received: from yqt-VirtualBox ([139.227.189.216])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78705000000b0068ffb8da107sm5974528pfo.212.2023.09.17.12.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 12:24:38 -0700 (PDT)
From: Piro Yang <piroyangg@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piro Yang <piroyangg@gmail.com>
Subject: [PATCH v2] staging: vme_user: Fixed prink formatting issue
Date: Mon, 18 Sep 2023 03:23:59 +0800
Message-Id: <20230917192359.78711-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2023091756-duct-agile-0023@gregkh>
References: <2023091756-duct-agile-0023@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed issue relating to prink message:
	*using __func__ to replace function's name

Issue found by checkpatch

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 drivers/staging/vme_user/vme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5960562dcd96..de404c6765f3 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -418,7 +418,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_get) {
-		printk(KERN_ERR "vme_slave_get not supported\n");
+		printk(KERN_ERR "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -568,7 +568,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (!bridge->master_set) {
-		printk(KERN_WARNING "vme_master_set not supported\n");
+		printk(KERN_WARNING "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1552,7 +1552,7 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_set) {
-		printk(KERN_ERR "vme_lm_set not supported\n");
+		printk(KERN_ERR "%s not supported\n", __func__);
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

