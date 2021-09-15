Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E9D3FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:42:33 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id o20so5851104ejd.7
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UUJSGDbnVaSW6IkF1hmLWYJune4CPKV8br/bhPi+Sss=;
        b=KVBmqGlksO/YHajAvQWojtbyobVvFCKIsoL22ytLUQvy48EeQgxO3C2/j1kS3rSEFO
         pi9AIZ7ugo0eyWhTLOBotYIJyqJu9uNNv3KzeqhBSkHyOGPSzvTwQqgofAINEL7tUSmJ
         +cjVZ4chXZc+lpw1UmR1x5Rk6fdKW6SLIIFpdGMa4Gcl8fdT66wwgWN59YlOsbM8NzUo
         EyNX5+ABuVH+Qi8XQFZkv700jpbuGRtWKqD8nE9n9+6pb6k8wYBi0IMDDqpZ/hThlexS
         HUFXIKTRwGMQbnjWXIo7r/atdlcnhJFxvYBi5jN+ztaztJ0BfjYxybdHri1AcXyxwEtI
         oxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UUJSGDbnVaSW6IkF1hmLWYJune4CPKV8br/bhPi+Sss=;
        b=qqjDAlM2us79O3iw2vngWAfuEAsxUFYFB3xoBPP+EqVaNbVfa0yr65zMmk0f19I1zg
         md+9OdHWXuMQI6/7uSV66rowZd9kbudhc9bnNlTEzhS0km1G+S2GQJFkKWKysc7Pie3t
         E+yIfCY/n/Ymft9hUacoGBqiLFty8+oZ2yS9025vsaD3Fuwj9neJvyjLUzPD5zBqA6hw
         mBiFgmFvOBRPxZy2GvfLTyvcMiovSB7BA6pVdyqyl+iO5PbMqgwqzyaXDqW080/1xqLd
         qeEUsGF1jUCVONI9AEDGvwDs9JNeUQdUugHMoUv4PSu8LHc+0UHyTQti58gk3BZqZ1rM
         D+XA==
X-Gm-Message-State: AOAM5325dFT/j8fsezErbco9ro3waO5rLRxhgy+u7ZsOafoJcRz/4jOo
	ysHCiwL3+DqlgynzDxLMlNw=
X-Google-Smtp-Source: ABdhPJwZorau7lPu8lHGcPkWuGlCc1maejdMyaSfbCBypISeAuOkxKB+nQbkMQKcXdYyI398pSVPlg==
X-Received: by 2002:a17:906:30d6:: with SMTP id b22mr25670622ejb.442.1631709751480;
        Wed, 15 Sep 2021 05:42:31 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:42:30 -0700 (PDT)
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
Subject: [PATCH v5 04/19] staging: r8188eu: remove the helpers of rtw_read32()
Date: Wed, 15 Sep 2021 14:41:34 +0200
Message-Id: <20210915124149.27543-5-fmdefrancesco@gmail.com>
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

Remove the unnecessary _rtw_readr32() and usb_read32() and embed their
code into the caller (i.e., rtw_read32()).

_rtw_read32() is a mere redefinition of rtw_read32() and it is unneeded.
usb_read32() was the only functions assigned to the (*_usb_read32) pointer,
so we can simply remove it and make a direct call.

This patch is in preparation for the _io_ops structure removal.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c       | 14 --------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c |  5 +++--
 drivers/staging/r8188eu/include/rtw_io.h    |  3 +--
 3 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index b5d1c8e52b22..cb24500cbc6e 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -34,20 +34,6 @@ jackson@realtek.com.tw
 #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
 #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
 
-u32 _rtw_read32(struct adapter *adapter, u32 addr)
-{
-	u32 r_val;
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	u32	(*_read32)(struct intf_hdl *pintfhdl, u32 addr);
-
-	_read32 = pintfhdl->io_ops._read32;
-
-	r_val = _read32(pintfhdl, addr);
-
-	return r_val;
-}
-
 int _rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 8b4fc014d93a..39fd9994787d 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -121,8 +121,10 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 	return (u16)(le32_to_cpu(data) & 0xffff);
 }
 
-static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
+u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
+	struct io_priv *pio_priv = &adapter->iopriv;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u16 wvalue = (u16)(addr & 0x0000ffff);
 	__le32 data;
 
@@ -542,7 +544,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 {
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-	pops->_read32 = &usb_read32;
 	pops->_read_port = &usb_read_port;
 	pops->_write8 = &usb_write8;
 	pops->_write16 = &usb_write16;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 527503d3ecc8..c53d9c8bd9a7 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -247,7 +247,7 @@ void _rtw_attrib_write(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 
 u8 rtw_read8(struct adapter *adapter, u32 addr);
 u16 rtw_read16(struct adapter *adapter, u32 addr);
-u32 _rtw_read32(struct adapter *adapter, u32 addr);
+u32 rtw_read32(struct adapter *adapter, u32 addr);
 void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_read_port_cancel(struct adapter *adapter);
@@ -267,7 +267,6 @@ u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt,
 			     u8 *pmem, int timeout_ms);
 void _rtw_write_port_cancel(struct adapter *adapter);
 
-#define rtw_read32(adapter, addr) _rtw_read32((adapter), (addr))
 #define rtw_read_port(adapter, addr, cnt, mem)				\
 	_rtw_read_port((adapter), (addr), (cnt), (mem))
 #define rtw_read_port_cancel(adapter) _rtw_read_port_cancel((adapter))
-- 
2.33.0

