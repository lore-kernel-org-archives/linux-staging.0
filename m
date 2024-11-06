Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230136D
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918038; cv=none; b=i4KhtBY58yVIDKD59RbzO1jEhp8ByFOKDNURmX9mgsg6KwzCzWSt5/DFcSLHbrvBGD1QxhuPJE/a0pvfktYyno/8q4Stmik1Z2jiVDOvwlA86PfBwkGcF5XWaX4FFcajX8bh9sdGXpOwEwJpywZZMOdTwB7PLj+puIyc3E1yTdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918038; c=relaxed/simple;
	bh=RzrCb4oLv8h3AO7d/rVCLj5+SSzNgJU8ETF9pQE696o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTp5KOVgRCwekWyHIbHmi/7ALk64X8m2VZnFE8fRD1HYKfNS6Aikb68+fK8DfcYMt1B4JRk65FK3LUfEpxZ1o4aHC53vNH240cHIq7dZ0fuOo8KiJjheqHd939V0PmMRZpbgTZc+MxgUqR94RqNMVkFyI7PiddtLAS4bcnIex0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImIpAiE+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImIpAiE+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4316cce103dso1308185e9.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918035; x=1731522835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M96Aa4rJwMo6paaVcv0s1fOlpDPMBLDVDsMC1t1/MHI=;
        b=ImIpAiE+EDu75nNjbZBRBBHfnV1wSAKFGy4DNr3s9EcjkGiu/Whyl2ESD9sx3krmQ9
         bcIQ/eE6e8JhqaT3mDaBUk4Ivj+ooBjI9v033DsRsltvo0psOLzvfkd2VMPWDWq949yH
         UH+K4Kd/iai7vzgtFof1J4CH2uRBDwMKAoguX9Gi7UhSHsQPX/225zkchG/GKcce5qAw
         cXsfunRdNqUJroxsnTtz04xyqh//cmK23Kg0Uycr976l3KWV4hVlt5wONeXLAeLO2loh
         yhnygp2WboGIM3y0juXuEILifdmW64uwtRyaG/n18jeqIQzs2/Cpl0X+2qK6CQ/w91pP
         KUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918035; x=1731522835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M96Aa4rJwMo6paaVcv0s1fOlpDPMBLDVDsMC1t1/MHI=;
        b=mT1k99Z4PMAiwLEkZtunH3aKPYiNSYm7QGEDRs4eDMOvr9eUnl8RQOSRhJIm7y22YC
         lK0I1oNPG+dWRDImtws+1ZHEzWsxxtU5D2fndbNhBfkEhc1Hwg4KjKBZaOJdnI/wg5bb
         /gMuk06A2kzb08YAhr3ElAaT1H0jyw2u85x32D8rMBcAf5/xhY8Knl8xjiCigwZn5KBw
         52Wfe09nthT0NBfPY1zbqz35+keH+s5iRT8ImHGCKJQa1M7sxMTvRz8t73cvEDiGe0B2
         epYwKshJ/8qSyL7BoH09o5VD8mCCEIyNILNHM5xMG5GL/sUnnmFOTpcsrFPPn5ftfwJP
         /e6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXf2ZCDQdOw1imCOB7BpaP5CbZ6RUqjrQtN5YB2SBHvdFSzGbfWdhe5RNiYuFBHCyoV8cT0eiZPQU/L8VgF@lists.linux.dev
X-Gm-Message-State: AOJu0YwSrHxri3pFrBgT/0TzCDl+sDZCNwhIxvIR2VJi0Nn9mx1p6o4U
	Uc0Y4BmHbnCNtWuXscCb/Xuq2TZJOAVOSi5ED+/gdAemuJWBNFjr/RTHzQ==
X-Google-Smtp-Source: AGHT+IG14Jj5KqrtGGo+MHdpACTy1Bt7UgJyxc82bZwyzAoEpicNPaixsF8bjZgR16rx+1bBcJdujg==
X-Received: by 2002:a05:6000:2c3:b0:37d:4eeb:7366 with SMTP id ffacd0b85a97d-381c7a461e4mr25482073f8f.4.1730918035009;
        Wed, 06 Nov 2024 10:33:55 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:54 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 02/16] staging: rtl8723bs: Remove function pointer EfuseGetCurrentSize
Date: Wed,  6 Nov 2024 19:33:31 +0100
Message-ID: <58a991eeda12ccb69fe8b81ef1bb2fe3c5aa364b.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer EfuseGetCurrentSize and use
Hal_EfuseGetCurrentSize directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index b8023e9d7631..8e6c294c168e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -102,8 +102,7 @@ Efuse_GetCurrentSize(
 	u8	efuseType,
 	bool		bPseudoTest)
 {
-	return padapter->HalFunc.EfuseGetCurrentSize(padapter, efuseType,
-						     bPseudoTest);
+	return Hal_EfuseGetCurrentSize(padapter, efuseType, bPseudoTest);
 }
 
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8a4ebe645786..11969a90a5e5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1072,7 +1072,7 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 	return retU2;
 }
 
-static u16 Hal_EfuseGetCurrentSize(
+u16 Hal_EfuseGetCurrentSize(
 	struct adapter *padapter, u8 efuseType, bool bPseudoTest
 )
 {
@@ -1745,7 +1745,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	/*  Efuse related function */
-	pHalFunc->EfuseGetCurrentSize = &Hal_EfuseGetCurrentSize;
 	pHalFunc->Efuse_PgPacketRead = &Hal_EfusePgPacketRead;
 	pHalFunc->Efuse_PgPacketWrite = &Hal_EfusePgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &Hal_EfuseWordEnableDataWrite;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index a513721e763b..48305cbf9929 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	u16 (*EfuseGetCurrentSize)(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
 	int	(*Efuse_PgPacketRead)(struct adapter *padapter, u8 offset, u8 *data, bool bPseudoTest);
 	int	(*Efuse_PgPacketWrite)(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
 	u8 (*Efuse_WordEnableDataWrite)(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
@@ -291,4 +290,5 @@ void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
 		   u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 void Hal_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type,
 			    void *pOut, bool bPseudoTest);
+u16 Hal_EfuseGetCurrentSize(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

