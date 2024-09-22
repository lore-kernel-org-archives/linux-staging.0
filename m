Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6C814C581
	for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727007141; cv=none; b=u+Zyy/sXy3PMv/JtbSbxHUlExCJmac7bNUPEpcaxQzZ0NH2svmadtdnZh9hWkHisKCPkZ5+IXqdeBbmj4sirCTmlERYe82Bs0ekMY8VXUzuniVssdWcY3D5mNiKwp7LUkf4LIgl++i2haRiecglwO32p2JvYBUV1ui/pskb5wpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727007141; c=relaxed/simple;
	bh=H2T+n0imBLVe0xkWRGKTHNdpmIUZcw9mPrNVLfTeqZs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=FI4aVMT3cmsXJOPoUmJZJBT5NOVkI5TjKlmqUQwtsFtygNxdw1oCfHwgNJM41KJGDkuoXyD4FDy+IfIvXDDiCoeGlbFsFZV/ATORW2ryLbhz8VduInIlZzxv4KROtfPG5mW2URE1vyNqDbdiRO4IFrMJqZ5ycyL/yA7PL9TBPzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QShoX/ra; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QShoX/ra"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a99e8c32c0so373682585a.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727007139; x=1727611939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VS1hIkkrLN57v3P9cwhdNl/6iwD4+WEDwLLcb3wVylw=;
        b=QShoX/raiEvDryDTDEdRdOuzTVAlJ3Q5I8A+jzyE+b4LWHFgvDferCVjGz7N17Wyex
         DNpyjiYBz+HYmsn4HJnwegA4B2dH//ga9egN2TQ5RvGlrNWXhIPqVnW5hy0bXS4LIBWQ
         4sI4AAGCIlf8+5N6gQ50vK2Pti4mRPDvVVLIhxMw0Q82oau6++X6j+im/me8wCdmyFHE
         f+tqjx/Ol4bEQi5L1egFTHQ0/53hrl/Rc74/s4q2R+tZ4wgOYhC4UQRKPuzCJgq+ogxU
         3D+KcgT3mVCjdr9Yt8AHHZMe3e0bt/vXyukoduTw8Z98tN4uzzc6aoOi+DMGTdAZM+Kb
         3nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727007139; x=1727611939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VS1hIkkrLN57v3P9cwhdNl/6iwD4+WEDwLLcb3wVylw=;
        b=prp2yBOLU8oYbF83GRQ+/TdUfYx6gEJNSvtlrIHh1C81hPAwNv310JMzqpDiMCLo7R
         B6rvLW/ADMCgiekYiXJdwF/5ZTd//H97k7v0CZg9MZdzYLxmMglMAy3C8LUY/BRUxDTG
         XapZKDyCziRTAgEajx1uvONV947ttbxI1hmTiykaClmQ4MkrZwbaapDvIInj4xQRwZj/
         KHB1jQdEeFNVlzg/qNlEoUOq33xGJQsc2FfJhrmyN8eKEM+lhTJU5XFjytmLbS6CyfPf
         Yw+AnaN/suQrMKaYYiD4T70hBnoK/4XXgR3Kwvcf3Dm5NGpzJSNVPgHZmcDqEHktMSyL
         rnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuPsUeUFmUFtp4Sj1zIKvmD6LsD/bpj1UolR9D4XOkykyGF0wBzsXiLYkGENkQsoWx7uIJu6sIz2xnhkP2@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd6rMrWjiFaLfi8H88H5jOuVaFiPjJ7isiQIlPS4QcrUoPUwGa
	LQ4DvBkd4KeZrlMCf1pgvBmJl1zA502f1aPqmrteVBns8ZQMIYLL
X-Google-Smtp-Source: AGHT+IHh67MorNuxN6aG8qz3DGbqWTu7y0US26POxQ3cxkCURnlAu9OcRt9UFB3mno1C1NTNDRjQBw==
X-Received: by 2002:a05:620a:178b:b0:7ac:a0e6:70c with SMTP id af79cd13be357-7acb8e0fbedmr1357396685a.60.1727007139164;
        Sun, 22 Sep 2024 05:12:19 -0700 (PDT)
Received: from fabio-Inspiron-3583.. (201-43-119-188.dsl.telesp.net.br. [201.43.119.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08d9098sm376545085a.111.2024.09.22.05.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 05:12:18 -0700 (PDT)
From: Fabio <joakobar2000@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH] staging: fbtft: Changed calls to udelays() functions for usleep_range()
Date: Sun, 22 Sep 2024 09:12:13 -0300
Message-Id: <20240922121213.4260-1-joakobar2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced two lines of calling  udelays by usleep_range() functions, adding
more efficiency due to the need of long-lasting delays of more than 10us.

Signed-off-by: Fabio Bareiro <joakobar2000@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..edd467c6bf1a 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 150);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 150);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.34.1

