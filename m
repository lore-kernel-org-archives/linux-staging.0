Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B9144D29
	for <linux-staging@lists.linux.dev>; Tue,  9 Jul 2024 19:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720552530; cv=none; b=U96CGLlG87Durak+AfqLjFWZhrCZwAzEBCLF4TtxpPPWhpD+9L4Ws2ZhWIVKtJ5uiv7opuMDTjOHF6iuoXjO9uuOc4kswgVeW3oc0PkjKn5157C+GU+qLnIaevbKTP4cOwrQzVg9AXqIQ/RDJlNjWTEUdV4OkHVUei5v+FKLzrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720552530; c=relaxed/simple;
	bh=l9YKWHNugysqRnclia1mnLEFda0Foyt6pZ1B9ssZsmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBkXquyUuNwBoRTk3CbcoIQjxWqqXDeDIqPzZmBOCwb9TE+CkusfE//yAZM5toh0pHUcRC5PHm6jdOYweLYNh1ArDKyjaiHME+1EiepNHpSMBA5KfLaj2te1XaiqqShj5LfVG2CdLRQsVyM8ON/2R2aE5S9iKliCXJ5+KCC9vG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsoEU68e; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsoEU68e"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b0d0fefe3so2865300b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 09 Jul 2024 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720552528; x=1721157328; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVvD7435hpIemm43JrTkj0xQf9NKCpeT4z04Es1zZLk=;
        b=jsoEU68eyhKimxIKFrLAUPVv4fd4yKOWELRv+/6YF5C3tc+Bq0XZwZgrTJI9uPXtwF
         0iNg6yYcbrse1VbzYIaC4xsIEiAeJt2msbRtgPRkJATh1RqUJ2bIqUyzKFgqNjKqtOdB
         D/akNl1JAQasJGg588W+euQ/Y58pWck4gVkBMb/o9K6FpFsBZGoxWthAWYF5ct0/xIAu
         FJQVBaMfM+pEfQMGtn5APBi+/tjgMkPJDFVD24pR5+2fPZnN8JfGkNP8Q+XhB9MjM5Zq
         3P789TpdyhfUC69eG6hkIrf7vQTVnrpx0PZ/w7j+No2XQ+gJ6CbsRXwCjA1FAQkxkXZ2
         97YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720552528; x=1721157328;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVvD7435hpIemm43JrTkj0xQf9NKCpeT4z04Es1zZLk=;
        b=QI1yYHXtPknZBfmxjVUoWTBM95QztAvnGN8whAS+ZqIu89er3/Nft0UPeRVKHMxRhN
         a9DQqwU33+BrF5g1ca8lEZBWUqZSE9+IQLwWNzO/5IbJOORH21N5FC5otvmf/9LEDppX
         wT6b7kUlBwbEXK4TbI/Rw9x5vYNyqXPHzCglAOunvrxyWlEKfhaOHBK8SeMR3dPBBko5
         LM1lj4k90mFW/Oe8EIAFb/6cH9y/pX+UMMTnWgTf3e7TP91wUnhcXCBg+A4QKc7mpwqs
         b0PlJHzAShNfSG+4b8krQP/HUeX8pTFIAoGicHv5yzf6MX4/q4wehmpm96/m31B2JQ5c
         rcuw==
X-Forwarded-Encrypted: i=1; AJvYcCUsvISQ4Em3zlBYEMqRra5rwcmRlhhjd+Yj0iaacilIVa+6lAmKz20Zx4+XuYMbdjlLjmR1yP1mvs7aMLbJjYJBDf4Y3iuYs6COEYUWYg==
X-Gm-Message-State: AOJu0Yz+ZVHbh6h+2ITUGgPCJsJQqrCXfD5mEM07WQ+QfjS7/dH6o92f
	caLOECp5KWGZNWoKkZ7KRa5LKL+3uyodNSWcBXFRN+sWxhcnSCLn
X-Google-Smtp-Source: AGHT+IG/IkLwTpdYXOdTbDjXJysGuHHmuIQhCOFXnoI3QtXxIfRS9eyG5HH9ftXNI9ZKe6BDUeLbqQ==
X-Received: by 2002:a05:6a20:7484:b0:1c2:8d0a:8e9d with SMTP id adf61e73a8af0-1c29820b872mr3856486637.7.1720552528256;
        Tue, 09 Jul 2024 12:15:28 -0700 (PDT)
Received: from localhost.localdomain ([50.39.170.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2b6bcsm19658455ad.78.2024.07.09.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:15:27 -0700 (PDT)
Date: Tue, 9 Jul 2024 12:15:26 -0700
From: Tyler Taormina <taormina.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: Remove redundant parentheses
Message-ID: <Zo2MTjKCM_UaLIGx@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Unnecessary parentheses around (...)

Signed-off-by: Tyler Taormina <taormina.dev@gmail.com>
---
 drivers/staging/vme_user/vme.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 0cd370ab1008..5c1d1c9b7b70 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -274,7 +274,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 		mutex_lock(&slave_image->mtx);
 		if (((slave_image->address_attr & address) == address) &&
 		    ((slave_image->cycle_attr & cycle) == cycle) &&
-		    (slave_image->locked == 0)) {
+		    slave_image->locked == 0) {
 			slave_image->locked = 1;
 			mutex_unlock(&slave_image->mtx);
 			allocated_image = slave_image;
@@ -473,7 +473,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 		if (((master_image->address_attr & address) == address) &&
 		    ((master_image->cycle_attr & cycle) == cycle) &&
 		    ((master_image->width_attr & dwidth) == dwidth) &&
-		    (master_image->locked == 0)) {
+		    master_image->locked == 0) {
 			master_image->locked = 1;
 			spin_unlock(&master_image->lock);
 			allocated_image = master_image;
@@ -849,7 +849,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 		/* Find an unlocked and compatible controller */
 		mutex_lock(&dma_ctrlr->mtx);
 		if (((dma_ctrlr->route_attr & route) == route) &&
-		    (dma_ctrlr->locked == 0)) {
+		    dma_ctrlr->locked == 0) {
 			dma_ctrlr->locked = 1;
 			mutex_unlock(&dma_ctrlr->mtx);
 			allocated_ctrlr = dma_ctrlr;
@@ -1218,9 +1218,9 @@ void vme_bus_error_handler(struct vme_bridge *bridge,
 	u32 aspace = vme_get_aspace(am);
 
 	list_for_each_entry(handler, &bridge->vme_error_handlers, list) {
-		if ((aspace == handler->aspace) &&
-		    (address >= handler->start) &&
-		    (address < handler->end)) {
+		if (aspace == handler->aspace &&
+		    address >= handler->start &&
+		    address < handler->end) {
 			if (!handler->num_errors)
 				handler->first_error = address;
 			if (handler->num_errors != UINT_MAX)
@@ -1307,7 +1307,7 @@ int vme_irq_request(struct vme_dev *vdev, int level, int statid,
 		return -EINVAL;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		dev_err(bridge->parent, "Invalid interrupt level\n");
 		return -EINVAL;
 	}
@@ -1357,7 +1357,7 @@ void vme_irq_free(struct vme_dev *vdev, int level, int statid)
 		return;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		dev_err(bridge->parent, "Invalid interrupt level\n");
 		return;
 	}
@@ -1405,7 +1405,7 @@ int vme_irq_generate(struct vme_dev *vdev, int level, int statid)
 		return -EINVAL;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		dev_warn(bridge->parent, "Invalid interrupt level\n");
 		return -EINVAL;
 	}
-- 
2.39.2

