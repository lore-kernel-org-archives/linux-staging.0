Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E9D13A86C
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269189; cv=none; b=hl4bp3YxAZwgz+vsCihKf66Wh980Guf2bSTMoCgxyMruk+2BD3dwwfj0OhV4ndxdLRrU00jxH+qCBk6z3tn0UBuucZXAEj5HeiymK5Lq3T+TmNUo/zWdmobA8tCr49DkynDImAH2C45wBXQsmhSX1vdEmxbH3G9QRvxotTxGNww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269189; c=relaxed/simple;
	bh=jgZB6YN3wldeIb9USxy9MtM6vb9QKOrpiC9J7m1Mq3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGhgwWnXpTtVTVNhVvWXjhnY7sBh4+LxS7+LwEnd4jzyVBioVhQptuUyQt+VBf157s8zvqTl7V1xY66Hmm7G6FVRJskUIsQkl6zrb5V1c/Yw319jLD6esuuT49oMbJMGLtA5RH5o5jyk/wyhF3QIIuh6kmuemDCtEGzSBpusuNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfic+nQS; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfic+nQS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so2513320e87.2
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269186; x=1778873986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZQqVMRaPCG6l0ijmrzxsoH/wor/WtXwr8JmgZkD+3c=;
        b=cfic+nQS3Amn6StG8XJJkW66KRnPF/pqjL9FdYPLXHU9w/+QLY5RjdUuTa+mRb+nT3
         oxPxZJ5pXU5r+0jumva8PfPGq/x3xxY7ow7gNBwFcfSWq7kn8UwWQVLcC4A9J5xkV7bT
         52YsaLX4v80R1T4gbDVs2SyRpfOHg++o6bepbCeqobtrFOq0J9mK+YWentLHtgABPTI7
         p+FGX+1KSveLajOFPHlIE/+ZvfJqp0O0PWTiLhZIfFJO23yxgd7V5jhc7aMTPwMaFDVm
         lRN07vlIM6+kvZvEF7/V2wTBsDVFCV+iWw2N2G1pMmsvKSDgvXk8BhiyKxRn/LdRIT4B
         L9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269186; x=1778873986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZQqVMRaPCG6l0ijmrzxsoH/wor/WtXwr8JmgZkD+3c=;
        b=D7zAL+2B8BSqKlMheGBy1mb1lkSYaBEXW0HXkqkbD/Mjbx8uaYwESa42p5yaZnoWOs
         saJaU9tfE3FrF57YFg8YmqPOAQFYjD8YA0Nt64oVRkLb9Jp5uyj+y3c5CziBrr7Gr0Yt
         v5QWStvVdW3YvgtUCxp8zIn6/BYweQ/57vvTY6iUyru0UU+cYd1ZpDgbprQfxTlhnVyj
         HPd67AMSZlAI3YMigfXc83TOgAwPXpDOvwN82m0BF428U7HM0hOrcEy1zIOKZ44thgnL
         v0D8oAnOg61AeIakuWM680XzmXC/dwNm6sPtVPKVs1D7U/je0XkCVLBUgeAo2xY9J9mm
         Sing==
X-Gm-Message-State: AOJu0YwDtEQRJWRGCBuHgjmbd82nLRGv+NyV+Us0YtBKtuQmZuJEeYql
	yyUAL8fibNt78f4pcrgiOhCjC8sMceWQQ5uKIryHovS80ZxSxIu6x0qM
X-Gm-Gg: Acq92OFguwkopP86y4OwquCMjpjscZTzNpn8j7nP9pzvInSq1YrIG0UoiKwybFzZL9w
	dk81ptshvjefv+sjJtH3KEUc2SBPW/tBo51PV28z8xHlihbzGx8QLVZwLdk67Hjtrs+6cQE+a4t
	OpYH6hkxybKga7je95sp6ErYlJ8a+x48w2qlSbMXCWfL+EOTkAK6tOMO0AUsND9Ed39t2lEfAUD
	X7orFnONzzInrYfOrgmRQwUKcRkYOn72KaQWcFi3/NxTptErLhe0A0IqASy1ItW+Kp2nlvhwlJa
	PJfi84QQN4Qsb+ULe6709HpzVdvULEuJMppL2rHvdt4TXsPGMhzYcPiIx3AjeBVz20C07oFj6Eh
	3Xm7YyLNluzdzHGxPGR1LaCVp553Df0/7h51JBaw2kMfPkzAQsTcrH1773EJnkk70o7AR/tDDkb
	Q9EIsQj9xzQnWAC+Di4AuKClDh
