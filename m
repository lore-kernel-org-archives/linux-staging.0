Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013C4A3C
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 00:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772325951; cv=none; b=K3LHIwtaZB3oWj5z+7maTg++l8UHYSvHugevJE+I8FikgTYciSN/S1BkVEycNxsRjz5bXN5e908yXSb5QIvgg5blXFV+EtJ+iS2Wy1+9sFzBfQ+2VL115gvr1lj4qF47s1vk91iU0aaENVFrjASBAd1oeEB57z1L3F+G8RhAYUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772325951; c=relaxed/simple;
	bh=D69shNz5Uaf5mTP2ZmpCQ7VwzJArX9WxBjlVUf6ALck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+FUCoXiVwehpZoq1KJhuqnYcTmIrzK90eaCdsgKNfg6WfvVCBrCFSllYXFBgys9tJlhEhZIlFrq9kOqEJ4m0JdcSXdbzaPCWGjlk6QSIQVwUXMReuQfrm84145YtuFEvZM0POdafSCI6dIUwHudZ6A2Q+35X4qcONnH2tqhcHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaWsX9Ux; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaWsX9Ux"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50698970941so41095411cf.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 16:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325950; x=1772930750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8ylniFR4JjoymliamgL6R5Y99DydvIKEhEu6dayaP0=;
        b=ZaWsX9UxpjeygPMVlBdZbgFBm66Ot76IUAv5tUDXAYrbganm0k9q7GSlcakIPCY3eh
         /x2ykYVcva8scYyz4mUC5sC4XXGBURfafiSCSSAioDkBPFS36jZ4Pnuz1WBYJlkBcz+o
         cLjBWEg2GXs+QiQOktDE4Rdk30M2q8wUvt3ZFlCpbB/g8GlJ1iCH0BgiH/fByXLEtaQR
         X0dvAfyH4WcxNT3fOy63tNcCT9L0E4Fx5RqMuT06L22s+icQBl42dCXBnoYmd3s6qXD7
         voMWO8lm/jfCgXiO/HqX2FqSpWcheIsDADFoU0+7DhELX+5J7msJ9UIUFO1uTjZ4h48d
         EfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325950; x=1772930750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8ylniFR4JjoymliamgL6R5Y99DydvIKEhEu6dayaP0=;
        b=Zmto+5JxazqfiMkHTR23rKGH/i+Epu/Gf0XjE6bYDykrAyx0ugc+Am03yqZDZV7Y4u
         jhHz6k2Oy81wYLQx2h5e2lZ63no4hICYYs7wFNCc6fwCPKhYE72V1eco3j8o/gGT1J0K
         AV0euGbyVd5Q80OQcpQzIiXhcuVbLDZZfcm1IFm5Ear5jDeh6YCypV2GqmqfL60FppEA
         xkSuD3vLbMiuqTqQDnFP2MX530uvAgK+37ePczLPTF8BljiElBu+0JHhhqJOGPQwgMYk
         xgJzzjCzRccZZaPoiMHCglpv8JEihPtlJFhWkR8M+HNtEsicphOKZgmpduqUburmT/BF
         9k0g==
X-Gm-Message-State: AOJu0YxqHyf/MuKvtXk0ZCEhxc4gogYGGHNLn0pBcC3p5YiQmtWNR0d8
	9KCjqybfwCX+frDHsL1Wsl0mOAxE+qqoKKKnlIZ/w7f1X20VAXs8zEhN
X-Gm-Gg: ATEYQzx9yOE1ntK6U9rZxXwAKgV+CQoRh4RNMXMFQrCwc0SL1P3MLHT9Pnn7ds9DfAB
	vYxOVLp+qIYr6fypwQI8+KFl3bkqM41gv+YQkebKH/Vswq+0KJE2143NikrfUlGb1S69I1A9seL
	IXGcJdLfAeViMWz7MrEVTZPSmUDPfMpZfJN89TTVlg8FWS2gZikquvP97V+LMURgRZRh1RnMpL+
	7qJPIGDLV6bwqGemiIaHFeY0UR0CMc7YRYyTLJMsNwW5kFUHkjTMz6hMFLnNmnbrAPntdAhlH+a
	XteOq3S0Tx0fStxSJknlPWGb7B61+Jh8MGSOpeJyyJP7v8zeQSfThTNLH6UAmtWrc8pxaKy7yO3
	awYjJQz3+v0x2L6dvovdnRjI8CsS21+IpBmGWM6mu6vtCssn5YZyVJIyqNldvImAnS1vxT4TKyo
	Wu3kPumNza0EG4Xv48fZE9fzIZMyCuVDf5r0VEFD0fD1ZvbQQSqQdt2O3OvszS9PPX5eQGhBJcl
	GUPEZ1MYg7PRko=
X-Received: by 2002:a05:622a:1910:b0:4ed:b8d6:e0e8 with SMTP id d75a77b69052e-507527824d3mr99838711cf.22.1772325949653;
        Sat, 28 Feb 2026 16:45:49 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630absm78230501cf.5.2026.02.28.16.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:45:48 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH] staging: axis-fifo: fix alignment and line length in wait_event_interruptible
Date: Sun,  1 Mar 2026 00:45:47 +0000
Message-ID: <20260301004547.2506266-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aa90b27197cf..aac2c58ef9b3 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.43.0

