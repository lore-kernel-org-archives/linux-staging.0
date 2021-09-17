Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54673FCC
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 07:19:24 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id h17so26474881edj.6
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0sEUjUUuxHdMPhHnLo8c60yT4HrAvH94MxLwugCdDt4=;
        b=iAdekIQuG2UKVkperbyF6nJPfB5cCWsv0f1Z2Ed3Q642HQtxhgU6Bc3I6Y4HaUQgzC
         3UI06X7pFZuodWlEGcgrm4Fqn4T2B9yImCeH0QXd4dv0cz6wWaQJ4nmhrJ+IQCccaEV+
         DL1efuaJ3QJWK/zio9c6Y/vZfdwFeNfPjxvHcDJ5rGwplBXqSk5AObNXXdDyMcJOkeP7
         6ijGQ2XDdqQ4xYEHOMDZw1LTQzU1RdWcHzyHFpljr/ASjHCKpOxO3l7J+PSahYdnx1Zy
         yc6Czc5TgoDzCUde7NaJC3/4XQXpeSErM0LzMG1TE11HcsVXhyqgjbzOZ9/9a5AcFVoQ
         itDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0sEUjUUuxHdMPhHnLo8c60yT4HrAvH94MxLwugCdDt4=;
        b=F30JSrNp6WigRPJ6K6KCQBTqrIwfb1cp8e/Pl1q/EEGX3Mpc5aAmuac+ZfkMZOaJXo
         4OdsnDhl3dSqLNyfm3HZzyuqzRt449rCDVQiXZiJouH7oROrYDwWhFVEwemOIn+TygB9
         Seurvd499ovAt0iXWepumO3VEYNh0ENuvnbV/w6D7PiSI47aqOuFH8ui79GAHKacRmdE
         t73Fo+KQGwmM2FkuHUwxXO50cRlIygfFzH4AyoilP7s6o2RoAPoY8kSPneNV6SEdNXrM
         8CwveVN4qBWgmDYQfX+eyQyxcZUj12Wk8qOE8fNEv8GFraKDCWtVO7h0ZDwEqpVshiXA
         5J0g==
X-Gm-Message-State: AOAM530s+vjv8Lspey7NySVlC/HCzkszFHonCTGDxmlqIe8bU+mm6T7J
	6vF/ixyo/CID8ekPzPZISZI=
X-Google-Smtp-Source: ABdhPJwwRZ82gNTZhiH5g12cxNtmhD+6SSHLWt6aY6THfq0g+yHjqPOaXUbYTZ4X8wY++q6dQhVQRA==
X-Received: by 2002:a17:906:2bcf:: with SMTP id n15mr10812130ejg.414.1631863163166;
        Fri, 17 Sep 2021 00:19:23 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id q19sm2297140edc.74.2021.09.17.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 00:19:22 -0700 (PDT)
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
Subject: [PATCH v7 17/19] staging: r8188eu: shorten calls chain of rtw_read{8,16,32}()
Date: Fri, 17 Sep 2021 09:18:35 +0200
Message-Id: <20210917071837.10926-18-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917071837.10926-1-fmdefrancesco@gmail.com>
References: <20210917071837.10926-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 59 +++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 2d5e9b3ba538..ef35358cf2d3 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -89,6 +89,59 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 	return status;
 }
 
+static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8 size)
+{
+	struct adapter *adapt = intfhdl->padapter;
+	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
+	struct usb_device *udev = dvobjpriv->pusbdev;
+	int status;
+	u8 *io_buf; /* Pointer to I/O buffer */
+
+	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
+		return -EPERM;
+
+	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
+
+	io_buf = dvobjpriv->usb_vendor_req_buf;
+
+	status = usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
+				      REALTEK_USB_VENQT_READ, addr,
+				      REALTEK_USB_VENQT_CMD_IDX, io_buf,
+				      size, RTW_USB_CONTROL_MSG_TIMEOUT,
+				      GFP_KERNEL);
+
+	if (status == -ESHUTDOWN ||
+	    status == -ENODEV ||
+	    status == -ENOENT) {
+		/*
+		 * device or controller has been disabled due to
+		 * some problem that could not be worked around,
+		 * device or bus doesn’t exist, endpoint does not
+		 * exist or is not enabled.
+		 */
+		adapt->bSurpriseRemoved = true;
+		goto mutex_unlock;
+	}
+
+	if (status < 0) {
+		GET_HAL_DATA(adapt)->srestpriv.wifi_error_status =
+			USB_VEN_REQ_CMD_FAIL;
+
+		if (rtw_inc_and_chk_continual_urb_error(dvobjpriv))
+			adapt->bSurpriseRemoved = true;
+
+		goto mutex_unlock;
+	}
+
+	rtw_reset_continual_urb_error(dvobjpriv);
+	memcpy(data, io_buf, size);
+
+mutex_unlock:
+	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
+
+	return status;
+}
+
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
@@ -96,7 +149,7 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 	u16 address = addr & 0xffff;
 	u8 data;
 
-	usbctrl_vendorreq(intfhdl, address, &data, 1, REALTEK_USB_VENQT_READ);
+	usb_read(intfhdl, address, &data, 1);
 
 	return data;
 }
@@ -108,7 +161,7 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 	u16 address = addr & 0xffff;
 	__le16 data;
 
-	usbctrl_vendorreq(intfhdl, address, &data, 2, REALTEK_USB_VENQT_READ);
+	usb_read(intfhdl, address, &data, 2);
 
 	return le16_to_cpu(data);
 }
@@ -120,7 +173,7 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 	u16 address = addr & 0xffff;
 	__le32 data;
 
-	usbctrl_vendorreq(intfhdl, address, &data, 4, REALTEK_USB_VENQT_READ);
+	usb_read(intfhdl, address, &data, 4);
 
 	return le32_to_cpu(data);
 }
-- 
2.33.0

