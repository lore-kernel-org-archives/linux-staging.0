Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517483FCC
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 12:27:37 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y89so24665739ede.2
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0o7R1/of5Vu6517IGPX3lhQkbtC4VCfvh7d9Pkg94p8=;
        b=UpTfTOx0pfLaZVB370SBT2TLnJBFC6nHj4KdrGc7j/W00NeGVrbktmrALvpYN02Xl2
         QWZL9Zf8+gV79mkDZM4S7CaHy3PmBfiQiwbFPQP24IcOU/JUktM66Zyfv6lkdcpNo1Yv
         Qi0eaSEDJNiZg97tBW4BxuFFmrYZi3sLQJIYvyT2fulzITT8kpLIvp9T192oh774FhpA
         Ub4Nts0AYeLV53yjobOd1Kw+qsHjrD1FO1ShsYNlH/D1sxKNQWEOC7kAhRS8bkGUvmgu
         1JGrrilBy9i+wd3mCfAxXej6Cn4Ae/quU0ubXQBeP8NQ5dXCELD1CWIXrvG0/CLpEYOf
         bq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0o7R1/of5Vu6517IGPX3lhQkbtC4VCfvh7d9Pkg94p8=;
        b=24Th3t8m7fkWxHp8EAbruy9hwuWFVpCy04F+JpO3CsAlLbvL1ytGInaxz90BJ547Vq
         3Bes6WZ92Nb54E78Qc1g4h8iYU6GCRaheWe8SQgseiKgehd3bNzv03bi35BNn0GpS77b
         53cJVRiTLmk/c71d2rCMjA16Jz+dOp2IP2VIidHu2AkP7Mr3Ke08m0T+U/InUgek4eY6
         J0XCv5CFWIE2TPqlIYY3utOT5QE8PGnIgNG6ICv944lYBBlxmr07zm/3ZXpHOAQg9Uml
         v+U77SfIzeBzsBuFtojj2NtoVKAJRUSqqGC/OmgxtRl9K5Qo5wlwStI6SY8PpqzZgcec
         scUw==
X-Gm-Message-State: AOAM53143eb77+99M0ooKmhxve+9p/Mglkm/rlI5j7C7pXIT6N62++ZH
	L3wK7rVSC7edpX2B3HEpIAE=
X-Google-Smtp-Source: ABdhPJzGEHDVUnpER+AjxCRY53gWAfByvHPAyrdf7ufclrroeOlbQAa5ZNV/ILj56FTvD07BhUx5WQ==
X-Received: by 2002:a17:906:fa12:: with SMTP id lo18mr11107253ejb.296.1632486455749;
        Fri, 24 Sep 2021 05:27:35 -0700 (PDT)
Received: from localhost.localdomain.it (host-212-171-30-160.retail.telecomitalia.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id v13sm4882522ejh.62.2021.09.24.05.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:27:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v10 07/16] staging: r8188eu: remove casts from rtw_{read,write}*()
Date: Fri, 24 Sep 2021 14:26:56 +0200
Message-Id: <20210924122705.3781-8-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924122705.3781-1-fmdefrancesco@gmail.com>
References: <20210924122705.3781-1-fmdefrancesco@gmail.com>
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

