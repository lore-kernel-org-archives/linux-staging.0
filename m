Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D053FCD
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 22:00:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a25so5368589ejv.6
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tc3tJqgTrWQJFMEh/aj2oTvdJ8WvkMN0LPTXcCZlJy0=;
        b=Kpw273Pi0qVsxYXxzmU3XsyhKZMXaMj5V7WK1rZV4ydCtLG0SXXc2MVodiJnUKxlH/
         5TNaiiEaZZmtdyg2Q76eHeYG6OJd3lQHG8zpFnNUZbqLuW/uLCgvI/UPeBTfqD0duboa
         DIgQOy9HeYmH950sBUJgI79iClg6gcpOP6MpsWIYgD+Su54CnPJTMeTQhBhS4dI6fc2n
         WzDAMCe+sNfDZjz3R+NSmtlsoCqkSZ3ZaYKNfUQq1GvlRu/Mc4p59EL8ymDNmKG3nHVZ
         PqV8WSwFqiIYTnwdTLPbRw4kGkqZkYgFQmPtI0G2oYj3VGOYIX5+yAouHgljXtyfOElj
         qhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tc3tJqgTrWQJFMEh/aj2oTvdJ8WvkMN0LPTXcCZlJy0=;
        b=DM5JbE1FmoacBMSM7m56/KJK48pIRqAOZoY/02Qm9Sc9eUiNcyFhhaCaNE41ebodKU
         8xS/x7G8FioCemj3uH9//ONEe51YlpE/zDL1b7URsT+HKJrsXB9UB9aWC7kGhw8FFbwG
         pndrvlpAaXSSgcvAxglYgwrRtetsjcDX+EF28lqn1Hn3FUHbYuiQNMf7utKh/xxBtKRP
         clH9y8WbyZxIoeoemxu2titfgLCbM1GZLG3nYc85ySaq11TyXIExlmBFK2KGoADV2JUT
         BMxmyhIhRermUwPQVvEfQVx6gaBxgrPcwkV8QXV0WX4dnZAvni7vG2nI66FobdZx8TNo
         p9hQ==
X-Gm-Message-State: AOAM532QxNB25afWjHQi5z5xNzpOzDu3aSeAhBBcjbtroiSzCZKBWO/H
	0bKpwLOn+fWFJZYi/2vTMfc=
X-Google-Smtp-Source: ABdhPJwsGZeUlCMYBC/ppf6euLdEzFmUQ1ItMMZE1OI/siH99mCi/02XamgPCh4VsGERZ+hezbLgLw==
X-Received: by 2002:a17:906:74d:: with SMTP id z13mr5981250ejb.127.1630792858146;
        Sat, 04 Sep 2021 15:00:58 -0700 (PDT)
Received: from localhost.localdomain (host-79-23-101-208.retail.telecomitalia.it. [79.23.101.208])
        by smtp.gmail.com with ESMTPSA id i4sm1940258edq.34.2021.09.04.15.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 15:00:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 2/3] staging: r8188eu: Shorten calls chain of rtw_read8/16/32()
Date: Sun,  5 Sep 2021 00:00:47 +0200
Message-Id: <20210904220048.12822-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904220048.12822-1-fmdefrancesco@gmail.com>
References: <20210904220048.12822-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
For this purpose unify the three usb_read8/16/32 into the new
usb_read(); make the latter parameterizable with 'size'; embed most of
the code of usbctrl_vendorreq() into usb_read() and use in it the new
usb_control_msg_recv() API of USB Core.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v2->v3: No changes.

v1->v2: No changes.

 drivers/staging/r8188eu/hal/usb_ops_linux.c | 92 +++++++++++++++++----
 1 file changed, 78 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index a87b0d2e87d0..f9c4fd5a2c53 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -97,38 +97,102 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 	return status;
 }
 
+static int usb_read(struct intf_hdl *intfhdl, u32 addr, void *data, u8 size)
+{
+	u16 value = (u16)(addr & 0x0000ffff);
+	struct adapter *adapt = intfhdl->padapter;
+	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
+	struct usb_device *udev = dvobjpriv->pusbdev;
+	int status;
+	u8 *io_buf;
+	int vendorreq_times = 0;
+
+	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx) {
+		status = -EPERM;
+		goto exit;
+	}
+
+	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
+
+	/*  Acquire IO memory for vendorreq */
+	io_buf = dvobjpriv->usb_vendor_req_buf;
+
+	if (!io_buf) {
+		DBG_88E("[%s] io_buf == NULL\n", __func__);
+		status = -ENOMEM;
+		goto release_mutex;
+	}
+
+	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
+		status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
+					      REALTEK_USB_VENQT_READ, value,
+					      REALTEK_USB_VENQT_CMD_IDX, io_buf,
+					      size, RTW_USB_CONTROL_MSG_TIMEOUT,
+					      GFP_KERNEL);
+		if (!status) {   /*  Success this control transfer. */
+			rtw_reset_continual_urb_error(dvobjpriv);
+			memcpy(data, io_buf, size);
+		} else { /*  error cases */
+			DBG_88E("reg 0x%x, usb %s %u fail, status:%d vendorreq_times:%d\n",
+				value, "read", size, status, vendorreq_times);
+
+			if (status == (-ESHUTDOWN) || status == -ENODEV) {
+				adapt->bSurpriseRemoved = true;
+			} else {
+				struct hal_data_8188e *haldata = GET_HAL_DATA(adapt);
+
+				haldata->srestpriv.wifi_error_status = USB_VEN_REQ_CMD_FAIL;
+			}
+
+			if (rtw_inc_and_chk_continual_urb_error(dvobjpriv)) {
+				adapt->bSurpriseRemoved = true;
+				break;
+			}
+		}
+
+		/*  firmware download is checksummed, don't retry */
+		if ((value >= FW_8188E_START_ADDRESS && value <= FW_8188E_END_ADDRESS) || !status)
+			break;
+	}
+
+release_mutex:
+	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
+exit:
+	return status;
+}
+
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 wvalue = (u16)(addr & 0x0000ffff);
+	struct io_priv *io_priv = &adapter->iopriv;
+	struct intf_hdl *intfhdl = &io_priv->intf;
+	u16 value = (u16)(addr & 0x0000ffff);
 	u8 data;
 
-	usbctrl_vendorreq(pintfhdl, wvalue, &data, 1, REALTEK_USB_VENQT_READ);
+	usb_read(intfhdl, value, &data, 1);
 
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
+	u16 value = (u16)(addr & 0x0000ffff);
+	__le16 data;
 
-	usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_READ);
+	usb_read(intfhdl, value, &data, 2);
 
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
+	u16 value = (u16)(addr & 0x0000ffff);
 	__le32 data;
 
-	usbctrl_vendorreq(pintfhdl, wvalue, &data, 4, REALTEK_USB_VENQT_READ);
+	usb_read(intfhdl, value, &data, 4);
 
 	return le32_to_cpu(data);
 }
-- 
2.33.0

