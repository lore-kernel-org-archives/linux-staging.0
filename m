Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BDE3FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:45:45 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id g8so4139460edt.7
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nDwYiDOns8dNazua/uS9cfYsJtzSJs0ViVitlyXDhbo=;
        b=JS6flJmOF8Ikzm7Eb+zR9v9RHfQtfMyi6gXK5OvAwYmJHuxaQd6urS09bItBZgxoe1
         LKBH2JxuOKrMe4oFG/ZSOD8kIzmZ/WJSozrH/33lxupkTIRu622uNY7OmlKzflJ0rdNR
         TSL6XN9zj6RW17PIqMyMgKyJ+HobrFthdzUmOIBqcjIMxnBI8+6biFuNIUGuLFy4j54U
         cBiGFxnRm75bITd1qSUj5uN6TCLc6hk40GZe3B2CurrAS+IkT1M1sFOQdPa1Et49rQBE
         PG/undFTrl66Sa7wkzqkOjTOgBl3LnwNJZD6cgh9OY7XAaEsoX83Q6UOBWlMHBf8KcjP
         4iBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nDwYiDOns8dNazua/uS9cfYsJtzSJs0ViVitlyXDhbo=;
        b=F4+tEunSqSf5krd9OYuPlWQ+OPTmUeOrnqRWqJSeIkctMihMP4RMS7WhL+yzhyprv+
         9+QesEKw7AF5ta/Mfr9OQfPV9tWAcgOhGsWxAz4lISb+PMrg3N/uI0DyzAocJBz5Ybch
         iNA4bfqm9Tiy/Y9pxMGbWIPcGLwXoE59bBk0geVF43rL1tgRmUBF9xPz/3X8D14ob+aq
         mQLBn1s+5XP5BMV+cZ3SAvWBEk25I7UcsmOCnGHcBxwIdoKqIkow3b3f/1XfAL71kpmK
         Ub4oe6j1XYA1MPPU0Ps3+g1oUGZH9DK9uMUEZHj6r4WTWDVeiUPHAb5HeGMg4hbUCjVb
         uEJg==
X-Gm-Message-State: AOAM533El8iYLxBr6Cy72KPLnpknAEinvT2StZC2shO5fz2cQRnWmCoz
	9dJvgam6j/ZS2PUBijIfuUw=
X-Google-Smtp-Source: ABdhPJxbgWfokUufBmxir+vc47DffoFwBe9O22Y83mXj/drLqx5pk2fxDTIsO+ZnvZuUNJZCw5W47Q==
X-Received: by 2002:a05:6402:42d4:: with SMTP id i20mr19999620edc.348.1631709943460;
        Wed, 15 Sep 2021 05:45:43 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:45:43 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Philip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v5 19/19] staging: r8188eu: remove shared buffer for usb requests
Date: Wed, 15 Sep 2021 14:41:49 +0200
Message-Id: <20210915124149.27543-20-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915124149.27543-1-fmdefrancesco@gmail.com>
References: <20210915124149.27543-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Skripkin <paskripkin@gmail.com>

This driver used shared buffer for usb requests. It led to using
mutexes, i.e no usb requests can be done in parallel.

USB requests can be fired in parallel since USB Core allows it. In
order to allow them, remove usb_vendor_req_buf from dvobj_priv (since
USB I/O is the only user of it) and remove also usb_vendor_req_mutex
(since there is nothing to protect).

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 29 ++++++++++-----------
 drivers/staging/r8188eu/include/drv_types.h |  5 ----
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 29 +--------------------
 3 files changed, 15 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 656f3a774e48..0ed4e6c8b1f5 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -19,9 +19,9 @@ static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
 	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
 		return -EPERM;
 
-	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
-
-	io_buf = dvobjpriv->usb_vendor_req_buf;
+	io_buf = kmalloc(size, GFP_KERNEL);
+	if (!io_buf)
+		return -ENOMEM;
 
 	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
 				      REALTEK_USB_VENQT_READ, addr,
@@ -39,7 +39,7 @@ static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
 		 * exist or is not enabled.
 		 */
 		adapt->bSurpriseRemoved = true;
