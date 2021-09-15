Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF563FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:42:55 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id jg16so5928608ejc.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o94ioH8+hQjK2lmFE9u/0gAl9iYxyQXZSnIFhRkzckg=;
        b=n3XpFzL0/5f9meehlULCN6JmaFZjvqVbtCB2gs4b1YjsGUDG1DJFew9dlUryQZU8aO
         OZhjqR56hbNrygfPgiBHWJgqgAScSEH8uU1k7aWoyNyYm4OJ4OTFVcKYHyPI1IxqdaEr
         pIPuo8BhK+/VBhozFKuYEycsj4BWKI2FijjZNdlGaPnFKXeuArkcMGy8SjmyY/Cf6IIu
         GukU1UVu34nMyBCiXmWpfHfQhDxa4GU8KISvvHEwY3g0dkt02jNHcoCd3E6mleojZ9X/
         3mgfKWoMNF62jxKZ6JC8oZQrTu6XNfWoEB6SDnrOKHaLjm1jPloojH6LY5lUUlB7nrNf
         wrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o94ioH8+hQjK2lmFE9u/0gAl9iYxyQXZSnIFhRkzckg=;
        b=sUxFZ4gtZumYNatlpnaUaSZMrSSo1VXdtUY+dgCCDUPq++7Kh+KdzJsZjNAN8ESYhz
         5zm18ZsNiwkLfAih3PAu/+AkKjC/UWKKhY1sQfSWbcqbx84EQJAarrenboHEfqSsGaoN
         M8KsJjydfNG1SizMfEUYpGjvwcrS836wjJta3fYIt1Eta6AnuijnRndEhvixb4ej8g57
         e2hpgGhD60wqoHi7mhv1lv9IR1pT4ng/rVnKr1epED852EzipfRfjItE2tSk5DF9u/kW
         KdMZc+f44eu7nuFNZjjwmEEvjmeIUBS/jcNp9tDojLqGey1sXB9fXEieBLnPSADM/fgH
         k7Gw==
X-Gm-Message-State: AOAM530a6yKdFJvkqUFb6dGY2xDCq++NpvkwaI9r07hPxt+gj5JoDVy7
	Baxsm2DRI4KBC/wepEahfN8=
X-Google-Smtp-Source: ABdhPJxr/ab8n5iZ+4JK+lC3Tvv/3ymzNb9u3dKPNGldB3HpEvIR0QMSIDqIpTMhCehnL8LUvxN/OQ==
X-Received: by 2002:a17:907:7703:: with SMTP id kw3mr24824530ejc.34.1631709774295;
        Wed, 15 Sep 2021 05:42:54 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:42:53 -0700 (PDT)
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
Subject: [PATCH v5 06/19] staging: r8188eu: remove the helpers of usb_write16
Date: Wed, 15 Sep 2021 14:41:36 +0200
Message-Id: <20210915124149.27543-7-fmdefrancesco@gmail.com>
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

Remove the unnecessary _rtw_write16() and usb_write16() and embed their
code into the caller (i.e., rtw_write16()).

_rtw_write16() is a mere redefinition of rtw_write16() and it is unneeded.
usb_write16() was the only functions assigned to the (*_usb_write16)
pointer, so we can simply remove it and make a direct call.

This patch is in preparation for the _io_ops structure removal.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c       | 14 --------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 10 +++++++---
 drivers/staging/r8188eu/include/rtw_io.h    |  4 +---
 3 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index 69ab6e24a4b7..7547e25d870b 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -34,20 +34,6 @@ jackson@realtek.com.tw
 #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
 #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
 
-int _rtw_write16(struct adapter *adapter, u32 addr, u16 val)
-{
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
-	int ret;
-
-	_write16 = pintfhdl->io_ops._write16;
-
-	ret = _write16(pintfhdl, addr, val);
-
-
-	return RTW_STATUS_CODE(ret);
-}
 int _rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 69e64863a5d1..128cdb178abc 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -145,12 +145,17 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 	return RTW_STATUS_CODE(ret);
 }
 
-static int usb_write16(struct intf_hdl *pintfhdl, u32 addr, u16 val)
+int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
+	struct io_priv *pio_priv = &adapter->iopriv;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u16 wvalue = (u16)(addr & 0x0000ffff);
 	__le32 data = cpu_to_le32(val & 0x0000ffff);
+	int ret;
 
-	return usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
+
+	return RTW_STATUS_CODE(ret);
 }
 
 static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
@@ -550,7 +555,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
 	pops->_read_port = &usb_read_port;
-	pops->_write16 = &usb_write16;
 	pops->_write32 = &usb_write32;
 	pops->_writeN = &usb_writeN;
 	pops->_write_port = &usb_write_port;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 3b229027f094..0cb1f626a549 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -253,7 +253,7 @@ void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_read_port_cancel(struct adapter *adapter);
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
-int _rtw_write16(struct adapter *adapter, u32 addr, u16 val);
+int rtw_write16(struct adapter *adapter, u32 addr, u16 val);
 int _rtw_write32(struct adapter *adapter, u32 addr, u32 val);
 int _rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata);
 
@@ -271,8 +271,6 @@ void _rtw_write_port_cancel(struct adapter *adapter);
 	_rtw_read_port((adapter), (addr), (cnt), (mem))
 #define rtw_read_port_cancel(adapter) _rtw_read_port_cancel((adapter))
 
-#define  rtw_write16(adapter, addr, val)				\
-	_rtw_write16((adapter), (addr), (val))
 #define  rtw_write32(adapter, addr, val)				\
 	_rtw_write32((adapter), (addr), (val))
 #define  rtw_writeN(adapter, addr, length, data)			\
-- 
2.33.0

