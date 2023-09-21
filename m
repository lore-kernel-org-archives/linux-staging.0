Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E697BA37
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:42 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3214d4ecd39so959036f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306161; x=1695910961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDg1sZsypbtmVZl9501Jvjfjp7cqgNO2wWu9eDz+bAo=;
        b=qTPxdknzZ0eoDHEMqPv+4qLXP1u8r06GKbSbfh9ttrB5dfNdOo606urMGQran+cggk
         YwKtD8uKT/J8FR5mjIfGcdavWN9tn5smOWf734z4zExcn9Pz5ccjSVT+68e1yaycq08q
         i7HkStfW1Brs8NlwpLAt7ML8refJbzc9TDlktJYic32k4HBRhpwll08gLkxR7oNhdgKQ
         jpTIlOFYK14xlkSI+xddAgi8lsxoi3OJyAAXaQJaRKNU88OpartoVFpeaphoQPi8l7sa
         /FoNrLii4R6e9zILoPYyuONK4jkUQzTqEDjd8VNkDe/SkfLjN7zE+Csj/PERju5Vfmyi
         sFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306161; x=1695910961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDg1sZsypbtmVZl9501Jvjfjp7cqgNO2wWu9eDz+bAo=;
        b=ZopsOIBAz0BBhZ5JZjOqEAQIHuTYIHLQJSGpFE4dCC07x94IO8z2RtxIlCU1gYDHXe
         Hs5i7Jxl+ZRylh54hwHIOBeCQ8O0A3rZp+nLGIVH5QA1ZZcQWn3Q9FsawDSrj/LPUyhl
         j95brfyXytXS/t0rZXxzJRLbW6cqX76koFEVMrqHmMpXzew9nvp904lr5iXtMQfwNmS8
         nSQxRVgHdXXGNSil0gY45bo3gsohBeXSHsbKjc504wiz8P6VoJbpgPLq0nglDQXqC3kp
         i2s9MyD6utXBibep+Wnjb++sAebHc8RCHKbka6ifsgpLzWR9KAZz/TvFR3k+2UoukIjw
         9CaA==
X-Gm-Message-State: AOJu0YzSj4++7ZxIrvG2UDpRBfpfLZ304GW5HFTmuOx1gvrbVdSb1Of/
	vWT0ZfFAmrSRQZBqEwHK5XFYvA==
X-Google-Smtp-Source: AGHT+IGgYCYV4RIyluC952QS15xlxGsYiHuw3JJvkpeLNvHhq4UFPDC/C6dReCQO1m30NxXKsPt5kw==
X-Received: by 2002:a5d:4c85:0:b0:31f:a259:733 with SMTP id z5-20020a5d4c85000000b0031fa2590733mr5275304wrs.20.1695306161138;
        Thu, 21 Sep 2023 07:22:41 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:40 -0700 (PDT)
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
Subject: [v2 10/19] staging: iio: resolver: ad2s1210: add debugfs reg access
Date: Thu, 21 Sep 2023 09:19:38 -0500
Message-Id: <20230921141947.57784-13-dlechner@baylibre.com>
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

