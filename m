Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851526;
	b=za62FGG53R9pGuaFSjihIKybJGTDGKJKOVaMeFWJ/UuQUMfFw3BPbme9yVNgIKlpKox/
	 27OoD5H87Noul2di4J8f3BwhpfFj9TvkW9oMAiF+hifgCBKvzWwoGbwdplORpJw576DzK
	 V+9aGR0ldBGUUijFtHYfWmKMZCUayv36MJOCIQk0dArh2x7LY7NEMt3LmnjqFcRmYesgV
	 6BafVMAXwSXRML9QG9dI8Uzcb/hKXs+YTyuEkJUFL7oWe9/Zt5d3m3S4I7EBCBhZITGdZ
	 hBKMb1SOmcMA/p1+34p3YPxTfXrwATMKrNWLFrUY6PLo6Aoa68VAyIZrsmOM7hjCC2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
	b=NtysfFoJDoeEZQQaJhlSehm+tbtP6R2Ygs5Vs8DHO0N9MnMopB4nXfgIR4gwj1zFMBOh
	 /lyjiifWmuRh1dKD7WbU5SWNlQuLoYatJadMM4kYzLmRI/mcjiVkmCMJ/zJ9AKh3V9okm
	 JCNl0nJpdv0eDJRXktg6bYBaiDjVsojLU5mizf0jt3IQ+0ytTp4kVMaQYfmdYBzSjZTCe
	 cN0p2SNApDgaEHX5VduxOWh20p/GdENg6npbX4MhVBkMWhnAKY0Bo3iCRjf0RUdK87Lu5
	 DtrHorpeW0jB2kWeinYYqWXSo47/4GFRxK1M165Wk1LBM0YN9C7FUyw7T5NisABSJ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krXkfYHZ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD0A606A896
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD0A606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krXkfYHZ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so29782595e9.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851522; x=1795456322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
        b=krXkfYHZAhyYw4GMatshlU2NgdC9tuZQiJgG1KQmJd/SJHhE0U6Q8zJ/xv35nQ2v6R
         EcxlBjGfu+oB/3MLTS7GvMLZhw8dxmp8sdbZxa9SVhG3nOUL33wIMoBlM2FqqhiDNLs+
         ZpSSnquxBvhmsa/4Qbeb469OaeSI0cvaSzi+egfB9W/yco3wFH2aAyFBIDkSJ29diJLe
         pS23TR8aKyZLdf0iaaSByBZD1FJ29zL49V4rwd5I/PaI29CU7L+9KM65N3ciOqsRckcE
         7pZe1nALRxESzVM1gIixarNs69w5fFGx47SlDM77l4UzMyl2T83RJYHuFjK7cuEb+dsd
         /9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851522; x=1795456322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
        b=p2U31UWciHwsAS8rTISjgKNOkEGPrs3+FG5UkRnO88x2/8hPVgtpkwnHvZl+qK9g7D
         MrwCgHEdK7IhA5rKTwGI/m/8TbfS91afq/3utODbJHIaVP3RwR8qdzRG/xPqa1hLe088
         DPJErq8OWteSs5RnZYck086M9YqyMAHNUf5ZZqS/JluFZG6OxpH7u/DOqTuIqcAVJeGG
         VxAdJsSRlxnKhPc9eNiRRZCAQvOTxpe4yIuEqHAAz48LrG12HBExbcp/NciFxzoQg62F
         wRrDj99Dv4j7XeINgtPO96IF0DMaCilT7S6X/RK632TaT8ADoHim03nMPEkt+F+RcIFp
         ZFwg==
X-Forwarded-Encrypted: i=1; AL+hErGga+48IysvbLcddqDEek2RqM9FkVZnJBT45VK9CF5FcIwDlKhARls4lkb8NHKJveu2wsNh+1CxuSBo1cVI@lists.linux.dev
X-Gm-Message-State: APuU4Z8V/vF4MSTRltGaw5HsRYBeOWImpT/G5MMH9/bZnh0RwiGS9s0X
	mzzLmqdk3LfKVaWPT/lfosFOZ6N4ORQT6qG0Z4eXRZanDWjp3XcF5tJM
