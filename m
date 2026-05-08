Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E030F803
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269184; cv=none; b=paggOYG2MRw8D7RIoof7qkhCBTDGKT2Eip7F2MgVVVueiFnXvrccxAywUjoYGk9CnVOyXYsF8CtxO2f9KDLVKlVH0iSd0YDMYhFqhOneuH6UORulLsEFxKWX9EHRklPj1kWFVsGFW/2LpCrJ05KfBwoz8VdRI/x3LtZxZ6zC+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269184; c=relaxed/simple;
	bh=QbF1hnYbU/Uz5ztfKLDUvruAGjSllIOFcsC7IWM8Glc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yig9/v/km4dbrsAYCGED6n7/RBsZEaeSqWVc6gzSPp/lIrSgG2Tq34t1Rp3TVMKFvveNX9No+9K2my3ZsSEWdlSogjqwm0sParRun3Oi5kTZruEFjBBaNa8a132/nK8tBf4yBu3pusqMa83kSGtLXT4FG5V5N10WTeUKilTcF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5V0u80P; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5V0u80P"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8891febd2so2745224e87.1
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269181; x=1778873981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+DUgdN6jRIpiaS9QAEfcCtGqGP0QQIynzbvIhEhNyU=;
        b=i5V0u80PfSjTSyhLchFTK+x5K3mTyybvpTEAqQR3x062C2YzRmTIrnfedibUuOPDEf
         kPPnTmRl+OkT7cZw/JbX/qIaUd7bVsgCVYuyCNZLmIFHzg1Sjz4hRd+ZPuSCKKNe+33u
         bheWgE2+A/YQTMENZhtDq15HMCGQc/I1jjJB+OMzl26F1Z+IwcCJ6YKcBAufVQTzwiJg
         SzCzLZLMe1TXpZx0z0maaZUjTwjyPZhMp9JswtzVNkrldg0hQ2cJt0fSWps6LqNJuSWi
         Ihq24Ljy75DhowN+0VcgN/VX0SyzhMTCrSCWQfTBGs8V4EOJHPQy92Fg6OJVjlfHc3yk
         +q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269181; x=1778873981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1+DUgdN6jRIpiaS9QAEfcCtGqGP0QQIynzbvIhEhNyU=;
        b=r+jteEOBK9EHdqVc8Dx2RkjGA2MbNB22gN8RTXZBfbd2PTzlw7StCuoyChVGnMRrJ+
         EKykv5nWXszU9w0zwar9cxV5lW9NBS+nERhnR9AJq27bdnQ4m3MJoh6KQcUWp937CPj0
         v2IICwiI3f97Jmlvz/qPHQPN2S4XfbBBahTLJFUD5flQSvWcPHh8Y8reNZN6zeo4J9Ch
         Pc/clSsxN7gYwEGyGDajUURriUWNlI8AJnyZlK9lJixFvhnteDsVa52D1XO+k1GL238p
         nYXuOzZ4dHToFwSXKyasqrDL57JqwjThEAlH5Tej7FBD8pzVqw/mhaN42mLa7vS9g7tg
         z0YQ==
X-Gm-Message-State: AOJu0YxWs59Uu+++fsghdNh5OwS+jgJ+5r/VoH7cyOWeVXHp11Ozt9IU
	igYN8sAjvtqeDGPmsFY8sh/fbV7NYCPASvhBSipqyQT/DUyxxJWeoRgR
X-Gm-Gg: Acq92OHOjIXhuEfVkStG/c2aMotlTj5aY3sfZnKBt/vN/bbAo9NzBXnlMHTqXjcFUB9
	N4mGtJrKYS5PzpObKMWIIX+VyZl82yf1+HTuAhk3+Ujb17aNB5m61r49AGFSowIQ2iW8J3bCDa2
	GF1dDRlS4Ev5G2Ki+N3hLxp6t1q/aZs/1rHZE4A9nUQjvn1mIjEpXQGNYLoPXKs0qGXVpkSD4VV
	BpkTZ1LBWT+XIg4euzgoShGybGcBcCSEhXqr8G+eGlln00++40UbHhjxSvdWIBLPze/d66s3DgS
	kczucmnm6xkkOVTHUg364LRcLDvfwBdDh1A54GR8eq1+InKND1ZrXxrIFXQkxn+Vn2hTEyKGJDc
	ODdDC62/EkJUXTChoCCkKQVheMx/dX8GVQFeVjdtAkxvhh50lBUZBXyrFdbJm4hY/dOYkjk9Y1l
	G7JzBM+O1mXoAZe18O5vD09HptpJM/tAxMi9A=
