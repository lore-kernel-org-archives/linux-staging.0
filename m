Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E83FCE
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 07:19:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id z94so26281385ede.8
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fC6pZbFQ2+fltpypwSfWsk6CC/Yz/PYqojM5gLQPlFU=;
        b=dkCjGvHLTXe08jqcQOEeAUBqbMsinkXw0Nr4mUpdMZCpzWDK6mZ/oO7H4ZLX6vP2kC
         Us3//P8T0AiIOXhDW9LuFSy3ONiULUrn+ITx5+UBsIvXFNsQmTuwZclRUjr3LbpSOel1
         Xod2jWoH46GfaN4QgYst8bO8Pp1CVdml0sdyNusYBCFwKJ2jeBrR1HTgfB83NuNVHwtP
         5IFuRvbFmI9b5fSdGFpS0SwiLYf9kQUWUDhl9znzJkASy2mIN2ve55cYGgXnUxPVAAtF
         AQ29jRcLdsYhCFJoht9rB5ZR44G+wjMJfW4sHRgs+Y9SFHAj+ZnD7fY8CAiEf1nXpQwl
         Yd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fC6pZbFQ2+fltpypwSfWsk6CC/Yz/PYqojM5gLQPlFU=;
        b=eR1DGwfCtR8lObK4uYIuVETM6EW79JGfffhQRvKR2awnS+yoZUwNxVnR4Mjr9sAuMk
         LwiNiEcjWVZmV0vbDX7Q8peJU2+AH7kuQZj/gVYP1ITaurNOGFZ70sI2AjjwUYaykYhs
         z40QC/dc0s3H6YYTAijKkG90sm8rTmVuTyJ9WlCsbiL7k7O5SWCQr3m6ifYD8OEL+9nX
         r17MbggEnDuQ5gbqwMLThfjpiQXmmx2JzFYwfBznIFATvkkJx8kAaHjocPlPM80tX0L3
         UjmfH9kcfAE1vinYJKtFb6BJJ9Xk4+VJ0Ddl3SvoTtbgEzUAoB8H2NoyOn2ilAOVcWpo
         Nylw==
X-Gm-Message-State: AOAM533q4Kn1BOVioilrEU1gK8KC+ZauUj9xi07B9FRBSNaWkxmgdCz4
	6zs4ww4W77RTq7G903ztxg0=
X-Google-Smtp-Source: ABdhPJxELZKKuGyi3vj9kR53/x4iHrudLSRAGaQbYjH+mvmD76OnNbnzuaoNcUatY3C4Zhz6RqGZ2w==
X-Received: by 2002:a17:906:498b:: with SMTP id p11mr10699311eju.295.1631863159082;
        Fri, 17 Sep 2021 00:19:19 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id q19sm2297140edc.74.2021.09.17.00.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 00:19:18 -0700 (PDT)
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
Subject: [PATCH v7 14/19] staging: r8188eu: remove struct _io_ops
Date: Fri, 17 Sep 2021 09:18:32 +0200
Message-Id: <20210917071837.10926-15-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917071837.10926-1-fmdefrancesco@gmail.com>
References: <20210917071837.10926-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Skripkin <paskripkin@gmail.com>

Finally struct _io_ops is unused, so remove it.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c |  6 -----
 drivers/staging/r8188eu/include/rtw_io.h    | 25 ---------------------
 drivers/staging/r8188eu/include/usb_ops.h   |  2 --
 3 files changed, 33 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 2516cfc464a9..117213c9f984 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -558,12 +558,6 @@ void rtl8188eu_xmit_tasklet(unsigned long priv)
 	}
 }
 
-void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
-{
-
-	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-}
-
 void rtl8188eu_set_hw_type(struct adapter *adapt)
 {
 	adapt->chip_type = RTL8188E;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 2b9b64f1ac80..c6a078210eeb 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -84,30 +84,6 @@ struct intf_priv;
 struct intf_hdl;
 struct io_queue;
 
-struct _io_ops {
-	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
-	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
-	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
-	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
-	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-	int (*_writeN)(struct intf_hdl *pintfhdl, u32 addr, u32 length,
-		       u8 *pdata);
-	int (*_write8_async)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-	int (*_write16_async)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
-	int (*_write32_async)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-	void (*_read_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
-			  u8 *pmem);
-	void (*_write_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
-			   u8 *pmem);
-	u32 (*_read_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
-			  u8 *pmem);
-	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
-			   u8 *pmem);
-	void (*_read_port_cancel)(struct intf_hdl *pintfhdl);
-	void (*_write_port_cancel)(struct intf_hdl *pintfhdl);
-};
-
 struct io_req {
 	struct list_head list;
 	u32	addr;
@@ -125,7 +101,6 @@ struct io_req {
 struct	intf_hdl {
 	struct adapter *padapter;
 	struct dvobj_priv *pintf_dev;
-	struct _io_ops	io_ops;
 };
 
 struct reg_protocol_rd {
diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index c53cc54b6b87..1939b781b097 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -21,8 +21,6 @@
 
 void rtl8188eu_set_hw_type(struct adapter *padapter);
 #define hal_set_hw_type rtl8188eu_set_hw_type
-void rtl8188eu_set_intf_ops(struct _io_ops *pops);
-#define usb_set_intf_ops rtl8188eu_set_intf_ops
 
 /*
  * Increase and check if the continual_urb_error of this @param dvobjprivei
-- 
2.33.0

