Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D47E3921CD
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713738; cv=none; b=HIOS1OCYlgnthaEFtlw1hVqrmS4U+NphUrLVxJ4e2c6WxfC4HO1h/tigdqwpnPF5dmoG7mS0+r1c0Hn0vKAaKU6V7yG78kptqm6ntZdi1XR71ko+4J9jkqD9o/btsqWZZhlN+OBkZd3nSXHk7MJJldSpN6/xM1ZhNgNKyyuPHO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713738; c=relaxed/simple;
	bh=X1e5+2xfs4vfM75r0Fko0oq6sN4zv6V/0nqGiFN4IXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hrpOur9fcYGMVHtfL3qwAfSRtpzjzaDQ9dNmXEuQczlPS2DQQLa7KTQqpuLrq2jTnIePUSshb8SbE4etMiGSEoH2TYqsv5+ysL+zqSE3I9GlDmKLKPbqWoVY29JeUdXwAcnKVmd4TDrBMBXFhyhfWP5DRxBKML2B4Aza6IjQl3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npUzeHG3; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npUzeHG3"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c70f91776fcso1299518a12.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774713734; x=1775318534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zO3fzyE74uT1xNOETXZiW8HFjDihl3ZHhtgFTBMYTAU=;
        b=npUzeHG3ZBdgp8a2CyokJ5mu0y+bor9uoc98HBBOL1P1OhK3OAKriXxL7WJn7sgVcq
         lzQGz7PDhS5KsncYZQ//473kJvjW91wN1ZijKnKBCKiIsnPT1cqEQWuHWL3fzSTcc22u
         1zYv3mlNZscGjApAm5aOkLFk0RO1oRk5wzhRN/MUlSABAwek3Rl4mPPEknz8VvYnsuqE
         hErBkY/0yCUJ/byq3kKt8u4R08dmGJgYP9zBIGL94hjHoys3HkkTJ6KPbxQrXB2EqST2
         IOn6EO7daaggdi7WMGLgO2jEmcbNLkOYW0RXV0/OImfqml0mM8i68Tfs6gOaixWkP/tD
         kWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774713734; x=1775318534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO3fzyE74uT1xNOETXZiW8HFjDihl3ZHhtgFTBMYTAU=;
        b=Gh7hBdsqerweRWDvkIeV0CgINcp6MZX+0VtsqhpN9vtJqB97O8i1bsXuYyp8OaFhKi
         8hNRbEZMXAymvIR7yMZtHfOV5jO7X/fICkDzo8trcxU4kRO8VRn/YlGB5LSWiUNvk+PU
         AvgHKK2yzuNKEAENIzC8q63WXVQ/49L2dlT46KDSKj+OnE1QZtRQY57mt6TsoUTuZB3i
         y7tJuIjU5X7DvWHGt8OQwA48MeIOg7prG0YwTHFLqt9OeVQuzSEUtnJrt3pUwRB5iIlR
         OaXzz8RXTqb++eDU72ZVgTN6Na6R/zmyqNM+SNq1+teRDbkug3QQAYnskxHOzlkECHiA
         vRKw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ghHVofjZNSLISGjqwj76+dCvuq7BfN4ttkG4gYR7P0HjoHpatd0hbjCdN0rqLAFumYro5RRahoE3ipFF@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1i7x2RGA8KVBko+gjOd3hAkv+cgYc4htryzLgPoMCFTVh6eum
	jddH8eC6sWoLw91WfkqrZCXOr4WPNfwEWejqwPPDLXUitGlQYbw86ZgR
X-Gm-Gg: ATEYQzz1dDfaXQss4ymRMFuCJMCVlnVzUpx3y6XnWoDvIHv/7aGAfrYBpz/bfFs6Szj
	v7kApr5nZxy/4MmxJSKR/DPkqrxm/2L4uSfyRc70XNq/OZ4SNrsX2T1Xi0M7Je4FG/lwmXKMbzd
	mq5vXt+pbX0YK1/ELF1n6ABjurqN0wHJ+lUNXucHgfimxR3JxJCsABjdsUQpZaX9wMFdvGL34rX
	4fBJWsXUenk5tLg6QKajqGUokZ98U1cCeQkNtAyHNB8GZJG4s1Cz5un9WyUTsN8VN5iLCrZc3jx
	9xiQE6kAizaU61Fr9mwuU5USa3mD/uRZQCo5Og0AsOwRpjuU+ZHoB/hB7btE7VQtL0eb8qqa8C5
	6niuhXKUkHLhM/czPIx8diS/XBN1sURyr8XkmX7XdYqJT76LZSn0Dc95hSvnR3lct+YgxRvHeT+
	mGiy2W2255P/VaYoBZnzaFZ9Ixj8pmwPEaOEapvqs1lA==
X-Received: by 2002:a17:90a:da8d:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-35c2ff1be2cmr6546483a91.7.1774713734243;
        Sat, 28 Mar 2026 09:02:14 -0700 (PDT)
Received: from Panzergrenadier.localdomain ([222.205.46.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9509cf33sm2266914a91.13.2026.03.28.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 09:02:13 -0700 (PDT)
From: amanohina1 <caiyuhe80@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amanohina1 <caiyuhe80@gmail.com>
Subject: [PATCH] staging: fbtft: avoid empty macro argument
Date: Sun, 29 Mar 2026 00:01:14 +0800
Message-Id: <20260328160114.1143108-1-caiyuhe80@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: amanohina1 <caiyuhe80@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..d1eb3fc03d7a 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,11 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+#define fbtft_nop(x) (x)
+
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_nop)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_nop)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.34.1

