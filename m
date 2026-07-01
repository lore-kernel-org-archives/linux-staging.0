Received: from mail-lr2-f2.google.com (mail-lr2-f2.google.com [74.125.230.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84663F86EE
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902540; cv=none; b=PxC/al3k2Mil3Oy7XvhoZwMDRL41OjqwkoD2JdNSfsj7A2wCL3FDLSDkoPrlmtfK+wsvcBnP0PN6JxB6pmX5jVxktOYyJTYKkp6Z/qCzmis+0xOgw39dxbQV+ADgnLl0fuPga73hbV8Ds6NPkuAtCCkmDXPtkrS88QoCXMXk19U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902540; c=relaxed/simple;
	bh=W00dvZI8OUBGCtOlWfng54/VK3mMgeh11U1I2s1ZQes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYBHaekfy2HRaIQ9lsMzRE5UiLv5Yy4O42zMPlGsHLGfP1l9m6LeKz6F7tqmohtjUNHY0+Snyun9wf+GR+zQWpcWlyfAAdVnuyxW6sf77HJDDaFjcYaPOSgx5jiYvVBHuy9PlsgZP1rTVv9QmvwrT3kCOIBzhf98f+g339gsKgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jimjb5uo; arc=none smtp.client-ip=74.125.230.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jimjb5uo"
Received: by mail-lr2-f2.google.com with SMTP id 38308e7fff4ca-39b00cc2d91so59711fa.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782902537; x=1783507337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/huiPrIJ0mLJJHbbAxY1Y48u9FhIi1G7munc6LCxqU=;
        b=jimjb5uo9YmKOTHAngEngw9trrsIujPTt3kF2VCvZDZ3Z4oVBKmn0A/KR52ypbIEnJ
         SzFMYg2kyd4i7V8rjhcjtnwyk0LBqiFPVIiwqNL3ZKQIAELESsAg1s5vx0tMFGoH0JES
         Pys4vANlsWTWC6tNTuzS+ZBmpj2u/t445cGfjAxaCo6fDrP1TGmZ1wTu869qL+WGDWAP
         MsHPcptESXCTPEh9a5kTw9Fq+qCCXvZ7V5PDNZatKJPshtJgDJGxin+6wigENoMm3zwj
         8i2P4ZllA0dRBVsYzfpUiXuqDLBpVeLxeCQtbiDoZsJdeKYteGMcT/izJpy9qqkw9BVb
         cYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902537; x=1783507337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/huiPrIJ0mLJJHbbAxY1Y48u9FhIi1G7munc6LCxqU=;
        b=B9rlDMtRh9oxAj9p/u8ST22C9TP2wo+8ltJ4erhDMJwFwZGk2hMpz6jHhFQec4jfUJ
         lZ4BqTWhdYYdt17/9qHNEntI9C5jDxtCDU0/hUP2sz9EeFMO6tJ7G8K95djRKsD4LVbC
         oTGsV7NO5e/62p5ZYWL06+MzP5n1ZWIzZMg4YVrwzwLd6oNXv2VcRXyI3WHaTJ6pPGL0
         4OsTLxWnirkZUw/fNLW2B2bRmnbiKWJVtIjH4xhFTGcFBVyZ9Y3XwWgvB3jhmUE9bCAy
         TIwntHW13fRve040zHHaA/UIESAgymfA8ru8W1FDZ2y3uCsLv1pjEX6kbWcMhGPt2Grz
         vq2g==
X-Forwarded-Encrypted: i=1; AHgh+RrCEl52WVBeRQLznSxsqbYUnJD/u3VI+We+M5pLOTYtZCJahDzbqFukBhyIxvOubO39GMBT5dg4pKJFYoS6@lists.linux.dev
X-Gm-Message-State: AOJu0YyukUCK24XTACFw4rGDnVWGyBs+K+2JMwTB5aXHDaqObralT0N5
	VrA2fbAfbNaxAB1F2LV3QEZrcZnnBaRA2XHxjAoN5iDXchlL1g/M4NAlRDEisgW9nLk=
X-Gm-Gg: AfdE7cn9ZZK4kmfDVOvA0cp1/fsOnkXRJzz+ipFkwoLUV0R3iJnjrFqwZiugf7dX1kQ
	qw45ucnPj1znhQAOt0gidTcYHX0afzGqAmoqbXQuNjraJG179ulshJ7+OQ7epiSESsRP/l6LvNo
	T+x8AJHqH62K0nh36KeO60bod6Eu7VMZZ2s50KxZi50jtk7tB0FGDwsINS2qKRdHYde62hY808d
	6pyfH7POQ/mr31BH/SsFarkG1tIdIDn8t+Mv9pdlH8VvaleOY4tsgXaHGfYCkC9t9vq7+8as0wn
	shbrMPCK9FygVui2wZEi+xVvay+GJJxOFXSTjJQc5/S4daDbr8zwrN7Lt8stD7JPWSxD2JC3bVT
	ZC3Q92lQrfPKd/Gk7zptGtuMg/g6mTc/HiFFbdDzanwF8xS5XiFUjzO8E1qk+xI1MAkt89jdaae
	7YwDNYRFTNkEMKfbZwhpU=
X-Received: by 2002:a05:6512:4401:b0:5ae:b78c:1de3 with SMTP id 2adb3069b0e04-5aec80246camr22203e87.42.1782902536828;
        Wed, 01 Jul 2026 03:42:16 -0700 (PDT)
Received: from myhost.localdomain ([89.253.29.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4aa261sm1186167e87.71.2026.07.01.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:42:16 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ruziev Miraly <miraly.dev@gmail.com>
Subject: [PATCH] staging: fbtft: fbtft-bus: remove trailing space in macro calls
Date: Wed,  1 Jul 2026 15:42:05 +0500
Message-ID: <20260701104205.41222-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove prohibited trailing spaces before closing parentheses in
define_fbtft_write_reg() macro invocations to fix checkpatch errors.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..409770891 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.54.0

