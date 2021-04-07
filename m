Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067956D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 17:05:48 +0000 (UTC)
Received: from ipservice-092-217-079-185.092.217.pools.vodafone-ip.de ([92.217.79.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUBcd-0001Q6-VP; Wed, 07 Apr 2021 19:05:44 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/10] staging: rtl8188eu: remove unused macros
Date: Wed,  7 Apr 2021 19:05:22 +0200
Message-Id: <20210407170531.29356-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_ops_linux.h contains a couple of macros to make functions usable as
urb completion callbacks. Most of them are unused and can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/usb_ops_linux.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/usb_ops_linux.h b/drivers/staging/rtl8188eu/include/usb_ops_linux.h
index 4e0e48cb5c8e..1a0b38de5027 100644
--- a/drivers/staging/rtl8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/rtl8188eu/include/usb_ops_linux.h
@@ -23,18 +23,10 @@
 #define USB_HIGH_SPEED_BULK_SIZE	512
 #define USB_FULL_SPEED_BULK_SIZE	64
 
-#define _usbctrl_vendorreq_async_callback(urb, regs)	\
-	_usbctrl_vendorreq_async_callback(urb)
-#define usb_bulkout_zero_complete(purb, regs)		\
-	usb_bulkout_zero_complete(purb)
-#define usb_write_mem_complete(purb, regs)		\
-	usb_write_mem_complete(purb)
 #define usb_write_port_complete(purb, regs)		\
 	usb_write_port_complete(purb)
 #define usb_read_port_complete(purb, regs)		\
 	usb_read_port_complete(purb)
-#define usb_read_interrupt_complete(purb, regs)		\
-	usb_read_interrupt_complete(purb)
 
 unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr);
 
-- 
2.20.1

