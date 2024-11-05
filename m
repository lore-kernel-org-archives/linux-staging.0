Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3782003CE
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786141; cv=none; b=aoesLJH2ITeqvrSh3HFwL/G5JEvWQVS5Dx/Zv+SGkwqnzDwWIkM70KSWoDB9JG5/GMKkEa7RxNXXvmm7ZtjKqyNcfxbDBRoO1uHmq5zOi1TVBD03U8wq0P+qDpyamEw9YOVRTATWFoVzOsaZgAV6TxE8mvt8REuOlEZyDuTTjDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786141; c=relaxed/simple;
	bh=PcmsJXN0QMgmyVreRV96Z0XZnJhTALbi7MKREO5b/dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDTIaOVIqw1UkgLSsTgLucJPjQ15qE4cwgP5G5XimtqRhI/+imagrDFxh9au0QKB7S5arQE/cixDTaZ34u6xD56qbQdh14TRJ3ECWVZNPsdI3MgNp/SvZC7LgiNeG1jorjAwDRXslCSt5BvMyPN8NJjcIho6Ascn6D4jljdGOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgaeFpz5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgaeFpz5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso887490966b.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786136; x=1731390936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvuMQJX2aiqCaksyW7T4UdubL+MpISHCMIaun7tvg8U=;
        b=mgaeFpz5nXOMDrpzmkSUsmx2pgy6OJ7lFWS4AdfLAjqokNnd7i0rpHej4XiKc25QyM
         HiyT1OQs3arkbRu7w4CwmOEmIKAWE5jwYv3sBUo6HdTTJqPmLp+mv5b52Jev+n7ywjg0
         4wkA52q0oHVCUX0FnxbIoUJsTK0PEzuMe3DCGb0txHqgPOCSf+mSIaq+Sjxkeo9+yNa7
         nwfvJTkJZS2Iu5ZLhLpbqDvG5Iin81W+1yOB/+EjaJz345vz5/V8KdB1XOK7PnXyLby8
         CBzTdXSXnKr0z0lTu/hDQMLayRz48d1KYCk+IVbkXtLNouakjgbFVl0sWmfJubFkNlsb
         +N3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786136; x=1731390936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvuMQJX2aiqCaksyW7T4UdubL+MpISHCMIaun7tvg8U=;
        b=CwAKpqlZzRdE2iBan3ULBReOrfYPlF75Fu3XTHDt7oHYNpIN4phSGZm0WddIXU/qme
         RjhiqURreicWF/gMDDEg3+2a/1Z1RXhrnhvcqHNy5fI48NesS/+mJBW9v3wtEYB2KL3p
         tWQgbvD5FtFTPx8Xcj5gcFPJ1fhsMgTCPJOzK0KZ8i1XvIKNpFnH9r52PwbfqNkydr/Q
         qhWREEE3oy55Hl6pdngpatcOKRAMq3vzufGE87l2cu3gr6Ct7LKGjhbT++ru4KzrFeCv
         cZ8UZpHWN/WlCg0MYuKFpRaF9VaPtY8owSNFvLtNe0yWRg5F3CKi0MRmvpPL/pdYUBSl
         AiMA==
X-Forwarded-Encrypted: i=1; AJvYcCUYnrGhAUZzzWLKJ6Ry6X4pcfvfim9L0ItqY45oi70cz88hyV92F6i/2ANNA7jOKDi7phWuuUacXSZspZnl@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp/a9gdLukHmwE/u3H91pulDD49wmzuVuLjCtz38IeEtUG/FyZ
	/GwLpJVvm6KobsNdCMnpTdQ6I9hzvbk1snTZJ5pmJihr1AI6vZnw
X-Google-Smtp-Source: AGHT+IGqqiag8wzE2dcO682dhJw8kE28ETTMWcqFjkIy2RKzf0GCSxfDMNm4XcwbGTTUzVe18dlw2g==
X-Received: by 2002:a17:907:6d15:b0:a99:ecaf:4543 with SMTP id a640c23a62f3a-a9de5d8272dmr3630244066b.25.1730786136136;
        Mon, 04 Nov 2024 21:55:36 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:35 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 15/16] staging: rtl8723bs: Remove function pointer EfusePowerSwitch
Date: Tue,  5 Nov 2024 06:55:02 +0100
Message-ID: <0ab31bf7b4562104289d6965eb081aa47e1c3998.1730749680.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer EfusePowerSwitch and use Hal_EfusePowerSwitch
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 8b671f8a7965..1dee02ecc396 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -77,7 +77,7 @@ struct adapter *padapter,
 u8 bWrite,
 u8 PwrState)
 {
-	padapter->HalFunc.EfusePowerSwitch(padapter, bWrite, PwrState);
+	Hal_EfusePowerSwitch(padapter, bWrite, PwrState);
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 24d722bbc34a..f2c079cebdd4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -602,7 +602,7 @@ static void Hal_GetEfuseDefinition(
 #define EFUSE_ACCESS_ON_8723			0x69	/*  For RTL8723 only. */
 #define REG_EFUSE_ACCESS_8723			0x00CF	/*  Efuse access protection for RTL8723 */
 
-static void Hal_EfusePowerSwitch(
+void Hal_EfusePowerSwitch(
 	struct adapter *padapter, u8 bWrite, u8 PwrState
 )
 {
@@ -1745,7 +1745,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	/*  Efuse related function */
-	pHalFunc->EfusePowerSwitch = &Hal_EfusePowerSwitch;
 	pHalFunc->ReadEFuse = &Hal_ReadEFuse;
 	pHalFunc->EFUSEGetEfuseDefinition = &Hal_GetEfuseDefinition;
 	pHalFunc->EfuseGetCurrentSize = &Hal_EfuseGetCurrentSize;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index ae873147a561..23786701ef9e 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*EfusePowerSwitch)(struct adapter *padapter, u8 bWrite, u8 PwrState);
 	void (*ReadEFuse)(struct adapter *padapter, u8 efuseType, u16 _offset, u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 	void (*EFUSEGetEfuseDefinition)(struct adapter *padapter, u8 efuseType, u8 type, void *pOut, bool bPseudoTest);
 	u16 (*EfuseGetCurrentSize)(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
@@ -289,4 +288,5 @@ u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariabl
 u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
+void Hal_EfusePowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

