Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB775809
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771682186; cv=pass; b=ED0oWOkJaY7txjc+BAD0gSR989TAOBLvdufdmiBemVW++aw4W4IfFv/nfyUrDc9+nNKDZ93uC0uIGEIuKxHvxZiX7Oj9IdTRztspXsRefeApKkKFZ/V1gGOPG61SC3t8ca2q9+ysmTj6WBq+H1XujHMYwg8M6hwmGS/MThSB05U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771682186; c=relaxed/simple;
	bh=YItOr1vE8u9Y48dHND1D4J+EDE9L8yIAk0f6MsCnPIM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IziNjBm/cQixGpjijTg9lLVz9bA6BDZ4HEAFoEoSFSp8U1ZNZPoe5zYvNN9bVSRN9rnf3UJSV32Gp1LEDBKwxHOmTDMEF/gEwC7LjNjKmzjv8lOeyR5yUmoO7vmUioPWODhHhi5xclpU1OQwkYF5HkaORqJI08vpmeMvUXOJqcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su7s5NBy; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su7s5NBy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aaed195901so14388285ad.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 05:56:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771682185; cv=none;
        d=google.com; s=arc-20240605;
        b=N0mrOlQekTqrKKL961dsnyE6KBHqkVn7yT9yc4G+wFtdxzL1zxp2fieXLkr0bP5fW0
         iM3ezcQkAdDE1BUkOXqWpuX+7KLnTAS057+5zPCNM9kpSp8xvsQWs5CKQLtFb5wjjUrb
         4GD4kXo40JB73MOoJV/2cKlMFnHkCWqu+X2/L3nhg32EffzlnGHXb1gyzWfwnSILz4yD
         5H8QnYv48ZLntv7N9FCFMN4PQpRybqvoJxmoE/um9LWUCL3lY3VVjBAG5ar+KMdvwgbN
         bfKCYjJVbJv8yCgJuFB9rICHe4Tp4kjQNcvG/U8AYtl5cqwONRuKdvKSM27ZtSTSgQ0G
         rZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=48EVcoxajP9uja+w8cshH5BCBWvcVabhjhgRsLB/1yY=;
        fh=P2jNJzVLvskJMmK6QJLOnzsGV4I5NO2hOoBjsKWYYhA=;
        b=VOaq1BDdS+8Hxg9PBLgs+DtvLRPuBJnojPwRQaGCsxyMAwn4qxvkmW2SJN4pBo4cHQ
         3jnPE7MS1EGKbwEZGsbNddPK48hP3TEoR7d2QnrADwr/99MMR0c4BqFH9K83ZphEV7I1
         1pVPQghSS4FZO3tdS+5+Y7Qlrhi3aIWQx6dlXAsnu8s7Gq0oH8zzMt9ViBZa1N9h/UU8
         9J/XeZEXS3EgLA/KdCgIYkJHpOufdIEbYeolfQcDe5AITrCJg63sk5WHJpwqicuPKP/u
         1oxi9XPK9Ej9SvL9dzuvZB1glr4Pmk1cDw69NTkxWrBQHbzN2lkw8HUGtTWtEe1Qk+wE
         ZvCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771682185; x=1772286985; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=48EVcoxajP9uja+w8cshH5BCBWvcVabhjhgRsLB/1yY=;
        b=Su7s5NByq3uCUmACOIt4RjPW1tj71G3DWNsnc/78FOBgTSzL5nVzdjt1TzCsmFiR6v
         Yfh18FYzCaF3os+Dw6/9ZZj01fUG+B4FbfgbyHyiAznAzfmDLe29KBgXm0aORWKK6t9t
         NNUNBiK+shoz4g6LTcvrr9EF3i3ekxCr5Bz6dihFPC9hAYf0oZbMTh8AJO9NbzuJLV+t
         7LEjeV/fAxP2q3SQCQf/5AjcNI14C6yRBf5ZHKzDSbVKdSABvFAR/K0RlI0+nXN5m0DT
         rl2FXyCK3UB0CXWVMQRjuM+0lVaQIcKbKzPzlfeAnTEwJusJ0r+OSj/LYHz6sWU8rBC5
         SYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771682185; x=1772286985;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48EVcoxajP9uja+w8cshH5BCBWvcVabhjhgRsLB/1yY=;
        b=fLZBTO7asnUINeYhRAXZ1klVFUCKlXmsAheiFlEm5k1w+at9TdrFhRqTe+4PPOnXr9
         /5JVXPgov0uYw39Z2chqAlUur29SzEyDXwxZzywuWuka2QVQ3sKdDrRyNqxBWFdqhiNs
         MvN7Q19laLFyHvGVyKdH1SxY4j6xUHFQlthem1MTbqMOOXus1/qKSwuupBaocHvwKgXL
         vRUL9t8UfNp9fKcLD67YEng2FEVaa9cNrpoQ+gzctZ9t5mvBg6DCysY9n4dWJy5xmDUv
         Xm4ra88y45vWoZktdXyHFdKcnUPVDFJd1H2R/M7ZjUSghIvpsuB3R02AjEITI2NZ+Xy9
         wWHg==
