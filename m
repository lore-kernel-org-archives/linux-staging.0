Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872EC801;
	Fri, 20 Oct 2023 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q00hCDx1"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ae99bb5ccdso203743a12.1;
        Thu, 19 Oct 2023 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697766946; x=1698371746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0ry+kzvCHTJ148NbwYm7VhiEmbwaTHh/+gmqtzaSLw=;
        b=Q00hCDx1iuQniP4ZInbjsa1GL/1Nd7209JU+CdOAyySRN109YijT0BPJ4TwkhX0HL2
         SPTOgCUJcLd2ZMWKjJMkRTj+ewWL+Ox5W6oSCBvEJtHsbBnmyFq/JFHFctQYUyhtZmtb
         RePqcgRa33+NEJbi4y7FzVM2OqC3XF0Osq550qNF/QM556aajbowgG1+vggTDN2hIZ5U
         cJNvUc9NOBHb5f/fxJSqLYXsqkDyDF5p139x+ERRku634viJ0ZOZkjAxlMn6wbdJmNYt
         WMmOlEgVwqGfDF8Z/qWlW8kBingZWmGY7HJpU2sq0W6nbHikcGrw4TtGs/JbNF71+Ymx
         0CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697766946; x=1698371746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0ry+kzvCHTJ148NbwYm7VhiEmbwaTHh/+gmqtzaSLw=;
        b=gkvlyig/fi9dyo7qMAkPbbG39QA81IBVFXzBwr5avJqdlQ9f9nzA7DnqH710x67vcw
         H3dkbkVCSVC9RuZDpqFF/fL2O3ErG2LkzCpQMnBKastGGwoQy3/KGC9dX2GqRXjsi+t2
         +y4hxSym4Ca8AdAlCq3Rj1e9EqsDaM2ku4vCy4pzu7Ecddpf4iqdeUrgmbGj3SLtUqFE
         4d/ELN0x+i42o2Epo/oRpaa9+txt2eFETnNBXArkMQshtBkgCnokp7SWq/z4qZXmUf/T
         SpNuyJk+cuCYg/XgtGkimVF1Y/O4qqhI+/8zYaje/2IHkq1tMlNd9PYwEdK/zd9LHSXG
         Hu+Q==
X-Gm-Message-State: AOJu0YzioQQUHicEf3+GO+EKbVccFwQihwhYWmg4IN45CcgT1Nhao0B/
	HODtuufgwD7pR587Wi6SSIs=
X-Google-Smtp-Source: AGHT+IFn/zp+aYLsgb+V9ijWqr1uVXfLKPrE/FA7ILL1PTDKhjIgWawptYIWT2W+n4WuMOmuC1nhzQ==
X-Received: by 2002:a05:6a21:7903:b0:16b:8488:babf with SMTP id bg3-20020a056a21790300b0016b8488babfmr485267pzc.35.1697766945798;
        Thu, 19 Oct 2023 18:55:45 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001b9d335223csm364784plb.26.2023.10.19.18.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 18:55:45 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	julia.lawall@inria.fr,
	Andi Shyti <andi.shyti@kernel.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH v3 5/5] staging: vme_user: Use dev_err() in vme_check_window()
Date: Thu, 19 Oct 2023 18:55:23 -0700
Message-ID: <221344ede933b1d9e6c31310b0f4dbb8be809c86.1697763267.git.soumya.negi97@gmail.com>
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

vme_check_window() uses printk() for logging error message. This
leads to the following checkpatch warning:
   WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
            dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...

Use dev_err() instead. Pass VME bridge device to vme_check_window() so
that the error message can be logged with the bridge device context.

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/vme_user/vme.c | 10 +++++-----
 drivers/staging/vme_user/vme.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 661d1edfa26a..5c416c31ec57 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -160,8 +160,8 @@ size_t vme_get_size(struct vme_resource *resource)
 }
 EXPORT_SYMBOL(vme_get_size);
 
-int vme_check_window(u32 aspace, unsigned long long vme_base,
-		     unsigned long long size)
+int vme_check_window(struct vme_bridge *bridge, u32 aspace,
+		     unsigned long long vme_base, unsigned long long size)
 {
 	int retval = 0;
 
@@ -195,7 +195,7 @@ int vme_check_window(u32 aspace, unsigned long long vme_base,
 		/* User Defined */
 		break;
 	default:
-		printk(KERN_ERR "Invalid address space\n");
+		dev_err(bridge->parent, "Invalid address space\n");
 		retval = -EINVAL;
 		break;
 	}
@@ -350,7 +350,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 		return -EINVAL;
 	}
 
-	retval = vme_check_window(aspace, vme_base, size);
+	retval = vme_check_window(bridge, aspace, vme_base, size);
 	if (retval)
 		return retval;
 
@@ -552,7 +552,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 		return -EINVAL;
 	}
 
-	retval = vme_check_window(aspace, vme_base, size);
+	retval = vme_check_window(bridge, aspace, vme_base, size);
 	if (retval)
 		return retval;
 
diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index fbcbd0204453..06504dccd5ff 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -133,8 +133,8 @@ void vme_free_consistent(struct vme_resource *, size_t,  void *,
 	dma_addr_t);
 
 size_t vme_get_size(struct vme_resource *);
-int vme_check_window(u32 aspace, unsigned long long vme_base,
-		     unsigned long long size);
+int vme_check_window(struct vme_bridge *bridge, u32 aspace,
+		     unsigned long long vme_base, unsigned long long size);
 
 struct vme_resource *vme_slave_request(struct vme_dev *, u32, u32);
 int vme_slave_set(struct vme_resource *, int, unsigned long long,
-- 
2.42.0

