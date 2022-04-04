Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452292900
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 08:21:50 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id l26so1889257ejx.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 01:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwsH1XHMhYpHAHuQYTzJcbJHbl5Y3E62Se4odAiOvro=;
        b=hcw7OiTZegjMnjMYOc3Mf29TNrKx3WvEthqQm+u5PwM2QoI6gw3bDB7EgjauRW9bXp
         5E7SGUiqsm/80TQPDyWKtMPvaO1pNHMR8j/vUADxtlbRGe8jc4X5//LEq/qL6myYrbVH
         vbaGsw9uKaaDGN0tM0YrXnxEFr/OdBrq9yyxVn9DgZyZGmbEyFo3SVBPHb+nFzuOdANi
         1eW9yHCMqawuSShT09VcCegPYwGbkNTDxA+DcjCPY+Z0WG9CsR/RBc7uXQjM2BjW07Fp
         AnBJP8plRqwr8wNiXG5xnkvYtJG8jE1kqrQsIaJhXdg2XzkxZGk6v+0/08ptfdz3Qxms
         YUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwsH1XHMhYpHAHuQYTzJcbJHbl5Y3E62Se4odAiOvro=;
        b=UIrzYRg3s5ryBC/Sy7MP3xzmVY8HwwvKjJgaC/yofyhthHZiUrEwxSSxesCDyYXRZk
         da8++X61gc9O7D7IarKLf4yp0FCCfEY1Lfy52v9WuhI6FbzllCNaaRILUG1Q8fI3yjbd
         F5nit6lmnf0p9Ebl3y0LaThFsENwsVtYKFlARIKtUoTVNJlVkNLjdIgXegkXbEhq0nFE
         TbUL/HqB0nsF9oaND+txN1uClwkEHFWou7s+zOqwJpwoCQAZgOLKXFV4HHzW9mqS8tTz
         RclYWqfet/6x2l7hN+VF7TaMlU3JfU1B5wllgYb96MHlzZ19zq/akj/ZsJ41E5nq+W2i
         ksow==
X-Gm-Message-State: AOAM532YdjuWGFHBjgtZmhlqJ2BMafhu/oCLrRPgaggzSPdprlYEUGCN
	Nj5Jj6AtLcLg6UG1C6r3XPHsDbmUm+g=
X-Google-Smtp-Source: ABdhPJwzrg6vSJfu2vqfp9sme37FQrq1ZQPDetPp5e6ytHFpurajaA91xJ/Srr+MycaqokQkem0SGg==
X-Received: by 2002:a17:907:6da1:b0:6e7:efbe:d217 with SMTP id sb33-20020a1709076da100b006e7efbed217mr3381401ejc.119.1649060508614;
        Mon, 04 Apr 2022 01:21:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b006da94efcc7esm4047336ejh.204.2022.04.04.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 01:21:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: pnp_bstop_trx is never set
Date: Mon,  4 Apr 2022 10:21:40 +0200
Message-Id: <20220404082142.4639-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404082142.4639-1-straube.linux@gmail.com>
References: <20220404082142.4639-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field pnp_bstop_trx in struct pwrctrl_priv is never set. It stays
at its default value 0. Remove it and remove related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c    | 7 +++----
 drivers/staging/r8188eu/include/rtw_pwrctrl.h  | 1 -
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 3 +--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index e5d6cd6228f2..6a65dcf57112 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -16,7 +16,7 @@ static int usb_read(struct intf_hdl *intf, u16 value, void *data, u8 size)
 	int status;
 	u8 io_buf[4];
 
-	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
+	if (adapt->bSurpriseRemoved)
 		return -EPERM;
 
 	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
@@ -59,7 +59,7 @@ static int usb_write(struct intf_hdl *intf, u16 value, void *data, u8 size)
 	int status;
 	u8 io_buf[VENDOR_CMD_MAX_DATA_LEN];
 
-	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
+	if (adapt->bSurpriseRemoved)
 		return -EPERM;
 
 	memcpy(io_buf, data, size);
@@ -414,8 +414,7 @@ u32 rtw_read_port(struct adapter *adapter, u8 *rmem)
 	size_t alignment = 0;
 	u32 ret = _SUCCESS;
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved ||
-	    adapter->pwrctrlpriv.pnp_bstop_trx)
+	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 		return _FAIL;
 
 	if (!precvbuf)
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 3efcc65b2f6e..94a65056a77e 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -64,7 +64,6 @@ struct pwrctrl_priv {
 	u8	power_mgnt;
 	u8	bFwCurrentInPSMode;
 	u32	DelayLPSLastTimeStamp;
-	u8		pnp_bstop_trx;
 
 	u8		bInSuspend;
 	u8		bSupportRemoteWakeup;
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index c4b6dbc8d66d..8ca16861bfcc 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -106,8 +106,7 @@ u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
 	struct xmit_frame *pxmitframe = (struct xmit_frame *)pxmitbuf->priv_data;
 	struct usb_device *pusbd = pdvobj->pusbdev;
 
-	if ((padapter->bDriverStopped) || (padapter->bSurpriseRemoved) ||
-	    (padapter->pwrctrlpriv.pnp_bstop_trx)) {
+	if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
 		rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_TX_DENY);
 		goto exit;
 	}
-- 
2.35.1

