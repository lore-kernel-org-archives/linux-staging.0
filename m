Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4AD2FAF
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 18:12:38 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 9so15661085edx.11
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ECq1ge6/bnVovuHw7hJS+s7iJ6k9k30Dw3V5gtmVFLc=;
        b=Vuv3MGcfwkWgWYz8QH6QPx7qM5Fn0m2HDUIkJC0DfJHbsubGU/GbF5Fainnpws0N4f
         8fD1WMAKaJ7c5NFcc18ZWog8QwbksfyHSqcWfEDT+w98hyWvZLXMKtYSj9vM7aFbEB9x
         IahbQC010Yhowo5onWFouTMZnNuO2mf4EukBKz7ce4Me2RQhd+C/r5XJQLyN/CHdcXLJ
         r8osOeIEfDLPx2/lhgyOBbWx7TtIMfUZsYiT4C+LcJTgaRVfrKx89ZILfKFU7+/rjoqf
         ScmhsBhp9FX6nGjOVAlLhglMWCeJ0uuu2is+jqDKq3vvmAF25VPc1ffhWwllrfG/q/7v
         Co7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ECq1ge6/bnVovuHw7hJS+s7iJ6k9k30Dw3V5gtmVFLc=;
        b=3sH6KfuZWcuEsZdonJL7S9uqZbxpBE8/pn2G/Ht3MHriuY4x3UPx5sUwUW2R5ycfxY
         v0niIXe3KwbZE3Nf3ZUE0R1O2P2Wio8KdoyFJhLIbSIrEKq8bCQeGhFPmP1DQ/rC4V0t
         uQRpC29eAvX8lHdzFUGmqDdSLi9CECxOifK5oVxyt6fzAMTU9IERl8OyuRCJvsxzjLXQ
         hVPQiUE0kNdM7jTtSZpTXa+jCqHTA7BMcbNk0pfjGOxSfmxKEoYlfLnx3JoAqD6WVcJN
         Rsc2RAlgkoFLNIzWA9b4tWG8WNpiZkQi3DauPIWuiaqnvMvRxBOvL9axKnOzHqquyo1U
         BsoA==
X-Gm-Message-State: AOAM530chMYdDnvtKKL53A+JgTLL/boy/59zAxCdaRf66FoX6kWML5bj
	jddhWNiWtMjWRhliO6FL7VU=
X-Google-Smtp-Source: ABdhPJzBh8T+FuTXAkJNuTnYfE3ylseMzg5NQHEvJevRpZD5ntPz+qtb2YB72UMDoaVxoF8BFXl36g==
X-Received: by 2002:a05:6402:4cf:: with SMTP id n15mr14242384edw.269.1631556756880;
        Mon, 13 Sep 2021 11:12:36 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id d25sm4258999edt.33.2021.09.13.11.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 11:12:36 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v4 14/18] staging: remove struct _io_ops
Date: Mon, 13 Sep 2021 20:09:58 +0200
Message-Id: <20210913181002.16651-15-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913181002.16651-1-fmdefrancesco@gmail.com>
References: <20210913181002.16651-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Skripkin <paskripkin@gmail.com>

Finally struct _io_ops is unused, so remove it.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

v3->v4:
        Split a patch into fourteen.
v2->v3:
        No changes.
v1->v2:
        No changes.

 drivers/staging/r8188eu/hal/usb_ops_linux.c |  6 -----
 drivers/staging/r8188eu/include/rtw_io.h    | 25 ---------------------
 drivers/staging/r8188eu/include/usb_ops.h   |  2 --
 3 files changed, 33 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 2516cfc464a9..117213c9f984 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -558,12 +558,6 @@ void rtl8188eu_xmit_tasklet(unsigned long priv)
 	}
 }
 
-void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
-{
-
-	memset((u8 *)pops, 0, sizeof(struct _io_ops));
-}
-
 void rtl8188eu_set_hw_type(struct adapter *adapt)
 {
 	adapt->chip_type = RTL8188E;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 2b9b64f1ac80..c6a078210eeb 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -84,30 +84,6 @@ struct intf_priv;
 struct intf_hdl;
 struct io_queue;
 
-struct _io_ops {
-	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
-	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
-	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
-	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
-	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-	int (*_writeN)(struct intf_hdl *pintfhdl, u32 addr, u32 length,
-		       u8 *pdata);
-	int (*_write8_async)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-	int (*_write16_async)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
-	int (*_write32_async)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-	void (*_read_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
-			  u8 *pmem);
-	void (*_write_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
-			   u8 *pmem);
-	u32 (*_read_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
-			  u8 *pmem);
-	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt,
-			   u8 *pmem);
-	void (*_read_port_cancel)(struct intf_hdl *pintfhdl);
-	void (*_write_port_cancel)(struct intf_hdl *pintfhdl);
-};
-
 struct io_req {
 	struct list_head list;
 	u32	addr;
@@ -125,7 +101,6 @@ struct io_req {
 struct	intf_hdl {
 	struct adapter *padapter;
 	struct dvobj_priv *pintf_dev;
-	struct _io_ops	io_ops;
 };
 
 struct reg_protocol_rd {
diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index c53cc54b6b87..1939b781b097 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -21,8 +21,6 @@
 
 void rtl8188eu_set_hw_type(struct adapter *padapter);
 #define hal_set_hw_type rtl8188eu_set_hw_type
-void rtl8188eu_set_intf_ops(struct _io_ops *pops);
-#define usb_set_intf_ops rtl8188eu_set_intf_ops
 
 /*
  * Increase and check if the continual_urb_error of this @param dvobjprivei
-- 
2.33.0

