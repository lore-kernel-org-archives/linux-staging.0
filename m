Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588CB3FCC
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 07:19:23 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id n10so25814390eda.10
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 00:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ya+Xdz80zUYtSozKgjEzuQT1fyXeN/k0VWgo9uW+f80=;
        b=T9QXP3t3x1VG8lt4hZj+OsMyWtNroFMPUplrf3jlV59+szRGn2mYqfMq1os3pnUokG
         ywOxSuqkSlLr34GIQWm0YrR2sTqu/CD/GrgUm707c+y5pVOFGXixH89iIWh+QTouzX3O
         PttJl63PVpnfp9jkleJ6fEf1aK5RXhOj5DPymvQ3xyB/vTqplPphO5bkhDKV8v/VzR3L
         fspyHkM5rtqmjK4W5EUVXDTjENQtJwPJ5STclu7vfYUD0t9xyAb0ChzuDiWzhG6PpK8E
         +Ew6RK95/mjMFfcWf5l0qwBZVLAV8+DL5yq/4NCMZCao2KLna7Z02y16TwTVrWC314F6
         M2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ya+Xdz80zUYtSozKgjEzuQT1fyXeN/k0VWgo9uW+f80=;
        b=sxJOsmK4ZjAKpfzYVt7G2LCduTNlSJicCflvyvwye4NQj6whx8Em/ZL/JLRmMP6JHa
         WZwLdKQptmpWyxH2Ia9rtzqeNiYr7QG+hmTopWg28SgnZDEi1ZTMr2JtV9N6m7gBPNeQ
         LwydmVWfE+DFEJ1z2c9cYIP2/A/TlYKjxxTb8LGfitpkMC60YhiNFLFNT8IbJkL6MFuR
         4RFIo56q7CylkMGzsBRfcLVdMr+gge5Y9bGfxFIwt4MedfBnnCeFlphPTWtdA3s5hp31
         xagZnB79cYzXFqQoKPos1w14y+nL9gGslX9UZtsxEQiuuVuDRvwevgezLVpPuXy1+Tbd
         inQw==
X-Gm-Message-State: AOAM531aDAdSu7sO6S5aOGzBAYZOCVo7QUksfU+Ilyq45FgtN2SnwgIw
	okV/KDC1cqjHP1yo0J5S9Bc=
X-Google-Smtp-Source: ABdhPJykRiBM/+/1R7FAUdZRvZXtYNJh3ENs3I/zj9rhFXotEajhBxa0fQjng9JQ7ZFAk/hcdrObRg==
X-Received: by 2002:a05:6402:411:: with SMTP id q17mr11011150edv.35.1631863161796;
        Fri, 17 Sep 2021 00:19:21 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id q19sm2297140edc.74.2021.09.17.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 00:19:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v7 16/19] staging: r8188eu: clean up rtw_read*() and rtw_write*()
Date: Fri, 17 Sep 2021 09:18:34 +0200
Message-Id: <20210917071837.10926-17-fmdefrancesco@gmail.com>
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

Clean up rtw_read{8,16,32}() and rtw_write{8,16,32,N}() in usb_ops_linux.c.

1) Rename variables:
        length => len
        pio_priv => io_priv
        pintfhdl => intfhdl
        wvalue => address.
2) Remove unnecessary casts.
3) Fix types.  Use __le16 instead of __le32.

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 67 +++++++++++----------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 2098ce935dc0..2d5e9b3ba538 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -91,91 +91,92 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
+	u16 address = addr & 0xffff;
 	u8 data;
 
-	usbctrl_vendorreq(pintfhdl, wvalue, &data, 1, REALTEK_USB_VENQT_READ);
+	usbctrl_vendorreq(intfhdl, address, &data, 1, REALTEK_USB_VENQT_READ);
 
 	return data;
 }
 
 u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
-	__le32 data;
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
+	u16 address = addr & 0xffff;
+	__le16 data;
 
-	usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_READ);
+	usbctrl_vendorreq(intfhdl, address, &data, 2, REALTEK_USB_VENQT_READ);
 
-	return (u16)(le32_to_cpu(data) & 0xffff);
+	return le16_to_cpu(data);
 }
 
 u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
+	u16 address = addr & 0xffff;
 	__le32 data;
 
-	usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_READ);
+	usbctrl_vendorreq(intfhdl, address, &data, 4, REALTEK_USB_VENQT_READ);
 
 	return le32_to_cpu(data);
 }
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
+	u16 address = addr & 0xffff;
 	int ret;
 
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, &val, 1, REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(intfhdl, address, &val, 1, REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
 
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
-	__le32 data = cpu_to_le32(val & 0x0000ffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
+	__le16 data = cpu_to_le16(val);
+	u16 address = addr & 0xffff;
 	int ret;
 
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(intfhdl, address, &data, 2, REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
 
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
 	__le32 data = cpu_to_le32(val);
+	u16 address = addr & 0xffff;
 	int ret;
 
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(intfhdl, address, &data, 4, REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
 
-int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata)
+int rtw_writeN(struct adapter *adapter, u32 addr, u32 len, u8 *data)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
 	u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
+	u16 address = addr & 0xffff;
+	u16 length = len & 0xffff;
 	int ret;
 
 	if (length > VENDOR_CMD_MAX_DATA_LEN)
 		return _FAIL;
 
-	memcpy(buf, pdata, length);
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, buf, (length & 0xffff), REALTEK_USB_VENQT_WRITE);
+	memcpy(buf, data, length);
+	ret = usbctrl_vendorreq(intfhdl, address, buf, length, REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
-- 
2.33.0

