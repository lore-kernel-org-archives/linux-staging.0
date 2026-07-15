Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E447F2EE
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119833; cv=none; b=PkiVh929s7T4Du8BoN9pB0XdMUx1uDC3wdxkgH/sdn+/RqJNcLqJkAO0TXQPyQbNx7WQyASBxjQRjX/OXLWOkdPI/iOAjlzCquKSpLxwDgO03tVySOI2SQ4L3ROw+X9oN0ziCOw1s3DZmU9qRvVd+RdDwfyE4byvQhntrJFpRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119833; c=relaxed/simple;
	bh=PWo8drYNmEl9T8m+e3kEc5tCHU5tvkZBEFlJt3YnZF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIDlrrerOqeWr+QtcWz5g7Ktnc4jrEBtdt/u3Y8W2ldmwmsLPCa+6NAvJIlrkallw6jgkWGeMG+ibYgNH0uXbF365BYF+0XNMBpN7O0yqFGzhuXAMd7Pp64FuGBoV9DVQ5klVjtNGjrln0JS5z/ignvKi5E+0TeYEBTnjKouep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOgdSchg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOgdSchg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeae771c49so6244937e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119828; x=1784724628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mo9sFeBPLc9RN2BJhYoa0KVAtXoxfFGVpq2rblM6wTg=;
        b=QOgdSchgfMxUlUKCjAu4xxlH8n+5LS0eivaeEK5H5IDU6MPRW+AgZcHi1ovYv8txLf
         ye0RGGLF9A1t0fsEeE6GQALLJkatWNRNkUgKeyotr0MgCjp46g8EwIA4cwcKIS5KgdWw
         RffAuQA5QSxyM6H5g+7+eYc3krww2NBu44d3iIR370tnaOv+qIxrVCHbZh2r3U1vpHBx
         xkvRUeIPww6nT23OwMyvZbixL2E0J7GOhltSOOJ8oHumpKEJ4NbOCicE0IYlYQKku2sn
         RuNKTn2rILpioUbewkSeLqlys9IWi7cfTiFaGCPhxbLoxBaXTYSWJdaoiwcHkQplSEYN
         +spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119828; x=1784724628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mo9sFeBPLc9RN2BJhYoa0KVAtXoxfFGVpq2rblM6wTg=;
        b=kPWfbcRXIalJXtAkItP1/kkRQLNb1dPtNasE3NylSDkidAM776qbGQCnxGUwb626Uj
         lszIurv+sEg5MZ+05HnAHCQsNB7eScSluD+PRzCKdsdpQx0yb738ZrEntM1kqwQMHZ6j
         fztvldD3Qf0bji9oAvWe/FtGlfxdFwKPsEpnHjpPS47IURTiH+2A9LtwZuOL1mS8iM8Z
         unqn36wanp5lNOQ4HfAHbIeFXpsfWF7ezcKoxpEJcLXawLCGkF/qs01aDisozo6mV21c
         Ugz/KJ0eY/+dlEw9dnlTQ+MrtHICn8dp4j3QGdY51wDbTXS0uVwXsHIyzKEQLho9iJTR
         e9HQ==
X-Gm-Message-State: AOJu0YzCZ2ZDL/96x83TdSUD0C9F1WNxhn04Mp0yzaMIsfFs/pBzQHii
	JT9xRt55ycOgCc+F+fUTCPgp5/I5A4xIEzopngmziUmdIf4g7xpPsgYCUcwfM/31qtk=
X-Gm-Gg: AfdE7ck9LYuQFiur5flhna3OI/Pv0cLkfOX6ZUo8Q/8b1V2eZwC6eTjUe/9n9aBRt8E
	P0tjGpjD76ozy+v3tetJEvGY0a5iYGCTMECzUHXmZMMzM7D10FnRtBvyzHHxTnFgeCEKQ4T7X2O
	1Zgo1R0BMGG9Zmzr/C/v1rLlkjWizW0xUAyCncYPmRniMa2U3JOY/hLbEJA/HGQllp0D1R+mbSA
	8nfhzSdk16/rQjk7+UZjmashwrevz46aHpVjPY4F79PWFqN1ny3HYBSnBEHw/LY2w4d0aSomqK1
	JIiEWwkJAtGdwrsQFl4R9qHn1g5OWAb/lvo/TcxLQIlodE4ItozGYiJ24arQCEFhEPrrmHER2Xm
	R6uNAPI/JFXUlTktZTZpKwaOB0MKNsFfav21Z7N13MjS71sRjrtF9IGrs9jxCtA9zIqRpJ2WZkh
	QehqsGuNgeuL5rj4heNro8/F0PrMAogdalUH+jSmGasNw8bp+r1OvP5Q67vJfPd8Y9BdHM5XytS
	PJ33xJmSDC31A==
X-Received: by 2002:ac2:4bc5:0:b0:5b0:1eb2:53de with SMTP id 2adb3069b0e04-5b15d7ae06fmr634702e87.44.1784119827818;
        Wed, 15 Jul 2026 05:50:27 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:27 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 16/61] staging: rtl8723bs: remove rtw_free_evt_priv wrapper and rename helper
Date: Wed, 15 Jul 2026 19:47:44 +0700
Message-ID: <20260715124829.90290-17-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant rtw_free_evt_priv() wrapper function from
rtw_cmd.c, which did nothing but call _rtw_free_evt_priv().

Simplify the code by renaming the internal _rtw_free_evt_priv()
helper to rtw_free_evt_priv() and using it everywhere directly. This
eliminates the useless leading underscore naming and reduces call
overhead.

Clean up the old wrapper definition, update the function prototype in
the header file, and adjust all call sites across the driver.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 6 +-----
 drivers/staging/rtl8723bs/include/cmd_osdep.h | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index d2c6d48a8..b91182549 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -212,7 +212,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	return 0;
 }
 
-void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
+void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
@@ -286,10 +286,6 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 	return obj;
 }
 
-void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
-{
-	_rtw_free_evt_priv(pevtpriv);
-}
 
 void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
index 91d933d71..2259fe57a 100644
--- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
+++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
@@ -9,7 +9,6 @@
 
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
-extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
 extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
 extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
 
-- 
2.55.0

