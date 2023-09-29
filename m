Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3054521D1
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:49 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-57b811a6ce8so6252583eaf.3
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008348; x=1696613148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKHIiAEIE2mVS9nRK2qrqb6L2W/l1AsQzObZva2M/Qk=;
        b=lp1OmZsrRnozlld3SSc83Kh+Aacr9ZewFRMMHBoWgIAD9+km324EHmwJy5OELb7TMM
         /ifFS3nguwV3Po6JJi4gM3YUI97z74UPy7yPPbzYndIbjnD9DrmduUvnLPeAsEp+epG3
         E07/6z88hqnmY0ZAqYRqPZIEK6AEc2axfHV3y/Y8GyrBPbefR2j7PfIeB0IddiRan8MF
         6YRnrl0jRVkOj0kO1KwK7ZwaNIaoyFI5w4dHuCPNRH5dclsKUQI4WXSkx4Jk4CPwpaRA
         5eeON2MhIwthRkxg++tYQl3SFGxLXwgNDHm0F7OHDIFmqfchI/gBICLVA4UhxN7T0qbh
         AG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008348; x=1696613148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKHIiAEIE2mVS9nRK2qrqb6L2W/l1AsQzObZva2M/Qk=;
        b=qK1U4MCZH7M+mCqxv7o5VvoiJAMHORyluoHDVd8p2l90Dx7eykyVz7jyy96Jp3oYL6
         XpRzKVNe1RHMaaXv9RrE3jy4oxiigV/RaxhoqukWu7cPzrK6YH+VGRkbKniL2KhXvF8f
         22rhyorbF+Tc7wvhTC3JxpeVs2umqb0gSgYSQcXy3meiqfb/7f84qNroh5WLc9OzmZfT
         3JKpfFJEiQCMvT9XdnhvseLVVxZbngFK7DjL5ud+sEqjz0Gojr9TSIY2xg+Rf6bkEl2e
         shGG7rQ7XxCLlinTYZF6PU4D6ssgN7HiqoGvb6HysLM2UBfEVELtp2dx7dOYGIeqcXmf
         gfmQ==
X-Gm-Message-State: AOJu0Yxor3xHGasIxMBgT/YBAjLUfTHgVJqyWuAjGZBDrCLeDfTCgQV7
	eQEeAwTKxD3HqCe4mkuBGvc71Q==
X-Google-Smtp-Source: AGHT+IFylFVlQBDPI884Fz3s36mtqtFzBQzs0lhqAdNGptX/DuoiScazX4S3FyYmEUS2TjtVMukB/A==
X-Received: by 2002:a4a:6f49:0:b0:57b:5e98:f733 with SMTP id i9-20020a4a6f49000000b0057b5e98f733mr4812423oof.3.1696008348476;
        Fri, 29 Sep 2023 10:25:48 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:48 -0700 (PDT)
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
Subject: [PATCH v3 02/27] staging: iio: resolver: ad2s1210: fix use before initialization
Date: Fri, 29 Sep 2023 12:23:07 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-2-fa4364281745@baylibre.com>
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

This fixes a use before initialization in ad2s1210_probe(). The
ad2s1210_setup_gpios() function uses st->sdev but it was being called
before this field was initialized.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes:
* This is a new patch split out from "staging: iio: resolver: ad2s1210:
 fix probe"

 drivers/staging/iio/resolver/ad2s1210.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index f695ca0547e4..3f08b59f4e19 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -658,9 +658,6 @@ static int ad2s1210_probe(struct spi_device *spi)
 	if (!indio_dev)
 		return -ENOMEM;
 	st = iio_priv(indio_dev);
-	ret = ad2s1210_setup_gpios(st);
-	if (ret < 0)
-		return ret;
 
 	spi_set_drvdata(spi, indio_dev);
 
@@ -671,6 +668,10 @@ static int ad2s1210_probe(struct spi_device *spi)
 	st->resolution = 12;
 	st->fexcit = AD2S1210_DEF_EXCIT;
 
+	ret = ad2s1210_setup_gpios(st);
+	if (ret < 0)
+		return ret;
+
 	indio_dev->info = &ad2s1210_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = ad2s1210_channels;

-- 
2.42.0

