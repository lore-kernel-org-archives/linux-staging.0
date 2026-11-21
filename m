Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267969;
	b=0fLiq+0Am8zBEeLMN5mPtB8NtQKAcK+yvs7J4GY00/UdoAXVQp2RrejWRBTeVk/QenmU
	 9lbODZ+nT1UgVT4k82k/nHiEs4j0NAvEp+HOEtgSmvp21P/1v6vSBUYyVRnif/ioYKaT8
	 eqHOK5qicAZkuQV0Zrw9BaYrxhbZ1z0gbEuuHUPgm5AwLfPKOr3LAQBaBjBpp/HoVLkf4
	 6EJU4itEn93+XAVwSW2PE9BYoKgw6GncmEG8TUsoVR6b0HJU8l6tcltBuhVrXMcucoMT9
	 bZdj+Ea35vsf2y8BTQ5qG7yYmT4WWWEwnV4zJV9eCDTj7JBOuP636LmGmw9nn47BkxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
	b=KNAg2Wl3uU26JT+oCjll3Y6Uh4/cEBxH4mKnXyo490JpoQqJAXK4d/u5eGd9nEHGSKPf
	 6WE6WDpCjXhYG7Uk3ntW65W7SNp3VlnxvY4s4rF383vVqexVwA4enyyAC+5P/7SarMEBs
	 CEBhCxTWhfDS8j9IAyMG692RH6uXYXtWkcP5K6g/jw5fgXi6ykBh61n5RKNJOFsZKplvX
	 t7je/VEd5xNF7rJkyNuJorA5clL1IFX2s6UmuyZ76S+b62+W09WzLHuHa+l5XB/S3fp+C
	 /h8Bzq03DLnsKqyUwfxTX90hto/Z0302vGyCmvAMfKxW6T4rW9uMv4l8Cud0q8WMezw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8oKdrt7;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F47A606A33D
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F47A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8oKdrt7
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so22227355e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267967; x=1795872767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
        b=Z8oKdrt7tz65NnPZB7vaHH8oJ294jNj0+IpfHqgo5QDK/NH0zoyvj8bzk1qbo2e9e3
         Yh/UpNeua95cZS4PoFJOA4k6Dtpxfe0fIctkJd+yI5Uf9FkyA7Fws/ybDIxoD2XcwuJf
         3Zl/aN9m2Moj+zCJT2epgtoVDRKJc4BrdJAa7BAYPjLoFxlLfqXyu5RshAjvUpuWUhpS
         WlPbEK/PmMI41TfUvFNI0k57VA7X+rvQ/ZIaYmCWufi1GhaVney6uTRfpdyApjJDLKwT
         tGtDoNO1rdEksuI1GWxBIQ4A+j4ghSLQIRBXaV+6Zy4V3DOvd8GrMOP49wGLedUkRzO6
         Q2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267967; x=1795872767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBWQYF06RzN0Kc5fo+W7LuMAcoYlzyHt2HwcS4GXu/s=;
        b=E4lbNLAQFaVjPdpwn0mO3GbPi5vHGEutCSCT2jZdpYMACmQjSSITvekHJv3ulLa+ub
         zGq3+B3jCjem3XqebLUKtH2IJg5T/HStwvdJZzHnuZDjnrVY0GoyjNLgjEbRcfHAYKqe
         tMZU1/VceOxKJQYEzfWa0b/sQFwSpGHaluAv5i/Yy8Jsds4SH1ilxW/gfIO2qqrLFHfL
         i61/14iOjMxmUcOUxBgvDRAclQH33nmK1xZCrdXuklVq15xSkbO7TrXtL//7YBXfy7Pb
         TWYmvs1j7kNbzT0edFkgIyOclyk8q5qxn4/AIaqInG8aynYryzeUQdjOJiYnkKBPBHcY
         KHYQ==
X-Forwarded-Encrypted: i=1; AL+hErGF7Aguk2DNjWO0pMdfiQo1wa1jilJkyxq4PmIjycqrBFdG0CuE9V7JS+7K8U4z1PgMBTMHflQOs5WCl7cM@lists.linux.dev
X-Gm-Message-State: APuU4Z81GTJq5RCFZ6s3jbw4dzkpQmsr4sVRRB8ldOEvJcJ8RTC4+uRo
	MqVk9E2kwjp1L2IBXfb5VbTOHK4Rp4BeUkIIyTTZUh+b4fTSmoBqokYk
