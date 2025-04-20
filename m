Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727718A6D7;
	Sun, 20 Apr 2025 01:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745113759; cv=none; b=bdxAN8C814NcICSslj6Oqf0Z4TLjbBKS66y24cSo/zvjUpCrBucNNxHtzqI3pO20L8wHMiW7JxG1HL5aStZgAZIbpxtOJVgJeS9JeWYFRxLZSAcO2Tv2GEeJ47pRn11yjG9HykWnUdO9EdP31NxE0Olo7YQGcDh5WeksSMCwBeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745113759; c=relaxed/simple;
	bh=Ubbbw15hEAZ+J5L1Ub1FKSI3XNWrOXLdqS9DAd1ONgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTVEtMJTA+pFIW5Q27UOK1U2wBZGPWXjA4x35MhvTf7ek9FVSra2PKAvp513Y2cscJBriRsXIYXsPnImcTOIkA3dK6xbC2kPI1yCGOBB6QqSNI/F/q4tBJSmRVlM0Zok4JzNQkD8OiCAdJlUiDsxcXoSuFD8hZre+scSKiDiY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vsu5e6W0; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vsu5e6W0"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4769bbc21b0so28908481cf.2;
        Sat, 19 Apr 2025 18:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745113756; x=1745718556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXLzgwUjjblsXqDwVt3NWjFIy+rshNgbw5xBdqozz6Y=;
        b=Vsu5e6W0xyC+P2iBmJoTImNlE0m8I3FtuJb05y81n05SV0dIyz5d8fhNJQLXVFBpvk
         tXPGPAI3I8Dk/X2f95wi47OAL3CFFLuYx1XRZZ6qxbnXwkUyeSYJdZrR8I/D2uyTE5Mq
         YktgbZ04J55pEpB15lPxvMxfl463zqU++m+hwJEaUw/w6E8D3RUr5BPWdWhXpFGNiWyz
         kMhVX1MymecYw3suCkov/+nEpSFJ9Kc0vT1GGKonYZgV3doTndPFA+NEvI61cS6cKk0e
         MsgWcW2Ahj2J7XjhBasV5E+JB/f8i7vJ5qhpvtxCZUFdjGywkoYKIlEjtVjlPCXhA+Mk
         hnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745113756; x=1745718556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXLzgwUjjblsXqDwVt3NWjFIy+rshNgbw5xBdqozz6Y=;
        b=E6oNYKdG8xp/W3CBzcZuQRPNcZQswrVBuyzVM1ZwgzJZ7Srer3rkGPHUoiiKc3v7E4
         VbRwspmFexp5u8nIEDUU4pA2ezSlmeEpV4nckXmFZO95x0/UY/twa8DUmiXuAekRXUJs
         IfcrzkTCk9XWitbF9FAo+lfXk/tDxaBlv6dTTcGhMUu94wPIDvimrAtZzUOZVrL7rAbP
         89PhmTUAiOl2mHsdz0OUVmma4UEcf0LYu7OuVC7RZf/cIJ4p1nxWrC9xLcu98o7tibit
         1wbaltRKFJrlTKCvr50GaOCsTt2oKPfE+e3M+t85XdGUpRi3+Pz37XUg5Y70o0PgxRCp
         f7Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ1Z5/pYT/MvYVHXeX2T6xg/Zv+SW/rOCuQhaumP7Q9iIoku8SEif/LCAcHbjcr/wowbm16ugEUeAhq0/aGA==@lists.linux.dev, AJvYcCX+6wU6pK6BhfSZh0iSMFm+r2HMvfgLC+qK0Mu4X/ZkbLN7lwZjvX0Sek7O7KfSGaVTZS4IZYgMQRe7yfQPU2oU7dZ74A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ/hxC2E/n+Iphj2hsuL/WINiqk/qq7mN6kgFWS7SbnGfVC2Gq
	4LeKDB0uTHobNMT163zzVqaohqhTNgOwGivyGNMCzoD3KilW4jD8
X-Gm-Gg: ASbGncs+sY2F1nWKiWs7R2Hg8qLJtfGMeYO6I59gWF1ILWDzC6xyA/9XZBybkW/s1Y+
	U8BCru/hjqTREqPNk8Ere2DjpVaiGho7kZ4sV4JBWiitCCTsIZagIxcJPbXP/8Pt5SWWVxMJk1p
	NBTfgG+7konJKJYDxvkevJ1n4GPHm82QSDr8mxVLNY9P1O/BMjedAF227YVwO4tiKe4JOzh4iL/
	8rOOWc71w48nPDmnEtv7o+xJJZmCwY8agTjMBhibPZtjGrfQ3ToPU+ltgAJg6f0DTijVQnHzLUM
	T4GLEkS9z2YXKJgftSqMQvFyV3fUs3bAc9L0bDm85vwXfWZCR+8XwEzGMgOpcONexjO7tlhWE3b
	athW35IXQhadoWtR2aU8=
X-Google-Smtp-Source: AGHT+IGEhBOvap/DzNCF2EzCoiO8omkKUAI0ZPVhKoS8sRTdzbQhZAp63l+GmWWg2+HI6/bVMrdXEw==
X-Received: by 2002:a05:6214:21e2:b0:6e8:98c0:e53d with SMTP id 6a1803df08f44-6f2c46a07dbmr109146956d6.45.1745113756223;
        Sat, 19 Apr 2025 18:49:16 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1283sm27583846d6.23.2025.04.19.18.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 18:49:15 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v5 5/5] staging: iio: adc: ad7816: Simplify channel validation using chip_info
Date: Sat, 19 Apr 2025 21:49:10 -0400
Message-ID: <20250420014910.849934-6-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420014910.849934-1-gshahrouzi@gmail.com>
References: <20250420014910.849934-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the channel validation logic within ad7816_store_channel() to
leverage the max_channels field previously introduced in the
ad7816_chip_info structure.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index ab7520a8a3da9..7a59cfbcc6e33 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -204,17 +204,9 @@ static ssize_t ad7816_store_channel(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (data > AD7816_CS_MAX && data != AD7816_CS_MASK) {
+	if (data > chip->chip_info->max_channels && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
-			data, indio_dev->name);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1 && data != AD7816_CS_MASK) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7818.\n", data);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0 && data != AD7816_CS_MASK) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7816.\n", data);
+			data, chip->chip_info->name);
 		return -EINVAL;
 	}
 
-- 
2.43.0