-		goto mutex_unlock;
+		goto end;
 	}
 
 	if (status < 0) {
@@ -49,15 +49,14 @@ static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
 		if (rtw_inc_and_chk_continual_urb_error(dvobjpriv))
 			adapt->bSurpriseRemoved = true;
 
-		goto mutex_unlock;
+		goto end;
 	}
 
 	rtw_reset_continual_urb_error(dvobjpriv);
 	memcpy(data, io_buf, size);
 
-mutex_unlock:
-	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
-
+end:
+	kfree(io_buf);
 	return status;
 }
 
@@ -72,9 +71,10 @@ static int usb_write(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
 	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
 		return -EPERM;
 
-	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
+	io_buf = kmalloc(size, GFP_KERNEL);
+	if (!io_buf)
+		return -ENOMEM;
 
-	io_buf = dvobjpriv->usb_vendor_req_buf;
 	memcpy(io_buf, data, size);
 
 	status = usb_control_msg_send(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
@@ -93,7 +93,7 @@ static int usb_write(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
 		 * exist or is not enabled.
 		 */
 		adapt->bSurpriseRemoved = true;
-		goto mutex_unlock;
+		goto end;
 	}
 
 	if (status < 0) {
@@ -103,14 +103,13 @@ static int usb_write(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
 		if (rtw_inc_and_chk_continual_urb_error(dvobjpriv))
 			adapt->bSurpriseRemoved = true;
 
-		goto mutex_unlock;
+		goto end;
 	}
 
 	rtw_reset_continual_urb_error(dvobjpriv);
 
-mutex_unlock:
-	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
-
+end:
+	kfree(io_buf);
 	return status;
 }
 
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 626c6273be6f..499b2bce8cbe 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -168,11 +168,6 @@ struct dvobj_priv {
 	int	ep_num[5]; /* endpoint number */
 	int	RegUsbSS;
 	struct semaphore usb_suspend_sema;
-	struct mutex  usb_vendor_req_mutex;
-
-	u8 *usb_alloc_vendor_req_buf;
-	u8 *usb_vendor_req_buf;
-
 	struct usb_interface *pusbintf;
 	struct usb_device *pusbdev;
 
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 306325818a9a..7603cb026368 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -73,29 +73,6 @@ static struct rtw_usb_drv rtl8188e_usb_drv = {
 
 static struct rtw_usb_drv *usb_drv = &rtl8188e_usb_drv;
 
-static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
-{
-	u8 rst = _SUCCESS;
-
-	mutex_init(&dvobj->usb_vendor_req_mutex);
-
-	dvobj->usb_alloc_vendor_req_buf = kzalloc(MAX_USB_IO_CTL_SIZE, GFP_KERNEL);
-	if (!dvobj->usb_alloc_vendor_req_buf) {
-		DBG_88E("alloc usb_vendor_req_buf failed... /n");
-		rst = _FAIL;
-		goto exit;
-	}
-	dvobj->usb_vendor_req_buf = (u8 *)N_BYTE_ALIGMENT((size_t)(dvobj->usb_alloc_vendor_req_buf), ALIGNMENT_UNIT);
-exit:
-	return rst;
-}
-
-static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
-{
-	kfree(dvobj->usb_alloc_vendor_req_buf);
-	mutex_destroy(&dvobj->usb_vendor_req_mutex);
-}
-
 static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
 {
 	int	i;
@@ -158,9 +135,6 @@ static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
 		DBG_88E("NON USB_SPEED_HIGH\n");
 	}
 
-	if (rtw_init_intf_priv(pdvobjpriv) == _FAIL)
-		goto free_dvobj;
-
 	/* 3 misc */
 	sema_init(&pdvobjpriv->usb_suspend_sema, 0);
 	rtw_reset_continual_urb_error(pdvobjpriv);
@@ -169,7 +143,6 @@ static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
 
 	status = _SUCCESS;
 
-free_dvobj:
 	if (status != _SUCCESS && pdvobjpriv) {
 		usb_set_intfdata(usb_intf, NULL);
 		kfree(pdvobjpriv);
@@ -200,7 +173,7 @@ static void usb_dvobj_deinit(struct usb_interface *usb_intf)
 				usb_reset_device(interface_to_usbdev(usb_intf));
 			}
 		}
-		rtw_deinit_intf_priv(dvobj);
+
 		kfree(dvobj);
 	}
 
-- 
2.33.0

