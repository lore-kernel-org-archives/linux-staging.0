Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88658192D9D
	for <linux-staging@lists.linux.dev>; Sat, 18 Jan 2025 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737211867; cv=none; b=Mjco/vqYYuiak2TKbArganWdS7M42ReWoxOvrfTGye66xnxj/t1qHz+gHYVRjsfs/NFC323p21OGcRYlB09CrIeCom0sOPjTMp/YmdEoUf4zLaxyqqyBTDX9cI9vu3ErGkPy930PDZRo+7qP5NV0PmQmoJEk5nhp0LPtV11O6Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737211867; c=relaxed/simple;
	bh=0oZu/oNzQjJDG7FZuy3LOM3J7EyGV+I6MYjuxkqW1lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzFokciv+MjzlFht25sDVpLfUPxe0tfud3d6LN7gBfJ/97ab1jaNkYLXF8fW19Cw2kyIbeV1NrjgD2xERiJilV3ZutlRCNyuZy1chFnApfW9AX0GE59D5KH1PaX36/bcth6+fy4SVHIe7ZVaqDWpk/lR+eq1zHBCYjpV4TarIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QA0xiekN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QA0xiekN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso18918715e9.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jan 2025 06:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737211864; x=1737816664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsRkYHRIphje2UKglTi53au0YUGaH++C1fvSlmQIJyg=;
        b=QA0xiekNwdK8er6kggitsxukMJvJ9Lxt2AYrQKKJ4QkZuK7c5vqkQCGoDbNbvb0cgQ
         SK5FNXlX9BRfZ0u85hTjYKLhuh/Djf3E/jEhgCH/UWsYG7yejGaNjg1HAG8N6Gw6DQCO
         e4TDuuaP4hCYuGrwRZREhl7frOb0dsTazx4AvCc2t4az9JmtMTi5EH+nKbyNGaqUnbal
         RK2y7r5gYqLuEI/k+uOkhH72rL4c6GO8Rdcsz4g4OKZ3Kc04MUamwqymMorl+4Jowuv6
         v16aNrJfVhgkWZweW0rXK+Uh/ve5sWT79Xadoz2bO4HZoWb3zGUgP4YKXSr0Z0t2fk1+
         gwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737211864; x=1737816664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsRkYHRIphje2UKglTi53au0YUGaH++C1fvSlmQIJyg=;
        b=bluKbBjSPWupEZWdtjehwEPFBOSqFH+qDN7/a3EAu9Q6GPLzQtI0MEs1dc8Zn91lbp
         zxueEru251rpM2yWrs2Rwn5FybZd8h6tHGdGFgDoIVoa6jIpMcmNzLE6Xioxr81hZ9Af
         ycoV+xHjvSAomWwx+vlrrMuNgRqKE+YCWFqOQi4roWwej9azOEgRD0h5Id1VUZeHxs4P
         kVbTCc3TEJtV0GReuphNdP7dG3SPIHM5W/vc5g7Qapr0PyPCLExtuzPmiiZMv4lgRR1T
         eNKz61D/cZwUyrDh8FcJl4S345W/IJhqLqkoH+VxCWBAsB8r80S7oM6etYQl7Z48VwXK
         bwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw8Qynb8zdyxpOI7aJb0L8zeqXBDoIu28herDaliLziK1sNE4pxDzIvZGRuH6SmHdrCeBWi9aIvljA6+fX@lists.linux.dev
X-Gm-Message-State: AOJu0YzRE8MSfTVFqHOJz1LXsm19pVt1dRqqLUNF0CQSMRhglkv4+4Ry
	UY1sB5U+fWs5Iu/8uAQaax8MWOUmPetKE3vdz0qs8kaDqBPRswJrehg+NNZW
