Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D111B1B86F4
	for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811529; cv=none; b=biPT7qLGzDhAP9DMUfxx8SnFF1P0xnOv/no0gGOL8Clw+rAGi/67YNWUHgrN5pFZVeVUX55z18OzCI5cC45MzqBx/kXXkmc018S6LV4ZrgUQFRd2uu+pR/W4li9cL+7m73oG/UKmlEyQGj6x+mrqNEIpjmydzcV5PG2JAGsi9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811529; c=relaxed/simple;
	bh=/us7e90fGibDZ7iRi3+d7f5fxC4Ub6dpRW24VMBvk0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSFx+9tb+4JBJHP1SfgwBCDTjrIUEXErejOpuLbEqhTkw/Nb3ccXROcuTFcwaUqUUkqrAIAm/lXkRJX4Sb/Txk/RL5IhESEzL2pXP2IRX1z/LppOGefU66Pz1F577SJPzGCnu42ErrU0YAFdwEN7Y26ivPgmWWLNs8oFN1uF28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V2wQpqIW; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V2wQpqIW"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6bf66fe9d8bso9565526d6.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811527; x=1724416327; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnNFu46JmywYP9gLg0BBlkiX4LJAIV8Vvr47+Nzo0m8=;
        b=V2wQpqIWR36WijpHHeaDmCzIsfRwBhTTGnum0gS6xiWDyPKmnCczVjzROK13y4eISp
         GdYtJO6fQC74KOQTLbhiZhkhmEFz0Yp7Pg/Ru1ZzBc7MtGR6x1naXEhk6EYZ4hTCaTFF
         t6g/0hhmNnZdahZI3vSPg9y9z15wFSv5SWENA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811527; x=1724416327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnNFu46JmywYP9gLg0BBlkiX4LJAIV8Vvr47+Nzo0m8=;
        b=GFh88s662KDlFdzoBLoZBTeuUKC8lVCJ+xA+CviUGLCeEHtnMjfxl8Ax2MjfA4RnWD
         DggYfP0++9Bo6z1VfWRU+WLoXhb45dBN0m+OSw+ByXw7JX568lqU8tvshH2dujs/Ixzs
         c2mxnOcDIfsohUWgXR21nBjRE8R250v3o1N603FiL10Lg6WmdsAsWMwFV+35qrwVFYvH
         efgpER2ryRFFE4t1qHcmKtlWhyRn2/5AnDfaDSq+ZS6flut5yWsL/4Z66Yc2icEGyL30
         v3NQH2fDN0N0VJo6qABmVjjCGqENEy85hK1cq2EmEAYPHn5FG4cgs0AcAkPPTyODioa/
         UL3w==
X-Forwarded-Encrypted: i=1; AJvYcCUEdkNnxSkb7bJOnQfZ1N+JOQyFXpfBaoFD33V4cg3PWLgjhEefvKJpNGUARHJMrkptMY1wsLpNwile1aMc74Vx9N0/jG7lPe4kvtVXig==
X-Gm-Message-State: AOJu0YxidpXopHhd+0URwSvoFZZYotGNzyQTv8IQnC/WnL6aueJepqd2
	+Vhg2o6UfaopppRUuiyuX/MviLRwkD0N9XpDyktgoZGuL45yTWNPAJW8DxZ+MQ==
X-Google-Smtp-Source: AGHT+IEXSYQZCNIKPB9LFR6rX4AtZ6JNPVrFndATYre1U0wDC52xZRkYWs1UJ+Wy8jMyb2SytEJSUQ==
X-Received: by 2002:a05:6214:a67:b0:6bf:7f5b:1d3 with SMTP id 6a1803df08f44-6bf7f5b0255mr17407566d6.16.1723811526538;
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:02 +0000
Subject: [PATCH v2 4/6] media: tc358746: Move clk_prepare to its own
 function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-4-c63105db07e8@chromium.org>
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

drivers/media/i2c/tc358746.c:1631 tc358746_suspend() warn: 'tc358746->refclk' from clk_prepare_enable() not released on lines: 1631.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index edf79107adc5..389582420ba7 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1616,6 +1616,16 @@ static void tc358746_remove(struct i2c_client *client)
 	pm_runtime_dont_use_autosuspend(sd->dev);
 }
 
+/*
+ * This function has been created just to avoid a smatch warning,
+ * please do not merge it into tc358746_suspend until you have
+ * confirmed that it does not introduce a new warning.
+ */
+static void tc358746_clk_enable(struct tc358746 *tc358746)
+{
+	clk_prepare_enable(tc358746->refclk);
+}
+
 static int tc358746_suspend(struct device *dev)
 {
 	struct tc358746 *tc358746 = dev_get_drvdata(dev);
@@ -1626,7 +1636,7 @@ static int tc358746_suspend(struct device *dev)
 	err = regulator_bulk_disable(ARRAY_SIZE(tc358746_supplies),
 				     tc358746->supplies);
 	if (err)
-		clk_prepare_enable(tc358746->refclk);
+		tc358746_clk_enable(tc358746);
 
 	return err;
 }

-- 
2.46.0.184.g6999bdac58-goog

