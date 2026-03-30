Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198F13D6CC0
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892479; cv=none; b=MZ5JjkszCo0EA+WB9re8z8PUnHhNrqt0tA7opCzRr2hVFsJDaayVJjxxy1UxNfaPxYEOuIBUZum375W+hz6xV/UPFsQncNQhnOi/y2aTWdkiELwuopP8Cg9Z+4KFbcnOZ7GvbwGvI4hBox+XCBy1YoxyVzvrjxfyBWLwNaq7R6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892479; c=relaxed/simple;
	bh=9qTZJN4MZ8hzBIdowCVJK06Yf+gkp3opcTlMx+EtYus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qO81fFnSc0cwTdAjSnG/nBNxoqPirSEWvlU6RIdvX9O67KTUiSGQA0pazOdKQ8+OU4U5kzxpDmluh2cC5MSClmTk47qucuMQYyJ36fbbYRmU6OCL9I11MYH2D8OJkuMgn0AB6OUoMLcXHhvnWD5M6a01ebA9h8oqFnMJo+mcfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCyCBc2x; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCyCBc2x"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82c68339cf0so3105505b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 10:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774892476; x=1775497276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0JUsGvLhS5kbPI7JpUTp+ry0YaI45Aayw2r9a2X+zM=;
        b=OCyCBc2xw+Zw1ivJLLawSqKfWTnp8w9xycIktIWRM3WNoOwERfktEFK6V9Jaow44kS
         UMu893Z3pyhJPpSA3GYBf72Lp4dG9n8ZUm4ubNhjOme1ZUiojJL4tFG3r8MP/e+iT2Z+
         utFaupBGjpXuoRlcihB9Scy3lfCuKJZ1hTH0M/7K3Ry5+JI7CHKFQ4kJmcy3klZa2uiA
         +QJdHEXUI+ahQtgB0Q673WNS9cuZaZjJeHtCNQZ1d1FnKnkSQezzxIF5mGWZdiuCjAOv
         u2XuKdYkL5mQyMRcdk3KjbEOomscq2TmXyIP5q6ycgWFVQPpLcKXvoMuJBNfiCNvVEed
         JJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774892476; x=1775497276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r0JUsGvLhS5kbPI7JpUTp+ry0YaI45Aayw2r9a2X+zM=;
        b=LlZiOpfw05p1TB2bN8JJJAEkHggpJZYImMyXdKLHEtJtHINQ0GYmP+3PuyN4/HoQ3d
         R4wou3E2r+V2wKhasQpsZfRMVoQRtgXXsuqm4blDayq5i0YbZDeCGgj07DO1myMv4x8R
         EZgbnOjBlB7KX+rF39nmGp4TvNDjR80syN2xAXXhcB8v7PU0XVtSXl4SJKSE3Up5lRK6
         l/9SP0LTTm37iRXWw9wQYUdp7Un9ULYO8R63g3qZo0VqhDF/vaf2VoBq8IwDwwi6eDxZ
         2CoBQtVimpSQFdJzYY8iwmUBzNQgiwY+sMrOMsBobagPOjCv1NvKqMI30PP7E1fNIO2S
         SIFg==
X-Forwarded-Encrypted: i=1; AJvYcCWqfEps2R12CpJyIxhu/zhDd0lekXBf/pHHn5HKSz7zx3otKMcgkRdmhzmrbfkmWdg4FmrfJrzX8UD1KBIp@lists.linux.dev
X-Gm-Message-State: AOJu0YxwqFgm0gzLzrmZcqbXgMHqXdTjHT1xwqCkIkGdiG40kwm5NDOu
	Ao87ARcP2X2iJiTm6nWLEyh8xFj65d4Tws09FgRvNbYRDTLb3R5n95w8
X-Gm-Gg: ATEYQzzN2208nUTehrqiWZmObpAywTX94zskdUKv1aX8pjUN4sE63YcYGmY/ldE8onh
	Cd7FHPDUnjy6wb1gSjlNFoBfnnqvYxCzINRXbhtka7k3qRyOhhHXUvfRmhwcJEy4uohHP2dZw5d
	6j/rhU9U/mKk42ptiVGib3oM/ayYhTJtZD0HtXx6d/lcPo1Z2EAJPcwTt+xeLUwE9lndvGOB0bj
	bgc69+FdlggUWB9a+4CMrJd6GD/99KXrx/Ct5MY1SRF6dgMdd4TFxIu+z9/XCPkyCdvnqhgYewe
	AR9XB4cgXUd3DrZOE9iwJO+gfss6Kq3LoU0wBnCxRTQ3x096t7xfH7MaraUdKIjd2F3TWxCAU/M
	xMMilQDwry8o22pGIFllsshv/MxNE2wtJjxnLa99V65QX3mCRkuFLkFRky3Kc48DClocslqZSRq
	pkEO8fPjM7cOxlpB+a8C0aVWp1f6gJooHNMbhnFOU0IxEDszXsWaA=
X-Received: by 2002:aa7:8486:0:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-82cd61d48e3mr265854b3a.3.1774892476427;
        Mon, 30 Mar 2026 10:41:16 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm7844052b3a.50.2026.03.30.10.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:41:16 -0700 (PDT)
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
Subject: [PATCH v2 3/4] staging: iio: adc: ad7816: replace sprintf() with sysfs_emit()
Date: Mon, 30 Mar 2026 23:40:23 +0600
Message-Id: <20260330174024.20712-4-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
References: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

