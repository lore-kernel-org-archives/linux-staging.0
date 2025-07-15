Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432BE28F948
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604113; cv=none; b=d6T7pmOTjYQQshnM9IcI33QadHQ6GSR9ipoSQ1dRUwSUWY60mIQLSJz80urt97Vj/V/JRFZdfdgHuOerpmojDKGKkA6FKWtGKBgriD++STUCUIVg3p0Td4VGo1UfZF4JvXdmSVCyLVY4OSOWh4agLW7gOgrUeFtFQl6fwDqOr1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604113; c=relaxed/simple;
	bh=RGMQ8EJRQNAP+O0nR/eluDRpL/DwO8M7+yfSc7ut35w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izzRoGcxYWyu6rwcFcCqE8xkjEsolNYc53HA/x7RmujZ0Xgj/tpF7lYoi3YX73KQ2z8pis1ul2oQnITd/1w34XXDFCAYYNmwg9+5fyp8FSu/L70tvbOzDIMBkakN/E53T+EBrFIvEwHLAPu6GFF7hWNIKSdtIhROr8otKHseC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md29SW8E; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md29SW8E"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae35f36da9dso1185512466b.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604111; x=1753208911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMmjaIlR4ZenTaxCD2MM6OSgv9kE1Hp4WFX2rahkbZw=;
        b=md29SW8EfI2njHPrqSNhHfd2JjE7so7oKW5QlF+x3eFjBGXGsFbiRL1Ds0CDck4Xai
         slZcuplsUou/7y4vYm4OTzJEJm2RgyeV2JUQtlU8sIgirHOVZu2Y/EvAT48zdfFV2PuH
         2buQFTwUTYO1Jkj1/6C/AH2jmEs3Upobh+dxWHbQYhIR3QraQ5dL/IZQzmbS4Q7YhdnF
         bAC3Gzv+l5ciN75Bv3dniJJYPHpuAAlLfu4NOS9DZ3ALc+2dLk8dHPlNJ7Z2NL//Mekj
         ELudLhzuBfgX+qZ8XvRs+o7b6yrTV2W3/+5/F+b60Fyg1DayXRqN0Glp/p7SZYw34TJN
         G+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604111; x=1753208911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMmjaIlR4ZenTaxCD2MM6OSgv9kE1Hp4WFX2rahkbZw=;
        b=HN3zbipxDFj/8HK6GeU4BTOtW0upnBMznuhw05x1MluoyOa9hvwljI/57rS+yeC2dZ
         6ANw7xZSHW5ws/+ye4B1Bo85Gu0EZfBN2noXZ+WOIleqCGYShtHZ2fE26Af7/YA1G2Ys
         z8X567nRhLoQq4P1OEjUnPGplTaYBCJDSi506K6MKKq+bOghkhL8AIv3uXRT6zZW7x14
         rcQWvbM84kv2+ERO2+bEAJpTmPg3Alu3sA2urBxJtf6EBAJtjZLBdn4X3uM4zjD3QJbb
         2X/waVvwxG+5NN4XM3Pzmj/t6/X8q2baaZ6mJsVkz+UK/JfXvU/cJMJbAB0knlP1aBF1
         3l+w==
X-Forwarded-Encrypted: i=1; AJvYcCXkJ5m4dbQ789qIhO7P9+HHDXH8rynVL9pEnL0r+cMJDm2+LjMxDE21+igUORT+unJYloIL+GGMVXUePGcc@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4kp/vG1W3cfibNojIWlOMELL3KH3hFth/OEPQ71pAaGR6X2wk
	VwiJ5jQVXJk6ejc6ZRkK4XGbmB8ZvKuvgKJt39QJryXOzwRlI6Uw1izs
X-Gm-Gg: ASbGncv/W1RdlOjChWMAs5W65UM95Oc0Hs8tH3jMIGobAl9ilM5D/6lEG8es5OajsDa
	NNnkrP1kf0QI+ImPEgrY8C4Ni2GFCFU1UWhltBq7AqlPa1ZZM1k38W4EmPcgyw/YWd/jWVjA/QG
	y8snRbJtBdHFxoLo5i5/YZI+W9s2XnpMBhMs1K4/NuBcizLMv3cvWlf+IAQYknoY7H67LCBU+4E
	SIhpqctzH35LtBhmmeZpDbjslkTWLirZXU3tMWrbKdTgCnJ1pFAso9sUQbdEKXfuqFs1YQOrrcw
	Ekfa3YU9yAfIn3NDfZTQrq6Zb/6qy2XMgdrIC59Kb+joH1A6CwylrmHv8JsUP/dQzi0YRIwtLdG
	K4nyALRMi54RXQmx2XS49hlnycCYwCY7/6w==
X-Google-Smtp-Source: AGHT+IG5BvDjN1LsfM9YL+RrdxBZ0+b+WKjzMqa27BPTAumF3Q75BMkOiFaKsae3DdxTFNE9xviL6w==
X-Received: by 2002:a17:907:7b0a:b0:ae3:7b53:31bd with SMTP id a640c23a62f3a-ae9c9b18672mr57537866b.28.1752604110415;
        Tue, 15 Jul 2025 11:28:30 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/11] staging: rtl8723bs: remove function pointer SetHalODMVarHandler
Date: Tue, 15 Jul 2025 20:28:04 +0200
Message-ID: <20250715182814.212708-2-straube.linux@gmail.com>
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

Remove function pointer SetHalODMVarHandler and use rtl8723b_SetHalODMVar
directly to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 9 +--------
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 +-
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 6fb1e81dde42..84c64bd04598 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -129,8 +129,7 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
 {
-	if (padapter->HalFunc.SetHalODMVarHandler)
-		padapter->HalFunc.SetHalODMVarHandler(padapter, eVariable, pValue1, bSet);
+	rtl8723b_SetHalODMVar(padapter, eVariable, pValue1, bSet);
 }
 
 void rtw_hal_enable_interrupt(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index b74d916ebbe1..8b7816e47131 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1267,12 +1267,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write8(padapter, bcn_ctrl_reg, val8);
 }
 
-static void rtl8723b_SetHalODMVar(
-	struct adapter *Adapter,
-	enum hal_odm_variable eVariable,
-	void *pValue1,
-	bool bSet
-)
+void rtl8723b_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
 {
 	SetHalODMVar(Adapter, eVariable, pValue1, bSet);
 }
@@ -1325,8 +1320,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->SetHalODMVarHandler = &rtl8723b_SetHalODMVar;
-
 	pHalFunc->xmit_thread_handler = &hal_xmit_handler;
 	pHalFunc->hal_notch_filter = &hal_notch_filter_8723b;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index da4215841773..f9f169262fb4 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -161,7 +161,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 	s32 (*xmit_thread_handler)(struct adapter *padapter);
 	void (*hal_notch_filter)(struct adapter *adapter, bool enable);
 	void (*hal_reset_security_engine)(struct adapter *adapter);
@@ -277,6 +276,7 @@ u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariabl
 u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
+void rtl8723b_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 void Hal_EfusePowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
 void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
 		   u16 _size_byte, u8 *pbuf, bool bPseudoTest);
-- 
2.50.1

