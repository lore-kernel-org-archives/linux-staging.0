Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBF21DE3BB
	for <linux-staging@lists.linux.dev>; Mon,  7 Oct 2024 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335494; cv=none; b=hhrtpcyLk3dxkuYvermp4SOk3UB+hk9u1KJJKDmxHZAWmDOQgb4TU5CKG4jQyabvsg/2kVN8Ne5AmKeuuZlmxjRD55+EpF0Ubk467ttxXGUxoYD8k6yTb6WziUNry3FAp8zkkrdX7WChm/FxMOZqWt8MygBV1/W/RS/Wc11pnVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335494; c=relaxed/simple;
	bh=sz9DDKWT1VHETLFCqbVPq131ZqhABGh0WxE2TKhoAn0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ba7pt41xUYus8aCQKoP2rNlX6u4kwA7ZroSD6mGgZUi6PnIFk8n7ylvrEPnGRFUQQSjKbLcRvBoVG2O4QrXcZ5RH/B8GNW4nyYAn3sAOvnh9HF3ZGgV/BPCfX6NmU3yEh/vZoHBF0NsSkfkOJhUFhEKhdz8TiM4GN6MYtXy4hZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFjzpAD8; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFjzpAD8"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71df8585a42so1643129b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 07 Oct 2024 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728335490; x=1728940290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yP7B01LD6qkNHPFXhz3CUcBt6crcfzQgzq/u+GQhFQ=;
        b=MFjzpAD89Iyuj2VhM49e3WX8hhOxndgdcb6FVIr7AKXS/nmkXKWpXCWP8IpAevCX6E
         CVT16YOwN5urea7gpWSevYLvILiQ7rFLA9cWg2BFF7j1CY9Hh4qvmTtfK+UsndpuKbeT
         b+/WeAsRxM6QQcYIKggjXOmMRCZGUDa4n9bVe22JQkBCrZIuiOyqmIrfl/hnan9Lgw3c
         I7IclXcIm2Dc00sG+IPh52T/UzQZ8x6NQdDNxx6ecdMe04ZutnqDWGBiqDueLUtBFLuZ
         mqCvzzQ15dKYdxsUccyRMsTX7sH87fnQrNiShirNCyAAZ17Zu4HlaL3t8z7PLukps999
         pCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335490; x=1728940290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yP7B01LD6qkNHPFXhz3CUcBt6crcfzQgzq/u+GQhFQ=;
        b=PRlFzo2vrSbXoyqTWVFWaB49s3HX38D85qOGolsahAjsa5I62YWiejtm4bbgeMjq26
         t7oBkIkbN4KL9AkDNKOUdM1+dshBhcbKfbc9PjP5ppzO2HL2HFTIm541EFGMWmR8QkTP
         CoCmhYEwjrrZAjiIA0n+DpsKHa8bThDIs5kO7RgSafOB3OAmIFOgkjpFknGNafGnZfCJ
         eAXrhGyND9NE3NCHT+3F56bdLDohL39QwSoacTofJ1FRZ00N2S6o3XqDdyDQminHvRpy
         N6J8iZZ2JmfC6+kN/ooZ/4yQizNEuuZnJ485PP8/XEtgDsa/DodTN4xmOZIfBTNwweuD
         JIRw==
X-Forwarded-Encrypted: i=1; AJvYcCWnXelIooeidqNJrbwyYQNFKvz9fpFLCkuLX7J051LsNgR9jsgpZoMysD7OYFh5DbHNsVUnRt0UfBMDWHJP@lists.linux.dev
X-Gm-Message-State: AOJu0YzCG9x4+qHcUEC12VmbaVvs1ow+7KWyrZ6lRMck4m0ZJ/4ToDdd
	1/b5VB3M0rwXit25GG+gWKksha8nrqDMtcnK9fe1dzYvV9yj/0WFZii9LnKy
X-Google-Smtp-Source: AGHT+IH1UetA9aKyQtikclFIZtNCTgkLFOvfZ75fc4oZ3DIZYFDnTMjqaquTnyik04QM3lOoWxKcSg==
X-Received: by 2002:a05:6a00:3a14:b0:717:9768:a4f0 with SMTP id d2e1a72fcca58-71de22eb62bmr22422672b3a.0.1728335490010;
        Mon, 07 Oct 2024 14:11:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:3f:c655:c818:c41d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f6c4adeasm4638192a12.84.2024.10.07.14.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:11:29 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jonathankim@gctsemi.com,
	deanahn@gctsemi.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: gdm724x: fix returning -1 with return equivalent errors
