Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A73F9F34
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380085; cv=none; b=jXyLZVUqZZRAMbTyAp2kOUBVbLHs3XmuMw0bpIb2rYImnmvZOW91pwpAjEL0HyhGwSdYIcWdDNJv8hrzSuXvE4DkY9FAOXt4/Fc4xhNqwnUigNbGbMSFtJXN/HyXa5d6vfKhg2QeDb2IjL7GkazKZOt29lgd1qWrjd9US+Qu9/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380085; c=relaxed/simple;
	bh=y2Qty4JaBo8ngXcVzl1XbUBhz18x+GuUcEApRBK6CVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J0FNJP76YEeh2UFys8+KRzksbWU4Hosy2BIbEsOu/6X1oxKg2w0G8WoqlDMJiU7vDH14H5NVPV7GIAnW7NJJKaaOHcOvPDph0oxUUXWyCucKHpCMRLnhWiyPo5bp3xQ33ZvrazalrZPgTEak6vqe+RCmbfStQlErDZD3Y/AUEXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UBFYQcDH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UBFYQcDH"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40502e63bso10164525e87.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380075; x=1777984875; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckYgYV47kPjoUmAXaUUXbyKF404Pki34Nnqg+80/hfc=;
        b=UBFYQcDHCDR53DazgLoSCauuaJ8R6XBqE/h28NH5sj2REZFDelQ1gvJZvGO8eki235
         6kcT0EM/7+Yb7gWUmo1BE8CvSEWephbraYjYVGdik6Zj4Zv46Rr7uOB1rgrYSzlg7AIY
         Y9jE2V7cTlhmgRQTxdt4SbCRyjOSF+roY8ibw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380075; x=1777984875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckYgYV47kPjoUmAXaUUXbyKF404Pki34Nnqg+80/hfc=;
        b=UtHbG+jUs5bRLoSpSB2brwZVNuVLzta5xs6X6MCEkGRMyxTbRnUWEKOqzd7ZMlwG5e
         DmJ1Fc6FlQpawGmUHbTUGhcRYyHqff9HWub02DzJsB/Zc4pvWBXSQzEfti+VHuYxgKAV
         P3L8DwXc3ZCJLR89WAmsyISD8tUQadrQPh1AvYzdoMZVmA2C5EqiGC437JeSdEqVPlKO
         UtK8Om8FeJKSRf6p4PXfIC0pMCjqbGJxzbZ7p+Sd/edRxrH7qCP8haVklzmQjCbY5VRv
         CueLymcpraLBfYfRmeuorZ+En1jQtT9nLbYQ/vX5ty0a/Iii1FTqV56uJK9AbrmF77s2
         jWUA==
X-Forwarded-Encrypted: i=1; AFNElJ90s4IVtqb4+Sz3Yw4OlB37KPEw2yAYhdfjRHmpnn+LKfwMLCLDkU6raZe91o5wHyX4SpSmh5zhkER2UJkx@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi3WU0PgV4sIkqv5k5F/6s+KwEvy+1puEi1ZEUFOzIoRCPv8wo
	hN7/lqBpzz7xQRC3r5QQqqurCZhiHu1p2Xja1DaDuL60QdxeKw/mh7rblbborpEbDg==
X-Gm-Gg: AeBDieurYizoVkjouwKe4GbV8mqxFJcnH+lzunLAlwPuYvGPOBFTA42H7SiBu8Yl1li
	tI0CwLXqsQ0l9KyTPjrmlreVuD7iEn/Dc/uHoXVKOXynqeYKO8xF3lLoxRU+4ViJOhc5bR8K92P
	gcxCQKOGwJb6tO4a9wZwoEKtxNyU7lRFih4ur7MylUX2J+0F/x8VsKnEfJ7JTC3fvp6+c1OftZq
	tLrAA0IsOzN/wYuLog9pSC0yu/l0CK5LZVF8bNET1IX+Vv3kSPmLHqQlrALaxkwelNn9LUkLqfX
	XjUMC5J4i8uzpfuSq6GskxtFbHw/6QXed+K/zZT8OsMWfpIPq0UC/mfJO6wQIqtI2mwSPWi4jUT
	aGqB176w3bB3iPrpAsDt3taWb1hgBVZ7dOuW/mciI4UuwKpnI9p4CS1jvraeK7DmUR9GBr8uxgz
	DNRr3KkA7jwhP8YCFZrHiFW/fKbaSsWfLQwD8Ne/lz69G9KtVgWKHSK2xXRxzTxdNpMvxMnpUgi
	Bi9XKnimiRzxrkOK4/F1n6873/o
X-Received: by 2002:a05:6512:3b12:b0:5a3:7528:6da1 with SMTP id 2adb3069b0e04-5a7462d2698mr1139729e87.0.1777380075075;
        Tue, 28 Apr 2026 05:41:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/6] media: Fix new smatch warnings
Date: Tue, 28 Apr 2026 12:41:06 +0000
Message-Id: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOKq8GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3eLcxJLkDF1zXUPdFEszSyNLy5QU4+Q0JaCGgqLUtMwKsGHRsbW
 1AMvtEE5cAAAA
X-Change-ID: 20260428-smatch-7-1-d969299dd3cf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Current version of smatch triggers some warnings for the media tree.
Most of them are inoffensive, but we would like to have zero smatch
warnings.

drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127
drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (6):
      media: v4l2-dev: Add range check for vdev->minor
      media: i2c: mt9p031: Rewrite a bitwise mask
      media: i2c: adv7604: Add range checks for chip info
      media: chips-media: wave5: Add range checks for dec_output_info
      media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
      media: amlogic-c3: Add validations for ae and awb config

 drivers/media/i2c/adv7604.c                             |  6 ++++++
 drivers/media/i2c/mt9p031.c                             |  2 +-
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c   |  4 ++++
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 11 +++++++++--
 drivers/media/v4l2-core/v4l2-dev.c                      |  6 ++++++
 drivers/staging/media/ipu3/ipu3-css-params.c            |  8 ++++++--
 6 files changed, 32 insertions(+), 5 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-smatch-7-1-d969299dd3cf

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

