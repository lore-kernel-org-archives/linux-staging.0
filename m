Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF617A59D
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160499; cv=none; b=jzkz/IkSnMrNYTZNCgM9ck/D5gBs8KsnWQdCGxB/d3G+lMPbBwAqSvUmzQyFzF5jo811g9e+X4UiKoW0NwqV7krqRbzh3N1cYVT7QKcG3IASq4ON/cHrGYk7isz+OTMJMK0Wovg/E2V5pneDlH46A/wexIpRQ8+EhL99+UMm+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160499; c=relaxed/simple;
	bh=v/0CCal0XeJHTxlmTvs+auc6waxNoKMfAJtePcsbDrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrBn/rv5jdjMsRHk1DTC+dPV533aM0SKs1NHLVhs0WW504ohOhnzqxvAtdnoz4n0WkhZBOpNZc+TEp7GLIxbi+wMAK5YW/hV3YVWlCAR+t+TYfaaMtVvczcS9rPFUwZWE244cPJ9wRAsN+sHtskP8F6tyraS6V9fnLmyXmBhSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjxqUtor; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjxqUtor"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so28046285e9.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160495; x=1728765295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylO/EeDKWQv57ntwn5IyR8C+2g+4AGbXBkezjN5eRTg=;
        b=mjxqUtor8TaWXP8UkiCimLEnA07uYs9SnO8HG5UjkcjmdZND/e11WVQMnYbZ029fur
         H8w2JR0uLTsQOofbaoMdu5rxk5n448ePSxOtwD24BfZXAjmPilttyEo6nS+uNcqrGe73
         NDSuh+3yzBaOKEr0Ef7IxzHFGCNTI8HIQWRx6r9m5e4x7ZPgH8QndZwt7vsoMfurN+Y2
         l68WREoNNXRd7xX+Ir4V25G7ee7rYd1F1EUj1zEFWiXDD4NHIOm7MjypS/yfpb+RrN64
         FMSTIa4f4Y5T+OT+O5h3QJi3EpAf2G8uKDZurAwz9M2dpzXx71UopDJ1F0B8LwNZ22vD
         A2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160495; x=1728765295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylO/EeDKWQv57ntwn5IyR8C+2g+4AGbXBkezjN5eRTg=;
        b=dTvBgPtEp0oiUJRZ1as05wOKegbxS8q1bBRRk0hcn9IZQZnA7EKZbaKX9zr9iUplDX
         12LHc7b7vzggcHbF77BK6roHdBZMpkgSNXs3aMojg5T4Utfw+HPw+himZ2C4LYwXN8su
         b3/ZZ3/LSS1r8ydqGwBnjW6W0//HxZDBqhd4OB8+um5SHQTcp/duliebcieeVBDJ7fQL
         kz3Tzo2JNzI/uLEuNBSqLonG/8WOY58fxlaPPTWcCpmKEopySL0azODk2tShCD3mdiUD
         0PzqLF6udW4/jRKZcshr3IoOF1JpgR5LWSUrcaLjfRIygcphx+dnEXHGoRrHqPb4AHRX
         4/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCWWKT7fTvmQMDfFMGohX+izhQt0HEuROmR3FKuxVIWOrNQ//Yd791s9oTmE6/s/hjXdXXENZHU6R1fupe@lists.linux.dev
X-Gm-Message-State: AOJu0YxAAUv75OhScdq2LrPKozxy8wu5iLtpJmQ2JMU1L0t8eAPzLq+J
	rOUwLOdL28+tL8zc64UlXNQjpw+0KuFA4uwXSWdq64i0ljPEFyJG
X-Google-Smtp-Source: AGHT+IHvJeJsMbNiPNPQjxQo5TSvsoA/+nIbfZH582r6HxcKE+mW9CKhVzuN1faSrVgzZIwzCrLxAg==
X-Received: by 2002:a05:600c:3ca6:b0:42c:c1f6:6ded with SMTP id 5b1f17b1804b1-42f85af8a7amr53617885e9.29.1728160495192;
        Sat, 05 Oct 2024 13:34:55 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:54 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 13/15] staging: rtl8723bs: Remove function pointer read_adapter_info
Date: Sat,  5 Oct 2024 22:33:56 +0200
Message-ID: <24eec4df528051fee3cf850308e009f114e14288.1727966761.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer read_adapter_info and use
ReadAdapterInfo8723BS directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 4 +---
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 drivers/staging/rtl8723bs/include/rtl8723b_recv.h | 1 +
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index ec95d3ec3170..efc4b44caad3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -14,8 +14,7 @@ void rtw_hal_chip_configure(struct adapter *padapter)
 
 void rtw_hal_read_chip_info(struct adapter *padapter)
 {
-	if (padapter->HalFunc.read_adapter_info)
-		padapter->HalFunc.read_adapter_info(padapter);
+	ReadAdapterInfo8723BS(padapter);
 }
 
 void rtw_hal_read_chip_version(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 6a56a5db5a5f..a6766a98042c 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1132,7 +1132,7 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 	return _SUCCESS;
 }
 
-static void ReadAdapterInfo8723BS(struct adapter *padapter)
+void ReadAdapterInfo8723BS(struct adapter *padapter)
 {
 	/*  Read EEPROM size before call any EEPROM function */
 	padapter->EepromAddressSize = GetEEPROMSize8723B(padapter);
@@ -1259,8 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->read_adapter_info = &ReadAdapterInfo8723BS;
-
 	pHalFunc->enable_interrupt = &EnableInterrupt8723BSdio;
 	pHalFunc->disable_interrupt = &DisableInterrupt8723BSdio;
 	pHalFunc->check_ips_status = &CheckIPSStatus;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 1932f93d89c7..ed303a623e1b 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*read_adapter_info)(struct adapter *padapter);
-
 	void (*enable_interrupt)(struct adapter *padapter);
 	void (*disable_interrupt)(struct adapter *padapter);
 	u8 (*check_ips_status)(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index dbd051a34d90..783f64de0aec 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -90,5 +90,6 @@ void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 void rtl8723b_read_chip_version(struct adapter *padapter);
 void rtl8723bs_init_default_value(struct adapter *padapter);
 void rtl8723bs_interface_configure(struct adapter *padapter);
+void ReadAdapterInfo8723BS(struct adapter *padapter);
 
 #endif
-- 
2.43.0