X-Received: by 2002:a05:6512:1153:b0:5a8:a558:63ae with SMTP id 2adb3069b0e04-5a8a5586466mr1870921e87.13.1778269185873;
        Fri, 08 May 2026 12:39:45 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:45 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 08/11] staging: rtl8723bs: inline sdio_write32() into rtw_write32()
Date: Fri,  8 May 2026 22:38:37 +0300
Message-ID: <20260508193909.16015-9-nikolayof23@gmail.com>
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

rtw_write32() is a wrapper around sdio_write32(), combining them will
simplify the code and reduce the number of indirect calls.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

The call sites of rtw_write32() also require _SUCCESS/_FAIL, so we need
to use RTW_STATUS_CODE().

 drivers/staging/rtl8723bs/core/rtw_io.c    | 32 ++++++++++++++----
 drivers/staging/rtl8723bs/hal/sdio_ops.c   | 39 ----------------------
 drivers/staging/rtl8723bs/include/rtw_io.h |  2 --
 3 files changed, 25 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 38c4bdd918b8..f1f3ca46bd15 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -141,16 +141,34 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-	int ret;
+	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
+	u8 mac_pwr_ctrl_on, device_id, shift;
+	__le32 le_tmp;
+	s32 err = 0;
+	u16 offset;
+	u32 ftaddr;
 
-	_write32 = pintfhdl->io_ops._write32;
+	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
 
-	ret = _write32(pintfhdl, addr, val);
+	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
+	if (((device_id == WLAN_IOREG_DEVICE_ID) && (offset < 0x100)) ||
+	    (!mac_pwr_ctrl_on) ||
+	    (adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)) {
+		le_tmp = cpu_to_le32(val);
+		err = sd_cmd52_write(intfhdl, ftaddr, 4, (u8 *)&le_tmp);
+		return RTW_STATUS_CODE(err);
+	}
 
-	return RTW_STATUS_CODE(ret);
+	/*  4 bytes alignment */
+	shift = ftaddr & 0x3;
+	if (shift == 0) {
+		sd_write32(intfhdl, ftaddr, val, &err);
+	} else {
+		le_tmp = cpu_to_le32(val);
+		err = sd_cmd52_write(intfhdl, ftaddr, 4, (u8 *)&le_tmp);
+	}
+
+	return RTW_STATUS_CODE(err);
 }
 
 u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index b6d0774652dc..a162815e24a4 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -124,44 +124,6 @@ u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
 	return ftaddr;
 }
 
-static s32 sdio_write32(struct intf_hdl *intfhdl, u32 addr, u32 val)
-{
-	struct adapter *adapter;
-	u8 mac_pwr_ctrl_on;
-	u8 device_id;
-	u16 offset;
-	u32 ftaddr;
-	u8 shift;
-	s32 err;
-	__le32 le_tmp;
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
-	) {
-		le_tmp = cpu_to_le32(val);
-
-		return sd_cmd52_write(intfhdl, ftaddr, 4, (u8 *)&le_tmp);
-	}
-
-	/*  4 bytes alignment */
-	shift = ftaddr & 0x3;
-	if (shift == 0) {
-		sd_write32(intfhdl, ftaddr, val, &err);
-	} else {
-		le_tmp = cpu_to_le32(val);
-		err = sd_cmd52_write(intfhdl, ftaddr, 4, (u8 *)&le_tmp);
-	}
-	return err;
-}
-
 /*
  * Description:
  *Read from RX FIFO
@@ -260,7 +222,6 @@ static u32 sdio_write_port(
 
 void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 {
-	ops->_write32 = &sdio_write32;
 	ops->_write_port = &sdio_write_port;
 }
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index db2e00554aff..9fc2f7413543 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -11,8 +11,6 @@
 struct intf_hdl;
 
 struct _io_ops {
-		int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-
 		u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 };
 
-- 
2.54.0

