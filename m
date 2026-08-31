Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183F35C681
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199268; cv=none; b=oUO4cM29UIhv7ebHmF7ryQpaLtO1LewG0rw2NA6XVzpPxCooBcA6jyQ+QVunVEteComqUPAXx7LaOSgesemrCglTRWjDDtPWRErQFpgMOt22SyzeCIhBpEYGM+jX5t/YX/vAHVqXKvfnXXVnZrygoInx+NE40UFjMRrNLsIgyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199268; c=relaxed/simple;
	bh=mL2Lwg9oxsZdUTlykc/2+ON97/E/5LXM0vSR6z8oHgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zn4h/oxJL4KfioJ/YzQtsfhele95FsfhYxrr2NlaiRn1zyKCBVp+3cYejNIY9AxRZ4KtvY8PLZ04Fy+YR67SX3wJ6lmrXuk8/qUMA7bRnXf8mc1jIl9Z5+E5nJcqAWRpr42eTkwrtubk68kBP5gvqfq7SXe/ztpyEtm3D7wehS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E41/UmO/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E41/UmO/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4843750de83so381021f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199265; x=1788804065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0qBzso0OAfsRTBs2l98+2UL/lhWr7wMk6D2o/FrLpA=;
        b=E41/UmO/DoI5WCNVdOS5Q5E83PAfIXFAa3ij0uyALzphhdSG484tyktfavTg2TgamG
         ej2r8ASE2F1ZWELp+maaSWP7BVqon42dMIHc49cmWyXIaDrRaMb1vN2VvIxTaLEAjqE9
         evEDNtjwj1T8wFgkWgtStmU3774xED/AzuasKMRWcp/28/gOPWr9CYVVxTA2odTh3EwN
         AFUyfS3lFfIVkSvfafhX5P9mUhA+QcBPf+OpcGgJx6T7QZURWOvMzb/cqdlS7W5eDzg+
         I8CefzBfXd7jHHpNlcMVB91Oc5kttomhwEF8Vx8+DZVflZb7RGNg8R0fxff58vKYbnou
         +sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199265; x=1788804065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+0qBzso0OAfsRTBs2l98+2UL/lhWr7wMk6D2o/FrLpA=;
        b=h5gR6adjuNRTOwRnzLviZsHf9ogKepDXVLBkPAEB37jzntJ5HRAoIg0nUchufdVQPP
         5SliN931qRhFBXqxLcA15yDSzQMHkhX9t6T61DeuZSS1FTII/Uqpk9Ske3vfx7MvNLIG
         SKDdX8qKnS6HyPnq/K4DbHJ8PoaNJlD9n9rEcV4iJ9G6R/XbiUkakSrPgx2gJBPyUfYi
         x4XpyUVszVDsJswAUkqU380jj5GKU0D872jcs5fv9U7CfU8uJi0Xh2+2UFxuLI5XKpK9
         tfiiYOM6gApKRkGf2zDSW/D//amBGRtTFsrqS0anbft8/AhNzwMGKJ2M9cCnbguMG/Yt
         3F5w==
X-Forwarded-Encrypted: i=1; AKwUvByBDCl23GcTN6cy0adAQclb3H1brUWkbswcd5kVYtkuVY/ANjPF7V4EKtFF0RkYGth36aNPWaxHijFzsYmv@lists.linux.dev
X-Gm-Message-State: AFuF++mHH4pqudg42PNljkGP1Eco/Y66vKdRwCiRdtSQaoLKy5ZVD4dA
	T3KSPb2CAw3CybD2pLXcG8XsB57w65JuIFbIiEwwpnTNnYn5RqdlpC01
X-Gm-Gg: AYBFou1M2ZzYocTWXvbr9RF+zJrwlmkVbV8/RN3p3frMoYqCLCwTRDmkqGz/gxchJTZ
	CeGYgvNmsL2Tp2lJfar5HEJVA7kn8ScLO2PL6qwUasYxhYsAG4P+19OkiAUCnBz4MAMo1atgQ+j
	Rh8k8XcBtlijFSkAUW7BKriLVzUAHdMDkGceczwHBzrgyMA6199hy+xYpknwlM4OiqWi+o3JmqJ
	r8QkI3kls15fkPoPA74ROaytB9uwN0dzPDTTBaLDDHz390UZv0ydZZ6p/2UJAnW1k4Fp4HTPnYY
	ztaAxcCmKe319yrwMqmvx7R8EntlCsZKCP/xqp4x70b6yI6qHPxhheaQ0rlFLKXCx1LiC6OVEJ4
	JZRfJdYYP/A1fDlNSSi2T+Fl9f/AjJ+kLCBLM5gLaXBn2sdVvsO1jworaLMl9N5NkMWWhWfoC4b
	5JUV47edcWzJnGSAhY2Tajm6PVE5EP5KHDBgdjHDhKGfZy5jwRB9ZggB8utRR1f39Yp+2BQ5f++
	1fUoQ0xtbcGGI8idrlLpjIhLVbCqTmWR9fvpe/XCyQ=
