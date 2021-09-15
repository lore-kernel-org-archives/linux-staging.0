Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7F3FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:44:15 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id x22so5837286ejj.8
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5zDbV/uKcczVbZMRuBNAgynLRQJTh3fUO/7zgmWU9yo=;
        b=KNJdgpieSwFHrTsbGP13NsBjyIW2ktyAQIGjzFz5ntLZUK4baRqSgPOg/0IZvhuOCf
         THU1Lvt1dolu+9di8SXwRvP231KVYtDqujKE6VSL9CUjiEO6kUKuCqCa1dT5JW285DdB
         TabgZbyf22LDXQbevtiSqztQYpWa3hm/KpK6n3J22mDp63s45+BkmSzqw1muDdPW5GIF
         8DtSxe5jN2nesApRMkErVLcwj8KQM2zzG0mriTToJSTPYp801GqOVqD1RPsR4iJrjhfc
         TISarGWWvvQGhecsUomSt6zeGy0eVYPbM9E7ae7jFoTjtuU2FxZHA/4XFwbrDD/BiztD
         VLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5zDbV/uKcczVbZMRuBNAgynLRQJTh3fUO/7zgmWU9yo=;
        b=Kx24NL3OITgfRxyrJICFmaDcYaLx0FFcOiWrcBb+olhVanEYk4QrCRJC7RindeIHMb
         e/bfg8I2ah8nPXHM4x8NVrXqPOYkVgPxnFg3GdQXzRejlver0KO6sJdekpfdUDbQlUDF
         /MzVeEv6roNk4Jwi955Hbyk/HhWGX22qhNYDhCGcGVKX+tZQwAE0aD4SNgLWFBzRdNnw
         /F+vvJNnk6pahKMRfqA0QJcIrK9Hvq9i4VOQXJe15be+ocxkaDxAWJ/1y2KNttfih/L6
         mp13IvjiCpGK58aRd/zveMO13x111tKpoi2oOucUwTxVgX0fThEwxTdLURxmvd+WzfRl
         sfcQ==
X-Gm-Message-State: AOAM5315RjR6prfqPbaLQBfR04EjXoQKne4wHez2+cADvEZ2E+A5xKlI
	Zlg6vDZzOSKSI9rp5mOkN2s=
X-Google-Smtp-Source: ABdhPJzQP9SyqrAul0V9TiPBwj8Y+nmU835zhPMNNmrId96HZht/8PlapWZj2a2+iiFMGATNG2XS3w==
X-Received: by 2002:a17:906:31d7:: with SMTP id f23mr24222976ejf.190.1631709853764;
        Wed, 15 Sep 2021 05:44:13 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:44:13 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Philip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v5 12/19] staging: r8188eu: remove the helpers of usb_write_port_cancel()
Date: Wed, 15 Sep 2021 14:41:42 +0200
Message-Id: <20210915124149.27543-13-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915124149.27543-1-fmdefrancesco@gmail.com>
References: <20210915124149.27543-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Skripkin <paskripkin@gmail.com>

Remove the unnecessary _rtw_write_port_cancel() and usb_write_port_cancel()
and embed their code into the caller (i.e., rtw_write_port_cancel()).

_rtw_write_port_cancel() is a mere redefinition of rtw_write_port_cancel()
and it is unneeded. usb_write_port_cancel() was the only functions
assigned to the (*_usb_write_port_cancel) pointer, so we can simply remove
it and make a direct call.

This patch is in preparation for the _io_ops structure removal.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c           | 12 ------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c     |  2 --
 drivers/staging/r8188eu/include/rtw_io.h        |  3 +--
 drivers/staging/r8188eu/include/usb_ops_linux.h |  2 --
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c  |  3 +--
 5 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index a57742057a65..74b02ff8e44d 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -93,18 +93,6 @@ u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt, u8 *pme
 	return ret;
 }
 
-void _rtw_write_port_cancel(struct adapter *adapter)
-{
-	void (*_write_port_cancel)(struct intf_hdl *pintfhdl);
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-
-	_write_port_cancel = pintfhdl->io_ops._write_port_cancel;
-
-	if (_write_port_cancel)
-		_write_port_cancel(pintfhdl);
-}
-
 int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct _io_ops *pops))
 {
 	struct io_priv	*piopriv = &padapter->iopriv;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 1865a26142bc..2516cfc464a9 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -562,8 +562,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 {
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-	pops->_write_port_cancel = &usb_write_port_cancel;
-
 }
 
 void rtl8188eu_set_hw_type(struct adapter *adapt)
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 56e17e2a7ee2..4f4678a55687 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -265,7 +265,7 @@ void _rtw_write_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt,
 			     u8 *pmem, int timeout_ms);
-void _rtw_write_port_cancel(struct adapter *adapter);
+void rtw_write_port_cancel(struct adapter *adapter);
 
 
 #define rtw_write8_async(adapter, addr, val)				\
@@ -276,7 +276,6 @@ void _rtw_write_port_cancel(struct adapter *adapter);
 	_rtw_write32_async((adapter), (addr), (val))
 #define rtw_write_port_and_wait(adapter, addr, cnt, mem, timeout_ms)	\
 	_rtw_write_port_and_wait((adapter), (addr), (cnt), (mem), (timeout_ms))
-#define rtw_write_port_cancel(adapter) _rtw_write_port_cancel((adapter))
 
 /* ioreq */
 void ioreq_read8(struct adapter *adapter, u32 addr, u8 *pval);
diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
index 186c6b7628dc..641f059ffaf7 100644
--- a/drivers/staging/r8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/r8188eu/include/usb_ops_linux.h
@@ -28,6 +28,4 @@
 
 unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr);
 
-void usb_write_port_cancel(struct intf_hdl *pintfhdl);
-
 #endif
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index a98ffdf92ed4..4085f3e6067d 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -211,10 +211,9 @@ u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
 	return ret;
 }
 
-void usb_write_port_cancel(struct intf_hdl *pintfhdl)
+void rtw_write_port_cancel(struct adapter *padapter)
 {
 	int i, j;
-	struct adapter	*padapter = pintfhdl->padapter;
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)padapter->xmitpriv.pxmitbuf;
 
 	DBG_88E("%s\n", __func__);
-- 
2.33.0

