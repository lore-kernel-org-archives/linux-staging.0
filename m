Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF618E362
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337163; cv=none; b=RthJGLfgGW5/c1uiCVuplX1W0XOW9dPOY8viwzuDjZ6f8YDAbSd3w50BAOgLsZhupKcWCUP9KXeFDt9mdP7Nyfpa23Aov4JnyFvYxTTC9pdOmcLjm0JjijLqzSw21dvy1d8GfMPsS5FVOsJJD46x8+sGKQ9/VN9HJjoDazUh9Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337163; c=relaxed/simple;
	bh=u4eeWPx9v9zXxQW6q1d08/EVNgYhQ9eDU6vhv1Eg1lQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mxmOvtObAuqgCjDCr2R7CcGbOOXf97dMo2TRnk8PUSIsocShSqzqzAKEJqLhPUaGx+0GJv6+5P+S8E4wy65UVl5YmPhSLRzlNghAihZQDycTAXOvoGNMT0btsEW5qsOHMvXLH3ZYJndDlP1OrdEqfrPkSF6aBi3N2kwZp71P4Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HRAY1eZE; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HRAY1eZE"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c08b14baa9so352208385a.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337161; x=1740941961; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKj5wtQrpuxHEw5Ir/rKIm4r91PW3GTX9YpL0smEXfU=;
        b=HRAY1eZEsGOj12qnIhQtx81d3jgxfetRpSh3s2YAAJK5xJTnHFK5k8O6b1B4Bma7zJ
         c5Ijg7vfkIcwDVyTA5/+4Npn8b3lbNAxBW4V1+KxSFGANfiW2EZVh3C95PYK4c/P5tKG
         UabeWNayOcmf+RhrWOwD/DwrZkCKuXB1paeYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337161; x=1740941961;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKj5wtQrpuxHEw5Ir/rKIm4r91PW3GTX9YpL0smEXfU=;
        b=GNGwyB6V7U+SA78p2AGRuNoi4tEXmqQWPQPBb7TmzUYU3Hk5Hpr7UMB4UmrEnduW2p
         DWuXVkoHnSsCyPsbBNGoKl4nnISqSaC2PudhAeNpD4jOXnHyvS6iI5gC+tCsERU9cwzp
         cG4FgzDRpKN/P3jOkcK0/7Sx54FysWJssmemkBOx8i2AzRthiMFVS+xWUA9WCmewsZp1
         Ui7CaIeCOJjw+yU9WH9zdNRbxVrdAToD6mc6L+ksvrPcxMquRat9XxKUr/013748a2jp
         77VQNmDgTcPcGIppW9SEG/4mNEPyfRIXd+6mjY2EBXkDJxbnZuDpmGmuHEp1kDPnnMNc
         lELg==
X-Forwarded-Encrypted: i=1; AJvYcCWidFJ7n0/pzlm8gT0LbqgiY7yNSpm7yERNFPupi7g8yWG7yW7ZDEWWFcUnthCiGlPlxBI8XzsSIbHYQyw+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj6U41uVpT/R/FuYZiUuBVH/7tJA4u0isKCDwWhDhiNF5qM0wo
	mIeovA+jK6pqzB7agfw4rtRWyX6FEjtpT/3T6RbuVTrkOlF+WYJihXFbR+4H+A==
X-Gm-Gg: ASbGnct8BCk4DyCSTxISKLSm5te50f/tQgEn8ZHvdfSx8vA2u0aS6tdLGMCSQZ23J+r
	I/JuTDqdQ2r+KDSqYXKphje/nsRCGWSMeeetrwNrYsz9T9j8XlKqMI7p8i/NkHeS/jpvDrjOXQ1
	VqdU2O5MadC1G5HDjCFShFoMHg7V6L0syHUrbZ1coQkAEkgoqcBtGvg4Vz7W14B6Oypxnb0lbtC
	iTxBilRzvnmC8Z0NB6yTP/dMw9urwdMUcXj905vHWK6n3P+JkmXIpVQ/SsKzhmpZ41q7cUZjzPI
	cYyEum4zTo+oHPuWhVz/XJZxkD3Kwkbk+n23ZZdel3CwXjM5a97o1bbH5XDDGPZzZ59Euc2A23w
	oW1A=
