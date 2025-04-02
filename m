Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9522A4F1
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597740; cv=none; b=FIsM32zs+9vcRVyvdyDPGhTQyARKmeowVh7tyWDdzlBloF+xXoQH8IFaXd56qgCwJz2bWqKS+gXM27za5AYqgdZ+j5pbLNAqLpBQHLG1EVkyTOaQsE4vdsXaX5MXl1/4sWlRjL85m5ze/ch2NnkoE/5LyEGJFSBaoFbn+7nUobA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597740; c=relaxed/simple;
	bh=R4OCPC5GIW5rDlf8DLopCRzwBaWhDmTzxMbuMc6KxPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFEYT+g3JL6nScRY8nMEo+aIJK072KHiMAtUY5FRMBBYdJgiaLMXtQ90iA3KZIoYfKUHmj1AtggrsyMHYnH8ujXWKzQwpCfATVxz5vbbfjFHc7lulQ+G2hwI9UaG+H2UqO5YOEIPOkwSD9Y6p8OxrRgEn3Bf57262b4IqDS+pjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6XVeG9e; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6XVeG9e"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c56321b22cso76529285a.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743597738; x=1744202538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMesyxSaPdR5MylDGUVskOG3tbpdc/ALanBjO7+rOAQ=;
        b=S6XVeG9edfAoNLyUEZcWA3H/6qdX9E0uTSA3Ta3JK2kA3245rLZ1zCUqDy4JyZC6Ew
         Jnt1jnufOIgx4H72qker6qINqmKdEkXYAWBh4ZmouruMoF2nY2ktcm6dTO86u2SAxkYa
         zgYFXO2Julez5OqAcWi+gu+BDr3lQg2wZuIzquakdV3GdE4f0Hp8Jg9JLxmGtKNxE/54
         nDqpwGuIzxra4xMJ3g0tB+vJjAlSP4GS51RumvNb8rT3YLotb3oH227Bq/13GHW4F6ZS
         rFKh7gjhBE0sbQMugX13uGaVkvjPdo9YHnRUCHnnFUfxPVAb0bsyHgiQI+Skh+CBlIFq
         +t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743597738; x=1744202538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMesyxSaPdR5MylDGUVskOG3tbpdc/ALanBjO7+rOAQ=;
        b=AKJ0CYgOkFmmMRBnYwk4F6LeEoxWTY57m/3H/Jp5STgkhQn9n+j21mL5fZNNrM3B40
         NdjC42+Ws+DVYLmNfo7mcCBG58SzB055gITviehC23yfMO/9DIKuiYe4CkKkesz5jles
         dQW863GM30nia7ro842dWaJwkra7avODECxemHyy4ndRqpf8djwqOgtdulwo0O5y0ktO
         3MtbrEx2wOfYyCah2j3/C4m9NvWAyLIlhcsp4iI9DbzasRx86kbjGp59MXyZhwxrB5k4
         AsE08JKQykGboROrEP6ODLgpmCp8rYNXzLvWc8nwnMjLJJu/J6pC+7Ny4j8xQcOM/b2y
         a50A==
X-Gm-Message-State: AOJu0YzFqH2ULymv0tfBXNi4Q35vZ0PHKqx2MFajUAmZeGj18WMHsupU
	2Q2VgGl5wVdbaa6hhA6Ys0/E9fl3PPEV1AmyzAJNgtcxgYWdPRxVGmU0+9wRiSE=
X-Gm-Gg: ASbGncsx3s6/qfkalw9L6tq89whMHsc63eknAnY/m8JMPJo/rEhpXJnT2H1DcsYA/dC
	SL6jknaOnvKkPQJi5QETm8gatHpXCIfLx/oo5Cig13fTP98876VkWbi31ZR+TkymXD10IaWZmSs
	CI4zg5yOkTXuf8RkhZfmQDIvpJgZ9lBHsOOJA4YcYB7dmX3oU26MD9zSr9ombo5wggEEOKMZ5kv
	zX971aQ3kYs4/JKPS8F1zjtqniCVR4BISWqNOft1BvXjfGd6L5g9mumvijUmRZE7cVGIczMJFB6
	PJzErTsck+8IGSctN4t9l9b1zO7SPT+wZ5vGoMIkZbyP6/bC2VJAWPbM0k6+bT+5rLGowbMrYkw
	caYe6TLBdfX3YNkZLPlpWqPU=
X-Google-Smtp-Source: AGHT+IEvCJhIE1lGLlolmFROkAGgo6HK15aytIN0zxVdJcGxXPm3q4rCkbA7uRuwdJucvIaKAu4A3g==
X-Received: by 2002:a05:620a:17ab:b0:7c0:b350:820 with SMTP id af79cd13be357-7c76820f723mr236313785a.5.1743597737702;
        Wed, 02 Apr 2025 05:42:17 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7764fefsm781128685a.85.2025.04.02.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:42:17 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	eamanu@riseup.net,
	linux-kernel@vger.kernel.org,
	kernelmentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace
Date: Wed,  2 Apr 2025 08:42:07 -0400
Message-ID: <20250402124207.5024-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index b93d74a5b9a5..48bf7f66a06e 100644
--- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
 
 
 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
-- 
2.43.0

