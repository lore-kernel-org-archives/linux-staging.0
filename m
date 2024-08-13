Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDBE19923A
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 12:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551234; cv=none; b=u05etDCWADWRIrg9WREUsTgujYBqWUsgb/TzHonnVJLA2gtltuW7qqftPIkK1swrTgnEmAxUk2QRkLGGc6lfSNHEBSYlcUJbSSH04W64qbQkqZ5GJl3pxLcWgy5SE7nDURsA4D+cK46YP2AX8+405rkAE9EdTpbzqv0iYKCznjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551234; c=relaxed/simple;
	bh=m5XHSgRo8F8WjUA+xwLRz6jjxaEE3qje9U5hDygSCPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvdIpFfLUZ72lHrH4yjf0i2z8FM4FvF69bfORQoC9zsaRfCb5sSRHfLKVgqWd7a6xxEWaPJFRV231inW9CF9yevLQ0QA9q9vjjRNkT/85te7LOdvVCDAGiCGOT3TV7ktuuQPe0CeQ2QgMzP7E3ZTpIw+LpO352/7+IsMMqILByE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dLn/j6bl; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dLn/j6bl"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a3375015f8so377381485a.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551231; x=1724156031; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NN4I3pMa1z6u3JhFybH/YMr+WwEfsG16l3i3ACZ6OI=;
        b=dLn/j6bl3AFaSkv79N6YqUTJ3x35s9ivpgB763qRhPOkTjWPwqee7e7HOUtyNiwxFQ
         2OtLPVogzYZUJcq0gqZRmu6yPccqe6tJVqhlPsZQLVS9y0jG+cdMSVJ0YGzUM8RL6xMN
         1eSj3VAUNQ1Ya7gpgxUfjMBIzA1ZYnS2w01qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551231; x=1724156031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NN4I3pMa1z6u3JhFybH/YMr+WwEfsG16l3i3ACZ6OI=;
        b=ZWww5sg+paHgSltJE9Z8cp6/FbvbAt94sqIYr2AchnvFu+FdJEhm0TAnXhq3xZvvwR
         P2OXb8sWqJV6r/4t0CsRd1K9GzPvPE8b7iy6/PoaQbnyXnyGCioCwzNLVsjj6XbZ2Kfs
         0NkQVH2hvKeGP0rzxZ4k5ibFUM6rCofAdPrIbhwy2ly1KU/W6hD16myO1zOldoqOzSFy
         VRRfTo8MAUjgEcVW1wfigaIW3POsevHAMD3gMtwt4iC9H+mBpzeRugZWfYLIRmBiQ7/g
         5dRdYMPUYJill3BPx67rumLvCYiDjV2/7KOmGXDOdUNHWfN55wfVfiLpU+Sfo49mtWMp
         cfNg==
X-Forwarded-Encrypted: i=1; AJvYcCUNe9woQu0E49RQYE7gNcnsJ0TFPOcFwJmOVLQcywXlxeNngT7K8HuE5FJA9dBhA36X8r/jZHefd75dVdHwJ9szDk3qRQdm52xK0vNC8Q==
X-Gm-Message-State: AOJu0Yw9+kunCdA6HATaW1vrHUnij7EZoubBwDywoO/2890xJUn/AAXM
	TYxVDaefS1Hz10Br1ZAVY5WoFK4CP+BIfpsW/al+uXf9UAifgoSFOCx53U+wTw==
X-Google-Smtp-Source: AGHT+IEbzzCLxiIWDetpY/N6kglqi3rroSN+bG6y6yQxlctkjM/b9mCaiLCXSWS8MVpF1YKtj23MkQ==
X-Received: by 2002:a05:620a:4451:b0:79d:76e5:be76 with SMTP id af79cd13be357-7a4e15afa64mr377756785a.41.1723551231504;
        Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:49 +0000
Subject: [PATCH 2/6] media: i2c: ov5645: Refactor ov5645_set_power_off()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-smatch-clock-v1-2-664c84295b1c@chromium.org>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
In-Reply-To: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
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

Factor out all the power off logic, except clk_disable_unprepare(), to a
new function __ov5645_set_power_off().

This allows ov5645_set_power_on() to excplicitly clean-out the clock
during the error-path.

The following smatch warning is fixed:
drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5645.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 6c2d221f6973..0c32bd2940ec 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -635,7 +635,7 @@ static int ov5645_set_register_array(struct ov5645 *ov5645,
 	return 0;
 }
 
-static int ov5645_set_power_off(struct device *dev)
+static void __ov5645_set_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5645 *ov5645 = to_ov5645(sd);
@@ -643,8 +643,16 @@ static int ov5645_set_power_off(struct device *dev)
 	ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x58);
 	gpiod_set_value_cansleep(ov5645->rst_gpio, 1);
 	gpiod_set_value_cansleep(ov5645->enable_gpio, 0);
-	clk_disable_unprepare(ov5645->xclk);
 	regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
+}
+
+static int ov5645_set_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov5645 *ov5645 = to_ov5645(sd);
+
+	__ov5645_set_power_off(dev);
+	clk_disable_unprepare(ov5645->xclk);
 
 	return 0;
 }
@@ -686,7 +694,8 @@ static int ov5645_set_power_on(struct device *dev)
 	return 0;
 
 exit:
-	ov5645_set_power_off(dev);
+	__ov5645_set_power_off(dev);
+	clk_disable_unprepare(ov5645->xclk);
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog

