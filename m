Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59E1BBBD5
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431365; cv=none; b=Hr590tX2Whr9Fa7a26MPv+ESz6Wio0APrlnfmKtD2XlvEVIOiyUdpJKpZi4mBy07wgaBiwDwg+9MAT3THPGh5qbnLkoyqwRsXvc4u/10WQdj15Vm3ZQOU18ojNph67hf1wNIDiib9u78vjwHAPK7uk8oMQafKCM4J4fyqhpA87s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431365; c=relaxed/simple;
	bh=NzGO/n5w0inQUSk9Mrg2JWrHNdom3NBH7egriAh15og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0tpPa/bAOVONeMtCgndb3wEtPLBgAG1m1/55p911pCqgAPeRPsQTfQ8sLKRfw/HxBzfwcD0Fw0+2HnAxv8ormIMytTe03ciNHH+EsJL0s64QIDNbuuGZQUfJByWQdi8jUNJ7TCeqWra4jhUAXYtFJrqkcLGowDCFoP/u7XopxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rf5gKd8A; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rf5gKd8A"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4581ec0e00eso13365711cf.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727431363; x=1728036163; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwJYpIvOPMah9ocVmXZ/vnejPzGmcFsHFsHmC+ou0no=;
        b=Rf5gKd8A/ytdyvyUK6BNiG6aloBtAk5YGOfMEqOh+15eZICWEk6EPJK4ID3olXDRqp
         0sVMMlwPTnmgFWWT8CRruEWXCX7liHvWHbKzOkF3hAqiPJ8W9QbFTtOJgij8VUvUOX9l
         HPTqvxfV0JX7jKMIm6AiOJNNBDXNlV98I2D+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431363; x=1728036163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwJYpIvOPMah9ocVmXZ/vnejPzGmcFsHFsHmC+ou0no=;
        b=sahVJO422oVVXNsLKkO/ILoNstRtTWZoIwV8wxhV0PlvFjJCgRK5pwZeW/4dYmCkej
         wu9hZFGhwFNbMmMNtN2HjhvVKPWoexvMOZHe5ip6EQ+fmm3qCjuKuxnKNeupa21WTJw4
         B9qz9O3Jxemhdkfy7sm86xunqv2JSHk8jLvHgRtC0JlN7aObuIwmsEOYkcO5i2y5JK0S
         MUkPxw/OuVUiLipr1NqxK2VKA/8ty9QII+23M3HVVa7HNig32BUGorzlSjIe2k8KLiJf
         KS+e1YJoG613WeILD4efu3bYXj7Xi/QbTOHzr9R7rl7swLDBsHfLcx0DEQ1DoJ7J4+sT
         J6mA==
X-Forwarded-Encrypted: i=1; AJvYcCUG9YwP50wFdEIWJ2aotyoe9RZBIbkVCb8m10ZFfXPIyHxNkWO39yHdLJKXJZu/zCukAspEGmvR4wgu4WqJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+VgBY5gtswUNrOeqKet7RuLYY1qnCsab7mvkxoTMkm2lRtqGV
	0D47ankxeYnPe9KeGcF0tejsPsHZrGYmrwuO4dfnnVwjpuAlYOnUXPylIGxClQ==
X-Google-Smtp-Source: AGHT+IHIhHVv8+j4NztQAIQhmr+1bNXNkJaWVfqmXRAU1YfyFDkrgQwJlMA6+y72ZjS/zMeolaZGXg==
X-Received: by 2002:a05:622a:1208:b0:456:7fb5:1bdb with SMTP id d75a77b69052e-45c9f0aae7emr47154531cf.0.1727431362859;
        Fri, 27 Sep 2024 03:02:42 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f353f08sm6341091cf.94.2024.09.27.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:02:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 10:02:32 +0000
Subject: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
To: Benoit Parrot <bparrot@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The str_up_down() helper simplifies the code and fixes the following cocci
warning:

drivers/media/platform/ti/cal/cal-camerarx.c:194:3-9: opportunity for str_up_down(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 42dfe08b765f..ba8c4743f539 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -191,7 +191,7 @@ static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
 
 	if (i == 10)
 		phy_err(phy, "Failed to power %s complexio\n",
-			enable ? "up" : "down");
+			str_up_down(enable);
 }
 
 static void cal_camerarx_wait_reset(struct cal_camerarx *phy)

-- 
2.46.1.824.gd892dcdcdd-goog

