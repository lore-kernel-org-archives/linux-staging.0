Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6133FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:33 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v18so140583edc.11
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KznSAVNlR9qjlrh9l/5EnKDDm3BBqFQ33glNNhxBtQY=;
        b=eVV7+Jw2bviUZZ19vS/JCzc1ynDpaCO4DXaqe2V8cyM92d9L/tI7ujMkR4o8nuMt3Z
         VtcxSVayKx1di0rCgMsVlzkTk1YW/d0kXNogmvDFpNO6D3lf7kxJbDqFk25HcNboKFIi
         5BhOwFs1xlbKUQePxbr/DGnr8ruYIgafP+ozmMH1u1erTjISOMCTUdv0h4oBW0F9n01O
         XGzFGTH7VDojMyjEjJ4jKmFyQBB3tnoYV8NMmBRj2xbpbV/j4GI3/ls4szmXnxGBoFkt
         mSpIs0Hj3TLn80AgVgLW6J4khe/7UT8C7/jYromR1ZJKBn0tTVvaXYiDGqCr1xLMUoOO
         8GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KznSAVNlR9qjlrh9l/5EnKDDm3BBqFQ33glNNhxBtQY=;
        b=ALErpRv+SWjVsHeXgc0jbUGBKAci7Iv4+NvzD1SI/+RsB3JbqasK/xjSqvWGMz37i9
         N+xhDZgNWY+f2I84jC4zMvaMqFuZBckhhxXTa9zDT4GJm8mYqOg41iWjakRDWZI5aGKo
         tI7eaW4QF8XqGBTCsbO9W+BRDd9V86mT80dbTuG75+L/ekoAGJ2tZ7yC76p9WGSHNiEc
         mvuON1Wvj6FOC5e/sz/e6Sc9fgMh1OA3RCOGwghPWJsyymZfiUIVJsx4R1SfUSsyPSPy
         3U+kFyHxJEWSEBJqjYWoy/w6JLiF5VJG1f3JHkSyn0QAU/j0NuZ8ATKHPJaFdzq9iwdW
         Y0TQ==
X-Gm-Message-State: AOAM531tX+Tz+zc9cTZCH6GRth6OeEEEsb+VkahkdLDbmD2JVSbY0Yem
	anm9xwiqK+6NymsQeAeUW8E=
X-Google-Smtp-Source: ABdhPJz05fsodAjnUA5ZL/qYrh9UCyRdnNLWDqXklpHk1o4RMDV1IC6FI0s+S4bijVgcrf8yiS/qZQ==
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr4644883eds.166.1632486451617;
        Fri, 24 Sep 2021 05:27:31 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v10 04/16] staging: r8188eu: reorder comments in usbctrl_vendorreq()
Date: Fri, 24 Sep 2021 14:26:53 +0200
Message-Id: <20210924122705.3781-5-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924122705.3781-1-fmdefrancesco@gmail.com>
References: <20210924122705.3781-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder comments in usbctrl_vendorreq() to follow Linux coding style.
Delete two of them because they are "obvious".

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 61a016e3608f..35d268c5cd7f 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -35,9 +35,9 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 	io_buf = dvobjpriv->usb_vendor_req_buf;
 
 	if (requesttype == REALTEK_USB_VENQT_READ)
-		pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
+		pipe = usb_rcvctrlpipe(udev, 0);
 	else
-		pipe = usb_sndctrlpipe(udev, 0);/* write_out */
+		pipe = usb_sndctrlpipe(udev, 0);
 
 	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
 		if (requesttype == REALTEK_USB_VENQT_READ)
@@ -49,11 +49,13 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
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
@@ -65,7 +67,8 @@ static int usbctrl_vendorreq(struct intf_hdl *intf, u16 value, void *data, u16 l
 					struct hal_data_8188e *haldata = GET_HAL_DATA(adapt);
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

