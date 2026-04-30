Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A52122D792
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570252; cv=none; b=AZvZpRIr6+veVeLOnB2vCeOgBFkne1MtSuOecr8DHbiFUt76S1nCu6DhKutLhLzWfu7eaJGLAYCg/UcKHH6A1yOk2G8n4YAm4OOnCP39ebTjRbv4luuC42SWjUx6Z3Rrw7s1888VRA9a4NtG9biKrlmB9ZbiBPia1oAf6kXKltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570252; c=relaxed/simple;
	bh=cYxkRPM8AuwwXZecwtN9puB9hJbaw+3P6Rh6AhkFsk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYj1g7/K9l/Eevn35491/omDZJPajQDQrFDMLdeKwSHBrDaCTSsHt2i2KMu8fxZcLHWUJ38VHnmNcAaIV1BsgUVlXovK6+cnoufb8Oy+CyicR75Mqb5/heVfkKFgEpO0+1P67IrB5wMXB10wPWHvUDk7jZEidZ+JRPLdFh6OrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YciKPhjd; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YciKPhjd"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79ee5037d44so19402967b3.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777570250; x=1778175050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T66UpWEsoi3UYcXiIenb/wZ0VgeZwfUfPCSl8q57m6Y=;
        b=YciKPhjdMO/aWwPTKPAP9cTDt69lDa6dyBnfl/a8Pa4dAiEQPcTWnl0HvubVeKeUI0
         lN85kCl+HdkRsflARpQKxjK3NwKsa/ye34hbOB5ni3PqSgK0vTfSgqG1Uuc0azTfNARj
         LElNVbwoorp2pWt/BYR0NWQsHgysDd/ooPK7RSoqSyxhiSW5rJa9Es7wVNebrGz028Vy
         SVkcVBXu7kObqwfBNbSXCER3f8UqsaAymxSu6J0+SUni/7pWVCQIWWrWmONCKASO17/V
         xP0TdObf/Dlm8UZhQkuPmMhO4ZN4tFrY/NZ0//dYLxj1fMK2sEI9AfZYFvQAjcfGOcR3
         FQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777570250; x=1778175050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T66UpWEsoi3UYcXiIenb/wZ0VgeZwfUfPCSl8q57m6Y=;
        b=LbOuY70ROWdEXovX1Nmnw7QY9raucVoYcpt2pttgDms44EmSLfX5wcfrhWuBGG+ziK
         M50pIFOpooiX43NwuXxKWNF5JT15vyZVPQSbF5Orlde1NW76EG424J0URNqjaRB3G4wG
         hh1Fq0rnM93EBtfJYvENqPTkgU+cnPvvM98TK5YqY58VVPqH9Ui1rUmrtUWPKPfpIS9c
         0DuftsuEKXLm8AEBBdqZYm+GVK7mms19Y/X1Vl0ic2Pg1xvlH7fV3ELfrXMyLfvVZLwf
         e0Zhucxe21fuOMF6EixK7twPPaBlGv6vr2XZ5eooVEu7BKO4dQlDxqBZ+YR7Ygq7clAu
         DZZw==
X-Gm-Message-State: AOJu0Yz1y0/Ea1sgGiOlu0a8XUuiWfd3NwolQcOr5LLtiRrbiaesi1U8
	s4EMfW1P3n5ikAs/wUR0XNYeEfzckxk8f9jKwRtvAzFtf70d5GZIcg6g
X-Gm-Gg: AeBDietTiaOTojUUDN/TzQ/MzrIrYQD3JicdREqh1lnOOWBZcQFQB9vTJgMY2cc+PRr
	iT2OlUfvNKt5ajPIWLu6GKUrviAn0RjYT68jenBMh5skOcyG5ypMHMNrKPav9cbC335HNHclqX6
	l4CGX7h/LxW9mbpeCOZjG1t5/i9fU0OGGrW0jUPC15Hcl5RUjZoods98oXJjgh5C1Jk7fPo8HQv
	Hh3g7oeMObK5cOP1p0Uv/478FZ+UT/fIqUrUlW1H5zAn4BFdzHGtIPMAp3Kr4lgYe66hkxQtwtf
	nCmLDFPYZQQNF4aNVnMnbTrKbKanULyqmSl2kQF69WWAYJ8SzIwGsDEIAULuSk7PKsl+ZpV44ml
	qszkHlSXtCckNls8S+XUeQsokrQHoKgZKO/3RhNYCIuXTRt79iygR92odHWxQYoIiFVPQmveaAl
	5KyR7uGhxXRytQV3MwCe4w6hLhxjnR22dj4mk=
