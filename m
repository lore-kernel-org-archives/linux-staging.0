Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A3A36EAA7
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894678; cv=none; b=Ti0jdF55qrygEYEyTCzdezVFJYGE9g++9q8UbbbUKGWXe0YyfjPrdAWdhmdGHwbV3sKCfi/tu6oo01fgsmq/9yR8KPBAtluTDzgVb39+Xyr7TDLp4YY0VrwaaDtB8SfiA/2NxTu2Vy8ZAeawz5HHyI6sYYMBnjkzxEhpEf2WrOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894678; c=relaxed/simple;
	bh=Br5vGAXYgtBTtZqV3PmJuhT96uRJmxgj8Z+FdJj7Yxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j6EPGYq4zsva6+RiDoH/cTucgOw9zWlhGeF7mVCAEcjJ9nR9WBDjficMaxYnsO3HbViu9CvPePSZ24sUF4PHSPULDEEPh3iQxSHoLFkaoTJqrdrLcpiPiuaZcGRn+8XX+d2fSJJSqon3qU4e57IYFrfPgIBl3b44JCARtnPoMME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3zCXtkJ; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3zCXtkJ"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82748257f5fso3147819b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894677; x=1775499477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEev0NrgAro5b++Ke8wuTx9Yh3OdT4GarY6/WNk8AFQ=;
        b=W3zCXtkJjkE+b1LLqHQijzNnJt1lvTFge0rMatA+A5/A65PSrsHhhDDk0O1+rRzK14
         TYDjO4LAcQ6ELYSH4eNntsW+FcPgCejJ/x8wiuESbQmDttgJ3fdSWX0aB8MxiHUrS6VG
         nInw5jEtnIAT6eseGo4TtI2PY1JGKYbAyRmZM7VQqDWJa01HPbDwzr5vlQg/kTOpFSuk
         +xH1m7Lt//QARIVpqO7+J6qrN+D+ibO+YQGWzG2Ukzt0kvNGfAq1NNuD0+BXHuLmusQ8
         3yDMgCCjLkF+hHaGauQLmP1aZpqRjJywINKOec7QoXMkowbBlK6fIHDWUtDXwmgd2l8g
         47Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894677; x=1775499477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AEev0NrgAro5b++Ke8wuTx9Yh3OdT4GarY6/WNk8AFQ=;
        b=HLLVgwXmpkc1yxeLrFX0i0yls9G3fEVO4P9Tep9ZkOnq7eigl7jjRr29NPZqvfoGBP
         S3Q9V+J7OGEi5wi+Nod8xvjK5M01HQ8gkX7jU3YRlf9tN9mutiC7vpYoMt0nrjOz5gm/
         yByTNKQhZrdhmygW9Aa1/Vc9tza8Jq66AUqWzRuHtZO9MpIHO09y6dDrFUjRYtBYHNur
         q7ipG/K/5xBVk39seCXXkfGXTTApmstZ7obXDZTEBen1y6yNpbHuT7x7JfKWFfnpOgqB
         dALa6GNQVdsBrhnYrXjuTMaP8xQIflsmEE2YI+Bk+x9744mm5xH82bHsTdU4aMhHmlWI
         6ixA==
X-Forwarded-Encrypted: i=1; AJvYcCWlBZYkbHeuJZ/dgk43J0eyDp2GmoN0aWl0qx8gf2hXqIPAHJld1BEtd+yD/ntr5sGKYChbwTqJyux41vO7@lists.linux.dev
X-Gm-Message-State: AOJu0YzJvGwfJsDHwFd7uXN3gnWRPWhtrxBs74NwCO6eM6ifEPlsqzqk
	SIyl9aUjGHHyxLY5lDEerl5lwNur2ZphlJfrbV9we/CLXbBJiTs9WdHz
