Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2792381B02
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776006417; cv=none; b=HU/XnKjx2jb44bdZQtBcuu3RwaGFwtz0AFshzwwFdsZLPqet1wgfIEU4eUNg7I3Pd30hVUSsdP8+mwkRDf+p9Ld89WC/T0k0q6WaNtixLnui2CN7m6YIGxwC+a6MXkHCw59RP5tKswj+57l1iUlUKWcrDRMQAFItWR1vVSZagkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776006417; c=relaxed/simple;
	bh=eHv3YTjWv/mIsebSNpk5QiVfnZC87aVxz074uimhLfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCZzlOacm4VzYB/0OvBDS+OWaBZhJudwfprCDRQCH9lufMC4gKsRJ5TjCHssEIUylJxeJ9UMd7Kvh3N/ZFSgwHNa0/3DOanFY3nGJtiU/ck33ZMCabjHEvN9fe+oxr3aQ7Qlju5b23dziu7ztZBuYq8RUCyqp5yDgOwz95uBVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8IpKirn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8IpKirn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d72875729so305121f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776006414; x=1776611214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf6t47xBOgb3TbGaH3co5QzaUmGuwRdKfqKS6s/SN8U=;
        b=o8IpKirnOOOzKMgi93h6+Avi2mTAXuUF+Xm2Aau3CP+C3MGdww6CIUvRzyEx3+8QNo
         lGnrdIehPA3dsfrOx7mG+/sywE0cPv8/a26SIX1sCmqH/H4o+y7sOMpiJu4rHCCbEWOJ
         iDXfGSuQWHxALl2yLS75K9Ad8ptY3t5sh7zdora9cpDG0kbHx085TyKDF5Ps7SsBjs9J
         IaFzwp6div+V2i88/SxLxwj6Ez1YisIhVWlVvjpr0SsYP4g78O36Yzkj4Hjq6ciOhkte
         9RfI9iIz/80UgvmZ3t4HWRRpvTwpvs56d0oKLg0uuXa0CPP2NDPdBveOMOMPaOmD93Fo
         1hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776006414; x=1776611214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf6t47xBOgb3TbGaH3co5QzaUmGuwRdKfqKS6s/SN8U=;
        b=ZM8bkt/sgmDZicvjhpcnjW5Y+fU+hEn/oSCs1p0YQPGrH16iMyEzpiuWsDlFBNcWzM
         se9AMVAuwpWZN3Qmav70joqieoAzYP4L1iaQMh8Zb5qqXOA9Ghorpg63fWMW48+Z0Nu1
         BgG5qkwRgQGqqPpH7gRMdRU2ciWu/4GVg8pPHHeO8KvrA2xi7CSaGEwK5YqzQNT7jXs5
         DvLmt7qyoI3CPUrUC6Mt4isED/u158XHv5rcJb4zylc95Pmx6Sn+wSD+ztdXc1cBatQ7
         /RDkKAJ4Y8kQV6sljOnLh0qEcOKCRBfqq8OVZw83vLGsQ0agNN7vwV/uTGNtln9wr6Jb
         ZG1A==
X-Forwarded-Encrypted: i=1; AFNElJ8lIca2ZlkVJwEYzC8TjmgQkuQayQBGQb8Nz0SZu0rbOM7bkksUyDJ7tDmCY86HAPvFthT6CwZDgqg8EuGq@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyrauv9ibf3q7nKMX+MG0hBsQqdnr48YcU/3dLPv/ANiOSFIcc
	1AZR9kmIYDpq1qriYXcIpEEES9dH/Fd6Ny4K38UMa/yWhcLk2sLW3ifJ
