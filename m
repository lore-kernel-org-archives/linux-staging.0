Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332772
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:09 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c21so53627670edj.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J1u2QxRsXlb8Ov00Ioim3Lo0VQOs1cvPeFGcYojVplM=;
        b=ZbZ+QGdAcXq1MuMGfGNsePMrKVjrlKVOQIVPQ3IRhjSsr55jfO04lwGI5SJ7dUG5Zb
         wujpXI8t4jkLqFj9f1nze6/+HPXtVk4nXh5EqIgpghUHjWT1wvO9Vmo4xvJpRoc2mqtV
         n6/vmhBOhoiT79TrIFdrr7kfDV4ve3fY06zBTNBKnN/rnWsumOtvtzlDwqiIZhO6ItnS
         x5aD4Lxh2uX3tAmsmf+WgDfPqyRF7Xx9izAPmvikriz1+uvpYvLl6f0DncCcoFyEGzes
         juOQuqnq2cqwQTOf3KvX5872LJeCPaFpEquLQCeJxDHv3b0kG2Ns6j9l4KhWnMh1DuIP
         F5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J1u2QxRsXlb8Ov00Ioim3Lo0VQOs1cvPeFGcYojVplM=;
        b=b0NOObDXhXvRGsyrdLYum6DcDl4TRMmgV64AXoNhboFx9K9rL27r9aiHm78w3GkrML
         NrfNmqKA7Bv4eHYA60+8Y2YI/gShq6gFivUsu9mdibymJUG2noy4E/EkqKMC2r3yJyWD
         AID7t2W39dOXVHdGy4XCmrG9z5LiC/aw7+CXS+ZMFVmn0OAF6EEbaM5BIrHlqYqeFqTy
         bsOUSRKaBvHg7HWIzuNxdh6xcmMiWNIHlQZm4OMIPRHwtKrBOsESLodp90NZmt8EFBpu
         SL4fHKfgpN/My0ZmXnWknjWC8i2ZTt/IkVufSb7s6EN/e3d6t93y0NfloYxU9jg51mf7
         5A7Q==
X-Gm-Message-State: AOAM5308aAGu+TLeMsvjjVqgfp7NlQDDlIodRRwUW1X6SbCIl/Kjl2DY
	HgX2Kv6kYFScyyIKBEyII34=
X-Google-Smtp-Source: ABdhPJzoSHcOl0a39KeCxWz90Of1zzB22EhwiCDT4IA1Ez7QSkG9DeNiI2AfTfaENPtY+6a0szbl+A==
X-Received: by 2002:aa7:c74c:: with SMTP id c12mr26102851eds.87.1632095647445;
        Sun, 19 Sep 2021 16:54:07 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:07 -0700 (PDT)
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
Subject: [PATCH v8 04/19] staging: r8188eu: reorder comments in usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:41 +0200
Message-Id: <20210919235356.4151-5-fmdefrancesco@gmail.com>
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

Reorder comments in usbctrl_vendorreq() to follow the Linux style.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index d92bdcc3716d..9138b730490f 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -35,9 +35,11 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 	io_buf = dvobjpriv->usb_vendor_req_buf;
 
 	if (requesttype == REALTEK_USB_VENQT_READ)
-		pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
+		/* read in */
+		pipe = usb_rcvctrlpipe(udev, 0);
 	else
-		pipe = usb_sndctrlpipe(udev, 0);/* write_out */
+		/* write out */
+		pipe = usb_sndctrlpipe(udev, 0);
 
 	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
 		if (requesttype == REALTEK_USB_VENQT_READ)
@@ -49,11 +51,13 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 					 requesttype, value, REALTEK_USB_VENQT_CMD_IDX,
 					 io_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
 
-		if (status == len) {   /*  Success this control transfer. */
+		if (status == len) {
+			/*  success */
 			rtw_reset_continual_urb_error(dvobjpriv);
 			if (requesttype == REALTEK_USB_VENQT_READ)
 				memcpy(data, io_buf,  len);
-		} else { /*  error cases */
+		} else {
+			/* error cases */
 			DBG_88E("reg 0x%x, usb %s %u fail, status:%d value=0x%x, vendorreq_times:%d\n",
 				value, (requesttype == REALTEK_USB_VENQT_READ) ? "read" : "write",
 				len, status, *(u32 *)data, vendorreq_times);
@@ -65,7 +69,8 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 					struct hal_data_8188e	*haldata = GET_HAL_DATA(adapt);
 					haldata->srestpriv.wifi_error_status = USB_VEN_REQ_CMD_FAIL;
 				}
-			} else { /*  status != len && status >= 0 */
+			} else {
+				/* status != len && status >= 0 */
 				if (status > 0) {
 					if (requesttype == REALTEK_USB_VENQT_READ) {
 						/*  For Control read transfer, we have to copy the read data from io_buf to data. */
-- 
2.33.0

