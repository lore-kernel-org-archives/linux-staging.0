Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924451228
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:58 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-57e40f0189aso231952eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008358; x=1696613158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiqsYkzaUXytpS8ltMLHCDCpitprsValB11Dy+9gc7k=;
        b=ydEd9Tkw6k/m6+f4g2F1PF/OGZqp6/D+BVb5xlan637Flbgebq621dQfEx0L/vxFeo
         5S1hkEzpe2UAVu/OZJ++HEr/ktXDP5xMvTMkjBh85VK5l253XaGyhwe2ox7xubbLkNyj
         BnzJheDIeRuSxQBtc0LB4fyIVzhmQQfHsBFf+5IDdVHsBdqdNu02pFNEr3OvRvTHMDET
         JKERmwTCYCatmdoKS6NV63nDJDarvSdi9fyLUcAoCXiabTxj16acrgOJgCvbTYdQi2Yb
         UNckDDKxVlk3ihobqJX0MAViDzrrJQWXFGjMhsKk2Z1EH3rXfwld/JKrDQKHq6EojF3a
         1QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008358; x=1696613158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiqsYkzaUXytpS8ltMLHCDCpitprsValB11Dy+9gc7k=;
        b=hhq4k5oDhR1LmEuOfSOpWXHR/cvgkd4FEvN/LqmdPNZwJQaJdy652V5Nt07jaN8FGw
         UI4cuKBb35PiowOQXsO3im6ejht2x94chK4MGpQPfWzN0CWHQSsk40B3fvB87yxVKYR2
         44iABx1XipVv9UvHDO3o/LsUUBo2Ftc+sIKWfbAI1lRmHd19R3zTo4F/8ujyqFDoUFs/
         G9lDPlpBVdXdaUw867+R16i/4+V041d171a2Ux2N4Sag5X9505zr/rWAW41f/HZlPr9Q
         tkWbanhg5bS68l5+JXYHJIzfqjMahKxUZFvla/B19oyMdruBnT8g73X385RTDgANQEdN
         uN4w==
X-Gm-Message-State: AOJu0YwWhBYfBdcmscQ2+mW4KWRxIvSXNKMWTXTOr4wQaw0lKzfW6lVm
	GLbxH+pcs8VnJ76sFN8hahTyEw==
X-Google-Smtp-Source: AGHT+IH6BEPcwZBvkbqnPBy7RB7BXkEIE5QaDtZ1O6P4wWzewrPV7PZ5/EMGPYry9IHrSXa5ea9+Ow==
X-Received: by 2002:a4a:3048:0:b0:57b:8524:52c with SMTP id z8-20020a4a3048000000b0057b8524052cmr5299042ooz.3.1696008357811;
        Fri, 29 Sep 2023 10:25:57 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:57 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 12/27] staging: iio: resolver: ad2s1210: remove config attribute
Date: Fri, 29 Sep 2023 12:23:17 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-12-fa4364281745@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

From: David Lechner <david@lechnology.com>

From: David Lechner <dlechner@baylibre.com>

This removes the config register sysfs attribute.

Writing to the config register directly can be dangerous and userspace
should not need to have to know the register layout. This register
can still be accessed though debugfs if needed.

We can add new attributes to set specific flags in the config register
in the future if needed (e.g. `enable_hysterisis` and
`phase_lock_range`).

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes: None

 drivers/staging/iio/resolver/ad2s1210.c | 47 ---------------------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 31415fbb6384..2b9377447f6a 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -273,50 +273,6 @@ static ssize_t ad2s1210_store_fexcit(struct device *dev,
 	return ret < 0 ? ret : len;
 }
 
-static ssize_t ad2s1210_show_control(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned int value;
-	int ret;
-
-	mutex_lock(&st->lock);
-	ret = regmap_read(st->regmap, AD2S1210_REG_CONTROL, &value);
-	mutex_unlock(&st->lock);
-	return ret < 0 ? ret : sprintf(buf, "0x%x\n", value);
-}
-
-static ssize_t ad2s1210_store_control(struct device *dev,
-				      struct device_attribute *attr,
-				      const char *buf, size_t len)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned char udata;
-	unsigned char data;
-	int ret;
-
-	ret = kstrtou8(buf, 16, &udata);
-	if (ret)
-		return -EINVAL;
-
-	mutex_lock(&st->lock);
-	data = udata & ~AD2S1210_ADDRESS_DATA;
-	ret = regmap_write(st->regmap, AD2S1210_REG_CONTROL, data);
-	if (ret < 0)
-		goto error_ret;
-
-	st->resolution =
-		ad2s1210_resolution_value[data & AD2S1210_SET_RES];
-	ad2s1210_set_resolution_pin(st);
-	ret = len;
-	st->hysteresis = !!(data & AD2S1210_ENABLE_HYSTERESIS);
-
-error_ret:
-	mutex_unlock(&st->lock);
-	return ret;
-}
-
 static ssize_t ad2s1210_show_resolution(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -523,8 +479,6 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 
 static IIO_DEVICE_ATTR(fexcit, 0644,
 		       ad2s1210_show_fexcit,	ad2s1210_store_fexcit, 0);
-static IIO_DEVICE_ATTR(control, 0644,
-		       ad2s1210_show_control, ad2s1210_store_control, 0);
 static IIO_DEVICE_ATTR(bits, 0644,
 		       ad2s1210_show_resolution, ad2s1210_store_resolution, 0);
 static IIO_DEVICE_ATTR(fault, 0644,
@@ -570,7 +524,6 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 
 static struct attribute *ad2s1210_attributes[] = {
 	&iio_dev_attr_fexcit.dev_attr.attr,
-	&iio_dev_attr_control.dev_attr.attr,
 	&iio_dev_attr_bits.dev_attr.attr,
 	&iio_dev_attr_fault.dev_attr.attr,
 	&iio_dev_attr_los_thrd.dev_attr.attr,

-- 
2.42.0

