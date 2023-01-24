Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8166E8F66
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 21:01:37 +0000 (UTC)
Received: from dslb-188-096-139-204.188.096.pools.vodafone-ip.de ([188.96.139.204] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pKQQ3-0001xR-Hz; Tue, 24 Jan 2023 22:01:27 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: r8188eu: remove usb_ops_linux.h
Date: Tue, 24 Jan 2023 22:01:08 +0100
Message-Id: <20230124210108.62170-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230124210108.62170-1-martin@kaiser.cx>
References: <20230124210108.62170-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's only two defines left in usb_ops_linux.h. Move those defines to
usb_ops_linux.c, where they are used.

Remove the now empty file usb_ops_linux.h.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c     |  4 ++++
 drivers/staging/r8188eu/include/usb_ops.h       |  2 --
 drivers/staging/r8188eu/include/usb_ops_linux.h | 11 -----------
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c  |  1 -
 4 files changed, 4 insertions(+), 14 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/usb_ops_linux.h

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 0f789d5250db..9c940ab8fd41 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -7,6 +7,10 @@
 #include "../include/usb_ops.h"
 #include "../include/rtl8188e_hal.h"
 
+#define VENDOR_CMD_MAX_DATA_LEN	254
+
+#define RTW_USB_CONTROL_MSG_TIMEOUT	500/* ms */
+
 static int usb_read(struct adapter *adapt, u16 value, void *data, u8 size)
 {
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index ddc46cb44358..5bd8ce37aebf 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -17,8 +17,6 @@
 #define MAX_VENDOR_REQ_CMD_SIZE	254	/* 8188cu SIE Support */
 #define MAX_USB_IO_CTL_SIZE	(MAX_VENDOR_REQ_CMD_SIZE + ALIGNMENT_UNIT)
 
-#include "usb_ops_linux.h"
-
 /*
  * Increase and check if the continual_urb_error of this @param dvobjprivei
  * is larger than MAX_CONTINUAL_URB_ERR
diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
deleted file mode 100644
index b149df7957dd..000000000000
--- a/drivers/staging/r8188eu/include/usb_ops_linux.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef __USB_OPS_LINUX_H__
-#define __USB_OPS_LINUX_H__
-
-#define VENDOR_CMD_MAX_DATA_LEN	254
-
-#define RTW_USB_CONTROL_MSG_TIMEOUT	500/* ms */
-
-#endif
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 583533631133..c9ee1173a1d6 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -4,7 +4,6 @@
 #define _USB_OPS_LINUX_C_
 
 #include "../include/drv_types.h"
-#include "../include/usb_ops_linux.h"
 #include "../include/rtl8188e_recv.h"
 
 static unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
-- 
2.30.2

