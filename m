Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27C93E8C44
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173211; cv=none; b=Q1LEMmwSaeV0cIE7wQTVTCVYeaX+/3uQEpDdRxemBrSPPyth7fYNFfO9A4E3Srwga0ecnh9TRm3/HdWlXcsDqa8v73+U7fLzpcPQ5hMtC6Py9lf9LX71HLgot0EJYKfi9YNpSa1NciYo4MpV+Fhip48juH81w6WGiZj0XsEnHSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173211; c=relaxed/simple;
	bh=BAEAEao8zGcfEPk3ro9fqvnx7VdR1iceehL4mhJX3gE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfmJHveS5rb4sR3Dcrt9O9QgMmTA9KTVvT+oeWepeamdViPcB9rHOfWh656/r56qA1Vrmi1gBs985iTrwR0+RNDgZd2fU7FbHErrEJCGfswiXBoCXZuyrhtRKG4YVnvZhwUFGzlDd3Cn4bhzM9aFV6WMZ8e+BAzVvXuEjvUR95w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yeshjcfa; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yeshjcfa"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8296d553142so3375037b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173209; x=1773778009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=;
        b=YeshjcfatcqoJXNV5Efo3Lixoo0f03opBIigCa0GV4b6SmqpGf0afXG5JxKBDiGG2f
         HF/u1MoujkL4m5uTh2rHw8SwzpP8UJS/5RxUMms05Q5aTrVUR33xkY8jGNUricrffys9
         rMeT56RP3udgGQ4iv6u+fvonqwA1rfhtMw+m/1w+NQwVw9jO7ee6kSVllOLZIZ8gd+xv
         XOFlvKrO3xs8JfS31NoVAhGdJvWr9sP4X5kGLqewnT/ki741UHh5D6KnhYAEzxPAy0ZB
         RhvyjKds9Tv0Yh2NOZapgbUZC24mWVJ0dravFF1Oi0/KcifvZ97XIXqSwUaF6DsMW/Mu
         Az8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173209; x=1773778009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=;
        b=RTYyzkl6hC7c2I3eEv0TjAfjMRxEtIuCnOD7MAw7rLwXv+wxDYhm1o36wRtI0ZOTLJ
         iizfXeLnFr5GwqeSLKkpruLSlatoRluXm//jPxA8ZynX+xhhCvTD4FmLvcRJeUL+79Mq
         DliSMXEqQ9Ahla+V4ke08PxN9Sxcx1aaC/slVs9stLZDRiKuCbkrP0DwWUHLzv0jpBiz
         PnCyvhrS1B/neB5t0VOF/iz6rxIJhvMu1o42ZXhvfzDtNZVAl1E7h60xRFG6FQMYFg6C
         ri0Ee283rNQ/liKbgfp7JXZtNjNrJzZNlO7nOnaxDm+x87wbPY1BwW7dEYFmTqex4EzF
         A8bg==
X-Forwarded-Encrypted: i=1; AJvYcCU4I6j7yDZimxCBDSURz3Mzwm5oXSRMtHofXZAlvnR6dEWY9Jm2Wif1QJo5YntbUyCClJSbemVnrupTJZRE@lists.linux.dev
X-Gm-Message-State: AOJu0YxpcaLo2GTpQQypiVbrTfuTBPU8QN9qmmykUW0hur3kMXogAoMD
	MV11Zlx0LRJYAB+7YzZUffjVk7E4zAD+YcKar074MPF+bXE0JCdTEJxs
X-Gm-Gg: ATEYQzxPaUCCf7aad0Z6++qrEh1YEeuW/5vIqAbqhC2nY6FN4QwOo+uETQRNF2JQn1m
	PfIYnum/IQQiL6Ks7SMlA+wycegyLarYckp0x58hAPe8TvMDSlSr2eb8SoJFGWkTJ9eIszfH5BD
	j7VCI6vDFgqzBikSW5cyaccAYoVGdG61FHDtgmIgQeFAl4KxHeq6TVO/PStBObag9trT8xXDYCw
	1uCHfNz+jx2xrUizQY/6agYmde9QHJ3rx1GJtGeyF+LmoLQV0L47ZrUUlNKXR8z22hqIBWX6M12
	eaoTcFJYfR9KplszG6rR8mSegc+1+Ny3HsBv0qMtqqSLGcjQCksBow/0WhnvBLf+X68DuVjX5uq
	pZ2zi0oWyPdHoQIc8Ytq/CQ9PQ60ioN0kV/eIGsi+R9cAzrk5F1X2tPfU6Uhq0ShNHhS1equCVj
	ZwECA088hCMRQFcgS2Gs+VG3s5nFEomfT16ttSGowEUEScnELd
X-Received: by 2002:a05:6a00:ac0f:b0:829:7e6d:cf1f with SMTP id d2e1a72fcca58-829f721be36mr107593b3a.51.1773173209251;
        Tue, 10 Mar 2026 13:06:49 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:48 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 7/7] staging: rtl8723bs: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:13 +0530
