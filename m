Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BA2E2296
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813436; cv=none; b=qFlWe1D8hDz1W+l+/AZR4HDLcivv4mB1nZPMk1NYObxOTu172BIaLXRL+5Nz82telxCwrbe+MYEQeeHxF3Mspza2q6vvV+CfFsfAYiU083Sg7qzdak/RqrrNSRB9BtMjuV5NTCw//z8nyqEPha0n6c04OiR3E+YzB/vYJRE++2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813436; c=relaxed/simple;
	bh=EPmeZ+AxYQt1ZQC0Ek7FvFMD0viWXbKOiFp56gi1mFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ltJL3O2D0l4SixXxoYwfpiEMluk07kYVR/sAUe9t3S8y8e7opDq0lcoIFtmAwY6pC1f8gxSs7e79ay7E1e0zV3TuUbfP/YwujYlNe2Pc6fYVbeUc9sdrS6YI1Ce0csqvBgS43TFMnM3hEKnpurr7cX3ScnKcJS8W5WVgpaySvUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/JZFB2B; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/JZFB2B"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so1016654e87.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813432; x=1759418232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7v32IEPJq83+rFpTKepQApZcwbjn1LGuorJ9QJ5gMjI=;
        b=Q/JZFB2B44LW9tjPDCl1P2qkDWE0FAWKsTHg8QO5LdQDcyLWVQHqIyO/2DwOtaRxdz
         qFWwvuYuDHTKXmmWwP5P3RQC2V2o9Muty0UootUvIqMMJIaP3DOaPygjc3tQ4iYEI75d
         Q0h1SgsIdXarBU0crCVfb+ZG0YPwOEeR6VjuHK2PmgQGryN9uYon4xCPVJ5Ov9/gRu07
         6ZSDBpkIvnIo6PC1tXZVINbWOTis8SFTTD7zfPJKF9gEN878P6wnJSyWbPl0lQtRu3Nj
         1pdmmlugPx8HyOwOC3BQZ4XhpiDA0W5xHcoL4cyspihjIcT72a6gnlLP0UP4X9PYD7+A
         X0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813432; x=1759418232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7v32IEPJq83+rFpTKepQApZcwbjn1LGuorJ9QJ5gMjI=;
        b=o81FpydT1M5abKtV3hsdpC7HGHRgTDjqeGRIvUOiO0uwRXGxQgBeAw9hv4nfFMDPxg
         caG9byyvPDCLkbaGQvn6Jg8O9usJwtwNj+urnckyhQ+GKbslduZlpYIGnJOrWJaqPS3W
         pgLPEXxFZ0PQvCzUq8vy3mkdPEXEvlXmGZ7u7B8JTHdYWsG1UU+o2F5EGu6QXd1uV9WG
         Vbv7pdV0lQLxK4dBLa5WBhUPH74qkP53prtYBwKPmhLekuKAyx8BGufyptQsyXfteQqD
         hO0nQgV4GIH559NRv4TcxN4fuFXaWQ1JBvs3C6fWBOGOlmyYTgIW0zCLqoxcTWpeD4tM
         /Avg==
X-Forwarded-Encrypted: i=1; AJvYcCXAtbE5biLulQQVmyv7W8OZYlOTOuWwmIY9Sao8mZ2IjLIvluCP2aPZZVwkJtY5G2Oiuk8wz07aTXm/a/JV@lists.linux.dev
X-Gm-Message-State: AOJu0YwOvySFhHIbZPAD+VKDkoDTn15bKkmZArdlcemEyTTSvmXmkcgZ
	4BzC3qYEN4fTh9e2KHr6iASCQYUOXro4Z+O+lNf+oGFZbCjM5n5Jl526
X-Gm-Gg: ASbGncuYmuI0nRxRHG8rAGpR2nJzLVlnirxtKhFp5zXIQhf1kEOG22J15jWdz6IvL1Y
	0/iI9JhZKtY3dMIp1mdS3iwHULh61xiteq6LQJYXKmSbtB85vBCWz4QJW+6T87IDPSJQxjHPtUL
	+b/C+U0Wq2oLzFbmHh0KjAGSyEOj7IYc2C+A4NK7EQuXUnukuxayVZf9BS9Du6GgC4V/5aqsl+O
	pfna5ijBI6zN5MXNI8KhUpEMiBKROznUF/5mzvVhQRmRmahDxY/eKj/c2+32wy+ISYISCuO5heL
	Bh7VGXe7m5mEmUEFccrfWJ+WU1pwS6u1oPc7SGa30KVU2IbeSUmQWIGYftbxF05VeXkHtZ0ms3o
	P0SV/5GqyOW2ODQ==
X-Google-Smtp-Source: AGHT+IE3EnxRGgkHHyis8Weimvr/QO/NiYq/0dZgZmiN2yuGCI3D2oO1tpnAY+bLbNeA0ytCv5wrfw==
X-Received: by 2002:a05:6512:3a93:b0:55f:3ae4:fe57 with SMTP id 2adb3069b0e04-58306abf6a1mr938344e87.20.1758813431368;
        Thu, 25 Sep 2025 08:17:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 00/22] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Thu, 25 Sep 2025 18:16:26 +0300
Message-ID: <20250925151648.79510-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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
---

Svyatoslav Ryhel (22):
  clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and
    Tegra114
  dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
  clk: tegra30: add CSI pad clock gates
  dt-bindings: display: tegra: document Tegra30 VI and VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: csi: move CSI helpers to header
  gpu: host1x: convert MIPI to use operation function pointers
  staging: media: tegra-video: vi: improve logic of source requesting
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
  arm64: tegra: move avdd-dsi-csi-supply into CSI node
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: simplify format align
    calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI nodes for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 +++
 .../display/tegra/nvidia,tegra20-vi.yaml      |  19 +-
 .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
 drivers/clk/tegra/clk-tegra114.c              |   7 +-
 drivers/clk/tegra/clk-tegra20.c               |  20 +-
 drivers/clk/tegra/clk-tegra30.c               |  21 +-
 drivers/gpu/drm/tegra/dsi.c                   |   1 +
 drivers/gpu/host1x/Makefile                   |   1 +
 drivers/gpu/host1x/dev.c                      |   2 +
 drivers/gpu/host1x/dev.h                      |   2 +
 drivers/gpu/host1x/mipi.c                     | 501 +----------
 drivers/gpu/host1x/tegra114-mipi.c            | 483 ++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra20.c       |   7 +
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  66 +-
 drivers/staging/media/tegra-video/csi.h       |  16 +
 drivers/staging/media/tegra-video/tegra20.c   | 828 +++++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  56 +-
 drivers/staging/media/tegra-video/vi.h        |   9 +-
 drivers/staging/media/tegra-video/video.c     |   8 +-
 drivers/staging/media/tegra-video/vip.c       |   4 +-
 include/dt-bindings/clock/tegra30-car.h       |   3 +-
 include/linux/host1x.h                        |  10 -
 include/linux/tegra-mipi-cal.h                |  56 ++
 28 files changed, 1648 insertions(+), 668 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.48.1

