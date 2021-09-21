Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8733FC8
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 18:19:04 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id v22so72741261edd.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0o7R1/of5Vu6517IGPX3lhQkbtC4VCfvh7d9Pkg94p8=;
        b=B0p8fKM4QnAYovgBz+b33IApVh9p25D6VhQa2xDP+OnLcFnWvln7ChfDIMfZ9IsVta
         V3sJ1QSQNplATypmr0vSZIIzTv3ObqdKLij5TyEpWYeB617AteLA6CpWlhQdtCYw+6/w
         +L8fqsy1inffHjSaMaUc8/++9H/ACBoYMHa6Y3Afor0cpwjuZ9WTlqJDd9OVXRUUtwqz
         vHwl7ZpGdZcsrpS1RD3X/NGHxQbHunH0vhGgTlGPhKihOvzQ6d8NVXH7OENC58q5i9OE
         h99r76HfANmpx8wwDOiM/DIFM6gf/UKnsP7AnoYkvovWwtwqsYwhMiPV3PUFlkbX4OsB
         CxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0o7R1/of5Vu6517IGPX3lhQkbtC4VCfvh7d9Pkg94p8=;
        b=eNuGlW52qRT/cDmVCb11RT24+lwnflbxvj1rKW+kRnNQBsOKabTbY/7nkof+QrCa1o
         7hrN3WPZfINAdNRd8cOGCTlrmcjxF2QM1j5ZnPCslVE2vwrrKjbihkSBJKcVkCMmztir
         ws2hrHmvslnq3AWUddrWSQW0babBOKeECty8HHRM8Jamj3/xMm1TY4rVxX9cAAn4kSxr
         hxgIXONIKFXLu0gbxvB+lF3vKXo3gR+51Us1cYLBHrdnDbfT5HRWUlu/myHkSUz0tWRi
         AybmKNJmoQntoHFFa168ELD8NoSohGk6fv8KsZFt4vZ5FrlX/KRT1Io+IY33b5A9hCY5
         Euyw==
X-Gm-Message-State: AOAM533W/3yccsyRMxvsDFn5UpRYOK4GfXRn64OIt1LY0/wsmoxHJLQe
	s7cGvUzAvUMFZNPqiCb/Hm8=
X-Google-Smtp-Source: ABdhPJyvl4Zx85WIrZf2veEw6zQff4KrLEgWQRmwVrFuhhO9dl/E0nIu8yDmWW14rsuUOAP+LTNfjA==
X-Received: by 2002:a17:906:5010:: with SMTP id s16mr13676572ejj.245.1632248342597;
        Tue, 21 Sep 2021 11:19:02 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id cn8sm1833162edb.77.2021.09.21.11.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:19:02 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v9 07/16] staging: r8188eu: remove casts from rtw_{read,write}*()
Date: Tue, 21 Sep 2021 20:18:25 +0200
Message-Id: <20210921181834.29677-8-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921181834.29677-1-fmdefrancesco@gmail.com>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary casts from rtw_read{8,16,32}() and from
rtw_write{8,16,32,N}().

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 9ff57e114b04..95cd7a6bc28b 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -96,7 +96,7 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
-	u16 value = (u16)(addr & 0x0000ffff);
+	u16 value = addr & 0xffff;
 	u8 data;
 
 	usbctrl_vendorreq(intf, value, &data, 1, REALTEK_USB_VENQT_READ);
@@ -108,7 +108,7 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
-	u16 value = (u16)(addr & 0x0000ffff);
+	u16 value = addr & 0xffff;
 	__le32 data;
 
 	usbctrl_vendorreq(intf, value, &data, 2, REALTEK_USB_VENQT_READ);
@@ -120,7 +120,7 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
-	u16 value = (u16)(addr & 0x0000ffff);
+	u16 value = addr & 0xffff;
 	__le32 data;
 
 	usbctrl_vendorreq(intf, value, &data, 4, REALTEK_USB_VENQT_READ);
@@ -132,7 +132,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
-	u16 value = (u16)(addr & 0x0000ffff);
+	u16 value = addr & 0xffff;
 	int ret;
 
 	ret = usbctrl_vendorreq(intf, value, &val, 1, REALTEK_USB_VENQT_WRITE);
@@ -144,7 +144,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
-	u16 value = (u16)(addr & 0x0000ffff);
+	u16 value = addr & 0xffff;
 	__le32 data = cpu_to_le32(val & 0x0000ffff);
 	int ret;
 
@@ -157,7 +157,7 @@ int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
-	u16 value = (u16)(addr & 0x0000ffff);
+	u16 value = addr & 0xffff;
 	__le32 data = cpu_to_le32(val);
 	int ret;
 
@@ -170,7 +170,7 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
 {
 	struct io_priv *io_priv = &adapter->iopriv;
 	struct intf_hdl *intf = &io_priv->intf;
-	u16 value = (u16)(addr & 0x0000ffff);
+	u16 value = addr & 0xffff;
 	u8 buf[VENDOR_CMD_MAX_DATA_LEN] = {0};
 	int ret;
 
-- 
2.33.0

