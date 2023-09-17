Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46753AB
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 20:30:28 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68fbb10dea4so2889462b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 13:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694982628; x=1695587428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmN3G4bFpi6nAbIJp8nMJiK+WmgTcWevUBMw6pAf8Vk=;
        b=PQ3rdfwk02/2SjIWhQ4dFiKGUddUoct+FDv53L8Q7zI2jNcnPsjy+iqTF8CG4tt2Bg
         CZST9CtJ22+4PM1n2tmM3MjcPHRAbWHkmy/r3WUxl4sStwfm2kh2dpBSbT7XBgR8X1Me
         WFuOJ/RCuNpecY0/RhSRkE8HcqVSNpDvw80sONKaRgYzSYw3LfbgpygS0vTy9Xiozdum
         kMb9HLr1Wj1icDhoNTjDrWIkK+RiQu9W+epjZPMp9su0DvQeugMYWj2R50Vts2FR39xF
         cSYRE0vvf0fPmNPl0CtfHXt+d8o2Ana5mAdr60szTM7BbTys1VPlmgZubJt74rz5qgVr
         J0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694982628; x=1695587428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmN3G4bFpi6nAbIJp8nMJiK+WmgTcWevUBMw6pAf8Vk=;
        b=rBAbuNy9wuYJIyYVpHlFS2/x521ARA/vHjsJHSHQZyb0gs1VQCI3GAENkEWd2L+BBi
         +qTAfFTiK/ESW7l5UBRsTULh8mROA1Oi9OMR1LbyG6bGh7AyN7pF8UMzyvMPYHy2l4KE
         rPZDnpCx1nEvGcS7Vh1Joto7PjDPq/WtEk0XDFeZ+99vwzFmpo3UO1KjwVpuQpiWhdnc
         86khEaFQkIaplImOt/UPUS6SfLVC2E5OUwTIbYJVHUVgp02mfCiBs+JipjBOepRCjmbU
         53FpFbop2BkEeoBQsnhuBDW2cWGRiUvXHof+Ygi9WN0SalLQMZD6YEcracc0OD3I7DBS
         tpdQ==
X-Gm-Message-State: AOJu0YxdQKwpmz/xx/kizHC0gifS4Kcl0KgKMD3FeB0qz8u2gzFlPP5e
	savfcBt55U9+1DcWwrb/X0E=
X-Google-Smtp-Source: AGHT+IECasCq4QXMYQn3wUZn42e5l+bVc7WPy0pGFsbORQGQ9sFW5lXlpsfwRKvUNRjABaQXLFFhQQ==
X-Received: by 2002:a05:6a20:8e0f:b0:134:d4d3:f0a8 with SMTP id y15-20020a056a208e0f00b00134d4d3f0a8mr7470800pzj.3.1694982627806;
        Sun, 17 Sep 2023 13:30:27 -0700 (PDT)
Received: from yqt-VirtualBox ([139.227.189.216])
        by smtp.gmail.com with ESMTPSA id jk15-20020a170903330f00b001b9fef7f454sm4534874plb.73.2023.09.17.13.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 13:30:27 -0700 (PDT)
From: Piro Yang <piroyangg@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piro Yang <piroyangg@gmail.com>
Subject: [PATCH v2] staging: vme_user: using __func__ to replace function's name in printk
Date: Mon, 18 Sep 2023 04:30:19 +0800
Message-Id: <20230917203019.79180-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9548bc1c-23c9-427f-446e-61f051f14f9c@gmail.com>
References: <9548bc1c-23c9-427f-446e-61f051f14f9c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix issue relating to prink message:
	*using __func__ to replace function's name

Issue found by checkpatch

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
Changes in v2:
  - Firstly, fix only one type of Waring by checkpatch.
	using '"%s...", __func__' substitute for function's name of printked information

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
