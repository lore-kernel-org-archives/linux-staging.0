Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C531C21D590
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775306997; cv=none; b=ctXzLNaJ2FfZ41L970/n6+siwn+Ufc8wljpM5RPAKQrBk96kqr3xqLpvySyNCtOJ8nohadGzsBynV+7QGhjuGpWX3B3J/DUWySOjbnTqXF6xuU6C+wvwSxUFiK7IvT5Eu81BacWCtGMAGGVUZNiCiN7qIvcrUoydeQQ/1n1q5kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775306997; c=relaxed/simple;
	bh=AxHV97E1JPr4eIYd4zhbPaThMgO5N4TroR37fM8RFro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X9XDZH8zK3yUuTy48OCVMvKbDkisNPuaxULDmpXVO6x5asxa5s6nm+WYOoe4t/hMB9NbsUZjF3oBQxbwqKI9/xtvuYpT1jDt+uqFfbnW7UuVxTOC6HQRDRPxMMYChPA98o7MPcJFO4TrWntJtwUIWYXM9P/NQBZs7QOs6ma2kVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UARGdZm5; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UARGdZm5"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48374014a77so34046725e9.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775306994; x=1775911794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4LY4CvGy+VWA2mY61PIObjTLY+/ovvfVe25JPqLY6c=;
        b=UARGdZm5WDGWXkTiPvkFAOdC+3EDc+ViFqmRhHXayf8Jvb0Tq721utvwyNAMyU2RWN
         Vcl21FLFHslI6YOZJJzz2J58DngMIQWLEFCpeBYmCkpCk9Eoj7c1b57ocf43uxpqzd5F
         ITvJfMJRZ0EerqDvrn7jx4PTh8QvYXh4x/OG8T5/YwA3PcQJSKRvvlVY01/qOg405mVU
         N8E65Bv26u5NC0hnhMCKz37AM4J8wt2NDWT4qmOKtzEsjeT3Rvf4GCDxsXZsNg3MQBPQ
         3BHZSvi4SCbd5N+rNfej+IpH9jcZBGEnxP4i/Il8aUiJhQVVUZ4mROvTQnkVdUlBqzYo
         tR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775306994; x=1775911794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4LY4CvGy+VWA2mY61PIObjTLY+/ovvfVe25JPqLY6c=;
        b=sqwAbG0Yp4XFRZJueQExq70I5EoKhv1jkHib27m6cluSjx28iTpDdj5XNMZAjV7lRX
         gsIylfT5dHzr7g0iRrSHOPNl/7MenbLEyQFN4DKPz+Br8ViAjVtV7m661roUGJ6CwEWV
         UBO2Br0uFVNQQ5X4Y1Mw8tufHZbqVE8jzRBrxg0yvxtgwm1XdNZICNTaBw4Wnu26Z3S/
         no9ILWDD3Om+ImkGyqzQoVBMzyBKSLUsfe691xFeIZVKnaVHXM/Oq63CuKczv9XYXfKs
         yfS486ZYScliPOwJlykJ/7RcCdk0/UScsCG9VUjQ7HmCwAwgIqdmNVcEweq40FPyV65H
         WsRw==
X-Forwarded-Encrypted: i=1; AJvYcCXqZRjPHHUVQVonP/fIHLkPUf/jkoxfxJ+c23oXQl+qjfmjNPDf7MBZxsH4OPQLlLhnh0pwc5deyy03eMSZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzJCaXYO8U95b8vdZAXd9aQ3UwrXv06Z071mCsl50Qu4kLWcxXM
	NIQJRlXt1pHNp1SkAwiurHqHkY0AEqJB/7n39MQoEwsz1OaeQ9fMM1jd
X-Gm-Gg: AeBDievIDXdF1Cr6ZHZhHHMdf6rHkIiS79KHv97lMMe5FNDKODWKp7lFxBdkVWXT6JA
	bEZzcoQv51FFZKRN1MfUBsjN16lbSuDVYfnqddN0rzhXMFNDCx0kUaynvPD/JlWuIXS7JRCVM4A
	o/k3tNYwKJqPJ3OaCUVtJaUDIov34aoUiJdfZEA/Iq2UgyruUpOVy3c4HtnJtFIgkIbP8H9rAM6
	FuMCuuCv7FaLWth92tbmJqw81u+dyfpZg3tAfSSn0BMgzXBh+xfOVoITzzaXCteEZETAVI7ljrE
	Tf8mm7NnnderP9gQEXcPnBxONS6UNCLQ7ol6ootXqZllcxWadF4gAnqGizb1bNUGKpLHNVBcp2E
	2LDYFJWHIQSV+casUHTixTnuWUeq/qmAZ/yE5k6O8HTdjqKSZFpz8rIx47bG8nzQgSFhgYQAGaX
	cUpDyauskk9IDymroCiF1b
X-Received: by 2002:a05:600c:310c:b0:488:a894:b27a with SMTP id 5b1f17b1804b1-488a894b3f4mr10534625e9.8.1775306993778;
        Sat, 04 Apr 2026 05:49:53 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm26920119f8f.32.2026.04.04.05.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:49:53 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused function pointers
Date: Sat,  4 Apr 2026 15:49:48 +0300
Message-ID: <20260404124947.52549-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused struct members from _io_ops. With removal of this members
some functions in sdio_ops.c became useless so they are also removed.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c   | 116 ---------------------
 drivers/staging/rtl8723bs/include/rtw_io.h |  16 ---
 2 files changed, 132 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 8cece69dbf79..653395ff4b1c 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -191,51 +191,6 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	return val;
 }
 
-static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
-{
-	struct adapter *adapter;
-	u8 mac_pwr_ctrl_on;
-	u8 device_id;
-	u16 offset;
-	u32 ftaddr;
-	u8 shift;
-	s32 err;
-
-	adapter = intfhdl->padapter;
-	err = 0;
-
-	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
-
-	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
-	if (
-		((device_id == WLAN_IOREG_DEVICE_ID) && (offset < 0x100)) ||
-		(!mac_pwr_ctrl_on) ||
-		(adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-	)
-		return sd_cmd52_read(intfhdl, ftaddr, cnt, buf);
-
-	/*  4 bytes alignment */
-	shift = ftaddr & 0x3;
-	if (shift == 0) {
-		err = sd_read(intfhdl, ftaddr, cnt, buf);
-	} else {
-		u8 *tmpbuf;
-		u32 n;
-
-		ftaddr &= ~(u16)0x3;
-		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
-		if (!tmpbuf)
-			return -ENOMEM;
-
-		err = sd_read(intfhdl, ftaddr, n, tmpbuf);
-		if (!err)
-			memcpy(buf, tmpbuf + shift, cnt);
-		kfree(tmpbuf);
-	}
-	return err;
-}
-
 static s32 sdio_write8(struct intf_hdl *intfhdl, u32 addr, u8 val)
 {
 	u32 ftaddr;
@@ -295,73 +250,6 @@ static s32 sdio_write32(struct intf_hdl *intfhdl, u32 addr, u32 val)
 	return err;
 }
 
-static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
-{
-	struct adapter *adapter;
-	u8 mac_pwr_ctrl_on;
-	u8 device_id;
-	u16 offset;
-	u32 ftaddr;
-	u8 shift;
-	s32 err;
-
-	adapter = intfhdl->padapter;
-	err = 0;
-
-	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
-
-	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
-	if (
-		((device_id == WLAN_IOREG_DEVICE_ID) && (offset < 0x100)) ||
-		(!mac_pwr_ctrl_on) ||
-		(adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-	)
-		return sd_cmd52_write(intfhdl, ftaddr, cnt, buf);
-
-	shift = ftaddr & 0x3;
-	if (shift == 0) {
-		err = sd_write(intfhdl, ftaddr, cnt, buf);
-	} else {
-		u8 *tmpbuf;
-		u32 n;
-
-		ftaddr &= ~(u16)0x3;
-		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
-		if (!tmpbuf)
-			return -ENOMEM;
-		err = sd_read(intfhdl, ftaddr, 4, tmpbuf);
-		if (err) {
-			kfree(tmpbuf);
-			return err;
-		}
-		memcpy(tmpbuf + shift, buf, cnt);
-		err = sd_write(intfhdl, ftaddr, n, tmpbuf);
-		kfree(tmpbuf);
-	}
-	return err;
-}
-
-static void sdio_read_mem(
-	struct intf_hdl *intfhdl,
-	u32 addr,
-	u32 cnt,
-	u8 *rmem
-)
-{
-	sdio_readN(intfhdl, addr, cnt, rmem);
-}
-
-static void sdio_write_mem(
-	struct intf_hdl *intfhdl,
-	u32 addr,
-	u32 cnt,
-	u8 *wmem
-)
-{
-	sdio_writeN(intfhdl, addr, cnt, wmem);
-}
-
 /*
  * Description:
  *Read from RX FIFO
@@ -463,14 +351,10 @@ void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 	ops->_read8 = &sdio_read8;
 	ops->_read16 = &sdio_read16;
 	ops->_read32 = &sdio_read32;
-	ops->_read_mem = &sdio_read_mem;
-	ops->_read_port = &sdio_read_port;
 
 	ops->_write8 = &sdio_write8;
 	ops->_write16 = &sdio_write16;
 	ops->_write32 = &sdio_write32;
-	ops->_writeN = &sdio_writeN;
-	ops->_write_mem = &sdio_write_mem;
 	ops->_write_port = &sdio_write_port;
 }
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index adf1de4d7924..3c99a2bc19bd 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -18,24 +18,8 @@ struct _io_ops {
 		int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
 		int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 		int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-		int (*_writeN)(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata);
 
-		int (*_write8_async)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
-		int (*_write16_async)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
-		int (*_write32_async)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-
-		void (*_read_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
-		void (*_write_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
-
-		u32 (*_read_interrupt)(struct intf_hdl *pintfhdl, u32 addr);
-
-		u32 (*_read_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 		u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
-
-		u32 (*_write_scsi)(struct intf_hdl *pintfhdl, u32 cnt, u8 *pmem);
-
-		void (*_read_port_cancel)(struct intf_hdl *pintfhdl);
-		void (*_write_port_cancel)(struct intf_hdl *pintfhdl);
 };
 
 struct	intf_hdl {
-- 
2.53.0

