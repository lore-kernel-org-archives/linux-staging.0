Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDD16D4E5
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621700; cv=none; b=X1xze59ZJTRQ7i+dOcbLxqHCRpwuYkZVSn/hw7fkIKHE/+r0WvTH+elkALdu6q9S3InUcWUSjczjWC2Ix+heQmW+6MLT1vY65GbygF7SMLpiWpexPb75vezL6lPhUXbdnGxpBJ1I/1fNSdv38+mx0wKXBZZHQQH3Wq9xoijfVHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621700; c=relaxed/simple;
	bh=foianf5GbEjiOynU1NgnOCC5X8SQZgug1oA9qxXf6a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RlVMZV5fOViZehffn7dK4atAVAbV5ZJgb0BVFckAlswqZMcXkxcCSULcll6yUSjYne0soxK1tPlGRYia2qeKeVWdyuh+aATJqL6tc8Ek4e7pprrwBBHQRk6tJxqI2e/CUUlSyiaLk8nBEurwG8KepycFtqxLhhbsjXgAmb4rjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLnOw+gV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLnOw+gV"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so247181266b.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621697; x=1731226497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gM0cL0DTEnjbvAhRpIiouok/Vzfr6uGqtogpiF0AT4=;
        b=PLnOw+gVQVodnE+oyHwqo5BNHPLnbcPNgsO8DlMcMbzH9mCxHnYEXws2wfRuYAJrXS
         5Y0mvB2/cy7XuTlvQ9uY7RwKCiAfI/4LJfi4b2BWrAfIAfi3i0qbcR+OcY50UaV9p4GR
         6LNWnn4PDIOaHLp+ZryH3t+nNcdamqQY1yEMyG5ciPFn1J1eeKTCwxWCz9vzx/qkRgcC
         UwHVEAZ1Z1lFqsmZhL1uruhL10nWV/cX5+ERzMvS1aWIZpXN/IDYBlpVty8fecya+M6I
         FNa2Bse5Yuhy2xalSPpg7mK//Z22q3b1ebRclEzkxuMKjd55KqulEMx86zqlXNm2wEMC
         R1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621697; x=1731226497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gM0cL0DTEnjbvAhRpIiouok/Vzfr6uGqtogpiF0AT4=;
        b=d4UHoO2NKpkVJWHT6xliVdlvgw+3FAkoTRUiRMF0+/RWtpVzYgP6OnI1WYfCrQBF0u
         aHVczL9tzdLoLBadLBBeNVzEdy+YIcWmqDamXQHBl8ynurv9p43TWtlvDStXMPg2Krzp
         VsfW6fUAGQ4Rc/tO7GSvbXFPCye6HEF4IjGYw7SqpfG2HErp0d6XZFobXfpxYxAQ23Ke
         kHJvSfCQVon7q7h96XBZu+9IzcgCFxig6qvkn/uSTMmVmzDhlIzYhYLuKxOPZlWnlTbm
         eS1bbME7sZgi6esSgDp+SAPhAQINSLeaC6E/8+ACgD5utAKg4opXLd1Tj41bu3SHo/2W
         +4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUJNeqISHk8zMZ4J7cG0TzC3H7Rpvh6Xc6+WqMontsMhDTiQy9l7sVTI2QcFIDRjQCR/pzx7uoCF2VVqKsg@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbdd90u0B1zWsLlL0kDh3nfhWFMq5mVNVjN0VVkolMurh+siS5
	pqdqoaN62+4q+7lqOViJ3u+K3xGjdUujCKySY9PQ7H3rtZEKLuzR
X-Google-Smtp-Source: AGHT+IE16GFYIvZVlLNKzvZAYIvdHcwYwrO43A1tdLl67+tEtd2/urkRmMiGFvM/dxDBOjZCho5T2g==
X-Received: by 2002:a05:6402:3584:b0:5ce:caa1:ca86 with SMTP id 4fb4d7f45d1cf-5cecaa1cf32mr6005105a12.24.1730621696613;
        Sun, 03 Nov 2024 01:14:56 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:56 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 08/13] staging: rtl8723bs: Remove function pointer SetHwRegHandlerWithBuf
Date: Sun,  3 Nov 2024 09:14:29 +0100
Message-ID: <e8bd652b669961e8dfe331a3a27adca47309960a.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer SetHwRegHandlerWithBuf and use
SetHwRegWithBuf8723B directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h | 4 +---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index d7b29d08ff15..ec567ae99f10 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -118,8 +118,7 @@ void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val)
 
 void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf, int len)
 {
-	if (padapter->HalFunc.SetHwRegHandlerWithBuf)
-		padapter->HalFunc.SetHwRegHandlerWithBuf(padapter, variable, pbuf, len);
+	SetHwRegWithBuf8723B(padapter, variable, pbuf, len);
 }
 
 u8 rtw_hal_set_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index d3f86d811879..beb74a40e91e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1204,7 +1204,7 @@ void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
 	}
 }
 
-static void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len)
+void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len)
 {
 	switch (variable) {
 	case HW_VAR_C2H_HANDLE:
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->SetHwRegHandlerWithBuf = &SetHwRegWithBuf8723B;
 	pHalFunc->GetHalDefVarHandler = &GetHalDefVar8723BSDIO;
 	pHalFunc->SetHalDefVarHandler = &SetHalDefVar8723BSDIO;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index b53804fb186d..d6e8eb95d391 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -170,8 +170,6 @@ struct hal_ops {
 	void (*hal_dm_watchdog)(struct adapter *padapter);
 	void (*hal_dm_watchdog_in_lps)(struct adapter *padapter);
 
-	void (*SetHwRegHandlerWithBuf)(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
-
 	u8 (*GetHalDefVarHandler)(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 	u8 (*SetHalDefVarHandler)(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 
@@ -317,5 +315,5 @@ s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuf
 
 void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
-
+void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

