Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72B52F12A0
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764111395; cv=none; b=KA7HW+jT+QOGW5lQsh0n7RrkPfEwdbWO9dSr4riFKEr4AEy4QSxFay/r7nDGbGQYd2wv7GVw+dvndAwpYkUj1lY21OZChIOIK1u0P+/vFln0FtKjm9zefusKCGej6W3tkHqPNMC3iXkv8gZxkHAnyAc6KbyCLJmNjpSa5qkimME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764111395; c=relaxed/simple;
	bh=UpVyaBs8eAOQi08DfycyxuWW04wnSjnuFTX2AkrDpkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFkw6tV7BM95r9H8yuIGd6nFVZKYatmOHbAXEaMHPFkaG6LBj0vpzBhuxvvL6orx82tGUTLtczCw//u65yt0zb3X/9R8XabKkOnZCzeyiiJkL0+X/W2RxkNevKz5BJXu/ue2wfoNl4vMrKhMGYpW7mtdqSBqdgwFmNzic1JM3jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxMldhxa; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxMldhxa"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so6646100a91.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 14:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764111393; x=1764716193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8infRYS555HXMSuFzeioCvs9HbNCrDo+QxiT/yj2jU=;
        b=TxMldhxaTEYrF6v/eyb20kgnjj/IO3PWvKEBXi7f9rHKP+bCBXBpABX9eu5zXi49Ag
         O6JwvUSV5gRIyyZDvd/4CP371l7XZjq27mWR2sNKXMaa16GD51Lx5ouDamPLRZiQ+12w
         2IZK+r1oK0XD3PAdsouH3eM+fyrY16Uyd742np+iYUnTVJ1EzCHtXVFqMb7MAfPmUAVT
         wK0QRN/8ea/SNBMVF9j9avoWOJqWpTkGC0NsUHH0/b1VPMD7c54HIvOw0GqlhySUMJJg
         O/YuULLWJJSyz5UZYSkJBEqWvB1LI/93Z4Yn+VyoMm9cSeAwqvDA+JgeICwT6x4yoqXL
         Hfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764111393; x=1764716193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8infRYS555HXMSuFzeioCvs9HbNCrDo+QxiT/yj2jU=;
        b=vnJfs4wntVrO0p/2oLQ2/D1Tuy37ay1CrM7FSyaoUiRa8kjIa1vYEjzNGIRM1BCEDQ
         k8qp9htRs/Zs41jDm8mC6M+RRneQoR7z4WaTQnYXNZgmfNQkx3decHSB/2fta3QP0GZ/
         U8OF2YJ0u2JFi1yD6WT4qOYV8DHbHEtrb1zEzrkfl2Qvhc6pJCuN9fwssnOVAVVvYNsw
         QHxQYz33TRA9/am7lxguyUfuaV50el1HScaDlZNm5CYrZPKeYn04TkWm4YYiBtObP+VK
         eOYE0hFZl6uM9aBB86RajKQbogiEU+sQC8jd1RUqYI+PEU2ab7CJwgNW7L5Gj8F8fmpv
         Qq5Q==
X-Gm-Message-State: AOJu0Yz/WdO/CLS9U9/J0MMmLXDRhzfV9o2WdpwPoMoP0Ryt1M34n/qN
	eW7uMWsmqtawKIb5Kpvy7xk8W6XO2oNZzG+mk78HX5/FXIFoxQvvkp6t
X-Gm-Gg: ASbGncsKNSAC8SO+Je/TiH6Zdmyy3PzdPUwzTVEd+BqCmPB/6dJoeBxF1FYtoEfFHBa
	+VMcxIxMEZ6sfDt5Q1e707T36idJPllr3ByqfRxNTnfgBYwP+5LS/IUCA9WBB/ypkb+lkB73e9B
	TO3NJ6+CsJzGAX/tBa/rU3Xsc55BbGQL04WAM0nx7GvWJAnSNyyvzsacyEr4USYXXY9We1Sz9D+
	jK4aRCWduT9JgHAxviyl7PQtOClk4JmCUi/6UTdr9K+31oqLC7AxQRjPiJcMf+qzQrK+v4HC0Ec
	Jw6z2YGM0fzZZPcZb2CFyLHFrqBt19kKLcFz1MIPGEIWMOftbaW9jzxbIl63VIJ7Konr5URnOOK
	pxJ1nhUhvfGa3NlHOEiHdh0xP9vgrNBM8lQYwJnDXMbDUuqMIYVyxsajuVF+3m6tAz0EXN0h7F1
	Uxcn3vPw9c9551pNvhprIFJ0jJOvVL1jwq6X6wzzjl58ZiIb9nCJUGvgUmo/XuOlQZhOv3Gu7NI
	7Z7uJB8rZIU3ulSiYY4P6c+ABMq4ShVnVOKnhSamtojVYQiKhfr4oSQPL2x5rT7pGpNDKvXHjuX
	Y9ndsak/j7UOl1gX2hio8nnktvKjsTQo6A==
X-Google-Smtp-Source: AGHT+IESYLJoTPg6cuS+nu96MVtqOjXbB1YQv3xzSC+BtOZqok/UZvc//J7EfkYrIt5EuDPpA/ldfQ==
X-Received: by 2002:a17:90b:4f4c:b0:340:be40:fe0c with SMTP id 98e67ed59e1d1-34733f5c930mr15298749a91.36.1764111393291;
        Tue, 25 Nov 2025 14:56:33 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a546ed0sm471842a91.3.2025.11.25.14.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:56:32 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 2/2] most: usb: remove double cleanup of interface on registration failure
Date: Tue, 25 Nov 2025 22:56:06 +0000
Message-ID: <20251125225606.70719-3-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125225606.70719-1-knavaneeth786@gmail.com>
References: <20251125225606.70719-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since most_register_interface() now correctly handles cleanup (calling
put_device on failure), the manual cleanup in hdm_probe() would cause
a double-free.

Remove the manual cleanup labels and return the error code directly.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/most/most_usb.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index 10064d7b72498..597cf7f4e6b90 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -1058,7 +1058,7 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 
 	ret = most_register_interface(&mdev->iface);
 	if (ret)
-		goto err_free_busy_urbs;
+		return ret;
 
 	mutex_lock(&mdev->io_mutex);
 	if (le16_to_cpu(usb_dev->descriptor.idProduct) == USB_DEV_ID_OS81118 ||
@@ -1068,8 +1068,7 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 		if (!mdev->dci) {
 			mutex_unlock(&mdev->io_mutex);
 			most_deregister_interface(&mdev->iface);
-			ret = -ENOMEM;
-			goto err_free_busy_urbs;
+			return -ENOMEM;
 		}
 
 		mdev->dci->dev.init_name = "dci";
@@ -1077,19 +1076,15 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
 		mdev->dci->dev.groups = dci_groups;
 		mdev->dci->dev.release = release_dci;
 		if (device_register(&mdev->dci->dev)) {
+			put_device(&mdev->dci->dev);
 			mutex_unlock(&mdev->io_mutex);
 			most_deregister_interface(&mdev->iface);
-			ret = -ENOMEM;
-			goto err_free_dci;
+			return -ENOMEM;
 		}
 		mdev->dci->usb_device = mdev->usb_device;
 	}
 	mutex_unlock(&mdev->io_mutex);
 	return 0;
-err_free_dci:
-	put_device(&mdev->dci->dev);
-err_free_busy_urbs:
-	kfree(mdev->busy_urbs);
 err_free_ep_address:
 	kfree(mdev->ep_address);
 err_free_cap:
-- 
2.43.0