X-Received: by 2002:a05:690c:c509:b0:79a:b8d6:110a with SMTP id 00721157ae682-7bd55d8e431mr26048197b3.5.1777570250543;
        Thu, 30 Apr 2026 10:30:50 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd665298b4sm232837b3.7.2026.04.30.10.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:30:50 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: rename DisableInterrupt8723BSdio() to snake_case
Date: Thu, 30 Apr 2026 20:29:06 +0300
Message-ID: <20260430172954.12828-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430172954.12828-1-nikolayof23@gmail.com>
References: <20260430172954.12828-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function DisableInterrupt8723BSdio() to
rtw_sdio_disable_interrupt() and format its description to comply with
Linux kernel coding style.
Declare this function without 'extern' prototype in the .h file to fix
checkpatch.pl warning.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

Changes in v2:
	- rebase on staging-next

 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 17 +++++++----------
 drivers/staging/rtl8723bs/include/sdio_ops.h |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c |  4 ++--
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 77a6a5c7ec7e..5d74913be573 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -626,16 +626,13 @@ void rtw_sdio_enable_interrupt(struct adapter *adapter)
 	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
 }
 
-/*  */
-/*	Description: */
-/*		Disable SDIO Host IMR configuration to mask unnecessary interrupt service. */
-/*  */
-/*	Assumption: */
-/*		Using SDIO Local register ONLY for configuration. */
-/*  */
-/*	Created by Roger, 2011.02.11. */
-/*  */
-void DisableInterrupt8723BSdio(struct adapter *adapter)
+/*
+ * Disable SDIO Host IMR configuration to mask unnecessary interrupt service.
+ *
+ * Assumption:
+ *	Using SDIO Local register ONLY for configuration.
+ */
+void rtw_sdio_disable_interrupt(struct adapter *adapter)
 {
 	__le32 himr;
 
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index 7bb4b2047cc1..13f13076bc16 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -28,7 +28,7 @@ extern u8 CheckIPSStatus(struct adapter *padapter);
 extern void InitInterrupt8723BSdio(struct adapter *padapter);
 extern void InitSysInterrupt8723BSdio(struct adapter *padapter);
 void rtw_sdio_enable_interrupt(struct adapter *padapter);
-extern void DisableInterrupt8723BSdio(struct adapter *padapter);
+void rtw_sdio_disable_interrupt(struct adapter *padapter);
 extern u8 HalQueryTxBufferStatus8723BSdio(struct adapter *padapter);
 extern void HalQueryTxOQTBufferStatus8723BSdio(struct adapter *padapter);
 #endif /*  !__SDIO_OPS_H__ */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 9270daa018b9..f31196f54b3e 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1141,7 +1141,7 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 		if (ret)
 			goto exit;
 	}
-	DisableInterrupt8723BSdio(padapter);
+	rtw_sdio_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
 	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
 		ret = -1;
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 387c5165428c..550b538add85 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -211,7 +211,7 @@ static void sd_intf_stop(struct adapter *padapter)
 	if (!padapter)
 		return;
 
-	DisableInterrupt8723BSdio(padapter);
+	rtw_sdio_disable_interrupt(padapter);
 }
 
 
@@ -280,7 +280,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/*  set mac addr */
 	rtw_macaddr_cfg(&psdio->func->dev, padapter->eeprompriv.mac_addr);
 
-	DisableInterrupt8723BSdio(padapter);
+	rtw_sdio_disable_interrupt(padapter);
 
 	status = _SUCCESS;
 
-- 
2.54.0

