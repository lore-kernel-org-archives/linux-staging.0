Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970421FE0F6
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786133; cv=none; b=OQpFkSGbD6ufwxXfS5yGzZvDGUNKuPTZir7UztcaJlYlhVxkpZqwfdgSoDNUDOsCcxGXZREsbJ2XrOsnKIBzOVGTaF2m7LFgcLDMsijpoIWoWv6WtOz2dAc7AKCQv9odILhRUmywEUGdGErrzlq+Ea7M+cv+n6tdQ7xC7O7q6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786133; c=relaxed/simple;
	bh=iZIgD4kf+Ww1++LYU44CC20JiDSdN10U4Ssr9cbPSMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IlqGm+YmsCXuTw3OOKmVriTb5Aj3KaXSkmDN3yr2wKyLY49Zy3qz8Ldi49MF413oH/a/49WO7npYU6Ti7Ng4TFaS+gMRl65nSrbz07DzByQx440lLjqL5y6V4fbq3JavuhhTY+HKIanzmjTjMlpPnU+7vGdJfkOcChdRkf7VZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZR2/i+u; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZR2/i+u"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a5f555cfbso378513566b.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786130; x=1731390930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6DCAV762f4pW99ALqAJAaS4UQZ7p3HFWxh9RdFODKg=;
        b=PZR2/i+u5ao2A4LFx+edSvUU6eCVDT4qCaSPOSKABZRAaZqvvFByGvvgLuicyBm7x+
         1aB+WNMS7LzKDLoOue44uJhVln50Xi0z0I8rm3Zb3fJbMya5uo1ExKbOHFOiehsEKil8
         3aNCfr9ycVs4GGjov83uwDjtUEnPfFM+1CoYXXKshfwYZaGcfBukg91/EHQKWsO+23QX
         j1bh03BKEWFpnAhd3tNR8b2c5BHeVhCzEZmMZeHBIcKT1rvt8lkUpvIbMAHev5gGKCmw
         RqOyitAYrJ6uz9lmuSZ8pIPbbKb0NyGWQT9oW4xEq7125Rnm6Qq5rs0fhMASDzH59bQl
         6/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786130; x=1731390930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6DCAV762f4pW99ALqAJAaS4UQZ7p3HFWxh9RdFODKg=;
        b=R+4JvyGPY9dhgkmxItH0xnXMTRkJA6jDuYvEsvqD/CXkIqfDy3oZZRMoU0XC+GXYFs
         /gDvlCfPck0LVDTLyCssrCz12fbBQPJsnIX7by/MJDnatFNDx3Ct/bFEYFsnGSsDCpEU
         gBMSkW5pq9fCIr1hK4tgKOwwV6s7eZYhS9efopaG4+hlf45wAg7VQX1fWokwYinM5HYO
         F5iCboKNdUNM6hRE2XbMgMBYOseabGa9dfXh/6wWZMd5IJfnn6BIU/wo5+MCVqPEaU39
         3cbVK0No9FIl3ftcWe6ilCEdDEAV14r0io5gEg3rEXMu2rn/c5EDX3wZeEADqVlFYH+V
         dW8w==
X-Forwarded-Encrypted: i=1; AJvYcCWiJybS09NqVpzQrW6VeBvLHMQLt0qEWQEsD6mGkH6dYmuw8m+nZZx/eW8u/9wD4Lk1Fa+qfN7H7TyUNjfH@lists.linux.dev
X-Gm-Message-State: AOJu0YzBfHC9q6v/NNpMB7ye7/XjEX012RwygOS5ny85bcliz1LMVxIu
	TnxNySrRnior2Np+KYYcl2cKg3jBf42s17sG/NJIEAnolSe1cIZC
X-Google-Smtp-Source: AGHT+IH/YeS/+k+7hcyK/7k8TRLFjq3T5fB/gu7B9YmbPIExkIN5JfU8g+Hyym43UCBxdmN4QRemiA==
X-Received: by 2002:a05:6402:1ed1:b0:5ce:df98:c080 with SMTP id 4fb4d7f45d1cf-5cedf98c179mr3143428a12.3.1730786129739;
        Mon, 04 Nov 2024 21:55:29 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:29 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 04/16] staging: rtl8723bs: Remove function pointer set_tx_power_level_handler
Date: Tue,  5 Nov 2024 06:54:51 +0100
Message-ID: <e120c858d268eaae822ca0b582e453af06ef0891.1730749680.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer set_tx_power_level_handler as it is not in use.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 283208e1de5d..f742a82d1e35 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,8 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->set_tx_power_level_handler = &PHY_SetTxPowerLevel8723B;
-
 	pHalFunc->hal_dm_watchdog = &rtl8723b_HalDmWatchDog;
 	pHalFunc->hal_dm_watchdog_in_lps = &rtl8723b_HalDmWatchDog_in_LPS;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 2b3eaabf0774..ddc4c41605d2 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*set_tx_power_level_handler)(struct adapter *padapter, u8 channel);
-
 	void (*hal_dm_watchdog)(struct adapter *padapter);
 	void (*hal_dm_watchdog_in_lps)(struct adapter *padapter);
 
-- 
2.43.0

