Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308E3FCD
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:19:00 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id v22so72740651edd.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KznSAVNlR9qjlrh9l/5EnKDDm3BBqFQ33glNNhxBtQY=;
        b=qZ9v0Fop4KFf/Scmp3ZpTyctIMlR2LFbcttBqw4IGTJjF5VHOahwOWOv7713x9vfDc
         clF7S+LXGplxcgXakDBrlGaOhEfe3gCtAAke2FnOTYvVM84ntH2kO2TGQxwuNgJzCVrM
         HanogpWWiu9stfb4QyckyqR0Uc+mJPdUy71ITINDrsomkpaItSfWGMFqwbXUZwxouwfm
         CjUKCf4AgQqYKoSUCSfgPY0xG+BaU2lr8KO9fOtAUylSdgQHhcYw5TzPaWg1vlfqx3kK
         N3W9YW2ZneCreZWWy7ew27s9wKYJbBuAoiVJ5waRk5ZExg23IPGFalLsZJ6deAtPmdMC
         fH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KznSAVNlR9qjlrh9l/5EnKDDm3BBqFQ33glNNhxBtQY=;
        b=6KQMGIn6tuVOFd+1ZiD1vMGZROToXUVWiQCDTGviiYt2HEKdDxIGgMa9NcO35o1515
         NHGTuAJ8kUXgxFRGJYAx6i0Fw1qMeB3lJW4cIZ3lv0RQXE/gGs2DJctTyKil/vBaKMxN
         zYqnuaVJSW7dFUIq7ZS5nZXbH0t7+XOnfcbBKCGlfbFI6cOaoWNP/chQE8wuIF3nQtZP
         PaeDvxRLM9L8WxgtI6L4MxpKeIwBQUazqhHUksop69AnKMkbQvkbFVpyMBmZLshcrqgd
         1LT5oT3AjiDmv+TjDbaP+S9ZDHbsTi37SgN0F1xsysh7+x50WqNphdYvNdoRDOu2oiiX
         YElQ==
X-Gm-Message-State: AOAM533h1d/oH2+lNMMxfiJd03O/clYVC5XbwvhJASmCso5auxYBnfTn
	v+cz4X+zzJoDwG8RWehtRdklgcC29+s=
X-Google-Smtp-Source: ABdhPJxXn9CmSfPm2V4tpJiHZf8XjnBIhKvR/hQXKS4Ri33WaMTThoEFW4VKjgRaESsS7bGPfFzMMg==
X-Received: by 2002:a17:906:30d6:: with SMTP id b22mr36872959ejb.442.1632248339003;
        Tue, 21 Sep 2021 11:18:59 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:18:58 -0700 (PDT)
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
Subject: [PATCH v9 04/16] staging: r8188eu: reorder comments in usbctrl_vendorreq()
Date: Tue, 21 Sep 2021 20:18:22 +0200
Message-Id: <20210921181834.29677-5-fmdefrancesco@gmail.com>
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

