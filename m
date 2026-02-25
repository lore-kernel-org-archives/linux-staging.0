Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F9A192B7D
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 20:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772052378; cv=none; b=kSgS6iLrxiThcjNUc+XLcPKhmct9He8EQYZAXR4jW+IcBwjTIaGWYT9s9UoT7GWpb9RAG3rx22EL9hFOypG/ApbX4CSbmAoDEqLIGe+vNhhosq+/pMWXgPuQpnk8mWVVCHN3Rexo6nQDl7Mw4ldi675C9aFxIvTHfSEYcSe7RKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772052378; c=relaxed/simple;
	bh=zZVjrpzWzNlioVSKQIgwdOHhoXVrxoCuP0INzaxVxXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L9VDPiQB6iLyq8l/CJ9D53opuakcfm1HMVytFNqfxaekq0Glg94MJQkT0JPhZZmOO1Vehi3NmO8Wa+5YYXoY/cfuTP6aAEjQqlMBoc8zx9tW0dN/slGqGhU0ypuI5CZwTRvLYK1RX7I/Ka9IdR7KaBW5iWqkGTn2bfz5Lr74zw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnp4wD+D; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnp4wD+D"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43989bd056bso108278f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 12:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772052374; x=1772657174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPPTw/h663gwEv5xV8CJ9bDxaVjouGUNI0NHoKIgjD8=;
        b=gnp4wD+Dl32mEEaa/FSaGb3WW5mQiULqEdjSExUt8VfJU2ZnJDOznfj9iNd+P9UFRU
         xJxjoerPytttrdNc1EBKjZV1Bvw2SFAYbCgM1TKkmmJuIlj9cl9sv88IU2J9V89ju83/
         zMVDnw/AsrDsl6f9+Obb/vsz2Aw/ycvZmD74sKw2tEO+HaZBGsYYQzFsMg4Ee7LWyYjO
         IZpROvQvJ2c+KarxXmNqjbmpJ5Jc+W0rAFFfi8c1N7Rk+ILUOdOqlF5jJ9mV/mXTR++L
         y1nX4TyOZdQCMnustfM7jlpOcZ//kAugfVXPjMP+Or6Dp8J1lfDQjJxIwDD/5F9y1HOx
         OcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772052374; x=1772657174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPPTw/h663gwEv5xV8CJ9bDxaVjouGUNI0NHoKIgjD8=;
        b=fOTnkwEOfT2n9+CDZm9VqDZzxIsRx2EWoFdgmXvG7v7Z57zKAA3Ahr7P9mkpGXaHDf
         j3gaH88seWSc6gF65j2fYwNIxAwmjRBQVbISC08qq49cx5woc9M5MHkXU8tIMD2pV7i5
         7SpjjkZLQ1dPwrL+bPWYdPtwmafS6VtWM81MXnyG7KLfS9J454yYYTxfktN2I0eqUiMC
         dPf7+vIMnPDeXE1LIqw4dGtC8B0Ro1QAVKPdzL8iiuisL1zAnzwLZ3TcFBEiGJy3yMv+
         ZypvOQhBw453W82MCQ4JTGZvwNYsCFlYikEQ+lJtOWWlP+w2Lg/UOlFsqsS2BuJdVSbd
         4hTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXCF5ytOC7GOX4/K4vH9UHUh74gPp1SFIL1aSbdw5gufweK6gkycBsfy1Dk/ekozYRHxV0yW6BfrVrlqGJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyto7zcqcSwkzJ0gWtAYIAZ9GWMKosugfIjUz6Tw4GNmNCH97Tb
	nZOnzpFp4BI2Wd8vJ0C7jOgi7AzPHnLy9eucz0MSwywqcLqshlCBr9Xp
X-Gm-Gg: ATEYQzzpt/fNC6fU01PXW1Caawil3jxWIFxfZb3IbbLN63SIv8+jSD54Z2dYbA2UO4P
	CqIXldO6WgWTA82/VdOVHyhxpI2SpDdPfzdqjXhDzUGYuWBveFP//nCvAWk9lVrbpXwnIbUrbkj
	IOntQXyDd30cyJJaBwWFsr9H0Wm4eIK5JcubXXnuH6bWO52M1QMygNvN3YfdsKNaG+PHouRgDih
	rCwZtAamfjUCVJtjGJ3mxTJZAF/2GmL/oq64wi2ZB6yiEPil68Tn94HshNkoUYPQSEBDWoB9QZ4
	5u3urWve7ygslroAF3h7X9Z81N1ufW6k6vAp4qO/nqZQjqVh+ydN6PkXKFKceA362RjYe+oEhBC
	VL+hCXED9EN5hpv9nKAUTGFcIQ2rA3gPI8DZ8Cwm9L8hMCPxIVmNbOGmKBO/s6vg2enOPTQZDCO
	ZA9eummNdEPi3DnkI/r90gzegyKdg1y39dI1D/xCI=
X-Received: by 2002:a05:6000:4312:b0:439:94da:1aaf with SMTP id ffacd0b85a97d-439971b2b03mr838964f8f.13.1772052374120;
        Wed, 25 Feb 2026 12:46:14 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm34711357f8f.13.2026.02.25.12.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:46:13 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	azpijr@gmail.com
Subject: [PATCH] staging: fbtft: fb_ra8875: replace udelays with usleep_range
Date: Wed, 25 Feb 2026 21:45:59 +0100
Message-ID: <20260225204602.134218-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The write_reg8_bus8 function uses udelay(100) twice to wait for the
display controller. For delays of this duration in non-atomic context,
usleep_range() is preferred as it avoids busy-waiting.

Update both instances to use usleep_range(100, 120), allowing the
scheduler to utilize the CPU during these wait periods.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..6058934e2ca2 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 120);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 120);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.53.0

