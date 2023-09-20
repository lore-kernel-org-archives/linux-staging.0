Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A173E48A
	for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 17:03:22 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso46734f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695229401; x=1695834201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHyufdv37O6S8ZmknToS8IWvP33+rDz8dd7rQRoiFOI=;
        b=WvlE9jWBEj8/lTC+ZLdu4+I2bOVML8R0sN5+jJLZcjV5wtR1mMa7wGx7eE//Uq9WEa
         +pdrNCYX2p65l6AdtbUSXA1P8z+9u5PDmJliawNz34Ak02xmWYG/syssXUby6BxcWFbM
         FV7VUhgbU6gCYm+y0OpeZVts83bkf3x1xQAVCiSqghFSI2x5h0+XSaPHjpsJAZtXQ32E
         3e+mkBhzLslD3Pb2vMvDMiScukd3e1x6HOJoQqZUHZjbzYrQsNk5eJci+ZJNLQ8lZ2LF
         PMFqfFp0qP05S0iLZJDnFiU5Ar3f4XtvZW66wwYUJgJpK295QKTaydWgWex910rKPwPm
         6hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695229401; x=1695834201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHyufdv37O6S8ZmknToS8IWvP33+rDz8dd7rQRoiFOI=;
        b=meckPry+CEKNRBhUB8rZ2nsP07C0+QvcJp8mG2oRs0POBBLB3C6OCtbz8g6euoZaa6
         P81h5WRnHPxSo44jZvpxlq/L8KlaExFVEH0nd61eQNDarqHjxxhlwCvOir//usdxYkrO
         7dYHGifcJdjIrrHezdE8mynnRdZpsH6jwpl/NH+Ui5jD3hHRlxr2HjmqTtRbkf/8s82R
         LX9jnbbFFXcqcdavTIRG+T7m4H26wFmzfWwIqAm/OTGCnTiNTL04XQHXUVgN7bnBXwv0
         y/6V3RdCJbRJRUsPHIueiwfQu+Ps3lPC7zVRvpDw9j8ulLRUPqBCc6KEO5ofNooEvc+K
         D42Q==
X-Gm-Message-State: AOJu0YwiWslrvXmqrI72fVcKfEo5cZlmp9gtAUsU43khawuOrvOtVEnt
	ni6LxFyexPM+jUUEt11WJUA6Aw==
X-Google-Smtp-Source: AGHT+IEeDYURcssAVtKkHWXgELiscbELYLxLWtKeReqzbYPINC/mwrr6PKnp6JmuUytIY6KCPgVkdw==
X-Received: by 2002:a5d:4bc1:0:b0:319:7472:f0b6 with SMTP id l1-20020a5d4bc1000000b003197472f0b6mr3079743wrt.15.1695229401308;
        Wed, 20 Sep 2023 10:03:21 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id g10-20020adff3ca000000b003200c918c81sm11221089wrp.112.2023.09.20.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 10:03:21 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>
Subject: [PATCH 2/4] iio: sysfs: add IIO_DEVICE_ATTR_NAMED_RW macro
Date: Wed, 20 Sep 2023 12:02:51 -0500
Message-Id: <20230920170253.203395-3-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920170253.203395-1-dlechner@baylibre.com>
References: <20230920170253.203395-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a new IIO_DEVICE_ATTR_NAMED_RW to handle the case where
multiple attributes share a common implementation so the attribute
name and the function names need to be different.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 include/linux/iio/sysfs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/iio/sysfs.h b/include/linux/iio/sysfs.h
index de5bb125815c..ab20c5294e52 100644
--- a/include/linux/iio/sysfs.h
+++ b/include/linux/iio/sysfs.h
@@ -87,6 +87,10 @@ struct iio_const_attr {
 	struct iio_dev_attr iio_dev_attr_##_vname			\
 	= IIO_ATTR(_name, _mode, _show, _store, _addr)
 
+#define IIO_DEVICE_ATTR_NAMED_RW(_vname, _name, _addr)			\
+	struct iio_dev_attr iio_dev_attr_##_vname			\
+	= IIO_ATTR_RW(_name, _addr)
+
 #define IIO_CONST_ATTR(_name, _string)					\
 	struct iio_const_attr iio_const_attr_##_name			\
 	= { .string = _string,						\
-- 
2.34.1

