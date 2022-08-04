Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F20817
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 10:55:50 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id w19so2223997ejc.7
        for <linux-staging@lists.linux.dev>; Thu, 04 Aug 2022 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ce2wN3up1tX8smnqeRp0FZBQrQKCapvS40FaCXtgzDI=;
        b=RUTIhajFko4zqfu2qCvTEfrs6BI2DFEpl7C5KaqhptXfDG7NoefWq9aBp7AqoRVHow
         eGxe2BcOLBlJm6InK4R3GY1zzpHGuMw1G+iWniMNITj0c5pX4eFfkMR8xOUheG+KA/k2
         fvWWyXpJxhyuhj6sNfDWi7g6SjYW6r0V0L4ag/uB6s9OnF+VXsUc37B2hicgu9fZ9Fmi
         h6etxWwedKazizncHl8/Z+mB7HFnIermHRfHLqSnFUuzSm86URvHF9ThbdttT5d1hpHi
         DZg/8LRhxeNgs/qhkHGoTBikX7vP3lK00Xa4ZupQptwC6HJePRTxrpZuu8EtarFk28dT
         0ZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ce2wN3up1tX8smnqeRp0FZBQrQKCapvS40FaCXtgzDI=;
        b=bKpjeon+pGRl2FNqYMnElOi1PS1XtyNSPvXoZ2eMxxcdtwhvEG0VDeOjtcfXVquAkM
         E1oh94q55IZeSks9/y5eMOZMggjd9Cb1RMs02oAyTjc7VCIGFZhYUKdZ9RSeu0k3HuNW
         6nbWt3CLpvcRyTb5myZClUA+BL6gKboLj0XTZHFCkOzi6sSflgmrz4nDGpcFlefFLwxc
         f6wWRaJbho6GkAZt/Y7pO0r+TQUnh2Bv5Fn+NKmLiO00LpOW5oHlgy5lvufDq3nQvfiB
         jsiW8eNdk2xQrD8qODy+jNAr06ZmJv96jQrzTHnZGaRo8i/OgQf/eKlqLYQwYk5NV2rD
         RufQ==
X-Gm-Message-State: ACgBeo3TTKZIYNFO69Y1+LX2kZbuSR5TqpRS/Lw5VpkUpL4SJQ+qJPnt
	Uz99KT6eFhL3w8IJKOX7Fo4=
X-Google-Smtp-Source: AA6agR5RECceYtuALfh0gjI+JiMeqEY/3WAH4FahaWMKzXmO6/eBdFz+LEBUVCde/n2r9FIQ1pNQSg==
X-Received: by 2002:a17:907:1c24:b0:72b:838f:cada with SMTP id nc36-20020a1709071c2400b0072b838fcadamr992852ejc.125.1659610548401;
        Thu, 04 Aug 2022 03:55:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id y89-20020a50bb62000000b0043ba0cf5dbasm510013ede.2.2022.08.04.03.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 03:55:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: make handle_txrpt_ccx_88e() static
Date: Thu,  4 Aug 2022 12:55:31 +0200
Message-Id: <20220804105532.7532-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804105532.7532-1-straube.linux@gmail.com>
References: <20220804105532.7532-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function handle_txrpt_ccx_88e() is only used in usb_ops_linux.c.
Make it static and remove the now empty file rtl8188e_xmit.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/Makefile              |  1 -
 drivers/staging/r8188eu/hal/rtl8188e_xmit.c   | 22 -------------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 14 ++++++++++++
 .../staging/r8188eu/include/rtl8188e_xmit.h   |  2 --
 4 files changed, 14 insertions(+), 25 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/rtl8188e_xmit.c

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index eea16eb7caa0..cddfee3efd36 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -18,7 +18,6 @@ r8188eu-y = \
 		hal/rtl8188e_phycfg.o \
 		hal/rtl8188e_rf6052.o \
 		hal/rtl8188e_rxdesc.o \
-		hal/rtl8188e_xmit.o \
 		hal/rtl8188eu_recv.o \
 		hal/rtl8188eu_xmit.o \
 		hal/usb_halinit.o \
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_xmit.c b/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
deleted file mode 100644
index 46b871f3f631..000000000000
--- a/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#define _RTL8188E_XMIT_C_
-
-#include "../include/osdep_service.h"
-#include "../include/drv_types.h"
-#include "../include/rtl8188e_hal.h"
-
-void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf)
-{
-	struct txrpt_ccx_88e *txrpt_ccx = (struct txrpt_ccx_88e *)buf;
-
-	if (txrpt_ccx->int_ccx) {
-		if (txrpt_ccx->pkt_ok)
-			rtw_ack_tx_done(&adapter->xmitpriv,
-					RTW_SCTX_DONE_SUCCESS);
-		else
-			rtw_ack_tx_done(&adapter->xmitpriv,
-					RTW_SCTX_DONE_CCX_PKT_FAIL);
-	}
-}
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index c1a4d023f627..f29bfa948ce7 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -190,6 +190,20 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 	return RTW_STATUS_CODE(ret);
 }
 
+static void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf)
+{
+	struct txrpt_ccx_88e *txrpt_ccx = (struct txrpt_ccx_88e *)buf;
+
+	if (txrpt_ccx->int_ccx) {
+		if (txrpt_ccx->pkt_ok)
+			rtw_ack_tx_done(&adapter->xmitpriv,
+					RTW_SCTX_DONE_SUCCESS);
+		else
+			rtw_ack_tx_done(&adapter->xmitpriv,
+					RTW_SCTX_DONE_CCX_PKT_FAIL);
+	}
+}
+
 static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
 {
 	u8	*pbuf;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index 8adb672f7a07..c69fed23ded9 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -147,6 +147,4 @@ bool rtl8188eu_xmitframe_complete(struct adapter *padapter,
 				 struct xmit_priv *pxmitpriv,
 				 struct xmit_buf *pxmitbuf);
 
-void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf);
-
 #endif /* __RTL8188E_XMIT_H__ */
-- 
2.37.1

