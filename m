Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579926D13
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 21:11:25 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c22so8494227edn.12
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 14:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TvrI7/xbofiwuisEy+JpTlK1Hp15Vl/Bil1EcbxZlVQ=;
        b=qHJ4lfRJz5jWNKkmsPApZ6vcSyVjPFNfn8WrOeAF+zr0h2opSMyO1VJNPmv5SwnM8g
         NZt9HBoVG9Datd37TG5t4WlAuixSEo+zn5GIBIddzXsCpOB+NtOazjbmrVv3NMUNzKFv
         tnl6Po5f4gB/9/VZJW69YovS7OBILn7CrhxvrITJ7uHG0zAU3f3GNOn0CXL7ANKK1z+u
         TBrrJRje3McSOFOt7nHoM6HZP5KtmHoQOp+TN92iZWcFwvpwJuh533RMYus7j8myB/CF
         h1C38VOcdXieX0SC7dV6VDQvZPazMTKHlVOEIMgmZiTXP/Dkie0bjGsQjZ3yzKQmL4F+
         /PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TvrI7/xbofiwuisEy+JpTlK1Hp15Vl/Bil1EcbxZlVQ=;
        b=cQ5DmEpuhXKrmDj2adunfEU9RT1ieOMgiD5NDu9DKzQYHlFDiBpa1VQaFPgV4tViUF
         TEb1psZvAb1dSFvapnsJ/druNB+NkphgZ3jpIecDS8/5nx9xWDw/NWEAJfue6Sg3VgXC
         UDoJ7NhIUC5s9V18FNDmCvSoDYcKOLBxzoz3XTBTscewhkJ86CAiRVM6etDTvh+xLgF4
         fJR08Err9zxOtB0uA1P6XCZKIsfVFqTyRh61L9IRt4liwQDuCrOyC4LPeMIp2LZ+R4ld
         1nEMSvq2ktXH2PVMgMq1CFBkCtnVixN5IEorsqtjifaZ2fGABf61yRAGcG1r4lGl9mZv
         oBxA==
X-Gm-Message-State: AOAM530EXU8sGXoX/XDQVH+mp5zh6QGdyZvhI+ShUM/Kth23BQH3VgGQ
	54DutlmOVYCYE4Fc81l3Mjk=
X-Google-Smtp-Source: ABdhPJyoYA6dLUfqKgu0injwKwCz2c3Nw/5YUFTx4EYsF23hnEC5ywlc27+9uYD/FKrdWPz78s5/dg==
X-Received: by 2002:a17:906:311b:: with SMTP id 27mr2260901ejx.428.1631740283778;
        Wed, 15 Sep 2021 14:11:23 -0700 (PDT)
Received: from localhost.localdomain (host-95-235-105-169.retail.telecomitalia.it. [95.235.105.169])
        by smtp.gmail.com with ESMTPSA id t3sm511618edt.61.2021.09.15.14.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 14:11:23 -0700 (PDT)
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
Subject: [PATCH v6 05/19] staging: r8188eu: remove the helpers of usb_write8()
Date: Wed, 15 Sep 2021 23:10:49 +0200
Message-Id: <20210915211103.18001-6-fmdefrancesco@gmail.com>
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

Remove the unnecessary _rtw_write8() and usb_write8() and embed their
code into the caller (i.e., rtw_write8()).

_rtw_write8() is a mere redefinition of rtw_write8() and it is unneeded.
usb_write8() was the only functions assigned to the (*_usb_write8) pointer,
so we can simply remove it and make a direct call.

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
index cb24500cbc6e..69ab6e24a4b7 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -34,21 +34,6 @@ jackson@realtek.com.tw
 #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
 #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
 
-int _rtw_write8(struct adapter *adapter, u32 addr, u8 val)
-{
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-	int ret;
-
-	_write8 = pintfhdl->io_ops._write8;
-
-	ret = _write8(pintfhdl, addr, val);
-
-
-	return RTW_STATUS_CODE(ret);
-}
-
 int _rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 39fd9994787d..69e64863a5d1 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -133,11 +133,16 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 	return le32_to_cpu(data);
 }
 
-static int usb_write8(struct intf_hdl *pintfhdl, u32 addr, u8 val)
+int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
+	struct io_priv *pio_priv = &adapter->iopriv;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u16 wvalue = (u16)(addr & 0x0000ffff);
+	int ret;
+
+	ret = usbctrl_vendorreq(pintfhdl, wvalue, &val, 1, REALTEK_USB_VENQT_WRITE);
 
-	return usbctrl_vendorreq(pintfhdl, wvalue, &val, 1, REALTEK_USB_VENQT_WRITE);
+	return RTW_STATUS_CODE(ret);
 }
 
 static int usb_write16(struct intf_hdl *pintfhdl, u32 addr, u16 val)
@@ -545,7 +550,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
 	pops->_read_port = &usb_read_port;
-	pops->_write8 = &usb_write8;
 	pops->_write16 = &usb_write16;
 	pops->_write32 = &usb_write32;
 	pops->_writeN = &usb_writeN;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index c53d9c8bd9a7..3b229027f094 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -252,7 +252,7 @@ void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_read_port_cancel(struct adapter *adapter);
 
-int _rtw_write8(struct adapter *adapter, u32 addr, u8 val);
+int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
 int _rtw_write16(struct adapter *adapter, u32 addr, u16 val);
 int _rtw_write32(struct adapter *adapter, u32 addr, u32 val);
 int _rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata);
@@ -271,8 +271,6 @@ void _rtw_write_port_cancel(struct adapter *adapter);
 	_rtw_read_port((adapter), (addr), (cnt), (mem))
 #define rtw_read_port_cancel(adapter) _rtw_read_port_cancel((adapter))
 
-#define  rtw_write8(adapter, addr, val)					\
-	_rtw_write8((adapter), (addr), (val))
 #define  rtw_write16(adapter, addr, val)				\
 	_rtw_write16((adapter), (addr), (val))
 #define  rtw_write32(adapter, addr, val)				\
-- 
2.33.0

