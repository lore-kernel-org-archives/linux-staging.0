Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA827288C84
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639748; cv=none; b=rPxZZSS0G6ozOBaMmecztfvdB3cwAQdDGXj5mXyUGIADIaPMCsv+SygsokhJfQEre/Ulz/Vy4GYZNauLUBXnmnZv8jfKh2mDsr0bTBNiAKW86Zrh62aQmyUJvqOmJWrX1diOEsokj0bEEDoBFB/zdlyBRfOkPqKEd38NA4V9EJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639748; c=relaxed/simple;
	bh=B12gaYxryrr/rPJ3pcLrF0Rl7Kt4JWDFN75r8W5U58A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NKMTM4kYavFgopqmQB+qdS8PAHKn1PO/gigGAwfjrP2qzsGi1TYCa0nUV/jpX1AB4CujdY/NXO41vSkAvmjsD+sfEIY4X7dlc4aGRcyjI7b1xTNQz+Vf2odsCUKnbIF/zQ4BFcYWGoDjih5cYiKbJKmTNvuZBGNtJJnKa/s/kGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJzpWgyv; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJzpWgyv"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso49019066d6.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744639745; x=1745244545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CnhmU/ZILoUaMWGd+8bGeiu5Y0rkdVWKSR+fUdJPinE=;
        b=NJzpWgyvsMUu5nOyBBaPERCS/I2fDBALRadul6GZsaT0RLeEeyVTvK/PAeCd0Jan5V
         Acze50lBSx2RqefkyeE9M8GYJwhB0+t0M8y2D9q0OoKwdHiF2zv6x0oYQMNGkH5toGw5
         cMOI1FzFEvT6mmo51/PO10/2TySpmSC5RfDoLiBYl3wL4vd/n5ct53/ohWi1zl5X8Jwj
         m9DfWVCkNyVaj+7hRSKkp4OLsKdEp1tDgMu0a+FzVfC7aJ41B4D5GNCHQK2zjMriAHpU
         BykfKYcKxGFHUJQnB90xRMwgNL8ocQzW4LwDqgIQ3l0o8QTZq9eSItSBMb5u4iPJSnEd
         m2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639745; x=1745244545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnhmU/ZILoUaMWGd+8bGeiu5Y0rkdVWKSR+fUdJPinE=;
        b=dMUJK1z4ZEo3vdaL1sPAy48BS4ZrzuEXT63fT1WUqlSe1oA0HxqzSf/EEw644SPmt8
         lglYRNzRIwoh0aGFi/1cF3cyNa4UBjWQZ2tPlUuHAwxAj16IupjbrsTu/xXcsw1YEuxg
         UUfMStbW5hvvrYPL4i5gLh2paIYFZy7fgBV+81OiHUBEFlZzwPdvfOiNsIS8qHDOCwEY
         TsZ5nIVtgRcAYXyFvqwwC3agex2Uy/RIOtpxiu2qA2RG8hpdElVdC/P/vQ7mNFzY72bb
         Tprl50zyKiR1blkAm/e+DXpvoRJGMWikNeEzWSoQ8MfZuqWT74QU7fSZm4dgF1v8Uxs6
         7j8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWslHyd9BRNnlFOrH/wAvOcgBDeY+0kKRjYciPwUD1nXDuZoN6+toZC8Q9gR5Z6hHPaPrZXZVRqonWxRKJC@lists.linux.dev
X-Gm-Message-State: AOJu0YyW3kFbGtit2DfKj06MQEMWP2NAMCgx+ggqR0T26fxelrXPVNMN
	fHCArDBws6KMT90lKb7iOdgBIHQvi/OKJnv8mb75MOeAtkmylCQK
X-Gm-Gg: ASbGncs5zp2L++VguVitM9Rsdb3Wfk4zloz00UW9oFwRYEEFgRBuGvw/Y4kAk5Qg+Q6
	YNEBVpcwbr11s9BgjpJvg9UMaS70HxABp5OgOE4saOuLaqxZhW4zYywSfTxW8PpJRZ61G7Ovlx6
	cOlaks03NoBAXeU83oxWVdbBZZJw5AnRl3q4SSARd9pioFjn1iq3s1NhUYbaMK6g2qUnFJLzAM2
	oeTc0QDSRiCiTcmfWzoUjRzCN2eVD/n2+Eaakxnp47nQqxFelNagJaZcV3jo/4TrTGalDZXUzbf
	+vgrAFXcEW7gLmDvDI2uFqqYKwDFdukvhjCp8RzMf9Re6vIqJ0uOpruaNA1BvRukCQ67KfwJnEY
	u/wOtG+X2acr5B5eczJw=
X-Google-Smtp-Source: AGHT+IFGRinbFYIbEanUCrc0USF9meGu9XI5hh+1+7w8QKX2Q86t6AvSznRkMwFHVH86Mq5ooeGfGQ==
X-Received: by 2002:a05:6214:d44:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f23f14bc14mr238912856d6.36.1744639745184;
        Mon, 14 Apr 2025 07:09:05 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de973552sm84019906d6.50.2025.04.14.07.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:09:04 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gshahrozui@gmail.com,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH] iio: adc: Correct conditional logic for store mode
Date: Mon, 14 Apr 2025 10:09:01 -0400
Message-ID: <20250414140901.460719-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode setting logic in ad7816_store_mode was reversed due to
incorrect handling of the strcmp return value. strcmp returns 0 on
match, so the `if (strcmp(buf, "full"))` block executed when the
input was not "full".

This resulted in "full" setting the mode to AD7816_PD (power-down) and
other inputs setting it to AD7816_FULL.

Fix this by checking it against 0 to correctly check for "full" and
"power-down", mapping them to AD7816_FULL and AD7816_PD respectively.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 6c14d7bcdd675..6b545547660dd 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -136,7 +136,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	if (strcmp(buf, "full")) {
+	if (sysfs_streq(buf, "full")) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
 	} else {
-- 
2.43.0