Date: Mon,  7 Oct 2024 18:11:24 -0300
Message-Id: <20241007211124.170540-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As in the TODO file, use proper error codes from PM callbacks and init.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Changelog
    v2 minor changes at packet_type_to_tty_index() and gdm_usb_lte_init()
    v1 https://lore.kernel.org/linux-staging/20241004203458.6497-1-rodrigo.gobbi.7@gmail.com/T/#m258452a56ddade60b2209479f036213e72d43f02
---
 drivers/staging/gdm724x/TODO      |  1 -
 drivers/staging/gdm724x/gdm_mux.c |  6 +++---
 drivers/staging/gdm724x/gdm_usb.c | 10 ++++++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gdm724x/TODO b/drivers/staging/gdm724x/TODO
index b2b571ecb063..56a415b9dcbe 100644
--- a/drivers/staging/gdm724x/TODO
+++ b/drivers/staging/gdm724x/TODO
@@ -2,7 +2,6 @@ TODO:
 - Clean up coding style to meet kernel standard. (80 line limit, netdev_err)
 - Remove test for host endian
 - Remove confusing macros (endian, hci_send, sdu_send, rcv_with_cb)
-- Fixes for every instances of function returning -1
 - Check for skb->len in gdm_lte_emulate_arp()
 - Use ALIGN() macro for dummy_cnt in up_to_host()
 - Error handling in init_usb()
diff --git a/drivers/staging/gdm724x/gdm_mux.c b/drivers/staging/gdm724x/gdm_mux.c
index 9b12619671a1..82302c6266eb 100644
--- a/drivers/staging/gdm724x/gdm_mux.c
+++ b/drivers/staging/gdm724x/gdm_mux.c
@@ -47,7 +47,7 @@ static int packet_type_to_tty_index(u16 packet_type)
 			return i;
 	}
 
-	return -1;
+	return -ENOENT;
 }
 
 static struct mux_tx *alloc_mux_tx(int len)
@@ -594,7 +594,7 @@ static int gdm_mux_suspend(struct usb_interface *intf, pm_message_t pm_msg)
 
 	if (mux_dev->usb_state != PM_NORMAL) {
 		dev_err(intf->usb_dev, "usb suspend - invalid state\n");
-		return -1;
+		return -EINVAL;
 	}
 
 	mux_dev->usb_state = PM_SUSPEND;
@@ -622,7 +622,7 @@ static int gdm_mux_resume(struct usb_interface *intf)
 
 	if (mux_dev->usb_state != PM_SUSPEND) {
 		dev_err(intf->usb_dev, "usb resume - invalid state\n");
-		return -1;
+		return -EINVAL;
 	}
 
 	mux_dev->usb_state = PM_NORMAL;
diff --git a/drivers/staging/gdm724x/gdm_usb.c b/drivers/staging/gdm724x/gdm_usb.c
index 54bdb64f52e8..f666fbeeb44c 100644
--- a/drivers/staging/gdm724x/gdm_usb.c
+++ b/drivers/staging/gdm724x/gdm_usb.c
@@ -916,7 +916,7 @@ static int gdm_usb_suspend(struct usb_interface *intf, pm_message_t pm_msg)
 	rx = &udev->rx;
 	if (udev->usb_state != PM_NORMAL) {
 		dev_err(intf->usb_dev, "usb suspend - invalid state\n");
-		return -1;
+		return -EINVAL;
 	}
 
 	udev->usb_state = PM_SUSPEND;
@@ -952,7 +952,7 @@ static int gdm_usb_resume(struct usb_interface *intf)
 
 	if (udev->usb_state != PM_SUSPEND) {
 		dev_err(intf->usb_dev, "usb resume - invalid state\n");
-		return -1;
+		return -EINVAL;
 	}
 	udev->usb_state = PM_NORMAL;
 
@@ -989,9 +989,11 @@ static struct usb_driver gdm_usb_lte_driver = {
 
 static int __init gdm_usb_lte_init(void)
 {
-	if (gdm_lte_event_init() < 0) {
+	int ret = gdm_lte_event_init();
+
+	if (ret < 0) {
 		pr_err("error creating event\n");
-		return -1;
+		return ret;
 	}
 
 	return usb_register(&gdm_usb_lte_driver);
-- 
2.34.1

