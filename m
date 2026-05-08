Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AEC13A86C
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269187; cv=none; b=VtbqYB0wDfGB/Fh3UuJRiwLZPvWJ5HrOF0XN9DsrOGXeCUCOREKM0Uj6OPAcCQtz4Dop0lWdQwMpzz4lFw+IYxtb37iWFqmd2gAOcBIhmx67TR4m3ajSzyFDj4C1HEI7bCQE5Y0gFz4lb2T3LjTJYh+pqwUgk5n9iK6RIfn/GX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269187; c=relaxed/simple;
	bh=GrUJjWYFSh6CG1zlsJfHa9hlcnZfRAXr50Gi6On3sFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaQL8DOyWbo75668qtT9Oq6gGD1231ajaYaROMOyj2ui0Sjl8N+8z2Mr5K1UU9Fm9m9LECpnQb44ON5kGhtw4orr8+WTbyMqOT7XYEcCHyEOuLMyk2OuvMns3c5PamwcNskJ/RZ/BtRs3NXWnlJHnUApCEIlNO4k/GvIIKEqDvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rak+mEV/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rak+mEV/"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a884815606so2377748e87.0
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269184; x=1778873984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+KUZzsYwSAmU98uzKPO2bf09NQ/0HE11GWbMRYKNfw=;
        b=Rak+mEV/P1z7dy5vQMDO4dil1HosAO/bz/M7p/PUGvMiJCMBU+wYPn4hxdTU54/BVQ
         Z9OzNeVJRTsi3w3mUoqfOoNGwhOBFajehf3nAi8St4UWrh+vmfoyZ3tnXagRpH2c6S9r
         eTHPGuZUTrXBAg5Jz4KmCB9v97QqpaQEh0SirJIZ8hn2LkK4mrObvwPTR1FqrHp5o8zL
         yBisdWCrW8IEbyBURgcsxLhlaIWMaErA8uZFLZna8yMUvE1DAkXJRwy+MR0Q5UiCnRzo
         WgJTn34NVmfpxWPLC/EFlEJBgfQaP/H6WyG/EfAOmYGYpDz74SquQJ80Xkht71/bK+mo
         eLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269184; x=1778873984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+KUZzsYwSAmU98uzKPO2bf09NQ/0HE11GWbMRYKNfw=;
        b=hc8Y7LqIzHcYu/mtOUwtWFgGvktAGpTyGa8TPWpkQAcciedT1tDeD2LNLAbKS8XKv9
         udA5cn+aarJZhiOcskIN3YSGdyCTayJvfPVw9nvNMTgNXrvZemyKbNFgs5bm571pY2vX
         +9zMsgBQJgNa/D3gFfhUnDOwZ8hN4uwGj8ZJHH4yszFO4aYpg2aNUCNPdI9lwPcy520N
         JmGQVtxG/DpRZ//kodnkF2CVyJjfhwFcxmse9dR0702WqBUPTNP6YgbqmEfd1dVWrBO3
         oPrv2hRVbmQPAtq0Bkjrn4/80JwOLkhrHtDIdKF98CZ2EKdPymvskzzkP9+AQSW8/GpI
         046g==
X-Gm-Message-State: AOJu0Yyn5DHoC+Tip7hcgU1MQsxBTblCLW+weWTmfH0medPzDuJDyrdN
	8Hz4h5q5N5yYVvZWiOVxeveRNH1e19jLCtOKwkpJZbXcHSkBmBEfNVVump85QUke
X-Gm-Gg: Acq92OG7HuxzELokEjC5Ym/OE9XSb2oRfBxul8hHkmheTFysl9F4ymP+ZAn9HYXtjql
	388wEB/tTeyBCV30NjQ1dG2LOrJeyur/h9gCZfUz9bDqO+oqOzeiLGejHkfXzDmgoKvkyRF/NxZ
	obQpdMDQOyjVxhul857VGwc9YfCAXvHNYxNKWH+7zag4JQPNwv+TOg0K2yuqIC6ugaMtQFxnHq4
	uR3fXtYXry9ozN1TO+pyGhArmAL8zhkic3BQMRbuS5kSBNk20aHb5bB2hmsxNkO4IaKVUxZGo8k
	crsog5cC1Nlm8gtjGoOA+Hp13DOipMcJ4Rx5pdQWrKEVd96sDQimtG1XXvxQfRPa/O2HGPUyn4L
	Myd63JRj/xTFm/nyrp0c/+u2x6X4etfQ1Rs7HQqV7iYXwOqAxLhfMYByeBp7VgNk6dUToKjSsXa
	7Doz3DjYvDN/07cVIBmU8skNmF
X-Received: by 2002:a05:6512:3ca1:b0:5a8:7be1:24c8 with SMTP id 2adb3069b0e04-5a887ceaa65mr5957991e87.37.1778269183888;
        Fri, 08 May 2026 12:39:43 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:43 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 07/11] staging: rtl8723bs: inline sdio_write16() into rtw_write16()
Date: Fri,  8 May 2026 22:38:36 +0300
Message-ID: <20260508193909.16015-8-nikolayof23@gmail.com>
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

rtw_write16() is just a wrapper around sdio_write16(), so combine them
to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

The return value of this function is never read (I checked with commands
	git grep -rn -C2 "\brtw_write16\b"
	git grep -rn -C2 "= \brtw_write16\b"
from the drivers/staging/rtl8723bs/ directory), so perhaps normal error
handling can be done here?

 drivers/staging/rtl8723bs/core/rtw_io.c    | 12 ++++++------
 drivers/staging/rtl8723bs/hal/sdio_ops.c   | 11 -----------
 drivers/staging/rtl8723bs/include/rtw_io.h |  1 -
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 1a7988a376ec..38c4bdd918b8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -128,14 +128,14 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
+	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
+	__le16 le_tmp;
+	u32 ftaddr;
 	int ret;
 
-	_write16 = pintfhdl->io_ops._write16;
-
-	ret = _write16(pintfhdl, addr, val);
+	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
+	le_tmp = cpu_to_le16(val);
+	ret = sd_cmd52_write(intfhdl, ftaddr, 2, (u8 *)&le_tmp);
 	return RTW_STATUS_CODE(ret);
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 672b577016ac..b6d0774652dc 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -124,16 +124,6 @@ u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
 	return ftaddr;
 }
 
-static s32 sdio_write16(struct intf_hdl *intfhdl, u32 addr, u16 val)
-{
-	u32 ftaddr;
-	__le16 le_tmp;
-
-	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
-	le_tmp = cpu_to_le16(val);
-	return sd_cmd52_write(intfhdl, ftaddr, 2, (u8 *)&le_tmp);
-}
-
 static s32 sdio_write32(struct intf_hdl *intfhdl, u32 addr, u32 val)
 {
 	struct adapter *adapter;
@@ -270,7 +260,6 @@ static u32 sdio_write_port(
 
 void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 {
-	ops->_write16 = &sdio_write16;
 	ops->_write32 = &sdio_write32;
 	ops->_write_port = &sdio_write_port;
 }
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index 363c91b213f6..db2e00554aff 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -11,7 +11,6 @@
 struct intf_hdl;
 
 struct _io_ops {
-		int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 		int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
 
 		u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
-- 
2.54.0