X-Google-Smtp-Source: AGHT+IEPBVXunXYvubmeu9Rykbfo5eGXhaOm0MVgZQfjAtv1MCc6N7GtK7qCLnbD3lNpZga5u+oDwg==
X-Received: by 2002:a05:620a:2a0f:b0:7c0:c7c3:b877 with SMTP id af79cd13be357-7c0cef48cb1mr1777562685a.40.1740337161085;
        Sun, 23 Feb 2025 10:59:21 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:19 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 00/12] media: Remove vidioc_g/s_ctrl and
 vidioc_queryctrl callbacks
Date: Sun, 23 Feb 2025 18:58:03 +0000
Message-Id: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALtvu2cC/22Myw6CMBQFf4V0bU0fPMSV/2FclNsWmgjVW2gkh
 H+3sCLG5ZycmYUEg84Ecs0Wgia64PyQQJ4yAp0aWkOdTkwEEzkXrKbvyeAMIz5pAbKUoqngUlQ
 k/V9orPvsrfsjcefC6HHe05Fv679K5JRRbaytFFjQ0NygQ9+7qT97bMkWiuIgc3aURZKBKSl1W
 duclz/yuq5ffPjOzeIAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Most of the drivers use the control framework or can use the superset
version of these callbacks: vidioc_g/s_ext_ctrl and
vidioc_query_ext_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Rename wl1273_fm_vidioc_s_ctrl
- Remove dead code from cx231xx-417
- Link to v2: https://lore.kernel.org/r/20241210-queryctrl-v2-0-c0a33d69f416@chromium.org

Changes in v2:
- v4l2_query_ext_ctrl_to_v4l2_queryctrl
- Fix conversion (Thanks Hans)
- Link to v1: https://lore.kernel.org/r/20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org

---
Ricardo Ribalda (12):
      media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
      media: pvrusb2: Convert queryctrl to query_ext_ctrl
      media: pvrusb2: Remove g/s_ctrl callbacks
      media: uvcvideo: Remove vidioc_queryctrl
      media: atomisp: Replace queryctrl with query_ext_ctrl
      media: atomisp: Remove vidioc_g/s callback
      media: v4l2: Remove vidioc_queryctrl callback
      media: v4l2: Remove vidioc_g_ctrl callback
      media: cx231xx: Remove vidioc_s_ctrl callback
      media: v4l2: Remove vidioc_s_ctrl callback
      media: v4l2-core: Introduce v4l2_query_ext_ctrl_to_v4l2_queryctrl
      media: radio-wl1273: Rename wl1273_fm_vidioc_s_ctrl

 drivers/media/radio/radio-wl1273.c                |  4 +-
 drivers/media/usb/cx231xx/cx231xx-417.c           | 15 -------
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          | 40 ++++--------------
 drivers/media/usb/uvc/uvc_v4l2.c                  | 10 -----
 drivers/media/v4l2-core/v4l2-ctrls-api.c          | 51 +++++++++++++----------
 drivers/media/v4l2-core/v4l2-dev.c                |  6 +--
 drivers/media/v4l2-core/v4l2-ioctl.c              | 19 +++++----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 35 ++++++++--------
 include/media/v4l2-ctrls.h                        | 12 ++++++
 include/media/v4l2-ioctl.h                        | 12 ------
 10 files changed, 85 insertions(+), 119 deletions(-)
---
base-commit: c2b96a6818159fba8a3bcc38262da9e77f9b3ec7
change-id: 20241209-queryctrl-5c3632b7c857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

