Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB93E2003A1
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786140; cv=none; b=hN5kXPz1Ky+Mmi5GI2Jf36xpMd633bqPR1C2sO5q3MBjFQ618Buawj+1/2NW46Kl+vZ5+LY/TCSgO1I520oKmGAHcGPY3tl2SVVRfXXnOjevoPEoVAyFN6/hbq8qJJJgjs52Ce6kJYCAoca5AzU0cTKviB1AE64cKXP8cNwDsK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786140; c=relaxed/simple;
	bh=PEV9c5CN8Bf3THfJ8487S+bvz0X2+GqXlJrWWZMXwuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tippl3Ts+hlUfisffsm2WnM+LaGpVgg5POV8uXnY8Gj0dUnTga3z+VKX+Iyf3WvBRZ9GtC8/wSiJgiGOpKw66TFGI53kKhZiXwTl1KpWn7xNsXRx2LB7Odv91UQaDp4LNMklPvVjWeZlo26cAQqHZqknb0czcbN6sHCeVhVaIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdP/N1tP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdP/N1tP"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0f198d38so851197366b.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786135; x=1731390935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dbr3hyjLdufarxCl5ou3JfFmi21YzpkpIPpuyCwiuc=;
        b=YdP/N1tPED7Crl+YXfXIj1i//rwHxFVpjJ4EnOCSptwjqNdE2Pzls9wFk9Yq+pWAd7
         Z6+CI6jNxQRAbDrrxpOO0ppeLF5JvAMp3h/javGl75a4nnLyAL4ppHz74lVx5ela/mro
         f+E8jpOAfDHW9KEEo4Do9s8uAcUBdHDwRQS81MyRh56DoaxXrYWofgrGvCJ0bJZyFlBC
         z/R0qAmZoCN5i0MyZbqEF6rrv12j4veLWzcPw7IzEjEll4gT4b9Pu8F9sPpZ/sQGYADV
         /cDB+rhzS1cKH5J+amIwhLdG+t3L09AIpz1ErZEDR1QbyVv0AwSVBuzhKzHoqpYGFcLO
         OOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786135; x=1731390935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dbr3hyjLdufarxCl5ou3JfFmi21YzpkpIPpuyCwiuc=;
        b=RrXqOT/a3Xk1FHnqLmWfsFoERsa40Vwld/fxjzdHMGKULiBzWhSniaKJv/iRAQ7CaR
         dblnGX7f+Q1/hMZ4A9Dw2y0tcO8P0HpfyMkcIIR3OVbZUJRkY/hMa/uxi3Jku1F8kAsl
         YnYkuhYEeaEkCZJZziCq0eEHpMz7zWEihuTkVDU7a7vkPBXyY720d50HmRPqyygiL0KO
         sLwS6xNztqqtguZ6sO40TNx0a92ySNmFBb1ztTCOdcIzMEb7PnMayL66qlu2TwFhMvKy
         k8ac35Koingt4uFjylzWcH+O2lQIYaVZC7HycJ10O7qSCJ/bHOpIyIwBd+P8M+hAns0f
         4cxA==
X-Forwarded-Encrypted: i=1; AJvYcCXHhrYZ594rcayUwgDpqrktTaWusUzAuBnWNW0iEe6/M/mVRTSghIuwP6BWpzlY/XgvaWBIngn1xHK0/xhA@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf1tY9hByd/mlXilBb+35FQEr6g0rOCk3GQP2gc3OdI3jrmgyw
	FNF5INFFFLJRjxxYPoz/BqTbdcZL4uenZoB3Y3vIoC1lzUk1APgt
X-Google-Smtp-Source: AGHT+IFa66zClCw7y1ZHQKr9UEwgvRTchUmrqEfo5OWshmFousmLRQ+gVzQpVYSrQhYWKIy69FfB/g==
X-Received: by 2002:a17:907:9727:b0:a99:762f:b298 with SMTP id a640c23a62f3a-a9e655b92f9mr1421084366b.41.1730786134934;
        Mon, 04 Nov 2024 21:55:34 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:34 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 13/16] staging: rtl8723bs: Remove function pointer read_rfreg
Date: Tue,  5 Nov 2024 06:55:00 +0100
Message-ID: <bfe77cf38f459ec2f5c185452c274359a3656e77.1730749680.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer read_rfreg and use PHY_QueryRFReg_8723B directly
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 6 +-----
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 drivers/staging/rtl8723bs/include/rtw_mp.h        | 1 -
 4 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 4faa64b1c476..11f9254a3bd2 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -252,11 +252,7 @@ void rtw_hal_write_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask, u32
 
 u32 rtw_hal_read_rfreg(struct adapter *padapter, u32 eRFPath, u32 RegAddr, u32 BitMask)
 {
-	u32 data = 0;
-
-	if (padapter->HalFunc.read_rfreg)
-		data = padapter->HalFunc.read_rfreg(padapter, eRFPath, RegAddr, BitMask);
-	return data;
+	return PHY_QueryRFReg_8723B(padapter, eRFPath, RegAddr, BitMask);
 }
 void rtw_hal_write_rfreg(struct adapter *padapter, u32 eRFPath, u32 RegAddr, u32 BitMask, u32 Data)
 {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index a8191b84eb81..3f42b1fadc13 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,7 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->read_rfreg = &PHY_QueryRFReg_8723B;
 	pHalFunc->write_rfreg = &PHY_SetRFReg_8723B;
 
 	/*  Efuse related function */
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 02c18dbc04b1..5c19f329e78b 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	u32 (*read_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask);
 	void (*write_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask, u32 Data);
 
 	void (*EfusePowerSwitch)(struct adapter *padapter, u8 bWrite, u8 PwrState);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
index 30badc3f8d45..30d2539e37f3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mp.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
@@ -276,7 +276,6 @@ void _write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask, u3
 
 u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz);
 void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz);
-u32 read_rfreg(struct adapter *padapter, u8 rfpath, u32 addr);
 void write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 val);
 
 void SetChannel(struct adapter *padapter);
-- 
2.43.0

