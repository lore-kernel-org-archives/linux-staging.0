Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F65687
	for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 20:08:27 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-56c87f89178so3291887eaf.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692043706; x=1692648506;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TgiPA+i67nUUA0+3agLGa5vPvztFGOlraYjNpF78eF8=;
        b=CLlxZA6ILiMQ+IEU2O8tzzPf4eKGfyUYC7GBQU30hfMmUpAPU/XOXKGSCVkoCGlK86
         Ho47OXq/ioCGXF57HmvsP2rf73x7fB79/+Ck0NMQjcq8gyu/9tObhXN9L/pyRTqTfw8T
         0JjznQp/4P+o1k8rRNowiJnn7/UWR3qdQiE4wYdzQIVt6ip95IgHQcZwUGSVgAJ0ngH+
         8Avk3Wsya+pnfCvRbBiZpIMMZGe5DVw3ifx29FhBT741o/pzcNDABCcHAMtMvqm2Ib3X
         xCgg7veJ5U2gU9zU7UE6qaLQSGOi9SvzY/eJFe9M4FIOlI0lRP14e/Rv7OIcFIEUzLOo
         iIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692043706; x=1692648506;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgiPA+i67nUUA0+3agLGa5vPvztFGOlraYjNpF78eF8=;
        b=OAazMJXQEdXKQNq6OqBujR85R6FOoGy2EvJgHk+DAIsylVR9yuu2prr7f2zIDZs0YJ
         AKjrHgVq3Cqk1yiEP1K7KVfwRgNjdVi2blWhaIBUZNPCO0p1n5ldMsmMh3jKMK+j1COB
         zBXXT941tcBKjWIbngxbB5acCoEw6wtKMbSbrxWWFglfDpoDE6TWuK05va72LBhMhRX6
         BERjRxH6RoD9+edm0MoLNlK3jDqQA3gURC+lT3y0M1XVLPw1LyB9W5VZNWoebM0EGL79
         Z1W8r5Crs2sb1mAErW8iwGQkQx1Xw+/E4Y8jBMCMzXF38YmuvEpSyoQ3jnU4pzSz2oap
         d9VA==
X-Gm-Message-State: AOJu0YymeWc4mbxbzb63l6deD211bD+b5lpnA+vbDVXpo4ZY64g9k224
	H4pR7B1x/KsSSyqi1KkOGpY=
X-Google-Smtp-Source: AGHT+IH4kvNNv55L3m+GtAEetFriGcQyEDgRkaH/qYyq+UQojDO+vQt05Zs3biI9Ies10jcUo9UFhw==
X-Received: by 2002:a05:6870:5887:b0:1bf:7cdc:df0 with SMTP id be7-20020a056870588700b001bf7cdc0df0mr10125283oab.35.1692043706095;
        Mon, 14 Aug 2023 13:08:26 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id c5-20020a056830000500b006b94904baf5sm4587959otp.74.2023.08.14.13.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:08:25 -0700 (PDT)
Date: Mon, 14 Aug 2023 17:08:19 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check unnecessary parentheses
Message-ID: <ZNqJs126kA+KvSTC@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Unnecessary parentheses around
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index c7c50406c199..6f08bb21369d 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -307,7 +307,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 		mutex_lock(&slave_image->mtx);
 		if (((slave_image->address_attr & address) == address) &&
 		    ((slave_image->cycle_attr & cycle) == cycle) &&
-		    (slave_image->locked == 0)) {
+		    slave_image->locked == 0) {
 			slave_image->locked = 1;
 			mutex_unlock(&slave_image->mtx);
 			allocated_image = slave_image;
@@ -508,7 +508,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 		if (((master_image->address_attr & address) == address) &&
 		    ((master_image->cycle_attr & cycle) == cycle) &&
 		    ((master_image->width_attr & dwidth) == dwidth) &&
-		    (master_image->locked == 0)) {
+		    master_image->locked == 0) {
 			master_image->locked = 1;
 			spin_unlock(&master_image->lock);
 			allocated_image = master_image;
@@ -882,7 +882,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 		/* Find an unlocked and compatible controller */
 		mutex_lock(&dma_ctrlr->mtx);
 		if (((dma_ctrlr->route_attr & route) == route) &&
-		    (dma_ctrlr->locked == 0)) {
+		    dma_ctrlr->locked == 0) {
 			dma_ctrlr->locked = 1;
 			mutex_unlock(&dma_ctrlr->mtx);
 			allocated_ctrlr = dma_ctrlr;
@@ -1248,9 +1248,9 @@ void vme_bus_error_handler(struct vme_bridge *bridge,
 	list_for_each(handler_pos, &bridge->vme_error_handlers) {
 		handler = list_entry(handler_pos, struct vme_error_handler,
 				     list);
-		if ((aspace == handler->aspace) &&
-		    (address >= handler->start) &&
-		    (address < handler->end)) {
+		if (aspace == handler->aspace &&
+		    address >= handler->start &&
+		    address < handler->end) {
 			if (!handler->num_errors)
 				handler->first_error = address;
 			if (handler->num_errors != UINT_MAX)
@@ -1337,7 +1337,7 @@ int vme_irq_request(struct vme_dev *vdev, int level, int statid,
 		return -EINVAL;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		printk(KERN_ERR "Invalid interrupt level\n");
 		return -EINVAL;
 	}
@@ -1386,7 +1386,7 @@ void vme_irq_free(struct vme_dev *vdev, int level, int statid)
 		return;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		printk(KERN_ERR "Invalid interrupt level\n");
 		return;
 	}
@@ -1433,7 +1433,7 @@ int vme_irq_generate(struct vme_dev *vdev, int level, int statid)
 		return -EINVAL;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		printk(KERN_WARNING "Invalid interrupt level\n");
 		return -EINVAL;
 	}
-- 
2.41.0

