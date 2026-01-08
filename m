Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D539E18E
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868649; cv=none; b=AabhsQ1crMt9MJxpIG4y91NO2XMnI2u0OQWTknmXUfKuYF4kViYVvqIeNhgoNTNQavupxs0Z9bahsmaS8PAmPyd6p35hVssfofDGkKMCc3V20sNcXv9A3dbp4RebBcXBkcaTd8yGoBticGcgzXHDVtk4HYkqDp1ugSXVDe/WQO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868649; c=relaxed/simple;
	bh=sGvjIE/LBJsZCF6hs86rR1o0wLSVIq1WUp0bGORn2Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oqm3cx7r84Tp4uvPuQdIPZv8qLM3kFKkAMmnpROAXbXEnwgE6PFoIqyYI0ulsq3gN9/s/Rv3LA0HW1pWCsdCjsH2juOGmeYZ74Jl3Wa4z9RMMIYppd3iklQm1EZr6eTcfI8cfLcTzM0NgYLvF5I3pQwGNQnSMM56e6pdBc0BULg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAb19+l0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAb19+l0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c868b197eso2830614a91.2
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 02:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767868635; x=1768473435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1U5zRO+SPCwAl2mrA9Yp8CsA/asNYhp8z8hd3Fhm+uM=;
        b=DAb19+l0wrBYeCaCnM3NMSFlv76NaSO1I+Gw0Ht8ojMIn4UUkZDlXUpzENRKTKKDCo
         k+HNX4LrlRMw5Xnav1fJ4V1ycWtO1YfhFJEtvE9BNV/z0nF74R6Msjuaw8gx7f9U9qTu
         okIfJgtHWUVIeZQoFyYpRr3BolXbM51FoVp6+nfhQpnkxL29xgACORexSJzT/gMsnyxR
         qNotPHL69JxOMYRBF6Ot+G/kL2VqERN0dAAq26t+n2EyM82SCK8utBRIFVwnWvPUA9ZL
         QrypTJMlf5ol31vrrW5NM5KIm3A5IV9V489dEWwS7e/B8KvDBxPikDNufMF/GTHsM0Oy
         9z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868635; x=1768473435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U5zRO+SPCwAl2mrA9Yp8CsA/asNYhp8z8hd3Fhm+uM=;
        b=tWBG7pwUcu9r8qZkkkaKoa4O2bzCp975t+tj0gczbZTyCSdrjc1wF+CwZWqFBJvFJa
         MTbhKtmZ5Ch88O+6+iEEji+TP8kFQEQKDrT+hTHGVKIl2NALVAMPtmjidpFdtbQo6nja
         xWMDfu7wYIRFQ0QcfsUk/ABpNl3zpHEgraR9duj0JCbmfAgrCaKJFp3ocV83iC1jcL9W
         9XK5kIxpR/NdFbRG29oWWO16KRhpEYKK+QQP5hwjVwqZyRWzoTaVEBT8mr5/ve60JiKE
         UHKkaqs9+64iG15czLJ7v51oZdMSSWvSGGbfrN2c10+guCVeW8ViqrH27jRW9n72XnMf
         bBEg==
X-Forwarded-Encrypted: i=1; AJvYcCVsKer5waImTQu99s6kkL5+vbXYfASC65kPnNPhYZOHqjonLPwPFUDr6KebgX/WDF1hGxko+6HqSFs+pXvm@lists.linux.dev
X-Gm-Message-State: AOJu0YxiJgZ4Hn6czilMnbFduls2tq8VFdVbNYCWrCHAmR/WRaoo9ywN
	bU8imE9FCgcQWDN17KAMj8Iaf1v8+Wx1oNxZjf9Dcd2MJfkuoDG51Pym
X-Gm-Gg: AY/fxX7YXDybcilT9OIBruY2H+KWwNlUFpxMw3lDJRKtwymrClPGkBNb1rvnOq+XyGg
	cuIF5F8gHadOQRlBwJKwEUA9E1NskAz4ot0760JzRbk89L/l+iCVZoRZFPtcc/X/Iex09KpIXkL
	chYJbm/8XDREe0OcA2LPnVFgb7hEqwTOIkrSxqUlzhkFttWbwqLqW0HtGnSmGEmKUnQ788sLywB
	QRLRfJOJ46sxZZPYfWpVDolsaGpdqtGX+MIy6Y2AIqlONJot5Vk3JfQBYGinX5hdqFKNIOsFzco
	/7p1IA7FS9rVlKEUqBsNBGKoB1/o4ernXZ0MzmV+7lYdb2QdNnzYi6VQ3z5SMHkYpJz/mHJT6ed
	R05L62vpdGFl+s3juEnanHs8bdYuVtJLkZHxvxrkmfxVh0opanS8BOIkQQHbn7XYAkk57QNS4yI
	mifOxnerCybjMsz5VWutZETJXTVYdmwzH3zrkom0aw+YWUd2aGlB/40K4I2tQ=
X-Google-Smtp-Source: AGHT+IENIC3sjHqbdW2Eie4AgrjdVb6lo91WKNEjcp3xXk4I2aUvrWqa1grnwsWHVXwR65QMhFLxZg==
X-Received: by 2002:a17:90b:1c87:b0:34c:9cf7:60ab with SMTP id 98e67ed59e1d1-34f68c62b63mr4446553a91.32.1767868635449;
        Thu, 08 Jan 2026 02:37:15 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8dd2sm74838715ad.82.2026.01.08.02.37.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 02:37:15 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chaitanyamishra.ai@gmail.com
Subject: [PATCH] staging: greybus: lights: avoid NULL deref
Date: Thu,  8 Jan 2026 16:07:00 +0530
Message-ID: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_lights_light_config() stores channel_count before allocating the
channels array. If kcalloc() fails, gb_lights_release() iterates the
non-zero count and dereferences light->channels, which is NULL.

Allocate channels first and only then publish channels_count so the
cleanup path can't walk a NULL pointer.

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..4c9ad9ea8827 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1008,14 +1008,14 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
 	if (!strlen(conf.name))
 		return -EINVAL;
 
-	light->channels_count = conf.channel_count;
 	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
 	if (!light->name)
 		return -ENOMEM;
-	light->channels = kcalloc(light->channels_count,
+	light->channels = kcalloc(conf.channel_count,
 				  sizeof(struct gb_channel), GFP_KERNEL);
 	if (!light->channels)
 		return -ENOMEM;
+	light->channels_count = conf.channel_count;
 
 	/* First we collect all the configurations for all channels */
 	for (i = 0; i < light->channels_count; i++) {
-- 
2.50.1 (Apple Git-155)

