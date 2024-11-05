Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E442003B7
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786140; cv=none; b=Sq657o3ARBb6kbzvEVWC2vpUja+/t/fVxAhVASnwwcDI8mXZpwMkZF0kVqjj2Lpif+xIjGB0LvnBtpA/X2YuQApBIgvEFlKmeGDeUvzpsmpNrj+aBkou887s3JVynlyMNOMkrfgu+J9T89XU334XPiyjNKYJbqtOjVhk0sRAM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786140; c=relaxed/simple;
	bh=7mom63PqIjuQbcIDyVxHvfiqYeLfaAPUPom5BpDw+rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBw1z6gKF0+FGasLzDSkvfszv9QD629ia7y4i0mzd9Zzy9Pz8LBAggAvHIUyIZmJ+uHvGHbbnaVBDzcHpC4Cbd1xtEUaZ/eWGwab6LfC6JK7o0BMue6MxrSWKc6lrpZca9Pi+ZirncjsyzAN5vunBToE3gg6fvZuyPBxNjtmuzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eY4GyfzI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eY4GyfzI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso829617366b.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786136; x=1731390936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72Lw6qcXw6bSIgd6ceAGnZbTTC4nDVjWESZ0ARahZkY=;
        b=eY4GyfzIFPAZxmCGNKoqZf2uvdlmukc48tWcFRQ7VAPO2iHh09onrxK3DtW2wOrd9O
         JLReOEsK1PZwKALjmFJZmih2ksvhGYn47jEPyeLz52OGI7qxqvM4/brGapDIshCHZvKW
         ZiWeF1tBUbL3kjrGcFHLUvBrdPiO46LuwVzrxP/rlhyqze031GXgbbS1dA+HEIBvJU3A
         /lJk7wEt/NsIluj4fCqvVwXnvdivcLpx52+dl7jhVrHaB3ZU0WK4m2ivWhcnWdf2PN8s
         GUPoJwuGVsS9Zn4w1UOIPyUMl1EvmWMnk7wjsA1Klr/GKN5EDje5WLSrspnHqveJFTnh
         3PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786136; x=1731390936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72Lw6qcXw6bSIgd6ceAGnZbTTC4nDVjWESZ0ARahZkY=;
        b=Xi5tsy9vY5G803houH2kL47AfsRN4xDzFYEf/bb8ytK3uEE0GYtdB4SuTLbW8n8K35
         dZiTJdEIni7c0O0NNu4Hh+ZzUN9hg0Kq5oON+lmaLGkk9eV4Mvuc/9FftPeIrX80jFWD
         /bC1m9Fw/YjpsYnsNCq5nJzLw3ZQnVvqVsne1nlJ6XEAuTDCboVSNK9X0lkiiiXR1hVz
         RbG4p3RqoZMD5cY+VTJIDU+VkVVqhb2diW/rfU4xt0N0ENV/pNIh9a54Lx1UuDlNp2Mx
         +ZuV6eKrfDhitTYywIeFn7grCBUNF1seuuPwECN2akng49X9LPCUlP2RsYyjlFnT3tLi
         7T8g==
X-Forwarded-Encrypted: i=1; AJvYcCX/IJL70EyrN5vxsALztlV6zEcCJy0BF+bJy2+0Qb2+FnUEmOfMqEyVwr4rDVmPsZv4qQW+Ru4xcIIPjesW@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+RCaLHPZbtEFICC8Y+R4XwejzrQ694TrHJqwR25Ovo/aagIxe
	5MRgxdACBwAlyWb5HLSDf+p9apHerS+I0R/coUC8jjqEi/DvZJPL
X-Google-Smtp-Source: AGHT+IH7v1MxAxKTQuKfPWStj4aPyj20mN+ngJBNj3sh6v4ttrDpx3JbMa3EACSiBZT7CPUU6er/Uw==
X-Received: by 2002:a17:906:dc95:b0:a99:f28f:687 with SMTP id a640c23a62f3a-a9de61d1a52mr3431068066b.40.1730786135544;
        Mon, 04 Nov 2024 21:55:35 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:35 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 14/16] staging: rtl8723bs: Remove function pointer write_rfreg
Date: Tue,  5 Nov 2024 06:55:01 +0100
Message-ID: <8034bd15f264cf3857f1e5b72e3b4c21682e2e9a.1730749680.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer write_rfreg and use PHY_SetRFReg_8723B directly
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 drivers/staging/rtl8723bs/include/rtw_mp.h        | 1 -
 4 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 11f9254a3bd2..0db8f623b805 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -256,8 +256,7 @@ u32 rtw_hal_read_rfreg(struct adapter *padapter, u32 eRFPath, u32 RegAddr, u32 B
 }
 void rtw_hal_write_rfreg(struct adapter *padapter, u32 eRFPath, u32 RegAddr, u32 BitMask, u32 Data)
 {
-	if (padapter->HalFunc.write_rfreg)
-		padapter->HalFunc.write_rfreg(padapter, eRFPath, RegAddr, BitMask, Data);
+	PHY_SetRFReg_8723B(padapter, eRFPath, RegAddr, BitMask, Data);
 }
 
 void rtw_hal_set_chan(struct adapter *padapter, u8 channel)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 3f42b1fadc13..24d722bbc34a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,8 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->write_rfreg = &PHY_SetRFReg_8723B;
-
 	/*  Efuse related function */
 	pHalFunc->EfusePowerSwitch = &Hal_EfusePowerSwitch;
 	pHalFunc->ReadEFuse = &Hal_ReadEFuse;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 5c19f329e78b..ae873147a561 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,8 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*write_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask, u32 Data);
-
 	void (*EfusePowerSwitch)(struct adapter *padapter, u8 bWrite, u8 PwrState);
 	void (*ReadEFuse)(struct adapter *padapter, u8 efuseType, u16 _offset, u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 	void (*EFUSEGetEfuseDefinition)(struct adapter *padapter, u8 efuseType, u8 type, void *pOut, bool bPseudoTest);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
index 30d2539e37f3..5a1cbd2ed851 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mp.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
@@ -276,7 +276,6 @@ void _write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask, u3
 
 u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz);
 void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz);
-void write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 val);
 
 void SetChannel(struct adapter *padapter);
 void SetBandwidth(struct adapter *padapter);
-- 
2.43.0

