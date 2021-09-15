Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79653FD2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 12:44:44 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id c21so4244283edj.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=20wywgQEOo0egoQmBSEpanb7Vzi97onrpQZGv5F4kZg=;
        b=OKE9OcXa9GCgYZbsRBoHNdSURhOECrxAjId9RtbtreLfCJl5AFlhlYSFIpt6vOXEmU
         uWx7frNkquimr1ShZ1e/9uH594hJBM2pvQabSK52thMJvdCrXz43KNjOTSS6EJBqvCi9
         3xho2Wl7LrUkgEMB2XfrIjAPa8shwWLM2xOGVNamZywPrZqezLuYbDQvTY+VnWfeNxwL
         lnLrxc2WtJVva/n5QosPjwLtp4js5g2YIzq18K3zaqf0BAkVinVxxLidrEEwo9JAouOi
         c4ap7LMMR7tqKpZMCI4pqjT9DOxlTGHzpOt4fTv+iqQdU9hNDWm9sOYs3vBNSG/RJBoJ
         KvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=20wywgQEOo0egoQmBSEpanb7Vzi97onrpQZGv5F4kZg=;
        b=j5HAVxiomcbBbLcZPnXeMoa9UkPBk+6UtpM1INjs3JO7sh/qCYoWmhpbkmL8FR33Kg
         lQrUkPSU3PK+xM9noGVx/LvNeUPUzALpkWQXAzWGy33bQOAOKoZ5K9WTjFCSsPLp73oD
         mYAXkgPL7pAM9BRuMOqV4b7ytsymqADVsATQxel0QdFoO/dq7ixLLl/TcYtGEU69XAHk
         wlN6OD43RpPA3t5UnIyp+0LxFKSGxDra3QYZzguWiPMJMz78lKg/mteWPqy60rF/8Tdu
         jyEMlUnnaN3cizXDkHLTixMWYh7JJZ4g6UB+mPGgYFYptugzIybHa+3xEOe5ZUmUgOTD
         cR+w==
X-Gm-Message-State: AOAM53268MmZOihn1UmuvkSsTamwmMqoy5H/XcGmeoAb7jKqTj1izShG
	ldKXZfQozIpVqz6ATHgzlzobvBMz9lE=
X-Google-Smtp-Source: ABdhPJzxAfXz9A3jfa4XfCfKVZ8J6ie6+TTaDDonBrT3uvYBvnkyFiNWm3CD0U0VFxlln586JRpoCQ==
X-Received: by 2002:a05:6402:229c:: with SMTP id cw28mr22114784edb.356.1631709883282;
        Wed, 15 Sep 2021 05:44:43 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id s3sm6394002ejm.49.2021.09.15.05.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:44:42 -0700 (PDT)
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
Subject: [PATCH v5 14/19] staging: remove struct _io_ops
Date: Wed, 15 Sep 2021 14:41:44 +0200
Message-Id: <20210915124149.27543-15-fmdefrancesco@gmail.com>
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

Finally struct _io_ops is unused, so remove it.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
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