X-Gm-Gg: AZFdTZe4Gh/REyTvWDNfoseD9tWmIjRXp6BIIu1mQ7mkJb1Zt+ol/nu583pd4LilahA
	6xO5bMCXriX5uKYJV2rIbjc3c77E2W1trPEleKtYA2FcsMhxs3Wy/KpKF7w78ewKXINyGSvp5fJ
	xGl4AhFogG00POYoscxT8FeKsDoaRZQ2NcaVPrbXEYTBjtLwdsK4Zql+zxdaeIfNVWfHLVzct99
	124/nN4T2aK96G6+YdMdojkslZgpjGdxYNkeN2a59q1Y68DwaIKetHJMQ+xB22viso8bv44rEFt
	6Jo0Jd3iHERD417UyvlIYpJSjJCux5T6TU8XrL5FvPeHvH6Nh1TAP2ImWWltNEEQt5wfMOfoSC0
	LipJouGLufpUaFBHFwfjYt5iyxPFr7lSPothi/GzAwLYq+ORhz3JF8YKAOkq6q8inAgRf1iqgEr
	hbzojr2/yI5pae96lRaZHmn21SvqOeHujCEbLb2FVmbTsT+lUiVtjtXfSw1urf6nlckUTIZz1en
	iJ+cVdyIULkqkx30jTJwEhrOszTi2SwI66Twgw+AmqOt1o33cIWy2G6t6DqzvNuDZePVq7DMRmY
	2AFn0DyDu+p6rVzhwOUWFlj/fOXI0GwT4si/uMWdTr0Lixtm4qg/5RVnXB3m6TKzPyQ6WVQF4ES
	BwvB0TbErmlZc
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr132597455e9.9.1795267967020;
        Sat, 21 Nov 2026 05:32:47 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:46 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 00/14] media: Add Lenovo Yoga Book camera support
Date: Sat, 21 Nov 2026 14:31:30 +0100
Message-ID: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add front and rear camera support for the Lenovo Yoga Book X91L.
The front sensor is OV2740 and the rear sensor is OV8858 with a
WV517S focus actuator. AtomISP ISP2401 can capture RAW Bayer from
both cameras.

This review series is based on media-next. Apply David Heidelberg's
posted V4L2 subdevice release fix first. The prerequisite patch ID
below identifies that patch. WV517S needs it before the V4L2 core
can release the actuator's final reference.

Changes since v10:

- Drop the upstream ACPI initializer and INT3477 ID changes. Reuse
  the existing rear IPU bridge entry and shared Cherry Trail PCI ID.
- Limit OV8858 19.2 MHz support to four-lane R2A. Carry the 2014
  Intel OV8858 notice and record the sources of the register table.
- Drop the per-component white-balance controls from both sensors.
- Use div64_s64() for CSI-2 timing and make AtomISP RAW negotiation
  and enumeration follow the sensor's advertised formats.
- Defer WV517S I/O until use and hold its state through final release.
  Preserve existing camera nodes if registration of a new node fails.
- Keep the OV2740 probe retry as a separate diagnostic patch. The
  cold-boot logs did not show a natural I2C failure or recovery.

The revised sources built the full x86-64 image and modules. The
focused Sparse checks, i386 AtomISP object link and WV517S build
with CONFIG_PM disabled also passed.
The mocked registration test reproduced the previous rollback and
verified that existing nodes survive each simulated failure. The
format and notifier fixtures also passed.

On the X91L, the exact revised 7.4 image bound both sensors and
WV517S at boot. Each camera delivered 30 distinct RAW and 20
distinct Preview YU12 frames before and after lens rebind. The
capture and sensor nodes survived rebind, focus controls worked,
and the actuator returned to runtime suspend. Physical focus
travel, 24 MHz OV8858 hardware and X91F lane configuration remain
open.

Codex drafted the rollback fix and cover text and consolidated the
previously tested follow-ups. Individual commits describe its role.

v10: https://lore.kernel.org/linux-media/20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com/T/
V4L2 prerequisite: https://lore.kernel.org/r/20260917-v4l2-release-fix-v1-1-acbac7f9b78e@ixit.cz/

With Best Regards,
Maurizio Casciano

Maurizio Casciano (14):
  media: v4l2-core: Preserve existing subdevice nodes on rollback
  media: ov8858: Extract digital gain programming
  media: ov8858: Support a 19.2 MHz input clock on four-lane R2A
  media: ov2740: Add OVTI2740 ACPI ID
  media: intel: ipu-bridge: Add the Yoga Book OVTI2740 entry
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: select OV2740 frequency by IPU ID
  media: atomisp: Derive CSI-2 timing from the sensor link frequency
  media: ov2740: release group hold after gain write errors
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: Allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver
  media: atomisp: Preserve the capture graph when a lens rebinds

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    |  65 +++-
 drivers/media/i2c/ov8858.c                    | 172 +++++++---
 drivers/media/i2c/wv517s.c                    | 320 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   9 +
 drivers/media/v4l2-core/v4l2-device.c         |  26 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 103 +++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  24 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  36 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 117 +++++--
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/v4l2-device.h                   |   3 +
 16 files changed, 748 insertions(+), 153 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: ccf78740d63813c452c035b57d17a650492562fa
prerequisite-patch-id: def08de8e36aa31f6d2360428b29f6b0f4c8e1c8
-- 
2.53.0

