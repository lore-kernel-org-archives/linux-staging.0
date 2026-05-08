Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5F813A86C
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269193; cv=none; b=MXuvW8yLAUtjjYEAtKQfhBfN1ouzOW5At7bv+fdwuUwHhBrd9G9I0i07Lr97I6fXaXces3lYNNhhjzCBZi557FCyfO/1GK7J1cVKTiueWuhBOuAQhV4MRWfPAOadKSlZzRJXPZXvvCq35y5vqPww4+gC05kgQqb7TtFdbtR3yfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269193; c=relaxed/simple;
	bh=mWUYUYQ2jmulW0mzMyxWdHnvWuwoH4PT1tIZLVTA3PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBwGcITlpPcP6dFB5OSJEeJJguc/yodvfYbytUB/Q5obycRitvg/Q3V6ByH/D/HXhuayBD2KF+0JNAXQOeE9IcnFvXufr4zNrXB5aItpr7C41c/Oc8Q/kvqACm7n9LtkcdIAxIxIn+FoB0lNC2meMoNHAcx8RNjtW5UFoAz0nnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlBZA6ac; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlBZA6ac"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so2417874e87.3
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269190; x=1778873990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66bfEEEwYY7HZpIVEQ2PZjY0rmULZjIobNf/KjWtTV8=;
        b=FlBZA6acXsMNLjnbvIT6XBsT4EQEvOOD7wJrngNGCfj0iULmymxCI4rbnyNsaym25d
         Kq/R5sHLbQvPWV+I1tx/H/GJxDj3b84DYOXWEHBlDVk/U1CC444QGY8XVZ6er7AsCeNa
         i8qWWcH5m5B7PoQCOh4SuCRStbgDjcNTG9R6I1SfCEHzvx0ZRr97rnwtPXqefEea4eEu
         UruACpHDlbdQ5EJ3C79mv6WQn3H/L8mMKcSBA78xxZMaA7oU346GGg5ptL0R7idZ6V5S
         3LveQAmXDR3r7bUSB0hkOuucxOFAYIz8JvzgzY9g9mBWpyiMbJvrhwuuGH/c8elP6IHq
         5VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269190; x=1778873990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=66bfEEEwYY7HZpIVEQ2PZjY0rmULZjIobNf/KjWtTV8=;
        b=skutVLmLEWG4QEErrkrysnbCLNHhByoXQYp79h0yaHtT0EFtr+YU/fJQ5e/GLR/j6Q
         a79MoCOQADJeQ/ItMjkRnOzDZ2rwUrkzJpWQCi8A+YUSe6Wq53T4vLBEJ6/rNxhJNbUj
         tyqd+imHI9jwmsqn0BTl2CNt+IeI2uV3Nbejcr/PAMOaF9gIXie3Zxnf8ri1cxJE26XH
         nsSMfQvW6ILu09Gi3LVnpTEu+eeD81PkY49T9JPZJGK8WGmgPF0XrpsUhx0yQR7EI4hq
         1YC5449riRyfI9ii6jHX9FEJvOPUrOVeG+EA/zNe+P+yFgfjKsfWXEb1isM5NlTa7UX+
         Wd2g==
X-Gm-Message-State: AOJu0YxhIuSVTgP2UIRb97zBVjOL3OochuZGx24Ybj3K7FlqaPVsvEm0
	GFmtgMtmgtKf9jICahGRhwmAB/0DnIK7tcxjhzIN+LK6MXwpp6UlEOPapPkj0MwM
