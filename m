Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F213C3E
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso10879135e9.2
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307466; x=1695912266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYFN9YS9lGoY3Drq+6yfHeUu5PUEzCkva/9j6XN0ZE4=;
        b=2+7YiV1Vo1hTtBl2fDECSrnxefPXmiBrBjijCQ3YjphuEWMngrjyIvmFSxBKKxYJRN
         IqAXi0ZOvvX18J4loWtkjTEfjE8GvtfLpAENZFQi6+zl9t1p/ZSU4uvnxzheRTOg6j4U
         CdVaIwyxFIMms0X5BsgKi74pUg/zJJ7hAz1KHidQ26Qpr6tHqpaVQI5kg/p0ykWl98ac
         M33L+C80NNtVswjSIWRINHTfnXGcrUeK7MAKdkuY5SaM/0Es0wyZDrC3K/BnojKdFwlq
         CAnIEMlzq6Khzl3NIVXmdtwJ+ClAWzCElEzcHwCpK3d4MzvFKlqDjTVidpPFGQ/pOxmI
         R/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307466; x=1695912266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYFN9YS9lGoY3Drq+6yfHeUu5PUEzCkva/9j6XN0ZE4=;
        b=nrl1UliI12wRMfgxWmMVvZw0wy5Ti7GzG3lk1c9Ja2IfeWRTktYbuJPodXwQRhdkHC
         z3v3qlqPonwPqY4jSuxgmePiWNZyDlgyru6BiSUsPXw2yz1TNJiN4a9dAz2NcviOdnjY
         FJA471krISvD7+0SSe63UCfDaolhP5d+hBwAh5M4FsvWvXX9VIjTOpIz/MbSSra9K3Do
         ONIUrWIEDmR11BkK5IFu9RPqkD7OsyrjwIhlgLcBuHLs4lpCCYda921Xq2Z2EmzxYp0z
         uTMrQMe3iiwnmrGgJTw97Xu8eCVpenIK5CIQpnoZampdTb2BnD//tqrOCWVNlKPu87jn
         Y8MQ==
X-Gm-Message-State: AOJu0YyJzYDOhV2Ed0r+3qTY8J4AvEgDPXgdEryMBn1ezcLK7lXVO/Mt
	vbSoRvo32lAD4+h2EomLnQUw/w==
X-Google-Smtp-Source: AGHT+IGzi9ygNvTFbE+Q0DTN6Dqq1DY5zH+YbCcxdTub+gBa6RSxhhAqH5GwDY9iR65TpVMFQugkOA==
X-Received: by 2002:a05:600c:478a:b0:405:3955:5872 with SMTP id k10-20020a05600c478a00b0040539555872mr743765wmo.18.1695307466583;
        Thu, 21 Sep 2023 07:44:26 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:26 -0700 (PDT)
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
Subject: [PATCH v2 16/19] staging: iio: resolver: ad2s1210: rename fexcit attribute
Date: Thu, 21 Sep 2023 09:43:57 -0500
Message-Id: <20230921144400.62380-17-dlechner@baylibre.com>
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

This renames the fexcit attribute to excitation_frequency to be more
human-readable. Since we are already making many breaking changes to
the staging driver, this is a good time to do this.

Also make use of IIO_DEVICE_ATTR_RW while we are touching this.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 27294eff99ef..14bec2b20939 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -217,9 +217,9 @@ static int ad2s1210_set_resolution_gpios(struct ad2s1210_state *st,
 				     bitmap);
 }
 
-static ssize_t ad2s1210_show_fexcit(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
+static ssize_t excitation_frequency_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
 {
 	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
 	unsigned int value;
@@ -240,9 +240,9 @@ static ssize_t ad2s1210_show_fexcit(struct device *dev,
 	return ret;
 }
 
-static ssize_t ad2s1210_store_fexcit(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t len)
+static ssize_t excitation_frequency_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t len)
 {
 	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
 	u16 fexcit;
@@ -555,8 +555,7 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
 	return ret;
 }
 
-static IIO_DEVICE_ATTR(fexcit, 0644,
-		       ad2s1210_show_fexcit,	ad2s1210_store_fexcit, 0);
+static IIO_DEVICE_ATTR_RW(excitation_frequency, 0);
 static IIO_DEVICE_ATTR(bits, 0644,
 		       ad2s1210_show_resolution, ad2s1210_store_resolution, 0);
 static IIO_DEVICE_ATTR(fault, 0644,
@@ -604,7 +603,7 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 };
 
 static struct attribute *ad2s1210_attributes[] = {
-	&iio_dev_attr_fexcit.dev_attr.attr,
+	&iio_dev_attr_excitation_frequency.dev_attr.attr,
 	&iio_dev_attr_bits.dev_attr.attr,
 	&iio_dev_attr_fault.dev_attr.attr,
 	&iio_dev_attr_los_thrd.dev_attr.attr,
-- 
2.34.1