X-Gm-Message-State: AOJu0Yyod3e2/M7Rb/dLe/rwZE4irQSoQAlz7iLdn2CtwCKdvwUMpKhE
	jBL81PlPXb0L9Q4uX6mNE9XJ/5ZiaaAXaGcKtSsEmqArspohWkukhw+TcHg3gXON+8WfMvVShOE
	0nOVTegdF4AsQHoVuVNb5Qg4gJE7HIe8=
X-Gm-Gg: AZuq6aL+jYHndcC9dK/i/4fFX3KfrrAtvNY7FWLlgQ7hfirOnqFoqDTJbmBt0HGHxgC
	C3PkMo/g+EQ+PnLqZMY76TeqzhN+DdoqhC/dbRZPc8lB290WLRkQlR9oBrK2bydXTAGh/h0Qg9v
	+u5NmjoTRS6JIboD9x7929IVGkklDTVzTlboMKqnDyJ3RbVKyQkBLVa9bzKywgK/K4s8dEJUK47
	scNKiUw2ABo7n9Lu2u5BgKdtdnBuof5eLcWuQFK8spB4D9IT+zpjwf9ptgVjqfXRA2dX3a0DtGC
	mfal4bcPVKsJN1nGbUAmNMgaSro93aQgsM19y98I+iBHwTH6gZhOUBWc
X-Received: by 2002:a17:903:4b30:b0:2aa:e6fa:2f74 with SMTP id
 d9443c01a7336-2ad74419fa3mr25800655ad.2.1771682184653; Sat, 21 Feb 2026
 05:56:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Wojciech <wojciech.develop@gmail.com>
Date: Sat, 21 Feb 2026 14:56:13 +0100
X-Gm-Features: AaiRm504GZjJl6tFoZ6tHrO4hbzCYdgyCH_cz2tpuWHGa9eEC92j7O4aJEqmdF0
Message-ID: <CALGt97_zniC2O12ge7-5tHTXQL+4PGgw8fwdx4jMTb-AEYQeLA@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: cleanup rtw_io.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, ethantidmore06@gmail.com, arthur.stupa@gmail.com, 
	horstaufmental@gmail.com, kaizhetan@yahoo.com
Content-Type: text/plain; charset="UTF-8"

Replace tabs with a space in return statements and declarations.
Remove dead code and redundant vendor comments.
No functional changes.

