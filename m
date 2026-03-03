Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F82D3803D9
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527374; cv=none; b=n1tud1EYwdMq0D94s9I08UUUXgRTw0TpSvvXlskryLi3a+OBZ1vBFbQM2c1niZ8uvV7brilq7j1q5MRZ6HbKsoDM7jIdlJvjPGwaFJW1oaWBlZUMmdUOxnci5NcYQlndrjebP4gDsOMIrsqVI6/lvMlmxvg9Vf9T4xFIiwU3BcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527374; c=relaxed/simple;
	bh=KtwBlnc2I6dJ4eOZ4EjMPfuJuBTRHMBICisI5PmzfUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uqdsv6zqBriFEL10ISRAt7h7NcXoY+viEFrxy3h6dk6wRyshiFZqE1xowCa2lQA6Ouhkky2P3BHzqlNLRF//DaEO6Wkga3sCRvU2KxDJkSJ4maE3oVoUQX6zxO5Bf5J/tB0da6WUDCjMRjMt+qM2qq5mJ/LeABqs8Axi8WEb0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8XfmnP+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8XfmnP+"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-386b553c70eso85586361fa.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527371; x=1773132171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=scIblvKwdHM9UE2R1JwRsKiQl+NnqelAVvJdkvvFH1E=;
        b=i8XfmnP+4pLkr2uJHIR3phLPuNhXw8FIqE/F2p2cm4VqmWt24+FDGMI5cNwzpNnHKU
         HZqJvoIn1f3TmHl5ScZaMgNTuVG0hnq4QKY35SMNXQQqWGvZwWv0kBh5oJW7AbNw/vJ0
         unGVNkJ+w0N1VGUdmqZbjPDKwdrMGXBkxiUik/q+U5PXVue6PaGcGNiODwqtm5J1724I
         p+uRCadeu6H0t9J8hOIfgQ9NA9bAL6kt3GkWgyIpd6PbRlFcg5azA6jHpZFaSqF/XA5U
         VOoTOZMnxg3kUHevqoRzmb5GyltddHdzJ1xY7dQtqoIBOQthTxxXK3cfJCEse9+Ougmq
         2Wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527371; x=1773132171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scIblvKwdHM9UE2R1JwRsKiQl+NnqelAVvJdkvvFH1E=;
        b=cVao4BCoZr2Z6rs03f6NBFYe7jTl7R7bmzjc4269z6/dhnW/jLj3UA5Uwd31igJIra
         ttAxGtWap1xJqyKhhobzDHiq0lEciXG7oatKkfwK4zOEd6aW0Qx1+h5QNlulVyKd4Spz
         A0N4ZekKfSZcvCLxUUrcG3WAGHhTuqruKxtT3Astidc7w/4SbZr57W8jtZq74RRYdyFu
         0/8B2n10TVglZxgD8pEp988XNHvKbjzoZ7P01EgvAWPmQtrw2eo9dYWyeeVKvGVxiT8g
         amJQqm305PX55CHh4KqqbOTM4WPIs1x/nrBoD5ipBOquYKJd2fciumIzq82a4vaiqLmY
         pRvg==
X-Forwarded-Encrypted: i=1; AJvYcCVtLlAzWs/kbPC1MRzvc9MNT6ceqCj5ILARNXwKU7aindOZeA5RK3QjuWrUP8QQmiD975PFo+iKO9RiuLhE@lists.linux.dev
X-Gm-Message-State: AOJu0YxnjdN8JIYPl0xFTLAGuNG3oUhPMsYAyO/aW6YrziK3P3c8wlyN
	+OSJRRp3CJiEIZ2Y436L3nsnY8FsicHRcHUoF7LDEogPsdxJM+6YYDTb
X-Gm-Gg: ATEYQzybxUOjLJyqnP6jrEaYMd6vn9ntnFyrz/yBvVKXSzl2Rn3kw/C4brgb0XqaZuL
	g6dqLu1RIjqcF8Y6jwV1lSdZC15Ss1eJd/xoSIhGRuEuNt0MIukOAdl8tVQQ9gKGnc84ngERwhT
	2PA6M3tYu6cpuiPZ27MR64hgj1p9p/+z9GOEU7WkGWQkQyvxtnSt7BthxAeVkKym1djLq558cz7
	5RX9kk775szRPKK5zfDAA2zVIK6kLHFmXOHWAs/iIxCZ9N65yVYAQ8cJ8fYzsAawpQ3C8/2p9YU
	3xqj1NjNrc2sOHy1vZJGF0lDxQEX/c/X6HWDC5hbR+rT84fb8MN8d//K24n4FiiQTzLUNgZ7qQX
	+51fyyMmR0MnVcdPQfmhNB7jrWJHBHwNYUc7YIINkplJ2h3DsLxHwTHWSMOo+76K0WmTY6CLuSI
	hlcmH2aqFJKf/S
