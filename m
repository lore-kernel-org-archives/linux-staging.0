Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD9668
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 17:30:45 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id a9so54249pgg.7
        for <linux-staging@lists.linux.dev>; Tue, 02 Nov 2021 10:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:to:cc:subject:date:mime-version
         :content-transfer-encoding;
        bh=xS8kpc+xRiwOGSFAyUf/L9Jmpay7a8DV5EtWJms3sD0=;
        b=gPwXVMCjxt0pnTZ2FivA+2m9i2jVVT+U5apy7WFgwvHnadXHuu/gf3bw7TrQ2V0JKC
         YpZt/c6gNL9pbpMy7MgXyAxIlCSmYZ6z52IWeSq1pfWiblscg/lENRXV6EFChJQ6gWUX
         eZCW0l8gLdYj7bkmjS1wYdc31xixgKk0xtDvAx7vg8Fa1kejUtocDQZRcwLAHlZYjNx4
         dQLBwUmWeo+teCuInFqVkUwSbrjIPPrAJGaR2cjOhGCgpCCRaPHOTms3qgavq8XmssxI
         DWENSkPSPF5LoYv9YXoFrxbgItgp7Hgoc7FHukm7OjPXr5mGdyJxuRZNeJ66Y30L5pZg
         WNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
         :content-transfer-encoding;
        bh=xS8kpc+xRiwOGSFAyUf/L9Jmpay7a8DV5EtWJms3sD0=;
        b=Rk3RAwTUuoXZrdBcEIn5R8mZTtuy9TGyHnW03/qMNQsBpdqRex71iKoSPLXShKz3Fx
         dGiUsCrFzA4v9p/hCUFuNKw7uOg24FJboPSfH2qtwGaPVGGCYnJSsfw/FXoUodm1E3iV
         46jXJQYl2LbKvG9AzvV6p9q8Vf2tCCxHv5awnIm/szJjDEG9o68HXZ8Gosg0urLvxw/f
         ggW8oSH/Q0SP7KPL4oy2tlHF3Qh4b2IB1RYnuurFvMnS++VUjlDUIfnQfjJXr4ZrnTiP
         3WZQX7t0DG2gpgjdXhbkXAG1tQRZhxKrgsOgkIUYIcRcuA+TCRtCFe0/rGEVKmV//bb5
         3uOw==
X-Gm-Message-State: AOAM533jGtkz1r/vA1hX/V1CRkyh8DrPi9lEoWd44Et6UFv5+jUNZUmU
	ScOTYrr47Tcf3RSdb+DHKrDs7Bat8f0=
X-Google-Smtp-Source: ABdhPJzC7uysNTuDxYYp61g6ZXzJnw2xOgZqigqzEaZ01xhIdq/fMovxeMBD8d14is29IuUeVTQQ2Q==
X-Received: by 2002:a63:7c42:: with SMTP id l2mr28703237pgn.90.1635874245215;
        Tue, 02 Nov 2021 10:30:45 -0700 (PDT)
Received: from surfacebook2-fedora.. (36-233-20-55.dynamic-ip.hinet.net. [36.233.20.55])
        by smtp.gmail.com with ESMTPSA id ng5sm3353480pjb.51.2021.11.02.10.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 10:30:44 -0700 (PDT)
Message-ID: <618175c4.1c69fb81.bff5d.9cb8@mx.google.com>
X-Google-Original-Message-ID: <20211102173017.8890-1-Hoshinomori-Owari>
From: hoshinomorimorimo@gmail.com
X-Google-Original-From: Hoshinomori-Owari
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hoshinomori-Owari <hoshinomorimorimo@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix the style problem
Date: Wed,  3 Nov 2021 01:30:17 +0800
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hoshinomori-Owari <hoshinomorimorimo@gmail.com>

Fix block comment at
rtw_io.c:8:
rtw_io.c:139:
rtw_io.c:154:

Remove not useful filename at
rtw_io.c:9:

Add a blank line after declarations
rtw_io.c:147:

Issue found by checkpatch.pl

Signed-off-by: Hoshinomori-Owari <hoshinomorimorimo@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 56 +++++++++++++------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 4d3c30ec93b5..6c46c6e295d5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -4,26 +4,27 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
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
-1. CONFIG_SDIO_HCI:
-    a. USE_SYNC_IRP:  Only sync operations are provided.
-    b. USE_ASYNC_IRP:Both sync/async operations are provided.
-
-jackson@realtek.com.tw
-
-*/
+/*
+ *
+ *Purpose:
+ *
+ *	a. provides the API
+ *
+ *	b. provides the protocol engine
+ *
+ *	c. provides the software interface between caller and the hardware interface
+ *
+ *
+ *Compiler Flag Option:
+ *
+ *1. CONFIG_SDIO_HCI:
+ *	a. USE_SYNC_IRP:  Only sync operations are provided.
+ *	b. USE_ASYNC_IRP:Both sync/async operations are provided.
+ *
+ *jackson@realtek.com.tw
+ *
+ */
 
 #include <drv_types.h>
 #include <rtw_debug.h>
@@ -135,24 +136,25 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 	return _SUCCESS;
 }
 
-/*
-* Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
-* @return true:
-* @return false:
-*/
+/**
+ * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
+ * @return true:
+ * @return false:
+ */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
 	int ret = false;
 	int value = atomic_inc_return(&dvobj->continual_io_error);
+
 	if (value > MAX_CONTINUAL_IO_ERR)
 		ret = true;
 
 	return ret;
 }
 
-/*
-* Set the continual_io_error of this @param dvobjprive to 0
-*/
+/**
+ * Set the continual_io_error of this @param dvobjprive to 0
+ */
 void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
 {
 	atomic_set(&dvobj->continual_io_error, 0);
-- 
2.31.1

