Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA4D1BF24
	for <linux-staging@lists.linux.dev>; Fri,  4 Oct 2024 02:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728008435; cv=none; b=IoSDxVHP8So5bDTaGmy85wvZLuK45jz2aIhOsrPjYeyD3ctmD12j7ulwXv0Ji8EN8v69T673to7Npg4+6+ZjlHkKPu9nbc0WhxNZTNwKzsv9kPUzxM2du6a6mBqo1NS51GcG6j4DERotUIdpEYMVY617HUORxuJQ6px8ultFB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728008435; c=relaxed/simple;
	bh=wpSuXikTsfV/gACh+5JX6At2YLugB3g6j4W8IYdPvac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XOsYRcpIzg2K8bWWUKDmmvQL/HFMh2yUaPa0pdvAg8GFBlsg+qDN9vObLQU4qdZcMNYnCwTW6QbHtnjkLCcCriZSLgPz5KknfyzIyhM3OYPNzm5wUUX7a7XX/aVRJ74nY9DUaUIgZzjSvPZiubCB7fbXlyhEVNMsgQuuDNPlbZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tz/dJuGD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tz/dJuGD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b84bfbdfcso18551995ad.0
        for <linux-staging@lists.linux.dev>; Thu, 03 Oct 2024 19:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728008433; x=1728613233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7EspszMZs/W4/0rXI2gQVeqcgQfIrHZ5J2Sd0YZNAYQ=;
        b=Tz/dJuGDKXuCmQkaQVJF4268JWRxcbSfSGfE2FIfwnVAhpNEnImnISvh5SemRqWkIj
         fi9JSm1Q4wDdEuxj4hFE3R/TEMlCL5YpYaQ4O6U1SC4vG1ZbRHjHknOKCHs4ZUDgCXyi
         s5VPCvzSJGwXpkuy5LqaWuZHoB0wUTiurcQIB4XfYRES0YG3a/EWKi6SVb1iEs8wgcJ1
         qLo0TKY0sJFg23BzIMQnhRnWJVnvh5F5OlhrWxKu3YzPncGQi1IRqdsP0ABoAHN+SI2c
         uzQ+OI2T6EypxFE+3YByyIo6FW9IQZu7nyBDc8Q/c8iEIAevi/JQLn+Qg3rQrVw/o2Gf
         2UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728008433; x=1728613233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EspszMZs/W4/0rXI2gQVeqcgQfIrHZ5J2Sd0YZNAYQ=;
        b=vMhXmQKm83ER/SB+0ylVey73I4eTHWUdQtw1+PxghGpfiEFSWNogZ9KMnoeWofv8js
         xWVJXUAsNjNQasY3RgXUmZdV+NyvFiupnh+q5dwypiDQUjXHik5nCvNbx9UDjAjcoLr+
         BLHkGrifuz4CtfxLPTeJAhZHzOpIa6RIlyvrC7VzBxrvm2L5pa0VYqJ3JMkF37CuZuaw
         QydbCLRXKsTb77hFho2KRBtPYYhPS9Rgi5MrW9Egq/L/Rm7xOzcUb5LNg9+HOKKTn8Vv
         bAT1mCikXkUQqqvDEf8McQVjB4vcsf/GU7VTHq16lfa9cAukUtSATAQz/zkDv6Zrc8+w
         Olqw==
X-Forwarded-Encrypted: i=1; AJvYcCXuI25JoQRmwdWqMjx/wiMiI1c0torjgKhg3P/CIRMRDyRxbfeKfUC5lnzL33Gvxl5SDED1hzEvMeonB6dk@lists.linux.dev
X-Gm-Message-State: AOJu0YwzKO4REmQYQDqYJCI8aXk0o5t0+eOM7SgO22WyLc/n5yNJ7dda
	2ILrOJpyCluJge6kmNpzivhGZkouJEhd+rBZIWIMLtDXFI1d7mLJ
X-Google-Smtp-Source: AGHT+IHWkVl50rO0ENSD8QGTYUBT1X1rR30y+Vj7ZPldy9CbHASGheTA7IXVN8M+MhUk+FKFcBfBPg==
X-Received: by 2002:a17:902:db10:b0:20b:9831:9edf with SMTP id d9443c01a7336-20bff37b222mr14450315ad.6.1728008432774;
        Thu, 03 Oct 2024 19:20:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:8683:330f:57b5:f805])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beef8eab6sm15205475ad.160.2024.10.03.19.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:20:31 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jonathankim@gctsemi.com,
	deanahn@gctsemi.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gdm724x: fix returning -1 with return equivalent errors
Date: Thu,  3 Oct 2024 23:20:25 -0300
Message-Id: <20241004022025.7015-1-rodrigo.gobbi.7@gmail.com>
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
Only one reference was left, regarding the packet_type_to_tty_index() but
I think it's reasonable to keep it that way since it's for tty index purpose.

There is a RFC to delete this driver at [1], so I'm not 
sure if this change is worth it. Anyway, I'm submitting 
it and I'll be waiting for an opinion about this.
Tks.

[1] https://lore.kernel.org/lkml/50020db0-3bad-41f5-8da3-c66bc0a90fe6@gmail.com/

 drivers/staging/gdm724x/TODO      | 1 -
 drivers/staging/gdm724x/gdm_mux.c | 4 ++--
 drivers/staging/gdm724x/gdm_usb.c | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

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
index 9b12619671a1..456e7cb66f03 100644
--- a/drivers/staging/gdm724x/gdm_mux.c
+++ b/drivers/staging/gdm724x/gdm_mux.c
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
index 54bdb64f52e8..e4bbab6cb047 100644
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
 
@@ -991,7 +991,7 @@ static int __init gdm_usb_lte_init(void)
 {
 	if (gdm_lte_event_init() < 0) {
 		pr_err("error creating event\n");
-		return -1;
+		return -ENODEV;
 	}
 
 	return usb_register(&gdm_usb_lte_driver);
-- 
2.34.1