X-Gm-Gg: ATEYQzxlOEBcZ/frvlH95cevYo52yMJz6+0+qUonkTaV+SF3ePmiOr/T+9VldeDxGZI
	26TwtyWxf9Sp3tp6o8X+Q6rgsVg8NtKiUx4LyQci6n7cVv0iIUjnDwNMEWYQVy2AHAnWlagavTT
	kXkQrKOB8aHH8cksOHGsbUrndr97RqY3TwRAwi1aYge7eZPuW3iyQ97HDC7t9Ao9IfnSpZAWvc4
	ZMDv+a6YKwnmMVmUGDrNca8lhASr1nIzmQye1Qj2KkpEG4IqBN4AK7pD8NgHLvFQkI9Hl4uFaFs
	iGN0Lai+7IxgiRLuF7h/CzSs4zq0RqVOGHvWVqXB+IMrfRK+dRS85qUTOww6gQpL3tcXkBX9+lc
	Jvvq5YkcWxbUOPy37+WFvcx4/TRg3QRKZ07gdA2VfqiyaevMhhcL/pM9iaxdfF6KPfMMw0MLKDp
	m/3s2pDRbr82S7ygsbTbnoxH6DYR7RRFyUpaJkrRWm
X-Received: by 2002:a05:6a00:2187:b0:829:f777:dad4 with SMTP id d2e1a72fcca58-82cd665a37emr432819b3a.29.1774894676677;
        Mon, 30 Mar 2026 11:17:56 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d4d90sm10099966b3a.36.2026.03.30.11.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:17:56 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v3 3/4] staging: iio: adc: ad7816: replace sprintf() with sysfs_emit()
Date: Tue, 31 Mar 2026 00:17:09 +0600
Message-Id: <20260330181710.23258-4-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
References: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in all show attributes.
sysfs_emit() is the preferred way to return values in sysfs
callbacks as it is safer and handles page boundary checks
automatically.

Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index f9a0a5a69..f2486cb29 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -128,9 +128,7 @@ static ssize_t ad7816_show_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	if (chip->mode)
-		return sprintf(buf, "power-save\n");
-	return sprintf(buf, "full\n");
+	return sysfs_emit(buf, "%s\n", ad7816_modes[chip->mode]);
 }
 
 static ssize_t ad7816_store_mode(struct device *dev,
@@ -161,7 +159,7 @@ static ssize_t ad7816_show_available_modes(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
 {
-	return sprintf(buf, "full\npower-save\n");
+	return sysfs_emit(buf, "full\npower-save\n");
 }
 
 static IIO_DEVICE_ATTR(available_modes, 0444, ad7816_show_available_modes,
@@ -174,7 +172,7 @@ static ssize_t ad7816_show_channel(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	return sprintf(buf, "%d\n", chip->channel_id);
+	return sysfs_emit(buf, "%d\n", chip->channel_id);
 }
 
 static ssize_t ad7816_store_channel(struct device *dev,
@@ -236,9 +234,9 @@ static ssize_t ad7816_show_value(struct device *dev,
 		data &= AD7816_TEMP_FLOAT_MASK;
 		if (value < 0)
 			data = BIT(AD7816_TEMP_FLOAT_OFFSET) - data;
-		return sprintf(buf, "%d.%.2d\n", value, data * 25);
+		return sysfs_emit(buf, "%d.%.2d\n", value, data * 25);
 	}
-	return sprintf(buf, "%u\n", data);
+	return sysfs_emit(buf, "%u\n", data);
 }
 
 static IIO_DEVICE_ATTR(value, 0444, ad7816_show_value, NULL, 0);
@@ -286,9 +284,9 @@ static ssize_t ad7816_show_oti(struct device *dev,
 		value = AD7816_BOUND_VALUE_MIN +
 			(chip->oti_data[chip->channel_id] -
 			AD7816_BOUND_VALUE_BASE);
-		return sprintf(buf, "%d\n", value);
+		return sysfs_emit(buf, "%d\n", value);
 	}
-	return sprintf(buf, "%u\n", chip->oti_data[chip->channel_id]);
+	return sysfs_emit(buf, "%u\n", chip->oti_data[chip->channel_id]);
 }
 
 static inline ssize_t ad7816_set_oti(struct device *dev,
-- 
2.34.1

