Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE391FEFAC
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786136; cv=none; b=UYtXNRQokU0eTR0RbFvgcECCrKJMZUEml0SeJ+0iXjrGBI4incYhhb3KvkC741c7OMlHXtkcLgps38mDoNTFaOTb5DRmP7ScjPUoiwepkdqLosnF1jO6IXPdGnt2lAxRsMIjMZij71rDgzdJFoVZzk6vNZULQaDCbaF6os4ICUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786136; c=relaxed/simple;
	bh=TTGVCQGQFr4YXw/oF7vJ03ZJrq7NoK3BksPLgwn8d7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/lwXAssDe/UyTROvmTM4XG1Zgn67LoqrpsSvJ0m3WeAKGzke5X/VjSpqpEBe89j3tcIO/a0ZXrVCx98hSBS5b7b07soQpBpPbBvq/EDVrJTGWMPns2lavkTWAYjwHWlz0F5Q+ki8y4MyE00POuPmeqGG6lIcoCCi3KdEbVhdLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egd6bX0K; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egd6bX0K"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so6627534a12.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786132; x=1731390932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEmkvwR7yW6qeFeP3oE/KKsUKrsSjbt8xvDhetIbI+I=;
        b=egd6bX0K81PWJMYnm5UO8nSYXFMP5ZSuNa8Ljhw8nBWIHYAuWd5mIHcK60YjbPO352
         sT3cTFbJwlP5wTH+Sj+i44VRBPdw29Mitn0EhRwDmcI5YWPZ9EMil/8/459ZPBC67jah
         /6k7L6nu1JLtMgeqQbIFJPAqKKJQRkiopW45E+TK+hupdb7vjiN+MEAcktg/Cs+OB/FQ
         W1uQzxj8aMqUsL+qGFmRidGM/on+XFpcvbP4Xrgn5jGllo3JXZeR/wufucjw+MBBvCyC
         Y5CO4dcHrBg7amh17FDlQl0weVSTzpYbm42xWzssCZVmf/G5+HDqcMzX3IjHacgvpsN4
         bB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786132; x=1731390932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEmkvwR7yW6qeFeP3oE/KKsUKrsSjbt8xvDhetIbI+I=;
        b=vpVtmAxngZ8zNViIbjWh7uz5phgBzg04nPhnkdNT4e1havkKISdoqOVGEfBG11jVga
         2pyIAGCD+JTa1dUQb+LZUnjCiN6O0DtlFzwDS2yE5MqpluWsnNKl857Ah6hV/y2azs1C
         Gg/m/Gr5mnOYS2AAY8H585LLUO5JY1wUJynLR5qFoQzfyyf8w1dPB/qaaa8yeWQNnfZ7
         yFaUrdLUKv1KNGSWY0WM/mtDFcqtXUpkKnM/XbkX+dlxIVdr+P+KlPcqh+vAnWNPr96e
         9RYcVkkBSIACBr328uQxaaeTBT7WWtCscfqydabBTrA9uoVttmXqxf811eLkBrinQPXe
         osbw==
X-Forwarded-Encrypted: i=1; AJvYcCXpp5z6GYqeQs4Q8BHPKyAD75MUDLupDAO9lu6pquvWJ9yJWpvE+Ebfopfuzc5rpwQS/mtaKsPuC4Z5y46R@lists.linux.dev
X-Gm-Message-State: AOJu0YwvIkXpXFsS58iUQCAlbRglvSnP5qFvTN2WHrQUmt9aR9voMyNl
	ECqRewwRH0Ri1FEJFyOJGM4l/OvC+uoezaD8fdO8TNpwEYJkAZEF
X-Google-Smtp-Source: AGHT+IGF+J4gLfIlwE3tvzL7ikt/ElZeoDGvUzwpQikuyHX6/KURvVRMaGHX2UxDxoQSI9EDaiJuQw==
X-Received: by 2002:a17:906:114e:b0:a9e:93fb:3d5b with SMTP id a640c23a62f3a-a9e93fb3e5fmr620376666b.19.1730786131490;
        Mon, 04 Nov 2024 21:55:31 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:31 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 07/16] staging: rtl8723bs: Remove function pointer SetBeaconRelatedRegistersHandler
Date: Tue,  5 Nov 2024 06:54:54 +0100
Message-ID: <4c5eb3b6e6ad0015c97d89df637253318c18b520.1730749680.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer SetBeaconRelatedRegistersHandler and use
rtl8723b_SetBeaconRelatedRegisters directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 +---
 drivers/staging/rtl8723bs/include/hal_intf.h      | 3 +--
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index f3666b26ffe1..483f0c163bef 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -297,8 +297,7 @@ void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 
 void beacon_timing_control(struct adapter *padapter)
 {
-	if (padapter->HalFunc.SetBeaconRelatedRegistersHandler)
-		padapter->HalFunc.SetBeaconRelatedRegistersHandler(padapter);
+	rtl8723b_SetBeaconRelatedRegisters(padapter);
 }
 
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 844ef4a80ad0..64eb1786d8db 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1625,7 +1625,7 @@ static void _BeaconFunctionEnable(struct adapter *padapter, u8 Enable, u8 Linked
 	rtw_write8(padapter, REG_RD_CTRL+1, 0x6F);
 }
 
-static void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
+void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 {
 	u8 val8;
 	u32 value32;
@@ -1744,8 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->SetBeaconRelatedRegistersHandler = &rtl8723b_SetBeaconRelatedRegisters;
-
 	pHalFunc->Add_RateATid = &rtl8723b_Add_RateATid;
 
 	pHalFunc->run_thread = &rtl8723b_start_thread;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 1e2bed9ebeef..2df25c1e7b5d 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,8 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*SetBeaconRelatedRegistersHandler)(struct adapter *padapter);
-
 	void (*Add_RateATid)(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level);
 
 	void (*run_thread)(struct adapter *padapter);
@@ -300,4 +298,5 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
 u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
+void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

