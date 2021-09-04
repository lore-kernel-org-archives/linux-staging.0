Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FA63FC9
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 15:04:59 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id i6so3056038edu.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MA2iPb7Y7XSM8PaYgGm1gxG6SO7HX4tBE977rEk5mU4=;
        b=PQeQ3jlfLdfJ/pWGFoHYQk8bg554iN+bYY+xJ+pwiaA0pS42M35TGWF3bhuM2Cdhey
         dTYq03zcSVI6V49lJjmFEoevxKzCCNQmKFhu1ARELQTpOidix32uxnGBZtZ5PgeF9hr9
         8rMblJHlBfYT17TQs9l4n3XHpyVcnhsw+e6+6NxCTPR6ZjeqvDUE92kt0XXSY5rTlsUz
         zhbwxvly7wA0Vov4gOWt0P06jHnXboqagWqMLGwYWHh856RPt4Qazw48GHFxI53DaLOP
         9LLkBjcwRsj9b2bwlBkDT/g1IRQptyIp+x11dOs4nk73lbMDEzfBS+sPnVZ4ccsq6eqi
         vV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MA2iPb7Y7XSM8PaYgGm1gxG6SO7HX4tBE977rEk5mU4=;
        b=DsxdFxEMnQkfojz4OVxFiH3TvuvCu81pbBycP3VX7nXMdhqFEHVBB7ElbF2htzT4Ho
         Ios1tE2aXFcWfl9BnOgm7jKw7UdgFj52xMF4sF9wbl3FtoBtcrjTlNmDJR6HMLyMMtZe
         WwbAGGbW6tJLByhBygsLu/yDB+e15wuH9HPUiDzTqJmgE2qZGZHEavc8JH6E1IkMPxDt
         S9IPw82+Om5qExSIR+sN4dftGz7Xoex5C8PPICUz80nELb1/nTaUTVS3nYp6bB2cW+IW
         VdnjLmyJmmaC0qDh9HLyH0tiZqUScuSv6OJ4g651/D11/2/IR0ckMSsu2RjkP/eNP+Fi
         mG+Q==
X-Gm-Message-State: AOAM530pvZKOYULJIHiFwABbpE9N8UASqOJ6ONmFtqC85qnxmUKxkjde
	KKi1QtzpPC6+4JaRa4DgRb8=
X-Google-Smtp-Source: ABdhPJwEWdJ+Khy5jVxEYeLVjWZAA7ZbonZdm8RKgeMdo1M1iGP4xB/jaK5OrhSzPRFs/CN6OS4EFQ==
X-Received: by 2002:a50:fe17:: with SMTP id f23mr4594874edt.390.1630767897878;
        Sat, 04 Sep 2021 08:04:57 -0700 (PDT)
Received: from localhost.localdomain (host-79-23-101-208.retail.telecomitalia.it. [79.23.101.208])
        by smtp.gmail.com with ESMTPSA id da16sm1463452edb.28.2021.09.04.08.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:04:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: Shorten calls chain of rtw_write8/16/32/N()
Date: Sat,  4 Sep 2021 17:04:47 +0200
Message-Id: <20210904150447.14659-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904150447.14659-1-fmdefrancesco@gmail.com>
References: <20210904150447.14659-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
For this purpose unify the four usb_write8/16/32/N() into the new
usb_write(); make the latter parameterizable with 'size'; embed most of
the code of usbctrl_vendorreq() into usb_write() and use in it the new
usb_control_msg_send() API of USB Core.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 102 ++++++++------------
 1 file changed, 39 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index f9c4fd5a2c53..8584baca9b8e 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -8,76 +8,51 @@
 #include "../include/recv_osdep.h"
 #include "../include/rtl8188e_hal.h"
 
