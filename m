Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FBB72
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:27 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id co2so7410701edb.8
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O82C03YloagAthHU/4LceoTF9cOKdZhZpm66vg1zJy8=;
        b=mNVjuGZwK5myPZSRDLRcromaigmhY+SKsHnlXS+5AmZ5QXGb1u7Eoey81STKDW1r5U
         2VIYFmk1gHS68YNteeCg10AjcVjLnDFgutmia6CJUMwnTHqkQkYgZ3DmSqGKBeFxLYjk
         9lQAX+2aDSoSU2EPDAA44PjnWN1DMKGQO9l3p4+F4zimfcEcNoDnbHREy3gBM9iAUvyI
         iyMzlVSzdI+FvXMedpFFziojJ06nGlbDlFXUS5OjavptaRSCsuXBK/OsVh38Pdm6LbTS
         lwMPuWjhbWjFJBGoGu9uXjnKjqXE7kKcmD6umyxqPhzO+pqu+uwyXNVYwVSFl92Jy138
         bMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O82C03YloagAthHU/4LceoTF9cOKdZhZpm66vg1zJy8=;
        b=zlR23pMzfhYSLC10lBQ2Cww9g598QYrslRlnrhrAUOPzbD8v9GvFkMLHcr7fr4N+ps
         rO6aIguHECXQHFqlLRq2KHX+0RBYF87PnBr2TOX0htoq8fRKmlD/t8POORmsaHOq7/07
         FAg4D0pxIyL/pnBECR1yNoHi4XihgNdMux/tGboepuT5F/56w0Megmt+KvKu6x82lxSP
         yv/qiNJ8w8HFESKqES2jEqRFOk9aOsRqhuhzs+Oko2uUh3R6/bYEHJpIANSWm9etudYI
         4kmOvSTGPELi9sGXZ+tSaeS9sILzcfADGoGdE3qp46pNhEoh+Nyi6HRm8KH8g/cR8nR+
         BvZw==
X-Gm-Message-State: AOAM533MQGLGAvkEhvGWRiRizX/Gb9j6SMFzDfwV60LR+g4TYM+EdWIe
	SbZ4sOUb+C+lYjn0cwi8bws=
X-Google-Smtp-Source: ABdhPJzTtNTokxweesfNrp2si1ldHOjj9hxqXTIjz4S3d9Pq55w+OEislc+J39t059HIlufrJuONHQ==
X-Received: by 2002:a17:907:7613:: with SMTP id jx19mr26235693ejc.453.1632095665683;
        Sun, 19 Sep 2021 16:54:25 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v8 18/19] staging: r8188eu: remove shared buffer for USB requests
Date: Mon, 20 Sep 2021 01:53:55 +0200
Message-Id: <20210919235356.4151-19-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919235356.4151-1-fmdefrancesco@gmail.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
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
 drivers/staging/r8188eu/hal/usb_ops_linux.c |  8 ++------
 drivers/staging/r8188eu/include/drv_types.h |  3 ---
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 14 +-------------
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 2552450ab152..75500c28d6e6 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -14,15 +14,13 @@ static int usb_read(struct intf_hdl *intfhdl, u16 value, void *data, u8 size)
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
 	int status;
-	u8 *io_buf; /* Pointer to I/O buffer */
+	u8 io_buf[4];
 
 	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
 	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
 		return -EPERM;
 
-	io_buf = dvobjpriv->usb_vendor_req_buf;
-
 	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
 				      REALTEK_USB_VENQT_READ, value,
 				      REALTEK_USB_VENQT_CMD_IDX, io_buf,
@@ -67,15 +65,13 @@ static int usb_write(struct intf_hdl *intfhdl, u16 value, void *data, u8 size)
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
 	int status;
-	u8 *io_buf; /* Pointer to I/O buffer */
+	u8 io_buf[VENDOR_CMD_MAX_DATA_LEN];
 
 	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
 	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
 		return -EPERM;
 
-	io_buf = dvobjpriv->usb_vendor_req_buf;
-
 	memcpy(io_buf, data, size);
 	status = usb_control_msg_send(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
 				      REALTEK_USB_VENQT_WRITE, value,
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 626c6273be6f..7907dd7b5bf0 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -170,9 +170,6 @@ struct dvobj_priv {
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

