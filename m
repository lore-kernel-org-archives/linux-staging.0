Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C016C143
	for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 21:10:58 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a7d402fc6fso3462477b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 14:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692047458; x=1692652258;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TM97GMZQGDrpz3N3/7Cs6kHLre7psxGQ8f/O7bWlHpY=;
        b=RQEQj2sqTzdWi5T1dH0fXULOAszAWJH7CGh/uduVeOkqIbGJ3IJA5jCYb2cMZa/Qdi
         BBToEZd0mPEEZ2GWcjc3SQwgQMDSd4goFzHhDDfaMcdCb2V0qNjhm+UhcdsBrf5G/wGt
         lRf1Ym4NlSZgEk9WLl4eYdjQJaPnU4eY2v4tUtxE+WyJKHlaxVNE2QNeYAoeWoAJgAUJ
         QbvumZVIE1ufe1Vr0Xjs693cjPiVqxjInCIrz70bAwYBvxn8xEJgY1FjRW6OoHgCeFvm
         2egxgDjUQTSQl4ZWK0s1rpirrd1Rjk0PLwLm2oK5K1WJXC2QF2vMhNtaV8Eq2lzwpXjQ
         zsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692047458; x=1692652258;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TM97GMZQGDrpz3N3/7Cs6kHLre7psxGQ8f/O7bWlHpY=;
        b=MJqZN6yEbIL5xvR1Wd8QoT8N4DVnOQvdea7RMVpl3OkYTUiSHEWjx7TYiDOrvzZdMv
         WXrbeiK+4Kt4U9Y7b5GvAwJ+ZfXxD9u1xgxoex2mk8tUu68nctnh2bWqAclLOxDGZHaz
         WwKBJ5nVXRYINJoQ3ZkxxKR5JEHSFOzAEJgc5y8Us2tyOLrSAPvgIzBeHxTHMjf224bR
         74/6xogXvz+38n2MjFEPJ63K0+ABV+jIFibReuPCmZFmJwvdznTO7S4OW6QZ976Gkcz2
         Fx1ddE6ptb14T3Rwqvur4sOH+ENzcWSzzrHyHRaLaAZ6eRqpTjIBxR+wq520Lp9ht8JZ
         kSkg==
X-Gm-Message-State: AOJu0YxWvMJP5iGE9c8gHDA91wyILBpXUweCwXxnsmrhuTgM7PjC+HB0
	zOP5SpWJKHrQIWp8JR7SCrU=
X-Google-Smtp-Source: AGHT+IFqeOMx2lDqPMVG9GEKOKxnznHE+rGjm5BCm1tJ7izi8rAmDnnINDGBvXM3/lsSFZCSdKpwJw==
X-Received: by 2002:a05:6808:2114:b0:3a7:3ab9:e589 with SMTP id r20-20020a056808211400b003a73ab9e589mr11654420oiw.35.1692047457939;
        Mon, 14 Aug 2023 14:10:57 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id x22-20020a056808145600b003a3bf96e055sm4894754oiv.8.2023.08.14.14.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:10:57 -0700 (PDT)
Date: Mon, 14 Aug 2023 18:10:52 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: vme_user: fix check blank lines not necessary
Message-ID: <ZNqYXAe/wIRl8qEe@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Blank lines aren't necessary after an open brace '{'
and CHECK: Blank lines aren't necessary before a close brace '}'
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---

Changes in v2:
- Re-added previously removed line not reported by checkpatch,
noted by Greg KH

 drivers/staging/vme_user/vme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5eb0d780c77f..bbf82b1be9f1 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -308,7 +308,6 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 		if (((slave_image->address_attr & address) == address) &&
 		    ((slave_image->cycle_attr & cycle) == cycle) &&
 		    (slave_image->locked == 0)) {
-
 			slave_image->locked = 1;
 			mutex_unlock(&slave_image->mtx);
 			allocated_image = slave_image;
@@ -510,7 +509,6 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 		    ((master_image->cycle_attr & cycle) == cycle) &&
 		    ((master_image->width_attr & dwidth) == dwidth) &&
 		    (master_image->locked == 0)) {
-
 			master_image->locked = 1;
 			spin_unlock(&master_image->lock);
 			allocated_image = master_image;
@@ -682,7 +680,6 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 		count = length - offset;
 
 	return bridge->master_read(image, buf, count, offset);
-
 }
 EXPORT_SYMBOL(vme_master_read);
 
@@ -887,7 +884,6 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 		mutex_lock(&dma_ctrlr->mtx);
 		if (((dma_ctrlr->route_attr & route) == route) &&
 		    (dma_ctrlr->locked == 0)) {
-
 			dma_ctrlr->locked = 1;
 			mutex_unlock(&dma_ctrlr->mtx);
 			allocated_ctrlr = dma_ctrlr;
-- 
2.41.0

