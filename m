Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF401993AF
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551236; cv=none; b=b++svtR6ruy7pDxRd9YsDovMaUwkCBHzKSDF/aGMpIYR+XE0HvBNDlePFHu8y469qZfdafEoerfjUbYqjqy8XEaQeXnSP8OGAmy6zvhdr4hd+xG1eC0R+EJI3pbUDTGMQo03ghVfagQpTcQ4/+8RBZ+5dKElTcFPCEzQduvxcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551236; c=relaxed/simple;
	bh=F14N6L/7XjC8oRmavmnQiXfhM7cavcf0lfyqWY/R5js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AL3G4+Yj5dvRAoMxVXwWDosFJeXlZ+WD4DBAwru6eG3EhqPvGG7agMNPtZYg1M3xOmlw3RobEvm031+5rYaj/YykJ783paCl+LGC2d5mgmCfXT+SGTFyvnhcNAbwnkJPEMLzqFF13dOHJaiIkz6Kil+tREM51wHQu2j8MGDcyLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FqNOArvL; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FqNOArvL"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1d7bc07b7so360412885a.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551233; x=1724156033; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrZdtpz/qyn21riVVQ3i7W1bl9boREamJ7f5SQNbyMY=;
        b=FqNOArvLCyXeH1yErNAgivYb/+rWFOEuvVIcaFq3Y3VykaS2oVllLLzUNHr9SDSCMt
         dnynzDYLC/9Wz42CYSgwKVYAkcbAumxTckPfjOahTedyAD57FRHWG0seJacR/aXKBpDj
         O6wHBYZaKqgypx00nHdcMTKoJAryc6kd1VvFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551233; x=1724156033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrZdtpz/qyn21riVVQ3i7W1bl9boREamJ7f5SQNbyMY=;
        b=CBSEPEZwj0UXk9b80lpemz17Dq7Y738GjFu5z0SvakPPtjtL46KQ4sNDb2lK7p59vX
         hQtCc4lF4+q89hBswfrkcj7fqLeBpVacQc0C40+aATXRyWdg/SrgbQNsRQunXgP/AQKq
         Q1tsOLZBxuwKTgcX5Otx+hy6FKTRXBVWtB3Ahf3/VUo+2xZG0WPvz3iSZlvHAe04QBA9
         pkG6UosPGlD8QoCGryfG3DiYQzyXdLDIzCtN4QyKeJha+jfdb6chjgYHzVuu6ELPu28K
         GMQbH9JzfjuXGVdER0xKUIUqd5u0i6+C5w02bzfVH5SRtoowapZ+KSjuSc5ZlbaPYaB1
         pegQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1EbKw+DtECQ5zGWlxcPPqPEZIVYubzsYHwNXk6mP35KRhp/e+66mi7P+z7zFl6rvjgXbW4ThIIX5KOK50@lists.linux.dev
X-Gm-Message-State: AOJu0YxRMRoOsPdzltAF4EVcoJiNUxA0+/l/MJKLV4zgINXEW0i2e5fe
	WqdLIwuVjhtMHknAMuAlo2eGWdchCkJt6nCAkc8ePTkWscMCu+yUpxHqe8ZD9A==
X-Google-Smtp-Source: AGHT+IFw/fFUPyShPG2/Ze40YU4KamjQKDfYMrBvg1bfZRKNcTmejJtMfWfYfhDU5SD5ItOdKzwbXQ==
X-Received: by 2002:a05:620a:4043:b0:79f:515:e211 with SMTP id af79cd13be357-7a4e15bdc69mr410951685a.46.1723551233113;
        Tue, 13 Aug 2024 05:13:53 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:50 +0000
Subject: [PATCH 3/6] media: i2c: s5c73m3: Move clk_prepare to its own
 function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-smatch-clock-v1-3-664c84295b1c@chromium.org>
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
2.46.0.76.ge559c4bf1a-goog

