Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB6801;
	Fri, 20 Oct 2023 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhtDqCjH"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5ac88d2cfaaso243447a12.2;
        Thu, 19 Oct 2023 18:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697766940; x=1698371740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZBEMc6vewNRb3lJ4/ORiz3INshzShkDhkjWu9W5RKw=;
        b=bhtDqCjHY53m7/1H3hdYbZ8/TilI4DX5v8oMnQfbpYD7kcJRd4rrjj0rugXS8xFkuA
         7cPnkpjGcRcuhq6BqBvgFbIpCjFsMUeE190vZruENGtm+VlEAL7NeRihOGMSEN8/s9Ag
         ovVaJtmTOT8W13SP8EK8yGIZ8gqYj2Nvjnx1pmOMh12F4jStVaHVytqgxFetwW4vdVUF
         jmrQ3eI5TPOhrRBLmrdjY0EeQsbx+K+XbpivCGOjuVoSpf0FMD9bIQ8fUNu39zrHSXUq
         0vmuAuLvkz31Zt5Dov4zkKEnQPyhHu7ZcCYWRJUEaHYxb++xaJn9ZGhaHKCXLK1UUkAk
         UZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697766940; x=1698371740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZBEMc6vewNRb3lJ4/ORiz3INshzShkDhkjWu9W5RKw=;
        b=lJGe+Doaxjcz7rb6kmbOltRb7gwaMsLWILPpsqmUMnj2MOfX/dxHXZjbBQgpK25vvx
         FTpz2cpaNmnf0dMwH03aPErfT9z/PNC+U+Z+U+UoveImg5pYrqCwjVTx8x51uTI8oCex
         LmfPMmNLW4WZ/4ESEhjb/3M5WvR+5JFS3CoN+rm1GDIJKwxqCM82ZnbgDVstk6c86cj4
         Ir2kQJdcGU9oaAB1SlFHvaRQg7y6ouNwcjxQcoQm/wjPhK4+e2D6dubhWFhxxHCgXYuZ
         50K5+xXHGpCP5IZs7cuPlD4Xo4q1qxR1O/9Yx3YWZq6DZsabC+rF7ULxpOVdCdC1v3ML
         lbmQ==
X-Gm-Message-State: AOJu0YyIphkao/u0Z5TFW9DZs5XsuA6OHAy9VMde/xYbQLjKceHyAFPC
	Y25ZwCDLQtywT+R08ZWzMHhwjPoHyIHE/w==
X-Google-Smtp-Source: AGHT+IEYSJGWt6ZmOSffMWsFL4MdYYC22lCR3Rl4+UKSXa76894eTvl4+jjkWSLXO3+2NTeNLBS9rQ==
X-Received: by 2002:a17:90a:f30d:b0:27d:427f:1bf4 with SMTP id ca13-20020a17090af30d00b0027d427f1bf4mr581029pjb.19.1697766940506;
        Thu, 19 Oct 2023 18:55:40 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id ha8-20020a17090af3c800b0026f919ff9a1sm2232789pjb.10.2023.10.19.18.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 18:55:40 -0700 (PDT)
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
Subject: [PATCH v3 4/5] staging: vme_user: Remove NULL-checks
Date: Thu, 19 Oct 2023 18:55:22 -0700
Message-ID: <049bbedf458e8ac40f3dfff9c9b25dce89f5b642.1697763267.git.soumya.negi97@gmail.com>
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

Don't check for empty bridge device & resource in vme_alloc_consistent()
& vme_free_consistent() since they can not be NULL. Both the VME bridge
device and the VME resource that are used in these functions are set at
probe time.

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/vme_user/vme.c | 36 ++--------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5efcdf15a068..661d1edfa26a 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -80,23 +80,7 @@ static struct vme_bridge *find_bridge(struct vme_resource *resource)
 void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
 			   dma_addr_t *dma)
 {
-	struct vme_bridge *bridge;
-
-	if (!resource) {
-		printk(KERN_ERR "No resource\n");
-		return NULL;
-	}
-
-	bridge = find_bridge(resource);
-	if (!bridge) {
-		printk(KERN_ERR "Can't find bridge\n");
-		return NULL;
-	}
-
-	if (!bridge->parent) {
-		printk(KERN_ERR "Dev entry NULL for bridge %s\n", bridge->name);
-		return NULL;
-	}
+	struct vme_bridge *bridge = find_bridge(resource);
 
 	if (!bridge->alloc_consistent) {
 		dev_err(bridge->parent,
@@ -121,23 +105,7 @@ EXPORT_SYMBOL(vme_alloc_consistent);
 void vme_free_consistent(struct vme_resource *resource, size_t size,
 			 void *vaddr, dma_addr_t dma)
 {
-	struct vme_bridge *bridge;
-
-	if (!resource) {
-		printk(KERN_ERR "No resource\n");
-		return;
-	}
-
-	bridge = find_bridge(resource);
-	if (!bridge) {
-		printk(KERN_ERR "Can't find bridge\n");
-		return;
-	}
-
-	if (!bridge->parent) {
-		printk(KERN_ERR "Dev entry NULL for bridge %s\n", bridge->name);
-		return;
-	}
+	struct vme_bridge *bridge = find_bridge(resource);
 
 	if (!bridge->free_consistent) {
 		dev_err(bridge->parent,
-- 
2.42.0

