Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492D1176FA2
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160498; cv=none; b=rtwOx2ZHaZ24EfeZjkZOYRIA7lBBKRF5wz+BV7MmhMwdTq91kIh5tiCWdm0LjDUF/uXeuLRvwWVKhm+1ccIWwmhl4jFBIMCdJooF5/++X24c5wGtzlQtPwFFAHKeQPssm5nDXbcnFqMljU2p1ZREKZkLwojjMhT0roxyacjB7IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160498; c=relaxed/simple;
	bh=krpq0fGgzMVWgb9E7YyRR3doZAOwCWPNy5qDRMYUCGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXHyUOqpeqGXzXeIECfuFbCvSyGPGv6QfahN6+U0ipQLPz8S0lXupNDyeH8TNovor4VNE3wcN3XjY4larN/gr+QuSdqAIeZ1J1qe3l5fNFGwI2sQdWT//NSKyyCaq5dCTNtOoy1XMveXRYctY+BlrueUv7p5qWMu9fFYVc/q9vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwyen60S; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwyen60S"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so41610585e9.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160495; x=1728765295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7spXH37LdfeWovbaJGZA+/T7zLQ1/vnpaj40rcnBLOA=;
        b=lwyen60Sg0FczcRG+KI6rYS6Ub9KeRpwnFJXD2cb2wi0aqXcMgigCdqcLnYk+fW2wg
         Kj+mJEkkPAcJMoeWvxBOqcPAoOIRDRVpmG5qz4jSqCgvpgykGhzYy+8OF7X2Cicb24wq
         byOtbbA9NcP4MwPJvpOfIPOrq1748yHA2YtCiMQr6bokO1SfMG1ePosQ5mM2SoC40Lvo
         fhVqrNZXdWCRaczk+h214mhnZd1wH21UI3hqLvyCgRxqhPS8MJMRPTAjlUAxCiXJxvAv
         EBOYj/z0NGLmMlhyokoeBP5gHZlHs//jyMhdw4SR6fT11z/LY8RutD6w0Ueext4yZwKE
         ADQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160495; x=1728765295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7spXH37LdfeWovbaJGZA+/T7zLQ1/vnpaj40rcnBLOA=;
        b=eBMBzhgR0S5mDjvL62xhZCITnl3EUDWl32hLWMd1DyGPb3ENlOIaJfbB4smDyke1fT
         tslskzBwVcJlcSwgMthStzGvR/mOzWy68hlph2vpRYPRc/T+1CYv80lojAEhlt9aBlze
         VfzlMAvMiQgDXMROcGd1P3AoRTzNotB8afPfQB6iVN04s2jggnIzYE7H7RFT219+a6fv
         tkcdFLaX5NmL1Ksb8rz5MHhkyDYqWB65PBKhSyEmm7vLPetEzbAEw4Gzxmb+xME3AdOR
         nPMkE8eAUtXTqFifTA1IaON6K+f0W87bfZNf1YU2CwUPXSXnpztuk+9uXtXskE3slSGd
         v3tg==
X-Forwarded-Encrypted: i=1; AJvYcCWfbKfYASkffORAczFmKPxnxeMj63KJ2/h9FlzjReYnP8+TpDAOItwnQVP+tlrjN7Z0eUjK6bXv2OSL+IqZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzwBFOAwB1kd5d088St2P67SdqXo3tzCIXk3Ib6LWB3fP5O7/0R
	oNco2XxpctRjTLuRe0+o5g9XmN7Szs+pEGZPtUMrmnPD64nZs2v9
X-Google-Smtp-Source: AGHT+IFj9oct3wT0jweApImNO0BKJKKyji166TK/fx62TwVKc6IIDyUeFVLl0R7cRhYgl52V07tcYQ==
X-Received: by 2002:a05:600c:3b84:b0:42c:b8c9:16b6 with SMTP id 5b1f17b1804b1-42f85a6e0cdmr69418835e9.2.1728160494628;
        Sat, 05 Oct 2024 13:34:54 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:54 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 12/15] staging: rtl8723bs: Remove function pointer intf_chip_configure
Date: Sat,  5 Oct 2024 22:33:55 +0200
Message-ID: <d542f172438c333c015b87376a20645eeeae1b99.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer intf_chip_configure and use
rtl8723bs_interface_configure directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 drivers/staging/rtl8723bs/include/rtl8723b_recv.h | 1 +
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index bcbc9ea78951..ec95d3ec3170 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -9,8 +9,7 @@
 
 void rtw_hal_chip_configure(struct adapter *padapter)
 {
-	if (padapter->HalFunc.intf_chip_configure)
-		padapter->HalFunc.intf_chip_configure(padapter);
+	rtl8723bs_interface_configure(padapter);
 }
 
 void rtw_hal_read_chip_info(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 236effa5c96e..6a56a5db5a5f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -950,7 +950,7 @@ void rtl8723bs_init_default_value(struct adapter *padapter)
 	pHalData->SdioRxFIFOCnt = 0;
 }
 
-static void rtl8723bs_interface_configure(struct adapter *padapter)
+void rtl8723bs_interface_configure(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->intf_chip_configure = &rtl8723bs_interface_configure;
 	pHalFunc->read_adapter_info = &ReadAdapterInfo8723BS;
 
 	pHalFunc->enable_interrupt = &EnableInterrupt8723BSdio;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 357b41894cf1..1932f93d89c7 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*intf_chip_configure)(struct adapter *padapter);
-
 	void (*read_adapter_info)(struct adapter *padapter);
 
 	void (*enable_interrupt)(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index 69b5a7df32ad..dbd051a34d90 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -89,5 +89,6 @@ void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 
 void rtl8723b_read_chip_version(struct adapter *padapter);
 void rtl8723bs_init_default_value(struct adapter *padapter);
+void rtl8723bs_interface_configure(struct adapter *padapter);
 
 #endif
-- 
2.43.0