-static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata, u16 len, u8 requesttype)
+static int usb_read(struct intf_hdl *intfhdl, u32 addr, void *data, u8 size)
 {
-	struct adapter	*adapt = pintfhdl->padapter;
-	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
+	u16 value = (u16)(addr & 0x0000ffff);
+	struct adapter *adapt = intfhdl->padapter;
+	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
-	unsigned int pipe;
-	int status = 0;
-	u8 *pIo_buf;
+	int status;
+	u8 *io_buf;
 	int vendorreq_times = 0;
 
-	if ((adapt->bSurpriseRemoved) || (adapt->pwrctrlpriv.pnp_bstop_trx)) {
+	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx) {
 		status = -EPERM;
 		goto exit;
 	}
 
-	if (len > MAX_VENDOR_REQ_CMD_SIZE) {
-		DBG_88E("[%s] Buffer len error ,vendor request failed\n", __func__);
-		status = -EINVAL;
-		goto exit;
-	}
-
-	_enter_critical_mutex(&dvobjpriv->usb_vendor_req_mutex, NULL);
+	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
 	/*  Acquire IO memory for vendorreq */
-	pIo_buf = dvobjpriv->usb_vendor_req_buf;
+	io_buf = dvobjpriv->usb_vendor_req_buf;
 
-	if (!pIo_buf) {
-		DBG_88E("[%s] pIo_buf == NULL\n", __func__);
+	if (!io_buf) {
+		DBG_88E("[%s] io_buf == NULL\n", __func__);
 		status = -ENOMEM;
 		goto release_mutex;
 	}
 
-	if (requesttype == REALTEK_USB_VENQT_READ)
-		pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
-	else
-		pipe = usb_sndctrlpipe(udev, 0);/* write_out */
-
 	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
-		if (requesttype == REALTEK_USB_VENQT_READ)
-			memset(pIo_buf, 0, len);
-		else
-			memcpy(pIo_buf, pdata, len);
-
-		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
-					 requesttype, value, REALTEK_USB_VENQT_CMD_IDX,
-					 pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
-
-		if (status == len) {   /*  Success this control transfer. */
+		status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
+					      REALTEK_USB_VENQT_READ, value,
+					      REALTEK_USB_VENQT_CMD_IDX, io_buf,
+					      size, RTW_USB_CONTROL_MSG_TIMEOUT,
+					      GFP_KERNEL);
+		if (!status) {   /*  Success this control transfer. */
 			rtw_reset_continual_urb_error(dvobjpriv);
-			if (requesttype == REALTEK_USB_VENQT_READ)
-				memcpy(pdata, pIo_buf,  len);
+			memcpy(data, io_buf, size);
 		} else { /*  error cases */
-			DBG_88E("reg 0x%x, usb %s %u fail, status:%d value=0x%x, vendorreq_times:%d\n",
-				value, (requesttype == REALTEK_USB_VENQT_READ) ? "read" : "write",
-				len, status, *(u32 *)pdata, vendorreq_times);
-
-			if (status < 0) {
-				if (status == (-ESHUTDOWN) || status == -ENODEV) {
-					adapt->bSurpriseRemoved = true;
-				} else {
-					struct hal_data_8188e	*haldata = GET_HAL_DATA(adapt);
-					haldata->srestpriv.wifi_error_status = USB_VEN_REQ_CMD_FAIL;
-				}
-			} else { /*  status != len && status >= 0 */
-				if (status > 0) {
-					if (requesttype == REALTEK_USB_VENQT_READ) {
-						/*  For Control read transfer, we have to copy the read data from pIo_buf to pdata. */
-						memcpy(pdata, pIo_buf,  len);
-					}
-				}
+			DBG_88E("reg 0x%x, usb %s %u fail, status:%d vendorreq_times:%d\n",
+				value, "read", size, status, vendorreq_times);
+
+			if (status == (-ESHUTDOWN) || status == -ENODEV) {
+				adapt->bSurpriseRemoved = true;
+			} else {
+				struct hal_data_8188e *haldata = GET_HAL_DATA(adapt);
+
+				haldata->srestpriv.wifi_error_status = USB_VEN_REQ_CMD_FAIL;
 			}
 
 			if (rtw_inc_and_chk_continual_urb_error(dvobjpriv)) {
@@ -87,17 +62,18 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 
 		}
 
-		/*  firmware download is checksumed, don't retry */
-		if ((value >= FW_8188E_START_ADDRESS && value <= FW_8188E_END_ADDRESS) || status == len)
+		/*  firmware download is checksummed, don't retry */
+		if ((value >= FW_8188E_START_ADDRESS && value <= FW_8188E_END_ADDRESS) || !status)
 			break;
 	}
+
 release_mutex:
-	_exit_critical_mutex(&dvobjpriv->usb_vendor_req_mutex, NULL);
+	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
 exit:
 	return status;
 }
 
-static int usb_read(struct intf_hdl *intfhdl, u32 addr, void *data, u8 size)
+static int usb_write(struct intf_hdl *intfhdl, u32 addr, void *data, u8 size)
 {
 	u16 value = (u16)(addr & 0x0000ffff);
 	struct adapter *adapt = intfhdl->padapter;
@@ -123,15 +99,15 @@ static int usb_read(struct intf_hdl *intfhdl, u32 addr, void *data, u8 size)
 		goto release_mutex;
 	}
 
+	memcpy(io_buf, data, size);
 	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
-		status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
-					      REALTEK_USB_VENQT_READ, value,
+		status = usb_control_msg_send(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
+					      REALTEK_USB_VENQT_SEND, value,
 					      REALTEK_USB_VENQT_CMD_IDX, io_buf,
 					      size, RTW_USB_CONTROL_MSG_TIMEOUT,
 					      GFP_KERNEL);
 		if (!status) {   /*  Success this control transfer. */
 			rtw_reset_continual_urb_error(dvobjpriv);
-			memcpy(data, io_buf, size);
 		} else { /*  error cases */
 			DBG_88E("reg 0x%x, usb %s %u fail, status:%d vendorreq_times:%d\n",
 				value, "read", size, status, vendorreq_times);
@@ -204,7 +180,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 	u16 wvalue = (u16)(addr & 0x0000ffff);
 	int ret;
 
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, &val, 1, REALTEK_USB_VENQT_WRITE);
+	ret = usb_write(pintfhdl, wvalue, &val, 1);
 
 	return RTW_STATUS_CODE(ret);
 }
@@ -217,7 +193,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 	__le32 data = cpu_to_le32(val & 0x0000ffff);
 	int ret;
 
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
+	ret = usb_write(pintfhdl, wvalue, &data, 2);
 
 	return RTW_STATUS_CODE(ret);
 }
@@ -230,7 +206,7 @@ int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 	__le32 data = cpu_to_le32(val);
 	int ret;
 
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_WRITE);
+	ret = usb_write(pintfhdl, wvalue, &data, 4);
 
 	return RTW_STATUS_CODE(ret);
 }
@@ -247,7 +223,7 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata)
 		return -EINVAL;
 
 	memcpy(buf, pdata, length);
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, buf, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
+	ret = usb_write(pintfhdl, wvalue, buf, (length & 0xffff));
 
 	return RTW_STATUS_CODE(ret);
 }
-- 
2.33.0

