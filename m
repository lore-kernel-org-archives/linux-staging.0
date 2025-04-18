Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68328253340;
	Fri, 18 Apr 2025 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009436; cv=none; b=b0KA5xNjh+c5xEamCguF7y6YFA2ANvBI9ug7qvTKAwUpiyKfMxqRyPcjmB1MEzT1Eq2UN8bv4bmfF3W0XZC+BjohyZUVVhn+4WCTaKfdYr5I8QE3XJjNKXEYgk7xY22oa6iT3pv1+LrjHttQQ7K43abZHs0byDrWPN98AiB04bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009436; c=relaxed/simple;
	bh=6b39M6YtW2A/3eICBTEDNqpUWewC4LsFqtDslsVsEOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zka0b22HjWA2fFJeBC6HrWNW+46IJ8PrrghlAIfcBYT6UjBzFT1YpUlTBfl/sARfby70pC8fHG4DIMjFKOGbknhWNDFlexh4ixE+fvBDzhN/Hsn16mK4bLSIJO+cRZAP22JTNPi7RxoQG7UHvI9YbOlCcchn1Un705i6+yHOy5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THLlIYr5; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THLlIYr5"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c7913bab2cso207456585a.0;
        Fri, 18 Apr 2025 13:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745009433; x=1745614233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SMPeQ941nuBw4ulrFHaEAxjMcMmjZp4/m3CVTBPiag=;
        b=THLlIYr5+8lkpN45AcghiZ1wCTnqjxX+xLELfppskntC7euW3Il6SqckTS2zVbbRxY
         aYkj6oYPDQTw0HkNhJxPG9hK41DkomdsRJpDzCGINowZrcOHY14j09BmcRComtfPz5wC
         HJUxtMuolpNaSPcJT30WjvC6esHiJaYkOXSzyie6eXKKA/Y+ksjNXdaSI95cNMyrTmTs
         CfOiKvs5WPVvloITIjG013XeYyyVWZyGYNPIESCduGbGLdUW3qmv/qhMjXHBz0QSiXhs
         8A8WOEOpkVoyXflTYpNSO5xh2XPrY5PJQHscDKlCCwa+CZc1KlXcQBXCnjOeS8MjtkAu
         GFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745009433; x=1745614233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SMPeQ941nuBw4ulrFHaEAxjMcMmjZp4/m3CVTBPiag=;
        b=ast3vhoKfIJT1ojiiCCvQfE/F5A5AfIqS8QdXksBP4P835untA4bBGdrMUdoRdUlrw
         svUpHVD8td/cxAkb0IBT+Dprkw4v9hJRN5CSXJfTLfL5/b3ayWSVrp1HBKpsXmKE9wN/
         Vsdiae3ZUCJiM8WNjhkMjoMoQ2NUaPD3SkT8KnV05R/3edFxKeTbDYUVo4DSCXPGTM00
         qCzSK8KhsVy35AJZ2OPMTawpYAY3ZeVrtTxV15mWjGxh+7+Uo3/IIdz2NuA1FcxCQCho
         oMe8M2jPUJsQtu4TSJN37TsDIL1D4AkWj4p6YHv7P0ujJV6aXpcPzsVCpWtx1T5ZDiBT
         qVtA==
X-Forwarded-Encrypted: i=1; AJvYcCWSKablDaaxEBmvIh0jzF3gYI97p3wXDuKfViNpqgn59toDNWAGvKFdOqZjLcPU4fEhy4ygb7pMnGBVit9uUw==@lists.linux.dev, AJvYcCXhlZpa4nGwdeSfBNXnhXoB9w7Kb/V2nE02HFv+aLNX3W0RHRT0IZE5rG8uv+8yJAe5zihUMnk7Plwh8JvHkXeeX8MGkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzO6FMiFhtXz9fqigZwpdqOshayJipI/G5w5pegtmhx2kPSh2bf
	o/MvZY1AHsuyjbLq/EhGpCna54hsx6ZOWHbKRoyJd8cBupmM9YUd
X-Gm-Gg: ASbGncul3Qo4d4uG49Eh5TwvZh5513mmO/P24zOBDUWj+ZTuKpzLZPWUMiFLpRUxvXF
	+rGWvVnKtmJRbW1nY8LTn0CkZQlLMp7JDtqmai9MMKqBqdmpm23kGHiUvWgfp9LxglTs0/VQEi0
	cbftP2ErqyBEKBrC97oeNgPdpV7TlzgqGKoqWmafKUV8GiAvGWr0UNaMSTt4VeCtODm1tXPc0Wq
	Da09cTtUXoVwsJs4z+H6mxioKfRDiY6z1dF7NKLt+MdR4/lH/9HWFJmZxCmldQfngdUdQndNiyD
	eJ7GArPBq3OWQgI2qxLypYDHR+RZNUVfHfG0vh4xLQ/JzejkXvRDkwix4GGTVWLruN1dnnkZkut
	0CyczXJq61mr5pN6g5Bc=
X-Google-Smtp-Source: AGHT+IGO6qNyMGRvR963+xpPXWdS16jJx2sEAFk2rlIOtDL+gt1OLO0T5tYCAfYC5Sf+S9gLqrFUKA==
X-Received: by 2002:a05:6214:2389:b0:6e8:9dc9:1c03 with SMTP id 6a1803df08f44-6f2c455f647mr66305356d6.21.1745009433041;
        Fri, 18 Apr 2025 13:50:33 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af11d7sm14355906d6.6.2025.04.18.13.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:50:32 -0700 (PDT)
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
Subject: [PATCH v3 5/5] staging: iio: adc: ad7816: Simplify channel validation using chip_info
Date: Fri, 18 Apr 2025 16:47:39 -0400
Message-ID: <fad83a7efb12c0f40dc2660cf9dd4c57422ecff9.1745007964.git.gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745007964.git.gshahrouzi@gmail.com>
References: <cover.1745007964.git.gshahrouzi@gmail.com>
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
 drivers/staging/iio/adc/ad7816.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index ab7520a8a3da9..b87934aaae581 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -204,19 +204,10 @@ static ssize_t ad7816_store_channel(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (data > AD7816_CS_MAX && data != AD7816_CS_MASK) {
+	if (data > chip->chip_info->max_channels && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
-			data, indio_dev->name);
+			data, chip->chip_info->name);
 		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1 && data != AD7816_CS_MASK) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7818.\n", data);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0 && data != AD7816_CS_MASK) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7816.\n", data);
-		return -EINVAL;
-	}
 
 	chip->channel_id = data;
 
-- 
2.43.0

