Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9633FC2
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 23:02:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id bt14so33024184ejb.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcmFYHyHdQbe2MpjDtDCFg4l/AD/ofCMkrpwmvBTkbM=;
        b=c6V8uuGLQIAjUx85tmkbOdNlFWOtz4/nWFX5se86F0QNoOx7l4o9Y6caFbp00/t3FG
         Z8EI6eTTfBQfVYbfsdUHrrSCIOjOcBAt1FpVWDTgi5ziiOuF2DT1VRbS5RLaat4AO8Tb
         TwF7k0QOKuIgfmSj1f+m3Yk2KkpAQ9deMjQ73RpZbz5+yC/KXIEoe+aVmYglNouc4AFQ
         Z7zTWpXA76737ZZa8TSEo1nWbSBUD28Om+g5W+qBxuWzMyrDZwgF2zrsV3kF8M0IF+/O
         muGsGyMe5BlVTbZdnpIiwOENvGv0w5qnu4WeIGfM/BUmyzkpGoUON43yqASq5fN2eaAV
         PRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcmFYHyHdQbe2MpjDtDCFg4l/AD/ofCMkrpwmvBTkbM=;
        b=n3+epXW5QrqoYQP+aW72xAyjUycBfecZdhUxdr/rn2+UqbD68mtoyWJvh7QEuFBQU0
         ecbhqkHv0z6tLDLtSyAFcDIS7LmVwD9Yia1wxTgALXmXfPC3XGJoMK07S31E+roPvFRM
         qjQhJjtprBOaCmYppl4BUaYf9uV/RlSxQ39sdf2E4E0tVcwDuG9/YXIfcqUHk4IBhcln
         KmT718QkC5pI6NUMP4sz3c5/SJNbm+aZ0dFgmjteEyBp8JguH6WCttCu2CTyagPhJxWt
         7cl58Pw6RiTd6z4s75IsJSwKbR4cxtLqw9yNkkGDmV6olQjS607LhNNv+yTdY34GN4Le
         ZLRw==
X-Gm-Message-State: AOAM5322XhEx1V5bu/3VgTncZNcWv3HvjWJhrL4CY8wkbSYoufJbIOvj
	wX1USC8yiePG7J6j1WgKAFo=
X-Google-Smtp-Source: ABdhPJywK2uGfORh1Yk871iA1iLoDKfUDx1npShz2yLQVw0CEwV1+SVatwLa/LpiJcUSEtx6ImThxQ==
X-Received: by 2002:a17:907:9546:: with SMTP id ex6mr11023382ejc.325.1629673359644;
        Sun, 22 Aug 2021 16:02:39 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id z15sm1684461edr.80.2021.08.22.16.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 16:02:39 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	Pavel Skripkin <paskripkin@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH RFC] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Mon, 23 Aug 2021 01:02:35 +0200
Message-Id: <20210822230235.10953-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usb_control_msg() with the new usb_control_msg_recv() and
usb_control_msg_send() API of USB Core.

This patch is an RFC for different reasons:

1) I'm not sure if it is needed: while Greg Kroah-Hartman suggested to 
use the new API in a message to a thread that was about a series of patches
submitted by Pavel Skripkin (who decided to not use it), I cannot explain 
if and why the driver would benefit from this patch.
2) I have doubts about the sematic of the API I use here, so I'd like to
know whether or not I'm using them properly.
3) At the moment I cannot test the driver because I don't have my device
with me.
4) This patch could probably lead to a slight change in some lines of
Pavel's series (for sure in usb_read*()).

I'd like to hear from the Maintainers and other interested people if this
patch is worth to be considered and, in this case, if there are suggestions
for the purpose to improve it. 

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 6a0a24acf292..9e290c1cc449 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -15,7 +15,7 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 	struct adapter	*adapt = pintfhdl->padapter;
 	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
-	unsigned int pipe;
+	u8 pipe;
 	int status = 0;
 	u8 reqtype;
 	u8 *pIo_buf;
@@ -47,19 +47,20 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 		memset(pIo_buf, 0, len);
 
 		if (requesttype == 0x01) {
-			pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
 			reqtype =  REALTEK_USB_VENQT_READ;
+			status = usb_control_msg_recv(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
+						      reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
+						      pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
+						      GFP_KERNEL);
 		} else {
-			pipe = usb_sndctrlpipe(udev, 0);/* write_out */
 			reqtype =  REALTEK_USB_VENQT_WRITE;
-			memcpy(pIo_buf, pdata, len);
+			status = usb_control_msg_send(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
+						      reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
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

