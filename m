Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D87286A1
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786142; cv=none; b=jKv0rBCVsLinUlPh2P61PbFG5VCP4jhyiQp73kM58j3i1sgNa2pK6M+uVdV5dWQXiAVlnT3ohPHodLcRV8k9Nf5hhVDlG0S/dOzRRy8AQ1q3WxnAgEo2a6C9gmCAz35o0PK0j7vaxKyBoD++QoBPf0tc8GePEGws1+mc1Uzv5Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786142; c=relaxed/simple;
	bh=WPq8qkWAjEeyhL651g/gx0ZCAZJ5T20+vC4lFpVBkAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZxmdqnMIKhq9nwD8r+SW0WSTjisy3rMreJANT/oLckzi0fJJ3LuCcalVN0E1Z7RS+Aq7ihItO6TCWfwn8yyHu2BFxOF5g2sjyqC+wWSpES82+plt5ajSkpZwXMxWrIApCXY47OEQHw8QaJrc7GpkrKT0ajU+AsJRmtk6bbALOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEF7gPqU; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEF7gPqU"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a998a5ca499so662777866b.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786137; x=1731390937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqM06z+njLF7FAtLYNvhAE64PBnYV16u4ZqhF1r1t3g=;
        b=dEF7gPqUmG+FfBuNr/5/m+optyaLw5UwidP1wso7vtSGg/o80AP4eovg+wp353pPfn
         tFrrMlVVY1NAcXU7BvnF662vJe1qb3M9Gppv4eIoAUMmSWxPYu73X4IU7xo6sCj4oFfY
         vogA3+uszTZuEP2506xFj6ySF+78/ktmNrIZjQOj7Zc7heBj35+ktowaigAmpQJDkY7V
         6S4H8B1jdVoPFf8SuFX0atCpH2zQaxQedrIU7l32Mur9Q1a8BIn1B0y73JCS0msUEPUx
         lUsccbT+ogSqFjI264CnfgQw6UPCIWonosGAG92Hs6pcBtZMcTe3cUe45Pnnp1wCe79P
         +CPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786137; x=1731390937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqM06z+njLF7FAtLYNvhAE64PBnYV16u4ZqhF1r1t3g=;
        b=orJQrIT2Z6cgusM2ui+uuK3i8TR3rPd0oL+RVjD1Lj9ToW5DsIkm+CRpDqUQZ0Gnh+
         ssND6HjSJzkiQ/plvRZhqCvXLEhHm8tdqEGY4GVLjwAhoCILSaBZyhFbTvadQRDskV8H
         cbr5DT0PSC/fuO5mGweC5kw8fIwDJAKHySc38TRkwAQSxCPjg0IndyK+IHJ0rmAVwqkf
         6ELXZ7Ne1tXe8Z56sYimsHreMWWF9zzZfxuCObmp6JaMmtFMwQoK4jgsTVbIlfR0C2cf
         ipv9OWit3I4qQtOmQ5IsbIurd0hLsKDvVuT8x0Nc7gbZamxNiGz9ixpZI9el/EHRCIHy
         dU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaG9nEouMnS5oT6ufcCp3lhkPLGP3f+jzw5LeaQYLzdcR7zv1FA0d2Br+z0vuxSh+Ajdx79PAoLhGJ5ZHS@lists.linux.dev
X-Gm-Message-State: AOJu0YzCqUN9kyX2WlaO2zUp/BMJ39Vpqylvd7bLzIEWSTTHJXF8ZBSK
	tVBjBlkyfDn5fuu5HTJ0R5tu/avFxrPhysPjA6O+rSM8csn1kUv6
X-Google-Smtp-Source: AGHT+IFzwXympF+JOibyojurFfcbVMwrGzz1dED57CQe91tFRPmXumRPRTNTwts9jUYaudoUrQduDA==
X-Received: by 2002:a17:907:7250:b0:a99:33db:2035 with SMTP id a640c23a62f3a-a9e654d5e6emr1508894466b.26.1730786136709;
        Mon, 04 Nov 2024 21:55:36 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:36 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 16/16] staging: rtl8723bs: Remove function pointer ReadEFuse
Date: Tue,  5 Nov 2024 06:55:03 +0100
Message-ID: <92e249af89320d37a211397da7ccf82878359c60.1730749680.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer ReadEFuse and use Hal_ReadEFuse directly to
increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      | 3 ++-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 1dee02ecc396..b6c655e6747e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -159,7 +159,7 @@ efuse_ReadEFuse(
 bool	bPseudoTest
 	)
 {
-	Adapter->HalFunc.ReadEFuse(Adapter, efuseType, _offset, _size_byte, pbuf, bPseudoTest);
+	Hal_ReadEFuse(Adapter, efuseType, _offset, _size_byte, pbuf, bPseudoTest);
 }
 
 void
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index f2c079cebdd4..2d2de56d5df7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -887,7 +887,7 @@ static void hal_ReadEFuse_BT(
 	kfree(efuseTbl);
 }
 
-static void Hal_ReadEFuse(
+void Hal_ReadEFuse(
 	struct adapter *padapter,
 	u8 efuseType,
 	u16 _offset,
@@ -1745,7 +1745,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	/*  Efuse related function */
-	pHalFunc->ReadEFuse = &Hal_ReadEFuse;
 	pHalFunc->EFUSEGetEfuseDefinition = &Hal_GetEfuseDefinition;
 	pHalFunc->EfuseGetCurrentSize = &Hal_EfuseGetCurrentSize;
 	pHalFunc->Efuse_PgPacketRead = &Hal_EfusePgPacketRead;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 23786701ef9e..2285e82ab7b2 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*ReadEFuse)(struct adapter *padapter, u8 efuseType, u16 _offset, u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 	void (*EFUSEGetEfuseDefinition)(struct adapter *padapter, u8 efuseType, u8 type, void *pOut, bool bPseudoTest);
 	u16 (*EfuseGetCurrentSize)(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
 	int	(*Efuse_PgPacketRead)(struct adapter *padapter, u8 offset, u8 *data, bool bPseudoTest);
@@ -289,4 +288,6 @@ u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariabl
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
 void Hal_EfusePowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
+void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
+		   u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

