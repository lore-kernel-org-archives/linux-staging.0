Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1174DB54F
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621634; cv=none; b=avLejWRTHi3DqyfS3uzoGKz29lVuM4XXHpsuCVP9P7k1jktKgMetsNfveayoe3IRyIfFNsvlYYD7FEekBJkzBcYKZafqfVkEd902XIcmJWwp1euW0kqXD6K/C06++FAwGRuH7BwnSl8yn6DO3hdBkUT0T6yu3w9HEsoqOmnenEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621634; c=relaxed/simple;
	bh=m2N6PS2o3ijdlyT1ow+eTVvNFaNxn+t39uG7mDVKi+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJR5+O2p7X04FmMKq1Br1uMhuBsQ9xerZw/E+SiIONA5BWCXyYALFO3k+CKv7O2RI/QMzKhj9SZvTnJpq9mE4ORFyf/WUCPBe4I6rOFrRZMpRwIYOUFQOoIpfH1BV04g9ttUcSvMOkoBGbNXIek+HhStwrOU/+T2WY13Df1FW9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc65iC0f; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc65iC0f"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15ba5b151dso27262166b.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621632; x=1784226432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVdr+ZLFvLu/KzDYzR1x1AmJ3mOAVX/tIPJD2OuOBxM=;
        b=Zc65iC0fPMMIcpvkfD9GuMarYzqy6jrdJ2GJHpAMcnon7LKoLQ/d2pHyxt6tWojCnC
         k2tPr0fcl4NVOjVGhGp/grMVtvsaHAwHqFzebbG8duTwihO2wof6xBJ0ioKKz4ct2ESw
         EIjEi3FbLE7CvuYJMxzEVtRg8OBCDJZw5cjSGy7TUI/3Y/mJkQfAIof+EwC8kHyP42LX
         vC+TXbsG1mj5LmcA88Kdo+JdXKMyEbbviwgVvF758y/qGTjqHPMJK2gTpm6ZWvtCIu/S
         m2MU11+NBiyK04BXPsrZG8LVmqfy8Uqqjs3/AkUSfQHrqFnfHeZFuYu4iUHzqf7z7+4K
         PpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621632; x=1784226432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVdr+ZLFvLu/KzDYzR1x1AmJ3mOAVX/tIPJD2OuOBxM=;
        b=lWnPlWKpmkcKwd2lvEUC5C6EfWSojo5RwTupCSXrOX4V/cODrPnRnvDnDTTC4Pp5n6
         kXI8+Bs8Ycx0o/LWt26Vm+2YIpWohEUTy/r5L7G0j35ti5IQRjEJrQNSYvVEl2bX5BpP
         7EsnVmdyi0Fh4pnauqiCikdUU0vLGDo0v/99+hxahwJo2oMm+J8r213lSVCbnR+g5L8f
         T1MCRMD4TDPLv4PJ/pKZJQ+SUWTXY9KOpNb9e3EtbwTON16rQf1iKJiM6kbYKXhpbDhT
         dIOFyj0iD+blt/asiR4R1cY8M8kntX/NMLJydmzRinMkSYlYMkBnf5/i+g+PsNSBYilI
         6DnQ==
X-Gm-Message-State: AOJu0YwuJfdncm2nEc2Sd+IPhHKibCkCVqVk6caFIx6WDaSV/UH6hIIp
	lOtPWcfcQH++j8J59Jovyeic8OwseiD24POug2IIjPkIhG+/CRx0/QNb
