Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB29BA3B
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:22 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-401f68602a8so11294355e9.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307461; x=1695912261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDg1sZsypbtmVZl9501Jvjfjp7cqgNO2wWu9eDz+bAo=;
        b=QP0MHlHSIOySPj3pAf5phvxnVxafoUpd2ckC8QX5qd0XObgWGDcRTsjOA47RXGg6Qh
         6K2keFaamUmAm1nWvyrX84bBHmGEFqU0jfx5nfo8mY07etrId7FsecODPRy5qPkuPBkY
         1DCNNdO+qOZOvPfp8OSr5qRqAMBhNMtVs6/MxECTzie3dKE1k4PUn4LwBnFBXH93MyiL
         OD8RqLY+/3SogxXa2LCLm5iUE5c29hParIpwXNPZ0ueyAUCwlrx8s11lgeMO353bEI0e
         jisFYTpgCkaWvA7dhpceARWrq7V+FRuwqOfX9G78Irdlx/sZdzoM6cY64kcBzqF55PMh
         RG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307461; x=1695912261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDg1sZsypbtmVZl9501Jvjfjp7cqgNO2wWu9eDz+bAo=;
        b=HqQ68Yhr0UtFNwuszuKWRJuUd8maIpLES2NbKGcO0Ytc5l5c2f3rrzYzlDtLiPV2Gf
         PDBdQxJHsephT8il/Mr44dQ1vi6T2ZdrkWyVz0CqIeiG88rdaRQMecHJ4aC0C+yqRppY
         IlxOypJlkKfEyDu73GsbmEY7YiMVjCMUuNOTKoyGiQZrZtkVBFQ7McFWfpvICE2o8kiY
         DTqZv8a+FuwBm/v9i0pr5iQUPA4xKOEj/auAsS4LoyQDz04lNRnSi4rnFT1A48AixnIh
         H8DxdAbDadpE8zuqAZMtBi3lGQq/+fG8nWj1BA4Rbzqw7Ho5lAM1gKN7VzGBvG66EuNI
         GZQw==
X-Gm-Message-State: AOJu0YwjdjoOiaaEA5xETX5DTKHJRFn2Kl0Zx6h9ZOAUW6uBq6CbylNj
	/aQeOrE8d8P5rfuR+CXG94s83A==
X-Google-Smtp-Source: AGHT+IHTDD4zYuu6lV9x3Jl/iVplDBdwIifaK9LFet9fL2i2jXEx9floEa+zeO5CPOjwgUdMkMbH9g==
X-Received: by 2002:a05:600c:2245:b0:402:906:1e87 with SMTP id a5-20020a05600c224500b0040209061e87mr5026780wmm.31.1695307461363;
        Thu, 21 Sep 2023 07:44:21 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.20
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
Subject: [PATCH v2 10/19] staging: iio: resolver: ad2s1210: add debugfs reg access
Date: Thu, 21 Sep 2023 09:43:51 -0500
Message-Id: <20230921144400.62380-11-dlechner@baylibre.com>
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

This add an implementation of debugfs_reg_access for the AD2S1210
driver.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 3c81ee61b897..b99928394e3f 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -606,9 +606,29 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
 	return ret;
 }
 
+static int ad2s1210_debugfs_reg_access(struct iio_dev *indio_dev,
+				       unsigned int reg, unsigned int writeval,
+				       unsigned int *readval)
+{
+	struct ad2s1210_state *st = iio_priv(indio_dev);
+	int ret;
+
+	mutex_lock(&st->lock);
+
+	if (readval)
+		ret = regmap_read(st->regmap, reg, readval);
+	else
+		ret = regmap_write(st->regmap, reg, writeval);
+
+	mutex_unlock(&st->lock);
+
+	return ret;
+}
+
 static const struct iio_info ad2s1210_info = {
 	.read_raw = ad2s1210_read_raw,
 	.attrs = &ad2s1210_attribute_group,
+	.debugfs_reg_access = &ad2s1210_debugfs_reg_access,
 };
 
 static int ad2s1210_setup_clocks(struct ad2s1210_state *st)
-- 
2.34.1

