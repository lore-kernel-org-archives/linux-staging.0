Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB128816
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:03 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pG-0000Lk-Fx; Mon, 23 Jan 2023 21:53:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/23] staging: r8188eu: remove struct intf_priv
Date: Mon, 23 Jan 2023 21:53:23 +0100
Message-Id: <20230123205342.229589-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123205342.229589-1-martin@kaiser.cx>
References: <20230123205342.229589-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct intf_priv is not used in the r8188eu driver. It can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/osdep_intf.h | 32 --------------------
 drivers/staging/r8188eu/include/rtw_io.h     |  2 --
 2 files changed, 34 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_intf.h b/drivers/staging/r8188eu/include/osdep_intf.h
index 6d66cb57225e..457fb3852a19 100644
--- a/drivers/staging/r8188eu/include/osdep_intf.h
+++ b/drivers/staging/r8188eu/include/osdep_intf.h
@@ -7,38 +7,6 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-struct intf_priv {
-	u8 *intf_dev;
-	u32	max_iosz;	/* USB2.0: 128, USB1.1: 64, SDIO:64 */
-	u32	max_xmitsz; /* USB2.0: unlimited, SDIO:512 */
-	u32	max_recvsz; /* USB2.0: unlimited, SDIO:512 */
-
-	u8 *io_rwmem;
-	u8 *allocated_io_rwmem;
-	u32	io_wsz; /* unit: 4bytes */
-	u32	io_rsz;/* unit: 4bytes */
-	u8 intf_status;
-
-	void (*_bus_io)(u8 *priv);
-
-/*
-Under Sync. IRP (SDIO/USB)
-A protection mechanism is necessary for the io_rwmem(read/write protocol)
-
-Under Async. IRP (SDIO/USB)
-The protection mechanism is through the pending queue.
-*/
-	struct mutex ioctl_mutex;
-	/*  when in USB, IO is through interrupt in/out endpoints */
-	struct usb_device	*udev;
-	struct urb *piorw_urb;
-	u8 io_irp_cnt;
-	u8 bio_irp_pending;
-	struct timer_list io_timer;
-	u8 bio_irp_timeout;
-	u8 bio_timer_cancel;
-};
-
 int netdev_open(struct net_device *pnetdev);
 int netdev_close(struct net_device *pnetdev);
 
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 033ea7146861..090555f562f2 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -16,8 +16,6 @@
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
 
-struct intf_priv;
-
 int __must_check rtw_read8(struct adapter *adapter, u32 addr, u8 *data);
 int __must_check rtw_read16(struct adapter *adapter, u32 addr, u16 *data);
 int __must_check rtw_read32(struct adapter *adapter, u32 addr, u32 *data);
-- 
2.30.2

