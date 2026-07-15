Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249347DD7F
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119874; cv=none; b=ZEF2hDpRj6jBVzegDT6BfSRe9LHRK7d4dnpTnN8XJfJlIpIbs/Rv1AdtZ3Yoy7TAQ0HBROR3RCabnzwooaR9nB/sLRCF2jgWfGmvfTEnjJ/YZgPI7LwbxeMy9UeKJp1cu8uLg6nycKREDA+aDrLS1hUTEvXCiPqTjDjZ/D+ck70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119874; c=relaxed/simple;
	bh=HZ0zRdItiR8WpGFkFya4oqOg6EPC1u9XQZB0V+DLwOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KoVtXzTVuz2JAKRjw+yt/32G2kecNAeqNxoiZDqzHPqi4cIR/CpZ7J+PUb2GaRMRItsdKlk3g74HBhpfcxHFAlBN2nGRaZk5J/NiG1VfHxhYWvHxLL4LWZCzrCVdUFK/1XCFCQMoMfyv0Vzg2qkbK5neXtkp42ZGtiCcoRgeJZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oszw7QgH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oszw7QgH"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so5766371e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119858; x=1784724658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KE8cqmEWFDwhs9+uHCZ9XurXdXQwWEdGM0MtE4jhXF4=;
        b=oszw7QgHX2x979dWSH//VZr7FIIu5Okqz6VKTGpLETqJd/NinjtAmbKS7yFTbw61y7
         gKgBKeO0pQYFoAyqyhjmUgapbyaXXcnW4Oe/uYiF8y9kgHBItnepdTkcQ50/V5QIWit+
         E795cKPsXmcps2Ph3B4bijYqhK2LTSpgiNOSNVe8vZnoeiR57uGTUSG0XHBmdo/joo5P
         W2L1L4D6uBCfwAe5HpkVaeBoJNwv6EJzWAUcYfqljfNL+OW4EQ5TY8q1SmBdmxY6P0EF
         iAUEBTyRV4UPxdtHfZGumdEqT+R6+jOLcrCvV44nYtiQgVCo1Ko0KDzl4Mxm38j2B3i3
         pjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119858; x=1784724658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KE8cqmEWFDwhs9+uHCZ9XurXdXQwWEdGM0MtE4jhXF4=;
        b=k6HxVRtUXsN9GBIEx+7viEkrXQd+Tkkbz0kBUQuR9c+5kmQDJcFbywPhok6eEqtlAG
         Tk4uwiyUvdpEbEDme2Nyzi7xzuqU5bWl3Zk42j5dQzaPB2S2BU5SH2kYWvXc7hO2O+ts
         /WZ4/ogQrmMkTTjPEIl/+yDfQZVfvpjqlYRvge/qIVFX/Q+1JA/6nXa7LmKZQwm5X4Kc
         KythL+BXFFyKhZkf74FqAX4ah8iwXvIC6j6OxBVvyYP0NdcIo9fz5Idd85ntimqqVh3g
         xnffn1FMDOuh1hhOsQBx5JVwHJuAM+KsQgtx+p4GIZ7KdLi9ShnwkX0BqTo9USKP+zUv
         h3rw==
X-Gm-Message-State: AOJu0YydpFW4npvNAPWuQabOl5vRG0rdqgqy4uEujSxAp70zcC9cbDSR
	5QmM37p8td3kjQ5C5xs3URQCOfGopU0B6cqMjzyaopL8vfFV9GpNfJfU
X-Gm-Gg: AfdE7cmiqVqzRiFzlIbJc/k2OAHm+XociRX+v+uyeMO5CzOj1EpAq6oL05iVUFqSZ5v
	JToEpjWN7hI0Bux+H5abJgCY5Dg62UAWtMqAZ6dPB1MGfIrbsd+rhSFcVDRrhKpAgLWEr8tcILV
	EzfVUJXjaJ8soynfLwQ/LO15gT45KiNFHF3PW7gk/7REgwXRiB72aum1AUoLGqGYXZuHi38An9d
	XViKCWcg2ePY+tkTFZJ4P5Vk7ikjxesFMCZkGDXmj9Q730QH1f1VNDoclMurHknO+tYgH6DV++p
	SwIisgN1M0JH/oFAlNIV3e/g8sGLhunKdCh89Kaq/Ha0Y9UyNbu2aGBEZUzWo8EA1ygKSVO8Hqz
	/eBFh7nyJJeRJVhiNyWzgSk5CZg2P264L6r4ZmFSJj8hruHVmC77C63Jy4uaDK4QvDgJfvPOQZY
	U2uEJk8ZzyAghRdsIHYG+LUrcfvZ/KLB5ma7FMuP7tsANsnf38FnkM/rOjMXvMaeh0TAm91Ou8j
	k0k6eCr1wSOIJ9IqG8TdUid
X-Received: by 2002:a05:6512:3c8d:b0:5ae:c561:3ace with SMTP id 2adb3069b0e04-5b159b8bb5emr1608577e87.57.1784119858312;
        Wed, 15 Jul 2026 05:50:58 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:58 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 51/61] staging: rtl8723bs: inline GetHwReg8723BS into rtw_hal_get_hwreg
Date: Wed, 15 Jul 2026 19:48:19 +0700
Message-ID: <20260715124829.90290-52-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline the hardware register reading logic from GetHwReg8723BS directly
into rtw_hal_get_hwreg. This removes the redundant CamelCase wrapper
layer for reading SDIO-specific registers and simplifies the flow.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 16 ++++++++++++++-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 21 --------------------
 drivers/staging/rtl8723bs/include/hal_intf.h |  1 -
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index bbf987ace..92e4605fa 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -109,7 +109,21 @@ void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val)
 
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val)
 {
-	GetHwReg8723BS(padapter, variable, val);
+	switch (variable) {
+	case HW_VAR_CPWM:
+		*val = rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HCPWM1_8723B);
+		break;
+
+	case HW_VAR_FW_PS_STATE:
+		{
+			/* 3. read dword 0x88               driver read fw ps state */
+			*((u16 *)val) = rtw_read16(padapter, 0x88);
+		}
+		break;
+	default:
+		GetHwReg8723B(padapter, variable, val);
+		break;
+		}
 }
 
 void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf, int len)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 775fd5138..22d6180f1 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1077,28 +1077,7 @@ void rtw_read_adapter_info(struct adapter *padapter)
 
 	_ReadAdapterInfo8723BS(padapter);
 }
-/*
- * If variable not handled here,
- * some variables will be processed in GetHwReg8723B()
- */
-void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
-{
-	switch (variable) {
-	case HW_VAR_CPWM:
-		*val = rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HCPWM1_8723B);
-		break;
 
-	case HW_VAR_FW_PS_STATE:
-		{
-			/* 3. read dword 0x88               driver read fw ps state */
-			*((u16 *)val) = rtw_read16(padapter, 0x88);
-		}
-		break;
-	default:
-		GetHwReg8723B(padapter, variable, val);
-		break;
-	}
-}
 
 void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len)
 {
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 51fdbf9fe..b6ceea02a 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -241,7 +241,6 @@ s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
 s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
-void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
-- 
2.55.0

