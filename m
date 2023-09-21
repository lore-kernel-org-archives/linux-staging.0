Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D27BA2F
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:23 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so1062737f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307462; x=1695912262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9WVKxDU/WCTxqQ52/M5ua8wasfSRRcZpI1eeblkSC8=;
        b=11VEOKG1YXrVfLj/xUQO/OJv9OxCDV4EuIl2wmo+mHwWXDzy41vabeuoy0eA/b/GtP
         PxPGhx9YdtBRn32LNLgb8ORF7b45zDLudOG+fgiuknemCAI0XT0vXRCaQPjUtoA6rIgR
         uxXOkHzU+rM5GK+u5vS/whLWM9GZtvafVzKtgnIlpURnSocGeGdV1F3eWSmO01ZlxPpX
         rhl69pmayIS/4Ow4TToaGUqc7mTLoA4D1+K3tAd00njMGEjYM4NZKtKgStzMCCpMQgA5
         IjTx1pPPXqWZgOwHs5qPe5Vi7usZdR8PCI+X4vnMASvnPjhZWTHwpx+dg4/pxCyscNsT
         k5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307462; x=1695912262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9WVKxDU/WCTxqQ52/M5ua8wasfSRRcZpI1eeblkSC8=;
        b=GA4ipeHsBk47vVIxMid2sqz/8oRn6rQ8Aogm1eJoSR1ZNJPhsNNLKaqbMDt5PlP58M
         qDKZSvpes/WoGLZtRmiB+Zv0fscWusXQCs2Pnw6erOTaogHSmHVoNJKAM97NNu4Otabe
         LIr2aV0TsSioYWERU+1Nc4y8FyIJcN17SolpH87k9GuS9IWQjuvDPCwXPEMD3KdJhnq4
         qWva660xVvh79bxIzOG/Isx8vmQ3Xdr6lEfn1uhz0mYYZn5e5Uz8ZFyp31/MP4Kj5kwY
         OyIndUq9unRKyCUCRAhc/QX1VB+xC05/YCX4KU1ftELahsSQKnK55c9OIglk5BPF6rgd
         Vs6A==
X-Gm-Message-State: AOJu0Ywf2906sXEQfLjMYniy3e7X3TRS9f3q+wY3G7nlwsU2hg4itp8r
	h+Qbd3Smz1zjZ4jCX0/c/QLpmg==
X-Google-Smtp-Source: AGHT+IE9ZEE6qW3Uh7F/2SHDgzRpOaJowWC7a1ZsGgdxWu4OvSFD38FqiRfJikCDKaiQeM4iFx0WXA==
X-Received: by 2002:a5d:500d:0:b0:317:58e4:e941 with SMTP id e13-20020a5d500d000000b0031758e4e941mr5405435wrt.33.1695307462223;
        Thu, 21 Sep 2023 07:44:22 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:21 -0700 (PDT)
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
Subject: [PATCH v2 11/19] staging: iio: resolver: ad2s1210: remove config attribute
Date: Thu, 21 Sep 2023 09:43:52 -0500
Message-Id: <20230921144400.62380-12-dlechner@baylibre.com>
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

This removes the config register sysfs attribute.

Writing to the config register directly can be dangerous and userspace
should not need to have to know the register layout. This register
can still be accessed though debugfs if needed.

We can add new attributes to set specific flags in the config register
in the future if needed (e.g. `enable_hysterisis` and
`phase_lock_range`).

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 47 -------------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index b99928394e3f..223cc4702188 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -269,50 +269,6 @@ static ssize_t ad2s1210_store_fexcit(struct device *dev,
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
@@ -519,8 +475,6 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 
 static IIO_DEVICE_ATTR(fexcit, 0644,
 		       ad2s1210_show_fexcit,	ad2s1210_store_fexcit, 0);
-static IIO_DEVICE_ATTR(control, 0644,
-		       ad2s1210_show_control, ad2s1210_store_control, 0);
 static IIO_DEVICE_ATTR(bits, 0644,
 		       ad2s1210_show_resolution, ad2s1210_store_resolution, 0);
 static IIO_DEVICE_ATTR(fault, 0644,
@@ -566,7 +520,6 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 
 static struct attribute *ad2s1210_attributes[] = {
 	&iio_dev_attr_fexcit.dev_attr.attr,
-	&iio_dev_attr_control.dev_attr.attr,
 	&iio_dev_attr_bits.dev_attr.attr,
 	&iio_dev_attr_fault.dev_attr.attr,
 	&iio_dev_attr_los_thrd.dev_attr.attr,
-- 
2.34.1

