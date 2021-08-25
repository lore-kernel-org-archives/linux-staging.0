Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDF3FC1
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 03:53:24 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bt14so48725161ejb.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 20:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97UlLfxnCMtTwVxwU4oXrXmkcWUIzSDrVzPMLw/ydyM=;
        b=rVK3P1R7avaJVZV0ejA02sJmja4CQqV+ae5TTq5DGmDmUmgAy9Aig6VaolJOAFLYCv
         3SnaxdNoTEckX4ifbHiAN6VCHl8e1qyplBi2Af8AHnavcYlmi/M9mtK+zDKF6ZcjkLRP
         6HcpOF3N2wP1KY3ypeiEjj91WtXHH8qpmtr2fkMnc/p2ueu+SQybpnpZ8nwGzWo49aMo
         hW3rRngTMIbZELaRWo12C0gyAWmveiTBiZUo1Fcihnf8WiUmrYAm4Kgprf7gbA33o5Ab
         FsdbpJxQLOVOeHhTPmkn4poUGekLvRGmpipqsOl/1uzeHlBJIjdNZS6664mWqWw5KPee
         FNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97UlLfxnCMtTwVxwU4oXrXmkcWUIzSDrVzPMLw/ydyM=;
        b=MtdnFdlz8mZFvk1azBO9FnMCoZCHTPqVRKJSrO3YVLUgPfVHvsFxyBrouTJQRvJW6T
         BEueFvKFttDCfUwVASIV4gwXqhMS3HQorZzf60n9PYbGLabdv2kL3af6hT35EnTj7zYM
         hT8Btn98Xl1BrI5cTpm/6WdtTrNYy4oQViHB1pRknnLIDiwpXvLhWbx2HdLRn/CMZwJQ
         nGS/LXC26xwex6IPAHKhdcH7AyFrajfclrSejCpFyYrxSokUf0Yhod0v7z7ebJL4xEnc
         hUxuuqB8QDUhkmjZ/gPVnFzIba1ftq0HgGl23Z8oi9MplEyfKGgs9+IJVrCZUO0YBySI
         KxfA==
X-Gm-Message-State: AOAM530OE/naDKa3QR+SpQ7XZw2Ik3ljKhNkEPgkSHdEbgBZ2SgyQoOj
	LZF0gcuCgZd7hX866GJZwTI=
X-Google-Smtp-Source: ABdhPJzVQftshbBXtqWfrEx01NRISk/Y3kiOxgYzAX6KYpdvCVIw8cWqlTJwA/9SQ8t21+MRO+LOPQ==
X-Received: by 2002:a17:906:63ca:: with SMTP id u10mr43250150ejk.411.1629863602447;
        Tue, 24 Aug 2021 20:53:22 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id b15sm4326751ejq.83.2021.08.24.20.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 20:53:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 2/2] staging: r8188eu: Make clean-ups in usbctrl_vendorreq()
Date: Wed, 25 Aug 2021 05:53:11 +0200
Message-Id: <20210825035311.8910-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825035311.8910-1-fmdefrancesco@gmail.com>
References: <20210825035311.8910-1-fmdefrancesco@gmail.com>
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

v2->v3: No changes.
v1->v2: No changes.

 drivers/staging/r8188eu/hal/usb_ops_linux.c | 22 ++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 21581ca5f214..85da4fb5bf12 100644
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

