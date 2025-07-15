Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ECD2BE625
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604114; cv=none; b=macktayZMmBBGVCtRc41nXOpiVDBSA9kWoGsQL1R9jTiGhHA6bKf2acbca7Oyw+EO2VJ28wfks+LrMXGUxxtDu/20MMlP7gsbR4LqragMNlNL2Q/jltLVwNcym3j4GVvvUFOchL/F32E0+BNa5C3xRKsRvHNpyJxgFoXYMWyseE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604114; c=relaxed/simple;
	bh=ECgy4eTfac1zqO/5HUEbRVZsjHDefM0HEHpusxU2ALU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFDGMcJxbcdKgKVlWRRx/blootDFDD1Za6kXQXSZ/Wn4tbCIjhmAyEbPUVDduqb4Lip/GEyt3SX7ujulsRP6Ias6ITKrblhfY10o2hcMSui6VppMLE9kclDj2S5efuHhZYNJf9OpHZvZBwuK8ijRW/qDqt7Z1qQ7NXuO/Ynvyt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUZp1WWX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUZp1WWX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-adfb562266cso1001932366b.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604111; x=1753208911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+48D3Zf8xbVVJZn4wq+ACZZdbOHepuaxIXkDtYoSUY=;
        b=PUZp1WWXFrIOqhFoE4t+oM2BAf860pZhfnWdYyJ5dhY5T4BTiWvyOoT/rQoQWJ7p7f
         QuAy91jnhajmFWeh+RhA9/rrxzj0EOJ0cChzWW5Xj0Yf28x8K5oRp5EoE8J3fchQvxB9
         gKtU3Ryl46e8k5PRRh0Xo197Q7AhO5z2DKn2fVYfzaiR7SQWwmTX5BPOv3YWXIVETfkv
         7dWhvP9EQWadMo/Qrxn193/b1Lfv5qxdKXzTMH9SRbmYF9xM5XUn5azqCPyx5mRuzMPD
         q+oDQN/1JL47pCvgIYnTIrH3WooXaIksK2zf+rxoYShVSVTQ2o/HgMg3zlbGgO/2PvcF
         vy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604111; x=1753208911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+48D3Zf8xbVVJZn4wq+ACZZdbOHepuaxIXkDtYoSUY=;
        b=DfA6EWr0teGur/zgEnnPgJmk4VLz/Fa1bMoMo/Vls2tyVdV+mQGiYuZm/XUug24GVB
         JQBNfLdMJ1QwvKM8YQW++q/yQRMpUob8O2LE/MfEFloNmVg5Nl+QaVw5uAe1AUmkfpcw
         PGefdYVB+bctJt78bmpsyyLrTdKEt9r9adTAXiQ8C3n6OgZPUUYmmsA54CMvZRdkhU2t
         a7dG97nivTgaNhUPcaMcTyfsxBvMQ/kyMW4DoiE2MJxqP+5vHFhVikE8CUeav9xzzrtg
         c74CPN61t5onFfkGlCElSIdw49VZV2LOof6BYdJhwJJmLRzUH5tvea+p/yPtRsSsQ3Zu
         4aUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyRjBq4qBLlKnxllXL82AwK2zFi3xSRwR4UO+bUrwZqP3VBc1giShInccULNwQAxPhnRJrhsnZ+33E0ldF@lists.linux.dev
X-Gm-Message-State: AOJu0YzutuR5eAzPN3lOp+K105tb793P1CVxqXPwmc9NMiAXUIqKUCRt
	M/tkcaPMc+B7oUvmJjhXE9g/BATGU33lSC84j3vPlUqUV2qf9nEVt70P
X-Gm-Gg: ASbGncvKciawsgsYD1kruikAUFs1WPdjPuY6/T7R4nzNVxX9zIr/WNNk5HOd7aMbjDK
	UgfEu912qTrKHN4cq5a8Ioo6lARvW6zXg4N0WgUCLt7/+4hszMS5VJ7iICS4n2VFcPdtPzIaWJ3
	qPtWpLLQ1OC+Z4T0rqgDcOxjRKmNOKrGOdddphW3RSaxfXM6E4Hwqllqr/OUS64cLLAGIbEPMqW
	Zs++YgW+LbT291ZIkba5wwFIAQix2lV8RHtr2kJgbVHMIaGB1J1Y9RtnWltdEnCuulS9nT17zh5
	+OV5M/Hn35iP316lu+vgsVKDMQH/SeWHDUSdjAdnrP/WA/R9/JF72vV4+uE3ckgbGWrTKF0cblA
	kb4rvTU/QA9hD2pDR+89KkmaGedtmybk6Tw==
X-Google-Smtp-Source: AGHT+IELtnyR9k831DsLwjCiff8k5Se84nYTUQq8W20bGrQgtIzUresPNYgOEYpuqARkZHkHgdio7Q==
X-Received: by 2002:a17:907:7209:b0:ae0:d804:5bca with SMTP id a640c23a62f3a-ae9c998539emr55804066b.17.1752604111002;
        Tue, 15 Jul 2025 11:28:31 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/11] staging: rtl8723bs: remove wrapper rtl8723b_SetHalODMVar
Date: Tue, 15 Jul 2025 20:28:05 +0200
Message-ID: <20250715182814.212708-3-straube.linux@gmail.com>
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

Remove the wrapper function rtl8723b_SetHalODMVar and use SetHalODMVar
directly to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 84c64bd04598..eb34e39f3c64 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -129,7 +129,7 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
 {
-	rtl8723b_SetHalODMVar(padapter, eVariable, pValue1, bSet);
+	SetHalODMVar(padapter, eVariable, pValue1, bSet);
 }
 
 void rtw_hal_enable_interrupt(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8b7816e47131..a6eab2819535 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1267,11 +1267,6 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write8(padapter, bcn_ctrl_reg, val8);
 }
 
-void rtl8723b_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
-{
-	SetHalODMVar(Adapter, eVariable, pValue1, bSet);
-}
-
 static void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
 {
 	if (enable)
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index f9f169262fb4..3626e1505848 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -276,7 +276,6 @@ u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariabl
 u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
-void rtl8723b_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 void Hal_EfusePowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
 void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
 		   u16 _size_byte, u8 *pbuf, bool bPseudoTest);
-- 
2.50.1

