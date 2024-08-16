Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A851B5818
	for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811528; cv=none; b=lK5fGCFmfAysTK1lwyZhkb6H5CDkLgZny6AMs6qySYsjekzxYceugAylnvMfbF4ZzXwdXh0w+2bEoKz7jGKdL66PHIsVcgF5oh0YfzPmdpeyIZc2jhQVqMu2CikLlNQYLpYN95aP/cpHWn3BAIYNFyIrzUjyL309X+MErS0PX+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811528; c=relaxed/simple;
	bh=t0EHg6F/f2g7yIhpSYl+j42nBCmMMjiSjxuqYf5Mqqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMcw+QUUKC9KIez0zG/zlrCPVcATJcmztnsUujYWME/d9V6WbOIhn97lZWvo7GtcsfzZ0q3MWrFivfTf0R3jxoWZSvjOLL2Oy1DATn1gjeXJIasm00Uj72yu7Kf97QzmhowSqtDo9AXCffU7NPhNIx4xf4XlNqu/u8CSxIyJyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZsvRbMv2; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZsvRbMv2"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7093997dffdso780322a34.2
        for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811525; x=1724416325; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTE0ZAwpLEek+mC97zOMxZoDXTrbmisRlZ9024oJ1x4=;
        b=ZsvRbMv2YabEdZU7aZHulqGEwNejeyPXX+JeQxdnkYOA3M+5TpIsXETt5TvO1z1Wop
         3gXx5YxgqAUg8CFzxtSxja2vMFDFUleBKJBDN8uXw4aJObRzycxNipdWaWksy7wo3OUp
         ejGNJNV49+Ru8US8dM9JMD4f3yoePmLyyMgpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811525; x=1724416325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTE0ZAwpLEek+mC97zOMxZoDXTrbmisRlZ9024oJ1x4=;
        b=cJdyWdoYRPanOoBh0Pm1ueLI5fm+2/fmEhHrXDPkntGfEgD20li6sixRABcVHHMf1D
         IfWTX0WJuE3EwTed70w8zz5RgTcWnMP2UR5wnI7SbKOpAAeb9PPA8Tik9oSKj0RqUbRm
         vweSyrXihsY4GM2lo03zZPga9mTUivsi6zcWfycdFJI3dO8Ti0uqMfaHXTi3D0l8NhQ7
         sR2VmrzSppJvW7+PyFgtGOFdEiQPdJDi4RfdzDtOEDyj0WRpwSSMduQQSGaVrDfAlcX0
         Q4ur6au7ohXEAHkpstY6NKDBx+Sb4F79GSbeVIY0i6rNaKQkAQTg3Bcoq4JmwexDQEhl
         eq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXekivmzjzFRLAKwcAb2V2N3OGAedHE/lqMpy2FsrgbOCfTBdqySIxSpp6Lu9OMQChkmaxfnGX/+pDERHla@lists.linux.dev
X-Gm-Message-State: AOJu0Yyizb16FKTct2jMR5xzm8c/NfXGpaGOxpc1uPMgMZVImtgWer/o
	VPQHU6Rei/OCsUR4SXAFybLbI7/nYJdFvS6LIQiSxzZ+pt1StZexW5JQMCIWrw==
X-Google-Smtp-Source: AGHT+IF/lV0FO6kyi+dWBfhad0hlEJtndvHJ5Sx3xQGXBIEu/XLpM3FeOaUjff8fbn0cH1v4QPeYnA==
X-Received: by 2002:a05:6830:3109:b0:709:3462:a4b6 with SMTP id 46e09a7af769-70cac84216fmr2835025a34.9.1723811525644;
        Fri, 16 Aug 2024 05:32:05 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:01 +0000
Subject: [PATCH v2 3/6] media: i2c: s5c73m3: Move clk_prepare to its own
 function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-3-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Smatch is very confused by a clk_prepare_enable() being called in an
error-path. Fix this warning by moving the clk_prepare_enable() to its
own function.

drivers/media/i2c/s5c73m3/s5c73m3-core.c:1425 __s5c73m3_power_off() warn: 'state->clock' from clk_prepare_enable() not released on lines: 1425.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index e89e888f028e..7716dfe2b8c9 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1392,6 +1392,16 @@ static int __s5c73m3_power_on(struct s5c73m3 *state)
 	return ret;
 }
 
+/*
+ * This function has been created just to avoid a smatch warning,
+ * please do not merge into __s5c73m3_power_off() until you have
+ * confirmed that it does not introduce a new warning.
+ */
+static void s5c73m3_enable_clk(struct s5c73m3 *state)
+{
+	clk_prepare_enable(state->clock);
+}
+
 static int __s5c73m3_power_off(struct s5c73m3 *state)
 {
 	int i, ret;
@@ -1421,7 +1431,8 @@ static int __s5c73m3_power_off(struct s5c73m3 *state)
 				 state->supplies[i].supply, r);
 	}
 
-	clk_prepare_enable(state->clock);
+	s5c73m3_enable_clk(state);
+
 	return ret;
 }
 

-- 
2.46.0.184.g6999bdac58-goog