X-Gm-Gg: AeBDiesLHKPzgXFTX+nKrqkydBBw+UapA8bsT6O1Q9Mp3f9/gOOtrnWzUSuc2hi5gXu
	6KGS8OjlCshfkKVZB/rNveaXmHE/KWsqfml7MVSehr/h1QqVEWbCwGYG+ozw2qUTmoBAfwLAjMV
	g1eVVSr6XC0COitl9MqxCRDfGXBdoJyRdU+pbwISZXPhVo7gZGbjQ1AKr8++xKMogiayuXRH8zM
	Z6o9fM2nSv2NJN2bGrZZ4cRFqrsR1FNh76RXQ3qYUL/8b2Xlw+iW4AVNQ/052NBkG6h+bMHdcCC
	bZi/+xXkftHtX37oBuUtXSp063DI+m1OXghZn+YVOhEPC+tklNezbJxAU9WnsCYai1lm23b6p6/
	GJT5Gq6M7nFZSvQ+eb5/iC9aRL5q+9mFT4nQzO1NIwijh/9sNi2ET/vYiJul/+1cWGz016V29p2
	eFZ14ZT7T4dbWmEJi59I/RIusi0AHmZdx2fflm91DJHxGR9RJEc8nzArc+13/NiHvXcYtZ0qOtz
	xPikFsu+YBY
X-Received: by 2002:a05:6000:220b:b0:43b:80a0:d92 with SMTP id ffacd0b85a97d-43d642bd578mr13417522f8f.45.1776006413800;
        Sun, 12 Apr 2026 08:06:53 -0700 (PDT)
Received: from fedora ([2a00:23c5:4a5d:3701:b24c:c1d6:5c61:a2ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm26760351f8f.34.2026.04.12.08.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 08:06:53 -0700 (PDT)
From: Josh Hesketh <josh.hesketh@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Luka Gejak <lukagejak5@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Hesketh <josh.hesketh@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: remove commented out dead code in sdio_halinit.c
Date: Sun, 12 Apr 2026 16:06:31 +0100
Message-ID: <20260412150633.12071-1-josh.hesketh@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented out dead code that have been dead since the
driver was introduced to staging. Code can be recovered from
git history if needed.

Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
---
v2:
 - Rebased on staging-next
 - Split into separate patches per feedback
 - Removed commented out dead code instead of fixing whitespace
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 24 --------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..4d74b14c3cd4 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -46,8 +46,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	u16 value16;
 	u32 value32;
 	u8 ret;
-/* 	u8 bMacPwrCtrlOn; */
-
 
 	/*  all of these MUST be configured before power on */
 
@@ -69,10 +67,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	value16 |= EnPDN; /*  Enable HW power down and RF on */
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
 
-	/*  Enable CMD53 R/W Operation */
-/* 	bMacPwrCtrlOn = true; */
-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
-
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
 	value16 = rtw_read16(padapter, REG_CR);
@@ -359,7 +353,6 @@ static void _InitNetworkType(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_CR);
 
 	/*  TODO: use the other function to set network type */
-/* 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
 
 	rtw_write32(padapter, REG_CR, value32);
@@ -486,9 +479,6 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
-	/*  Tx aggregation setting */
-/* 	sdio_AggSettingTxUpdate(padapter); */
-
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
 
@@ -640,9 +630,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		return _SUCCESS;
 	}
 
-	/*  Disable Interrupt first. */
-/* 	rtw_hal_disable_interrupt(padapter); */
-
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
 		return _FAIL;
@@ -661,8 +648,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	rtl8723b_InitializeFirmwareVars(padapter);
 
-/* 	SIC_Init(padapter); */
-
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate = rf_off;
 
@@ -745,11 +730,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	rtw_hal_set_chnl_bw(padapter, padapter->registrypriv.channel,
 		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSET_DONT_CARE);
 
-	/*  Record original value for template. This is arough data, we can only use the data */
-	/*  for power adjust. The value can not be adjustde according to different power!!! */
-/* 	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
-/* 	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
-
 	rtl8723b_InitAntenna_Selection(padapter);
 
 	/*  */
@@ -791,8 +771,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/* ack for xmit mgmt frames. */
 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
 
-/* 	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
-
 	{
 		pwrctrlpriv->rf_pwrstate = rf_on;
 
@@ -1080,8 +1058,6 @@ static void _ReadPROMContent(struct adapter *padapter)
 	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
 	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
 
-/* 	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
-
 	_ReadEfuseInfo8723BS(padapter);
 }
 
-- 
2.53.0

