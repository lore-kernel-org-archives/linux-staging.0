Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98063FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:44:02 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id b10so5787566ejg.11
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lrOb1WvonI/5W8DvRhrpAXx8lPRifSOpe2+CoRGYEhw=;
        b=WjJQe4WI+XBy8gXfYEfeyjGMVM8n8oeIylvqi7tX11WB3iL7y+D0YdUFSgqhoXby3j
         lEYnQz7hSI/IjPxOOz2ksxBq+5YPZlor/RMm/qiefN8CzrvbDwm0tbIq6tQKX5A3MuDT
         w8a4/S1549DCKgGWV3Pb8exlZ207dYIcSXJH4fR0iMHJ3LcOC3e4/y+yFBuFwBTHX+91
         ODoafkXAgKKsbugkO/suHBHMi5y+3v3LTZ/oouhIFhkDz2ehnlortUabEnCQ+L7DoH1s
         +dZv1kXh4Wi2Cn+kTh8XiPsCVXJc6CIG1p1v5YSj9HZRtQkSEyGdTpfFcJy00bnISBTh
         VIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lrOb1WvonI/5W8DvRhrpAXx8lPRifSOpe2+CoRGYEhw=;
        b=sKPwx/78bv4lglKjHHVgmmV5xnMh6jzeCn6UJrhWufxjvkEKi5izjdu/3BssbJTjoI
         yQui8qu1HBHlhU3wnDDamXkwamVhh9jN4LnAaShIoRL8a//ijfTEQw7uHdghrClWhFTA
         I2sDK9NyIF3Z6V4WG/BD3rY0XxrHw/V7PhXBp8PCbFAcSpkyIERyPfaQX/vhVttHe1pt
         bWitNCA5Rvr5vax6Ru1ihkyN4VpPciLvEK8oahEGOExRRxK/MaKpQQAXPLDa5k/NcZcW
         tK+BZ6xO/9ZEptQ7ML8C2VdaifcenaJVok7RB53t8Wk61TX6HkjELthlkPnh8frX8QiM
         5jKg==
X-Gm-Message-State: AOAM530+otg549e60l4Q6ys04F+4zATdL2ccCIBW0EYsyoKH/edFaPQe
	wOGNCOjCjKgXt7sc9JbC5O8=
X-Google-Smtp-Source: ABdhPJxnNVfGAmi6hw+GpIMNDrlFxYRjHIOc4WB1fZtBgZlFH4YYGgLG1Ri0cxLktMEEqK4QAoYUzw==
X-Received: by 2002:a17:906:f906:: with SMTP id lc6mr15419558ejb.487.1631709841121;
        Wed, 15 Sep 2021 05:44:01 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:44:00 -0700 (PDT)
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
Subject: [PATCH v5 11/19] staging: r8188eu: remove the helpers of usb_read_port_cancel()
Date: Wed, 15 Sep 2021 14:41:41 +0200
Message-Id: <20210915124149.27543-12-fmdefrancesco@gmail.com>
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

Remove the unnecessary _rtw_read_port_cancel() and usb_read_port_cancel()
and embed their code into the caller (i.e., rtw_read_port_cancel()).

_rtw_read_port_cancel() is a mere redefinition of rtw_read_port_cancel()
and it is unneeded. usb_read_port_cancel() was the only functions assigned
to the (*_usb_read_port_cancel) pointer, so we can simply remove it and
make a direct call.

This patch is in preparation for the _io_ops structure removal.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c           | 11 -----------
 drivers/staging/r8188eu/hal/usb_ops_linux.c     |  1 -
 drivers/staging/r8188eu/include/rtw_io.h        |  3 +--
 drivers/staging/r8188eu/include/usb_ops_linux.h |  2 --
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c  |  6 ++----
 5 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index 3a5e9dbfcb12..a57742057a65 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -75,17 +75,6 @@ int _rtw_write32_async(struct adapter *adapter, u32 addr, u32 val)
 	return RTW_STATUS_CODE(ret);
 }
 
-void _rtw_read_port_cancel(struct adapter *adapter)
-{
-	void (*_read_port_cancel)(struct intf_hdl *pintfhdl);
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-
-	_read_port_cancel = pintfhdl->io_ops._read_port_cancel;
-
-	if (_read_port_cancel)
-		_read_port_cancel(pintfhdl);
-}
 
 u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem, int timeout_ms)
 {
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 4fea21c0f7af..1865a26142bc 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -562,7 +562,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 {
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-	pops->_read_port_cancel = &usb_read_port_cancel;
 	pops->_write_port_cancel = &usb_write_port_cancel;
 
 }
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index f2b1978b6e80..56e17e2a7ee2 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -250,7 +250,7 @@ u16 rtw_read16(struct adapter *adapter, u32 addr);
 u32 rtw_read32(struct adapter *adapter, u32 addr);
 void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 u32 rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
-void _rtw_read_port_cancel(struct adapter *adapter);
+void rtw_read_port_cancel(struct adapter *adapter);
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val);
@@ -267,7 +267,6 @@ u32 _rtw_write_port_and_wait(struct adapter *adapter, u32 addr, u32 cnt,
 			     u8 *pmem, int timeout_ms);
 void _rtw_write_port_cancel(struct adapter *adapter);
 
-#define rtw_read_port_cancel(adapter) _rtw_read_port_cancel((adapter))
 
 #define rtw_write8_async(adapter, addr, val)				\
 	_rtw_write8_async((adapter), (addr), (val))
diff --git a/drivers/staging/r8188eu/include/usb_ops_linux.h b/drivers/staging/r8188eu/include/usb_ops_linux.h
index bdc596fe5854..186c6b7628dc 100644
--- a/drivers/staging/r8188eu/include/usb_ops_linux.h
+++ b/drivers/staging/r8188eu/include/usb_ops_linux.h
@@ -28,8 +28,6 @@
 
 unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr);
 
-void usb_read_port_cancel(struct intf_hdl *pintfhdl);
-
 void usb_write_port_cancel(struct intf_hdl *pintfhdl);
 
 #endif
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 36ef06f88fdd..a98ffdf92ed4 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -31,12 +31,10 @@ struct zero_bulkout_context {
 	void *padapter;
 };
 
-void usb_read_port_cancel(struct intf_hdl *pintfhdl)
+void rtw_read_port_cancel(struct adapter *padapter)
 {
 	int i;
-	struct recv_buf *precvbuf;
-	struct adapter	*padapter = pintfhdl->padapter;
-	precvbuf = (struct recv_buf *)padapter->recvpriv.precv_buf;
+	struct recv_buf *precvbuf = (struct recv_buf *)padapter->recvpriv.precv_buf;
 
 	DBG_88E("%s\n", __func__);
 
-- 
2.33.0