X-Gm-Gg: AYBFou1o4oP/y4kydPtfiUFZQSfGbGGXmGFE2WQ0vRGzh2QRTu9NYuhKICuoekLXBU0
	jKYpnwzApzash5J2bBSTTNf15Stu/3rnc/t6lYI+6J+vBrnwzyMSzIcL+XwP4mTib1pHNxEeIRd
	r92JjlPi3QPzZ7g4+qa+fVF4mEwyNX4ge8jjJJfkT6kgwRPoeWwHHeaj7GGyosKb4Rn8wFmLmsM
	Pk5FqKln2LnpaI2x9xNHaugcq87cqJVk2O6pqF9uNY50FZ6Eu6LMTiXpbC3fwGmk/tuaSZvQ1SY
	VlexEUX5+QbfgmrLKeEK/+BXlxaQjRiYN9b5vGgsGdQ9zla7Ow3C2+1Opwhb4j+dvZBK6eZ1x46
	+PbK0Lhk8IJTrnaUkd/h54Jn+H+C0kmJ6pcjzc/Cnkl4Ub0IgdttCFwOYaCllsuuhOY8WaGj1yb
	aYarswXhqQ4SDzlzL0m5XJibg/jxvqoZ6h4RsbyySQN3yvZ0wAVeMwoTi1cw1/vQOZ5HeyBjMvn
	Xf6Vdk1Lj8EGHkCJCz+04nZLVJArRECPYvyYAhhpm/O2UvKSsgZYhLFniFCQXt181PYriozk4FN
	u+MZJl7L6frfpUIodJaGUxUD77EwGzmQ//3poXic9Xzvi9eUR13jC222Og1qg192gWs=
X-Received: by 2002:a05:600c:3d91:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb686166e8mr143043725e9.21.1794851522066;
        Mon, 16 Nov 2026 09:52:02 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:01 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 0/3] media: Add Sony IMX175 sensor driver (Lenovo ThinkPad 10 rear camera)
Date: Mon, 16 Nov 2026 17:51:48 +0000
Message-ID: <20261116175151.20150-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for the Sony IMX175 8 Mpixel raw sensor, the
rear camera of the Lenovo ThinkPad 10 (20C1/20C3, Bay Trail), using the
atomisp driver through its v4l2-async csi2-bridge path:

1. a new standard sensor driver, drivers/media/i2c/imx175.c;
2. the INTCF1A ACPI HID in ipu-bridge;
3. a 4-lane sensor config entry for INTCF1A in the atomisp csi2-bridge.

Notes for testing on this machine:

- The firmware exposes the ISP in "ACPI mode" by default (subdevice of
  the IGD), which atomisp does not support. The hidden BIOS setup option
  "ISP PCI Device Selection" (Setup variable offset 0x235, value 2 =
  "ISP PCI Device as B0D3F0") must be set for the ISP to appear as PCI
  device 00:03.0.
- The IMX175 probe fails intermittently at boot (-EREMOTEIO) without
  "media: atomisp: csi2-bridge: Don't cycle the PMC clock if its rate is
  correct", sent separately [1]. With it, the probe succeeded on 10 out
  of 10 boots in my testing; without it on 8 out of 10.
- The OV2722 front camera of the same machine needs "media: atomisp:
  ov2722: Report SGRBG10 consistently as media bus code", also sent
  separately [2], but is not otherwise related to this series.

[1] https://lore.kernel.org/linux-media/20261116173307.14169-1-volodymyrchapman@gmail.com/
[2] https://lore.kernel.org/linux-media/20261116173143.13584-1-volodymyrchapman@gmail.com/

Testing, on a media.git next kernel (3fc9303dba01) with this series and
the two patches above, on a ThinkPad 10 20C3 (Atom Z3795):
- the binned 1640x1232 mode streams through atomisp, alternating with
  the front camera; the full 3280x2464 mode was tested as a still
  capture, as atomisp limits continuous capture to 1920 pixels wide;
- the sensor's colour bar test pattern and real scenes have the correct
  colours, also with horizontal and vertical flip;
- v4l2-compliance 1.32.0 on the IMX175 sub-device: 46 tests, 0 failures,
  0 warnings.

Not supported: the voice coil motor (the firmware does not name its
type) and the LM3554 flash.

No DT binding is added, as the sensor is only known to be used on ACPI
systems; one can be added when a DT user appears.

This series was developed with the help of an AI coding assistant
(Claude), which wrote most of the driver code and commit messages based
on Intel's register tables, existing sensor drivers and my testing on
the hardware. I have reviewed the series and tested it as described
above.

Volodymyr Chapman (3):
  media: i2c: Add Sony IMX175 sensor driver
  media: ipu-bridge: Add Sony IMX175 (INTCF1A)
  media: atomisp: csi2-bridge: Add IMX175 sensor config

 MAINTAINERS                                   |   7 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx175.c                    | 797 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
 6 files changed, 818 insertions(+)
 create mode 100644 drivers/media/i2c/imx175.c


base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

