Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FEE3FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:43:00 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id h9so5890574ejs.4
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uB8dyLhqOeVWNi6AmFE9xlJsVVknNBhXJA42Ly2Ec5k=;
        b=HZU1J14oBzxTMHyOVMsAGpdW7nLCLyRhWOjhFKGGqaV2Occt4etmEa7Y3TtE74RcBz
         eDX7ii2bqJUnZ8lfJJSEZTZqEPEEbwVG41e7VQLSY6JvCJEJt+9/I/X3qA40ZNdF1nFp
         PGHHwsCYS0/55fNE8op6WTdGbR/gmnsoWRZmyopmy69/DwXqoSoGex2SzfkbxnY1OxSH
         ROrXcKpim983++2p9QN29vsXA7EkXzCjr2Jc3a0rNFhHHYlFZYp7rdgpPd/1gNQ63rlq
         F91DhdMHzCHIuLmmWnjO7NlaPrIB9ppYleQrUTOI9hqhI8Cfr6VrSZF4E/Id6ocn18QQ
         3nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uB8dyLhqOeVWNi6AmFE9xlJsVVknNBhXJA42Ly2Ec5k=;
        b=3q05eI0hVx2la3QjIB4RhILdqduxMfvZM50hTi5OIPdAOeaVL8lJ3IkM1R6y37NpZa
         vxj2sk4AUoo5PU1aCQM0roKMfG1EzyvYu7AR6DlhWEF6Lr/SLhNY5yiRorbdMYoCYxKz
         sPwfNKnk2o7O6HHah2BEk+6A02W2dIG15FP2tV54qDrJm7es0KTJnivUfMPHyRAFV+hm
         PqElE0//nPweRj9ALZjdYyEmv9TVV7QXWwD+g4MNcC6sOuN4C9dLImAcByWv8t2BMMuw
         1upbGY1Bv20kiSH7voatsDrtnislb185pZ8yswliJ8tLBTJvkWxQOwZ6kvgEJPxvkPuh
         PUkw==
X-Gm-Message-State: AOAM530yOmKEO0Qx3kkJshpy7JkN1Za15XbhKTRv5k5iKK5olCRGwixc
	jJjZ1xeKbD96eKStuev17+bwx2SB2xA=
X-Google-Smtp-Source: ABdhPJxwbw6fnKVeYNk+NglwVhrRfazK+EAPgY3ZvS+tADmS3Ulj+k9pJGqbP//S4/XJGgoC21ygiw==
X-Received: by 2002:a17:906:31cf:: with SMTP id f15mr24624717ejf.272.1631709778848;
        Wed, 15 Sep 2021 05:42:58 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:42:58 -0700 (PDT)
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
Subject: [PATCH v5 07/19] staging: r8188eu: remove the helpers of usb_write32
Date: Wed, 15 Sep 2021 14:41:37 +0200
Message-Id: <20210915124149.27543-8-fmdefrancesco@gmail.com>
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

Remove the unnecessary _rtw_write32() and usb_write32() and embed their
code into the caller (i.e., rtw_write32()).

_rtw_write32() is a mere redefinition of rtw_write32() and it is unneeded.
usb_write32() was the only functions assigned to the (*_usb_write32)
pointer, so we can simply remove it and make a direct call.

This patch is in preparation for the _io_ops structure removal.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c       | 15 ---------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 10 +++++++---
 drivers/staging/r8188eu/include/rtw_io.h    |  4 +---
 3 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index 7547e25d870b..98c9823fe53b 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -34,21 +34,6 @@ jackson@realtek.com.tw
 #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
 #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
 
-int _rtw_write32(struct adapter *adapter, u32 addr, u32 val)
-{
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-	int ret;
-
-	_write32 = pintfhdl->io_ops._write32;
-
-	ret = _write32(pintfhdl, addr, val);
-
-
-	return RTW_STATUS_CODE(ret);
-}
-
 int _rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 128cdb178abc..73f90b21364e 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -158,12 +158,17 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 	return RTW_STATUS_CODE(ret);
 }
 
-static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
+int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
+	struct io_priv *pio_priv = &adapter->iopriv;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u16 wvalue = (u16)(addr & 0x0000ffff);
 	__le32 data = cpu_to_le32(val);
+	int ret;
 
-	return usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_WRITE);
+
+	return RTW_STATUS_CODE(ret);
 }
 
 static int usb_writeN(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata)
@@ -555,7 +560,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
 	pops->_read_port = &usb_read_port;
-	pops->_write32 = &usb_write32;
 	pops->_writeN = &usb_writeN;
 	pops->_write_port = &usb_write_port;
 	pops->_read_port_cancel = &usb_read_port_cancel;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 0cb1f626a549..83e2ed13b667 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -254,7 +254,7 @@ void _rtw_read_port_cancel(struct adapter *adapter);
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val);
-int _rtw_write32(struct adapter *adapter, u32 addr, u32 val);
+int rtw_write32(struct adapter *adapter, u32 addr, u32 val);
 int _rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata);
 
 int _rtw_write8_async(struct adapter *adapter, u32 addr, u8 val);
@@ -271,8 +271,6 @@ void _rtw_write_port_cancel(struct adapter *adapter);
 	_rtw_read_port((adapter), (addr), (cnt), (mem))
 #define rtw_read_port_cancel(adapter) _rtw_read_port_cancel((adapter))
 
-#define  rtw_write32(adapter, addr, val)				\
-	_rtw_write32((adapter), (addr), (val))
 #define  rtw_writeN(adapter, addr, length, data)			\
 	_rtw_writeN((adapter), (addr), (length), (data))
 #define rtw_write8_async(adapter, addr, val)				\
-- 
2.33.0

