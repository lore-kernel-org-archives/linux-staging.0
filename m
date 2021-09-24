Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03AE3FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:48 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id v24so35443165eda.3
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IucAc/qAxnfh7vVamv7kHUvrKnYQaxRt5IMV6QC88mw=;
        b=B2kX3FL+aGyOauUiu/vIIbwzQE9ZXy84fQXOTWBZP7oL32MO20DUhaCG/RbBzmHpMz
         e71kO7lh4yRzhcD0IufPSrJdUAz+qrbdoJv3bJJh77MJmoLow/FxxhS+uIbDOU1CySDH
         qm0wjZE03sgSyVVJKBPhd4Zqt0n0lR6oO6mRjZ3/7pexatErWSPVx0uLIWbFpTPpdUri
         gvydRqil7WzKlI+Bcdj8ti2HfZScw46gJGlRb89mstAk26BKkcd6jSmwGy38mzHjjChl
         itqzZIQQX9AR4zzcjq4M77vI8lewmZ4Ln1kPgUSC2DNIHRi7y8qvJT7e3PEsc3iyfXGE
         py9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IucAc/qAxnfh7vVamv7kHUvrKnYQaxRt5IMV6QC88mw=;
        b=r2Z2lgKduDaSOdZw3UOUfdVA0jl/r2kHM/egK37yUPoE9V2VIWfWQ+n2nqnig5s+xf
         M2WXcgZiBAXFJRKbCle9sMpSbFkw22ZtU7LpEWL+MW6QC++a95pM9kgra6avm+J2iWW1
         JHvAORblaJ4khtEzzVRRXSksvoFEiUYD0YoSBHsPfXT8TZAs/zb8DWJGvXCoSUzZXSjH
         V7ZTwisecejannWUP3rt6MObFQORoD6tNLWA4+44Tbc3uvCoC+9CUmqm4QFDmZaZm+0g
         +g30GwB7Q5GiliRfLATCSxgJEEWQdJc0PVleiJJwEjUnfOlNt2HNgSfuXYPWX0iIKo6d
         ID7w==
X-Gm-Message-State: AOAM533G/Q6CsB32OI3erE0p1C35TUMSb3JmHI/L3zFE2TUmA5NGmG28
	3sJqucVgQc26lPXj73WCEVE=
X-Google-Smtp-Source: ABdhPJxyYRJzrJl8qPDYmMnAzYHDbDvywzH2jwohNcbUoFBqFG4m74xQtA9yZw4GUuOqIZCQB5N9kw==
X-Received: by 2002:aa7:c459:: with SMTP id n25mr4596171edr.29.1632486467191;
        Fri, 24 Sep 2021 05:27:47 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:46 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v10 15/16] staging: r8188eu: remove shared buffer for USB requests
Date: Fri, 24 Sep 2021 14:27:04 +0200
Message-Id: <20210924122705.3781-16-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924122705.3781-1-fmdefrancesco@gmail.com>
References: <20210924122705.3781-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Skripkin <paskripkin@gmail.com>

Remove the shared buffer for USB requests because it is not necessary
and use a local on stack variable since the new Core USB API does not
have the constraints of usb_control_msg().

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 ++++++---------
 drivers/staging/r8188eu/include/drv_types.h |  3 ---
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 14 +-------------
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 88db7488b3a2..3ede93cd68d6 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -14,7 +14,7 @@ static int usb_read(struct intf_hdl *intf, u16 value, void *data, u8 size)
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
 	int status;
-	u8 *io_buf; /* Pointer to I/O buffer */
+	u8 io_buf[4];
 
 	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
@@ -23,9 +23,6 @@ static int usb_read(struct intf_hdl *intf, u16 value, void *data, u8 size)
 		goto mutex_unlock;
 	}
 
-	/*  Acquire IO memory for vendorreq */
-	io_buf = dvobjpriv->usb_vendor_req_buf;
-
 	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
 				      REALTEK_USB_VENQT_READ, value,
 				      REALTEK_USB_VENQT_CMD_IDX, io_buf,
@@ -70,14 +67,14 @@ static int usb_write(struct intf_hdl *intf, u16 value, void *data, u8 size)
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
 	int status;
-	u8 *io_buf; /* Pointer to I/O buffer */
+	u8 io_buf[VENDOR_CMD_MAX_DATA_LEN];
 
 	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
-	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
-		return -EPERM;
-
-	io_buf = dvobjpriv->usb_vendor_req_buf;
+	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx) {
+		status = -EPERM;
+		goto mutex_unlock;
+	}
 
 	memcpy(io_buf, data, size);
 	status = usb_control_msg_send(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index c96a33c8c621..6d63429d06c6 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -168,9 +168,6 @@ struct dvobj_priv {
 	struct semaphore usb_suspend_sema;
 	struct mutex  usb_vendor_req_mutex;
 
-	u8 *usb_alloc_vendor_req_buf;
-	u8 *usb_vendor_req_buf;
-
 	struct usb_interface *pusbintf;
 	struct usb_device *pusbdev;
 
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 11a584cbe9d8..5ab42d55207f 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -75,24 +75,12 @@ static struct rtw_usb_drv *usb_drv = &rtl8188e_usb_drv;
 
 static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
 {
-	u8 rst = _SUCCESS;
-
 	mutex_init(&dvobj->usb_vendor_req_mutex);
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
+	return _SUCCESS;
 }
 
 static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
 {
-	kfree(dvobj->usb_alloc_vendor_req_buf);
 	mutex_destroy(&dvobj->usb_vendor_req_mutex);
 }
 
-- 
2.33.0