X-Received: by 2002:a5d:6e58:0:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-4844101e5cfmr3872253f8f.20.1788199264958;
        Mon, 31 Aug 2026 11:01:04 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:04 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 00/16] media: Add Lenovo Yoga Book YB1-X91 camera support
Date: Mon, 31 Aug 2026 20:00:45 +0200
Message-ID: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L exposes an OV2740 front sensor and an
OV8858 rear sensor through the Cherry Trail AtomISP. Its firmware does
not provide enough information for the existing sensor and IPU bridge
drivers to construct the complete camera links.

Add the ACPI IDs and bridge data, describe both AtomISP camera links,
support the Yoga Book sensor clocks and modes, expose raw Bayer capture,
add per-channel white-balance controls, and add the WV517S rear-camera
lens actuator.

Raw capture is selected through the normal V4L2 raw pixel formats. There
is no module parameter or separate private ABI. Raw formats expose the
complete sensor transport frame required by the ISP2401 copy pipeline;
selecting a smaller crop remains a userspace decision.

Changes since v4:

- retain the HZ_PER_MHZ conversions requested during review, including
  the canonical 24 MHz OV8858 clock constant;
- retain ACPI_PTR() for the OV8858 match table as Sakari requested; Andy
  subsequently confirmed that Sakari's media-maintainer guidance should
  decide this point;
- add Andy's Reviewed-by tags to the unchanged patches he accepted;
- move the existing OV2740 group-hold error-unwinding correction into a
  separate preparatory patch before the white-balance controls;
- complete the AtomISP struct v4l2_area conversion for persistent sink
  padding, padding helpers, frame-size tables and all callers;
- keep the OV8858 digital-gain extraction a pure refactoring, preserving
  the original register packing and explanatory comment;
- use the existing OV8858_XVCLK_FREQ name for 24 MHz and keep a distinct
  constant only for 19.2 MHz; and
- standardize the Assisted-by trailers without changing authorship or
  Signed-off-by certification.

v4:
https://lore.kernel.org/linux-media/cover.1787933456.git.mauriziocasciano7@gmail.com/

The tablet DSDT contains the sensor objects requested during review:

    Device (CA11)
    {
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_DDN, "OV8858")
    }

    Device (CA01)
    {
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_DDN, "OV2740")
    }

All sixteen patches pass strict checkpatch. Integration commit
780663f0af3b contains the exact v5 media series and passed olddefconfig,
focused W=1 C=2 CHECK=sparse builds, and a full x86_64 Debian package
build. The full build log contains no warning in a touched file.

Runtime testing used a Lenovo Yoga Book YB1-X91L booted with
7.2.0-yogabook-20260831-153058. OV2740, OV8858, WV517S and AtomISP bound,
and AtomISP reported two connected cameras. Processed front and rear
streams completed and actual switching was confirmed through distinct
BA10/GRBG and BG10/BGGR sensor paths.

Direct raw capture produced five complete OV2740 BA10 frames
(22,364,160 bytes) and five complete OV8858 BG10 frames (20,377,600
bytes). The OV2740 red/blue balance controls were set to 1200/1300,
read back and exercised during a five-frame raw capture, then restored to
1024/1024. WV517S focus was set to 448 during rear raw streaming and
restored to 300.

During rear streaming, OV8858 and AtomISP were runtime active while
OV2740 remained suspended; all returned to runtime suspended after idle.
A 15-second s2idle cycle with RTC wake resumed successfully on the same
kernel. Front processed capture, SOF playback/capture, and both DRV2604
force-feedback devices were rechecked after resume without regression.

With Best Regards,
Maurizio Casciano

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

-- 
With Best Regards,
Maurizio Casciano
