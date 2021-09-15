Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF13FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:42:16 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id i6so4171145edu.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=goMrrM9FMD/IXaI9vW819fp2kbhVZpXVLGWgpJIONdA=;
        b=cdW/tZ06wK4CSFw9MQAuYBMfp+dMnKKvFwM/YiDmqkh6GIlQvssY/w+/aekHGxCK7F
         ne+j5L5G7w3rkq2+AfOffa6tiHiQPN91PIncVuZOgRjmQFMW4Jr3uSw5J6sP3zzmoUuI
         p1YKWxlg+BDd8EHJYAoRCdK29JNET49yvK3aLF0aKrSHJwvh0lr3Ar3Chn/voF4j74mH
         7MkGWcW/SCAGtg5G56qmwH2AkaVoko+wbfFjz3XHoCyRcvpRvqZSCP3e9gHeupW2gxCJ
         S+QqvyUlwjr8hXfePNn8JX//fW98gwVDcibtLf5v/kqWTJrcMjgw4sND2yuMvV01JbJT
         aanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=goMrrM9FMD/IXaI9vW819fp2kbhVZpXVLGWgpJIONdA=;
        b=JpuATXEk7DB83cLFQvjazZ7qlDiLgRLDiH3HY8ckahSRRyi8LL2soofhqyiOs7GSF6
         cjz7W2EaIJjNewhCh+pztnbJRq+++r1IR7eNJY1FFw4D9NRixBxjW9BL16c7cNpnNz+7
         HJ3E4arUE04QONAgYRzo97rcoE0OekY7ip6mfGgbx5JMMGHoJGXbbPGFn+pIbUmHNBJx
         FWp6yeNNebGLQxli4+486FA1+ClZoCQsX8Qrh8oeZScKJwKbMom/rSMnNTTle7zlV7FV
         DVpoQmW+4JPRiA/ySSBpxA9Ey3zsM4pYhd4WsD8gRuJ8zrD+lrdk70HsyIW9QgLESF4I
         d5eQ==
X-Gm-Message-State: AOAM533EZC5qmQf6jHfVesHU3p7fRgX0kKLtIjj8N+Mg/0x/S086RgoX
	UC3URZD59i2GcAnuxlK8jyU=
X-Google-Smtp-Source: ABdhPJwrQsPnAbXETK3gV72lqULlzW4SsjJT22uhXoewGbZ60pFTKL9eVQByMrBgYlTT2MGv+3TdHw==
X-Received: by 2002:a05:6402:5107:: with SMTP id m7mr25468472edd.63.1631709734963;
        Wed, 15 Sep 2021 05:42:14 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:42:14 -0700 (PDT)
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
Subject: [PATCH v5 02/19] staging: r8188eu: remove the helpers of rtw_read8()
Date: Wed, 15 Sep 2021 14:41:32 +0200
Message-Id: <20210915124149.27543-3-fmdefrancesco@gmail.com>
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

Remove the unnecessary _rtw_read8() and usb_read8() and embed their
code into the caller (i.e., rtw_read8()).

_rtw_read8() is a mere redefinition of rtw_read8() and it is unneeded.
usb_read8() was the only functions assigned to (*_usb_read8) pointer,
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
index e6f377377ab2..4c43b6d00178 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -34,20 +34,6 @@ jackson@realtek.com.tw
 #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
 #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
 
-u8 _rtw_read8(struct adapter *adapter, u32 addr)
-{
-	u8 r_val;
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl *pintfhdl = &pio_priv->intf;
-	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
-
-
-	_read8 = pintfhdl->io_ops._read8;
-	r_val = _read8(pintfhdl, addr);
-
-	return r_val;
-}
-
 u16 _rtw_read16(struct adapter *adapter, u32 addr)
 {
 	u16 r_val;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 7f30b00b3ce6..8389deeb1182 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -97,8 +97,10 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
 	return status;
 }
 
-static u8 usb_read8(struct intf_hdl *pintfhdl, u32 addr)
+u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
+	struct io_priv *pio_priv = &adapter->iopriv;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u16 wvalue = (u16)(addr & 0x0000ffff);
 	u8 data;
 
@@ -538,7 +540,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 {
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-	pops->_read8 = &usb_read8;
 	pops->_read16 = &usb_read16;
 	pops->_read32 = &usb_read32;
 	pops->_read_port = &usb_read_port;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 5ef89c72cc83..9dc32f7bcae8 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -245,7 +245,7 @@ void unregister_intf_hdl(struct intf_hdl *pintfhdl);
 void _rtw_attrib_read(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_attrib_write(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 
-u8 _rtw_read8(struct adapter *adapter, u32 addr);
+u8 rtw_read8(struct adapter *adapter, u32 addr);
 u16 _rtw_read16(struct adapter *adapter, u32 addr);
 u32 _rtw_read32(struct adapter *adapter, u32 addr);
 void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
@@ -267,7 +267,6 @@ u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt,
 			     u8 *pmem, int timeout_ms);
 void _rtw_write_port_cancel(struct adapter *adapter);
 
-#define rtw_read8(adapter, addr) _rtw_read8((adapter), (addr))
 #define rtw_read16(adapter, addr) _rtw_read16((adapter), (addr))
 #define rtw_read32(adapter, addr) _rtw_read32((adapter), (addr))
 #define rtw_read_port(adapter, addr, cnt, mem)				\
-- 
2.33.0

