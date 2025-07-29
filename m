Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A535479C0
	for <linux-staging@lists.linux.dev>; Tue, 29 Jul 2025 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753798410; cv=none; b=QTVkCigYKrFhhov6FPD9PdCXdG2c1tAJlo5VlIxS2IrNlBa1mTbqLMzrxJDwvA165J/ib+3GnjrNmknFP52xCqInIUxGziytMk1V8NblLFZ7IWydd1BI0CM6odtxtkYDJqICmV6S+L+Ie7rdZriMaoazk3Z3NB3cKVdXEuz0mbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753798410; c=relaxed/simple;
	bh=FjA+c9Z3l+4QM+NHVNGoenTDXDVzESzeLLANK4ezG8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWhrbmv1/A1x0tk7hER2TTtgxmniwN4yPhkaJ4ZbE+5z/Ox/SYXfwcCsio0VEqfqhw8c25jxTNe9hB59PYVGvb8LH/LS1ScmeWj/LVtaJDzuiQPlJDG3tARFUdrl6ITRH3N3ggCcmxtn1s9dgqbNsAajFuEzsRWnWp0p1u3kZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff9pMFd7; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff9pMFd7"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b3bad2f99f5so922873a12.1
        for <linux-staging@lists.linux.dev>; Tue, 29 Jul 2025 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753798408; x=1754403208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yitw0gBISuOZ2v41sPRu4k5vKVXgFczbihRYKhefvpk=;
        b=ff9pMFd7reeJhFzxroyrMuKYnx8Hb+Gjrmh8fw8D2awq66QgNJVe8gINIo/59uJTPd
         diDNdwN1oPZEsNbmKqO6386GuNmvM92QHMpBg6sCzTIEmqJ35e0iFxvV7GDEOrEz/GuF
         QebmssOTQWiWudd/kqjIbDDJAfoAZ4zbK3pD4sVdJCRUjmNwmJxNrsJ2rm0RIp/em0+z
         op5uzLBCWty7i/Oct7MGgftBEW5HuzCOw2rz2YmGglZU0bYHCj67GfNb3qw70Y6yAcnC
         K6TkSO1OZhphjqBusQ2tn7DmCv34AS1TLbDxFLd8VzBupcBBZnM+uJ2JMjbjZu/Lm3kh
         XVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753798408; x=1754403208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yitw0gBISuOZ2v41sPRu4k5vKVXgFczbihRYKhefvpk=;
        b=PTX7SNc3LV4LF4O+csz9pcF/antJ+EmArhhz037a9leMG+34AM7HZYs1BMsdNY0I8i
         3Gpk4A9YQIYvb4adhhCcFD1cYTFDIKifGSLt84rcuVV/Tj9PyVTERfcBxZvAU31Ma9YL
         h0Ksv5Pl2wENjIdIZYmxA9d25zkMSYPD1/H5gSnBSl8RRANaykPEIuY0VIR+P3fSwrwt
         ETp73ljyetxuLK6gGq8552qgWlngwSV9z757p0HBv1flnpX5DCSJbleRcOS2s+uucC9n
         EGX4hOXrpiF/etu+6+9O7zp4jj1vO87TqJHBFe7259IQf3H/Cmab840Ff+yWzdGLff+y
         Orng==
X-Forwarded-Encrypted: i=1; AJvYcCXL5lCVgtgH4ne3HHIgoP2zmWgspueA+gVeE2Jln5Q1mtL9tkKI5WhvIWcROWsHUCeurhmwzANwVKC9z6hm@lists.linux.dev
X-Gm-Message-State: AOJu0YzlTdLL38dKsIPIXqP6yjpIkTZBOCCSsroHpht9cQsXWrZxC+5n
	jM/fsU6ebcHumUz4y//nYPsEEWYhwxFvaPlPgkCUAoOAcyVbgg773ih5
X-Gm-Gg: ASbGncuoBWSuyE1j7c9MtH2imxvyhdQ+Xg6AZqAEvRJHo9aQRs1rJroyImQe/s18fUo
	43N4ylRDwlJrXoUrRa+umScEVsdt0us1O8JQ5nrJT26txqfK1qsdqwkYlRaacAXHPlI+UONLbz6
	c+G2TgVR9L0ASuDJEvLqPuRGA1z/+KieccfrIBEGb+duiei72dyu8ln+JyM+izk7f/XuXMQuISa
	JlkLmn9YIfq1Quj/xYJ6OPcMQPds6bNI7d/lOgzOzdWZDDJx1ev+NFDl7yAv++RHenTZy4CODkp
	KFxTcvF+ZJWx+DvujKJksNy9crTqip6Ahwjj+14IPMQT0IZAtbCiAL5hyOE0d4qHMXaRPjW+Vql
	GaM++Slt9Cs1Ss9/TyY3UJqxzOlDFzAQU5g==
X-Google-Smtp-Source: AGHT+IEh8uGgxD/fdfhuPyfTdSWJ4/hYFFr9SgxPTOKH4o1yLWj1vXkRgP+kd9clAvFUmaIRreFW3g==
X-Received: by 2002:a17:903:298b:b0:23f:fa47:f933 with SMTP id d9443c01a7336-24063cd35b2mr53089125ad.8.1753798407855;
        Tue, 29 Jul 2025 07:13:27 -0700 (PDT)
Received: from localhost ([2409:4089:1091:3d13:b803:71:1df8:9600])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240469a8084sm36273345ad.79.2025.07.29.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:13:27 -0700 (PDT)
From: ashirvadm04@gmail.com
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	sayyad.abid16@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashirvad Mohanty <ashirvadm04@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Replace magic numbers in rtl8723b_InitBeaconParameters
Date: Tue, 29 Jul 2025 19:42:10 +0530
Message-ID: <20250729141224.16013-1-ashirvadm04@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashirvad Mohanty <ashirvadm04@gmail.com>

Replace magic numbers 0x6404 and 0x660F in rtl8723b_InitBeaconParameters
with macros TBTT_PROHIBIT_TIME_8723B and BCN_AIFS_CFG_8723B, respectively,
defined in rtl8723b_hal.h. This addresses the TODO to remove magic numbers,
improving code readability and maintainability per Linux kernel coding style.

Signed-off-by: Ashirvad Mohanty <ashirvadm04@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 ++---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 2 ++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 893cab0532ed..d6c75854f27a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1197,8 +1197,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_TIME_8723B); /*  ms */
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
@@ -1207,7 +1206,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write16(padapter, REG_BCNTCFG, BCN_AIFS_CFG_8723B);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index a4a14474c35d..5b4e303e20eb 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -71,6 +71,8 @@ struct rt_firmware_hdr {
 
 #define DRIVER_EARLY_INT_TIME_8723B  0x05
 #define BCN_DMA_ATIME_INT_TIME_8723B 0x02
+#define TBTT_PROHIBIT_TIME_8723B     0x6404
+#define BCN_AIFS_CFG_8723B           0x660F
 
 /* for 8723B */
 /* TX 32K, RX 16K, Page size 128B for TX, 8B for RX */
-- 
2.43.0

