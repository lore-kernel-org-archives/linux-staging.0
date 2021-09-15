Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D36D17
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 21:11:30 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id q3so8572797edt.5
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xQMl3MvaJGgLQQ5vv0xf9PyNyfOYahHGlNfnKNBtwwM=;
        b=KzvIOxsTmPg9zc/A2Lt5EUhbFXnwMg4yBVnKYVav0mnzp08+2xR6TpfHEWZiTX590r
         9f/YveGGByJKIrD26LlGsXzP7mx/kfGrHaDj54p0R8i/k1yfu9QtAvccRI3lECJjnEeS
         SK50hAedJ01/rmTe+eUQ0QxXV+M+eOyPdIauAA6DzzePi3PcdWokwozRvOrGo71rgM5V
         cLqWAmF9qzXzM8Xyq6ciesGj9ccLlmf1WOqUMqyA4po/PaqLh3r1zt8521p95qnTzbkn
         bJ3qEZ4elV5eCoXoO71F21KKIUsWDWZmKAQAG0XWTNjFjflnet9TigQjUfGRDg1aXVrI
         Vsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xQMl3MvaJGgLQQ5vv0xf9PyNyfOYahHGlNfnKNBtwwM=;
        b=s5ygR1ewzRi3qSHCrYRXfmj1aW0Z+ufOiy5P1HiOFsMzcLiR4ReDhAximdYfAfwhL0
         9BvZvsyeSoWR+WsYRNoDcgOYJD39HhN0E85YldSyUway85JTecicNMeG5FcKn+QhHcVd
         9AfPnZLjvgJUnCvLeOnZg5oby2XY4xMtFSUIiinjsNtEAEDRhqIRpflIPEvThfnmonPN
         NH01WXzmFNTjwm/i57cqJ1by9922QU7ftZQ91CSmc/USEmpeZ3V7kuCfs8eA7e4sKjUn
         Ebv2NN3AdAsjSkhS/PQZ5nDCs+glD90wcSTidFjgUX3sTNO9b85MfbMD/p2rbTsx1S6F
         uRPA==
X-Gm-Message-State: AOAM532JLe6fXcClsR/dZAmQ7gDKwTw06NFfMT70G0f4flJO0+Z05whe
	ylNVuG4SGMVnWsWMPN0LlRY=
X-Google-Smtp-Source: ABdhPJwZXvEzo3ecmGJiKrYldGQW4y1VpohA+iRp3XqT/LZNlIkhM88wp2DDVx6f/1Nymq5jMtGZcg==
X-Received: by 2002:a50:cb8b:: with SMTP id k11mr2274616edi.256.1631740289105;
        Wed, 15 Sep 2021 14:11:29 -0700 (PDT)
Received: from localhost.localdomain (host-95-235-105-169.retail.telecomitalia.it. [95.235.105.169])
        by smtp.gmail.com with ESMTPSA id t3sm511618edt.61.2021.09.15.14.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 14:11:28 -0700 (PDT)
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
Subject: [PATCH v6 09/19] staging: r8188eu: remove the helpers of usb_read_port()
Date: Wed, 15 Sep 2021 23:10:53 +0200
Message-Id: <20210915211103.18001-10-fmdefrancesco@gmail.com>
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

Remove the unnecessary _rtw_read_port() and usb_read_port() and embed their
code into the caller (i.e., rtw_read_port()).

_rtw_read_port() is a mere redefinition of rtw_read_port() and it is
unneeded. usb_read_port() was the only functions assigned to the
(*_usb_read_port) pointer, so we can simply remove it and make a direct
call.

This patch is in preparation for the _io_ops structure removal.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c       | 18 ------------------
 drivers/staging/r8188eu/hal/usb_halinit.c   |  6 +-----
 drivers/staging/r8188eu/hal/usb_ops_linux.c |  4 +---
 drivers/staging/r8188eu/include/rtw_io.h    |  4 +---
 4 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index b2e41fa48d81..ac72f894da75 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -75,24 +75,6 @@ int _rtw_write32_async(struct adapter *adapter, u32 addr, u32 val)
 	return RTW_STATUS_CODE(ret);
 }
 
-void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
-{
-	u32 (*_read_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-
-
-
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
-	     return;
-
-	_read_port = pintfhdl->io_ops._read_port;
-
-	_read_port(pintfhdl, addr, cnt, pmem);
-
-
-}
-
 void _rtw_read_port_cancel(struct adapter *adapter)
 {
 	void (*_read_port_cancel)(struct intf_hdl *pintfhdl);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index dfaa0195dbc3..5133d533674f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1033,11 +1033,7 @@ static unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
 	u8 i;
 	struct recv_buf *precvbuf;
 	uint	status;
-	struct intf_hdl *pintfhdl = &Adapter->iopriv.intf;
 	struct recv_priv *precvpriv = &Adapter->recvpriv;
-	u32 (*_read_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
-
-	_read_port = pintfhdl->io_ops._read_port;
 
 	status = _SUCCESS;
 
@@ -1046,7 +1042,7 @@ static unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
 	/* issue Rx irp to receive data */
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		if (!_read_port(pintfhdl, precvpriv->ff_hwaddr, 0, (unsigned char *)precvbuf)) {
+		if (!rtw_read_port(Adapter, precvpriv->ff_hwaddr, 0, (unsigned char *)precvbuf)) {
 			status = _FAIL;
 			goto exit;
 		}
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 90fb46c75159..a104e3fac7d1 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -456,11 +456,10 @@ static void usb_read_port_complete(struct urb *purb, struct pt_regs *regs)
 	}
 }
 
-static u32 usb_read_port(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *rmem)
+u32 rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *rmem)
 {
 	struct urb *purb = NULL;
 	struct recv_buf	*precvbuf = (struct recv_buf *)rmem;
-	struct adapter		*adapter = pintfhdl->padapter;
 	struct dvobj_priv	*pdvobj = adapter_to_dvobj(adapter);
 	struct recv_priv	*precvpriv = &adapter->recvpriv;
 	struct usb_device	*pusbd = pdvobj->pusbdev;
@@ -563,7 +562,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 {
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-	pops->_read_port = &usb_read_port;
 	pops->_write_port = &usb_write_port;
 	pops->_read_port_cancel = &usb_read_port_cancel;
 	pops->_write_port_cancel = &usb_write_port_cancel;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 1123017cac65..600c6e7a375b 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -249,7 +249,7 @@ u8 rtw_read8(struct adapter *adapter, u32 addr);
 u16 rtw_read16(struct adapter *adapter, u32 addr);
 u32 rtw_read32(struct adapter *adapter, u32 addr);
 void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
-void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
+u32 rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_read_port_cancel(struct adapter *adapter);
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
@@ -267,8 +267,6 @@ u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt,
 			     u8 *pmem, int timeout_ms);
 void _rtw_write_port_cancel(struct adapter *adapter);
 
-#define rtw_read_port(adapter, addr, cnt, mem)				\
-	_rtw_read_port((adapter), (addr), (cnt), (mem))
 #define rtw_read_port_cancel(adapter) _rtw_read_port_cancel((adapter))
 
 #define rtw_write8_async(adapter, addr, val)				\
-- 
2.33.0

