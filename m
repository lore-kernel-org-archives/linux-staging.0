Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997534B691
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142887; cv=none; b=NdcnpFEuhlTnioe05ZsW1jOuM58MyZD6h8E+lYLcYsxlQ9RiPGlUnw3zl720wJGphwsLob0bDZen5bF1boiNP8R/+EsCogmWaUbL0TrmE7gzu/f75TS72kQl4xizwDFhUDa1nw31t9pheCj3EPFGrKFBLdFa+iKZCpx3rIt78g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142887; c=relaxed/simple;
	bh=F4SZ1baug0sKLNcK5yOAX/0o6/XwYc3DKBWTYRocoIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AiZewqe4kDzNkATM1i1wbXOkR5qhIAsIj5u0KmoFi4dlhmf5iBKSpxD2vAouYyk3fSbm16ePLv4YwWH6f/hXe1ya1hfTQY/2rMmJvtGLRkN+M4z8VG2k3JZa7NSu1UfS7807y8umSO61+/sKMoOzr2Cte7U6ZnTudo+I/eAf2hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6kPpk9i; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6kPpk9i"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso672982f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142883; x=1761747683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1avBMUdXWZmaUoFxmEEoaqQEQTtmqca+2N7SyFudkqM=;
        b=k6kPpk9iIgcew4dVo6xsXmccNkzAtyFemXaHgwlS64hncq6Ab4tEshKYZUh3gNrnC8
         j3jdD3VTD5VlJJFSnaW1p32pUBqeJiL0Crr066L0/bv7BYYTvgJaSz4PpIhmfpybmKbR
         mdteI0UKdcWMG1eWOyB1/+2P6X/X4CBu9EdM122vU8GFDtu0qtFGJCbuhfe2EfivLgsi
         IurGpqRxR4c/Wcb4RvR0phFyvm3eSUtcsCh3bRW0y92iHDSXEnvweervPIDoo55fMosy
         WGgsnnFNyOEBovc9alOHwPGw0ucJvTPA6bqrO8xZTPJYyc+BpRd+rE9R49LaTYhfpqQL
         bj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142883; x=1761747683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1avBMUdXWZmaUoFxmEEoaqQEQTtmqca+2N7SyFudkqM=;
        b=Kn4SPvhIjG6MmHmBDi8AeUtwPkJRM+A41+inz4eCk/YPEztbIpqjBf5T4Frp4vYFWf
         GBFayTem7jgbSPpWJA3WdQtJ6q/eYXhpsP2Z7P9yWSAD2lZ+Uf15OUR/Iyfs7jpoBgiN
         BobRuPrPoghvtkWWEsOhBT4hvaUx7L55s8ubN7pi6iIBCJQD+aNQhRO+fvPTa+NkMQ7l
         ehr+8u7bvT+F8f2mUdibaKZn2P6S3QF0XviRfYUkjPO32cGsvfYvVgp3/Anhj9+JIs93
         5qQwEBa9PdlKS+vfBZYefeuGnHnbtNYaTK3YS4ydOfgO3pVPY7d6OGffr3jo4BFGQmd+
         jCug==
X-Forwarded-Encrypted: i=1; AJvYcCW6OrhAa44BDSmOp86pUOTvBCfdt7QS2qniWZU+214mTquFnx9cfC6S9anRXMhh376U0xvl4QxOtqM8eQVt@lists.linux.dev
X-Gm-Message-State: AOJu0YydH598KbbYedyHIyWpn/eYB2MH010BQwCd32zhm74otl5rdLdS
	NYm+q/miBkzEohLdSFyv7QFXgb+BqVd/0qsYmb/HoMFB1BPjbua6ksoU
X-Gm-Gg: ASbGncswRnpd2bEYLwjhesPKiRm1e1WNv9mgJVAfdzA6coSoxH58eVbOYLN1hokqeRY
	Czx1Tv4aUmO1v2MBdHqNMko9Mz+VGSH+vAl2dBErNoiwwlvl7+XjSm8EbvGFDoK6U0miKc1CVJd
	BMzJfa1trLFAqIN1gBUcRIimelYRxgSO8coUNgecdeZscudwV3oilxy5XsyAE3+j4YTViTwqe7o
	M//IkrjnTVCW1FFyFrvPW0Vew80/t1Q44ebqHdEfcR3YWTBnWrQjUHQ0euj4bDCyynSvhecK4J4
	UCEeyOqzFDsFOd68FFvUXWtAJyP+n+j4Jk5c2zf0rnWHI6sEp6u4e7Agxdf4snh9MkYKgbCpyrB
	bCJEWU6yHfxvVdzvFZR31ReVho6OAv63+FKKCZ/MVby0GchzBBY0J3QhuNO19keloKqY=
X-Google-Smtp-Source: AGHT+IHhr40J7G357dorY7Ys4aV/f4VaCpjaK0a7rQ8N7yN/NLKDGy/LC+abGelcIoYIH1Dx+M00ng==
X-Received: by 2002:a05:6000:2c01:b0:401:2cbf:ccad with SMTP id ffacd0b85a97d-42856a6ac39mr1320405f8f.17.1761142882543;
        Wed, 22 Oct 2025 07:21:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Wed, 22 Oct 2025 17:20:28 +0300
Message-ID: <20251022142051.70400-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (23):
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
  dt-bindings: display: tegra: document Tegra132 MIPI calibration device
  staging: media: tegra-video: vi: improve logic of source requesting
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
  arm64: tegra: move avdd-dsi-csi-supply into CSI node
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
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI nodes for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra114-mipi.yaml   |   1 +
 .../display/tegra/nvidia,tegra20-csi.yaml     | 138 +++
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
 drivers/gpu/host1x/mipi.c                     | 525 ++---------
 drivers/gpu/host1x/tegra114-mipi.c            | 483 +++++++++++
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  70 +-
 drivers/staging/media/tegra-video/csi.h       |  16 +
 drivers/staging/media/tegra-video/tegra20.c   | 820 +++++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  56 +-
 drivers/staging/media/tegra-video/vi.h        |   6 +-
 drivers/staging/media/tegra-video/video.c     |   8 +-
 drivers/staging/media/tegra-video/vip.c       |   4 +-
 include/dt-bindings/clock/tegra30-car.h       |   3 +-
 include/linux/host1x.h                        |  10 -
 include/linux/tegra-mipi-cal.h                |  57 ++
 26 files changed, 1657 insertions(+), 670 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.48.1

