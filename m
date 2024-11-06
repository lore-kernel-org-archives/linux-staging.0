Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EAD207A3A
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918038; cv=none; b=izWVLSyQU87c9xiKtyZ0nDo+N+7WTx42C3hvh6lJKjfjYpRCDTyKXnfwZesNuCMUnGJvkmxNTSdoH0n9qGY5qvAiLnDNqME0DRS0iPowr18RnopDu3bPp3IO3MSkkHo0ED1FeIpv/KvLVR0I55JLQKCFzHD4rse2oAyLoj+RGfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918038; c=relaxed/simple;
	bh=28VgR9/mTRGQLnSjlZI5ngaU8OlMSuFsh/ZkPGpnMyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JY+SAwIOsgFsnyVB5rLvT7orayOKUQhHObz1n4Ui71cGV6Uh87LSzdx8fg4gwGOksgLIui8Loqh8tnGvYU3DXJxwkGesi9FwjOEgz/8o/JMta0C0sKulB5pOjV6q3SED8M9tC1lo1X+DV4kFoDBzofL4VoNlLHWrbdjRbBO4DHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfEz4s8y; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfEz4s8y"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9aa8895facso7435266b.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918035; x=1731522835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5VZXsxFcPOb1yWrcWItHRNslTT6cT523l3GGyBmh8g=;
        b=bfEz4s8yHSfLLnHto2vFhj8Z2Py2NRglMyMN/G20MNatyIc9YS9B9kNNNmEmMsKJYY
         RLmJmzOFEWMSUuevym5cGJJcQkNqEjke3pVsYbf6lwcdTy4gMIzF+VT/WRe4iT8x/J/5
         rJM5Lhoe10ni7/VTocjT90zYBHNcNZiI5Rk6dd70U5/Qs+IOAGjGQNGZh+0cq4IhqRPU
         MynNSLTOFVsrK2D3/zv7hvBZ+jQnM+Pt3uDmLKnCTAE+n145tQP5oYbrskzooMdZ6KRe
         WdOJ2vfPzME838RS/f0eZr8kZatuukIoKsKxOt2TPsC34wFqyhuc8Pu74mLNMSpIUhwD
         pE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918035; x=1731522835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5VZXsxFcPOb1yWrcWItHRNslTT6cT523l3GGyBmh8g=;
        b=CI6bPY7KzhfXOMIlDzMPh6wALVq4pokHe735MMs3RyWGXy9Ha2Rva+cu0LiYk4tqNR
         tT/C0+NIyw7QKrBosozfCS3MRw90i4ynBZRYEOQ26oahMN8oqHm44wz79oMAtzoK1PLv
         CzzDiySjHZnXxKeSgzuoj5UXX/3hUU4HII+O2n9gBpXf9HfCx0JM74ayJUZzsz3Qlq4q
         2shkQsDTUHBqEm8WIg9xUKtH2d+/Pt4jL6TyssKSOQE9164oOd3VYhfLw5/1beOMvEV8
         Y8Z8LJYPZF8Orzoxfyj8m8KME4E9GPji48GNREhvynoA3f6szbALVk4at1QabSjGPC5B
         ZetQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7iYT4Uir3VMyaJlE6AcnAauHclnk2mNVPHp4ATeBbeq/EuJyz7Acon2K57TLXugtoAgMn+ER1MImv0GeB@lists.linux.dev
X-Gm-Message-State: AOJu0YyTv/KA7HX7hEty+XZ/8AYGV9GGvAesOM8h+qCLuLO/8UlXshtI
	QqqD58sBXfcf0GbPnA7T1nM8GDVvmCFW5qUhY3aD2A0OhS65dVsy85crGA==
X-Google-Smtp-Source: AGHT+IGXqmPZ2+2CING4uLm7EgLsGnOQF56/dX+4i7v6qzHEJVRcC0PWMf9VAErLCqidd4w/9YTL7w==
X-Received: by 2002:a17:907:e8d:b0:a99:8178:f7ed with SMTP id a640c23a62f3a-a9de5d6e208mr3874337966b.4.1730918034324;
        Wed, 06 Nov 2024 10:33:54 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:54 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 01/16] staging: rtl8723bs: Remove function pointer EFUSEGetEfuseDefinition
Date: Wed,  6 Nov 2024 19:33:30 +0100
Message-ID: <a203a6b2558ea0af5811d8c5841b10b7bbf2e9ff.1730916582.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer EFUSEGetEfuseDefinition and use
Hal_GetEfuseDefinition directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      | 3 ++-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index b6c655e6747e..b8023e9d7631 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -171,7 +171,7 @@ EFUSE_GetEfuseDefinition(
 	bool		bPseudoTest
 	)
 {
-	padapter->HalFunc.EFUSEGetEfuseDefinition(padapter, efuseType, type, pOut, bPseudoTest);
+	Hal_GetEfuseDefinition(padapter, efuseType, type, pOut, bPseudoTest);
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 2d2de56d5df7..8a4ebe645786 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -490,7 +490,7 @@ static u8 hal_EfuseSwitchToBank(
 	return bRet;
 }
 
-static void Hal_GetEfuseDefinition(
+void Hal_GetEfuseDefinition(
 	struct adapter *padapter,
 	u8 efuseType,
 	u8 type,
@@ -1745,7 +1745,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	/*  Efuse related function */
-	pHalFunc->EFUSEGetEfuseDefinition = &Hal_GetEfuseDefinition;
 	pHalFunc->EfuseGetCurrentSize = &Hal_EfuseGetCurrentSize;
 	pHalFunc->Efuse_PgPacketRead = &Hal_EfusePgPacketRead;
 	pHalFunc->Efuse_PgPacketWrite = &Hal_EfusePgPacketWrite;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 2285e82ab7b2..a513721e763b 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*EFUSEGetEfuseDefinition)(struct adapter *padapter, u8 efuseType, u8 type, void *pOut, bool bPseudoTest);
 	u16 (*EfuseGetCurrentSize)(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
 	int	(*Efuse_PgPacketRead)(struct adapter *padapter, u8 offset, u8 *data, bool bPseudoTest);
 	int	(*Efuse_PgPacketWrite)(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
@@ -290,4 +289,6 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
 void Hal_EfusePowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
 void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
 		   u16 _size_byte, u8 *pbuf, bool bPseudoTest);
+void Hal_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type,
+			    void *pOut, bool bPseudoTest);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

