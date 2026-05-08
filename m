Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCC13A86C
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269191; cv=none; b=gtHuTYFPrABrgLWNP+1Xo8Dn/yXzNavF5snN/rTF6sx+2yFEThg5CVOXoX45/ymzrD6c4aWBHVgn9zQhYCYtB4ZpqkPSft1DmT2uObjI3iibGiOfHGNIxPlK9OopRPSrT5JWTjGh8QF4gF3v6iq5ZAf0++DMKUs3KyIMy/ymEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269191; c=relaxed/simple;
	bh=S/mkYZjrHBxl+TCuj7S5LtyIOZvsyNuslLoawv34OYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P58ceNqMBxGfDCUk0zt4WVgB/kgLrHIpk45aNZ2dQ1cySrjKCLrkMTQADNv7UXmD1HinoIeuZXwooFC4vL973AAYPArnm6LfsObEej06H87AqJ8jowSGcOEJ83/5LLJ+Ybh8yjzjw7FfamRGNnfuNwBPsX2/1xQ53Ku6eOEJ4fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlpRDJEo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlpRDJEo"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a858881ad2so2392492e87.3
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269188; x=1778873988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaKtt37+Juonis3rjKs5Kt8DeukMELNEbsNso6cOyIU=;
        b=rlpRDJEoWCxVepP+8RQLKLkzCj0i50DkzH+r4Bk7EE2DcfcO87oqgPLAwMZM8qcAHc
         WVRRzJu/koMSpi/vjLSHWZLDkvGPYDNdhm6aY+V85yZhd76nfcKEaqcZMunTB3zlNlYy
         zGZtkeYYF4FeLSby6S8/OQWNA3VLB0UumxEbZ4DIbpn1L+QAzvv8eZQD/mzIpRfSTKtg
         FOwSssk17qkWQB1EB4tBpb8doQtBKcnrGk4UJAVVVD1Bicg+2x0rt155B/yJqC8XfuAm
         LvOy7XnylI/b9RsmVDPyO7m5GLLeKZT7lzB4z6eQkuQfFOGp5tkT/aeAkdeyQXLRqqeS
         2bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269188; x=1778873988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WaKtt37+Juonis3rjKs5Kt8DeukMELNEbsNso6cOyIU=;
        b=I68O4SVzRQGasQCVf+r8B6FuDRH4PUjgmnu4R2DIWxQyrz+s7ylHrUPhSWIMr9E6AF
         4SHJnAVY0jx/zr/ChACRpa9zb86LUh02Hn//fWI8c+nzGt6+p2T+5+OBoqJ7wKSFcWuB
         YGGjD0slzgOgoB0A+W2CB6VnQUmR+B1GFV8t36cO/kcu2So2rdCkwjrqqmA7Yr0zJa3A
         eNs+O2V25iz0l0ioErWNiJtKKaEecXclyrOQAE/GLE28WG8isC4YfNAmGDUpHWQs7uu6
         fqjnPfplOX59ilEXRvPEDLZlVHKfMGOYfPhjitFtF/vHgmMOsA5qyuL6chbRjsgfXHAD
         cNvQ==
X-Gm-Message-State: AOJu0YwAlUTECFWVunmYbAwEsRsIrvqaECkQ6lnIk+FTP8qoYhocHQ1o
	AIo82jFbq65J7aO4iDP80+Jgn1kXUSvS0OBksDxQovCKNDrmhwttlES+
X-Gm-Gg: Acq92OHAAg3N1cjMlNjqh+uK1oM+Cqb7AhF5R9WFlUf6ZYNY3VMf4NQg3bBTK40kxSN
	C4xlORodZT8zzi/r/IFv8v+g0LofsOrcEhu+wIzTIwI4h+Y316eJk2SqbZcTElLGzO13DLBitI6
	I1/q+YQBJuS6sF82Xdm+W3Vci6qyn7fZXhTPgpo/0/O4PlnA4DNIRnPhT62+Ro+DxqrZS5t1HqC
	rvnLHJhs0PkyeOM9SSo7bqUY4cCMIjBr+V7xxvCHQbBIK1mG/JlVem63JGESZXOg2xNgrnfgWo0
	y+KlKZCzwMyFSQKUK1uRFoopjPzsyxxJA4i937XMxKM1MobQg1OYUBqAtRUm6ZOmP9fAKfiSKO4
	I2GZKIwwlpXGJDhGQO4c5hqRD63vdN8Ftj2/rmh+yd360dRdNKevLFk+B/TQas27PYXn5odqqdy
	d13RWySeLIxu2N2i3c+mruKExRZECybZ+jPUs=
