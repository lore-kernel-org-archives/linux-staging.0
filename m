Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4517AE05
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160499; cv=none; b=cXEs5xa3tNKIOfUFy1tR3nC8tnwttTvtWJuaHiHePCNXFULqtjiBoQrmvssNlSQKdPWgHZ9sBtJgy0DuvC0TUS41uHoUCOyfKZgW1ZLH3aTgQ92ABKDCnQ1saG/R3lwwpNTuwUb3rplBo+BeeU29N1CRsmSc7dDfAHw4QFMNGIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160499; c=relaxed/simple;
	bh=EVBlHAuvsFXpnXq2JN7skn/v/lX4N53cicZaL5So/jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pduGZIe9RLD7l8nBxRw8TrBe9fWUOf9ZREYBTeD3g3qXUNgSLkcSlcOzOnUO+W3Bbf0yQVsnnWLzR1Mb/Dd/wc2frtkVT9fGfrVfwFHWMM1CiGkrb8LMSfEkt+u/5cLegs8AupAEicfnyAH+eBKQXig7DtnKgysUcqSBINURyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmXTJrRK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmXTJrRK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so31599135e9.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160496; x=1728765296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSBQvkenhZ5S0EKj6cByYIpak2n0/Sv0jB8kQTzhNJ0=;
        b=QmXTJrRKaHjJOd8AI1yVn5wTpqEeKlEosVbej4qpjLeG6ssaUZq6yqakinakFod76r
         e+xKqqR3RuvUlW4cOaHUanJVTrASUpF8fPuEFG0CJcjoM7hyQ20EZJ98nyQYXo2r5tz4
         H6B7pFrEUqur4PEvfy1qmMe775hzybFI0Y9YgzJ/XVhPYac4aKBEo31CsLHSEg6sC6fu
         ia/slPw95rCQX0DyodKR4i709LYAkgIooynXWS5Z74NejY9Agu9I3ltrFNrbCFHM/Pv0
         XiSrKwvi1ND4oZ0EUys6c2jr4PLOQE6LweCSogOpH6XsIRY4NDaEJPSq/JkI/Zrua3mW
         NKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160496; x=1728765296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSBQvkenhZ5S0EKj6cByYIpak2n0/Sv0jB8kQTzhNJ0=;
        b=nY9S73ICKszyUawfqH1kR8oIT7Qj/56/LXORuZFjJRGnSrtugGq4NvvnyaTier9EEn
         cNHoR97HO8UcQIVWPYmzbEYpeI92AGqxMdFoB0rZ7Alz3cU3lcUAGCzdJfGtUVvO8dmX
         TFTVw+VVZ8bR4auUlcfjSpqpnrl1frKItsJHzWMadE2pmjkMxth6vokbM+rahKpeFWN9
         KY5GipY940efgDUmZE4RwMMO2CRDXTgshMk0wTUN5iyrJNCdE5hqlBmbfphdXXD8Deqr
         /e02ra6cgltbfKlvmvPLsM8tmLWFka5/M8m+BmbMeNnBIkZE1BfGnK7h7nBOdfyf0NC8
         jKgg==
X-Forwarded-Encrypted: i=1; AJvYcCVYGfBCzcfMOaLfsE/7vfexz6jxg/GRjtSf0NBL7sLa0NSBM5bLw5cU8dHSc4L0De5sGHHwLV3KZ8u0RwfN@lists.linux.dev
X-Gm-Message-State: AOJu0YwlxXKmvJ20JU81JaMuiNWJNL46Ip05e3dMInWHvmt+xf4rbuOi
	CYT0zaT/Ve/lD1fMm+p878zw8bsxnihCirv0ZBBLlU+BQufwccon
X-Google-Smtp-Source: AGHT+IEPBX3otu02ikRIi1nWMy7nnlbW+ERjlGid6n1rVzN0v3C9gvy4mHIxK8EbqxHKBA98IDhdaw==
X-Received: by 2002:a05:600c:3150:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-42f85a6d72fmr50211435e9.2.1728160495774;
        Sat, 05 Oct 2024 13:34:55 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:55 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 14/15] staging: rtl8723bs: Remove function pointer enable_interrupt
Date: Sat,  5 Oct 2024 22:33:57 +0200
Message-ID: <728827e155bdcd9951683e485d789d60bc203815.1727966761.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer enable_interrupt and use
EnableInterrupt8723BSdio directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index efc4b44caad3..716eefdf8ce2 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -146,8 +146,7 @@ void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariab
 
 void rtw_hal_enable_interrupt(struct adapter *padapter)
 {
-	if (padapter->HalFunc.enable_interrupt)
-		padapter->HalFunc.enable_interrupt(padapter);
+	EnableInterrupt8723BSdio(padapter);
 }
 
 void rtw_hal_disable_interrupt(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index a6766a98042c..91aac5d1c23e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->enable_interrupt = &EnableInterrupt8723BSdio;
 	pHalFunc->disable_interrupt = &DisableInterrupt8723BSdio;
 	pHalFunc->check_ips_status = &CheckIPSStatus;
 	pHalFunc->SetHwRegHandler = &SetHwReg8723BS;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index ed303a623e1b..3b35bc30ae37 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*enable_interrupt)(struct adapter *padapter);
 	void (*disable_interrupt)(struct adapter *padapter);
 	u8 (*check_ips_status)(struct adapter *padapter);
 	void (*set_channel_handler)(struct adapter *padapter, u8 channel);
-- 
2.43.0