X-Received: by 2002:a2e:a10b:0:b0:388:127c:224d with SMTP id 38308e7fff4ca-389ff34fa10mr103976761fa.22.1772527370524;
        Tue, 03 Mar 2026 00:42:50 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 00/15] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Tue,  3 Mar 2026 10:42:23 +0200
Message-ID: <20260303084239.15007-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
with a set of changes required for that.

---
Changes in v2:
- vi_sensor gated through csus
- TEGRA30_CLK_CLK_MAX moved to clk-tegra30
- adjusted commit titles and messages
- clk_register_clkdev dropped from pad clock registration
- removed tegra30-vi/vip and used tegra20 fallback
- added separate csi schema for tegra20-csi and tegra30-csi
- fixet number of VI channels
- adjusted tegra_vi_out naming
- fixed yuv_input_format to main_input_format
- MIPI calibration refsctored for Tegra114+ and added support for
  pre-Tegra114 to use CSI as a MIPI calibration device
- switched ENOMEM to EBUSY
- added check into tegra_channel_get_remote_csi_subdev
- moved avdd-dsi-csi-supply into CSI
- next_fs_sp_idx > next_fs_sp_value
- removed host1x_syncpt_incr from framecounted syncpoint
- csi subdev request moved before frame cycle

Changes in v3:
- tegra20 and tegra30 csi schema merged
- removed unneeded properties and requirements from schema
- improved vendor specific properties description
- added tegra20 csus parent mux
- improved commit descriptions
- redesigned MIPI-calibration to expose less SoC related data into header
- commit "staging: media: tegra-video: csi: add support for SoCs with integrated
  MIPI calibration" dropped as unneeded
- improved tegra_channel_get_remote_device_subdev logic
- avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
- software syncpoint counters switched to direct reading
- adjusted planar formats offset calculation

Changes in v4:
- removed ifdefs from tegra_mipi_driver
- document Tegra132 MIPI calibration device
- switched to use BIT macro in tegra114-mipi
- pinctrl changes moved to a separate patch
- ERESTARTSYS workaround preserved for now
- tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
- reworked bytesperline and sizeimage calculaion

Changes in v5:
- dropped patch 1/24 of v4 since it was picked to pinctrl tree
- added reasoning for tegra132 comaptible into commit desctiption
- moved clocks into common section in tegra20-csi schema
- added note regarding ERESTARTSYS

Changes in v6:
- dropped patches 1, 2, 3, 4, 10, 13, 21, 22 of v5 since they were picked
- rebased on top of linux next/master
- improved description of commit
  "staging: media: tegra-video: vi: adjust get_selection operation check"

Changes in v7:
- rebased on top of v7
- kzalloc > kzalloc_obj in mipi.c
---

Svyatoslav Ryhel (15):
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: vi: adjust get_selection operation check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: csi: move CSI helpers to header
  gpu: host1x: convert MIPI to use operation function pointers
  staging: media: tegra-video: vi: improve logic of source requesting
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: adjust format align calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422/YUV420p 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 drivers/gpu/drm/tegra/dsi.c                 |   1 +
 drivers/gpu/host1x/Makefile                 |   1 +
 drivers/gpu/host1x/mipi.c                   | 592 +++-----------
 drivers/gpu/host1x/tegra114-mipi.c          | 483 ++++++++++++
 drivers/staging/media/tegra-video/Makefile  |   1 +
 drivers/staging/media/tegra-video/csi.c     |  64 +-
 drivers/staging/media/tegra-video/csi.h     |  22 +
 drivers/staging/media/tegra-video/tegra20.c | 820 +++++++++++++++++---
 drivers/staging/media/tegra-video/vi.c      |  58 +-
 drivers/staging/media/tegra-video/vi.h      |   6 +-
 drivers/staging/media/tegra-video/video.c   |   8 +-
 drivers/staging/media/tegra-video/vip.c     |   2 +-
 drivers/staging/media/tegra-video/vip.h     |   2 +-
 include/linux/host1x.h                      |  10 -
 include/linux/tegra-mipi-cal.h              |  57 ++
 15 files changed, 1482 insertions(+), 645 deletions(-)
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.51.0

