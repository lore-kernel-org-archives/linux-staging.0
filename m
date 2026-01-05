Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117A246788
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 06:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767593418; cv=none; b=fqX4cZF2QQbSATaS7Rk5uBEGEhltzJ2pRAYRsAP0SgVhsgrDjXSxHH29DFeOGHmO34bCYC7Su3YaOUI8o+8WItOq0M0Raie9qdxLljnvoRHVTKp8AwikZY24NkcBTD5h2R613Xm//07C/KODQjtGze5zbskoqSdCEGjIWDMUF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767593418; c=relaxed/simple;
	bh=qvpC/YF/l5FlzaXSoJKoDh6j5g0khuuj0Qt93m9t9PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WilXuKBjsA8QecdBX15EjS9C3vnTyXvhX2uHalQnRY0W5Maec5Cm47TvBLv+jW6aXBoRfIE12qNtVJZSTpEaj6FSsE1M7/mTPonSSOo2xzmtLfsZk3cbXYJ8LkbC+iNXR5iIgV4t6qBviV1qrgLwcAyL6+5AQz/UCrRnhpsxwJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF7yOnQb; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF7yOnQb"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso7821288a12.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 22:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767593416; x=1768198216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHJtUQb0A/mhz54yzwiGHDmjdFo5KL8B7QpAOP5snJE=;
        b=gF7yOnQbhjN/U2oVTrRHbbcFh5eBgTtZ13ka/NkGlSW9iiYT59vpJPfA3rbEAmGtsO
         aagU44f3v+gIcHjsJ4MslD5wxZmnY4/xuBtD92D1KfHHEaD0jJ+4T3mVS+dtVqql18QQ
         9dULxVPY+c6MKMHPwEt8xhpVp/aCViyBrfmVZaZLjLuiwsJxYJc3ls1Io31R7Y/xKsIe
         6fkHBj1L99dqylzfQJDidc6y7D0Dn7McDPONkxQFGRyxiKlyFLL8HBXqRSP8Hw0YwD24
         U7RSi9rmzc/RSAwoWY1IBm2qg0zhKkMS6uQ+3b3nkXClhphvDXz0cq0ZUhRGAMu2ZYM/
         ogTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767593416; x=1768198216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHJtUQb0A/mhz54yzwiGHDmjdFo5KL8B7QpAOP5snJE=;
        b=kE0vJnPrxJvyMoweMBR0tpoWnGiS7oYnf+ZvJp7cTY8AGq2HlmsylxYhk1+IBZxLLV
         bb4P2abWixmE6WLdsy9zoEZMnlXgZ8wZplOHiqYcpgaMmtXLbM3MjnseU/JvobYKmFSD
         0q7oOKIaq/f+QGgQ+uwl3qnfwXCEt1J2gn7hYDOy3tu6Yg6YZeRWzbUpax4hXG8ghywN
         7atow9rvjCz9ZjZSLOJckXpDrQQm+dOco6HtBDLB+bpzyvdpPj6s+Yk3alF3H+roeWb6
         W/0z5y0njpRHCr5goHgWgAkZGypM/EvNxDK9v0mih0DMUvLMFH/r3qFkZm85G/haTe2X
         FlUA==
X-Forwarded-Encrypted: i=1; AJvYcCU7zOmaV7ZPTtYFyyMogAi29EqJ6DnIHGLJ4E8dt1+nRRW/0t0uL4EARJHIIFZxDvBs0c47FmTVLxzAvXiw@lists.linux.dev
X-Gm-Message-State: AOJu0Yylw1A/Mp90dMxdnNEOltzm1LH5cOAYadw7PKE3kSfadPPO9SGQ
	VqSC4LyocqFyO0y+FddanF6jl74IHR0BR7b+TgbN745bxhnyDqzqcbKA
X-Gm-Gg: AY/fxX4uLpzsJSif0qwfbmt14Cpqt4XEH1roKSWFC7iVyyzDlGoOhe8aT4Mp3/Ansr5
	mrtXWccVd5fd6UakZACG4eU1pqtsn4nUHbUCMI5vVksXvoYAbaMMqjtsV3GggTfFQ+plU4xSb51
	HQAUBeAW34gQncI7xxwHilS52EW8jxLGpOrf0x8T+B1sV0ObBUroUa1gP1TGnK2wcQvUiG+oV+x
	IpKMc8/bjDd621WT+1KX59T1WOgyhHCACZydU7lUPvrge1xrQX8FmbKcYWCy16qx8Kr1l2kDGEF
	sljVI8XQjvznkP8Ny1H/47i5C7EZ+PyVBsg+lxGbqJkrIDmLvM2TbofCKHx+pARFww309tLVEW+
	nbLIiA56ytRy8mgkkaVSHOST8U+oqkgrq6flJ8QNYcM0wNBBcUrFy6k9wATAs2H5PmoyGlhAjBw
	ar0z6g7liUO6hLEKqR3N+N