X-Received: by 2002:a05:6512:33c9:b0:5a2:a13e:9082 with SMTP id 2adb3069b0e04-5a887ceb775mr4859594e87.35.1778269180607;
        Fri, 08 May 2026 12:39:40 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:40 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 06/11] staging: rtl8723bs: inline sd_write8() and sdio_write8() in rtw_write8()
Date: Fri,  8 May 2026 22:38:35 +0300
Message-ID: <20260508193909.16015-7-nikolayof23@gmail.com>
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

The rtw_write8() function calls sdio_write8(), which performs address
conversion and call sd_write8(), which calls sdio_writeb()

Remove this large number of indirect calls by combining the address
conversion and the sdio_writeb() call, which will make the code much
easier to understand.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

I left the RTW_STATUS_CODE() calls for the return value here so as not
to change the call site of this function (_SUCCESS/_FAIL are expected
there).

This function now returns an error when the condition:
	if (adapter->bSurpriseRemoved)
		return RTW_STATUS_CODE(-ENODEV);

Initially, sd_write8() didn't have this; it returned an uninitialized
variable.


 drivers/staging/rtl8723bs/core/rtw_io.c       | 24 ++++++++++++------
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 12 ---------
 drivers/staging/rtl8723bs/include/rtw_io.h    |  1 -
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 25 -------------------
 4 files changed, 17 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 04b07b281186..1a7988a376ec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -104,16 +104,26 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-	int ret;
+	struct sdio_data *sdio = &adapter->dvobj->intf_data;
+	struct sdio_func *func;
+	bool claim_needed;
+	u32 ftaddr;
+	s32 err;
 
-	_write8 = pintfhdl->io_ops._write8;
+	if (adapter->bSurpriseRemoved)
+		return RTW_STATUS_CODE(-ENODEV);
 
-	ret = _write8(pintfhdl, addr, val);
+	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
+	func = sdio->func;
+	claim_needed = rtw_sdio_claim_host_needed(func);
 
-	return RTW_STATUS_CODE(ret);
+	if (claim_needed)
+		sdio_claim_host(func);
+	sdio_writeb(func, val, addr, &err);
+	if (claim_needed)
+		sdio_release_host(func);
+
+	return RTW_STATUS_CODE(err);
 }
 
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 32ea7dd07711..672b577016ac 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -124,17 +124,6 @@ u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
 	return ftaddr;
 }
 
-static s32 sdio_write8(struct intf_hdl *intfhdl, u32 addr, u8 val)
-{
-	u32 ftaddr;
-	s32 err;
-
-	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
-	sd_write8(intfhdl, ftaddr, val, &err);
-
-	return err;
-}
-
 static s32 sdio_write16(struct intf_hdl *intfhdl, u32 addr, u16 val)
 {
 	u32 ftaddr;
@@ -281,7 +270,6 @@ static u32 sdio_write_port(
 
 void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 {
-	ops->_write8 = &sdio_write8;
 	ops->_write16 = &sdio_write16;
 	ops->_write32 = &sdio_write32;
 	ops->_write_port = &sdio_write_port;
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index bf7e26fa7bed..363c91b213f6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -11,7 +11,6 @@
 struct intf_hdl;
 
 struct _io_ops {
-		int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
 		int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 		int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 33d0d87051fa..2d6bcdb13492 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -205,31 +205,6 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	return  v;
 }
 
-void sd_write8(struct intf_hdl *pintfhdl, u32 addr, u8 v, s32 *err)
-{
-	struct adapter *padapter;
-	struct dvobj_priv *psdiodev;
-	struct sdio_data *psdio;
-	struct sdio_func *func;
-	bool claim_needed;
-
-	padapter = pintfhdl->padapter;
-	psdiodev = pintfhdl->pintf_dev;
-	psdio = &psdiodev->intf_data;
-
-	if (padapter->bSurpriseRemoved)
-		return;
-
-	func = psdio->func;
-	claim_needed = rtw_sdio_claim_host_needed(func);
-
-	if (claim_needed)
-		sdio_claim_host(func);
-	sdio_writeb(func, v, addr, err);
-	if (claim_needed)
-		sdio_release_host(func);
-}
-
 void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 {
 	struct adapter *padapter;
-- 
2.54.0

