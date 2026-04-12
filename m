Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC94503B
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776005206; cv=none; b=QLQhy/1ahH//eePKrnDYOo8kVn+DkfNCMpHv0tHe9ktWgSBWIRKJWx11E+Trw+v/7mcgk2y7jWTDretOIhMFwWnb/9zf2BZHcCWmcSpRqpdu9RXIHJnTDDTMqXW4qMcYbPxJXVJDEj6v4vnmaengxtmi9duQOat70cXtcZafcE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776005206; c=relaxed/simple;
	bh=3iWQYpa4v/976oSNv3UVleyySQonyVZzxNwcwTPUUGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NPmFxtyqCdil/Y/3IBuIrAhzpw5x2igZA6qWNcHw2TmBOX/rg390ILjxTN4xmDMv6umzIo0OVRXAv1T5H5Lyaay8URKSodw8jkpITB4+xf+SosLXMQGEBQt0UAaE1PG9Mz0EGEhradtN/+kJIMn9t0oV+pywgOez61+B49NcieU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BW2EL8+m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BW2EL8+m"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso28070065e9.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776005204; x=1776610004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBPvbkrYp9W7ICoOlah1q6oHXqyE/KvHmdfXYMP2BrU=;
        b=BW2EL8+m9lgoF+78cBl0XFJzcojIxSuJfLtbxYGxDrIlG9R0GbNQIxCV34iE/4cYmM
         1JTKZgnueRkuzJ2LN354PFpqg6paNfDCGjAyjHfROXbTq2ouIhsEKills8jqXcfWcRl0
         rToI4UOT4Xtn0XuRbU7IuA783W2BXVtKkbFBik/OM8oE9uafhnu8zvBMMO9qJ1yWl2Ar
         D2XvNnZvnyTK1h8htB7RQZg+ldquyydY2UBlDVEgVKSixjFi3To+lMvV/ceBT0d4ksfc
         SZ0vdsVRFvvqUPlZZURr+Wi4uWUOxv3LZZp38QvXFIQRh/sM3QfvuKYAI/O/jjS+PZiE
         PyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776005204; x=1776610004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBPvbkrYp9W7ICoOlah1q6oHXqyE/KvHmdfXYMP2BrU=;
        b=I0CLAxGCvh1j/vZxpEqyYuvILlA9MoCZrfuRMj6qeuQ9KpswvBpUUK469RaJqFW688
         aYv/nKDYD+o+Vem2UBs2cGec84y407ivbc5+J8esRRu/FUfNBmDHyGAEfaXW1dHEnILs
         V1GRRUEiprlOmkod0SL0aF4pLBXtg7VPuODgP6r8tzWdO53nmbRKg2G7aDZsrw2aeYvt
         isRo+4UyKWs1VKD1SrODh7NKLbGP8IyKL6x7b8l32CSMjUTij0G9MoQwVVsAmFaYzNaT
         dJJcx8LVP7RWdwnRc1Tx1JEYk0erqTJJk2OJ++0n0NIplQ98K/uyQyhT9YATt5gkI6kT
         GblQ==
X-Forwarded-Encrypted: i=1; AFNElJ8H4+LM4kR0APTbLyMB9UBNRkzSV2h0SgmLSNyLB7qa1KQqWzoKL6FZQ9y9sEwBHdPK1FgaIbsIyW4WfK0o@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3ECH10UyGyMviRRX4dbAbkmfAvYs9LNko/3Y0kswH5Z22wuIz
	jQ+U49/lDEuijF7Rkh45+wVJXoOg82q+QjN9FYXVptsZ0Xc84DCRyaZv
X-Gm-Gg: AeBDievH3peRd800iWv11cLogagbessx7mPwRL7JHPjO9qSie0goGOfeZvMh1eVPN8J
	i/XFat9q1aWPpv1qisxcXWx2K/hC+d8CH7Q6Izihm6F3fmVoCrii/8v/FZhjWQPdY5ufsTNzszJ
	GjGLUUpbfdAGKUhce1EB9YQ+bpAmB9nHDA6yTjB3kNDhmqWnFR2/hLFYJJQe2CQzcRLr55edpMf
	n4heC81wZuJcCsSUNidzkUi65B7Wl34NRfyMHZkpuu6n3Ee7c3FjF3iPEXfQSBiJ2oEWkJj79PR
	VYMB/xbrG3UoV5E1jQcSJJDMTD1iZnErKopJd/Xw76ei4IiL0jK8GxLCFM4QMZx6Hh+/LcQHOj5
	uPH6MvoouREv6fS3QJsr2ytQ4CpW/cEBczqueZUhFdyN765Mdgftu2FGhC6gVFEszb6sr4vsNI7
	tcZ5TR9HSsvf8tyzFKpmF01aRyF7Ekbs4YH8bWGeNoA798wdz1SQ==
X-Received: by 2002:a05:6000:2489:b0:43d:77c6:be6d with SMTP id ffacd0b85a97d-43d77c6c43bmr1268704f8f.7.1776005203537;
        Sun, 12 Apr 2026 07:46:43 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm26622541f8f.34.2026.04.12.07.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:46:43 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] staging: fbtft: Use %pe format specifier for error pointers
Date: Sun, 12 Apr 2026 10:45:52 -0400
Message-Id: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The %pe format specifier resolves error pointers to their symbolic
representation. Previously %ld with PTR_ERR() was being used, %pe is a
better alternative.

Fixes the following coccinelle warnings reported by coccicheck:
WARNING: Consider using %pe to print PTR_ERR()

Testing: I do not own the hardware, therefore I could not perform
hardware testing. Compile tested only.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/fbtft/fb_ssd1351.c | 3 +--
 drivers/staging/fbtft/fbtft-core.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6736b09b2f45..15524b80035a 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -218,8 +218,7 @@ static void register_onboard_backlight(struct fbtft_par *par)
 				       &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n", bd);
 		return;
 	}
 	par->info->bl_dev = bd;
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f427c0914907..823315dfbf5d 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -187,8 +187,7 @@ void fbtft_register_backlight(struct fbtft_par *par)
 				       &fbtft_bl_ops, &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n", bd);
 		return;
 	}
 	par->info->bl_dev = bd;
-- 
2.39.5

