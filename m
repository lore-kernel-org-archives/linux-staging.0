Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D672
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:05 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id q3so54039859edt.5
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cRL1N4aq6RY5rnVm07sMIK0b1/qtY1C8R5+x5gFtfZI=;
        b=YlbwpB2VWaIj0UlxhlA7+XHzw5DoDdMf3FqTTBjoH83gl7zw4aG2HDgtCrZQgS/0Im
         09zY44k1dchl55nfMlaAQK5uhPt4VA44GHz8gr9UtXul7JZLRV+50DlDkeh1oOkLuNaY
         +3sfxEpzWhWXbPqPIhNw3iE9pVXDJs6N3Zm2fCBgx0K8eY63qTY6j9vfrTflyN81Ae4W
         /iVDYAUiZFOKrEzYrrT4WzL8h7a2U2DoI057WlbQDJorP+GC1bXNopTkoEooLxTaAC32
         mwiMtCFUgMwslD7AAdITk4ruNq/5BXAz2j0Rs1YYl/H9P+R3gX2m7CvyZHzK79+VK+jU
         1kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cRL1N4aq6RY5rnVm07sMIK0b1/qtY1C8R5+x5gFtfZI=;
        b=aldqlhcKZdIfIhiNeGKca+Dzo5TNX+MeTU7q4rC1Ri903X9R/88DI47Z5XOzBjV82F
         FyRg46EzOkazyvZurjVvJyiy7sOS2XMjOjPb2vLtX/DHjRODKsICnfpk6DbdjAu5ZBjc
         EU+GWAj+oa5yCC7kAAFmM7eGd9uH/ceU41HSyvPGQ07N1IDJI7B8U5D5wMeCKe2qcD0C
         GBrYVWHnyqwCa5DzZ+ppgsi4OFppKpoc8Z4Bp08fDWyv1to/nw/m2QUtfiSnyhFGQbvP
         WYwYFthnFUOZKCSBR+KX8TZHB9v/V0OzfMn6qLubMX04ZmfxRDUZ1fU93VN+7gh5LUsm
         6/sA==
X-Gm-Message-State: AOAM530sxDJUU5J9cpOeW0pLlvh49ChITnKKn7YHlbaD97B4pOOdeelp
	YVB45HwPJhbYtQZhgFCxU8E=
X-Google-Smtp-Source: ABdhPJx+tkHe6UAGCy58XzwddYj7vXYqkfC02dRTlUAcvktP0Pfs8bBSmvuXdn7aGg41+5upqNHgew==
X-Received: by 2002:a17:906:681:: with SMTP id u1mr24865337ejb.499.1632095643542;
        Sun, 19 Sep 2021 16:54:03 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:03 -0700 (PDT)
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
Subject: [PATCH v8 01/19] staging: r8188eu: clean up symbols usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:38 +0200
Message-Id: <20210919235356.4151-2-fmdefrancesco@gmail.com>
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

Clean up symbol names in usbctrl_vendorreq():

	pdata => data;
        pio_priv => io_priv;
        pintfhdl => intfhdl.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 28 ++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 117213c9f984..3bfae4bd4a1e 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -8,14 +8,14 @@
 #include "../include/recv_osdep.h"
 #include "../include/rtl8188e_hal.h"
 
-static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata, u16 len, u8 requesttype)
+static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u16 len, u8 requesttype)
 {
-	struct adapter	*adapt = pintfhdl->padapter;
-	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
+	struct adapter *adapt = intfhdl->padapter;
+	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
 	unsigned int pipe;
 	int status = 0;
-	u8 *pIo_buf;
+	u8 *io_buf;
 	int vendorreq_times = 0;
 
 	if ((adapt->bSurpriseRemoved) || (adapt->pwrctrlpriv.pnp_bstop_trx)) {
@@ -32,10 +32,10 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
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
@@ -47,22 +47,22 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 
 	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
 		if (requesttype == REALTEK_USB_VENQT_READ)
-			memset(pIo_buf, 0, len);
+			memset(io_buf, 0, len);
 		else
-			memcpy(pIo_buf, pdata, len);
+			memcpy(io_buf, data, len);
 
 		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
 					 requesttype, value, REALTEK_USB_VENQT_CMD_IDX,
-					 pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
+					 io_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
 
 		if (status == len) {   /*  Success this control transfer. */
 			rtw_reset_continual_urb_error(dvobjpriv);
 			if (requesttype == REALTEK_USB_VENQT_READ)
-				memcpy(pdata, pIo_buf,  len);
+				memcpy(data, io_buf,  len);
 		} else { /*  error cases */
 			DBG_88E("reg 0x%x, usb %s %u fail, status:%d value=0x%x, vendorreq_times:%d\n",
 				value, (requesttype == REALTEK_USB_VENQT_READ) ? "read" : "write",
-				len, status, *(u32 *)pdata, vendorreq_times);
+				len, status, *(u32 *)data, vendorreq_times);
 
 			if (status < 0) {
 				if (status == (-ESHUTDOWN) || status == -ENODEV) {
@@ -74,8 +74,8 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 			} else { /*  status != len && status >= 0 */
 				if (status > 0) {
 					if (requesttype == REALTEK_USB_VENQT_READ) {
-						/*  For Control read transfer, we have to copy the read data from pIo_buf to pdata. */
-						memcpy(pdata, pIo_buf,  len);
+						/*  For Control read transfer, we have to copy the read data from io_buf to data. */
+						memcpy(data, io_buf,  len);
 					}
 				}
 			}
-- 
2.33.0

