Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202E5687
	for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 19:33:18 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6bca857accbso4027481a34.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 12:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692041597; x=1692646397;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4g2eNo9EGxlkyZ8uc+8gCeb6NGWQ3fxW2NfY/S3rM0=;
        b=F3ai7teyxo8fuYk91lx92G5qY1JotYpBHRfJU9Kxtt2FZZx+lYtCgieH5e+Si2kgiR
         GuYEUlK/KHHXgjsrR/48oFz1SyAYxSDa/yvyxWldQuRHYLrey3ml1dlQ5ZNbruFA4je/
         jnglp64DHX9ykk3KhqHcdoeNzTKgzn5B1ZRX69yOnByTkl7kr0tWye19RZixxCgBzbsE
         4R/p7YlHgRHn4LiC4mKNhI23peTJ15x/gRgvJdCAnTifV1n4eGPPuyffA7lPpNPDFh0/
         epSgajsiB5jzEg/4KGygsxwxjCW8SmXoy3i4ywARQ217ZligG63OewNADtgj6YfyKbSj
         m9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692041597; x=1692646397;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4g2eNo9EGxlkyZ8uc+8gCeb6NGWQ3fxW2NfY/S3rM0=;
        b=ATDlQsYd437gtEaDcugF2RXNMuVSJE6b5Z2CLgTWCUdLmTM878wtPbYQAttPCv5Hv/
         W0X+k0iaqMli5uwv4r2KBzjyvKCV29WIDjg2EOaYHbDvemWVdBTvcInHpATLrqPjDrG1
         uNjf4xZXiSeGEFZcM1uULko1kYDY0Lt0Hq3qMdr4UbfAkZ/PhRfGM3pBfzQxQqLVN6Fr
         +DOSr8eVKsBKS2Ot5LPOZIn4Llc13KkP9K180RHA6+BxK8/iUwCv/SYpWNKPNx3YR5S7
         fUqfsqASSC2Br1VLcYkFYgfxShotd4l+aPDNBab16+6++YrMe4Pr+79nWv/MluLC8197
         z/QQ==
X-Gm-Message-State: AOJu0Yy6F5suvB8TJ6U+DweGW8duPg5e+IQLMPdA14at4BsRg4g40Rpm
	hzAVU4eRHEOLmaAkYvIyJ10=
X-Google-Smtp-Source: AGHT+IF9jr+6sqe3qPPcB6ViRDfnc8KbRhm3r+zCXLEwETc2Xf7cEP0szdV890O1PWSx+7cOMbtktw==
X-Received: by 2002:a05:6830:1d70:b0:6bc:e049:b28f with SMTP id l16-20020a0568301d7000b006bce049b28fmr10144444oti.34.1692041597350;
        Mon, 14 Aug 2023 12:33:17 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id c2-20020a9d7842000000b006b94a14b52asm4550003otm.9.2023.08.14.12.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 12:33:16 -0700 (PDT)
Date: Mon, 14 Aug 2023 16:33:11 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check blank lines not necessary
Message-ID: <ZNqBd/08H/Y5UEOm@alolivei-thinkpadt480s.gru.csb>
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
 drivers/staging/vme_user/vme.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5eb0d780c77f..c7c50406c199 100644
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
@@ -682,10 +680,8 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 		count = length - offset;
 
 	return bridge->master_read(image, buf, count, offset);
-
 }
 EXPORT_SYMBOL(vme_master_read);
-
 /**
  * vme_master_write - Write data out to VME space from a buffer.
  * @resource: Pointer to VME master resource.
@@ -887,7 +883,6 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 		mutex_lock(&dma_ctrlr->mtx);
 		if (((dma_ctrlr->route_attr & route) == route) &&
 		    (dma_ctrlr->locked == 0)) {
-
 			dma_ctrlr->locked = 1;
 			mutex_unlock(&dma_ctrlr->mtx);
 			allocated_ctrlr = dma_ctrlr;
-- 
2.41.0

