Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4715929CA
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 22:38:03 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id q3so28596522edt.5
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 15:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ld900jyL6QKZg3xhi/oE/LIzTQAbQ0oX5h9lti0dsI=;
        b=TiECi5QwfHCq/q+SzixhKKkZclBoaBgkBTnfTj/Xbk15mT//5+Lbjusa0NztyQFiNV
         yMnYgu6Plg0igJLKOHzfsfodrKngz/yXVbNd+XNgUG/0onr4SxnDhGOMk1iabYEtRncJ
         adOjA+J8+9iojR4RxFCYv+Ihfh2ey2zfL4hIq0VqOI/uHw5yr29qX670KOU3b8kXu6fE
         v9aSJ/n/ySHNm47dDCjRkjXMNy3ypUT3zoc7iw/944l8oXL4UiGmqEoZlHkU6ZYblGEM
         w+Smt1GYMRk8TTkWTXqVL30CrwfvOItdaA9v4GiMw0vr3FzX5CBUpu2ZBMk0d//w+ezq
         fTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ld900jyL6QKZg3xhi/oE/LIzTQAbQ0oX5h9lti0dsI=;
        b=tmblMKg3T5n08jqA+OCwzIUJYoBt+KbIvmwp+NQoS9IWVaQnhlaIxg5P7OwU5tjOEe
         suyKS6I+/mhrW3dISmMp8aJA5hQyhpR03sDKIHM29auMWWGsqXvjMhyUIkACCK3/qF0/
         DRfg+Utm4W1eMedczREiRl+64ouX9Mi/puCblKqwrmCip7APbbGBW+B/uHJQw42YXjW5
         93CqrQDp6tjb5t1/0YkG6VvoaO/I8/i/75okQ6Jyn3EcqLgHnFwK3vM5wNLlOXDK4QSK
         A203QMmUn7PHNoQbnPG/sEXzGzCR5KE1c2J43vRiUqGnKSW6vvWuJHQRkNYtsTLw9nKw
         mwwA==
X-Gm-Message-State: AOAM5300WHHlSfhAZcTU6cBD1Bx+ZcIfm7eTkNJJONvsGGKVuDsBAaY6
	VKGMhqu0SFTfyV8NoxX0NgucgnDGBCA=
X-Google-Smtp-Source: ABdhPJxoHJMfycnYlS6cxpTShraLaMMw3jXzi4EpxQ3bz9S7HtghF4ngD7SQYMJMGKB10fjk08/tLA==
X-Received: by 2002:a05:6402:328:: with SMTP id q8mr40486571edw.84.1629758281737;
        Mon, 23 Aug 2021 15:38:01 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id p23sm10375326edw.94.2021.08.23.15.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 15:38:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 00:37:50 +0200
Message-Id: <20210823223751.25104-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823223751.25104-1-fmdefrancesco@gmail.com>
References: <20210823223751.25104-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usb_control_msg() with the new usb_control_msg_recv() and
usb_control_msg_send() API of USB Core in usbctrl_vendorreq().

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Thanks to Pavel Skripkin <paskripkin@gmail.com> for his review of the
RFC patch.
 
drivers/staging/r8188eu/hal/usb_ops_linux.c | 25 ++++++++++-----------
1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index a93d5cfe4635..6f51660b967a 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -15,9 +15,8 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 	struct adapter	*adapt = pintfhdl->padapter;
 	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
-	unsigned int pipe;
+	u8 pipe;
 	int status = 0;
-	u8 reqtype;
 	u8 *pIo_buf;
 	int vendorreq_times = 0;
 
@@ -44,22 +43,22 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 	}
 
 	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
-		memset(pIo_buf, 0, len);
-
 		if (requesttype == 0x01) {
-			pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
-			reqtype =  REALTEK_USB_VENQT_READ;
+			status = usb_control_msg_recv(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
+						      REALTEK_USB_VENQT_READ, value,
+						      REALTEK_USB_VENQT_CMD_IDX,
+						      pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
+						      GFP_KERNEL);
 		} else {
-			pipe = usb_sndctrlpipe(udev, 0);/* write_out */
-			reqtype =  REALTEK_USB_VENQT_WRITE;
 			memcpy(pIo_buf, pdata, len);
+			status = usb_control_msg_send(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
+						      REALTEK_USB_VENQT_WRITE, value,
+						      REALTEK_USB_VENQT_CMD_IDX,
+						      pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
+						      GFP_KERNEL);
 		}
 
-		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
-					 reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
-					 pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
-
-		if (status == len) {   /*  Success this control transfer. */
+		if (!status) {   /*  Success this control transfer. */
 			rtw_reset_continual_urb_error(dvobjpriv);
 			if (requesttype == 0x01)
 				memcpy(pdata, pIo_buf,  len);
-- 
2.32.0

