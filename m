Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6E2FB2
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 14:29:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id lc21so12382102ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 07:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+IjsyQxtMvVoSlmXlJccBcJQMxnxgU9X+CivOPIrpF8=;
        b=Ql7aJQkf8awF8bORcFW1ITvAmQcGJUZZ8L1I2cHJmIdLfnc6DpvXb+SZj5ZZ78oswn
         oHn997gLeZwvWAaJj8rIv6TdYo66VUB4w5dYDPAZZvXMiNjdAKMN/hGgJljHtygms5FP
         a11QEQOo+XA1P38oNaOTAv/8gJg+mc2pnDCbcJSRj2UuJTSJzLkctOXaKh7sd4p2GOc4
         6Z37ynjwC4MQqI/xwe1c1TjQ0t4pJrEEkM9LA7Z/DDkbnR/4Ah/Ut27QpJRgudndnFQb
         wPa9DoE0TkBPDChxEq/TgSPs36hTAZjdfQVBZ/T0EwEC/1uclazofwYmcWAoK8ronotv
         7B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+IjsyQxtMvVoSlmXlJccBcJQMxnxgU9X+CivOPIrpF8=;
        b=Tpy0tmDJtFK54G8P8hBFPKKCba7CRJEhQvk9uZ+2nkGbu+cwVEyuNx1asH1rj0oTJG
         uys2Sg/Mn4FvoO0bjOvf0N3QuVJ24CAeNi1OhiZ9iXd6/0lTc0/kwovnqyB1+UQW0Hr7
         iSs8FiBIYnZzN0vrYUhmvZtvMBlSyd5lMM3XQqnrcb+y4ULx6Ugy9eeiL/7+xY1nt6ku
         ouHyKf8kG4l3+/L3gew+7f3W57TA+uyZJI0SypFe+wQOWd6RLyPob03scJFnSaNct6Y+
         UrLBd1uU40mn618iwQUgZw5K3GvKIQ9DcQBSOFygC4DctrhkVHoHrIa9SGYtd/VPrQM/
         e1dg==
X-Gm-Message-State: AOAM532twSe8mtJOisTok9pUHPqk39g+qq+9LMwFocWfUoDTMDtwsilf
	N3BHkN2AIbf2KmIeAZDWJ0E=
X-Google-Smtp-Source: ABdhPJxj/1LSnJVHJWb606Al+xogyUfGlavwFD/ODnl/sbOJK0UoRGhla2BOlCEEeUUaddmaAn0sJA==
X-Received: by 2002:a17:906:1416:: with SMTP id p22mr40385228ejc.364.1629815366568;
        Tue, 24 Aug 2021 07:29:26 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id r2sm11873480edv.78.2021.08.24.07.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 07:29:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: Make some clean-ups in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 16:28:23 +0200
Message-Id: <20210824142823.16845-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824142823.16845-1-fmdefrancesco@gmail.com>
References: <20210824142823.16845-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After replacing usb_control_msg() with the new usb_control_msg_recv() and
usb_control_msg_send() API of USB Core, remove camelcase from the pIo_buf
variable that is passed as argument to the new API and remove the initial
'p' (that probably stands for "pointer") from the same pIo_buf and from
the pintfhdl and pdata arguments of usbctrl_vendorreq().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 22 ++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 13e925d21e00..a038aaa5a624 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -10,13 +10,13 @@
 #include "../include/recv_osdep.h"
 #include "../include/rtl8188e_hal.h"
 
-static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata, u16 len, u8 requesttype)
+static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u16 len, u8 requesttype)
 {
-	struct adapter	*adapt = pintfhdl->padapter;
+	struct adapter	*adapt = intfhdl->padapter;
 	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
 	int status = 0;
-	u8 *pIo_buf;
+	u8 *io_buf;
 	int vendorreq_times = 0;
 
 	if ((adapt->bSurpriseRemoved) || (adapt->pwrctrlpriv.pnp_bstop_trx)) {
@@ -33,10 +33,10 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
 
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
@@ -45,14 +45,14 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 		if (requesttype == 0x01) {
 			status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
 						      REALTEK_USB_VENQT_READ, value,
-						      REALTEK_USB_VENQT_CMD_IDX, pIo_buf,
+						      REALTEK_USB_VENQT_CMD_IDX, io_buf,
 						      len, RTW_USB_CONTROL_MSG_TIMEOUT,
 						      GFP_KERNEL);
 		} else {
-			memcpy(pIo_buf, pdata, len);
+			memcpy(io_buf, data, len);
 			status = usb_control_msg_send(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
 						      REALTEK_USB_VENQT_WRITE, value,
-						      REALTEK_USB_VENQT_CMD_IDX, pIo_buf,
+						      REALTEK_USB_VENQT_CMD_IDX, io_buf,
 						      len, RTW_USB_CONTROL_MSG_TIMEOUT,
 						      GFP_KERNEL);
 		}
@@ -60,11 +60,11 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 		if (!status) {   /*  Success this control transfer. */
 			rtw_reset_continual_urb_error(dvobjpriv);
 			if (requesttype == 0x01)
-				memcpy(pdata, pIo_buf,  len);
+				memcpy(data, io_buf,  len);
 		} else { /*  error cases */
 			DBG_88E("reg 0x%x, usb %s %u fail, status:%d value=0x%x, vendorreq_times:%d\n",
 				value, (requesttype == 0x01) ? "read" : "write",
-				len, status, *(u32 *)pdata, vendorreq_times);
+				len, status, *(u32 *)data, vendorreq_times);
 
 			if (status == (-ESHUTDOWN) || status == -ENODEV) {
 				adapt->bSurpriseRemoved = true;
-- 
2.32.0

