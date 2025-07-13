Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EEB30100
	for <linux-staging@lists.linux.dev>; Sun, 13 Jul 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752400980; cv=none; b=JYpatA+aLe+cyqXr7+UI5uXQNEmdI6Bpr/yLYiGCBfeX2VunAMvE2W7bh0j6BJ/PKQ50uP3o+3K6F9XNaMI/tDTsaC068SuCuHXt6ym4GfDLlNwco11n2q/ts7IPvmcmgUfMOBPJYOjsdkWhAITRB6SPEZCUHfY91OIebrCvkps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752400980; c=relaxed/simple;
	bh=lsSI21PHcIe86RLoSJo2+tC0OQ01xW8aqHIJLeYsuF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9FQcKzLwiReYZhHw4qjwj4LAFh9o8L6x32KbS4ijIgB8/WwuiLpzkxwPizxK1XE077Ln23cA8aAfkC7jOkGJSQoDRjpbh7XHqIRxLqiCmtMq/NiI4SfLq8cHueZVFBoFrGZvyT8Ss0Nsw0hNGbFxNNaGA4euxaHrSHP0RBQKEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2lCnr7D; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2lCnr7D"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0df6f5758so600353366b.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Jul 2025 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752400977; x=1753005777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkPCFyycutUQr5Aj7ZQhTxE1LLnUnb4qDuMCZemDDVs=;
        b=h2lCnr7DXLW4LBpjFC285VRzRUwqlIYnk77xgjZ8NtOvsmZ9Cpf7TTIlIQE+hyEcSt
         lZmyMmDHYsoXjJgVGWwWj5BkcsXTPagtKBuCfwpWm960yoecZCNetMSZ8FOLhpNORT4s
         ctXWNSL9D5q2yNndCksFSyLsDz134fwT8hqo4lxfl3lLmLavFkm16hOdZrCx77LKdDIE
         G0hhnbaxOmKd6w1NZLMuqwJtuw7umKdlKIwbMScHSvvoIaWLUu9emx4oAGO5oiGlYvjy
         i8BHRTwBo0ZoA/L9vdhclIwhzB0UglazWS7lEOYmpkndHIWh2Rc/hWkXaAASaHEyt20h
         5VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752400977; x=1753005777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkPCFyycutUQr5Aj7ZQhTxE1LLnUnb4qDuMCZemDDVs=;
        b=J7PyfdESrzp7Fyhkxhbx8i6eM+1k5q9s/fBvpVKGMyZQtVLTnUV60d5qjLH/fabYyq
         CkJtczFwdpronhWMvXI8BrT/0fxjRrdgXH0QR7eOEukqrra9SzlYQIS4W015eYgeD9y8
         gLCIVYfsjzgxN02dpo00gk+Ke4iWaJFTW2SJZHTLqUoLOnj9DrAG+iq9xV9N3DsawGwX
         bqZLzs9O+Is1TQrC0XNtSx/YROPsEaQ6p3+cmeMEUsZbX3/YSKOkTvZq4J2hUha1aDxe
         18WGlc5lYWcX8tWP0YDHM3FluLwnZB1kj6sSAETk4c42lLovsnc1e4gsu/ZaFd7ffxQd
         QM6g==
X-Forwarded-Encrypted: i=1; AJvYcCWi9JvE7n6rWoVDBXID0kUwsfepOAATkLKzopcR6iv69o8TX8HqWrsYDMNNaUl7dnv1mJq2yAZVUPFgbVP1@lists.linux.dev
X-Gm-Message-State: AOJu0YxrifQl6SwANQ0vg9ezy4KyNiwT9pLFPccbAvpUmWfIBPuJb3VB
	ilEipqAlFQ/oOuIoVIlXMFQtcm0TwQ/OnRmPIZwALakjXPD48rVYPfxr
X-Gm-Gg: ASbGncuozyio4FTO/Qvj1qn/Q5MHpkpyw/hiys7KMRTFtahOjBghSuc+XShDyDp12Ve
	broBVQ61977F1KgCmUjcxB9QdQdNgittFSGjNrCCuHByGvqpMoAnil7df5akqQR86NKT6g1Ib5Q
	fuUYx+9+tfBKu3lRsqthmWrD2NcBdpvS9b6GKFNtaFgz36li+eW1xC8a+Hnxo9bpPFqJmubNFtS
	CRh5QtxcAzGYv6lzJAwo6pgxdGqH30ZX9itx091E9U1Esu3wVv6xx5dG+aTpO10pqbD6DQceP23
	dl0IfqPkiGIpjmeGpVruMr2j1tubrz+gNhgNMEYYDRzQhg3b6BwB2R6zh3MCnQbDiGQYJO7Umxp
	PZoAcDCCFgG0PV1VjWfT9GcZ8ooxT+tiUkEW1avXwVgrBecUPGtXSFZpaADzwNVl4Im2p
X-Google-Smtp-Source: AGHT+IF5Hzm8qF5VUHzYLWfPpKYSIQ+0hoRs9MsoR7ik7rv56nc0ybeTXehygLOman2MMK5F4Rnnsg==
X-Received: by 2002:a17:907:1b08:b0:ae1:f1e3:ccea with SMTP id a640c23a62f3a-ae6fbf40993mr1009518866b.7.1752400976291;
        Sun, 13 Jul 2025 03:02:56 -0700 (PDT)
