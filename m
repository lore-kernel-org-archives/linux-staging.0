Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB0227B8E
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583358; cv=none; b=GfzYgHQDQpjzBZdR5mXoGwEoAcr4qEqhqCswbXsaarf+TvmkwnaUucrd5+5M+qDZqJvqRh693O4WMU1IBof6izpZtonL5voAWtoQb4VzMZjtozKMu6lIq4ZITa+0wNUFcmCaqO9qN4AEZo2I8+DVJeDDSqYUc2YN8aeSCyzSka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583358; c=relaxed/simple;
	bh=fk8t3Cigeh4zcM+0Pi0ov65qqGFRQwZFvmmdpa/ZGHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxetSkyZWxhAUkGkFjTyWy7ScsEVGvk0QbvN1XLAGWcvPJTHIHi63RvCU/7AxazaVm0OHUOe/VyLwugkJYxM5XQvfiBzBn3Yl8OGMQXPqDLe50xKIYUhqsCbt9tjUH53pKAXlkzMZZf3mrqIdXTDvPl5jQfOhn5ltNkXJrPoeY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6pOpw5Y; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6pOpw5Y"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-650775f427eso2086850d50.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583356; x=1777188156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWkPWc5zaBHf45r3rjUZRePhzcuZe2INXkpF5iURY2A=;
        b=V6pOpw5YLzSKvld+60mOb66/KcjwPEpnLgR6XyS28pf8264vBRh8fwsrBRb0tLGd8n
         B3YsaaQSp+k8HRzrPpbI8i58/Vw9LfagrghuauVXXwTciaMOTxINjJFTKVoTWgHMZn0S
         Ss2dSm4j3sb8iZmFE1y4GLfKgghIMV2NzuxLp22CN9Ty8TfTNCNTuTXxuiCTCCbHWQBB
         ExEn8NXbaS8Asj9S6x/17s38iw5nlQ+rT/OwfqQla7TG2XMpk77i+yQdJKBlNg+ucz18
         wqx0RBMzs9bq6I6dsSmoV0/PhInuaYEt4e1yWyT6ogPcaUkUyETwKMvf3c5+abnKVcaQ
         xtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583356; x=1777188156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TWkPWc5zaBHf45r3rjUZRePhzcuZe2INXkpF5iURY2A=;
        b=I0atd9QcKFwVd/lqMjF1zEcGcK3Yr3WTk5rx3nW6Z0wVKHWbKnaN0WtJ+WAJ4RD4RN
         uqL9iWjOQHsU9xx2MlKhM7NhoN4N3bh9FHeQldDnopNoFyCQTe4FHfsfUcqzcs5R/k/8
         H63kYSeipexpEd7J0rXdpZZYJDqUVerbefIGmEuFotICmM1SLzRfon/o2sogKz6agEBJ
         pPNsm8hq5xJLhsUTq6x6CsA5H8z1XaUtjsOJVpc0+KnId6tAm26sblQrg4lyvY5BdGkm
         SNDljqzq3ItoF+Khi4xGbSdDvn6Zp2oFJC35N3vpgRgn0bvl9yKYZMMcuIQPdyNKPynt
         R1QA==
X-Gm-Message-State: AOJu0YwMF/EKuviDRg+6uT1zPU+sOrFl4U3SbTapaPEjmV3H7R1H9fwM
	0CYSpn2gzi38j5pOKM1JGpk3xzxUU8Hu1ne0nRe1Zii1UHzB/zxPFneD
X-Gm-Gg: AeBDietgIlEoaUxTYMFIjzUhAqGf7J4y0/85r7ODKkiNXma8JMS4H6kOvFhFTYcZ6pu
	P2kTMjK/iad8eesqViGMVIMqG3FoLe/2Abw/+qhQRF86D3pJAzfetb5Bk4SXOPkhxmFr30JM1nE
	XxXbH8reaKlttWQk31+puCbfU1yPpVTcpDfo2eGiHPYh84FZh0Mt3hJV+xFBbYtFjeIRgpvSY0T
	TUWgS0TVqhp35HqWwGf9nX2iYn33RhRzdi/Vm53GBdozYcc40BA6th0lWGF8g2/tQeAVD07PAue
	rutDyFWQdSGqBIeij31EWDFCYAdYREYefa49+MWoF/MSmBDptnO0v8wpfkhEu3zqmPn/oVqlPxQ
	FNvNszXb8UfElgOQ26ICosUJQ509UD9xqyPtGVwSpPFLqkG6fLZg89Fp4rdEzu+i5psUOwf6gq4
	WkhZeIM+KG0sc4FrkMCbv79RJQiJDQroaYxaU=
X-Received: by 2002:a53:e945:0:b0:650:dbb:e79c with SMTP id 956f58d0204a3-65310a278bdmr6239359d50.40.1776583356450;
        Sun, 19 Apr 2026 00:22:36 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:22:35 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 11/11] staging: rtl8723bs: rename DisableInterrupt8723BSdio() to snake_case
Date: Sun, 19 Apr 2026 10:19:37 +0300
Message-ID: <20260419072034.19824-12-nikolayof23@gmail.com>
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

Rename function DisableInterrupt8723BSdio() to
rtw_sdio_disable_interrupt() and format its description to comply with
Linux kernel coding style.
Declare this function without 'extern' prototype in the .h file to fix
checkpatch.pl warning.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 17 +++++++----------
 drivers/staging/rtl8723bs/include/sdio_ops.h |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c |  4 ++--
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 0d8d0935e4a2..a7713acccce9 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -742,16 +742,13 @@ void rtw_sdio_enable_interrupt(struct adapter *adapter)
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
index f9995e02485e..b240b8285995 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1140,7 +1140,7 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 		if (ret)
 			goto exit;
 	}
-	DisableInterrupt8723BSdio(padapter);
+	rtw_sdio_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
 	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
 		ret = -1;
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index f6fa51f952e0..d6e3a74f2edd 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -212,7 +212,7 @@ static void sd_intf_stop(struct adapter *padapter)
 	if (!padapter)
 		return;
 
-	DisableInterrupt8723BSdio(padapter);
+	rtw_sdio_disable_interrupt(padapter);
 }
 
 
@@ -281,7 +281,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/*  set mac addr */
 	rtw_macaddr_cfg(&psdio->func->dev, padapter->eeprompriv.mac_addr);
 
-	DisableInterrupt8723BSdio(padapter);
+	rtw_sdio_disable_interrupt(padapter);
 
 	status = _SUCCESS;
 
-- 
2.53.0