X-Google-Smtp-Source: AGHT+IFux037pYXSM/nK+a35vAhJ08w/hzv51KAjgsRlJkYOD8Cgj/aunwGxUmabj2FO5CXuYZMtCg==
X-Received: by 2002:a05:7022:6294:b0:11b:9b9f:427a with SMTP id a92af1059eb24-121722b4fdfmr46030833c88.21.1767593416335;
        Sun, 04 Jan 2026 22:10:16 -0800 (PST)
Received: from gyrocopter ([76.174.137.141])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm134338472c88.8.2026.01.04.22.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 22:10:15 -0800 (PST)
From: Michael Harris <michaelharriscode@gmail.com>
To: gregkh@linuxfoundation.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: iio: adt7316: modernize power management
Date: Sun,  4 Jan 2026 22:08:03 -0800
Message-ID: <20260105060803.2315274-1-michaelharriscode@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced use of deprecated function SIMPLE_DEV_PM_OPS with
EXPORT_GPL_SIMPLE_DEV_PM_OPS.

Removed PM preprocessor conditions with usage of pm_sleep_ptr function.

Signed-off-by: Michael Harris <michaelharriscode@gmail.com>
---
v2: Corrected staging list email address
---

 drivers/staging/iio/addac/adt7316-i2c.c | 2 +-
 drivers/staging/iio/addac/adt7316-spi.c | 2 +-
 drivers/staging/iio/addac/adt7316.c     | 6 ++----
 drivers/staging/iio/addac/adt7316.h     | 6 +-----
 4 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316-i2c.c b/drivers/staging/iio/addac/adt7316-i2c.c
index f45968ef94ea..3bdaee925dee 100644
--- a/drivers/staging/iio/addac/adt7316-i2c.c
+++ b/drivers/staging/iio/addac/adt7316-i2c.c
@@ -136,7 +136,7 @@ static struct i2c_driver adt7316_driver = {
 	.driver = {
 		.name = "adt7316",
 		.of_match_table = adt7316_of_match,
-		.pm = ADT7316_PM_OPS,
+		.pm = pm_sleep_ptr(&adt7316_pm_ops),
 	},
 	.probe = adt7316_i2c_probe,
 	.id_table = adt7316_i2c_id,
diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index af513e003da7..f91325d11394 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -142,7 +142,7 @@ static struct spi_driver adt7316_driver = {
 	.driver = {
 		.name = "adt7316",
 		.of_match_table = adt7316_of_spi_match,
-		.pm = ADT7316_PM_OPS,
+		.pm = pm_sleep_ptr(&adt7316_pm_ops),
 	},
 	.probe = adt7316_spi_probe,
 	.id_table = adt7316_spi_id,
diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 8a9a8262c2be..59fb3bd26bc1 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -2082,7 +2082,6 @@ static const struct attribute_group adt7516_event_attribute_group = {
 	.name = "events",
 };
 
-#ifdef CONFIG_PM_SLEEP
 static int adt7316_disable(struct device *dev)
 {
 	struct iio_dev *dev_info = dev_get_drvdata(dev);
@@ -2098,9 +2097,8 @@ static int adt7316_enable(struct device *dev)
 
 	return _adt7316_store_enabled(chip, 1);
 }
-EXPORT_SYMBOL_GPL(adt7316_pm_ops);
-SIMPLE_DEV_PM_OPS(adt7316_pm_ops, adt7316_disable, adt7316_enable);
-#endif
+
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(adt7316_pm_ops, adt7316_disable, adt7316_enable);
 
 static const struct iio_info adt7316_info = {
 	.attrs = &adt7316_attribute_group,
diff --git a/drivers/staging/iio/addac/adt7316.h b/drivers/staging/iio/addac/adt7316.h
index 8c2a92ae7157..f208f0d3583a 100644
--- a/drivers/staging/iio/addac/adt7316.h
+++ b/drivers/staging/iio/addac/adt7316.h
@@ -22,12 +22,8 @@ struct adt7316_bus {
 	int (*multi_write)(void *client, u8 first_reg, u8 count, u8 *data);
 };
 
-#ifdef CONFIG_PM_SLEEP
 extern const struct dev_pm_ops adt7316_pm_ops;
-#define ADT7316_PM_OPS (&adt7316_pm_ops)
-#else
-#define ADT7316_PM_OPS NULL
-#endif
+
 int adt7316_probe(struct device *dev, struct adt7316_bus *bus,
 		  const char *name);
 
-- 
2.52.0

