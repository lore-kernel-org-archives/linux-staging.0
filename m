Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE5371D15
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772649306; cv=none; b=kVRittFa3JAh0IifwOWlbK0I9YQAht7o5AR/ceVPi+OiANN0arVQS6E8cPyHZ8hxjMbepk6DMGCZMulo/Vm79PaTL3BWc9A+uKEMT+9vJ3sNAAdkQjPwlrmfNcZN425ZuRnJMkoZcXnnuLS6jDiAD9A8WxHtnNfp1dBlHiPO23Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772649306; c=relaxed/simple;
	bh=gnHZJI+zBfqrpsW2GY5wMc1ZeXyrpfrtWIYfjvg3jTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XtAsK2XYHvYY7RYzQfdUlQT+txCSlyNjbUOjDfgNRnBH2ohsKPLxBDmr4+90W4BjRiGDNYX8qOlH2zWob8uYlxSrZQpqXBiWBD5Sd0hw3HOH94OfeX8TRDb4xi9IVBfcM/cQ6S2f91qF6rqtTzMP8b41VFk5iIC8tFX3Q4Hfo6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQv7EnT6; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQv7EnT6"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7986d231b3cso96449527b3.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 10:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772649304; x=1773254104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tQONg2peemv23D1cemH3plGPd/2AxjDnuDqcEsP/l2Y=;
        b=JQv7EnT6xB1IomzkUf0nwrPvtBc+W5IlmvTc6Sziq+iIbSqfzPLBFmC8C5Os6MYRyf
         u+q+tuWLlUY2TM6z9sjxjecWHcVs/8AFN11OjRjE91jxGXjqisbKvZxRZYrefp7Woqpq
         NImQKoi3dcBshGBgTYdrN6xLgG9sgzncko4x86f3fruAGMAKKIuarUX80YaF0AQyq1ev
         V34N8AQC4Q+QryXgybCh2cgEcabtk2JI0JgoRLoCsMnVtUJxl0x2GfHwOvSuUXhFxO3s
         vDvxX7il+Kjp+lMQk7+IHlJXxftMgxqlLJ+Jj5oDqF2uwqL7OlbBnXB4xuifyZ4yTd/b
         mYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772649304; x=1773254104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQONg2peemv23D1cemH3plGPd/2AxjDnuDqcEsP/l2Y=;
        b=mvC2q7yeu5j9kI4gCX/6aYbaGQRCq1Xr1XZPG8iOC7ZniyoWe9inQvqsKtLuBu/3ex
         7wWx9argA1Nb/Jzg9OnuAfcGpgDS7CBdjGcZezCmPNpp04vnXOlSixwNwRklfRZZMTxZ
         eucUsCAeqQYeKk0CIaBh10NyDB6BvLVaPYjIT0qneBr1sL/mxjO3haxEw2/vVMKmGRGm
         +cZORLKP28L45yUnNuaXquJSlWsTqJIJ3RG2hQUtuv1BUhn2SdHdfL0D4tgPOyGpgZ8o
         r20E7CpVSZ1GyVHxn2wiBbaMbdkQRVnULKEQFBc3pI2/RZ65ffTLDfGXi5NvbUYa8hPq
         xKzw==
X-Gm-Message-State: AOJu0Yw/gb2WD6m/zLqqbpr4Ry8HxqMq5df75F52OmKmkhTabac5Ce1s
	0bOtiV+RtcD0AgWpF+s7vCikP9FYFrPaV+/zxtXBgXU5F35w3TZa5uM80p/n0A==
X-Gm-Gg: ATEYQzza2kbatVViJaa5znpKvRddeaf/YceETORJdWf4jzrfMdADIvnUkKwKTyLZ4Iy
	m5OulrWYs87XA1v8OhRQ4hkEAtkU60reWmAvi1Q1/IgvP72UCuXrLf0Uk5ElRNhqdPBsCTMqZWN
	Kl/6okma7+NVD2wYZ4aMiNmKJ8ThDCBBmaNOVH0ygl3RnzWiFsu1Ux2O+JfdlRD5jKdCHpNV1U7
	6Dv3br9EfUpB0dLR1tgopGPyAwJ6kYcCzBOHIJvs0ohOZ2HEpykDKNmJDvchsrjfTxzwYXOjHS6
	yrNzBsW51mFwr4u4amrelTcPLb4DKB0nr1Sb8f95fUPzA8pj4XTzW3+JVF8+Pdj21dxIO65yEQX
	ITLP9V0+AtXfWeH2jp+ED7X7Rr2HVINAYOPvgK4A8hoTFRxSLeuJMJ62h60CGHBozvy2aDA1EKp
	ldWr4XXi/MxcW/Vy/If3ajLg2K
X-Received: by 2002:a05:690c:6601:b0:796:335a:895 with SMTP id 00721157ae682-798bb3432e2mr57132967b3.6.1772649303929;
        Wed, 04 Mar 2026 10:35:03 -0800 (PST)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bfc6besm77527587b3.26.2026.03.04.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:35:03 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary return value from func
Date: Wed,  4 Mar 2026 21:34:23 +0300
Message-ID: <20260304183438.25228-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function init_hw_mlme_ext() always returns '_SUCCESS', regardless of the
result of it's work. Remove this unnecessary return and change function
type to 'void' to simplify the code. Additionally, fix the line length
exceeding 100 columns.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 8 ++++----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a631fe323157..641eef15cd46 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -184,12 +184,12 @@ int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch)
 
 /* Following are the initialization functions for WiFi MLME */
 
-int init_hw_mlme_ext(struct adapter *padapter)
+void init_hw_mlme_ext(struct adapter *padapter)
 {
-	struct	mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
-	set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
-	return _SUCCESS;
+	set_channel_bwmode(padapter, pmlmeext->cur_channel,
+			   pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
 }
 
 void init_mlme_default_rate_set(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 31bb09bc3534..95769f90d196 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -424,7 +424,7 @@ struct mlme_ext_priv {
 
 void init_mlme_default_rate_set(struct adapter *padapter);
 void init_mlme_ext_priv(struct adapter *padapter);
-int init_hw_mlme_ext(struct adapter *padapter);
+void init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext);
 extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
-- 
2.53.0

