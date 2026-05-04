Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E92BD587
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 06:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877651; cv=none; b=gd2c1LkUrSza3I+PuPwCQ7d5J9M3ojhlJ3bcDIp0U9oYjXPF2Wx05wJyIujATdNdTyC2zMKqcoLOjKuOiWgUM5RG8CTXyt3qOAp/5Vdetx8k3tw8mZMdfxu0WD7oUWRSZHItAmdVWBuxS/sNoAWXgz4VYTO9sDthv7/Smv6LFR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877651; c=relaxed/simple;
	bh=wypT3/f64K5sDq91Et+10pxdZ4d+e//SJTgpXTubmZ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VlkRkA5p8PUyHTVV5hF8//lCZ8cmS85Akjs9DedhhU8jhlIHV5KL0Jzu54o8CvI0QDo+vlu3/FyAJMemRYsKxut8POsEigBfDSmxbMUO5SQ6nPldWRksb4nXaF4yAfQRc0hahhjfqayOIb/0Z14jbF3k82W7EWiHJEJP1KHG2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QTp1skll; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QTp1skll"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a4113ab355so3577523e87.1
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877647; x=1778482447; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uQAiVepCGgf4BwN62I0/iFSFpiKXW39s5/tMjTrHDw=;
        b=QTp1sklldBNQB+0DLO5iSG1gfxUn5TY3qNXDMs5Tl600xqYKpQDjk98GJ0q/HeqxZ0
         vzdcZds8WYYv3uIIBQS0wFLQ0sF4xu8U0JV1q+cNff1AlI9xUD2tgLqoWzCYposFMv7L
         nKP+eJokfgmiMYdhZcoxntoJAFejK34MMQ4+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877647; x=1778482447;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uQAiVepCGgf4BwN62I0/iFSFpiKXW39s5/tMjTrHDw=;
        b=Hj0MR7AL+++WAeluyRgXxfnuwqAlG0+htv1VjSTIDGkXkzbXlVZPt1Sxaw0B2gdUzc
         iArhi3/LYOfSbAfCzbhoUOzsDVSRF6+pHObWgVlIvQRC67QYD+ZsccAi5qhO6YWkSr8Q
         ZBCCinCPy1MBfE1D9ZxWlOabByaZy85TFnHDmeVCPtFydNvDfoqY2BqUtD+zrtM32QMw
         hvlXCiQNnw2N8KKKTyPRfqj+yiE08ghCHF36j/hOn2vuvT/MvVzHJ7YYd4cNnUffYu85
         4hsLkJFMetJLgd7a+WBSbL72eZRLWX1FIuGCVVb3VwsJJ02mI9+lKyTw5V96r50T1PdY
         ECvw==
X-Forwarded-Encrypted: i=1; AFNElJ+9wi3fTR49Wu9MT+7FFzxah0rJz7u6NrvseiVVFNBjJhUpKbGv3A1IpfJpROtXk4noN6bIMEFmzn+OY8Bu@lists.linux.dev
X-Gm-Message-State: AOJu0YwH9hp7D6wJJ1ibal0HKGFqh2HEdwb9hkkW0cYe9VskiXoFaqOQ
	8aJg2M2d0oGCNw/l5TY0Sxpk+tbti5vaOIzA2RK87iISduNvP0woVrFQtv4gbd+FpA==
X-Gm-Gg: AeBDieu/ZTGeW1gzuyE1gMty8Q/Chd1gPNkPG5plyR4p5lF0WKJQQPqyRLQ1zBPdwwk
	+jxQviZXXiooNs9pBFb9+3i4xYqUFR3Mh0S8Mn+DHSiCcuj+OCpgyLPljr6WJdey1OIMzqXujNJ
	q3axoNmFxPtVA+Qg6dKDd29qBD2FhwX0ouxm7dND3QENJR2cvd5f3fGXZj67Tz+j+jD2Xo7ZMJ6
	6byHjehs/kWA31BFNJPvFH7l5NTjAdL5mxwwXqkdE/i3VNvaNK6nga5oTOkENs1pLyhcpmQagIT
	O7QFFgAPgrr+unJHlZ4hZIBGpjIa9lv/C6l+kQG/1wdjet8wKJsHjIwEfYw9+camIA+GkuptIC9
	iYOzcsu/e1ZOj6HmlOYaw85ehdMQcPx9b4H8TWw5GSm9CHye7+GWMY18ODaAgA5GTn5UHQS+jKx
	/RfYnu32pbyx2l+PG9gq1ApcGSMeP7EMFQiwZMYVVbq3WU1ktRWgbliB9BTqMukUTvhY3sHEjDy
	tFl+9DTO0gI+a4poA==
X-Received: by 2002:a05:6512:a89:b0:5a2:bedb:2119 with SMTP id 2adb3069b0e04-5a8631bdaa2mr2838842e87.26.1777877646839;
        Sun, 03 May 2026 23:54:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/6] media: Fix new smatch warnings
Date: Mon, 04 May 2026 06:54:03 +0000
Message-Id: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItC+GkC/23MSw6CMBSF4a2Qjq3pvUCljtyHcVD6oB1ATYuNh
 rB3CxOjcXhO8v0LSSZ6k8i5Wkg02ScfpjLqQ0WUk9NgqNdlE2TIWYMdTaOclaMnClQLLlAIrWt
 lSQH3aKx/7rHrrWzn0xzia29n2N6/mQyU0YZ3gmlrew5wUS6G0T/GY4gD2UoZP7pl8KWxaIlW2
 R7bGqT60eu6vgFk5t5q5QAAAA==
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
Changes in v3:
- Rewrite mt9p031's bitmask to keep ~7
- Link to v2: https://lore.kernel.org/r/20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org

Changes in v2:
- Remove WARN_ON() in user triggerable checks.
- Add fixes for user triggerable errors.
- Remove pr_err in v4l-dev
- Link to v1: https://lore.kernel.org/r/20260428-smatch-7-1-v1-0-46890dffb611@chromium.org

---
Ricardo Ribalda (6):
      media: v4l2-dev: Add range check for vdev->minor
      media: i2c: mt9p031: Rewrite assignment to make smatch happy
      media: i2c: adv7604: Add range checks for chip info
      media: chips-media: wave5: Add range checks for dec_output_info
      media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
      media: amlogic-c3: Add validations for ae and awb config

 drivers/media/i2c/adv7604.c                             |  6 ++++++
 drivers/media/i2c/mt9p031.c                             |  3 ++-
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c   |  4 ++++
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 11 +++++++++--
 drivers/media/v4l2-core/v4l2-dev.c                      |  5 +++++
 drivers/staging/media/ipu3/ipu3-css-params.c            |  8 ++++++--
 6 files changed, 32 insertions(+), 5 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-smatch-7-1-d969299dd3cf

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

