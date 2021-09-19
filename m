Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A9C3FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id h17so54025597edj.6
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WOG+AWlD37LsKsY4CtChdS/HLIxRLLNzgoOgo5s/LdY=;
        b=eKkxBwAgN3JonhVcqRGjAdOitD75f0Jc+RDDfgCIiHU1EWnzksSI/AXW05duQOatBl
         gN0kZbNPV+noDqWQUcawnm/UFjUBgqGqe5fJnzv/BmvTFukeHcUmwmmEKTrYQA/lVfyj
         YA9NE7oduMwxZ19cLX0tbeS4UNQsE6sbMbMugPaaFj9aWq8/SsYvg9YfzESieBt418Tb
         6IMfP+IpSE9ybWwVeDwsVz7M109O8zxycpmH2W+Iy+taIquiDdARyXPnX6+lUCldyxP2
         vb6xyTsBKOvoDdIzruC+Br5aVVndWhT2VngIyDrfvo8L9Z4S4gJpj4KMJPZaNHNNMtOt
         HB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WOG+AWlD37LsKsY4CtChdS/HLIxRLLNzgoOgo5s/LdY=;
        b=ozuZtteLQrLfxnkEF6DtZhaDpBhylLe7qRzoeGu+COw7rRVCK18RiaTHEEjKKGh1gz
         hfpr5X66wOlaYZIU5rRIeIPj9grpHOcf34DcYBYovDdaoCmy88GYmfkBJr7/MYrUfky9
         LPo/O4AOzPpIWMz4wrbW3mzZX5cnbBtzXMnAiL6U/AIB8zKS4ZPSRn9NG3o9zF7wfCoX
         uER6fzNawyah/Oqf5msqAJW1iPFM5TT9uuWWkfXZoQeijA5Idg710/d1umQkBllzNbf7
         egaXUmE8F4FdBBL5sZsWqHumJ4qxMv+ufdfrDgHchpr25r0XBOa/dyEHsjdXv8tIFVvF
         zEOQ==
X-Gm-Message-State: AOAM5304eyvJxR8yV7lwXfPBKuUB3hPWHTTLJKG4LbZIV3D6Jbcez6fd
	b+xv2Ov0GHtGVRuoSTJzXj0=
X-Google-Smtp-Source: ABdhPJx+TY8RnNN1cJhf9h43Hj9tm5vyywmvOjaHVXNtJpXCTrwS1HnaiouSmgSXky5LBbV5AxVjQw==
X-Received: by 2002:a17:906:c205:: with SMTP id d5mr25622574ejz.74.1632095664378;
        Sun, 19 Sep 2021 16:54:24 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:23 -0700 (PDT)
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v8 17/19] staging: r8188eu: call the new usb_write() from rtw_write{8,16,32,N}()
Date: Mon, 20 Sep 2021 01:53:54 +0200
Message-Id: <20210919235356.4151-18-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919235356.4151-1-fmdefrancesco@gmail.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Create and call new usb_write() instead of usbctrl_vendorreq() from
inside rtw_write{8,16,32,N}().

In old code, rtw_write{8,16,32,N}() called usbctrl_vendorreq() which in
turn uses usb_control_msg() from within a "while" loop to build a control
URB, send it off and wait for completion. usbctrl_vendorreq() was used
for both receiving and sending messages, depending on the "requesttype"
argument which is passed by callers.

Compared to usbctrl_vendorreq(), which manages both reads and writes
from and to the USB endpoint, the new usb_write() manages only writes.
For this purpose it uses the newer USB Core usb_control_msg_send() API.
The latter is preferred according both to suggestions by Greg Kroah-Hartman
and also to its actual design.

A noteworthy feature of usb_control_msg_send() is that the data pointer
can be made to a reference on the stack because it does not have the
restriction that usb_control_msg() has where the data pointer must be to
dynamically allocated memory.

usbctrl_vendorreq() used a "while" loop that we considered unnecessary
so that it is not in the new usb_write(). Furthermore, the latter has no
redundant checking, less obvious comments, no debug prints, and it manages
errors before success case. All in all, usb_write() is simpler than
usbctrl_vendorreq() and uses less lines of code.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 117 +++++++-------------
 1 file changed, 42 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 53704b7c1059..2552450ab152 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -8,93 +8,60 @@
 #include "../include/recv_osdep.h"
 #include "../include/rtl8188e_hal.h"
 
-static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u16 len, u8 requesttype)
+static int usb_read(struct intf_hdl *intfhdl, u16 value, void *data, u8 size)
 {
 	struct adapter *adapt = intfhdl->padapter;
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
-	int vendorreq_times = 0;
-	unsigned int pipe;
-	int status = 0;
-	u8 *io_buf;
-
-	if ((adapt->bSurpriseRemoved) || (adapt->pwrctrlpriv.pnp_bstop_trx)) {
-		status = -EPERM;
-		goto exit;
-	}
-
-	if (len > MAX_VENDOR_REQ_CMD_SIZE) {
-		DBG_88E("[%s] Buffer len error ,vendor request failed\n", __func__);
-		status = -EINVAL;
-		goto exit;
-	}
+	int status;
+	u8 *io_buf; /* Pointer to I/O buffer */
 
 	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
-	/*  Acquire IO memory for vendorreq */
-	io_buf = dvobjpriv->usb_vendor_req_buf;
-
-	if (requesttype == REALTEK_USB_VENQT_READ)
-		/* read in */
-		pipe = usb_rcvctrlpipe(udev, 0);
-	else
-		/* write out */
-		pipe = usb_sndctrlpipe(udev, 0);
+	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
+		return -EPERM;
 
-	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
-		if (requesttype == REALTEK_USB_VENQT_READ)
-			memset(io_buf, 0, len);
-		else
-			memcpy(io_buf, data, len);
+	io_buf = dvobjpriv->usb_vendor_req_buf;
 
-		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
-					 requesttype, value, REALTEK_USB_VENQT_CMD_IDX,
-					 io_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
+	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
+				      REALTEK_USB_VENQT_READ, value,
+				      REALTEK_USB_VENQT_CMD_IDX, io_buf,
+				      size, RTW_USB_CONTROL_MSG_TIMEOUT,
+				      GFP_KERNEL);
 