X-Gm-Gg: ASbGncvub+eBr3AwxsMwewtABFRLg09c8R25dShd13hmz9a7SvXH5YYhFEYhaMCXIBY
	DW9rUciCpKk2/7wraeVwF0Q7/BhaTYUQCJ7XY0JxMnB8kgogvM6jDU9e6pQ3KOL+TY08RRZtnOW
	DVk+dM3NoMrXKF972UpFQIr0aUz3UsVQJITFktg/oZOKw0bRqNeICpXGOVXjW0IvBrNz+tAosTL
	Z/zPrLcguRyPk2jeacf9KiVZF0fPC8u5J4+7snOCmWOCQTBRGOnlqdFdpnoC+PLgaDF7fjv8sqK
	SftPefKFTzCl9/1zMWTVHhsiMq8UkQ==
X-Google-Smtp-Source: AGHT+IFdoOHXMrF4eM3ozHfrh0C9QsRmxgPCruVE8QcbdRcWdhE0KoHF7nSmM8P7+nQk04iciupuEA==
X-Received: by 2002:a05:600c:1c21:b0:434:f3d8:62db with SMTP id 5b1f17b1804b1-438918b9b23mr58668585e9.2.1737211863604;
        Sat, 18 Jan 2025 06:51:03 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c103f0afsm74701735e9.2.2025.01.18.06.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 06:51:02 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/2] staging: gpib: Agilent usb code cleanup
Date: Sat, 18 Jan 2025 15:50:46 +0100
Message-ID: <20250118145046.12181-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118145046.12181-1-dpenkler@gmail.com>
References: <20250118145046.12181-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove useless #ifdef RESET_USB_CONFIG code.

Change kalloc / memset to kzalloc

The attach function was not freeing the private data on error
returns. Separate the releasing of urbs and private data and
add a common error exit for attach failure.

Set the board private data pointer to NULL after freeing
the private data.

Reduce console spam by emitting only one attach message.

Change last pr_err in attach to dev_err

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 .../gpib/agilent_82357a/agilent_82357a.c      | 84 ++++++++-----------
 1 file changed, 36 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 2aaccebc3c7b..69f0e490d401 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1146,25 +1146,6 @@ static int agilent_82357a_setup_urbs(gpib_board_t *board)
 	return retval;
 }
 
-#ifdef RESET_USB_CONFIG
-static int agilent_82357a_reset_usb_configuration(gpib_board_t *board)
-{
-	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
-	struct usb_device *usb_dev;
-	int retval;
-
-	if (!a_priv->bus_interface)
-		return -ENODEV;
-	usb_dev = interface_to_usbdev(a_priv->bus_interface);
-	retval = usb_reset_configuration(usb_dev);
-	if (retval)
-		dev_err(&usb_dev->dev, "%s: usb_reset_configuration() returned %i\n",
-			__func__, retval);
-	return retval;
-}
-#endif
-
 static void agilent_82357a_cleanup_urbs(struct agilent_82357a_priv *a_priv)
 {
 	if (a_priv && a_priv->bus_interface) {
@@ -1175,15 +1156,23 @@ static void agilent_82357a_cleanup_urbs(struct agilent_82357a_priv *a_priv)
 	}
 };
 
