Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309D2FB2
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:18:58 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r5so7746140edi.10
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jdEHukJFI5KLXKseovA8chBIFpkWExbdPtIweTTcHKQ=;
        b=aqS5TeLn+fzYLEhUDqy9fpqsrppKU4+icFEz4JNW+cdksX5mgioeQy1aSgwvz94Xvw
         OPht+HiWQNHiFDMBHVJdJisxR2kFnhG9S2yUg27eeu7L1omuIjd6TpAVJzQU5EJ9Wv5F
         FqxdC+tCbZluc4QIo/8YDvFyknfPrjgju15hpiy1E1qwCzS5rgFHx3DavbDFqm4WhyIB
         +aX9Qs+Z6o/Mk1dvxVB35OC0haZBGxh2Cj2Z28FEKOSRnm3w/gYFMUhpEK83kwKnUJa/
         44dredyBJI0Su9aylcZnWbcb1gNsa4JV3WphzLETeB4Rd8kheaHk10rUUIRA5ickapDG
         678g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jdEHukJFI5KLXKseovA8chBIFpkWExbdPtIweTTcHKQ=;
        b=5Pr9JprsPxfTwuW17HwkHtuymP4Ll+VkkNK4QsfidttH2Rjqbu/v0apGQdJjtfAmq0
         BP9F7BBqmvIIU059PjssBR/MTSFBymq7vIKQDv5ePqZkShPTBD939Y6qTlPvpc0IwBc2
         bozy6dRDcqaF1cT/TW+E55G9XZkQz6U4JBxFf7UWPF3bI1CeWUPEuCeh835SB0YbeFNM
         nSNPHZ+0LN+ZfGa9OAb+TIGSsH3fy+J97SStVC6WaMdUVMOGqvkUprfYlph39dqX/But
         y3l5NI6FXLTmhaaNUWaTP2ktKJsLdkbbG1Lgi5OZWdVGzS2dxwF1g5cP5CQDJUTJ5aBP
         bSjA==
X-Gm-Message-State: AOAM5334bW6Wg+RsLlfin6OE30KW9GZ2eQGUEZeouPK0zFhfQDscdYdZ
	6O1GDrycQQDAv0xmeK6gEJg=
X-Google-Smtp-Source: ABdhPJx20UKy2azUUf3V7i0IFS4p1AUN/T7815y11Bif75xQYtdfK1CdCs0f4i/XDQ7SA1IBm4Gc3w==
X-Received: by 2002:aa7:c2d3:: with SMTP id m19mr37209847edp.57.1632248335405;
        Tue, 21 Sep 2021 11:18:55 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:18:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v9 01/16] staging: r8188eu: clean up symbols in usbctrl_vendorreq()
Date: Tue, 21 Sep 2021 20:18:19 +0200
Message-Id: <20210921181834.29677-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921181834.29677-1-fmdefrancesco@gmail.com>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
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
	pintfhdl => intf.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 28 ++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 6de99079e117..3e7bc510197e 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -8,14 +8,14 @@
 #include "../include/recv_osdep.h"
 #include "../include/rtl8188e_hal.h"
 
-static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata, u16 len, u8 requesttype)
+static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 len, u8 requesttype)
 {
-	struct adapter	*adapt = pintfhdl->padapter;
-	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
+	struct adapter *adapt = intf->padapter;
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
 				if (status == -ESHUTDOWN || status == -ENODEV) {
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

