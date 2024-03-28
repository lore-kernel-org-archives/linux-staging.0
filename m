Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4097522086
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711624561; cv=none; b=dBAmImdto+lBQqrWWDrGwwxR33Xoe8wfXv5ZXykO259SjQ0DhnwazySI+u/xHda46ey6m9+/rHmozy6CETbwH5yEJxvV4e809u7v1tFnXYKlKSmfN8FP/cdXESCoTs5KL0K0iJ9B5t1OFkf1gwF0syQxs8SFPD1WZqaoied7JcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711624561; c=relaxed/simple;
	bh=OjaCjAYXmOVIMPCD1vmVDcJeK/db0iibhkrPeTlXNGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XjtBfnyx0bQLMnNyGVzGfnlTeVwVYNqe0CIn8vh9u9/D5B3YNSQpW0l3vaPjgvlBO1Zc677hfYM56aV2aIE4MhlTnr01VvTInZ7bvZsLnySklKoxkz90u4yBtUgqfCoZ2/GlNGa+LS54ITSGMWLLh7KGGJxrUcOff6dgapprLFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaXs9jQM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaXs9jQM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4151d2322caso5182775e9.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 04:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711624559; x=1712229359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WybsyYGdRxLPs11yfwNBD1z9sFtjKlfAeK6fQFQ+BB4=;
        b=VaXs9jQM9OT+k2NgqAjmWiy8x08kemwSNSq2q2feZXv6X00vD06mX5R0dgpZ/B1/VN
         aTaOF48o0P4h5U1Bxa/+Rk1w4Ojxc0+Hn65Q8gbq4ifbnfLZFJvIeDaKnfvq9k0TfQcO
         c6K9PffE8ySvCM3c1+G/waV1GDrwCqGi1h0rVJQq6FiA62nOUrHuNY0LFXHqO7mMabTj
         0DBfSebji74LaGfU6fdK2a7GNq3Q7onVa2pJsbmYANeMN1UCY80KRLtVvNJZQ/lX4Dr5
         eMhXslq5DOVL7gSZtM/qymUOJZDGNSkphmP52rRzL+FPjQCizk26JDbc0VPxKUX4igsZ
         6xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711624559; x=1712229359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WybsyYGdRxLPs11yfwNBD1z9sFtjKlfAeK6fQFQ+BB4=;
        b=kPG6gOnhVxuRgB78PgsLCcJ6Vhp4pQoqZAwE/bFyh8XmF47b6tq75j3N+fyYLfVRMR
         LCvUvx2SqtSGb9cj+ax+yyPmQ0UJYDQ59r+VIChuUlv5jNK9QWn1bhHoN1B0HLq43IBq
         R5VYuyRytSTUKg9dy4SsMV49+nVaxXC5okjj2MKp5/712oLmrFWxXOnBFBTzQsoIc+kz
         CS1X+/YHTqSI2/YLkqGLMVz6jhtlQ5+BIfL00mBtW2ToJW3pcQ0Z6G7VSRpTw6Ah8Mrs
         /DGL/jh+L52sOK+RKrQCgW89PgOo3Vr9iIJ8kF8zy0XxK4PnOifIrKwZv+9rIuaCIVG7
         0xPA==
X-Forwarded-Encrypted: i=1; AJvYcCV7RI5FclkiTPP9FDstDz/Y/w+qWhOc9pdCkBzxOtTaop7qv7YCiOzDdWb0PvVrlP03aQ7kGtievTzwftLpXuJIUSrkYa4dThKGo+0CQw==
X-Gm-Message-State: AOJu0YyXTN33keLfDeri7mKicIbPua/O7og2DBFMXXuEBtktmkAOedak
	1/YsXOkgZ69Q5Fen4gDjM30dQ+HDg38QB9NT2f7dgUDUOmVcd+qG
X-Google-Smtp-Source: AGHT+IFp36refJW3aN0bcav4cApShn6gxfrOOufpHbhFyuPF8YMdAFwPTBTVMMjenFWczuNtSRfa9g==
X-Received: by 2002:a05:600c:19d3:b0:414:868d:1cbe with SMTP id u19-20020a05600c19d300b00414868d1cbemr2546968wmq.9.1711624558453;
        Thu, 28 Mar 2024 04:15:58 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c1c8400b00414807ef8dfsm2007874wms.5.2024.03.28.04.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 04:15:57 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: vt6655: remove redundant assignment to variable byData
Date: Thu, 28 Mar 2024 11:15:57 +0000
Message-Id: <20240328111557.761380-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable byData is being assigned a value that is never read, it is
being re-assigned later on. The assignment is redundant and can be
removed.

Cleans up clang scan build warning:
drivers/staging/vt6655/srom.c:67:2: warning: Value stored to 'byData'
is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/vt6655/srom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
index 1b89d401a7eb..e80556509c58 100644
--- a/drivers/staging/vt6655/srom.c
+++ b/drivers/staging/vt6655/srom.c
@@ -64,7 +64,6 @@ unsigned char SROMbyReadEmbedded(void __iomem *iobase,
 	unsigned char byData;
 	unsigned char byOrg;
 
-	byData = 0xFF;
 	byOrg = ioread8(iobase + MAC_REG_I2MCFG);
 	/* turn off hardware retry for getting NACK */
 	iowrite8(byOrg & (~I2MCFG_NORETRY), iobase + MAC_REG_I2MCFG);
-- 
2.39.2

