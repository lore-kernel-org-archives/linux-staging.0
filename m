Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D837E312
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777398; cv=none; b=tYgbOi9rz/lnw+6AlGY+5+jxP+21GDdvBuP5YxgH6R411j9DY/wcVlPXAM9OJdAnxyPPZDQEQDSCjDAculv5zyJ2v2ek4Ft6dl7946wDvgCeYpXIU5sLePUBiFhdUA6L6hF+/2l2I/4TpH28s+SBCOwVjAHtDd5r8SoUstfcoE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777398; c=relaxed/simple;
	bh=HoHrBtYNXY/SaE9OzlXfq5/j1Mx321YZxOI1YdRsAkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RXCj1ouRq3YJ6k4KDBGU+MEgJ6WlNEWAQ32yxRfasC96dWke/tHpce3+czrqXsysyX7RsDHljhXr9/Ci9T2dTqYBmgJs/gnCPKH8rCUFGFhP4lIYb2U7b1v3B9xhWqFQBkHJ7bQ0NXYX95ceRHJmLpUs7JfV283E2P14Ji0Q6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dV8v6uyW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dV8v6uyW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-435a517be33so1344653f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777395; x=1770382195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5acCy6OTSjM6pJSucEyPYN85YsF77rdFjU9Wvmbua0=;
        b=dV8v6uyW90cmAvuLlJUPCPCXnaMYKr7wt68O3VfcCA3LlK3Mh/85X8JrA0dRoQfrc0
         vv76gFkxgk1YhnHJzEk3TtluaxRgbfEJ7PT7S9kSEOJQz0innMrEPWA/Sgi52Yf7zytu
         yob3/IxcZkB9BN/EJfcAwuJmF814TWTd/gwaLzTQhfeaIwPaeWhRj0F9Jk4LcqkgYmwO
         leOHXy0A3YuGS69BjplvhYxATg0zbsDYAk2u0sQNh7h8chJ6CHW8DoZp28ZzdxphVWF2
         4NwjA4NbzQYn0vQ+M6HYk2BSIy0k0YSukp7tLiAjsTIbeFTxJRJf8To6l2FvtwK83HnZ
         NxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777395; x=1770382195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5acCy6OTSjM6pJSucEyPYN85YsF77rdFjU9Wvmbua0=;
        b=Q+G5oXMgUeA5C0fMmApwM79cfe9YVZ08vKP2BIAb7935pEEFkykZTu0Vgrhiu2ndWd
         g2Oe36Arwhv8bVCU8SEwsrZvkMkTb7Kt8xVaGxTOsXJQwXJS4TJEAku6/ziIRyri0J21
         ePrAmyTB65nRixxr7I3J/myRHYBYyNxLVPR54XIPN1GjK6gYIKEPbREpJcmvlk7XCBtF
         NmmntfDaOe9KjguOhQDgbwLWrQ5erwt+Ou7t+bojrPZ3GNkstR/3VYfZ9ff6b+n6/pqy
         en3p2I6Kc13UVUHm2+8Tnzs7BrVdro1dMexiOAeMrof/Y1saGy1axN6zqy+mEO0h5sGv
         Xu+A==
X-Forwarded-Encrypted: i=1; AJvYcCVPrEnJSMmM3j++w3SN4P4FJua0tF3TDQ+/ni2f6erb8WRO0Poeh5YSlzEC255dUXn6EQ6oDC3vYCLU6ZZC@lists.linux.dev
X-Gm-Message-State: AOJu0YwjmGS/yXE7ArtNrstEk7siThDDMNJjf+kE4t6h6h0AMmpCRQF/
	GUl2rd2HVnMRFiplPzMio0jNyx3+p1icPonCfKVf0bH84VRWfqlwH7sc
X-Gm-Gg: AZuq6aLkTplNlmL1p2tJ9U4X2yC9+8u3WR57RMDJFNlh2rZu0hhC9vX0uvXraG57oSD
	zwoFAPdK2AtSSn44dJuA8APWCrntytgJU+o7at0yZzjOdG7E4nT9/m9Tz44ydSqonU6S5lwomN8
	w8Ftf4BDO6eeZHzsZzEphC2aG1Ky6yzbZalAy9M70FPuWd1QbBWGgVv0i4zPw9Ccpc2Yauo0odF
	If4oM0A+eKOWaYAKvutGZgIfSP9FrmoM50rpIHqOI/7i5S+TyCo0dGlRWvKrNRUjC0ESIy4dnnz
	Aa5jvDnvu932je/+RK1CybgbjYWj5wzNe4XELtGeb63layjuVClr51VerPOPhW40MlGK7xRD41g
	XyLYBUAIm72hiSmZATSAde6YDSrs5HUAz04YWnYB8ycDwnvEpubEwAc+9+0+ZSFcxs9UKqr7CJF
	qp
X-Received: by 2002:a05:6000:2404:b0:430:8583:d189 with SMTP id ffacd0b85a97d-435f3aa928amr4307852f8f.39.1769777394637;
        Fri, 30 Jan 2026 04:49:54 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:54 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
Subject: [PATCH v6 00/15] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Fri, 30 Jan 2026 14:49:17 +0200
Message-ID: <20260130124932.351328-1-clamor95@gmail.com>
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
 drivers/gpu/host1x/mipi.c                   | 525 ++-----------
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
 15 files changed, 1415 insertions(+), 645 deletions(-)
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.51.0

