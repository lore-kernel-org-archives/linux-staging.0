Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EB43B19CE
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486239; cv=none; b=H0vCmnjkdzrPkrDHZHf/0a76xhrul4BSSNNVCszQq9PjG8Gev5Y0/Y1XQueqjreSxE/EzY/Mjxs4z89GkhIdez7twb2jVTJrZliYraH0Lu/vpmIKIkavDup3Dnt2Lo2xxdXeAliiCw7WXpGemjv67gi9c96k68pJ9RMkft9pPv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486239; c=relaxed/simple;
	bh=HlcWXlxmcM/eaojhrKRNR+wmsH7x4NUrHg5RTu0fss4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmQhK99p00j8b1Atq37hEmxw6PcnIZu2puRDBmBpB1ZwweP4iN0dikw2atXO/7CcxAo92An9EVp6EpBXhHIjzRUCoPWwsvUS7oL3LiDvZhMy0FA3xifpcdWsorG7wOTOpdZOI+RcB3EhDpaEcjD1F2arhvMkfBhPREucVE8ZMPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+6NXAIE; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+6NXAIE"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-393925cb1baso40787811fa.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486224; x=1779091024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+32oFHkQvt6/JF5bUZtZC7HfWiW3ohAgcW+Fyn1vK8=;
        b=C+6NXAIEDQPEoJJSEdW4K3tZOeihcYmgbjwrog8ebgeAC5vlN6aUWKRVrFb1LbbyCU
         BsKmWzv14inRGbfIOAfWyzSsCdanNdy+3nTs2S2WwD49K07mzDkcX4cWxeZ6F+ZpnRf3
         WIdY9OcLI2Dv6hGlnwSo90zrtg6/Ankq2JWQZetM5SWajX6zkzW8G/KAGYE8FykmzLDx
         PkyeZIUwOjTPOOC5YlL9I9Ks0ny1KBgs/sii5cIlZ413XBsqTPt5LVHO4Xi4ELmMQbZh
         x35kuTGoBqJtfftEAKt7pN38mckir2f8IpePwHDfqDgB1e2+Hl9QFzTo3WNGIJQtWGfJ
         IzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486224; x=1779091024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+32oFHkQvt6/JF5bUZtZC7HfWiW3ohAgcW+Fyn1vK8=;
        b=f8H68X9DknmKV9TAz8a/llTqbbKCJ+BP+VpyYy1Fn3Xyl4te3gPvoFn4j4whQgj+0Y
         79QfSjk4kx760fYkPNTVIZzvwMegVbICzoiSUNa8WsbrNYPxIvRXY8VkF0V/6uSJlFAc
         zvKF6M61Mmp6HXusjYIs9HL5L9xa/J4TQxjaTa/7jLLdcBpuB/oGNf2hUL8SJ1ks7e8j
         J+PLEsZqNsoVc2vZgrdbPa2aa3Z+i5DXw2Jk+an1D9EBk2TjxAabT8WdA2IQm6ureRpx
         0VOJjGexmws/S+MTkB0NvqYTdsipy6XdEmGm0yYRR8aY69ZcwsIe4q4UJ80F4d0C+81F
         K01g==
X-Gm-Message-State: AOJu0Yz/WR4CkGW2D2B4xJXhEUMwaSYKlFHdZodHNA7dOpHzJQLKz8J+
	iCyb3/+TgQvOeF52WJNyf0XA/e4pcnsih8MtwnTlIzOcpqy3Ku9cRjvGScZ3IPqm
X-Gm-Gg: Acq92OFlO7yHukgCFNLYqsQ8LzzBv5MQkZ95QmZEGcLgmMEt0dgKTFGhc7277JziBGH
	InkLzAjhx106Mf2axx+qc9/VFcQ/dn6h8IGK67zRkNt3Fi3vtlc0OlINrreeTxtgWxCkwwrIGg4
	TEGOTYeps5YYYI2AIZqzEjirDVoQ+7SxCKgbl/Nbzf7PiVJXqdJLlria9TfWhEMJOPA0CtDo+WK
	MrieRs6uG7M77UWDAve3w+tigHSqgNbDPmSmD3TKqbv8f+3an28lJeEEWTs1WUM52eEqgsjb3d9
	a/r0BGajlOMBj005ckJaF8qTeA3SQdnrRdc2HulKNCrp95efJzeOsTTjqSzggki102vfHcLn9kL
	M/IluxIEWNEpP0iLCo9HyoZT4Nto4gj2p7ECFNjZf5wuA9/ftOL7SYgtFWhBvxqu3yiK2OUhQy3
	0L/NUbZig1zGQY8K19Py/JUDZ7
X-Received: by 2002:a05:6512:1093:b0:5a3:fcb2:c6a1 with SMTP id 2adb3069b0e04-5a887ae2888mr7943254e87.13.1778486224031;
        Mon, 11 May 2026 00:57:04 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d487sm2433861e87.24.2026.05.11.00.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:57:03 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: remove empty InitSysInterrupt8723BSdio()
Date: Mon, 11 May 2026 10:55:29 +0300
Message-ID: <20260511075651.11637-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511075651.11637-1-nikolayof23@gmail.com>
References: <20260511075651.11637-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function does not do any useful work to initialize interrupt, so
remove it co clean up dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c |  5 -----
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 13 -------------
 drivers/staging/rtl8723bs/include/sdio_ops.h |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index b801a78f69e0..857b3838adee 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -532,11 +532,6 @@ static void _InitInterrupt(struct adapter *padapter)
 	/*  Initialize and enable SDIO Host Interrupt. */
 	/*  */
 	InitInterrupt8723BSdio(padapter);
-
-	/*  */
-	/*  Initialize system Host Interrupt. */
-	/*  */
-	InitSysInterrupt8723BSdio(padapter);
 }
 
 static void _InitRFType(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 0c0c243c46eb..f7f6e273c868 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -581,19 +581,6 @@ void InitInterrupt8723BSdio(struct adapter *adapter)
 				   0);
 }
 
-/*  */
-/*	Description: */
-/*		Initialize System Host Interrupt Mask configuration variables for future use. */
-/*  */
-/*	Created by Roger, 2011.08.03. */
-/*  */
-void InitSysInterrupt8723BSdio(struct adapter *adapter)
-{
-	struct hal_com_data *haldata;
-
-	haldata = GET_HAL_DATA(adapter);
-}
-
 /*
  * Enable SDIO Host Interrupt Mask configuration on SDIO local domain.
  *
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index 13f13076bc16..252b0e1646e5 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -26,7 +26,6 @@ extern void sd_int_hdl(struct adapter *padapter);
 extern u8 CheckIPSStatus(struct adapter *padapter);
 
 extern void InitInterrupt8723BSdio(struct adapter *padapter);
-extern void InitSysInterrupt8723BSdio(struct adapter *padapter);
 void rtw_sdio_enable_interrupt(struct adapter *padapter);
 void rtw_sdio_disable_interrupt(struct adapter *padapter);
 extern u8 HalQueryTxBufferStatus8723BSdio(struct adapter *padapter);
-- 
2.54.0