Signed-off-by: Wojciech S. <wojciech.develop@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 49 ++++---------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c
b/drivers/staging/rtl8723bs/core/rtw_io.c
index 965c3cfea103..4b36a39946f1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -1,35 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-/*
- * The purpose of rtw_io.c
- *
- * a. provides the API
- *
- * b. provides the protocol engine
- *
- * c. provides the software interface between caller and the hardware interface
- *
- *
- * Compiler Flag Option:
- *
- * 1. CONFIG_SDIO_HCI:
- *  a. USE_SYNC_IRP:  Only sync operations are provided.
- *  b. USE_ASYNC_IRP:Both sync/async operations are provided.
- *
- *  jackson@realtek.com.tw
- */

 #include <drv_types.h>

 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
- /* struct io_queue *pio_queue = (struct io_queue *)adapter->pio_queue; */
  struct io_priv *pio_priv = &adapter->iopriv;
- struct intf_hdl *pintfhdl = &pio_priv->intf;
+ struct intf_hdl *pintfhdl = &pio_priv->intf;
  u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);

  _read8 = pintfhdl->io_ops._read8;
@@ -39,9 +15,8 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)

 u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
- /* struct io_queue *pio_queue = (struct io_queue *)adapter->pio_queue; */
  struct io_priv *pio_priv = &adapter->iopriv;
- struct intf_hdl *pintfhdl = &pio_priv->intf;
+ struct intf_hdl *pintfhdl = &pio_priv->intf;
  u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);

  _read16 = pintfhdl->io_ops._read16;
@@ -51,9 +26,8 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)

 u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
- /* struct io_queue *pio_queue = (struct io_queue *)adapter->pio_queue; */
  struct io_priv *pio_priv = &adapter->iopriv;
- struct intf_hdl *pintfhdl = &pio_priv->intf;
+ struct intf_hdl *pintfhdl = &pio_priv->intf;
  u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);

  _read32 = pintfhdl->io_ops._read32;
@@ -63,9 +37,8 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)

 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
- /* struct io_queue *pio_queue = (struct io_queue *)adapter->pio_queue; */
  struct io_priv *pio_priv = &adapter->iopriv;
- struct intf_hdl *pintfhdl = &pio_priv->intf;
+ struct intf_hdl *pintfhdl = &pio_priv->intf;
  int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
  int ret;

@@ -77,9 +50,8 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 }
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
- /* struct io_queue *pio_queue = (struct io_queue *)adapter->pio_queue; */
  struct io_priv *pio_priv = &adapter->iopriv;
- struct intf_hdl *pintfhdl = &pio_priv->intf;
+ struct intf_hdl *pintfhdl = &pio_priv->intf;
  int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
  int ret;

@@ -90,9 +62,8 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 }
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
- /* struct io_queue *pio_queue = (struct io_queue *)adapter->pio_queue; */
  struct io_priv *pio_priv = &adapter->iopriv;
- struct intf_hdl *pintfhdl = &pio_priv->intf;
+ struct intf_hdl *pintfhdl = &pio_priv->intf;
  int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
  int ret;

@@ -107,7 +78,7 @@ u32 rtw_write_port(struct adapter *adapter, u32
addr, u32 cnt, u8 *pmem)
 {
  u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
  struct io_priv *pio_priv = &adapter->iopriv;
- struct intf_hdl *pintfhdl = &pio_priv->intf;
+ struct intf_hdl *pintfhdl = &pio_priv->intf;

  _write_port = pintfhdl->io_ops._write_port;

@@ -131,11 +102,6 @@ int rtw_init_io_priv(struct adapter *padapter,
void (*set_intf_ops)(struct adapt
  return _SUCCESS;
 }

-/*
- * Increase and check if the continual_io_error of this @param
dvobjprive is larger than MAX_CONTINUAL_IO_ERR
- * @return true:
- * @return false:
- */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
  int error_count = atomic_inc_return(&dvobj->continual_io_error);
@@ -146,7 +112,6 @@ int rtw_inc_and_chk_continual_io_error(struct
dvobj_priv *dvobj)
  return false;
 }

-/* Set the continual_io_error of this @param dvobjprive to 0 */
 void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
 {
  atomic_set(&dvobj->continual_io_error, 0);
-- 
2.47.3