+static void agilent_82357a_release_urbs(struct agilent_82357a_priv *a_priv)
+{
+	if (a_priv) {
+		usb_free_urb(a_priv->interrupt_urb);
+		a_priv->interrupt_urb = NULL;
+		kfree(a_priv->interrupt_buffer);
+	}
+}
+
 static int agilent_82357a_allocate_private(gpib_board_t *board)
 {
 	struct agilent_82357a_priv *a_priv;
 
-	board->private_data = kmalloc(sizeof(struct agilent_82357a_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct agilent_82357a_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
 	a_priv = board->private_data;
-	memset(a_priv, 0, sizeof(struct agilent_82357a_priv));
 	mutex_init(&a_priv->bulk_transfer_lock);
 	mutex_init(&a_priv->bulk_alloc_lock);
 	mutex_init(&a_priv->control_alloc_lock);
@@ -1191,11 +1180,11 @@ static int agilent_82357a_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-static void agilent_82357a_free_private(struct agilent_82357a_priv *a_priv)
+static void agilent_82357a_free_private(gpib_board_t *board)
 {
-	usb_free_urb(a_priv->interrupt_urb);
-	kfree(a_priv->interrupt_buffer);
-	kfree(a_priv);
+	kfree(board->private_data);
+	board->private_data = NULL;
+
 }
 
 static int agilent_82357a_init(gpib_board_t *board)
@@ -1342,16 +1331,14 @@ static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t
 			a_priv->bus_interface = agilent_82357a_driver_interfaces[i];
 			usb_set_intfdata(agilent_82357a_driver_interfaces[i], board);
 			usb_dev = interface_to_usbdev(a_priv->bus_interface);
-			dev_info(&usb_dev->dev,
-				 "bus %d dev num %d attached to gpib minor %d, agilent usb interface %i\n",
-				 usb_dev->bus->busnum, usb_dev->devnum, board->minor, i);
 			break;
 		}
 	}
 	if (i == MAX_NUM_82357A_INTERFACES) {
-		mutex_unlock(&agilent_82357a_hotplug_lock);
-		pr_err("No Agilent 82357 gpib adapters found, have you loaded its firmware?\n");
-		return -ENODEV;
+		dev_err(board->gpib_dev,
+			"No Agilent 82357 gpib adapters found, have you loaded its firmware?\n");
+		retval = -ENODEV;
+		goto attach_fail;
 	}
 	product_id = le16_to_cpu(interface_to_usbdev(a_priv->bus_interface)->descriptor.idProduct);
 	switch (product_id) {
@@ -1365,21 +1352,13 @@ static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t
 		break;
 	default:
 		dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
-		mutex_unlock(&agilent_82357a_hotplug_lock);
-		return -EIO;
-	}
-#ifdef RESET_USB_CONFIG
-	retval = agilent_82357a_reset_usb_configuration(board);
-	if (retval < 0)	{
-		mutex_unlock(&agilent_82357a_hotplug_lock);
-		return retval;
+		retval = -EIO;
+		goto attach_fail;
 	}
-#endif
+
 	retval = agilent_82357a_setup_urbs(board);
-	if (retval < 0)	{
-		mutex_unlock(&agilent_82357a_hotplug_lock);
-		return retval;
-	}
+	if (retval < 0)
+		goto attach_fail;
 
 	timer_setup(&a_priv->bulk_timer, agilent_82357a_timeout_handler, 0);
 
@@ -1388,11 +1367,19 @@ static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t
 	retval = agilent_82357a_init(board);
 
 	if (retval < 0)	{
-		mutex_unlock(&agilent_82357a_hotplug_lock);
-		return retval;
+		agilent_82357a_cleanup_urbs(a_priv);
+		agilent_82357a_release_urbs(a_priv);
+		goto attach_fail;
 	}
 
-	dev_info(&usb_dev->dev, "%s: attached\n", __func__);
+	dev_info(&usb_dev->dev,
+		 "bus %d dev num %d attached to gpib minor %d, agilent usb interface %i\n",
+		 usb_dev->bus->busnum, usb_dev->devnum, board->minor, i);
+	mutex_unlock(&agilent_82357a_hotplug_lock);
+	return retval;
+
+attach_fail:
+	agilent_82357a_free_private(board);
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 	return retval;
 }
@@ -1455,7 +1442,8 @@ static void agilent_82357a_detach(gpib_board_t *board)
 		mutex_lock(&a_priv->bulk_alloc_lock);
 		mutex_lock(&a_priv->interrupt_alloc_lock);
 		agilent_82357a_cleanup_urbs(a_priv);
-		agilent_82357a_free_private(a_priv);
+		agilent_82357a_release_urbs(a_priv);
+		agilent_82357a_free_private(board);
 	}
 	dev_info(board->gpib_dev, "%s: detached\n", __func__);
 	mutex_unlock(&agilent_82357a_hotplug_lock);
-- 
2.47.1

