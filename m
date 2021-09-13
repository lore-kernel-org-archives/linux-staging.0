Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE62FAF
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 18:12:27 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id v5so15696971edc.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04PMxPcjDUJWG6zSfOzDPOad8y+lRQvuHBw5D3rD2BU=;
        b=mYEIW9uFIRhu9E5T6a7p5A1KixhIhhpsH4CONdyLZO9TsNqo+qr01OZeTwlWUnBGjI
         ERHPJ/VSJxQzv6Ufv2d8K+cft9xuxKraXtq2uen4d8+zT7khe04ToZF4zzRcbtKKzXxw
         S32iNhmqsubkBocl4FCMI77KsKpQOOoMDfkCIQr3/ozJaMRpFc/dJjECbD+cNfFhBv19
         SzDhi87TToUEVycTcGkzmypwWSbIP1E6m5q5V7AFO82oraF2H3GpzVc1H72n/D/XzNII
         93q6WVu4A+x7gxaGJF5fZWqogG5OYBwlTCGcaMS7Kwe2vBqZT/Qr5v9+Ho6t1lNBSyAL
         vzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04PMxPcjDUJWG6zSfOzDPOad8y+lRQvuHBw5D3rD2BU=;
        b=wnTTZDEFcBMGSyyWReH9djqIl6+72NNy7M6eQjl/IGgqkkm1DeQTj3BS7dhmvdi2/M
         gZjC4QXUFC0hEpdih3k+k3MYUBPpAdWjfUpAUbXz0DLn6cAv1scX6Bqvf5Mi3j3Y1sm4
         XK5jq+9wtTz6flPXdYQwA2sjXAooYBHxJPsn1Zmen5rLdYPIBAs62td65/UUGQ+7zUkD
         O8oysPp/KnXROareaJf1ApRYyNhLmHeDatFLFL1l1NUW/vXHcRDvP+SJ7lQ49glwyViq
         kU/NuyNhmbJrhA3KEjHxGzWNz0K3sex6bCXAnmRna3e+IDy60F3C03qyB0e5PNtuITzf
         nv7A==
X-Gm-Message-State: AOAM532w7pcRrjAqvrZR8RerFvktFOWdgTkPAtJMJOF9QoThptvbIjZn
	Yl/5avKXvjQ/6XDNrlrExvJAK/PkUS0=
X-Google-Smtp-Source: ABdhPJx3oaT0KnDSoMS2QonT82w6ZghpAXjNqF5ifWb3q6v4aEYEPo5YCyPt535rTYzalz9DwEOcSw==
X-Received: by 2002:a50:eac4:: with SMTP id u4mr4460223edp.259.1631556745568;
        Mon, 13 Sep 2021 11:12:25 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id d25sm4258999edt.33.2021.09.13.11.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 11:12:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v4 13/18] staging: r8188eu: remove core/rtw_io.c
Date: Mon, 13 Sep 2021 20:09:57 +0200
Message-Id: <20210913181002.16651-14-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913181002.16651-1-fmdefrancesco@gmail.com>
References: <20210913181002.16651-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Skripkin <paskripkin@gmail.com>

There are only unused functions and macros and one function which can be
open-coded.

So, remove core/rtw_io.c at all, remove core/rtw_io.c from Makefile
and open-code rtw_init_io_priv() in rtw_usb_if1_init().

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

v3->v4:
        Split a patch into fourteen.
v2->v3:
        No changes.
v1->v2:
        No changes.

 drivers/staging/r8188eu/Makefile          |   1 -
 drivers/staging/r8188eu/core/rtw_io.c     | 111 ----------------------
 drivers/staging/r8188eu/include/rtw_io.h  |  19 +---
 drivers/staging/r8188eu/os_dep/usb_intf.c |   8 +-
 4 files changed, 8 insertions(+), 131 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/core/rtw_io.c

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index aebaf29990fd..4ca48fe628fd 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -78,7 +78,6 @@ rtk_core :=				\
 		core/rtw_debug.o	\
 		core/rtw_efuse.o	\
 		core/rtw_ieee80211.o	\
-		core/rtw_io.o		\
 		core/rtw_ioctl_set.o	\
 		core/rtw_iol.o		\
 		core/rtw_led.o		\
diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
deleted file mode 100644
index 74b02ff8e44d..000000000000
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ /dev/null
@@ -1,111 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-/*
-
-The purpose of rtw_io.c
-
-a. provides the API
-
-b. provides the protocol engine
-
-c. provides the software interface between caller and the hardware interface
-
-Compiler Flag Option:
-
-USB:
-   a. USE_ASYNC_IRP: Both sync/async operations are provided.
-
-Only sync read/rtw_write_mem operations are provided.
-
-jackson@realtek.com.tw
-
-*/
-
-#define _RTW_IO_C_
-#include "../include/osdep_service.h"
-#include "../include/drv_types.h"
-#include "../include/rtw_io.h"
-#include "../include/osdep_intf.h"
-#include "../include/usb_ops.h"
-
-#define rtw_le16_to_cpu(val)		le16_to_cpu(val)
-#define rtw_le32_to_cpu(val)		le32_to_cpu(val)
-#define rtw_cpu_to_le16(val)		cpu_to_le16(val)
-#define rtw_cpu_to_le32(val)		cpu_to_le32(val)
-
-int _rtw_write8_async(struct adapter *adapter, u32 addr, u8 val)
-{
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	int (*_write8_async)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-	int ret;
-
-	_write8_async = pintfhdl->io_ops._write8_async;
-
-	ret = _write8_async(pintfhdl, addr, val);
-
-
-	return RTW_STATUS_CODE(ret);
-}
-
-int _rtw_write16_async(struct adapter *adapter, u32 addr, u16 val)
-{
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	int (*_write16_async)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
-	int ret;
-
-	_write16_async = pintfhdl->io_ops._write16_async;
-	ret = _write16_async(pintfhdl, addr, val);
-
-	return RTW_STATUS_CODE(ret);
-}
-
-int _rtw_write32_async(struct adapter *adapter, u32 addr, u32 val)
-{
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	int (*_write32_async)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-	int ret;
-
-	_write32_async = pintfhdl->io_ops._write32_async;
-	ret = _write32_async(pintfhdl, addr, val);
-
-	return RTW_STATUS_CODE(ret);
-}
-
-
-u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem, int timeout_ms)
-{
-	int ret = _SUCCESS;
-	struct xmit_buf *pxmitbuf = (struct xmit_buf *)pmem;
-	struct submit_ctx sctx;
-
-	rtw_sctx_init(&sctx, timeout_ms);
-	pxmitbuf->sctx = &sctx;
-
-	ret = rtw_write_port(adapter, addr, cnt, pmem);
-
-	if (ret == _SUCCESS)
-		ret = rtw_sctx_wait(&sctx);
-
-	return ret;
-}
-
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct _io_ops *pops))
-{
-	struct io_priv	*piopriv = &padapter->iopriv;
-	struct intf_hdl *pintf = &piopriv->intf;
-
-	if (!set_intf_ops)
-		return _FAIL;
-
-	piopriv->padapter = padapter;
-	pintf->padapter = padapter;
-	pintf->pintf_dev = adapter_to_dvobj(padapter);
-
-	set_intf_ops(&pintf->io_ops);
-
-	return _SUCCESS;
-}
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 4f4678a55687..2b9b64f1ac80 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -257,25 +257,11 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val);
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val);
 int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata);
 
-int _rtw_write8_async(struct adapter *adapter, u32 addr, u8 val);
-int _rtw_write16_async(struct adapter *adapter, u32 addr, u16 val);
-int _rtw_write32_async(struct adapter *adapter, u32 addr, u32 val);
-
 void _rtw_write_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
-u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt,
-			     u8 *pmem, int timeout_ms);
 void rtw_write_port_cancel(struct adapter *adapter);
 
-
-#define rtw_write8_async(adapter, addr, val)				\
-	_rtw_write8_async((adapter), (addr), (val))
-#define rtw_write16_async(adapter, addr, val)				\
-	_rtw_write16_async((adapter), (addr), (val))
-#define rtw_write32_async(adapter, addr, val)				\
-	_rtw_write32_async((adapter), (addr), (val))
-#define rtw_write_port_and_wait(adapter, addr, cnt, mem, timeout_ms)	\
-	_rtw_write_port_and_wait((adapter), (addr), (cnt), (mem), (timeout_ms))
+void rtw_write_scsi(struct adapter *adapter, u32 cnt, u8 *pmem);
 
 /* ioreq */
 void ioreq_read8(struct adapter *adapter, u32 addr, u8 *pval);
@@ -317,9 +303,6 @@ void async_write32(struct adapter *adapter, u32 addr, u32 val,
 void async_write_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void async_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 
-int rtw_init_io_priv(struct adapter *padapter,
-		     void (*set_intf_ops)(struct _io_ops *pops));
-
 uint alloc_io_queue(struct adapter *adapter);
 void free_io_queue(struct adapter *adapter);
 void async_bus_io(struct io_queue *pio_q);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 78c857d97e8b..f38d1b267384 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -507,6 +507,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	struct adapter *padapter = NULL;
 	struct net_device *pnetdev = NULL;
 	int status = _FAIL;
+	struct io_priv *piopriv;
+	struct intf_hdl *pintf;
 
 	padapter = vzalloc(sizeof(*padapter));
 	if (!padapter)
@@ -538,7 +540,11 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	padapter->intf_stop = &usb_intf_stop;
 
 	/* step init_io_priv */
-	rtw_init_io_priv(padapter, usb_set_intf_ops);
+	piopriv = &padapter->iopriv;
+	pintf = &piopriv->intf;
+	piopriv->padapter = padapter;
+	pintf->padapter = padapter;
+	pintf->pintf_dev = adapter_to_dvobj(padapter);
 
 	/* step read_chip_version */
 	rtl8188e_read_chip_version(padapter);
-- 
2.33.0

