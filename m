Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F45ABA2
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzbW8FsW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso38966615e9.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 06:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701182418; x=1701787218; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaKrElE1AMJOvXqLWag42ZjIrLYDCFvrlaWvSZAKArw=;
        b=KzbW8FsWWW88o0oZ6v0PZ2FF7OMcfl5CWdl4kbRRxP2ucec+hPLZMFDcb7XFAoCdph
         crDaVI3hRqKPYY1273cpusuj+eBk0arv2oEQ7OIaW1RJS4GyZvo7L++D/qizH0NBr8iO
         I2/SMo3+FYF05898XvUhoGdvHO8vMnLsAK6DHT7o/bqduZNQwIISs1LfkuAjiGtMjz4+
         oRbv9mqzyNu4bzbHKuWKqPQ8JowvRGMVBvVEczFS7Qau9/PQRusSqTpU0png1DsVOcov
         0fgqeqHc9koj2QmGnqcKWl5VG6xHAP3OcjOtp26FHtaZWDayxUg92nIqSHkzjr3Xx9+3
         S8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182418; x=1701787218;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaKrElE1AMJOvXqLWag42ZjIrLYDCFvrlaWvSZAKArw=;
        b=X/pe3m363E/CfdYQc+IhNFA/bs/jfMqdzvs/1DUVahcztwjGCXSbIpAso/e8dY3jSV
         fIubkQwyraXpJubWaBmxO1WPrMJGTmxwWdJlNSkj560SOo63Svf2Xa2lLAiiwFGPn4uw
         UcmfufY9+4NwBVtOdOL0+HYZIoAl3pl7fKI/7NxCoQJpLWmd2TU2gFlP9WP7TWudoS3w
         Pc+T/CJrCDp4WyMBEAni/oDgxgs6a9u8wXUeSSSjTECvBExYGtq5tc5e9/TqG/BMkfFb
         y0bWPzLnKA751g1XZPk+G4JkFyxpD/ie83ItP8+PGM0e3jmoG/TUUPX58ZPdhvPSN7br
         OG0A==
X-Gm-Message-State: AOJu0YxC5Oe3q1TsAsjfyVAVjfMyEZ1pDHJwY+rQY54eijeD81Cd2cOE
	ECahPf1xzA5a7xYho+unv0ISeQ==
X-Google-Smtp-Source: AGHT+IEUXsu35JfaoTse6WpNi0aat3trZZEVzz9HHjmeo+pJm7QYeZQ28Vz4IccP7yCA63IgMU75YA==
X-Received: by 2002:a05:600c:4f82:b0:40b:2b42:a1c9 with SMTP id n2-20020a05600c4f8200b0040b2b42a1c9mr10704074wmq.23.1701182417945;
        Tue, 28 Nov 2023 06:40:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c450e00b0040b37f107c4sm16321352wmo.16.2023.11.28.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:40:17 -0800 (PST)
Date: Tue, 28 Nov 2023 17:40:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jack Zhu <jack.zhu@starfivetech.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: staging: starfive: camss: fix off by one in
 isp_enum_mbus_code()
Message-ID: <7d222638-2d19-466d-8dd4-9e1ceb1d46f3@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These > comparisons should be >=.  The formats->fmts[] array is either
a pointer to isp_formats_sink[] or isp_formats_source[] respectively.

Fixes: e57854628f58 ("media: staging: media: starfive: camss: Add ISP driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/starfive/camss/stf-isp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
index 893dbd8cddc8..98d61d71c31b 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -120,7 +120,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
 	const struct stf_isp_format_table *formats;
 
 	if (code->pad == STF_ISP_PAD_SINK) {
-		if (code->index > ARRAY_SIZE(isp_formats_sink))
+		if (code->index >= ARRAY_SIZE(isp_formats_sink))
 			return -EINVAL;
 
 		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
@@ -128,7 +128,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
 	} else {
 		struct v4l2_mbus_framefmt *sink_fmt;
 
-		if (code->index > ARRAY_SIZE(isp_formats_source))
+		if (code->index >= ARRAY_SIZE(isp_formats_source))
 			return -EINVAL;
 
 		sink_fmt = v4l2_subdev_state_get_format(state,
-- 
2.42.0

