Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051CB6D00
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 19:56:15 +0000 (UTC)
Received: from ipservice-092-217-074-086.092.217.pools.vodafone-ip.de ([92.217.74.86] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUalC-0005PV-3J; Thu, 08 Apr 2021 21:56:14 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/12] staging: rtl8188eu: remove the last urb callback macros
Date: Thu,  8 Apr 2021 21:55:50 +0200
Message-Id: <20210408195601.4762-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both usb_read_port_complete and usb_write_port_complete have a regs
parameter that is not used.

When this parameter is removed, the functions can be used as urb
completion callbacks directly. There's no need for the macros that
strip the second parameter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/usb_ops_linux.h | 5 -----
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c  | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/usb_ops_linux.h b/drivers/staging/rtl8188eu/include/usb_ops_linux.h
index 2f4976d251a1..0262ace52e71 100644
--- a/drivers/staging/rtl8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/rtl8188eu/include/usb_ops_linux.h
@@ -10,11 +10,6 @@
 #define USB_HIGH_SPEED_BULK_SIZE	512
 #define USB_FULL_SPEED_BULK_SIZE	64
 
-#define usb_write_port_complete(purb, regs)		\
-	usb_write_port_complete(purb)
-#define usb_read_port_complete(purb, regs)		\
-	usb_read_port_complete(purb)
-
 unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr);
 
 u8 usb_read8(struct adapter *adapter, u32 addr);
diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index f2fa4fb3595f..28655f41a75b 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -334,7 +334,7 @@ u32 usb_read32(struct adapter *adapter, u32 addr)
 	return le32_to_cpu(data);
 }
 
-static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
+static void usb_read_port_complete(struct urb *purb)
 {
 	struct recv_buf *precvbuf = (struct recv_buf *)purb->context;
 	struct adapter *adapt = (struct adapter *)precvbuf->adapter;
@@ -519,7 +519,7 @@ int usb_write32(struct adapter *adapter, u32 addr, u32 val)
 	return usbctrl_vendorreq(adapter, wvalue, &data, 4, REALTEK_USB_VENQT_WRITE);
 }
 
-static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
+static void usb_write_port_complete(struct urb *purb)
 {
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)purb->context;
 	struct adapter *padapter = pxmitbuf->padapter;
-- 
2.20.1

