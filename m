Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555C199238
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551233; cv=none; b=suF8uHEXngUHjICHKp9sSp92XF58oIwVb3Fc5ayBIFSZEJ3++rd4wfKkj02ecoKFlex/daiLKcsG22iNlOndEhyOD+QUvmUNcyGmCF/uasFtpdHEGtC30Nh/kLlYwzOtK+HYJMk6oqbJrYiTx1ChEhhkoQd/1e3v2YFtp7VMtnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551233; c=relaxed/simple;
	bh=g+rNwochslFeeyi6Ofw/XN2e0QyEqWoJrguFWPehPrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHGuHLwHkYjyVMS7k9+PFCSlEU1MPRUIS4V/qGT9Z3ZehYzjktht/+Fd5gVP8nEsJlPtwiv3/5oeMmxg/gT71oJ3fYn27wLxgUHjox7xrjiFkOGjcLL2IOVrEM4heWgsJ65j0Kb7fKb98S8FxVip/f/yDXmZHP1HTy6fGmwfjGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UFFmyIwE; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UFFmyIwE"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1d066a5daso340488085a.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551231; x=1724156031; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2YaJNxhLs5F8lLYTx7H4r6rahb3C2THbGnEdQxh/xA=;
        b=UFFmyIwEqCNz4Wk8bvaDMoPS1Ef+ckHxflnGK5u/7wopsyWQguc+pGrkPSry4aBYhS
         OcQ+jZhzreuOd7QxzfRTU0PvUskguMompg8edr3DQ7skrdM0/p6lgniwpazD2+lpW7HC
         kC5emmDHj+HAuNwMdrxRO1Mfo5Az1jYrkmpdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551231; x=1724156031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2YaJNxhLs5F8lLYTx7H4r6rahb3C2THbGnEdQxh/xA=;
        b=YmhXVhHhkNIYIjsfpuhN2GCTnAErVvJns6Sd0CLkKFguMTeQO90XLBKXxf8+Zriqr2
         E0QFhk0VvCX6jRTNYzKfECQUoHjwUt3jTbCpJmZ/ACytO4EtWLDTPyIBsAYnhBdFqBc/
         0C0bbW2dZKyRswM/DYrv4ESUjLMlQcjN7iOdNoifzKvPTiWfVkqSWhqio9w0ELMU17jN
         x2B78WliUPhJLn2F6pCyXA0Jo7/oZIlQ3RVUh22V2dKk5tkcDUXQxUNduJXNaKctXWmF
         SMuhfVZfjx01xGDSsD34rp/E/xSx8NrDeZQgXNIql2V1g5hr00oFkTPWUQy/D6OP/blw
         8V/A==
X-Forwarded-Encrypted: i=1; AJvYcCVe+r1QL/XDSNCUfK/3PtJxmksnGYRZSPcW4DDiffbeYZ1a6qWyUTHqnwyWLchjeXbPMs7RJsO9jepToafBXeJLmCwm7TD1p6zXUdJL+Q==
X-Gm-Message-State: AOJu0YwTJMF9AMGyWhUa6RONNNaKq15A//FeuOSx2UiZFs05nCJZSP2e
	+2FZuCnzlslTvv6GwkPE92oyzZmB2+s0qhtXnoVaYcMVE6//HwDElanSEZBkSw==
X-Google-Smtp-Source: AGHT+IEbPwywblqg1PHmJ6WOVqLAFdQNUuhFh7OmJ87lW/f5GlJN4YVEnCjKh12Gxxs2z0IijZihGw==
X-Received: by 2002:a05:620a:4109:b0:7a1:e2e0:b3c9 with SMTP id af79cd13be357-7a4e151ba74mr391481985a.24.1723551230715;
        Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:48 +0000
Subject: [PATCH 1/6] media: ar0521: Refactor ar0521_power_off()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org>
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

Factor out all the power off logic, except the clk_disable_unprepare(),
to a new function __ar0521_power_off().

This allows ar0521_power_on() to explicitly clean-out the clock during
the error-path.

The following smatch warning is fixed:
drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ar0521.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 09331cf95c62..2c528db31ba6 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -835,7 +835,7 @@ static const struct initial_reg {
 	     be(0x0707)), /* 3F44: couple k factor 2 */
 };
 
-static int ar0521_power_off(struct device *dev)
+static void __ar0521_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
@@ -850,6 +850,16 @@ static int ar0521_power_off(struct device *dev)
 		if (sensor->supplies[i])
 			regulator_disable(sensor->supplies[i]);
 	}
+}
+
+static int ar0521_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ar0521_dev *sensor = to_ar0521_dev(sd);
+
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
+
 	return 0;
 }
 
@@ -908,7 +918,8 @@ static int ar0521_power_on(struct device *dev)
 
 	return 0;
 off:
-	ar0521_power_off(dev);
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog

