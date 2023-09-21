Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410BBBA26
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-402c46c49f4so10661335e9.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306166; x=1695910966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYFN9YS9lGoY3Drq+6yfHeUu5PUEzCkva/9j6XN0ZE4=;
        b=fzkfG5CY9MlOKqMncLV046E2Gh6EPLmNmas+EWj0enD2VYBvlro86JvLIBwhnfz9Ge
         TtIXGp35N34xyJhb2Et1dycv5w26Vm/Dn7arOHtLcqIGl61hO9j9Xif9j6LVCUM3dnQB
         SdZJfNdEU4ZET6Og6J+PFwZbCyBzCVNtgXDeUQ94wMgP+aaLpIED+Oq8C1Y18NCeoCvr
         pe/g+VV7R/iCZ0GiiVmqOFDGD/bQJDqRuw+BbBAis8WX8slkimuxEGO73rwbLmkwnVTt
         7t1jHsFsUsSpPrHusZz2PZgG3AEkx0rrlBdQJx4FUvlooRYMQK0gJxLX0dbvtpBYJpAF
         5K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306166; x=1695910966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYFN9YS9lGoY3Drq+6yfHeUu5PUEzCkva/9j6XN0ZE4=;
        b=LtJPabIPLX0ulL+BcRRKl5mNsW6R835qwiYGMVuws/YSyASav7JrH44k+2j8RY8fs5
         TD8q1lPNQMYmuhUHuymojQjPDv/ueFSdiJCsLvX7X4WsO+PxU9/9Z8hcwZurvyM7xegw
         hsiCygl07hbZ2zoCdMa7vumIQzQwAcNWPQXCDuQQNnirp3narhQ1cDAIsOIJD65xogO6
         7H2nmRH76K0WG6ZvmJk5rDIkbuD7ZsFMIXiIlyQc2Ol/g+0NgWshmG1fmIvEEc+xFA6U
         qZtXr3GoTli96HCsqdsy3AUfTErshBtO96TSEqJK4R530twQrWFWWFv4cc8MTihSydqj
         eQJA==
X-Gm-Message-State: AOJu0Yxh2eSwoDVHaf/YN7isW4BxMF9cklnw9keLKLeqmxdMq7OvMsGy
	+wcRtyFlErd4LJR0ObFKbm0pEg==
X-Google-Smtp-Source: AGHT+IFu1F25pmyaAgzXYF1qsHUDXBwQ437AiaWnWjMjwmw80fpRWTPc2ECeCGljKdTfsMbdgIq1Yg==
X-Received: by 2002:a1c:ed08:0:b0:405:1bbd:aa9c with SMTP id l8-20020a1ced08000000b004051bbdaa9cmr5515593wmh.34.1695306166581;
        Thu, 21 Sep 2023 07:22:46 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:46 -0700 (PDT)
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
Subject: [v2 16/19] staging: iio: resolver: ad2s1210: rename fexcit attribute
Date: Thu, 21 Sep 2023 09:19:44 -0500
Message-Id: <20230921141947.57784-19-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921141947.57784-1-dlechner@baylibre.com>
References: <20230921141947.57784-1-dlechner@baylibre.com>
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

