Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB82FAF
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 18:13:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id v5so15699743edc.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 11:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oqgqNFf+fV8jwPOMAjoPzlK6kg+1czy7uuQDOiE9SPA=;
        b=Zslj339YLyRq7aGEU560rW36G090XCmoCn5kD8tuV+5636azU55/pQ/WnHldQ8K9HO
         psrkcRF2aNgWJwrWoqeFVsHNVvhmH8uUpSPATz5i5SEwLPOAujle3ZjqEtnme0dcRoKJ
         X/eJZ+r+1f7RyAZF0Bp5tXkYG7QJUaSAkcHY42h9t0hq3euDkAlUkFllfXoFgkU9Gp1K
         4yCgkdulgNVMMcNqErNWAYZdhSf9IQi0fZ+v+c1VCuvRZrDZYZUe++4FdZwWQfzwUJEv
         KLDmSfPzO8+zM+GqtSA59gIgtvMgEUfDnFGGLpXn2BHNdE5j/8OJmyrNtJF3T26fViIn
         zv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oqgqNFf+fV8jwPOMAjoPzlK6kg+1czy7uuQDOiE9SPA=;
        b=DR02J/A31dsAWedwKaBOtp9D5BcL9AcprkV8qEdiXNhDpb0Skp2j6UtPcsO/eLPo1r
         PbzFcv923YJh15Fpl/QqZRYEy3ZJi8cglq9MtmA+96a8FNYmyT+YPsK5FHjB3urTWEZA
         eOawMg0ZM46/NyQXLY8kl83xKWLiPgFUt3xPzZilm+tNnDLWU3YJHH9Z3LCdsy/TEVm8
         XunNuc2slRGz08Tn1tST+1M/yasXkNKK205SzFbIiBL0juETSx90BplAVzgQkUyGTgGE
         /07/lzkUqKACFR7P/u2GOS6TkBicEx6H4Wd9i3eEh97EfaIV/bNktBPTzwBRMVwTKu/p
         8sLA==
X-Gm-Message-State: AOAM530P/HuWPQ879/YN1YeUrnDufHkn+zChoS8siUx9OqUCDaL8ITIK
	DeZUrosW4bGKUWuKROqclyE=
X-Google-Smtp-Source: ABdhPJynxPW/zUnhPbWnAWpT3cAWHi20RE4JoIgftzl0V0YCy4uEnstw+cM6x/zkCKlbZyqyuK7phA==
X-Received: by 2002:a50:c90b:: with SMTP id o11mr14576291edh.216.1631556782624;
        Mon, 13 Sep 2021 11:13:02 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id d25sm4258999edt.33.2021.09.13.11.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 11:13:02 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 16/18] staging: r8188eu: hal: Clean up rtw_read*() and rtw_write*()
Date: Mon, 13 Sep 2021 20:10:00 +0200
Message-Id: <20210913181002.16651-17-fmdefrancesco@gmail.com>
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

Clean up rtw_read{8,16,32}() and rtw_write{8,16,32,N}() in usb_ops_linux.c
because some of their code will be reused in the following two patches of
this series. This cleanup is in preparation for shortening the call chains
of rtw_read{8,16,32}() and rtw_write{8,16,32,N}().
More insights can be found at
https://lore.kernel.org/lkml/5319192.FrU0QrjFp7@localhost.localdomain/

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v3->v4:
        Make this patch.
v2->v3:
        No changes.
v1->v2:
        No changes.

 drivers/staging/r8188eu/hal/usb_ops_linux.c | 71 +++++++++++----------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 2c7e92085a6e..04402bab805e 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -91,91 +91,92 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
 	u8 data;
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
+	u16 address = (u16)(addr & 0xffff);
 
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
+	__le16 data;
+	u16 address = (u16)(addr & 0xffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
 
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
 	__le32 data;
+	u16 address = (u16)(addr & 0xffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
 
-	usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_READ);
+	usbctrl_vendorreq(intfhdl, address, &data, 4, REALTEK_USB_VENQT_READ);
 
 	return le32_to_cpu(data);
 }
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
 	int ret;
+	u16 address = (u16)(addr & 0xffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
 
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
 	int ret;
+	u16 address = (u16)(addr & 0xffff);
+	__le16 data = cpu_to_le16(val);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
 
-	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(intfhdl, address, &data, 2, REALTEK_USB_VENQT_WRITE);
 
 	return RTW_STATUS_CODE(ret);
 }
 
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
-	__le32 data = cpu_to_le32(val);
 	int ret;
+	u16 address = (u16)(addr & 0xffff);
+	__le32 data = cpu_to_le32(val);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
 
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
-	u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
 	int ret;
+	u16 address = (u16)(addr & 0xffff);
+	u16 length = (u16)(len & 0xffff);
+	u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
 
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

