Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA41FEFA3
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786135; cv=none; b=haMrc/CQrz8j2of0fhnwy8g/htlter3/Tz5o/Kv6rcydKvKjG5GOhHyYKiBAe5KgSAXZUGlV1zB/5tQpyJ10T8trvwsRJ78RVEr0NtPz4ZPGmz5iVjAlADMXrNvELM6KOFYMn2oKe9dqcNNpX1XStuMlo8L5+Yh+VuwzR7i9Ywc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786135; c=relaxed/simple;
	bh=5ubW2P8nj31L3YwYGLfQkrwdfjsuU/5UNoEnXJk5TcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQ1ILAle8h9yLX/V1V63aS0s3B2DB0pFC4vBvpPZbyYKqHIu93Q4qwtEwoAEbrKI8O05Fva76mzyee2xv7VpxR55xKezcnPRv2K7fko7dFt64oD9MxE/FLYDsn8Z5J2t1BwPxKFMLwftAOA0aEW8CWRUpYfN4GkSGzu97dQ6ipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcGgyDuC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcGgyDuC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99ebb390a5so1088809666b.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786131; x=1731390931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVw8pc8RwLb6Pyd+jaXfJi+tviZifucpMgcZ8jtEoBw=;
        b=EcGgyDuC6Lg8f4pMwP1y0Ldl8CN6HVkxMvoFGZZL4WeRrj1lbNF/xRDkKzjH5vzLg/
         fxzYxRXOPFUxRxaqKxKIMJ3AZQcvmfXjLQvUqm/huf3SBaL2cwjktlBBzrHbJ+R4i4UZ
         +jichxzVoov3gCUADQVGgw7IsC1TGlFhzxWY8DVSfRWj1TyWN+ogIcP+bqwV7q7Ay3Jp
         buqAA+RFw3/B7BijpXaHJSb8EY3/eEX7ZiPkIFhEoTUc8s4FXey0Ob9QhtspyIdVFYYa
         BxPCJo401B02PxMRQ5l/yyyH5YG/mh6OP6+2RyLtcf9XBnvlM3Q7GSp66uyo7f+EmEV/
         /dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786131; x=1731390931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVw8pc8RwLb6Pyd+jaXfJi+tviZifucpMgcZ8jtEoBw=;
        b=RJRWYYgCw6ibmehSV2T+vfOvd8r/3+zLLYRA/uDEkp+wSW2e5sGVEkhoXPHGCcCJjM
         sxykSksjeUZpsgov2hQ0DHw5kX8wVgsCnbPd5NEoPWaIBiPkHnqXoSvcgwDtyJLXgiS9
         btNVC/RqQFUO6xt4slD9VG8/p15kHcbT17yHXVhyXCm9tlGOG9Yjtn4FwLVEZE1VhNmb
         ME7Qqks/nWxBM3josUeIHmRTNC8AJiTk2Lj9D+so4PznIPz6qXaqHUmRvZpz/X1YlXCl
         X11Ye5i7jeDAXj96AEbvtIgEeFpxDh8W+fCsRMefdSmAJo38bk61K8IMBCa49bwbaeRH
         NNDA==
X-Forwarded-Encrypted: i=1; AJvYcCVnk2XaHYdftQprll6ZwWmwNclYaCmmD5AWhIZ3/BWHXYpJgd0gqtGXhjnV7bXkuL3RvIjEeezwgaVHz0E9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp5COSYUbipUVau2Z9/o6I7mcYQmze4VmTQLuhOmLquSdV96jV
	mehwg3mQibTQengnmHw6nUgxSjX7uDtoNRqIDOvgU8izimhuj9Cg
X-Google-Smtp-Source: AGHT+IG8V8sNLLQdRs5cgx9f3X8DQT4oTzIIiDgCyDmgVhtu7NXy/zBTmrQLJ+4zUanOtciXpKOyAw==
X-Received: by 2002:a17:907:608b:b0:a9e:b28c:29be with SMTP id a640c23a62f3a-a9eb28c348bmr157920466b.33.1730786130944;
        Mon, 04 Nov 2024 21:55:30 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:30 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 06/16] staging: rtl8723bs: Remove function pointer hal_dm_watchdog_in_lps
Date: Tue,  5 Nov 2024 06:54:53 +0100
Message-ID: <313978b8c0f331200c1a8dc3382b01088930c0e8.1730749680.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer hal_dm_watchdog_in_lps and use
rtl8723b_HalDmWatchDog_in_LPS directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ---
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index af72e0fe6fc0..f3666b26ffe1 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -291,8 +291,7 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
 	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
-		if (padapter->HalFunc.hal_dm_watchdog_in_lps)
-			padapter->HalFunc.hal_dm_watchdog_in_lps(padapter); /* this function caller is in interrupt context */
+		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ff899a066b33..844ef4a80ad0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,9 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->hal_dm_watchdog_in_lps = &rtl8723b_HalDmWatchDog_in_LPS;
-
-
 	pHalFunc->SetBeaconRelatedRegistersHandler = &rtl8723b_SetBeaconRelatedRegisters;
 
 	pHalFunc->Add_RateATid = &rtl8723b_Add_RateATid;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 311a97c31518..1e2bed9ebeef 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*hal_dm_watchdog_in_lps)(struct adapter *padapter);
-
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
 	void (*SetBeaconRelatedRegistersHandler)(struct adapter *padapter);
-- 
2.43.0