X-Received: by 2002:a05:6512:124b:b0:5a4:496:5bac with SMTP id 2adb3069b0e04-5a887ceb4d8mr6176408e87.36.1778269188025;
        Fri, 08 May 2026 12:39:48 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:47 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 09/11] staging: rtl8723bs: inline sdio_write_port() into rtw_write_port()
Date: Fri,  8 May 2026 22:38:38 +0300
Message-ID: <20260508193909.16015-10-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508193909.16015-1-nikolayof23@gmail.com>
References: <20260508193909.16015-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_write_port() is just a wrapper around sdio_write_port(). Combine
them to reduce the number of abstractions and simplify the code.

Update the function description to match the actual parameters.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c    | 41 ++++++++++++++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c   | 54 +---------------------
 drivers/staging/rtl8723bs/include/rtw_io.h |  1 -
 3 files changed, 37 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index f1f3ca46bd15..2f99e5e6e2ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -171,15 +171,46 @@ int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 	return RTW_STATUS_CODE(err);
 }
 
+/*
+ * Description:
+ * Write to TX FIFO
+ * Align write size block size,
+ * and make sure data could be written in one command.
+ *
+ * Parameters:
+ * @adapter: adapter
+ * @addr: port ID
+ * @cnt: size to write
+ * @pmem: pointer to struct xmit_buf
+ *
+ * Return:
+ * _SUCCESS(1)		Success
+ * _FAIL(0)		Fail
+ */
 u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 {
-	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
+	struct sdio_data *sdio = &adapter->dvobj->intf_data;
+	struct xmit_buf *xmitbuf = (struct xmit_buf *)pmem;
+	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
+	s32 err;
 
-	_write_port = pintfhdl->io_ops._write_port;
+	if (!adapter->hw_init_completed || !xmitbuf)
+		return _FAIL;
+
+	cnt = round_up(cnt, 4);
+	hal_sdio_get_cmd_addr_8723b(adapter, addr, cnt >> 2, &addr);
+
+	if (cnt > sdio->block_transfer_len)
+		cnt = _RND(cnt, sdio->block_transfer_len);
+
+	err = sd_write(intfhdl, addr, cnt, xmitbuf->pdata);
 
-	return _write_port(pintfhdl, addr, cnt, pmem);
+	rtw_sctx_done_err(&xmitbuf->sctx,
+			  err ? RTW_SCTX_DONE_WRITE_PORT_ERR : RTW_SCTX_DONE_SUCCESS);
+
+	if (err)
+		return _FAIL;
+	return _SUCCESS;
 }
 
 int rtw_init_io_priv(struct adapter *padapter,
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index a162815e24a4..3b90bab3b92f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -168,61 +168,9 @@ static u32 sdio_read_port(
 	return _SUCCESS;
 }
 
-/*
- * Description:
- *Write to TX FIFO
- *Align write size block size,
- *and make sure data could be written in one command.
- *
- * Parameters:
- *intfhdl	a pointer of intf_hdl
- *addr		port ID
- *cnt			size to write
- *wmem		data pointer to write
- *
- * Return:
- *_SUCCESS(1)		Success
- *_FAIL(0)		Fail
- */
-static u32 sdio_write_port(
-	struct intf_hdl *intfhdl,
-	u32 addr,
-	u32 cnt,
-	u8 *mem
-)
-{
-	struct adapter *adapter;
-	struct sdio_data *psdio;
-	s32 err;
-	struct xmit_buf *xmitbuf = (struct xmit_buf *)mem;
-
-	adapter = intfhdl->padapter;
-	psdio = &adapter_to_dvobj(adapter)->intf_data;
-
-	if (!adapter->hw_init_completed)
-		return _FAIL;
-
-	cnt = round_up(cnt, 4);
-	hal_sdio_get_cmd_addr_8723b(adapter, addr, cnt >> 2, &addr);
-
-	if (cnt > psdio->block_transfer_len)
-		cnt = _RND(cnt, psdio->block_transfer_len);
-
-	err = sd_write(intfhdl, addr, cnt, xmitbuf->pdata);
-
-	rtw_sctx_done_err(
-		&xmitbuf->sctx,
-		err ? RTW_SCTX_DONE_WRITE_PORT_ERR : RTW_SCTX_DONE_SUCCESS
-	);
-
-	if (err)
-		return _FAIL;
-	return _SUCCESS;
-}
-
 void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 {
-	ops->_write_port = &sdio_write_port;
+	return;
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index 9fc2f7413543..4e3504260bbc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -11,7 +11,6 @@
 struct intf_hdl;
 
 struct _io_ops {
-		u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 };
 
 struct	intf_hdl {
-- 
2.54.0

