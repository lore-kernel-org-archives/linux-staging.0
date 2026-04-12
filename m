Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD80295DA6
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776015205; cv=none; b=ZUK0/rz29635jpiT22pqFEOXoV3BZOPoT87EtQRoFiPZjSj/dfZ0lLcpDwxAKfYotNSWWeLPTMUxHeOm7o7FrpdmLEym8ADaeIDfBmM3axW33811mfOfVYYVYNRUz7jY5/VcM49jKstrFE8E4F215WQbJlbh8TlNRnpXAP5fx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776015205; c=relaxed/simple;
	bh=/fq4vDr56CO2k+npiEa+6hwzqLAU9ijIhxkJrtFIYjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JghaPdzrti2aCOjO1oBhOJdUfVhuUW0hPD9XMuBdmswUkMC1UsZ8OOoqTXVTPgSEigH4rd6bVKWtA7tAtLjAPgTKmcTt0b3Tld+ZJ2DxLOR0KhKFP+yXYRfYnSQyj/IpK8KS99+4AnMLCv3ZNtlQVFOA9YShGwN3t+nmBs+MnRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ7PlPcD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ7PlPcD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48374014a77so51397275e9.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776015203; x=1776620003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zY6yfZkHIbKAhpXHmyMs2cR3FIwM5tf4pW3ivO5AZFE=;
        b=LJ7PlPcDJx5bQst9ONRegBqMrKCEuUpF1FX/wFVWohb4BKj8DxykL7oukIzDUk22cJ
         trTXl5wH9y4rVzmiD7oZv4LO+2P4b3Vr/oQ4UVv3SbfUkfpB2MZrEMhXEkusef0naGNM
         sH0HBUyugg9Qwm8pvCcUDaHymuLjfeNYqrgyftiCaNOL/B5nq/j/cCoBRoDGH6ApQsvN
         +65I88c3u3SUtv96ELH0nAHAJ2g6q8eJ4GgjCzhZXJ8rSAIJc2RTQXOqHRKIZ9AvQtyE
         1IpoX2yJy/8kRCVHdhnYdnmr8d6AXaGQy5ufr5ny3PhMhXxYugQB/ICCDGlFnMibPnle
         u0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776015203; x=1776620003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY6yfZkHIbKAhpXHmyMs2cR3FIwM5tf4pW3ivO5AZFE=;
        b=M5TSakkh/0uLhTHqc/s10b2vl1RvyJWiGkXfyXG4Xd4jiSxMXkhyN2TTrq6jjtxGrj
         N9s3n+TzZA9jiUcRuhDFWou+fzGzMGle4NGGOKScqBf1gJn3jiEVlaSp9fSPnjpy83Zd
         /CITTYlO5/FTlRMF5AERt0eXxYUOnj4ZgXNaWYPsHOxOG6X2BeDY3NvoYJCR50zU/5XL
         RgSq8kSaDKzOVuvjnJHmraWi6U7IH58WUBMMIyVZRjXxBDu1YL+dUsuXG/HzoYwNZcU+
         mTCjHbmKHg8ShayicHwZiVmQadSNvo6Ryhaa36boVM+wHebnfr4nhpHC1X96Ik+Tz6vl
         RgCw==
X-Forwarded-Encrypted: i=1; AJvYcCWZboHJBmw2JXzlWHwzeKlEJRwIuU8kZxpqPUdHH0F7Hn6O72HN7BUBTX128r5PZJ2SVGcVRDKJzCvr2IKI@lists.linux.dev
X-Gm-Message-State: AOJu0YwCayKuaNW2hE5UBqvJYb+XWaXOFRCMSJa70+t/lIgQ5aMonlzY
	iS+tAtwSi5j7kuaxrAdWkvVoOvdUnWckFfxSjKajZVaqBmmfj7vQhEJh
X-Gm-Gg: AeBDiet1DF9jlYiCP4VM3g3hA3dhKhHBILPvXfB+ljyQ6+yk0hXw2E7NTNcxiy0jbGe
	SIlpDtjpw90g7Cp1rXpatUWSOqd7D06l928dfmY9PEorZOoEW07ECzcoGeY5aYDKgB+UBj5gWNo
	7q/MU0mI73v7LeHzP+bu4nxf2PS3KLWYkfxuo98tzRXOYGjaBHYxGE2FKAbpjPFcf5YM/wRvk+S
	VbNrsiUntgLxWmky3md+7qK6BD0xJTfujduXwENm6oTIiSo1xM4yu8LEz94E03zQe6LOAA3gJtJ
	pWZcS9snC/Fb39b4w0t0PCFwjlrtIGzkeJ9rD1VFHV2CxlEd4cdvN3fUj2svLZBFUgIpTEDgbtk
	41rkMil+PozjHhvSRO6edMCTJq8Mi0TJ1UwhBRsb84WysZavxgW4wwq9ahjVF1AjwF6xqjrdDv9
	Ti1y8NeI7s99ZujjSt31aV
X-Received: by 2002:a05:600c:a010:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-488d68af201mr154253175e9.31.1776015202671;
        Sun, 12 Apr 2026 10:33:22 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6c0:2682::3d6:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d76eeb2d1sm5499983f8f.22.2026.04.12.10.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:33:22 -0700 (PDT)
From: Baker <mzndmzn@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baker <mzndmzn@gmail.com>
Subject: [PATCH] staging: fbtft: fix coding style issue in fbtft-bus.c
Date: Sun, 12 Apr 2026 12:33:16 -0500
Message-ID: <20260412173317.3329-1-mzndmzn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing space and comma before closing parenthesis ')' in
define_fbtft_write_reg macro as reported by checkpatch.pl.

Signed-off-by: Baker <mzndmzn@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..409770891c54 100644
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
2.47.3