X-Gm-Gg: AfdE7cms7JUIt7iGzbCTykx1GdrTcwFBgyzOHgGJQMtwctYCWqhIA/hzXOZA9taSzAI
	mpk7ck3/nIvcFfuVPk1cW399kOAOqLwHF4oArdHxzXsRdmSMHWxTgrWW5ppoxE/YGvX/Bimc6kS
	SJ5lCxR0+eFDccOPCziS+i3iBoA9lFE6tssSr9BUvOc4qachSA7vz0Gc1Zu/TF1tyepWo8W+k0C
	E6wCkhA/3wA+ywy4R0RpOnEDnV8cX51aExnb6ZgxziwYjzB3LGx5GWB6DI4P4jC6D+b0ndICEaK
	A2Gl2ykjKJUHlCyZxav87mlbLJhox/MIvUF+BsolGgyk3MREs5xAf4FyaNfV/MeHsZUbinDYVOt
	/m85FSMN5LxZ12qn36o7s1szFtugdikGaD3xYm6/qk172geLa6rXJ4a/flanleCKsPHk0tc9KT9
	YJN8opTxz5AA==
X-Received: by 2002:a17:907:9491:b0:c15:f26a:3438 with SMTP id a640c23a62f3a-c15f26a7e78mr109764266b.24.1783621631675;
        Thu, 09 Jul 2026 11:27:11 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:11 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/9] staging: rtl8723bs: remove unused 'PolarityCtl' from struct hal_com_data
Date: Thu,  9 Jul 2026 21:15:09 +0300
Message-ID: <20260709182627.16327-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709182627.16327-1-nikolayof23@gmail.com>
References: <20260709182627.16327-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is determined by the value of a bit from the hardware, but
the variable is not used after assignment.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_com_reg.h   | 1 -
 drivers/staging/rtl8723bs/include/hal_data.h      | 8 --------
 3 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 58c9b5de4ae2..b7478f5f38f1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -838,7 +838,6 @@ static void ReadChipVersion8723B(struct adapter *padapter)
 	pHalData->MultiFunc |= ((value32 & WL_FUNC_EN) ? RT_MULTI_FUNC_WIFI : 0);
 	pHalData->MultiFunc |= ((value32 & BT_FUNC_EN) ? RT_MULTI_FUNC_BT : 0);
 	pHalData->MultiFunc |= ((value32 & GPS_FUNC_EN) ? RT_MULTI_FUNC_GPS : 0);
-	pHalData->PolarityCtl = ((value32 & WL_HWPDN_SL) ? RT_POLARITY_HIGH_ACT : RT_POLARITY_LOW_ACT);
 }
 
 void rtl8723b_read_chip_version(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index 06cbc3f92baf..6aa95a10a0f4 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -590,7 +590,6 @@
 #define C2H_EVT_FW_CLOSE		0xFF	/*  Set by FW indicating that FW had set the C2H command message and it's not yet read by driver. */
 
 /* 2REG_MULTI_FUNC_CTRL(For RTL8723 Only) */
-#define WL_HWPDN_SL			BIT(1)	/*  WiFi HW PDn polarity control */
 #define WL_FUNC_EN				BIT(2)	/*  WiFi function enable */
 #define BT_FUNC_EN				BIT(18)	/*  BT function enable */
 #define GPS_FUNC_EN			BIT(22)	/*  GPS function enable */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 2c630c6b5f97..ebbbc8e03d6a 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -21,13 +21,6 @@ enum rt_multi_func {
 	RT_MULTI_FUNC_BT		= 0x02,
 	RT_MULTI_FUNC_GPS	= 0x04,
 };
-/*  */
-/*  <Roger_Notes> For RTL8723 WiFi PDn/GPIO polarity control configuration. 2010.10.08. */
-/*  */
-enum rt_polarity_ctl {
-	RT_POLARITY_LOW_ACT	= 0,
-	RT_POLARITY_HIGH_ACT	= 1,
-};
 
 /*  For RTL8723 regulator mode. by tynli. 2011.01.14. */
 enum rt_regulator_mode {
@@ -163,7 +156,6 @@ struct dm_priv {
 
 struct hal_com_data {
 	enum rt_multi_func MultiFunc; /*  For multi-function consideration. */
-	enum rt_polarity_ctl PolarityCtl; /*  For Wifi PDn Polarity control. */
 	enum rt_regulator_mode	RegulatorMode; /*  switching regulator or LDO */
 
 	u16 FirmwareVersion;
-- 
2.54.0

