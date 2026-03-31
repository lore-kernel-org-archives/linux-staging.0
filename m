Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE9B3CAE6C
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941939; cv=none; b=OoTaVn9Uw1yDAqT2k778RumIZkVfb+Q8ffR7bY1FvEHEMistvbcGbYDTiewwIAP8zs6ZKvId40waoWLG0udwRxVlwICvPl/ojfvaHK0LL8GGoIQGqP2OVeWCFgBYhWRdWB5MK9p/t7AZKPZaT+H+oA3BvlpqG/fO7PyIYX0nxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941939; c=relaxed/simple;
	bh=tvHGLlUW0934gu/EunJKAraP8P2NLrTeFjBRV1t97OQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qilgUmmvSRH5sxyIbO6hr3OlHn4B2MpyyuyhBp40lIMOoH2J0xdSEOa/66wf7TXmY4sMxqSgpm5U+HhnIGJsFwUbSSxNtHy7vlIzkf0dq5WGsQmO4HLlcGNJMdh10cf4gkm5mo8q1POdwDQtyvSIjDNnwGXMlzv/dO/vTIuPcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH+bPfs7; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH+bPfs7"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so7082265ad.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774941937; x=1775546737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5w9449oT/0NgVOnXXa2/F/Il+1HxCjHPZUwGwVZnks=;
        b=dH+bPfs7wZLPe3r6UQtZ0Xbjl4u0y+B8Zw5aB9gouQI0QQkhAm1LL4ii72c6sMpeq1
         GCC2InJ0DP9UKDOd+nOkMTaYZEgGP2YfK7CXIA6GY8DV/aH0JbNHQ9LeXyYtZGnIxXG9
         pX70OGE35bWG6hrK3buWabJxxot0I85w4x91Z3Ee1yVCzJNA+BP6BwsADkl/A2/g+HiN
         ZnmaWWyy5dYPpW8OjXQlPtMyQToy3DkMQvMJ/6W3IT519pf2usGLvYL701G0GdlUG3Kn
         eDgceGiWP+zQGZLYfdGUmiqw7XpvDfahFXxWHXK3A1/eNU9as7BzvhQvXcN8bf8mymdm
         nZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941937; x=1775546737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5w9449oT/0NgVOnXXa2/F/Il+1HxCjHPZUwGwVZnks=;
        b=RiJ4X2/UricHi09J0Gk2c5umiUz1Ch/2YBQYci0rUwAKbPFUCwwNBHoph77h0ONxq6
         AQCP+jqPbXlg7xbXXKBwwvLAY3zpH42t75ODBe5UjgVFc7OrckHiypy7b11k0dquE81s
         slykYwKmqSxsqxZy3ORHFtGeVO35x7Gs7xa6SkY6KgetzfRToAD60gZtl/+c0lzq3Ii6
         frlb2/GDkg/FPIg3zc69LzMIsIKXdIzExDGWutrxeGMHtZiQZsVbqX/1gkTJrtTzX9Td
         UX7Y70DwrEqsHQD+G/n60GMiLdbqjOD830CY6QzzYefoHyMSn+XKF3X0532FAv9u/k9G
         IKGg==
X-Forwarded-Encrypted: i=1; AJvYcCVz2Cy8Anw++0pr2b3mEFQhmr56OayEK1pvFs49UAOtzEYf2tCbFDH0eikyaLry+6UmUubF6m8qPEKvP5Cz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9gaQBZNHOJZZOnZP7WZ75mnI33G+z+uLYCFwAaH0JgFoOT9++
	0keYnmKYlOdDhf9kg6NkrhHKxhB1g3YO0fUhkj8MHTR50esIryLIm1WL
X-Gm-Gg: ATEYQzzyIGeXLtnTvmbB6ukg4iX2fY3gQ/36/sgqnH+g4E8VfRDnGDnaTPRuYAbWvTf
	XRFrlMy5T6zD/cSmD7MZJAFm2NULXtWjMfQdK5AVzBIUcZ+quZjm1cs5zsTXTVdBZMVY0HCNyK4
	gB/wYn66RmRNTGf2mh7p14WXGZNL12ndO9lwLI8dRQYohPnBx1TYLvutcnuzCchzG+UbZgOgZSS
	pTWdxdKwU3hjivLC7eKLTIktLvZDiX+V+arzLfpjhwBkXX8ona6LqScQBY+4hZh1FqhzUrf7oVf
	iipMTrVX4eKHv3RvVmmxU//alABIk0O6nsBtmrO20PteRMgh0FdTBMXfmjZ4XJVIio6pvfzU9aV
	spgqb1eA2ob2MuhKMyNgCtWB6HuCkT9JdCJRdmbJTQLv0xzOlxHWTj4/ho9y4DB3DAgSVA/9e8J
	QBSW8YsAi3fRfUGOKpIpog4og3fkDqduqA5Aa416k=
X-Received: by 2002:a17:903:46cd:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b0cdc1f89bmr165259805ad.11.1774941937496;
        Tue, 31 Mar 2026 00:25:37 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:5412:6527:d590:8704:ff8:2ffd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642956sm109272495ad.6.2026.03.31.00.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:25:37 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v4 3/4] staging: iio: adc: ad7816: replace sprintf() with sysfs_emit()
Date: Tue, 31 Mar 2026 13:24:52 +0600
Message-Id: <20260331072453.6530-4-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
References: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
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
index 253ef2262..790b04544 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -129,9 +129,7 @@ static ssize_t ad7816_show_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	if (chip->mode)
-		return sprintf(buf, "power-save\n");
-	return sprintf(buf, "full\n");
+	return sysfs_emit(buf, "%s\n", ad7816_modes[chip->mode]);
 }
 
 static ssize_t ad7816_store_mode(struct device *dev,
@@ -162,7 +160,7 @@ static ssize_t ad7816_show_available_modes(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
 {
-	return sprintf(buf, "full\npower-save\n");
+	return sysfs_emit(buf, "full\npower-save\n");
 }
 
 static IIO_DEVICE_ATTR(available_modes, 0444, ad7816_show_available_modes,
@@ -175,7 +173,7 @@ static ssize_t ad7816_show_channel(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	return sprintf(buf, "%d\n", chip->channel_id);
+	return sysfs_emit(buf, "%d\n", chip->channel_id);
 }
 
 static ssize_t ad7816_store_channel(struct device *dev,
@@ -237,9 +235,9 @@ static ssize_t ad7816_show_value(struct device *dev,
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
@@ -287,9 +285,9 @@ static ssize_t ad7816_show_oti(struct device *dev,
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

