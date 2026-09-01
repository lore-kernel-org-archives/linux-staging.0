Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2537A488
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289484; cv=none; b=HtHEnuDr+nLAqZbIsCuqlRtvK3ZaTFq9QrlBwBn9DrcQd4MTuDnpLL1yLasrdcrMb7D8xyPTE7ci5X6m5KoaJVnrb3Qv10rBcwmSmPuB/hlvDoqpVc5D547cp1bIWiOB6v1B76eTbunTrFrN0oixxCol/TIAGncKPG6LMEIE6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289484; c=relaxed/simple;
	bh=gzIQy72QBFoZIr/pfo2orqCu1axS9UAIZzvLJ4iyoVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y8ifL+keI38EM2DgZee58eOVvi1uTgYCEpIzyTR5dRpKdgU8xGq8QvDSK0pjuOF7UqSEO+sTK2MN+mDY67wGIvONJB9bJ2mNTEtAN0o83aIsurrgtde9G4AUWrSDhTW6M4yKtRRvTDEUmJ1NHABA4k9bi78AvvnblfhJ4eTZCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlGUQE6E; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlGUQE6E"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso1204655e9.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289481; x=1788894281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9fdaCTkKj4WNIMNGeorqq84Uvidoc3ziXoB8yKwkBTU=;
        b=TlGUQE6E1V3SF1mvvvZjJaLXHhMf8/nCzFZS00D26oWA8m/LsxqVX/6UG9GwBaOmnW
         Z/KzWALQ+YYk+o6X7jFUMbsv+m/Hqeiy2taPsM/AC8SSXmjnzNwonaxGZsOpxwMUdWkS
         Fb6DXzmOXD6SSXhJ9MHRESkM3F3eXEednPIEVcFZTwlaQ2joyFQqd+f4Qik9PTJvmDA2
         IHCO4M0cyWgELPeItq/GCisV9DyhdCwyP+E4airpJ60L4K0i56Ilawgz+z+JCBqjVPyP
         YON7RVklagaEyXLjl16TFyycTVRfFyXUkj/vC6tbLlZdH7jYYSaC9h2k4juRne7ew29G
         JsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289481; x=1788894281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fdaCTkKj4WNIMNGeorqq84Uvidoc3ziXoB8yKwkBTU=;
        b=RaN1dZU+ZZZhkka5NJ49rCYxj1x764s2Yo/ady1E1ZNpNaTbZIBWfP8Zm0r7kjymaS
         sebtcm0khVtGltcupP1z4GISJlx7JwHldZUsIJwFxTBH6wsbFzkxjyRZJv647pX90BAy
         SRqq90p8J5W6hH/890xBf/uaZ5puQD8Fn1rJo+NrCydej/QPOf+bRQuOrnCrHNOYDghP
         NZf3DwxMqOshinRWsETlclcSBQlfD0ZeVq9jGOBcQW4j3r1Pkt2yIjxDV4P9vXJ4XwdO
         zGQrzBGtM8ZAowuhVgC9KYjiiuezqe+OHBVeZIHPqVukrlsQo6IuCYg5riF2JJH8umtf
         lo3g==
X-Forwarded-Encrypted: i=1; AHgh+RoGOeaUxrbwgypeRecUi0B6RMktmxZLFKM5Pwymc74N2+9qEcCZorPpxSBnaf+nDbobtbruIzFzBZEiGTty@lists.linux.dev
X-Gm-Message-State: AFuF++nyS7MEJJxdj93WVb+qNKRH/VYWYttx/12rowrA0fEjI0/rK6um
	B1fZAe39fj2L3ettl9hB8/MXKqTzDQgsP/KSwKO4GxpSOl8RCFAsV8sA
X-Gm-Gg: AR+sD10vcPLKC7k1XBN+J+7lUtBMPzMnExGwEhydvOb57OyZoZY01E7pxDUQwlOHVnk
	q1voHQla66j0XlkaoLr9Pu7+CGO5neXIcR+uUUXOZr31RyCCecSPQSILT1PnBdmvio8CRyETycw
	ESuGJAynKRc9BsJqIv9XVtnImvMLYPWnq5/iZ3WTtah86ERv9M0ZDEUyGt5pXtn2PsL/4IDILyw
	Cxt3NSQGS1Y6sA+lunJE++krqnx2I++ggcdJx1m57WKaWLzCwLOsDgvcoJI/0jkMBFI5z5R/qWD
	cyCogTISc5V9TUH5KubH8OYSI1PVEbnFse5X/4DCT3V0PiHlRK4TE7YikzNHwqT2uom642OWp8j
	YJubiKB6uFWHs2hETmNLlvqdZWVhRwhBfb68ZWKmgUH9bpttMy98hXFK3p7Jo3oA9sD03Mt1nr6
	J/tul7bfGBTvy2zKDAz+PBtzTsOzSWFJkyeLHKMZJ88aDlIDEV1UXXJ8FNqAm0RMRqfVJxPadV2
	UApJeYwnRCzpM+C89fWI/OrDByWHcswRDbVJ0cOpY8XaR80Hfk9DA==
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr485874005e9.3.1788289481032;
        Tue, 01 Sep 2026 12:04:41 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:40 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/16] media: Add Yoga Book camera support
Date: Tue,  1 Sep 2026 21:04:22 +0200
Message-ID: <cover.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds the sensor, bridge, AtomISP and lens-actuator support
needed by the front and rear cameras of the Lenovo Yoga Book YB1-X91.

It covers the OV8858 19.2 MHz clock and Cherry Trail gain programming,
OV2740 288 MHz link frequency and manual white balance, firmware IDs and
IPU bridge data, AtomISP raw capture and CSI-2 timing, and the WV517S lens
actuator.

Changes in v6:
- In patch 2, replace the arithmetic MHz expressions with direct Hz
  constants, as requested by Andy Shevchenko.
- Give the supported input clocks distinct names:
  OV8858_XVCLK_FREQ_24MHZ and OV8858_XVCLK_FREQ_19_2MHZ.
- No other code changes from v5.

Validation:
- Strict checkpatch over all 16 patches: no errors or warnings.
- W=1 object build of drivers/media/i2c/ov8858.o.
- Sparse C=2 check of drivers/media/i2c/ov8858.c.
- Front and rear cameras previously validated on the Yoga Book with real
  raw Bayer capture.

Maurizio Casciano (16):
  media: ov8858: Extract digital gain programming
  media: ov8858: support 19.2 MHz clock and CHT gain setup
  media: ov2740: Use C99 initializers for ACPI IDs
  media: ov2740: Add OVTI2740 ACPI ID
  media: ov8858: Add INT3477 ACPI ID
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: ov2740: support 288 MHz link frequency
  media: intel: ipu-bridge: allow sensor-specific link frequencies
  media: atomisp: derive CSI-2 timing from sensor link frequency
  media: atomisp: provide Yoga Book OV2740 link frequency
  media: ov2740: release group hold after gain write errors
  media: ov2740: add manual white balance controls
  media: atomisp: Use struct v4l2_area for padding
  media: atomisp: allow raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 114 +++++++---
 drivers/media/i2c/ov8858.c                    | 166 ++++++++++++--
 drivers/media/i2c/wv517s.c                    | 206 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  80 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  30 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  34 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/ipu-bridge.h                    |   3 +
 15 files changed, 588 insertions(+), 110 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c

With Best Regards,
Maurizio Casciano

-- 
2.53.0
