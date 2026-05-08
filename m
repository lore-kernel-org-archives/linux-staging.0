Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C7A30F803
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269179; cv=none; b=sJwJfolSflXJax+m4z0I0JZKkUXTjPa5WGCu7OoI07rRXSwN/xGFU9BnH489eVhVFQituZqooB4SYbMKFKB5PwK7Ug9TzMJk3LtVPJwkqwoA3ir1GO+VQzfIOl4P2cdQ7vRdADmV5+crOaghmjTta/mMobF6HUToIcsJaZ+kB1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269179; c=relaxed/simple;
	bh=3eXSPH9ThtZGtLTvRaakhlP97zBD3Bh4XVsHiuVPFJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4tL8FdMSdU7gVrl92xj/Q5HiykkQQpf+tN188DLu7vnhe3Yw3/9iix76cFIAAM5Fd7wWj1o4ca+U2oTEPV8CbgpZgSd9pfIlDQbVL7d+8Q583LrFt+rYv2aAr5eOFjuMjFlY1RSPcfghr69vcm8VafEFXj47DYJWlw+1YnoqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHMLkUBR; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHMLkUBR"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso1687467e87.3
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269176; x=1778873976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxLdFqIeSJhvrambaUr0CGpvdCTj5wZCQ5DpiBrhoR8=;
        b=LHMLkUBRggXtgJNw1dUqrTTKY+6/dly4pBdz3Nx7JQT2dl86I4O9njQnQuoR0kbFCR
         E8KYeIJ2YxtquyqHqnEw4J7NHbUX8sZvZm7O/zyjHyHGjlUPD1LcgYQJVLcKY5AlfxN4
         hwfLGg0l0GlcR83pMQ5rnqkat7kju9GQWPJttzkO5/ZQp4xCY+zCerfGuxiSxdpoTkyc
         V8CwRcNQuSbpzU9JDEN2yAQAL3zKmEkCg3rZRzkKXZUclJlWT/Wf9GQke5W4CJfhDgOc
         ser40sgNSEZL6pESsnlM3Y1P16aOs//XYkztLC5bynBlxfVb/fpJnXutlec9NJskkpLK
         w9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269176; x=1778873976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxLdFqIeSJhvrambaUr0CGpvdCTj5wZCQ5DpiBrhoR8=;
        b=K6E7CwJisYSZbWIo2yT2psmN0FTc0EuNEazuAzSPYDyp+/IW9kHtDC1YFGZUsZE3kf
         PNyj3LK+PNdle5nrRvopHCvuimxBxrWp75dUXCunijDzCmvscDvn3tzWZnXNTaJ2uZzu
         cnk3mHdGQJkGZMHSWESApKNcbyIUm3j7vJKe58rQLWkJBYOaV12ayOFUyUuAn4ssVF6z
         dK6vx2zeZGVh2mdAT3PkYoxgC7zQWwJdXXVzTxni3jFVChOituRxOs/tRzRbGHBdEce5
         FWNifMvZ80iAgvJEHErpEFPlJ4Ip2wk5SA/oyaPMcfm4ZYw98GpYcXBlwXKmDXMSAF2n
         ukpQ==
X-Gm-Message-State: AOJu0YwAKJ9L+n0R+mUvrrcn499qDFJZmO7nwPIUn4hx0EBa5a11ozxw
	xzUrESlCnJKtGIBaFo1v8oNWbi4bux4FrJ85TfMq38AvkkCd7FRlNHjQ
X-Gm-Gg: Acq92OHg3erUT8UpJ9gmBXNFf89CJe6n53F49/XwJsfmKmUjtNbMZKWT9/r8GDc2CtW
	t2D0OAdbQo3HkhXU4HMJuC3gckVJfBYuc7bdBHHih9XXzjp5a2AAaAwckm4iYBJlq/Pf4nVHrGf
	qDQwyHztnxH3c0/bp4Qa/uVNm80MWQCXI7Cwc+PJLBu6AlxIUYxctzYDDjbD2SNQHziIaCDLtHe
	4d7zs1+z2XkubniZWh0pnDHTM3VHtiyWwQxIWgxHUvd4SYH0URYj7BHBGIX+PL3i7e9kdzfLuu4
	3zwAcvzusdCRsxYAD8acQsKmncpyNxXj1a1z+LMy94luuZ3UUq5tvlNTp7SrLhkSedHeeyl7JEi
	YkAJGSiWG6ZVKmg2pL9iIDawDtwHdXzivIFrnrXkN0oQ1ftxUeyyAPT8WtxDCjtb7SaOscVkg8w
	ena3ujZa9LwyBwEeVsSo6xSgUZ
X-Received: by 2002:a05:6512:3ca8:b0:5a8:89d6:93e0 with SMTP id 2adb3069b0e04-5a889d695a1mr4403577e87.13.1778269176429;
        Fri, 08 May 2026 12:39:36 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:36 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 04/11] staging: rtl8723bs: inline sdio_read16() into rtw_read16()
Date: Fri,  8 May 2026 22:38:33 +0300
Message-ID: <20260508193909.16015-5-nikolayof23@gmail.com>
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

rtw_read16() is just a wrapper around sdio_read16(), combining them will
simplify the code and reduce the number of indirect calls.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c    | 11 ++++++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c   | 12 ------------
 drivers/staging/rtl8723bs/include/rtw_io.h |  1 -
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 838e5336ea18..85a3ff441f84 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -50,13 +50,14 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 
 u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
+	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
+	__le16 le_tmp;
+	u32 ftaddr;
 
-	_read16 = pintfhdl->io_ops._read16;
+	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
+	sd_cmd52_read(intfhdl, ftaddr, 2, (u8 *)&le_tmp);
 
-	return _read16(pintfhdl, addr);
+	return le16_to_cpu(le_tmp);
 }
 
 u32 rtw_read32(struct adapter *adapter, u32 addr)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 2d442a8db586..230817f79b61 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -124,17 +124,6 @@ u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
 	return ftaddr;
 }
 
-static u16 sdio_read16(struct intf_hdl *intfhdl, u32 addr)
-{
-	u32 ftaddr;
-	__le16 le_tmp;
-
-	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
-	sd_cmd52_read(intfhdl, ftaddr, 2, (u8 *)&le_tmp);
-
-	return le16_to_cpu(le_tmp);
-}
-
 static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 {
 	struct adapter *adapter;
@@ -338,7 +327,6 @@ static u32 sdio_write_port(
 
 void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 {
-	ops->_read16 = &sdio_read16;
 	ops->_read32 = &sdio_read32;
 
 	ops->_write8 = &sdio_write8;
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index f58cf740f099..aaf9ef27cfb7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -11,7 +11,6 @@
 struct intf_hdl;
 
 struct _io_ops {
-		u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
 		u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
 
 		int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-- 
2.54.0

