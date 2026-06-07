Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344E51A262D
	for <linux-staging@lists.linux.dev>; Sun,  7 Jun 2026 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863444; cv=none; b=XHyMEUpsLiXFgHVCx4Dm0oN9iCTypZJlGRzwQbEes8xf3Q+vDHsPBV4cqhLKczRV4Mh5lY0o8rAUshbjTks5OpILzCGimQzhl6KjuOhatIO2qfTlQWqndvxHrRAlHCPOgrDCsJJK3168ioXJXY2Ww5j1/8RJkTzh/mW23zgz2dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863444; c=relaxed/simple;
	bh=wBL5gFM/RSITeS5F1awXPhfYxnemAdgCB0HVANsqQVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHXBYAAfJulKjGUx6Uxy9zJfabLaX2MTjpCagD846D286/S24/cuvcr9M88e5PEj7EWYRBUjbuMwA8BXOFxY/ewVzAkouWolJGjzOXJBPmCPwNMCwHTY852wroUfjNGT1eBt6nOeqGeYiOkW7TGoKAd/iR8QWk/Pd5rvOSnmrf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0r4bePy; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0r4bePy"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-396669329fbso41716711fa.0
        for <linux-staging@lists.linux.dev>; Sun, 07 Jun 2026 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780863441; x=1781468241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UI+ati8w10fcpvRpL/lKOmhNvyhEWhByMfjT0Pq9pcw=;
        b=A0r4bePyJILPL0QAfDh78IMRhwmyawFwjEq+cXwk/+Q2w5UXtPjGpxjDKSIv7hg2O2
         2pkiECHSh9S6X21V3FcRaqdWSkGIzLJP9+PvA5T11c4CSfybiVSVJlFerBKgzR+FVbaG
         +nMZLZvRlZk4rchzRiQBJpgDYvZqbnnzLXEDNWEGJ3s/Vm2LGyDt+/AgxtRbaNkHGSBQ
         Ihm2PMMy+l9RAXgq3/HoXyib3M+DtE6gPlLWI62Xel9xjbb5guzksP5iLrIaGcxUGRlM
         bOUk0Q7tInPbcsAnBXuW9aVSbBUvAplQBpgnkHHTgy0twDfBgZ4HOKf+2eIWMSTYJVRt
         RWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863441; x=1781468241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UI+ati8w10fcpvRpL/lKOmhNvyhEWhByMfjT0Pq9pcw=;
        b=KIj8OYWOieAJSNUGk0KhLvJbPY4OaVsIIfcNwvtppcShjiPaz8vWUislBISWqmPYKz
         BWVggXgrBkiqYBEYbdNMANTl5GrfQ1koqvsF6WqWnaytTih+jhQ7YQ5p19tCAsOJiI7d
         8cUfj+mJvNGtQFJC0QsA1YQjLQzh0zYwhfEoL07eNlH8p5Wa9iZ2M7P12u9eOzwbQZCM
         eGwJg4VNvljnmLYGDHSRTmC8QBeHqUyDRFUuXEDkcwPsCO0FsNl6jS8+w5Hmfr+U7ns/
         V6cgUV5vZnTIaE/AAs2sPk3NezPCPJ8oqWxdn609sEOZW19BN3jp7Ks2GEs/nFE4Gx2Z
         j/sw==
X-Forwarded-Encrypted: i=1; AFNElJ/d4oyAtBt5321Lf18Mr3eP5ukj/jIW+AYTh0dqBZ77DNukozIFVf8RIMW0AtgCngajrXCqYgXhwHjsHDFv@lists.linux.dev
X-Gm-Message-State: AOJu0YyvlGDYjONhttuJYijlMEaD5ymmNbXfTtybEtAkmtpfNjUXFiq0
	ORAUTNkqLIJhIe2/yRQB0CaTLoNvYIB80ud/mf5wZddxoIBVVKti1bgA
X-Gm-Gg: Acq92OGq+S7UkX7aNn1G00jQXFeHBN66bEEnE6ejSnBTu9HPrr8MEohtytbdtIWQMYY
	E3nNyfGPDtWreiF/IX/LRlg1KMGdCZptAvmsZZp6NVrfN+skpKPGFxK80DPynbOvYgx4dPpVGLX
	8yJTtYkfaNqvSnAl0dlMSRFyNsH4o0iu6ox2Q6ls82VtXxKxBxvehpihiy83p7TkaCNC1MYgGVz
	Xb3/SX5rxVdZDasnZIAS3KbyX5sHVw6P2td9d6EOWl+ZLJmRjzvJl90Os5TJQFmB5OJbZT8IPoj
	m1Lse8KxDCmmNAumW9SWhcA1msVMql3ilOx+6BIo8VRIYM1jXX1YnAkBIwq1TjiV6P0z0Jkm0ms
	fCG1F8SDPIrYnmXib+gltrVwonFHH4rK+j2gJw7MiKGvYvLvN4ibsGdfLXwGPbJIkxqr1iihYaa
	suQ/Ow63euwbR+RjefPoHxv2BCokloPlk=
X-Received: by 2002:a05:6512:2c08:b0:5aa:5f5c:9546 with SMTP id 2adb3069b0e04-5aa8865e0d7mr2689095e87.2.1780863441167;
        Sun, 07 Jun 2026 13:17:21 -0700 (PDT)
Received: from fedora ([37.113.99.0])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm3276268e87.34.2026.06.07.13.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:17:20 -0700 (PDT)
From: Georgii Druzhinin <ilovelinuxgames@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Georgii Druzhinin <ilovelinuxgames@gmail.com>
Subject: [PATCH 1/2] staging: fbtft: fb_ra8875: prefer usleep_range over udelay
Date: Sun,  7 Jun 2026 23:17:07 +0300
Message-ID: <20260607201708.88644-1-ilovelinuxgames@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace udelay(100) with usleep_range(100, 120) to avoid busy-waiting
and allow the scheduler to utilize the CPU during the delay.

Signed-off-by: Georgii Druzhinin <ilovelinuxgames@gmail.com>
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
2.54.0

