Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654C2BE629
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604115; cv=none; b=kCpuYo48Txvgd/2qZhbYS0g2yAhjkBpogMxQl3AvjzqLyRxc2eOZXsx6ECUOkDbvyWkueUftKW/qYPHMq/zsEbRiG9a6htkU390RdO+KW4C9DDaTq4zFy+I/u/A3A2fE49O2Ugg4im8UbOWGPLf6sN9HWWCuzoCGE9cfs4lG+/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604115; c=relaxed/simple;
	bh=rAExqxku3fpzgVaq3gFsYfqCvlE+NBd//fV0rFUcs0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7MJe35jvobUHw1Bmq5xGJQOQdnCmvqfRvzoVt56svOl74aM20p/9OG5sMboD2HguqYKB4K1BVxECMyj1c/VSGbAgdOu9n9PyFPiJSCgOKOHtAc0L1rbxfvGdRsECrJI/tJ3IJrrqAK42X/z6mK271RRenE7pV1KMhd/MpXalLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alJJrJsM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alJJrJsM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0c571f137so1085579866b.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604112; x=1753208912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TZKOmxyucIiBwjGXcjcpB7skbLwkFD749lNf87jbsk=;
        b=alJJrJsMV+DIaeJ2BO3x7feGWUZ0XDtSvn2yJvCBvmZ/XlyuLZopHxUgu08isLscYG
         HPYOgu8KelowQqqDzH1da+utQ17CIVLthbUMbqKPWsckCMkbPOpPmBRdK2aZoHi07ShL
         o8cDJF/6BSN0CloimQDGdhT/y/B3T2/Ciing0JtEfiOU427+b2i1Q6fe/a1ppkEyRCzL
         RCKaf/CV7TLs0/SonM8cg7IuMYLlVTQUUKYQnhtilx9caZMVNGtypcO+SgT6IKFTMOK7
         VOGqh7RVmjw8WH+WGKvHrTILMijBvC60RvSXxPQzA9lHFokhhgt8JJkSfVqZReKKznyt
         +qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604112; x=1753208912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TZKOmxyucIiBwjGXcjcpB7skbLwkFD749lNf87jbsk=;
        b=YLSPpyveT2pnKBWW33A1hXmFDt9Bd9KAaX+f40AIAuxxKZeKgUV2Sn9I9Sy/Ua6Wxy
         zNG031xSsQEQKddF6gUMQMeIcozzK9pWZCoCGgfAqjNpGA9U9Ty4ywXzUBuOSsukghgz
         NK5o14cNWeqalQ5DYQC5bwYAMGMyAy2w4ge+KWURS/7Z84rK/zZ6YyUvulcnELUr7DWw
         9YsLTWIcA5UMaK/3Ur4sik80lI2cOQo78jNMWucGYXijDHF9Dgc8bNu9G/i304PqNdd5
         LiCY4vEC1SX9HuTojLdHE0GdJt2gJJ87q5CN2jMMw9pNjuQ9DLAsnvX87kPTthEfxgVH
         FiFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVRGsar9KdGufLZ2Y44dabpVx+GRzRDrKXLsFCQJe5sPY9kRtUWcc8BzlEe/UedhMEtUEzyzGbXR4yN+hs@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzf9daeNH593LrWdO+45ySbPTY3/1chLMD0fKZL6EtTF5buvtc
	Hu5Y/+AhYGBcEDUaCclwciRmIlcEcUqlQV+TJbWFi4CNIVPwj0gKhK9C
X-Gm-Gg: ASbGncv22IkKGqCKEMXFP5C29K8vXKl53Lnf6Bnc5WpsGAKWPPu5zPWys5CxZtoI9oX
	5J30AZS/9+azT0MDj47dskMLJ2vqvHWqWdKQm7hJ43zUO28Q6rHhrq5BybqZfkdQuxXET9XWusS
	Fsm7SWge3cozFYHaD2tqiACxHgGvyS36f1Ft824WMvO9/diVr9jv7ovs3ZTEXylKMnG0NxPY6e1
	UGYLB+A4gI0W0x7sAwacVq/Llgx/N41YOmjbe4wwap5NNQd1pkbQdGzQ0HeX3OgVTujuqFDGFME
	+rDevN+NBV1JAwwZdWO9DDyUtol+veoRY+bpgKVp3qJLR+iHUADwbDBm2jPd1wsceE2onhqW+eN
	rdYn2M3L5xLNfFQ6oS5QdDo3mYPyGFXNpmQ==
X-Google-Smtp-Source: AGHT+IGSnG9IOxyVXkA7R8/Qogm83gwm3iuaSrJojr9FCLdL/3fM8Gwasfk6/jvEkT61eycE1U4GqQ==
X-Received: by 2002:a17:907:c248:b0:ad5:3a97:8438 with SMTP id a640c23a62f3a-ae9c9b5b350mr48423466b.41.1752604111582;
        Tue, 15 Jul 2025 11:28:31 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/11] staging: rtl8723bs: remove function pointer hal_notch_filter
Date: Tue, 15 Jul 2025 20:28:06 +0200
Message-ID: <20250715182814.212708-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715182814.212708-1-straube.linux@gmail.com>
References: <20250715182814.212708-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer hal_notch_filter and use hal_notch_filter_8723b
directly to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index eb34e39f3c64..a168852cb6c7 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -292,8 +292,7 @@ s32 rtw_hal_xmit_thread_handler(struct adapter *padapter)
 
 void rtw_hal_notch_filter(struct adapter *adapter, bool enable)
 {
-	if (adapter->HalFunc.hal_notch_filter)
-		adapter->HalFunc.hal_notch_filter(adapter, enable);
+	hal_notch_filter_8723b(adapter, enable);
 }
 
 void rtw_hal_reset_security_engine(struct adapter *adapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index a6eab2819535..b746e3e05d16 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1267,7 +1267,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write8(padapter, bcn_ctrl_reg, val8);
 }
 
-static void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
+void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
 {
 	if (enable)
 		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) | BIT1);
@@ -1316,7 +1316,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->xmit_thread_handler = &hal_xmit_handler;
-	pHalFunc->hal_notch_filter = &hal_notch_filter_8723b;
 
 	pHalFunc->c2h_handler = c2h_handler_8723b;
 	pHalFunc->c2h_id_filter_ccx = c2h_id_filter_ccx_8723b;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 3626e1505848..72ae4cdcf0dd 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
 	s32 (*xmit_thread_handler)(struct adapter *padapter);
-	void (*hal_notch_filter)(struct adapter *adapter, bool enable);
 	void (*hal_reset_security_engine)(struct adapter *adapter);
 	s32 (*c2h_handler)(struct adapter *padapter, u8 *c2h_evt);
 	c2h_id_filter c2h_id_filter_ccx;
@@ -282,4 +281,5 @@ void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
 void Hal_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type,
 			    void *pOut, bool bPseudoTest);
 u16 Hal_EfuseGetCurrentSize(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
+void hal_notch_filter_8723b(struct adapter *adapter, bool enable);
 #endif /* __HAL_INTF_H__ */
-- 
2.50.1

