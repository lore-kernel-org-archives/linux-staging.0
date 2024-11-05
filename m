Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC56B1DCB20
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786131; cv=none; b=Bmmampn0EAYmlWtAH6CzCeNnwbrpxtumUDKQ80s7VD0EhjEVMEmF9FCVg8yISvX5zZkL7uZ2giGw+goGfEG+rl9APjL6edqM6rtgup1H1oaYVU9rQwV0lkKygoxziEEHtCL1r3u2zZO7PCVE1p5PdOShm4g0w/VUuO9pDMvaclU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786131; c=relaxed/simple;
	bh=e0qpNxPiS6knu42pKMhzUMqgsBTZxSaiUf7bg+iHlrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NriEI09vgB4j+NuEmvl94ey7yPsHaylotN1vEwjNx64ZYop9WVGIGZ1Elz0ckC445xKnxB0YkoejP27FnSGHgJgRHwlMCpxAC6zrR0SqhOBUDh4KxdTS4xSqYtIRqOA+rJP92qNkGOF3/y7J8vYQ9Y8S+mtOu4xM9DDYnuW0Nd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChUUPp6m; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChUUPp6m"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9acafdb745so867519866b.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786128; x=1731390928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ySr93uDv1RLoNp9SZC+4GP4tsUzCUfN27zMA1PYid8=;
        b=ChUUPp6mCJmTspp4JDUgaInvUNMcNKIbJchqGA+vZt6pOYMjYa8rig9llFzixgCU/u
         Cbj3SorxBwMvkYSjC7J/kluqcs2ao8vaWuFctFM2nEVqk0QlSWi3s3RF4EVcJUB1BeiL
         cdc/MEAJw9WKHZ5DfSCNorbgLWe1zMSmjOmVG8+3WnwCZl0nONn4pw/RAtEYoA+lszwX
         xBA3GU97xz6hAA+OMNIkyHjPBW4HpSWnUDwPKtjmgFI6sQ4H5yw5Jdx928lb6RkYkkPY
         tez9m/QL5Ji4yOt4+DhLcz78aIjfGdcv61shmaAcjHMAR0NkDfUjVd0u+1OVIOcYeyr3
         y6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786128; x=1731390928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ySr93uDv1RLoNp9SZC+4GP4tsUzCUfN27zMA1PYid8=;
        b=BrPJiKxDcujJnmqSpaf87xX9nmX7a++ce0vY2laW8YlV9wkuZqRcg+Il5RF25JGtHU
         B9s7AfklgYHl4ep8QNPe4Y873LmaU41hOQI1uNCDgq03M34mhpi3t1nKE/giutvz2FDo
         JA4+Vah/DzcL5p9Ex0BW8D1KKrINp0EXYZEij7wuQE5h5qcZW9TZMIClHflCq/yyEbl8
         c8luG0u9QF2SLzuM6L/pvQMZ32To0446iPrf+qYWZWCWPix/xHmWpiS4xhcv+owi3Ox8
         6yKkrfTBblBQ20l2+OEHhH8zEeV2/1+MXkF6lBwpgrJL0opXxD+rSY7KALXroB23jbEb
         oUZA==
X-Forwarded-Encrypted: i=1; AJvYcCW4WgXMhJ92ObFYipNSo5idLmQNCNmj7wGgCvSvgeNMexbWtiJh+Iqnt/mXdROw6x6AmxHD5nkJmw1VGvCi@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Ocr5cPyhShrNngUogbJvdV8rYXX9pjPxQL7PmOKZGezI3B6F
	3fgbPNbFhKjLQLdXFeRcdH/pqZaHOuDiZq0+U41UdgE8iM1IHXbk
X-Google-Smtp-Source: AGHT+IHS/vo13xfu+Zu7dmKKO4/v67IudTcp/WEOqVMqzf/cmcc0e7FEoRz2vRabvCkIqUleteR5Pg==
X-Received: by 2002:a17:906:c38d:b0:a9e:82d2:3266 with SMTP id a640c23a62f3a-a9e82d23c2dmr780516966b.4.1730786127936;
        Mon, 04 Nov 2024 21:55:27 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:27 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 01/16] staging: rtl8723bs: Remove function pointer UpdateRAMaskHandler
Date: Tue,  5 Nov 2024 06:54:48 +0100
Message-ID: <6e11b767faf44c2e95a05f3e1326d9cc382dcebd.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
References: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer UpdateRAMaskHandler and use UpdateHalRAMask8723B
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 +---
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 8b924961789e..397fd8fb3cb0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -221,8 +221,7 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
 		add_RATid(padapter, psta, rssi_level);
 	else {
-		if (padapter->HalFunc.UpdateRAMaskHandler)
-			padapter->HalFunc.UpdateRAMaskHandler(padapter, psta->mac_id, rssi_level);
+		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index c3fcadc634f9..20c8459cd6d2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1704,7 +1704,7 @@ static void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
 		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) & ~BIT1);
 }
 
-static void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
+void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 {
 	u32 mask, rate_bitmap;
 	u8 shortGIrate = false;
@@ -1744,8 +1744,6 @@ static void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_l
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->UpdateRAMaskHandler = &UpdateHalRAMask8723B;
-
 	pHalFunc->set_channel_handler = &PHY_SwChnl8723B;
 	pHalFunc->set_chnl_bw_handler = &PHY_SetSwChnlBWMode8723B;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7050520224ff..e882877436c4 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -172,7 +172,6 @@ struct hal_ops {
 
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*UpdateRAMaskHandler)(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 	void (*SetBeaconRelatedRegistersHandler)(struct adapter *padapter);
 
 	void (*Add_RateATid)(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level);
@@ -308,4 +307,5 @@ void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
+void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

