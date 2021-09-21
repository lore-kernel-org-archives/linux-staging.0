Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A413FCE
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:19:11 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id c21so117484edj.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k9uk2e2IKdO7Pb1pzmi/avFTaNQi83dwy0jtHQ9iWbU=;
        b=oz2C8eUKl+E+/oTHkr1jy8PY9NerFYEq+bKe+75xdJTIVKjtJYVtds1d1y4ydoCreR
         cmAgqI2UNvaeKO5N4qzr8QigfG8CD/dHmSWO6YB3ZqSqK4q2u+pu8awmWLsavdzXgYSy
         G7yVTSN8lcWMonAeIP71JbL459Q4UWoQUp0OcR3DVkhiBfdmmP1RUxZbqiUa/LiC8PmY
         5aK9Jgmx0pkAZpSADg2sIVQBdAd2c6wStsWyNTZCbzl6uivrJ7DmlXyhCHfnh0Hi4Kim
         xEcV8vu9utudwU/52EMBnqaJcvETyfThWkNX+csfgaUg2q82VBBMvxS3fGBG0DJ3AiOc
         DaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k9uk2e2IKdO7Pb1pzmi/avFTaNQi83dwy0jtHQ9iWbU=;
        b=ogP0OKlcBFwQPZPFXmHZHmbfvA7WjLwuGBDI+96gUNqhw4xwsNAZ+UlgsRjyEvK0tq
         oeThRBZPHweHBv1gfGebZzLnyiTHuFDN4FTarOmCwIVj8jioBTGwrmI6Dsr6TxMD+X/y
         aA/7mJ9/xfa0pqSOmB+gcMltXTvSDdWClJ6WE5ZB3ibvXQdq7gBf6V/gwYiQ4ecLd27e
         5lt6af8UjHm49ORIUXHCJks/BaFLAY8Y42P6ZHX3aKAwcg8OkG+1So4VkARUJfW1z8/r
         HzRIWodVXtnBIEyEXGVx6wyza6l3hAnaDJqfkIEHj1xmqIxdWBFTvOsCSpKO8eVTKr+M
         p2vA==
X-Gm-Message-State: AOAM531bBR1VK9UBL2eyOygF0sCXfmg/0lokUhBAy9eODnc6Nqj5mqFn
	XeVZ22h2ShMM/rPl2APIW7A=
X-Google-Smtp-Source: ABdhPJxwp04woFmReyq06EvomKkKbRjQK9GKZCwTFbYIxZHhaXgIl2pD4VUH/y34FiQhLzJBEABMIQ==
X-Received: by 2002:a50:be86:: with SMTP id b6mr35448984edk.138.1632248350197;
        Tue, 21 Sep 2021 11:19:10 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:19:09 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v9 13/16] staging: r8188eu: call new usb_read() from rtw_read{8,16,32}()
Date: Tue, 21 Sep 2021 20:18:31 +0200
Message-Id: <20210921181834.29677-14-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921181834.29677-1-fmdefrancesco@gmail.com>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Create and call new usb_read() instead of usbctrl_vendorreq() from
inside rtw_read{8,16,32}().

In old code, rtw_read{8,16,32}() called usbctrl_vendorreq() which in
turn uses usb_control_msg() from within a "while" loop to build a control
URB, send it off and wait for completion. usbctrl_vendorreq() was used for
both receiving and sending messages, depending on the "requesttype"
argument which was passed by callers.

Compared to usbctrl_vendorreq(), which managed both reads and writes
from and to the USB endpoint, the new usb_read() manages only reads. For
this purpose it uses the newer USB Core usb_control_msg_recv() API. The
latter is preferred according both to a suggestion by Greg Kroah-Hartman
and also to its actual design.

Two noteworthy features of usb_control_msg_recv() are that (1) the data
pointer can be made to a reference on the stack because it does not have
the restriction that usb_control_msg() has where the data pointer must be
to dynamically allocated memory, and that (2) the whole message must be
properly received from the device in order for this function to be
successfuli (if a device returns less than the expected amount of data,
then the function will fail).

usbctrl_vendorreq() uses a "while" loop that we considered unnecessary
so that it is not in the new usb_read(). Furthermore, the latter has no
redundant checking, less obvious comments, and it manages errors before
success cases. All in all, usb_read() is simpler than
usbctrl_vendorreq() and uses less lines of code.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 59 +++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index b3f8a76b5db2..a3dcd366c00c 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -86,6 +86,59 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 	return status;
 }
 
+static int usb_read(struct intf_hdl *intf, u16 value, void *data, u8 size)
+{
+	struct adapter *adapt = intf->padapter;
+	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
+	struct usb_device *udev = dvobjpriv->pusbdev;
+	int status;
+	u8 *io_buf; /* Pointer to I/O buffer */
+
+	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
+
+	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
+		return -EPERM;
+
+	io_buf = dvobjpriv->usb_vendor_req_buf;
+
+	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
+				      REALTEK_USB_VENQT_READ, value,
+				      REALTEK_USB_VENQT_CMD_IDX, io_buf,
+				      size, RTW_USB_CONTROL_MSG_TIMEOUT,
+				      GFP_KERNEL);
+
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
+
+	if (status < 0) {
+		GET_HAL_DATA(adapt)->srestpriv.wifi_error_status =
+			USB_VEN_REQ_CMD_FAIL;
+
+		if (rtw_inc_and_chk_continual_urb_error(dvobjpriv))
+			adapt->bSurpriseRemoved = true;
+
+		goto mutex_unlock;
+	}
+
+	rtw_reset_continual_urb_error(dvobjpriv);
+	memcpy(data, io_buf, size);
+
+mutex_unlock:
+	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
+
+	return status;
+}
+
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
@@ -93,7 +146,7 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 	u16 value = addr & 0xffff;
 	u8 data;
 
-	usbctrl_vendorreq(intf, value, &data, 1, REALTEK_USB_VENQT_READ);
+	usb_read(intf, value, &data, 1);
 
 	return data;
 }
@@ -105,7 +158,7 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 	u16 value = addr & 0xffff;
 	__le16 data;
 
-	usbctrl_vendorreq(intf, value, &data, 2, REALTEK_USB_VENQT_READ);
+	usb_read(intf, value, &data, 2);
 
 	return le16_to_cpu(data);
 }
@@ -117,7 +170,7 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 	u16 value = addr & 0xffff;
 	__le32 data;
 
-	usbctrl_vendorreq(intf, value, &data, 4, REALTEK_USB_VENQT_READ);
+	usb_read(intf, value, &data, 4);
 
 	return le32_to_cpu(data);
 }
-- 
2.33.0

