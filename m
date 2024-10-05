Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFB17BEB2
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160499; cv=none; b=h/uUEZ/GdwIWrNVQFpqo8XsvmlqrZ8GoGy9J6YHQv28ZBH95R1xMyHWV8g0V/DYFyMn8WYAPRwEeVGyyU7WA4rS9qq+stkFLnVVYyXoeYxtTszpRmOkyiXrTcnw4OnMjI4wW/ObNQbMaEs5i/cxsdd6K8G6eCojKrivBuZxg0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160499; c=relaxed/simple;
	bh=1NPyRFoXYsmzQmVr+4N2D8CkoGezEPggmbkJKOyKrvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HA9JSIcNJuiRKcJG8vtaDw5CX+/AkBZERideo2Qj+9nXjkZNlzY0naRxwXJZ4Po7JLQ1YWLtjBm+P+ALsK9ECihIaxtTxLbp0txmhYQwx9ZTIUh73jWbPu0mo2dwInN2bkx+N5IC80yeOhdeJ9xDfV+HJ/Do6oL9rfweM5KFAps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEzY+rgh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEzY+rgh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37ccebd7f0dso2144368f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160496; x=1728765296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAmU5PIwu+h3iMbfgPqTdmPj591zU2oyZRmEuHd0hfo=;
        b=OEzY+rghtw6LiRyX+ScNJpYluSzqw1f2hJTHo+zpUWNh9PAhq72tCWIs74pvLPPG5+
         HlZ0TCL8Mu1P3CVLEtV69uQ5ZjQ6vrvexg8IMNGOB59smpaSfiOXsWFpehfc01nBgvau
         1schh/bwOAhxrE9YHtAt9Cgk16XiAyU17FAgQNRBOctwIEAKU6bfZ5wyK403qHaNUDYy
         fyPLkA2Kn1wCkqsY2yIsCHaP9dNMhrg6Ex1oXwRFc9/78XcPU++QuJESaothWnjC4iJ6
         vK3tmVr6FOviOuYOSnZqp+35o3G2Jpkcx/X4anT9W+fyy0lRFJX/yINoFCvzNvazWVnA
         vQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160496; x=1728765296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAmU5PIwu+h3iMbfgPqTdmPj591zU2oyZRmEuHd0hfo=;
        b=Ave+y8lS/HFocUGfaOpWXIFHVM/KdaffkThPiMs76tRVlXaKci5FUXWnZcw6GWrl0q
         wleGR5KUkBw0ULosc/L3Be5Cs73Nwi4EmajhmgqvWM63fYHJLcTAgRIPdmyk76iAPlBK
         JIttKrqg9DHZBgzJS2D+jee4zdVVs6r9n2skn13tTK9jFcuLPPbi8IV439956E0C3LRs
         j6sRPOUtRyG2AH/o+H5vgPMVtYMvONTY5ROzP44BiXXEwmj8JWlSHUtWzJjE+ETP6faP
         LINbippuc9cmKTdGCr9eVkdhFKvvtqFrLUPNMk8FtQGL3qegG/DrMXW+mokvQhFhO5JH
         i0IA==
X-Forwarded-Encrypted: i=1; AJvYcCXQdet53p/9feUNmUS9VdKjkCh5bSLi9yIzA3VUj2mMIuCu8Jv/XpNHtzYXUuGHBzge4LzFWWvbwv/ur2oS@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi4nl6juOBQ5uIJGyA7ntpmX6En+1mGAF14yyN9bUMWJVNrxMw
	wF1DpolD15VaKn8d6zoYd0PJ0i5RQpSeAyL/2DyHluvi5byDR9qg
X-Google-Smtp-Source: AGHT+IE3u2d/XA/BRxCRMYITyUm7hpGLoxbouAX4SbeqDTeKf+IbH0rR2gGGhqLu/isVMKOYqvE4vQ==
X-Received: by 2002:adf:8b16:0:b0:374:c69b:5a16 with SMTP id ffacd0b85a97d-37d0e8de89dmr3949246f8f.50.1728160496269;
        Sat, 05 Oct 2024 13:34:56 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:56 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 15/15] staging: rtl8723bs: Remove function pointer disable_interrupt
Date: Sat,  5 Oct 2024 22:33:58 +0200
Message-ID: <fee97dadc88bbdaebd82c99d0b6106d58315bd85.1727966761.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer disable_interrupt and use
DisableInterrupt8723BSdio directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 716eefdf8ce2..11d75b1b1ea9 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -151,8 +151,7 @@ void rtw_hal_enable_interrupt(struct adapter *padapter)
 
 void rtw_hal_disable_interrupt(struct adapter *padapter)
 {
-	if (padapter->HalFunc.disable_interrupt)
-		padapter->HalFunc.disable_interrupt(padapter);
+	DisableInterrupt8723BSdio(padapter);
 }
 
 u8 rtw_hal_check_ips_status(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 91aac5d1c23e..a64b28bee019 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->disable_interrupt = &DisableInterrupt8723BSdio;
 	pHalFunc->check_ips_status = &CheckIPSStatus;
 	pHalFunc->SetHwRegHandler = &SetHwReg8723BS;
 	pHalFunc->GetHwRegHandler = &GetHwReg8723BS;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 3b35bc30ae37..5b52b0fd95f0 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*disable_interrupt)(struct adapter *padapter);
 	u8 (*check_ips_status)(struct adapter *padapter);
 	void (*set_channel_handler)(struct adapter *padapter, u8 channel);
 	void (*set_chnl_bw_handler)(struct adapter *padapter, u8 channel, enum channel_width Bandwidth, u8 Offset40, u8 Offset80);
-- 
2.43.0

