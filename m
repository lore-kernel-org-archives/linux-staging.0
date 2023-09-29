Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057BB658A5
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:54 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-57b9231e91dso6636569eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008354; x=1696613154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28jJJTis54b3wmpIVJwL9RF7C6DVS3KioTbcI+7oS24=;
        b=vdb/VD/1Dq9Ap/JkMK/CksTLXXWARvrAknRXIT1Zlx88MCKE5/gRwGNjXO7ZWOCioX
         KPpuqcVzth0aIoDAf6nHPszYSVghdaaUA/F6enIzhYV69oeNEZTdMfNoBNJ8sC7on88D
         8QTxUB7DjHk06K1Y4x32Qobq+y3758HN5r2SzbGnSJWwLQjxxAO9ZLvrIgPZpQzGq4/J
         9GcfYRM2b2DsmZIUrtk6J37Q5aO3hVvV2/2LxkfRDoTaREA6NWQQGVd3BBd3Y6Ff9298
         MlkM4B7FwNmLkfCs7KiqyrSzRYTFKMN+2rrHSBxJ9z5LOa3wort4vljjoJ8TiPeeurC4
         fCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008354; x=1696613154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28jJJTis54b3wmpIVJwL9RF7C6DVS3KioTbcI+7oS24=;
        b=QVw/j1Uy/w4o1i3YJdkkty0dvUZGvFR/wmDGjUScms9ofVJR9HIAm85ovqDkUtccf2
         vDlraJEvWpIDA48VNR6pwXBDImW/OAkWYrd4oHNGfaGnTeHlMGjzcqJwzMxra5vzObmQ
         Py7vHDJlc3Xz1t+xpAwdZuo3j34cTreu9JM8Gfkzgp9bhJtppAVv9V4V+ufp8xDi5UYp
         6zdLOrecl/K0FZDazNEeZG8SDUFgjbGyZ+6zSaR+bUal8VQ3WAFRDd0CLDfINDozh0mv
         CgXl4B19yqBbGoGsGbU3iANddoJLJULnvQBZxyx2eZncgxeMDiyR3WvWJPE0fD1fgOAG
         nyKQ==
X-Gm-Message-State: AOJu0Yx4PJMKUIeqMt67jppDyWj1TTbovmuq4J6c8cr/0tAHHnRNAizj
	i/btUIJqG4a9Lk9m/P/ZIPRVn3fpDQ9BUkvSo9LEkg==
X-Google-Smtp-Source: AGHT+IG6QmUCiM9xhfcEn2UE7ttPOZ69R5Dzu9UBXrdUUMo4iJAI90PE/xg3KBZxsjTwj0v9W0j4JQ==
X-Received: by 2002:a05:6820:295:b0:57b:e345:43ad with SMTP id q21-20020a056820029500b0057be34543admr4992821ood.4.1696008354146;
        Fri, 29 Sep 2023 10:25:54 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:53 -0700 (PDT)
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
Subject: [PATCH v3 08/27] staging: iio: resolver: ad2s1210: implement IIO_CHAN_INFO_SCALE
Date: Fri, 29 Sep 2023 12:23:13 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-8-fa4364281745@baylibre.com>
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

This adds an implementation of IIO_CHAN_INFO_SCALE to the ad2s1210
resolver driver. This allows userspace to get the scale factor for the
raw values.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes:
* Split ad2s1210_read_raw() into two functions to reduce complexity.
* Use early return instead of break in switch statements.

 drivers/staging/iio/resolver/ad2s1210.c | 53 ++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index f9774dff2df4..a710598a64f0 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -461,13 +461,10 @@ static ssize_t ad2s1210_store_reg(struct device *dev,
 	return ret < 0 ? ret : len;
 }
 
-static int ad2s1210_read_raw(struct iio_dev *indio_dev,
-			     struct iio_chan_spec const *chan,
-			     int *val,
-			     int *val2,
-			     long m)
+static int ad2s1210_single_conversion(struct ad2s1210_state *st,
+				      struct iio_chan_spec const *chan,
+				      int *val)
 {
-	struct ad2s1210_state *st = iio_priv(indio_dev);
 	int ret = 0;
 
 	mutex_lock(&st->lock);
@@ -514,6 +511,44 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 	return ret;
 }
 
+static const int ad2s1210_velocity_scale[] = {
+	17089132, /* 8.192MHz / (2*pi * 2500 / 2^15) */
+	42722830, /* 8.192MHz / (2*pi * 1000 / 2^15) */
+	85445659, /* 8.192MHz / (2*pi * 500 / 2^15) */
+	341782638, /* 8.192MHz / (2*pi * 125 / 2^15) */
+};
+
+static int ad2s1210_read_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     int *val,
+			     int *val2,
+			     long mask)
+{
+	struct ad2s1210_state *st = iio_priv(indio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		return ad2s1210_single_conversion(st, chan, val);
+	case IIO_CHAN_INFO_SCALE:
+		switch (chan->type) {
+		case IIO_ANGL:
+			/* approx 0.3 arc min converted to radians */
+			*val = 0;
+			*val2 = 95874;
+			return IIO_VAL_INT_PLUS_NANO;
+		case IIO_ANGL_VEL:
+			*val = st->fclkin;
+			*val2 = ad2s1210_velocity_scale[st->resolution];
+			return IIO_VAL_FRACTIONAL;
+		default:
+			return -EINVAL;
+		}
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static IIO_DEVICE_ATTR(fclkin, 0644,
 		       ad2s1210_show_fclkin, ad2s1210_store_fclkin, 0);
 static IIO_DEVICE_ATTR(fexcit, 0644,
@@ -552,12 +587,14 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 		.type = IIO_ANGL,
 		.indexed = 1,
 		.channel = 0,
-		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
 	}, {
 		.type = IIO_ANGL_VEL,
 		.indexed = 1,
 		.channel = 0,
-		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
 	}
 };
 

-- 
2.42.0