-		if (status == len) {
-			/*  success */
-			rtw_reset_continual_urb_error(dvobjpriv);
-			if (requesttype == REALTEK_USB_VENQT_READ)
-				memcpy(data, io_buf,  len);
-		} else {
-			/* error cases */
-			DBG_88E("reg 0x%x, usb %s %u fail, status:%d value=0x%x, vendorreq_times:%d\n",
-				value, (requesttype == REALTEK_USB_VENQT_READ) ? "read" : "write",
-				len, status, *(u32 *)data, vendorreq_times);
-
-			if (status < 0) {
-				if (status == -ESHUTDOWN || status == -ENODEV) {
-					adapt->bSurpriseRemoved = true;
-				} else {
-					struct hal_data_8188e *haldata = GET_HAL_DATA(adapt);
-					haldata->srestpriv.wifi_error_status = USB_VEN_REQ_CMD_FAIL;
-				}
-			} else {
-				/* status != len && status >= 0 */
-				if (status > 0) {
-					if (requesttype == REALTEK_USB_VENQT_READ)
-						memcpy(data, io_buf,  len);
-				}
-			}
+	if (status == -ESHUTDOWN ||
+	    status == -ENODEV ||
+	    status == -ENOENT) {
+		/*
+		 * device or controller has been disabled due to
+		 * some problem that could not be worked around,
+		 * device or bus doesn’t exist, endpoint does not
+		 * exist or is not enabled.
+		 */
+		adapt->bSurpriseRemoved = true;
+		goto mutex_unlock;
+	}
 
-			if (rtw_inc_and_chk_continual_urb_error(dvobjpriv)) {
-				adapt->bSurpriseRemoved = true;
-				break;
-			}
+	if (status < 0) {
+		GET_HAL_DATA(adapt)->srestpriv.wifi_error_status =
+			USB_VEN_REQ_CMD_FAIL;
 
-		}
+		if (rtw_inc_and_chk_continual_urb_error(dvobjpriv))
+			adapt->bSurpriseRemoved = true;
 
-		/*  firmware download is checksummed, don't retry */
-		if ((value >= FW_8188E_START_ADDRESS && value <= FW_8188E_END_ADDRESS) || status == len)
-			break;
+		goto mutex_unlock;
 	}
 
+	rtw_reset_continual_urb_error(dvobjpriv);
+	memcpy(data, io_buf, size);
+
+mutex_unlock:
 	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
-exit:
+
 	return status;
 }
 
-static int usb_read(struct intf_hdl *intfhdl, u16 value, void *data, u8 size)
+static int usb_write(struct intf_hdl *intfhdl, u16 value, void *data, u8 size)
 {
 	struct adapter *adapt = intfhdl->padapter;
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
@@ -109,8 +76,9 @@ static int usb_read(struct intf_hdl *intfhdl, u16 value, void *data, u8 size)
 
 	io_buf = dvobjpriv->usb_vendor_req_buf;
 
-	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
-				      REALTEK_USB_VENQT_READ, value,
+	memcpy(io_buf, data, size);
+	status = usb_control_msg_send(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
+				      REALTEK_USB_VENQT_WRITE, value,
 				      REALTEK_USB_VENQT_CMD_IDX, io_buf,
 				      size, RTW_USB_CONTROL_MSG_TIMEOUT,
 				      GFP_KERNEL);
@@ -139,7 +107,6 @@ static int usb_read(struct intf_hdl *intfhdl, u16 value, void *data, u8 size)
 	}
 
 	rtw_reset_continual_urb_error(dvobjpriv);
-	memcpy(data, io_buf, size);
 
 mutex_unlock:
 	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
@@ -190,7 +157,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 	u16 value = addr & 0xffff;
 	int ret;
 
-	ret = usbctrl_vendorreq(intfhdl, value, &val, 1, REALTEK_USB_VENQT_WRITE);
+	ret = usb_write(intfhdl, value, &val, 1);
 
 	return RTW_STATUS_CODE(ret);
 }
@@ -203,7 +170,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 	__le16 data = cpu_to_le16(val);
 	int ret;
 
-	ret = usbctrl_vendorreq(intfhdl, value, &data, 2, REALTEK_USB_VENQT_WRITE);
+	ret = usb_write(intfhdl, value, &data, 2);
 
 	return RTW_STATUS_CODE(ret);
 }
@@ -216,7 +183,7 @@ int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 	__le32 data = cpu_to_le32(val);
 	int ret;
 
-	ret = usbctrl_vendorreq(intfhdl, value, &data, 4, REALTEK_USB_VENQT_WRITE);
+	ret = usb_write(intfhdl, value, &data, 4);
 
 	return RTW_STATUS_CODE(ret);
 }
@@ -231,7 +198,7 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 	if (length > VENDOR_CMD_MAX_DATA_LEN)
 		return _FAIL;
 
-	ret = usbctrl_vendorreq(intfhdl, value, data, length, REALTEK_USB_VENQT_WRITE);
+	ret = usb_write(intfhdl, value, data, length);
 
 	return RTW_STATUS_CODE(ret);
 }
-- 
2.33.0

