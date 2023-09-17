Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C94A29
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 18:11:55 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-577f6205f42so2734584a12.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694974315; x=1695579115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiSVKgYJxVHCVtKrcyUKlXuWoI9S1vK1ZruE0hhSplw=;
        b=OF4ZSbTSNCdR0StzLa8k4ztfT/WgkEOhReFzFR2mGqzeDkKb6Z6C35awKA7k6pjOyF
         NNBJ6A38h80ux4gMChkiKlvQPLOhcZ8s6+Ivp735vncO6DIOpYm4OUUPo0r3b9vqtFkg
         QDHXNor8AE7HxobCEGVkgiHdd9YO8I68Kg/yhcqwRqzzKocM0aDHhB7gBMvxFKvFza4o
         1oo/dNtntJI3kG2jwEP5MX52h0toV6f08/c84ucSSprM78oMW4DbqBd0/DJ8aoveweq8
         08kOBsW3gsLIFKW7wp2xUm6rW/IYmndInUfLttq5ivZJ/8WQcf6wV7wcTZ53jZmOZONc
         XN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694974315; x=1695579115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiSVKgYJxVHCVtKrcyUKlXuWoI9S1vK1ZruE0hhSplw=;
        b=mH05KEx+k44jeHaLhE+GnPZpgct6LX5sZtLyg9PjMIpolFEeS4mwGqA0t0R10CmTx/
         /01C1pUSatwWdyD3pbDp16B6jMddr22GjZYwyclX82DAIsdWMsD+NL0g3pDjbv/+YMLi
         pO/3vAzb7dvxi2CfZzr7SsozTgNN01LKbQ7KwIY9jG+M+O3SfKL1PFH7W4MWdMKqsB1K
         hBZghVCdgMZEc01tVgEnowr3S8kvGxmhS1YRj4+ZMxiItUYYEYs3eQSrImX9sc6n6H15
         QdjcFGdrsWQF9nYJwbKTRgG0STENNgBU9Un5nyN0sGVxHUKYlwenN2XdFBRb6htSxztC
         kcsw==
X-Gm-Message-State: AOJu0YxQyX72xdSpEkDoE8HdwNewU7aQmauXqlLW511QdcXGNdYPsG1W
	WRmBGlLSSQTDphsi+EGaFN0=
X-Google-Smtp-Source: AGHT+IE6OD8dh63b6b0DggWIqiiJ8ICQVD98eIH3H9dKW3ouEzSK2EY0H2TCqiG2BeVvDdJjh19VpA==
X-Received: by 2002:a17:90b:4393:b0:268:2500:b17e with SMTP id in19-20020a17090b439300b002682500b17emr5631821pjb.23.1694974315436;
        Sun, 17 Sep 2023 11:11:55 -0700 (PDT)
Received: from yqt-VirtualBox ([139.227.189.216])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090aa58d00b0026d54b2abe9sm5729536pjq.37.2023.09.17.11.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 11:11:55 -0700 (PDT)
From: Piro Yang <piroyangg@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piro Yang <piroyangg@gmail.com>
Subject: [RESEND PATCH] staging: vme_user: Fixed prink formatting issues
Date: Mon, 18 Sep 2023 02:11:49 +0800
Message-Id: <20230917181149.77514-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230917171824.76702-1-piroyangg@gmail.com>
References: <20230917171824.76702-1-piroyangg@gmail.com>
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

