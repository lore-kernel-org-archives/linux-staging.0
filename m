Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215602D0615
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187493; cv=none; b=saPCdp1QA9jaCLy0NeQ8PhxuZb26qN1rEivFTyw8wtGguulgHbcvge7mbt4rPC6h36cmqpEk3DR3Vv7vk5Mhq3hmldg3pYRrlCAs9GQNFwOS9UPAlpG3EvYCIw1lrQTYdf9dun59+mfkiN6gtEcuISA9AI+2qFhPN84R1C/aSxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187493; c=relaxed/simple;
	bh=8FJ0YC1C7mKRk5Lk2bVVdnmIyr3CW9ccH76l3a/ceD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m/+QIKZq9LRnWjuL6gVyAPGP8pJJ2Ee+nTbTxKkYByltkHG9HWyu/c8BjByiBjfGxxoZt0wdhN/Xsf8Sr8J6uf4/C0Djk/zZw1lV5Nr1Nkcfh1CMrAouzSCGqyKRAZYYXSfjMb8gOKNGxPQhpXF0zJvX2dIIGYHNXPzP7XXY2kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VaKF/jda; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VaKF/jda"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso11902601fa.3
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187489; x=1778792289; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mptjggwKNBAMYYz+Dgc2U3TxZpTOkEIkNLS43/L3gyY=;
        b=VaKF/jdaULeOFMy38dXkfX0t7NtMNid6i+q9gYXvFbiuIqQn4ar581P7tg9vjoQPA/
         6Ehxdk5vx8lesp3PFeZkoNUpUKC0EJuVNSzO8SATZgMN+g2DBGm+vu0vb/sJj6v/2RV0
         P1NnAt837Tu4h0dDXxkP2su3/XQ/8SFxeXv0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187489; x=1778792289;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mptjggwKNBAMYYz+Dgc2U3TxZpTOkEIkNLS43/L3gyY=;
        b=XJtYu/7r+yMYrPxxJBRTWLERcPLW/rae+Uy/N8VUoVMUUwh5e+h3GGSdV7I5XNZqR1
         MXkpg6vhH67mi7ET0ciHzuTXPGezvsRyZabGGjXPE4gUw0ZRWeXh5nGl1AV08B+aUvj/
         b/4MkU0ct69hf4QxsD21Z3TbBJ/tTiFioPvNrr8F+kazP64zOdatG61fkrE2rGXu3Jtv
         Q5gN76zzP7Zh7kfwPrNaSdC8+RrWttlrEy+oBgHFyRU6A1L3QWW5coJS7o1dADo3knZY
         0RD7O+1mIvszxCYgBtRxhOGWt1PnNU/AWdLivSSBIFe29Es5FWQyQpUmscz1YiTUAnTe
         AkfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0dy2vfHnnugCqII+i4D0IQIOa8KD0S9mzBggjTRU4+3svojPFTn8xTNb745zTqpvAy1VaqFgRJqQMjlT0@lists.linux.dev
X-Gm-Message-State: AOJu0YxA4yy/ipMt6XH7ABaSVimkF5eMnXw8TlJTjG6Kq4/rIFmDtFKc
	+ZHhMJaEVgnHEVBOcd6Bkc7SHmRgPq+zbWqS1gZP+JMW4EW85PtEJ78u4WjqVKR5AA==
X-Gm-Gg: AeBDievbHHpMZxOxKTgieeSahzuM8AhZlmw7ko8Xj6RHCSPF18w6ehVaRpasWnPGmKO
	cUoKeQ7TNNGN4ndehRNRCQ0KREIjMzV3n4L7YVSqFTfDNOjhnzvd2m4L3N8MAbl61xEYD/tFvzP
	b1rMhcXmSEm63o1X0spxVA7KIX5uq4EhJ5HfkjfuNxa6tKwVYAk4RU3UYJPqePst7PeCTU4vFbE
	3fVWoCUCVzeSo37OorRBLBZmoxqPZZrunxQuUKJowv/iFtdpvERXLfp5Z2J1FoUevcpkrnAEdvr
	ulZu45LfZVaH2EHzI3A18J8hpr5UD+f0ggDg8szeGJ5ciXTdqHuZHPfLIDY5zTfB1DDU35Unx8S
	uAQ2VpzG0GenaJasCHJQaQOQCWxeNvuDZwXvGk2O7/TBmD+diGYfORVEeCt13qwvumFsNJDhbp3
	mILHdR7XBzeWtpBTCXgg7vUAEzznGjADGsaTZVr1KzwyIXBPFj//z5DN7tD7dwgXHJpcKoUtSbQ
	aW8hzTstAsST/xMkg==
X-Received: by 2002:a2e:be14:0:b0:393:5920:2c5d with SMTP id 38308e7fff4ca-393c432462bmr42881891fa.28.1778187489368;
        Thu, 07 May 2026 13:58:09 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/6] media: Fix new smatch warnings
Date: Thu, 07 May 2026 20:58:05 +0000
Message-Id: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN38/GkC/23MvQ7CIBiF4VtpmMXAB9Ti5H0YB8pPYagYqI2m6
 b1Lu2hNx3OS551QtinYjM7VhJIdQw7xXgY/VEh7de8sDqZsBARqwqHBuVeD9viEKTayliClMUw
 7VMAjWRdea+x6K9uHPMT0XtsjXd7dzEgxwbxuJDHOtTWlF+1T7MOzP8bUoaU0wlcLQjcailbgt
 GtBMKr0jma/mm80K9oZRUFoRoho/vQ8zx820rWOIwEAAA==
X-Change-ID: 20260428-smatch-7-1-d969299dd3cf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
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
Changes in v4:
- Fix commit message for: staging: ipu3-imgu:
- Link to v3: https://lore.kernel.org/r/20260504-smatch-7-1-v3-0-fda125c30058@chromium.org

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

