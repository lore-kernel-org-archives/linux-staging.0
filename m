Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BCE6D13
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 21:11:32 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id c21so8631358edj.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 14:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ANeHNn7POs/G03YATeZ1ZT4mndBnW4QYgMGP7VqB3i4=;
        b=DPh0n/4/FWYo3rDXuWhqgV5eTNJeRTPAPJpGf3CL+yXjickVLyjcOQ9yiotvMkiSZS
         T7nLSxDTATceUt6QkjUhCKSh/+8NId2pseiOG4Cn0OvBe3C+7lEaDEoZWknhgCPwFiMp
         gP2lrhTDhAESz6155Clb9Ybu8ZqF51op5fxYWDQIjQ3OHs+1TE+qvURUPLVy3LtDPLwi
         vtoJgLvK5IV638p9o3RGSxx10/CD9yjig8/ED0kn4i5WIMjBd3nosL+7QJH1NESWo7BF
         mFai1S/dh4ELZW2aQXFg0KYCocWYp5rCbF6uEzRLLved/kOUmDDWCchd8sjXkvJjdIAN
         3gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANeHNn7POs/G03YATeZ1ZT4mndBnW4QYgMGP7VqB3i4=;
        b=vzyiDKC3w1mEAZdzFIGKWk+PPBbLfuw8953Ho0Z97zvrZEPgXRXMOBdXLGkXoPFRRV
         h/Gg4nNc0FZdV7o+dvlJflinMHGwzroa91A8x574bfR9wLtIlyFQivTLMTmDHb9Oz/zj
         qraRTiwbJWUslHUEaU+v8vl7QMTUcalccj7gqgO8twxN+//uSJu7fT+Hd1WXOveCtIQr
         y4Bneh5MV9K3nSaUHFgZOUe2qSX9XioKS+tQ66tyCnwAf51kQzVi6xjVSGhbm0GSYFFx
         WC6c5WUkqf0O/pAR4Xonobi7f0HeZ5kEyH+ZG3qagEzvGzVsx1D/k8nXdeWJApgydNZD
         KzZg==
X-Gm-Message-State: AOAM532r4oAuJ3/q6h0mOuOcLw0Ht/NveCUdHDA0XLeb/Om9lGyvLMux
	iWtU459kzuCF7Osyz41SoEE=
X-Google-Smtp-Source: ABdhPJw4NOZ6t+y15R5w5EmVwg2Hj/Z8laHZb+rVcYqE0Xe8VEoTpvp2f0ubHyBAfqjekNm8b7TdQA==
X-Received: by 2002:a17:906:5685:: with SMTP id am5mr2325116ejc.64.1631740290428;
        Wed, 15 Sep 2021 14:11:30 -0700 (PDT)
Received: from localhost.localdomain (host-95-235-105-169.retail.telecomitalia.it. [95.235.105.169])
        by smtp.gmail.com with ESMTPSA id t3sm511618edt.61.2021.09.15.14.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 14:11:30 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v6 10/19] staging: r8188eu: remove the helpers of usb_write_port()
Date: Wed, 15 Sep 2021 23:10:54 +0200
Message-Id: <20210915211103.18001-11-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915211103.18001-1-fmdefrancesco@gmail.com>
References: <20210915211103.18001-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Skripkin <paskripkin@gmail.com>

Remove the unnecessary _rtw_write_port() and usb_write_port() and embed
their code into the caller (i.e., rtw_write_port()).

_rtw_write_port() is a mere redefinition of rtw_write_port() and it is
unneeded. usb_write_port() was the only functions assigned to the
(*_usb_write_port) pointer, so we can simply remove it and make a direct
call.

This patch is in preparation for the _io_ops structure removal.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c         | 20 +------------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  1 -
 drivers/staging/r8188eu/include/rtw_io.h      |  4 +---
 .../staging/r8188eu/include/usb_ops_linux.h   |  1 -
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  3 +--
 5 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index ac72f894da75..3a5e9dbfcb12 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -87,24 +87,6 @@ void _rtw_read_port_cancel(struct adapter *adapter)
 		_read_port_cancel(pintfhdl);
 }
 
-u32 _rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
-{
-	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	u32 ret = _SUCCESS;
-
-
-
-	_write_port = pintfhdl->io_ops._write_port;
-
-	ret = _write_port(pintfhdl, addr, cnt, pmem);
-
-
-
-	return ret;
-}
-
 u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem, int timeout_ms)
 {
 	int ret = _SUCCESS;
@@ -114,7 +96,7 @@ u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt, u8 *pme
 	rtw_sctx_init(&sctx, timeout_ms);
 	pxmitbuf->sctx = &sctx;
 
-	ret = _rtw_write_port(adapter, addr, cnt, pmem);
+	ret = rtw_write_port(adapter, addr, cnt, pmem);
 
 	if (ret == _SUCCESS)
 		ret = rtw_sctx_wait(&sctx);
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index a104e3fac7d1..4fea21c0f7af 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -562,7 +562,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 {
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-	pops->_write_port = &usb_write_port;
 	pops->_read_port_cancel = &usb_read_port_cancel;
 	pops->_write_port_cancel = &usb_write_port_cancel;
 
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 600c6e7a375b..f2b1978b6e80 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -262,7 +262,7 @@ int _rtw_write16_async(struct adapter *adapter, u32 addr, u16 val);
 int _rtw_write32_async(struct adapter *adapter, u32 addr, u32 val);
 
 void _rtw_write_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
-u32 _rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
+u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt,
 			     u8 *pmem, int timeout_ms);
 void _rtw_write_port_cancel(struct adapter *adapter);
@@ -275,8 +275,6 @@ void _rtw_write_port_cancel(struct adapter *adapter);
 	_rtw_write16_async((adapter), (addr), (val))
 #define rtw_write32_async(adapter, addr, val)				\
 	_rtw_write32_async((adapter), (addr), (val))
-#define rtw_write_port(adapter, addr, cnt, mem)				\
-	_rtw_write_port((adapter), (addr), (cnt), (mem))
 #define rtw_write_port_and_wait(adapter, addr, cnt, mem, timeout_ms)	\
 	_rtw_write_port_and_wait((adapter), (addr), (cnt), (mem), (timeout_ms))
 #define rtw_write_port_cancel(adapter) _rtw_write_port_cancel((adapter))
diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
index 37e0614fd15c..bdc596fe5854 100644
--- a/drivers/staging/r8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/r8188eu/include/usb_ops_linux.h
@@ -30,7 +30,6 @@ unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr);
 
 void usb_read_port_cancel(struct intf_hdl *pintfhdl);
 
-u32 usb_write_port(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem);
 void usb_write_port_cancel(struct intf_hdl *pintfhdl);
 
 #endif
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 9afb4df71969..36ef06f88fdd 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -124,14 +124,13 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 
 }
 
-u32 usb_write_port(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem)
+u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
 {
 	unsigned long irqL;
 	unsigned int pipe;
 	int status;
 	u32 ret = _FAIL;
 	struct urb *purb = NULL;
-	struct adapter *padapter = (struct adapter *)pintfhdl->padapter;
 	struct dvobj_priv	*pdvobj = adapter_to_dvobj(padapter);
 	struct xmit_priv	*pxmitpriv = &padapter->xmitpriv;
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)wmem;
-- 
2.33.0

