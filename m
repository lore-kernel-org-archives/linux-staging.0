Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D71B158DDC
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621696; cv=none; b=L5O9GZQQTxWy93z1Z+s62pLkLUWZohBRF/0EDkK3P0AwEkMhWnrCJW+Pr5nMZR07QgFYAHD6OsRiP4chYXz8zUKHVi84ccjxHkmCYOWuWLQlMFNvKdk1X0NGm0Yqsm37OSDJzD0DiTSl2efcTYSs8yge1o66xVsdlnXaHOWzoBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621696; c=relaxed/simple;
	bh=qv7bUIiaq2d6hSz6mAsLCXekBE2vtahVMxlhVFAYAWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQg9aE3pIbH6AFw7FSJZ8IvMJ3oSlESe5CejoGLUqMbzAaa6zqoF/o/6fPWoSgkfMSQyhSzViGaqTjoXDXRAF14ur5JvBrE/f2uqeIe59+q6wTZLPgFL/2WJHkF//pSMBUMU4ao9naPkGURP1+yZyeO4j0yP59jOt66f8R05soI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CttX73V+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CttX73V+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso553593666b.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621693; x=1731226493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxXy904MrrPlMw4v+3cBS52GXFzaVx4wVG0zuSO1/wM=;
        b=CttX73V+VrNJPVxKZrm6QpS4lx3RpLHCgBmGiy5+pNJKb3n9FVUB//Szgsb/ZKTVC1
         lT8BpF8teUC1PIjOJM+8wMwhzlPsl73Yo7kFysmbYzUqn/8FgbQmgLMiq5QhwJl+hLb1
         FjE4P71c5dmtQaVe6I94snptOiztHOtC7KBwEdLaTsbu02haXJtYXj0Twf/KuyUMgXM4
         SNFHB5zdjGEIMztbt4M67/S1G90803faQjgtEyEM8vnbUuI93AGY/BJaowA1DLSJdBfU
         yccUM5HtA+Kw6NE29Nrkl+aaGto5PQpEFePykqggGHqAj24wIONlSAozUCJM6Ov5Sxw1
         xsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621693; x=1731226493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxXy904MrrPlMw4v+3cBS52GXFzaVx4wVG0zuSO1/wM=;
        b=Lkwyd8EnTsqUeYUmmSd9JjgPV8y3For9KJ051O0TEcCzyBKFcXW7xfSNmJI+HgJ7aE
         YGsJaqxxAP7SWnPdg5yeesRvfUpsVX95m7c85Isvgm/oE26jCB52ouysLV0pdNGNFXhc
         PI/ryjHCevvw7//pqqacEghn9BYEqlOJQE8y1Ka0NN3xD5giMxi/bkkv9UxKXKN+jn8D
         0NgVWvZWnIHm/b7eacWKz1vjE5AU/3FY7Pr860MGYVTt0I7wMvf2ZqFHNv4xAu2TSJll
         i3mgOkvohOt8xU2JddAyhVry0yBvFEIcFV3l0NWEt3RpBt92OZPIibh2GEdJfAeclVwn
         j90A==
X-Forwarded-Encrypted: i=1; AJvYcCXL4ScyNKnpNf9UqpscsNdIHkLXn0JbwJvjJmWmwULojC6rzhpdoeg96IWD3nCR079k3W369A9OnwktaH/v@lists.linux.dev
X-Gm-Message-State: AOJu0YxDrHqJIC5dx4simLSy+ja0Z1PgOAgdOUvNO2Nq2N8BUf+dTGEX
	oFFTvbDYHADbFwScpU59azJ0S7wHjKEtYWTuSIeVtgGjfzg3aIuM
X-Google-Smtp-Source: AGHT+IF4nZRc+yG/Id2cJXxcIpm90HTJ+ULR7N6gzEr5j8Dy5NfJSFtPsiTljl4GcW76fwZlRV2gCg==
X-Received: by 2002:a17:907:7e8c:b0:a9a:29a9:70bb with SMTP id a640c23a62f3a-a9e3a59d563mr1707138366b.14.1730621692286;
        Sun, 03 Nov 2024 01:14:52 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:51 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 01/13] staging: rtl8723bs: Replace function thread_enter
Date: Sun,  3 Nov 2024 09:14:22 +0100
Message-ID: <6946fae41575fffff1d4718cb3a96cd53f655416.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace function thread_enter with its only called function allow_signal
to increase readability. Remove resulting unused local variable
thread_name as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c          | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 4 +---
 drivers/staging/rtl8723bs/include/osdep_service.h | 5 -----
 4 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 68b5d8ca900f..64ce33c6fba1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -382,7 +382,7 @@ int rtw_cmd_thread(void *context)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct drvextra_cmd_parm *extra_parm = NULL;
 
-	thread_enter("RTW_CMD_THREAD");
+	allow_signal(SIGTERM);
 
 	pcmdbuf = pcmdpriv->cmd_buf;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 3e88f14e3bf7..699cff7b0ac9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2489,7 +2489,7 @@ int rtw_xmit_thread(void *context)
 	err = _SUCCESS;
 	padapter = context;
 
-	thread_enter("RTW_XMIT_THREAD");
+	allow_signal(SIGTERM);
 
 	do {
 		err = rtw_hal_xmit_thread_handler(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 78298e63edce..5dc1c12fe03e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -411,14 +411,12 @@ int rtl8723bs_xmit_thread(void *context)
 	s32 ret;
 	struct adapter *padapter;
 	struct xmit_priv *pxmitpriv;
-	u8 thread_name[20];
 
 	ret = _SUCCESS;
 	padapter = context;
 	pxmitpriv = &padapter->xmitpriv;
 
-	rtw_sprintf(thread_name, 20, "RTWHALXT-%s", ADPT_ARG(padapter));
-	thread_enter(thread_name);
+	allow_signal(SIGTERM);
 
 	do {
 		ret = rtl8723bs_xmit_handler(padapter);
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index b21267d7ef72..8b1634f4091e 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -73,11 +73,6 @@ int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
 extern void _rtw_init_queue(struct __queue	*pqueue);
 
-static inline void thread_enter(char *name)
-{
-	allow_signal(SIGTERM);
-}
-
 static inline void flush_signals_thread(void)
 {
 	if (signal_pending(current))
-- 
2.43.0

