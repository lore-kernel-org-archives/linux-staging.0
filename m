Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E53FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:42:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id kt8so5763892ejb.13
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GN/Y9Rfapmu/4wKZZ2Bl/WRj145thqWrQnab4g+VR8M=;
        b=RDEvLJ9wUAHLbcWR9jfNugRwgoyTKjdcbAM5ivaa8g29VLt0U2Io1Qzy2AcsLeQDEU
         rWwVZoN9D3nlqh62T36qAXV/rjXcDEdMQZK1SP+TZB8fA7UInXy1gVZ/HprHWHPckXY8
         x0enMnXFnzgADjOoPn4KzGwtq+hw3LA4xMLVkO8RkHuwcK4KztKL9htWP2uMEBzET486
         FNdWUvvrvSEHRAZwnwcBw4CBRPUJSA0YsJq3kOIMacBdybnJkt1g1Muu7MeB2QRC+1Vd
         OlQURoNz4XWlgOeEpJWjAwYQiqAbQsD+dqfzcqKXdj0l7pBoVcV21vdjpDQCk3qp7az2
         8qYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GN/Y9Rfapmu/4wKZZ2Bl/WRj145thqWrQnab4g+VR8M=;
        b=Prlt/UgSr6xAuY4zli+LIgx+bQHW9Jn1BSvn/LKKEX7qAaHfEG8b/vUi0iOztpQv6b
         SNyCU6CdVseSgkKp2hwYvCGUZzhUPUEA35cH5o0AoClkbTvS2ohZeiGvV+xEXoHEgdPa
         BliPDCuVFkeolQLfLIVIz2bnUwrLdAjuUMKvpgz68E7A1yJULCJr9bplaSjFPFG4CkCF
         fKaywmli0tQskhNbS+tdNrz2kGep1ddYk+uL+5I4iWnSh8EXcWJ2Dwg+yQLbuzpUgXgm
         Rx2zKAj1OAd+gRIR+QXknAiwHRCILAcqGVTCVbA04HXj1Ibihb2Mx0dqPGRnwS2j52QG
         QdOw==
X-Gm-Message-State: AOAM532hNn5TJoOGLzIY4MCiq15gYU2ehT94fkQOUfYfCxPr/tI76ef8
	bNdm+F4s8dT4IRMbdr2LVKY=
X-Google-Smtp-Source: ABdhPJxNhN4R0t/Qm3hsT0M3lzFFtNJsD2DMyXU9Onk6v/mQAAQQCahkTDj5N7oCURd1aws8HGuE7g==
X-Received: by 2002:a17:906:289a:: with SMTP id o26mr9928433ejd.243.1631709742081;
        Wed, 15 Sep 2021 05:42:22 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:42:21 -0700 (PDT)
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
Subject: [PATCH v5 03/19] staging: r8188eu: remove the helpers of rtw_read16()
Date: Wed, 15 Sep 2021 14:41:33 +0200
Message-Id: <20210915124149.27543-4-fmdefrancesco@gmail.com>
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

Remove the unnecessary _rtw_read16() and usb_read16() and embed their
code into the caller (i.e., rtw_read16()).

_rtw_read16() is a mere redefinition of rtw_read16() and it is unneeded.
usb_read16() was the only functions assigned to the (*_usb_read16) pointer,
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
index 4c43b6d00178..b5d1c8e52b22 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -34,20 +34,6 @@ jackson@realtek.com.tw
 #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
 #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
 
-u16 _rtw_read16(struct adapter *adapter, u32 addr)
-{
-	u16 r_val;
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
-
-	_read16 = pintfhdl->io_ops._read16;
-
-	r_val = _read16(pintfhdl, addr);
-
-	return r_val;
-}
-
 u32 _rtw_read32(struct adapter *adapter, u32 addr)
 {
 	u32 r_val;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 8389deeb1182..8b4fc014d93a 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -109,8 +109,10 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 	return data;
 }
 
-static u16 usb_read16(struct intf_hdl *pintfhdl, u32 addr)
+u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
+	struct io_priv *pio_priv = &adapter->iopriv;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u16 wvalue = (u16)(addr & 0x0000ffff);
 	__le32 data;
 
@@ -540,7 +542,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 {
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-	pops->_read16 = &usb_read16;
 	pops->_read32 = &usb_read32;
 	pops->_read_port = &usb_read_port;
 	pops->_write8 = &usb_write8;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 9dc32f7bcae8..527503d3ecc8 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -246,7 +246,7 @@ void _rtw_attrib_read(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_attrib_write(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 
 u8 rtw_read8(struct adapter *adapter, u32 addr);
-u16 _rtw_read16(struct adapter *adapter, u32 addr);
+u16 rtw_read16(struct adapter *adapter, u32 addr);
 u32 _rtw_read32(struct adapter *adapter, u32 addr);
 void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
@@ -267,7 +267,6 @@ u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt,
 			     u8 *pmem, int timeout_ms);
 void _rtw_write_port_cancel(struct adapter *adapter);
 
-#define rtw_read16(adapter, addr) _rtw_read16((adapter), (addr))
 #define rtw_read32(adapter, addr) _rtw_read32((adapter), (addr))
 #define rtw_read_port(adapter, addr, cnt, mem)				\
 	_rtw_read_port((adapter), (addr), (cnt), (mem))
-- 
2.33.0

