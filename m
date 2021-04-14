Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6C76D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id e7so24777114edu.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1FkcH1e9hYvIbJdpOMTWhzNlkcIJrWILNcigOFG2FmU=;
        b=Sk/WTkZAuHDpcGf+GHnX710BXbpHEmEDG9z7TRxU4ja70oWumGQRzzwotgrwU9kkZB
         15N79CN8qm6R+o3jO0oxofszdSNbHmicMrZoDiENtfPcnGJOY+sph34VVY/SIzmD5dhg
         fRhvGhxRXzAjFP4B7/6EUQDos9/ZJYApCpJELPNk7RhpBQSf6vOqwawfSperjvoKCyi+
         3iYPxd5ijBrw6D0o3d+UqvMHJupnoy7W3+Cyl2nQqTkiwBUcx1OT2IbUMG8gdVtdAlJW
         UfGisHayr6i5mb4ITHEKxHZUrUyflJNdGs77u+XzFOmvt3LigaWZ+Ys+nWHOKeK5e+RF
         aCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1FkcH1e9hYvIbJdpOMTWhzNlkcIJrWILNcigOFG2FmU=;
        b=RSqJuLBAfMzGqqVDw8ZxIZ/1BVdT0VFupmeOGbgdCn2GcKnE4M2wPgfv+pb55QPS2a
         ohggpFPhOjjG1LLsJauoNs1CEdInexhNLX66CUh9+6jgbMd96gTE+nNIbt/rK47RK2Hz
         35Jujw0VpGFlm2DL+DdYOejQ/qt5GRrqJNUZHC+Hj9yeMkXl594N3Y1LqZtfScO/+4md
         bN0DzYgBl71a/kftgb71AymKeRXQ9eIjLT03nARYEVir8j2qz2XLqrNvucunN2BtWzwA
         MJGn9T9QCIjKnyq8SQ4oPsq34pD0wRejMU8kIDMFMyPKL0JQBOmrtBm9DVrII7hHpO4h
         RAVw==
X-Gm-Message-State: AOAM530V+7CJpfmNsY3KmHTK55txsthcx+Ywfc2sAGx/3I5xMItIafNH
	FBh8/78t6fFZIdlBtNPaJ7dgQeQ0y+ov8g==
X-Google-Smtp-Source: ABdhPJxpJ9atcM+SLAo1W9rqLdmUTJu3dHHuCOAp1eh87GSq+5VbT6HivdOXrdeeqMNXHTYD8kaVuQ==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr209134edt.152.1618423916541;
        Wed, 14 Apr 2021 11:11:56 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:56 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 21/57] staging: iio: frequency: ad9834: Provide missing description for 'devid'
Date: Wed, 14 Apr 2021 19:10:53 +0100
Message-Id: <20210414181129.1628598-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also demote kernel-doc abuses

Fixes the following W=1 kernel build warning(s):

 drivers/staging/iio/frequency/ad9834.c:87: warning: Function parameter or member 'devid' not described in 'ad9834_state'
 drivers/staging/iio/frequency/ad9834.c:93: warning: cannot understand function prototype: 'enum ad9834_supported_device_ids '
 drivers/staging/iio/frequency/ad9834.c:320: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/iio/frequency/ad9834.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 60a3ae5587b90..94b131ef8a22c 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -58,6 +58,7 @@
  * @spi:		spi_device
  * @mclk:		external master clock
  * @control:		cached control word
+ * @devid:		device id
  * @xfer:		default spi transfer
  * @msg:		default spi message
  * @freq_xfer:		tuning word spi transfer
@@ -86,7 +87,7 @@ struct ad9834_state {
 	__be16				freq_data[2];
 };
 
-/**
+/*
  * ad9834_supported_device_ids:
  */
 
@@ -316,7 +317,7 @@ ssize_t ad9834_show_out1_wavetype_available(struct device *dev,
 static IIO_DEVICE_ATTR(out_altvoltage0_out1_wavetype_available, 0444,
 		       ad9834_show_out1_wavetype_available, NULL, 0);
 
-/**
+/*
  * see dds.h for further information
  */
 
-- 
2.27.0

