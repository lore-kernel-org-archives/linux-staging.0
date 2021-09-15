Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86366D13
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 21:11:22 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id j13so8513154edv.13
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 14:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GN/Y9Rfapmu/4wKZZ2Bl/WRj145thqWrQnab4g+VR8M=;
        b=bKEQxJ/uh2RFG2JJL6CvkgL2TEk+ewsiXGZXTyN1BchETTcmtyvf2bsPZeG125XjxR
         gkE4DjLV8ksf36c9o3sOIiSmmNkD3ScNAjb+pb1ohUgb45fvYfa6uhiFJP8qv5VDFZjL
         Wohv68dkdTcG1s7LjtmmB5gHwdScDKDSBrn6hYEDBrEt9VNmtvo8ZraFPif9eVjcwxyi
         Qoh/Sb3WeZjPbmouBj7IyPPT2N+mweBLPNPOAlfrZ3Fq6CpHHP9k1Fdo4M0D1TBInqJt
         APpqVPOuJbmOdzs+zmaLAHGxSvbv3qqhOdLoAqSIRrrwgkMpm6GY/fLjAuMruWvnKYZv
         1ApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GN/Y9Rfapmu/4wKZZ2Bl/WRj145thqWrQnab4g+VR8M=;
        b=nJ8CuzgAaKfZjB55aM+FEBjKVG88TMzxjPoP/xPo/PgJFOXRTOqPcii6ZWX+CpNolp
         K2OASDYADPmy1sPVxzsMbWDxQmSr+2ADqScgUxvC/iWkn8DaVUIxQS7aYEDI9TZZIAw5
         fRFCw9GPGHaAstOOzteZ4lTIqyBp8BlD6nln/w8G6ApcsEXc6IAAyAeyZP4l2vCiYSsT
         KDSD+/YQIO6E0dhZxJ42Y/vG1RHopManR8fPvzOkgYFomUgKCXc26iQ1G78gOfdLI9PH
         CgczzrykmtXgIwAV1lhEtFG4d1YRrJtXNaLepoXIYtF/zmn3iKN6e+zRlLeOACcMt4Nz
         LMoQ==
X-Gm-Message-State: AOAM5323kVN5pS+SXOCwMOqXero+PU0ajz6WDGGPOLIamKywExRQI/ms
	7wkTTIgzo4W+IHvozJIkaY0=
X-Google-Smtp-Source: ABdhPJx7fJNFPw7cR0ltMhNKuTzJI6rbrLc1U5jmrV+TIdULstpm8EmnyZbd2JyrPEa0uFYFAMMu6A==
X-Received: by 2002:aa7:d582:: with SMTP id r2mr2307029edq.324.1631740281093;
        Wed, 15 Sep 2021 14:11:21 -0700 (PDT)
Received: from localhost.localdomain (host-95-235-105-169.retail.telecomitalia.it. [95.235.105.169])
        by smtp.gmail.com with ESMTPSA id t3sm511618edt.61.2021.09.15.14.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 14:11:20 -0700 (PDT)
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
Subject: [PATCH v6 03/19] staging: r8188eu: remove the helpers of rtw_read16()
Date: Wed, 15 Sep 2021 23:10:47 +0200
Message-Id: <20210915211103.18001-4-fmdefrancesco@gmail.com>
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

