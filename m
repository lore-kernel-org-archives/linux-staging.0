Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E7803;
	Fri, 20 Oct 2023 01:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fwz6VXfz"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6b20a48522fso347587b3a.1;
        Thu, 19 Oct 2023 18:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697766933; x=1698371733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZ9Q+Gp8bBY1rgTAuM/1Ler9ZBRDqDxWeGeuDodFtac=;
        b=Fwz6VXfzPRtk/agt3oxEhWI7XZulBzeoSf4tNkMnCe1pXrh1UkLu0r+z5SJnfU/ZQ2
         jEks3L6T8IkhEAZlYbfDIwebg7y9LOwKUG1Pch5dS+SmSJz+zGplpPzTq7IeE47KqokO
         PSezhZ6gDCz5viIM/7HYeXydwT5Ef1X4Pqfczxi+sqWN9zPr5sdVdQmsnvPg1HE8Xkst
         5PmgbB4MV+tYXHv5oIxIxaHuwr3acJ0LG47VLYmC1F0gSwgpfJ2t2Kh7wUlIHPV8cTm1
         NyltzL13Oc/LnyawYOZAHH2rJ31JpB8qe/D8nbBfK0ia+fey7op9l6c5nV9a7QEGyVCO
         YqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697766933; x=1698371733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZ9Q+Gp8bBY1rgTAuM/1Ler9ZBRDqDxWeGeuDodFtac=;
        b=r3AGaqsd7LVnLTbHhS5e1ij9GlgezKSiQozxU8ySbji0x03N1NC7HjSVP1uNrbSSnr
         wiQci9GydRm8mjvWuM5G0epcjBwSq4SRCLkkFvyuyI6NXq1hPaEgjmqW0B08kTSt/jYG
         phnYVBR3rY028YQ/2/52bjXjeJoKKnxDtdNZE4o/iV0lNoiFmczDjS3yRRvXDvItqSiB
         EQGfZciJUIqIfHHn0KMhbD2D5br/S3aKuqVUdVA8ujJbnJCfra4g0n6OimsjZULnDmPN
         U+AfMhYSYHr26KlZXmf+tParUVU/rbkNVDBkx0uTpucO1IJ85YqTK1hGAncSk7bOp9zg
         gdkA==
X-Gm-Message-State: AOJu0Yzbe68EfQbiBGgnNfqbY0oj6Md9eojHUTzKNvcl5EngOcLxDs2L
	Tl6HLLEK7ExubqV3aBbL5Ho=
X-Google-Smtp-Source: AGHT+IG5M1a+WXDPCZSl3/oRipDWqxiylVgcnshegQbxFFuTufQ6pm5x5LtkQhOgV9nJIqibYX6vGw==
X-Received: by 2002:aa7:9a0e:0:b0:6be:acc:8973 with SMTP id w14-20020aa79a0e000000b006be0acc8973mr418617pfj.20.1697766933598;
        Thu, 19 Oct 2023 18:55:33 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id n14-20020a056a0007ce00b006bb5ff51177sm400665pfu.194.2023.10.19.18.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 18:55:33 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	julia.lawall@inria.fr,
	Andi Shyti <andi.shyti@kernel.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 2/5] staging: vme_user: Use __func__ instead of function name
Date: Thu, 19 Oct 2023 18:55:20 -0700
Message-ID: <db4ad6b878c4bb08fd5d15cf4a9287d7bb8c30df.1697763267.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697763267.git.soumya.negi97@gmail.com>
References: <cover.1697763267.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace function names in message strings with __func__ to fix
all checkpatch warnings like:

    WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
             this function's name, in a string

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
Acked-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/staging/vme_user/vme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 25f3cac641ed..c36c2dc095c5 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -422,7 +422,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_get) {
-		dev_err(bridge->parent, "vme_slave_get not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -574,7 +574,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (!bridge->master_set) {
-		dev_warn(bridge->parent, "vme_master_set not supported\n");
+		dev_warn(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1574,7 +1574,7 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_set) {
-		dev_err(bridge->parent, "vme_lm_set not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1610,7 +1610,7 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_get) {
-		dev_err(bridge->parent, "vme_lm_get not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1647,7 +1647,7 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_attach) {
-		dev_err(bridge->parent, "vme_lm_attach not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1680,7 +1680,7 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_detach) {
-		dev_err(bridge->parent, "vme_lm_detach not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1748,7 +1748,7 @@ int vme_slot_num(struct vme_dev *vdev)
 	}
 
 	if (!bridge->slot_get) {
-		dev_warn(bridge->parent, "vme_slot_num not supported\n");
+		dev_warn(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.42.0

