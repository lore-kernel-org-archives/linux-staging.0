Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F612E4F
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 07:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709535894; cv=none; b=dae5I/Y97D8FDutSWyXJCnxNuJJL1VGaSH5GODSxN/yQ5QQhfzBgL+EQ4YnsB4j078hn/siMgH9sxzKbfqUfaPkt61FQrz6eHIyhgyh4aew1fC6lkbqxjzuwdDFPmGtWxX/z5F4ocSlmQYkdjFWo9EgQ7PgGVuEmhAtxFn4vCbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709535894; c=relaxed/simple;
	bh=fOzF9T+7+v6nbIr6JpI2D3fB/kcAd613CX/CdSkUuJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGbFkzZgQWiGsmgiO9TlJ7foBgiHACSERLmAD0L6l7aDVu7xMgYDBTkqeh2zZ1It6M6uEdrJzBYLnQHNebFlSSt8+tJOrT+d7pKTBFXR8bNU9Ehk4UqPNl5VUU/J7LmkItCrRO1lMpdJslMn6G3WFgiDv6NGP1xazAEmxHrh1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DOtW5MuQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DOtW5MuQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33d38c9ca5bso1987197f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 23:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709535891; x=1710140691; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RTu2QOOVQbOweB1LGR/BRbdQUT3nXvJVjgo89rA8a4=;
        b=DOtW5MuQagVGBfYGMYkH7ERWVtK0ecDLq2XWTv4Zcmz4FRVJpZfllJk5aCwFVOUrJ0
         nevc+AxzOpkbiWs8m1KbJ6IQ7b5z7ortFPTX+bymH8zAX0r4qVQPGbtEdGX5Cm9SYtzl
         sKEz+V4Yb4glU8jU7DonYxubSMdRx8bbELhtZPaTbPwkDd7n2PqlN4P0dL9TAlXJz1Bs
         q6NOD29xYJm0i8y+B65FD00GgSyXjd+6CYngj2GSL0Be9J0TZRivsQ0UEpje4iOUmuAx
         E7rPQ+x0d7C1OZttXRzQ+oPrFDHb5brLxpm0DdfoiIZZ1+PLkpe4HckZYwUyGCnQKS8U
         FWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709535891; x=1710140691;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RTu2QOOVQbOweB1LGR/BRbdQUT3nXvJVjgo89rA8a4=;
        b=QWmO6+y3mNIFeJbh9uDCGCFNYw6ymSx7UeGV2Cr+E0oJ736aSjTkA0qT8YoX6o95v8
         HEaA4hoB3nPoqrZ3rZFdrmylshxxTqByHjHKcGAplvr1o50Hdqd/79Pty0D7uSWrp5H1
         s8zgkOQV5h1wpRYTh2xxJA9tjouFXi0hKPWNBZRRLxnYz+j7Zb3QtJGDH9iuS4/KbmGW
         om87q8rt6fW6wuav++kxo8IhbSGueV8wD/XXoVxAXGAsB5YDu26Re5UrCNN5VplDGBAV
         g3MTadE4TXxC9cS8p49/wqysdNIZxULkA37o9JW5yrStPsgZUIbgKpXxv4OYMbySC05l
         3cjA==
X-Forwarded-Encrypted: i=1; AJvYcCVMxBOZp7Hsl3dl/XGjag9asGmcBiaIXcRjw+HXiuDtoQlbBwsXzDoEt1LBzxSdBjiZoMTJ6CMXdQ+4bd0WdB35zk0W23pTJL+tkfD4Rw==
X-Gm-Message-State: AOJu0YwX6Qr1IjJFf9Rp14cPZI/M3EugmyLfOREwAWzAGq5K3Uz7x2cA
	jjVbce7c12741gKHF6MELwzh/MDTepXdwWzLv9n9oX6IzImR31DM3BLryBMSOqY=
X-Google-Smtp-Source: AGHT+IFc4xUICRVVStYlfPV57gzFOOaMSvfieW4xk8n3smggrfWI5KpXmkdHe/qcd3sZ3tLX4YTRXQ==
X-Received: by 2002:adf:9c8b:0:b0:33d:47d6:c159 with SMTP id d11-20020adf9c8b000000b0033d47d6c159mr5733432wre.12.1709535891433;
        Sun, 03 Mar 2024 23:04:51 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r18-20020adfca92000000b0033dcc0d1399sm11375456wrh.25.2024.03.03.23.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 23:04:51 -0800 (PST)
Date: Mon, 4 Mar 2024 10:04:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: greybus: fix get_channel_from_mode() failure path
Message-ID: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The get_channel_from_mode() function is supposed to return the channel
which matches the mode.  But it has a bug where if it doesn't find a
matching channel then it returns the last channel.  It should return
NULL instead.

Also remove an unnecessary NULL check on "channel".

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/greybus/light.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index d62f97249aca..a5c2fe963866 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
 static struct gb_channel *get_channel_from_mode(struct gb_light *light,
 						u32 mode)
 {
-	struct gb_channel *channel = NULL;
+	struct gb_channel *channel;
 	int i;
 
 	for (i = 0; i < light->channels_count; i++) {
 		channel = &light->channels[i];
-		if (channel && channel->mode == mode)
-			break;
+		if (channel->mode == mode)
+			return channel;
 	}
-	return channel;
+	return NULL;
 }
 
 static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
-- 
2.43.0