Message-Id: <20260310200513.2162018-8-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++++---------------
 2 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..2badf7d1aec4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -627,7 +627,6 @@ static void hal_ReadEFuse_WiFi(
 	u8 *pbuf
 )
 {
-	u8 *efuseTbl = NULL;
 	u16 eFuse_Addr = 0;
 	u8 offset, wden;
 	u8 efuseHeader, efuseExtHdr, efuseData;
@@ -640,7 +639,7 @@ static void hal_ReadEFuse_WiFi(
 	if ((_offset + _size_byte) > EFUSE_MAX_MAP_LEN)
 		return;
 
-	efuseTbl = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
+	u8 *efuseTbl __free(kfree) = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -702,8 +701,6 @@ static void hal_ReadEFuse_WiFi(
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_USAGE, (u8 *)&efuse_usage);
-
-	kfree(efuseTbl);
 }
 
 static void hal_ReadEFuse_BT(
@@ -713,7 +710,6 @@ static void hal_ReadEFuse_BT(
 	u8 *pbuf
 )
 {
-	u8 *efuseTbl;
 	u8 bank;
 	u16 eFuse_Addr;
 	u8 efuseHeader, efuseExtHdr, efuseData;
@@ -728,7 +724,7 @@ static void hal_ReadEFuse_BT(
 	if ((_offset + _size_byte) > EFUSE_BT_MAP_LEN)
 		return;
 
-	efuseTbl = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
+	u8 *efuseTbl __free(kfree) = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -739,7 +735,7 @@ static void hal_ReadEFuse_BT(
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
 		if (hal_EfuseSwitchToBank(padapter, bank) == false)
-			goto exit;
+			return;
 
 		eFuse_Addr = 0;
 
@@ -804,9 +800,6 @@ static void hal_ReadEFuse_BT(
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_USAGE, (u8 *)&efuse_usage);
-
-exit:
-	kfree(efuseTbl);
 }
 
 void Hal_ReadEFuse(
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..303139a75551 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -179,9 +179,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	if (shift == 0) {
 		val = sd_read32(intfhdl, ftaddr, NULL);
 	} else {
-		u8 *tmpbuf;
-
-		tmpbuf = kmalloc(8, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(8, GFP_ATOMIC);
 		if (!tmpbuf)
 			return SDIO_ERR_VAL32;
 
@@ -189,8 +187,6 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 		sd_read(intfhdl, ftaddr, 8, tmpbuf);
 		memcpy(&le_tmp, tmpbuf + shift, 4);
 		val = le32_to_cpu(le_tmp);
-
-		kfree(tmpbuf);
 	}
 	return val;
 }
@@ -223,19 +219,17 @@ static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 	if (shift == 0) {
 		err = sd_read(intfhdl, ftaddr, cnt, buf);
 	} else {
-		u8 *tmpbuf;
 		u32 n;
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -ENOMEM;
 
 		err = sd_read(intfhdl, ftaddr, n, tmpbuf);
 		if (!err)
 			memcpy(buf, tmpbuf + shift, cnt);
-		kfree(tmpbuf);
 	}
 	return err;
 }
@@ -326,22 +320,18 @@ static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 	if (shift == 0) {
 		err = sd_write(intfhdl, ftaddr, cnt, buf);
 	} else {
-		u8 *tmpbuf;
 		u32 n;
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -ENOMEM;
 		err = sd_read(intfhdl, ftaddr, 4, tmpbuf);
-		if (err) {
-			kfree(tmpbuf);
+		if (err)
 			return err;
-		}
 		memcpy(tmpbuf + shift, buf, cnt);
 		err = sd_write(intfhdl, ftaddr, n, tmpbuf);
-		kfree(tmpbuf);
 	}
 	return err;
 }
@@ -491,7 +481,6 @@ static s32 _sdio_local_read(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 	u32 n;
 
 	intfhdl = &adapter->iopriv.intf;
@@ -503,7 +492,7 @@ static s32 _sdio_local_read(
 		return _sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -511,8 +500,6 @@ static s32 _sdio_local_read(
 	if (!err)
 		memcpy(buf, tmpbuf, cnt);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -529,7 +516,6 @@ s32 sdio_local_read(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 	u32 n;
 
 	intfhdl = &adapter->iopriv.intf;
@@ -544,7 +530,7 @@ s32 sdio_local_read(
 		return sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -552,8 +538,6 @@ s32 sdio_local_read(
 	if (!err)
 		memcpy(buf, tmpbuf, cnt);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -570,7 +554,6 @@ s32 sdio_local_write(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 
 	intfhdl = &adapter->iopriv.intf;
 
@@ -583,7 +566,7 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -591,8 +574,6 @@ s32 sdio_local_write(
 
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -880,16 +861,14 @@ void sd_int_dpc(struct adapter *adapter)
 	}
 
 	if (hal->sdio_hisr & SDIO_HISR_TXERR) {
-		u8 *status;
 		u32 addr;
 
-		status = kmalloc(4, GFP_ATOMIC);
+		u8 *status  __free(kfree) = kmalloc(4, GFP_ATOMIC);
 		if (status) {
 			addr = REG_TXDMA_STATUS;
 			hal_sdio_get_cmd_addr_8723b(adapter, WLAN_IOREG_DEVICE_ID, addr, &addr);
 			_sd_read(intfhdl, addr, 4, status);
 			_sd_write(intfhdl, addr, 4, status);
-			kfree(status);
 		}
 	}
 
-- 
2.34.1

