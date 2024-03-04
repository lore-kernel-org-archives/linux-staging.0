Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4684A1D53F
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709556071; cv=none; b=evFwkk23iuiuye72bv5F8LHL085fG4+j8Lags4wNaw268O2bas7HYczPNhQSN75GMGUb8Yp1JW2tcUm5T4D1nOQoFOJH8kr6AXx6vqgtpuD3/F6+GcaCeIa5p/UCMvY0UjIuCfRnjKR6H6foCzwLW/amgweXE+faehELc1FAaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709556071; c=relaxed/simple;
	bh=lNbggVW+VC0jNnDTsXChOywAHugwm3BEM+eLf4ulEuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lSImgsx7Ba98K76M4yukRwatMF9vT4doaCtAy9reJbC0FvY1DftNMgJ3UZSVn9m53WUR1baysneZ5szexMQ1O3vp79Y0AExIwoOt7So6vgrVflBTP6DA9Ax1X7AHxRFnCcjJEZ6H8tE4BL1+Rdi1+Z4rbK5e10G6IWgGu0es6TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lm5/ZXUo; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lm5/ZXUo"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51344bebe2fso797539e87.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709556068; x=1710160868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79OMR4wOxLvhi5xGG1CLKzLpJS0QwRDhHANxP2Ga6Ws=;
        b=lm5/ZXUoHLOBxvLsk/gsuvlxlc3NyuMdyQetF1HI0Zu4OUUEI9jYWQZcIGXLmKfVXO
         /DUpfevOcP0AG0p9TwYS/0U8ct3IQACvutv4q8riGZdSiuXzundty6CUa+6v5vvZjUWY
         EewArkBj7iKH6YFBZLBIwKJXbrI6MoYt+ZNR73Wv5PzImMO7skvQs8jWzUV4gM40fS/m
         0kbknM9vqP3Ag1B0MCB7SzRfGoKtBvMXYJHRlxNfpPZRsPZOWlPVo/fJ/UjZ//buoL13
         Z3OHFw94nYC5bET5MxVtgclYyVGA6Cah5CkDMObFB/fPzm39lhjNSIbS/wLQU+INFiw1
         LKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709556068; x=1710160868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79OMR4wOxLvhi5xGG1CLKzLpJS0QwRDhHANxP2Ga6Ws=;
        b=NnksuJty+P9OeCBkCcJIE0nux0ATIChmOj07lBIIc1Mmpq0PX2ycuG3vulIprtyzLs
         jaTelMr52uhnCUU5rLY1rk/JCK3uwfcT+8FXMdG8RmR1yJ3POf4pSjGkipPIp0Q6M5EN
         8Fgp/VbzYYeymY7Ldx5DSzXbcWhAYGRkQOww3omnNuknAE6Ap2/vu3sKE3AR+M3oFO6A
         IbkBNdESRjzHzzVHNN5uI17ZUBz56zMrI1l2iPtnBEMzfsbv51TxYkuZCBS/xPSqvF0W
         7GJoq1vJg/0tiSXa94dIbJfu0DDsBnSyAhBf3MabHOAhV0kfUJsQ66Xandacfv/y+5os
         P3FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLtQ7Jfutahlz2X85hvpLErj7PgX6X6tFC8uLwaGQzhiZpFW921Qf5/0JbDCbBUUdHe4PrY5MJML6j0WhWdroQG8Y65uLlMLrsZBxBQw==
X-Gm-Message-State: AOJu0YzauvMzW6WqzYyTBNcScq/B6trksIRxaFdsmm8RhYS3cUD84qHc
	u9/VbKA26aEVM1czcKTzSzhjOSbnIj7zA1yPqJ2KhJFxaGMU9rEu1FgVTbjsQYRIpQ==
X-Google-Smtp-Source: AGHT+IGMC4Cj+FlBz5jSGR0NFLWqwhG/q9Z7shj2Sr7raoJY8m3JeyRkN2U1Iwm79ccZ2gqfYJRC6A==
X-Received: by 2002:a05:6512:1152:b0:513:3d25:d2ed with SMTP id m18-20020a056512115200b005133d25d2edmr4299900lfg.34.1709556068311;
        Mon, 04 Mar 2024 04:41:08 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id dh18-20020a0564021d3200b0056760e830f0sm651747edb.81.2024.03.04.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 04:41:08 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	philipp.g.hortmann@gmail.com
Subject: [PATCH v2 4/5] staging: vt6655: Match open parenthesis alignment
Date: Mon,  4 Mar 2024 12:40:05 +0000
Message-Id: <20240304124006.26819-5-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304124006.26819-1-dorine.a.tipo@gmail.com>
References: <2024030317-multitude-pelvis-bcb2@gregkh>
 <20240304124006.26819-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align parameters in card_get_tsf_offset()

This patch aligns the 'local_tsf' parameter with the open parenthesis.
This change improves code readability and maintains consistency with coding
standards.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 2fb2b1da9136..94784b5c0402 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -297,7 +297,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,

 	if (bss_timestamp != local_tsf) {
 		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
-						local_tsf);
+						 local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
 		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
--
2.25.1

