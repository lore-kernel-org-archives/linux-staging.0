Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645F730F803
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269181; cv=none; b=r3hdMLXxDK4Ii3gOfqofM7oCcFIcNiT4E2cEhfOsXNuo25ylTnnKyC3WNzguVpbBIY8QQyhJHEa5LkCFK+mtfuUfFkcHCl0vSCRfPba3qn5ARPzhljxxIPEnXUTV3BGuN/GAU/Hd31rOeDLxqw1dlOOawa3eppsVfd9RcmdQVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269181; c=relaxed/simple;
	bh=isdvhX8Pge7oBH7znuBDoIOfHwFfCdk5cEuCQN5rUEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSMc0RdwT6SCoK98DSOXo+965YhEHDg7l4L1Mt7yV65tLMOrRtiSrD5LCKwMGWYwidRPDofosHQRc9auWlP6leml262+/X9QsZSKlS2C5T46KkjhZPTxfRFVMnkDufvHv4d/qdnVqvhWvIxK1E8jpgF0zLLS5NPpcdVGnWQUCaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjU2OqFB; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjU2OqFB"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3937014be0cso21046341fa.0
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269179; x=1778873979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9opIhlqLfaL3NCEWJQR8+qg/1T1WuBcl1PKf4SD+3fw=;
        b=hjU2OqFBK4zj1dI9RKaNE2tTbCyrEhufOENlNeIsjuYX9JllQ+9n6FYvOhhaA+fI+z
         lrydctb7QEmgvLzLdrQw1EnX4q555JvjYWsS7UV2LCSKkG77YPRXYZMx8E+j8EAKnFKH
         VNEd3r3Wr/uatO+50hn0JVAXZIXfgIfZAJE1viW7EaVq6uCrSppxv5H0otlv2qhlKz7N
         ZzL0TUvAZ52vAs/GtRGloZrg2lkkhNgelxryZGqC5YU6Fe01f7j/dxcs0hGQS8sGJEav
         cKrfaiV3P13ZIfrUoKJA0R2CG6s+g/kJEMvsSBsVp65/Te1a6CTUgLLEAsRv47fpvVOP
         qLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269179; x=1778873979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9opIhlqLfaL3NCEWJQR8+qg/1T1WuBcl1PKf4SD+3fw=;
        b=oOwBYnoFVpayfz9INNNEtZHFtnNJXQwneReCLkf5tKAKuzuKuyJJ2MQ1j5zIqODExA
         uqJgYq+5YTE442u8hVwVNHlY8dua1Tr6sVa652OD+V+2v4NHRUxSJ6yNLGZ/YuIxA8LO
         w/omvy6VSyFe6FD4JDa5TIk2H7UCbj6dlCU5s7uDpcGjczpQkAQsSiKSHHUYnbuLv/O/
         8vCRPkSEdeKy49fJXamknpvBcMxU1Dbkjb3VSP4Ni2hNsBv5DBRaTRVJOAngQhKUh10R
         d98jJqw6fleYRA6FPm4ui/SeHqwgWueKCh6Ks9ItaycqWcp9DV4VK8hF5D44xXZE/6ka
         Uh1A==
X-Gm-Message-State: AOJu0YxHXi4sbokcM2JOJeBiPRHHZnn6CDkHOqmOfqIfYG56TchHzr9w
	LPxhPCirjbuAnfaTJPAL7u5VHo9cP9HJHqXqO72hlAiuG60tQ221D9qODsDabX8r
X-Gm-Gg: Acq92OFPu+2aw/x4wyJG6baGC5JNaF0/CCJnGYEWPeTL2LfsYCLvQWUjIMKVsaKg1Al
	5jcU7jILXcGBfitpXBsYEdt/xj6VaNhoIA4/l1g7XH2Q5GNg1jkMOhicLiWpw5GEX5ftBSjO1dh
	EBNJffQZEXzw72m7WkqzZk8SctFGDLSodN4nb22hynns7xFpDymMtklm7qF6D9zV5YFUaeN54E/
	4CtYKK4LZwYwxM+I6HkwQCJtR8obk7rytXzCA0R34AIfsaeCcjy8QzDj/B+0ulYCO8IsT/qbG9a
	66XZowclLBc5OTndFABFGSqsIALSEeRVPVO88Lubh+IUsrR9jwjrHpTbVaLEg+F956ajzXfcKhs
	Pl513HS5i5+6DYXel6wcNmUnUb5TxZPP6TVzVKZaYXHZF39CEzs65/ptTKHHDDs3w0yGUCOsMf3
	dh8VuUHkP0okn+ZvvgPwgjH3o/1L3ukeVSFXWgw+fSc3WUgQ==
X-Received: by 2002:a05:6512:608b:b0:5a8:918d:5926 with SMTP id 2adb3069b0e04-5a8a94aa77cmr1628460e87.18.1778269178361;
        Fri, 08 May 2026 12:39:38 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:38 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 05/11] staging: rtl8723bs: inline sdio_read32() into rtw_read32()
Date: Fri,  8 May 2026 22:38:34 +0300
Message-ID: <20260508193909.16015-6-nikolayof23@gmail.com>
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

rtw_read32() is just a wrapper around sdio_read32(), combining them will
simplify the code and reduce the number of indirect calls.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c    | 45 ++++++++++++++++----
 drivers/staging/rtl8723bs/hal/sdio_ops.c   | 48 ----------------------
 drivers/staging/rtl8723bs/include/rtw_io.h |  2 -
 3 files changed, 38 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 85a3ff441f84..04b07b281186 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -62,13 +62,44 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 
 u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
-
-	_read32 = pintfhdl->io_ops._read32;
-
-	return _read32(pintfhdl, addr);
+	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
+	s32 __maybe_unused err;
+	u8 device_id, shift;
+	u8 mac_pwr_ctrl_on;
+	u32 ftaddr, val;
+	__le32 le_tmp;
+	u16 offset;
+
+	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
+
+	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
+	if (((device_id == WLAN_IOREG_DEVICE_ID) && (offset < 0x100)) ||
+	    (!mac_pwr_ctrl_on) ||
+	    (adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)) {
+		err = sd_cmd52_read(intfhdl, ftaddr, 4, (u8 *)&le_tmp);
+		return le32_to_cpu(le_tmp);
+	}
+
+	/*  4 bytes alignment */
+	shift = ftaddr & 0x3;
+	if (shift == 0) {
+		val = sd_read32(intfhdl, ftaddr, NULL);
+	} else {
+		u8 *tmpbuf;
+
+		tmpbuf = kmalloc(8, GFP_ATOMIC);
+		if (!tmpbuf)
+			return SDIO_ERR_VAL32;
+
+		ftaddr &= ~(u16)0x3;
+		sd_read(intfhdl, ftaddr, 8, tmpbuf);
+		memcpy(&le_tmp, tmpbuf + shift, 4);
+		val = le32_to_cpu(le_tmp);
+
+		kfree(tmpbuf);
+	}
+
+	return val;
 }
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 230817f79b61..32ea7dd07711 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -124,52 +124,6 @@ u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
 	return ftaddr;
 }
 
-static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
-{
-	struct adapter *adapter;
-	u8 mac_pwr_ctrl_on;
-	u8 device_id;
-	u16 offset;
-	u32 ftaddr;
-	u8 shift;
-	u32 val;
-	s32 __maybe_unused err;
-	__le32 le_tmp;
-
-	adapter = intfhdl->padapter;
-	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
-
-	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
-	if (
-		((device_id == WLAN_IOREG_DEVICE_ID) && (offset < 0x100)) ||
-		(!mac_pwr_ctrl_on) ||
-		(adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-	) {
-		err = sd_cmd52_read(intfhdl, ftaddr, 4, (u8 *)&le_tmp);
-		return le32_to_cpu(le_tmp);
-	}
-
-	/*  4 bytes alignment */
-	shift = ftaddr & 0x3;
-	if (shift == 0) {
-		val = sd_read32(intfhdl, ftaddr, NULL);
-	} else {
-		u8 *tmpbuf;
-
-		tmpbuf = kmalloc(8, GFP_ATOMIC);
-		if (!tmpbuf)
-			return SDIO_ERR_VAL32;
-
-		ftaddr &= ~(u16)0x3;
-		sd_read(intfhdl, ftaddr, 8, tmpbuf);
-		memcpy(&le_tmp, tmpbuf + shift, 4);
-		val = le32_to_cpu(le_tmp);
-
-		kfree(tmpbuf);
-	}
-	return val;
-}
-
 static s32 sdio_write8(struct intf_hdl *intfhdl, u32 addr, u8 val)
 {
 	u32 ftaddr;
@@ -327,8 +281,6 @@ static u32 sdio_write_port(
 
 void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 {
-	ops->_read32 = &sdio_read32;
-
 	ops->_write8 = &sdio_write8;
 	ops->_write16 = &sdio_write16;
 	ops->_write32 = &sdio_write32;
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index aaf9ef27cfb7..bf7e26fa7bed 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -11,8 +11,6 @@
 struct intf_hdl;
 
 struct _io_ops {
-		u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
-
 		int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
 		int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 		int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
-- 
2.54.0

