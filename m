Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B553C3E
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:17 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-403012f27e3so11350635e9.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307456; x=1695912256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9YCZ78k5Zg5KKitr5PpHsZw/Rz0qYyLXQR2L135bIs=;
        b=0jBfONkY9u9I1a2L24r+y0U8ygm2FO0F6rw7HVOLMnbOaOJ0ImXJRONPHoslKwffsP
         kxb9XBIEnbtOaMAtapWzE8xYP8Iogr5QCVVok59DWvZVD1ZLgbJrFSvALxiedB1ErNjd
         sYPRK6cWdECYprseEqGY7EIqXgtDy9/dUqCbDOCw724GjrYwELCFTYv1JEROELMhMv8W
         cjtOSkMOro4O2BiXVrLYzLcPm8JaVc41YFno/7fwdk96b6neZf8atkrjWljciDVfwn6V
         xqi66Qy1kEfIlxOESMqOjcJ6/2re7CDHU0PUUytNW1XxwnNm7etiUAuDAiXssxC4LpPK
         7dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307456; x=1695912256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9YCZ78k5Zg5KKitr5PpHsZw/Rz0qYyLXQR2L135bIs=;
        b=h0WsjiGUYVAeRJPX5Uep29aypJxtDgXM7Cy6ODEBfyGjdQBqN8zjdObZlpdQ8T0+p0
         cIu3EuojvM2j8+rDUJpnLeqxhBzGdCZ54douBlxzPCq1VaieCL9B5qhfrWwNJXmmRJyf
         53cv+WdwfuTQAFBTQ5wZ17u9T7jQEIbt7JmCAyjACVPIkHruqyDv9T8MHOXePFroZpBP
         iXYbthNpg7BY0nnsOEgkl9rVe/j1gAyAgrSd1ilEiNAFABE2FjP7WvZoW+a+EjaEXEOM
         WvsPfjZxVs8ggaNi3GQcUV2AaizkIRFBbhwPY8twelQK7PDH9GVC+bren8rKKLsTn4Vv
         MB8Q==
X-Gm-Message-State: AOJu0YzITb6OOPR66hz8xo/UWAJKo/y3pcnsT9KF8d+3NUeYbIR5J76q
	h/JNb4cs+7/4IM9goRrKJ7gtRlchh7d63HS6dxXldcmJ
X-Google-Smtp-Source: AGHT+IEpFrDSoMcGwkX92bs0KANrkQRic6vkb2g8vJmtLIHbFG/3F3REKUYxWKXB+6gaHaSm9uvZwA==
X-Received: by 2002:a05:600c:ce:b0:401:d2cb:e6f2 with SMTP id u14-20020a05600c00ce00b00401d2cbe6f2mr5107214wmm.32.1695307456325;
        Thu, 21 Sep 2023 07:44:16 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 04/19] staging: iio: resolver: ad2s1210: fix not restoring sample gpio in channel read
Date: Thu, 21 Sep 2023 09:43:45 -0500
Message-Id: <20230921144400.62380-5-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921144400.62380-1-dlechner@baylibre.com>
References: <20230921144400.62380-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In theory, this code path should not be reachable because of the
previous switch statement. But just in case we should make sure we
are restoring the SAMPLE gpio to its original state before returning
in addition to releasing the mutex lock.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 84743e31261a..0bdd5a30d45d 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -510,8 +510,8 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 		ret = IIO_VAL_INT;
 		break;
 	default:
-		mutex_unlock(&st->lock);
-		return -EINVAL;
+		ret = -EINVAL;
+		break;
 	}
 
 error_ret:
-- 
2.34.1