Received: from tumbleweed (ip5f5ab8dd.dynamic.kabel-deutschland.de. [95.90.184.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee48f6sm639830366b.55.2025.07.13.03.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 03:02:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Efuse_WordEnableDataWrite() is not used
Date: Sun, 13 Jul 2025 12:02:29 +0200
Message-ID: <20250713100229.13917-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function Efuse_WordEnableDataWrite() defined in rtw_efuse.c is not
used. Remove the function and code it is calling, i.e. the function
pointer (*Efuse_WordEnableDataWrite) in struct hal_ops and the function
Hal_EfuseWordEnableDataWrite() to which it points.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 12 ----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 68 -------------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  3 -
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 4 files changed, 84 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7a74b011dedc..51cbf62c8f7d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -286,18 +286,6 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 	return bResult;
 }
 
-u8
-Efuse_WordEnableDataWrite(struct adapter *padapter,
-						u16		efuse_addr,
-						u8 word_en,
-						u8 *data,
-						bool		bPseudoTest)
-{
-	return padapter->HalFunc.Efuse_WordEnableDataWrite(padapter, efuse_addr,
-							   word_en, data,
-							   bPseudoTest);
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	Efuse_ReadAllMap
  *
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 893cab0532ed..3541aac605f6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1077,71 +1077,6 @@ u16 Hal_EfuseGetCurrentSize(
 	return ret;
 }
 
-static u8 Hal_EfuseWordEnableDataWrite(
-	struct adapter *padapter,
-	u16 efuse_addr,
-	u8 word_en,
-	u8 *data,
-	bool bPseudoTest
-)
-{
-	u16 tmpaddr = 0;
-	u16 start_addr = efuse_addr;
-	u8 badworden = 0x0F;
-	u8 tmpdata[PGPKT_DATA_SIZE];
-
-	memset(tmpdata, 0xFF, PGPKT_DATA_SIZE);
-
-	if (!(word_en & BIT(0))) {
-		tmpaddr = start_addr;
-		efuse_OneByteWrite(padapter, start_addr++, data[0], bPseudoTest);
-		efuse_OneByteWrite(padapter, start_addr++, data[1], bPseudoTest);
-
-		efuse_OneByteRead(padapter, tmpaddr, &tmpdata[0], bPseudoTest);
-		efuse_OneByteRead(padapter, tmpaddr+1, &tmpdata[1], bPseudoTest);
-		if ((data[0] != tmpdata[0]) || (data[1] != tmpdata[1])) {
-			badworden &= (~BIT(0));
-		}
-	}
-	if (!(word_en & BIT(1))) {
-		tmpaddr = start_addr;
-		efuse_OneByteWrite(padapter, start_addr++, data[2], bPseudoTest);
-		efuse_OneByteWrite(padapter, start_addr++, data[3], bPseudoTest);
-
-		efuse_OneByteRead(padapter, tmpaddr, &tmpdata[2], bPseudoTest);
-		efuse_OneByteRead(padapter, tmpaddr+1, &tmpdata[3], bPseudoTest);
-		if ((data[2] != tmpdata[2]) || (data[3] != tmpdata[3])) {
-			badworden &= (~BIT(1));
-		}
-	}
-
-	if (!(word_en & BIT(2))) {
-		tmpaddr = start_addr;
-		efuse_OneByteWrite(padapter, start_addr++, data[4], bPseudoTest);
-		efuse_OneByteWrite(padapter, start_addr++, data[5], bPseudoTest);
-
-		efuse_OneByteRead(padapter, tmpaddr, &tmpdata[4], bPseudoTest);
-		efuse_OneByteRead(padapter, tmpaddr+1, &tmpdata[5], bPseudoTest);
-		if ((data[4] != tmpdata[4]) || (data[5] != tmpdata[5])) {
-			badworden &= (~BIT(2));
-		}
-	}
-
-	if (!(word_en & BIT(3))) {
-		tmpaddr = start_addr;
-		efuse_OneByteWrite(padapter, start_addr++, data[6], bPseudoTest);
-		efuse_OneByteWrite(padapter, start_addr++, data[7], bPseudoTest);
-
-		efuse_OneByteRead(padapter, tmpaddr, &tmpdata[6], bPseudoTest);
-		efuse_OneByteRead(padapter, tmpaddr+1, &tmpdata[7], bPseudoTest);
-		if ((data[6] != tmpdata[6]) || (data[7] != tmpdata[7])) {
-			badworden &= (~BIT(3));
-		}
-	}
-
-	return badworden;
-}
-
 static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 {
 	u32 value32;
@@ -1390,9 +1325,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	/*  Efuse related function */
-	pHalFunc->Efuse_WordEnableDataWrite = &Hal_EfuseWordEnableDataWrite;
-
 	pHalFunc->SetHalODMVarHandler = &rtl8723b_SetHalODMVar;
 
 	pHalFunc->xmit_thread_handler = &hal_xmit_handler;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 5dddafe035c2..da4215841773 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,9 +162,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
-
-	u8 (*Efuse_WordEnableDataWrite)(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
-
 	s32 (*xmit_thread_handler)(struct adapter *padapter);
 	void (*hal_notch_filter)(struct adapter *adapter, bool enable);
 	void (*hal_reset_security_engine)(struct adapter *adapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index d6ea8a4a856f..669565fa1c69 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -96,7 +96,6 @@ u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 bPseudo
 u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 bPseudoTest);
 
 void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
-u8 Efuse_WordEnableDataWrite(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
 
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
-- 
2.50.1

