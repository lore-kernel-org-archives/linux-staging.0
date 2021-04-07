Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25B36D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 17:05:57 +0000 (UTC)
Received: from ipservice-092-217-079-185.092.217.pools.vodafone-ip.de ([92.217.79.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUBcp-0001Q6-Ln; Wed, 07 Apr 2021 19:05:55 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/10] staging: rtl8188eu: move defines into the .c file
Date: Wed,  7 Apr 2021 19:05:25 +0200
Message-Id: <20210407170531.29356-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407170531.29356-1-martin@kaiser.cx>
References: <20210407170531.29356-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the defines from usb_ops_linux.h are used only inside
usb_ops_linux.c. Move them to the .c file.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/usb_ops_linux.h | 8 --------
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c  | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/usb_ops_linux.h b/drivers/staging/rtl8188eu/include/usb_ops_linux.h
index 36a53239d5df..2f4976d251a1 100644
--- a/drivers/staging/rtl8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/rtl8188eu/include/usb_ops_linux.h
@@ -7,14 +7,6 @@
 #ifndef __USB_OPS_LINUX_H__
 #define __USB_OPS_LINUX_H__
 
-#define RTW_USB_CONTROL_MSG_TIMEOUT	500/* ms */
-
-#define MAX_USBCTRL_VENDORREQ_TIMES	10
-
-#define ALIGNMENT_UNIT			16
-#define MAX_VENDOR_REQ_CMD_SIZE	254	/* 8188cu SIE Support */
-#define MAX_USB_IO_CTL_SIZE	(MAX_VENDOR_REQ_CMD_SIZE + ALIGNMENT_UNIT)
-
 #define USB_HIGH_SPEED_BULK_SIZE	512
 #define USB_FULL_SPEED_BULK_SIZE	64
 
diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index 74f34440fc8c..13d2733b2b1b 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -10,6 +10,14 @@
 #include <recv_osdep.h>
 #include <rtw_sreset.h>
 
+#define RTW_USB_CONTROL_MSG_TIMEOUT	500 /* ms */
+
+#define MAX_USBCTRL_VENDORREQ_TIMES	10
+
+#define ALIGNMENT_UNIT			16
+#define MAX_VENDOR_REQ_CMD_SIZE	254
+#define MAX_USB_IO_CTL_SIZE	(MAX_VENDOR_REQ_CMD_SIZE + ALIGNMENT_UNIT)
+
 #define REALTEK_USB_VENQT_READ	(USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE)
 #define REALTEK_USB_VENQT_WRITE	(USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE)
 
-- 
2.20.1