X-Gm-Gg: Acq92OGllHs9EOTQZ0sSx3A7iGog33NNw5pk2Sfq0butG5ZcFW6GpCDqEaFaFO2hjAK
	RpG9Kji/oIZQcyhy0VTStcO9qVEliNlbqKSpZEAMGfQJnPW2nVHHICpfJPd/4oi2DlOHIt7BEVQ
	EgQKtAVI/l87Oz49Si4d6LflV/DfxuhfavlgTD2SezfcIRo3198A/UcLPV6ZLpSDC5y0+c7a7Zo
	/a7z2wShivGfLlbleL2VumJ0DJn4HRf8z+fLzuuc5XkTBvgkgHpnFHnRbZPK98qTqsndVblKJrL
	vrjEc1BQ6IOW4M043GyvIqWlTASrI2aXh9Hj+Q+f1NHv7oa1tK9oAZr/0IBADJAO1pz0Lqxz1M6
	Feo5mXspoLOhNfeqcV0U2s3T+S3mch0gmD5BlihFiL401WcQvgP3QEGneXgfkb9wd59pPMLzz5T
	49Kdt/ml+87EeuPvDqaqgVFtt0BmCWYWEPOh8=
X-Received: by 2002:a05:6512:124e:b0:5a8:8b42:4ea0 with SMTP id 2adb3069b0e04-5a88b425085mr6038057e87.18.1778269190118;
        Fri, 08 May 2026 12:39:50 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:49 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 10/11] staging: rtl8723bs: remove the empty function set_intf_ops()
Date: Fri,  8 May 2026 22:38:39 +0300
Message-ID: <20260508193909.16015-11-nikolayof23@gmail.com>
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

The body of this function was removed earlier, so remove it to get rid
of dead code.

This also updates the rtw_init_io_priv() function, as it receives a
pointer to set_intf_ops(), which is no longer neede.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c      | 9 +--------
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 5 -----
 drivers/staging/rtl8723bs/include/rtw_io.h   | 2 +-
 drivers/staging/rtl8723bs/include/sdio_ops.h | 2 --
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 5 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 2f99e5e6e2ac..63653f6230e5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -213,22 +213,15 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 	return _SUCCESS;
 }
 
-int rtw_init_io_priv(struct adapter *padapter,
-		     void (*set_intf_ops)(struct adapter *padapter,
-					  struct _io_ops *pops))
+int rtw_init_io_priv(struct adapter *padapter)
 {
 	struct io_priv *piopriv = &padapter->iopriv;
 	struct intf_hdl *pintf = &piopriv->intf;
 
-	if (!set_intf_ops)
-		return _FAIL;
-
 	piopriv->padapter = padapter;
 	pintf->padapter = padapter;
 	pintf->pintf_dev = adapter_to_dvobj(padapter);
 
-	set_intf_ops(padapter, &pintf->io_ops);
-
 	return _SUCCESS;
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 3b90bab3b92f..8cd8e42c85e4 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -168,11 +168,6 @@ static u32 sdio_read_port(
 	return _SUCCESS;
 }
 
-void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
-{
-	return;
-}
-
 /*
  * Todo: align address to 4 bytes.
  */
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index 4e3504260bbc..f86ad3fa46cc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -44,6 +44,6 @@ extern int rtw_write32(struct adapter *adapter, u32 addr, u32 val);
 
 extern u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops));
+int rtw_init_io_priv(struct adapter *padapter);
 
 #endif	/* _RTL8711_IO_H_ */
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index 0be763631873..e084df499457 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -10,8 +10,6 @@
 
 #include <sdio_ops_linux.h>
 
-extern void sdio_set_intf_ops(struct adapter *padapter, struct _io_ops *pops);
-
 /* extern void sdio_func1cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *rmem); */
 /* extern void sdio_func1cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem); */
 extern u8 SdioLocalCmd52Read1Byte(struct adapter *padapter, u32 addr);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c43a0391a5ca..c0bd991321a7 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -258,7 +258,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	padapter->intf_alloc_irq = &sdio_alloc_irq;
 	padapter->intf_free_irq = &sdio_free_irq;
 
-	if (rtw_init_io_priv(padapter, sdio_set_intf_ops) == _FAIL)
+	if (rtw_init_io_priv(padapter) == _FAIL)
 		goto free_hal_data;
 
 	rtl8723b_read_chip_version(padapter);
-- 
2.54.0

