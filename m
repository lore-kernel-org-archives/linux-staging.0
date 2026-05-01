Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D962EDD62
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635177; cv=none; b=oygf+Wq2K4QVVOG81gOgznoa2SBZ3Di1aUkwpQrfaUHvWD2KtIlC1tCvJ5KLZEzX6ZJjefMpDt5wdeX+ZgAp6gS3Ze8j52U9MZNUGlOXtdFZ99fDjcH5nUTv7EoChmV3ESiVpzcbHKYmsNHvF6Sxm37/e9vbPPWnT1TASMnM+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635177; c=relaxed/simple;
	bh=lNE0nPjKixAgd1P12CjQb2oJjktRa0U2UO4AEVXrWtc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g1KYynEIcIahw3FyJb/4eKZPqwZ44FEkBBBqt5smLzh606vPtnQAn+4p2Jn2UmJSpyZfgEz1M+OUTeGguScH3EzwXM0SUJFcNQ2Kcce9TK5oVPHeca7NxWyIVib8VbaNVnDg6tVAWPf/aJkPxgRQ20b3749f919uL/MZL6MXWSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kqpuE3wL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kqpuE3wL"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a74962749aso1998694e87.3
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635173; x=1778239973; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Io9wfmVyuN/9T/zzUi+4EApFsonZHuvDhFNcgPKwqIU=;
        b=kqpuE3wLzP5ukZZESXdf/oe3EUsY3onXZhtPCn3jIzQIw3+JiTTuBJJR9ZO0MjMbwA
         qYo59fnWF7AUMWEM0wZze04fYs8zQXd/cb39uXxSpJunW9l6NqVAAIM8Ry1YIlIHgaFC
         GVSl9Wr5Fn0hD6UCrBE6tN4MX9ehocEXD3f14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635173; x=1778239973;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io9wfmVyuN/9T/zzUi+4EApFsonZHuvDhFNcgPKwqIU=;
        b=jlBuuY/zqTAuLGwJbEh82yMsydhSxAeX0yGumhKmbdFAM6OoaiKxObbzrBK1BU3N9Q
         xqDFBexUvPMOLeqmcPDgY6Vid+FuCTzho7UruwFHObDflbznxfk4HX4hFgFXv493F4Co
         8y9Op+eezkelSnmZv86zloLSG2infuwIoKzh2sPrGjYnpLTAsM/fc4rNedsXK2RgSRVy
         6Y+T3JPArRyTMF2aBsPn8wyPiUd9KUNBEi8+1xEYMlc3gRtyL9kvJDc90Kzt+s31DkTG
         GedsC1Fn8goL5N7+SHTwdwU707I5xQI5dcU+MEqu/9rUUUCLBYs1fRDKBS1Jb7cqAaDJ
         TF7w==
X-Forwarded-Encrypted: i=1; AFNElJ+QtiCQEFPgohlc0QEQ7fbOr2sRUegJOeGdXmoWYKZlPFqxbrV2YfK6t6Da611h98g4UPstRcsVwagLmnFj@lists.linux.dev
X-Gm-Message-State: AOJu0YzVZfcK+AdDkHsN5T2kGQkGRT75M2XwjZAkee4QeP8kkKjcrg+r
	gnuclha2L7Fm8zgeR8iQPshL5okfrUKQ/vtjC68PDeFFpBKAaJroB5OweO2QAPDZ9g==
X-Gm-Gg: AeBDietAxrORNj5irPHSXKdRsjjC2wHwakZY/PZIhhQUv3rRri3VtpQqFoSdTqpZgpF
	QRCTIcTrmbcv3rTQ/GWBhrNiZmxR2/gCqShUolp+N3nrmjDFIrQrGDJ8DSLcZTLooHUXD0vmQS1
	6G8uyBRWzdKinrq3LCf83LoLEfgR838218a3xu1lK6k0j+4wzC6e+eLkTF8vmc96vW+MVQqPMO7
	WuzmGM3lGarM+tjIQ5wTKVIsvYouT+dL7RfA782DHKR4ghoFwBc+ObJ+WQpD6rrgSghy32sktlu
	0O0IVfvU/Hc068BkEss8wySGV6O4y2VwW0q8AEJTcqG3HZha9QXdSyiwAfzWhSsDu1P0/9epOhT
	yut36eZdz1jWbhkhjIgsl9OVw+/1e8bs2oOS844B6qZOR/XDn6yevTpeSS9lkLMEPlBkndsT8H+
	N5BK9vgBrhmpA3zfpBiAVB7szJolVqQtONTeVrVYviL49V+vDpZ/KpfR/ZXDQ0XxhZgZZXrLM7d
	coi+PklLDeEefHugUn8eALG4xLC
X-Received: by 2002:a05:6512:31c5:b0:5a4:4cc:7a52 with SMTP id 2adb3069b0e04-5a8522d0d4cmr2841534e87.17.1777635173080;
        Fri, 01 May 2026 04:32:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:32:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: Fix new smatch warnings
Date: Fri, 01 May 2026 11:32:45 +0000
Message-Id: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2P9GkC/23MSw7CIBSF4a00d+w1gA0WR92H6aDyKHdAMVCJp
 mHvYscO/5Ocb4dsE9kMt26HZAtlimsLcepA+3ldLJJpDYIJyXoxYA7zpj1ekaNRUgmljLloB+3
 wTNbR+8DuU2tPeYvpc9iF/9a/TOHIsJeDYsa5h+R81D7FQK9wjmmBqdb6BUdKOM6nAAAA
X-Change-ID: 20260428-smatch-7-1-d969299dd3cf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, stable@vger.kernel.org
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
Changes in v2:
- Remove WARN_ON() in user triggerable checks.
- Add fixes for user triggerable errors.
- Remove pr_err in v4l-dev
- Link to v1: https://lore.kernel.org/r/20260428-smatch-7-1-v1-0-46890dffb611@chromium.org

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
 drivers/media/v4l2-core/v4l2-dev.c                      |  5 +++++
 drivers/staging/media/ipu3/ipu3-css-params.c            |  8 ++++++--
 6 files changed, 31 insertions(+), 5 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-smatch-7-1-d969299dd3cf

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

