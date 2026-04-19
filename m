Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275A11E8320
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583353; cv=none; b=TZI1HkGN3ZkcKMC4lAY4T7hyWMRfgzwnpqB1MoiD0BeE03ol4qNAwLwgkE6w0cPvA8A9Lle42f7QkjPNRYiaJhB4R5cpNqXQr0I2+FuXLAOSRW64EWi+l0UcL9Py2Fo+jm0S+9kzzVsF+zOSkknPdV5Jbx3sg0x0A7KZOJSgXm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583353; c=relaxed/simple;
	bh=UbBvVenQfERNI8MmOXjERWpUV/ZFaU68atBIaUFqThw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT4XZRIZMs8p9Vyx/jt2upgVn8iHjgawHg/C/rVLy7/QY0lUc5IppdoF0N+NhXM+r/A+XVoP+psCPvMqg6tbEm1MnhxlWACjbiOg63sE4AHxbMUMWQs/bisc65PoevdE307pr5yipxFquWkCzrwlTf2y0Rgw5bZlwG6dfu516FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A99XmtMY; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A99XmtMY"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65006c99d38so1953093d50.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583351; x=1777188151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFNFFVPCNw+zjHWkd/O7PBoKnRaLYsgvXjqu9x0Ux2A=;
        b=A99XmtMYeOR219JB+nOZgzWpgnkCX0OPaCF6JSlIvdUi20ZzTaGnS0T10lOEg8xOtR
         8s0HHVpeLNDwd2q7sS9BwflQd5e5xdlW0Qu9PZV3AScvfUvVVV9pkf/t4OuQsLQUbp/U
         ncHPmYDwg9rqOIyS5y7ioGUwb8Rc1zuN3JSI6nbPEfZL9kHqrkPSpgv9Qn6oXFknpDMe
         3env+zddQ+Ut4V1uHpyHRB1F4oHBp++HD1Xth/VUvqf0x5ivAGq9Phm4XnK5vE/Iy6p7
         f50OLut4g4H3Yb9GOh85OkR7XzslRL5myn6D+ESipw3Xyaj+Q3gTUW84p7wGhgvdYnVq
         S47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583351; x=1777188151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFNFFVPCNw+zjHWkd/O7PBoKnRaLYsgvXjqu9x0Ux2A=;
        b=CQTQKfS6vE+JmPJQF31ebFfj+np0OZiJQJPxtLcrjDSDsA/C7QatMjvGP5i7vcEtns
         Pb0CzQJzu7CKenu8NNWOVmxFflg8jUEl17fKgYLocRx79o7TQvTn5sT7XMpBxJjgg8R2
         SyE3JxPFZH69PtbHhmyfW6KrkefT3RqhRGy+x8RXxSafFtOhlC9MoUfLN5RvAwj063un
         9MQkgERe+sVMlwyZA+yyTGAIDk7Jhuvkr1rL4x4u5YdyEhZcX3rJac/3Sfx2QiuqPdtH
         AadK1SPasFnSCGTjDXUKCx1wi4R6e/pAxtYXfX/Zx8S+HAyyY3BApfcwsEt7HjiZgy+x
         ahfg==
X-Gm-Message-State: AOJu0YytoXq9uWW29Y7OizDd75tt1Hkz/xwhCtremILugJ1td96A/eLd
	3ORscT7zQu6RykJ1Ab9VW3iQ2fptTq3m1KenqXx+qSyTIRsYamhdFHrk
X-Gm-Gg: AeBDiesPHW8x4cxPoqRwhyNCpW7O4B2fO9/Zmix1VatkuLWM0NQS3SMmCfU8dfLnyiz
	WLwRrF3aekk3urt9Ku3Bg3kzUxCY+m5wq4ROdC6uSUb9E7L/QuNy8VVGvkZUe+usFysSB9KrFYS
	b/zmD5SsHHIxMbCK9RUY9OJfApAm/OKBFVNxRvhg8GGj3+5j/daoQ/ubJzQSUu60yNlkIp/crRW
	+JiER4v9DzEX8yBcA286IQIibpTcG2pJgTI9nX+nbjwaX8uY43KfhrISKVjbAyK25uxACUuA4dw
	kr4LOG9Rqc5+POG0d4hKGbc2wZlMrnjryJKeZT26GlQRTLznaqk3ny4YfCdPkzcRoS7KxtC8TLG
	Xj1SxmAREBzOgtmB9ALW1f5wA5UC/wT8UpWWLN4+XKO5f1Re4p/Me99E+ngDc5bC/z9HIts243a
	b3yYAXge3U8MPneO/qH3ZH8pknjUYLjF4jK4k=
X-Received: by 2002:a53:d70b:0:b0:650:31d2:234f with SMTP id 956f58d0204a3-65310ad29ffmr6997870d50.51.1776583351135;
        Sun, 19 Apr 2026 00:22:31 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:22:30 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 10/11] staging: rtl8723bs: rename EnableInterrupt8723BSdio() to snake_case
Date: Sun, 19 Apr 2026 10:19:36 +0300
Message-ID: <20260419072034.19824-11-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419072034.19824-1-nikolayof23@gmail.com>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function EnableInterrupt8723BSdio() to
rtw_sdio_enable_interrupt() and format its description to comply with
Linux kernel coding style.
Declare this function without 'extern' prototype in the .h file to fix
checkpatch.pl warning.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 19 ++++++++-----------
 drivers/staging/rtl8723bs/include/sdio_ops.h |  2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 8cece69dbf79..0d8d0935e4a2 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -712,17 +712,14 @@ void InitSysInterrupt8723BSdio(struct adapter *adapter)
 	haldata->SysIntrMask = (0);
 }
 
-/*  */
-/*	Description: */
-/*		Enalbe SDIO Host Interrupt Mask configuration on SDIO local domain. */
-/*  */
-/*	Assumption: */
-/*		1. Using SDIO Local register ONLY for configuration. */
-/*		2. PASSIVE LEVEL */
-/*  */
-/*	Created by Roger, 2011.02.11. */
-/*  */
-void EnableInterrupt8723BSdio(struct adapter *adapter)
+/*
+ * Enable SDIO Host Interrupt Mask configuration on SDIO local domain.
+ *
+ * Assumption:
+ *	1. Using SDIO Local register ONLY for configuration.
+ *	2. PASSIVE LEVEL
+ */
+void rtw_sdio_enable_interrupt(struct adapter *adapter)
 {
 	struct hal_com_data *haldata;
 	__le32 himr;
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index c7559a884608..7bb4b2047cc1 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -27,7 +27,7 @@ extern u8 CheckIPSStatus(struct adapter *padapter);
 
 extern void InitInterrupt8723BSdio(struct adapter *padapter);
 extern void InitSysInterrupt8723BSdio(struct adapter *padapter);
-extern void EnableInterrupt8723BSdio(struct adapter *padapter);
+void rtw_sdio_enable_interrupt(struct adapter *padapter);
 extern void DisableInterrupt8723BSdio(struct adapter *padapter);
 extern u8 HalQueryTxBufferStatus8723BSdio(struct adapter *padapter);
 extern void HalQueryTxOQTBufferStatus8723BSdio(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index a462a2864a59..f6fa51f952e0 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -204,7 +204,7 @@ static void sd_intf_start(struct adapter *padapter)
 	if (!padapter)
 		return;
 
-	EnableInterrupt8723BSdio(padapter);
+	rtw_sdio_enable_interrupt(padapter);
 }
 
 static void sd_intf_stop(struct adapter *padapter)
-- 
2.53.0

