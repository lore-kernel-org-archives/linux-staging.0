Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F83487
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 17:31:07 +0000 (UTC)
Received: from ipservice-092-217-078-141.092.217.pools.vodafone-ip.de ([92.217.78.141] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mAFIn-0002WQ-4E; Sun, 01 Aug 2021 19:31:05 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] staging: r8188eu: remove RT_TRACE and DBG_88E prints from usb_ops_linux.c
Date: Sun,  1 Aug 2021 19:30:23 +0200
Message-Id: <20210801173023.1370-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210801173023.1370-1-martin@kaiser.cx>
References: <20210801173023.1370-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should use the standard mechanism for debug prints. Remove the
prints that use driver-specific macros.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 42 +++----------------
 1 file changed, 5 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index dd4bd14b76c2..6fe87e005dcc 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -46,8 +46,6 @@ void usb_read_port_cancel(struct intf_hdl *pintfhdl)
 	struct adapter	*padapter = pintfhdl->padapter;
 	precvbuf = (struct recv_buf *)padapter->recvpriv.precv_buf;
 
-	DBG_88E("%s\n", __func__);
-
 	padapter->bReadPortCancel = true;
 
 	for (i = 0; i < NR_RECVBUFF; i++) {
@@ -87,43 +85,23 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 		break;
 	}
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped ||
-	    padapter->bWritePortCancel) {
-		RT_TRACE(_module_hci_ops_os_c_, _drv_err_,
-			 ("usb_write_port_complete:bDriverStopped(%d) OR bSurpriseRemoved(%d)",
-			 padapter->bDriverStopped, padapter->bSurpriseRemoved));
-		DBG_88E("%s(): TX Warning! bDriverStopped(%d) OR bSurpriseRemoved(%d) bWritePortCancel(%d) pxmitbuf->ext_tag(%x)\n",
-			__func__, padapter->bDriverStopped,
-			padapter->bSurpriseRemoved, padapter->bReadPortCancel,
-			pxmitbuf->ext_tag);
-
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped || padapter->bWritePortCancel)
 		goto check_completion;
-	}
 
 	if (purb->status) {
-		RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("usb_write_port_complete : purb->status(%d) != 0\n", purb->status));
-		DBG_88E("###=> urb_write_port_complete status(%d)\n", purb->status);
 		if ((purb->status == -EPIPE) || (purb->status == -EPROTO)) {
 			sreset_set_wifi_error_status(padapter, USB_WRITE_PORT_FAIL);
-		} else if (purb->status == -EINPROGRESS) {
-			RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("usb_write_port_complete: EINPROGESS\n"));
+		} else if (purb->status == -EINPROGRESS)
 			goto check_completion;
-		} else if (purb->status == -ENOENT) {
-			DBG_88E("%s: -ENOENT\n", __func__);
+		else if (purb->status == -ENOENT)
 			goto check_completion;
-		} else if (purb->status == -ECONNRESET) {
-			DBG_88E("%s: -ECONNRESET\n", __func__);
+		else if (purb->status == -ECONNRESET)
 			goto check_completion;
-		} else if (purb->status == -ESHUTDOWN) {
-			RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("usb_write_port_complete: ESHUTDOWN\n"));
+		else if (purb->status == -ESHUTDOWN) {
 			padapter->bDriverStopped = true;
-			RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("usb_write_port_complete:bDriverStopped = true\n"));
 			goto check_completion;
 		} else {
 			padapter->bSurpriseRemoved = true;
-			DBG_88E("bSurpriseRemoved = true\n");
-			RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("usb_write_port_complete:bSurpriseRemoved = true\n"));
-
 			goto check_completion;
 		}
 	}
@@ -156,12 +134,8 @@ u32 usb_write_port(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem)
 	struct xmit_frame *pxmitframe = (struct xmit_frame *)pxmitbuf->priv_data;
 	struct usb_device *pusbd = pdvobj->pusbdev;
 
-	RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("+usb_write_port\n"));
-
 	if ((padapter->bDriverStopped) || (padapter->bSurpriseRemoved) ||
 	    (padapter->pwrctrlpriv.pnp_bstop_trx)) {
-		RT_TRACE(_module_hci_ops_os_c_, _drv_err_,
-			 ("usb_write_port:( padapter->bDriverStopped ||padapter->bSurpriseRemoved ||adapter->pwrctrlpriv.pnp_bstop_trx)!!!\n"));
 		rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_TX_DENY);
 		goto exit;
 	}
@@ -213,8 +187,6 @@ u32 usb_write_port(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem)
 		haldata->srestpriv.last_tx_time = jiffies;
 	} else {
 		rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_WRITE_PORT_ERR);
-		DBG_88E("usb_write_port, status =%d\n", status);
-		RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("usb_write_port(): usb_submit_urb, status =%x\n", status));
 
 		switch (status) {
 		case -ENODEV:
@@ -230,8 +202,6 @@ u32 usb_write_port(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem)
 
 /*    We add the URB_ZERO_PACKET flag to urb so that the host will send the zero packet automatically. */
 
-	RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("-usb_write_port\n"));
-
 exit:
 	if (ret != _SUCCESS)
 		rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
@@ -245,8 +215,6 @@ void usb_write_port_cancel(struct intf_hdl *pintfhdl)
 	struct adapter	*padapter = pintfhdl->padapter;
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)padapter->xmitpriv.pxmitbuf;
 
-	DBG_88E("%s\n", __func__);
-
 	padapter->bWritePortCancel = true;
 
 	for (i = 0; i < NR_XMITBUFF; i++) {
-- 
2.20.1

