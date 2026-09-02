Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D064A482E
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360833; cv=none; b=ckIVJlw6J5UqN/Ryfa56qU1REhPO2PsOQJ33YKNp5/Da91LdZxbcUWeIqp/vmjUZB+aTlao+T6XeM5asMp2PN9Iw4CZB8JkT1kP9glJRt4BLJh4emhdQwMa5S3EifNzRcgpuS0xvBxerw0paFIiub0OYMvXzjPAsXknr48Y+bwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360833; c=relaxed/simple;
	bh=7aq1sDRDPQUFupWUr1nlyLSACWSikoHJdpRyCXGb55Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCEUa0vspCIDxFcNL4Bj4mqwW4RIV9C0+fA0QABCnx87vMIcMW1GSJGgx6ZppK/K0vjjZjYhhXhrBYUVbDGZU6gb4jzw/ep5GQaIB/aEfOngsN5v2MnS7CJN7cYMmocF9sSYhBU2adjRVvqcqFhfeSUcdm59a8oX3pAc2hdb3Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9bXGux0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9bXGux0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482ea739de2so677643f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360829; x=1788965629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMHga1JqjOupCY+rN4sQgdUrEVoLNE3H9BbYfFY0Qi0=;
        b=s9bXGux0gXtHirMWIzYDvXsbA2to8WKXyk/1/KodOSf8hpt/cgnbObg+V76SxuseH+
         RfsnT5VWl0J15nSr+gFEjJGK7W2HaH3f19iPC9PFTFjZK3WRErXMu0BXprt9ex+6B2pI
         UAgOXE1XhfMA4BcIivhrwTCf5VwmaY6Uci2Zpcs0itUbfAANj6a0TzJetHoAF24G/NJZ
         j08+KbaNl6w16zNDN3G4gXF+b/zKPhHpvbVUNivLZVJG6OvzTVr/oAIRFfJvLpzJJvtx
         3N3pbhvGf48UqryZM8clnanPlY7gKltSaEDMQoySDx/djFLZqZNziVOS1D/uPqixRY+3
         d0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360829; x=1788965629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMHga1JqjOupCY+rN4sQgdUrEVoLNE3H9BbYfFY0Qi0=;
        b=KCT7Bwy7s8tdg7d4mdVwCG5CcrzG/CAnUDhkQbnrvzKTGtofPAZek9mS0x2iyUXwMg
         BI4nxiyhf44jQF76r2Yzh1hzZdbf7Eg7pSDSYNhEGIlCVRaASKl89RfM/GV50sKmoNOY
         fDm9vUTdDP5nE/Q0tz9dQGMKjbSAvtHvN6lTezsJPcX+1J6NVX7IkoKveRyUNGC0NOU0
         RbkzHyY/b0hT9BYn6k7LtrIOOUDtdcRmFLi+465pKseQ5BN1SKkx0EAltGqRsrhzIPAi
         F2G01rhTXD+SNqro+9UhKoRmHZyvAAdHyt8sdby99W5gSlm2Vtv6X7a+lYbu6WW9BqEi
         lFfw==
X-Forwarded-Encrypted: i=1; AKwUvBxTTaJ6A1a0ZPe0jnKq92yK3P5oDVDUN8XZDFXseWekI+u4j8fr/GcDcyV7c8rs0CuTRxVIMIFgu2H0MkFO@lists.linux.dev
X-Gm-Message-State: AFuF++m97h9Tot1oLVGz4lF9v9cG9RcYHcGh1meLbXYvb0+psmtb9jgi
	9uAtduunaGu2NOqExw/0vpiO8lofvNGpKhO95BYDTOIO/2gXFOpvxje2
X-Gm-Gg: AYBFou02nZ+qn/mZukA0B6btLwi24oiTC5Lwb52CA0/faHzM5TAfmR++5W13Too+M5G
	SZKiA1MbJp5Xt1fXPT45qeuXu/ZvCuK3AoZ1FsY2sGUuNNxv3ud4wAvZFGjKtIw79lpVE7mhXfB
	28SpubUG4TIj3adXh9kglsQNMaG6ki2n8qI69NMJt5RGGui2ips1Bp2ikfnKg9Bd75ArxxMgnkg
	Caniw9WeR7x8XaGIiYSfTNTl7MKyuKvqcLu1h+g5jrhv11KtCHmUYfTtiYL/9XIVZXWw/CDnEES
	gm+v3pBcD3TeV6W+AxF3NcV/eiLB69omIzYxzhsMMd1fTN7QfS3KfLgmbhCS/UOdP8tZB8B5Muw
	OUyddp9SlgdZqklN7kumOPnUGn2uyOdirAw+oiIlLFumXmZLvGe/IJfL1Ixr3nNuPvGHAvrNrOS
	BLZ1c44IXNa6B7k0/FF9qxE0vVLd2jZxIWraPOEHQsGc0ryZrpUn/LQ3sfDmZOrX/ZJIddENTfu
	t2ak3N8RmtyLVli66/SUKWDSkNtMptlJQUhsqn2ntqA
X-Received: by 2002:a05:6000:2589:b0:484:36c8:ffb9 with SMTP id ffacd0b85a97d-48488ded10dmr10941341f8f.4.1788360828544;
        Wed, 02 Sep 2026 07:53:48 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/16] media: Add Yoga Book camera support
Date: Wed,  2 Sep 2026 16:53:29 +0200
Message-ID: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

Changes in v7:
- In patch 2, keep digital gain independent of the external clock and
  expose the manual red and blue gains as separate controls, as requested
  by Sakari Ailus. Keep green at unity and accumulate register-write
  errors across the three manual white-balance channels.
- Move the 24 MHz PLL and global timing registers out of the common mode
  tables into revision- and lane-specific arrays. Select both 19.2 MHz and
  24 MHz clock programming explicitly when starting a stream.
- Clarify the patch 2 assistance disclosure as
  `Assisted-by: LLM [Codex] [Sparse]`.
- No changes to patches 1 and 3 through 16.

Validation:
- Strict checkpatch over all 16 patches: no errors or warnings.
- W=1 object build of drivers/media/i2c/ov8858.o.
- Sparse C=2 check of drivers/media/i2c/ov8858.c.
- OV8858 R2A, four CSI-2 lanes and 19.2 MHz input on the Yoga Book:
  digital gain and the red and blue balance controls were changed
  independently during active streaming.
- Three complete real raw Bayer frames captured from each camera:
  OV2740 BA10 1932x1092 and OV8858 BG10 1632x1224.
- Front and rear camera streaming validated in Cheese.

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
 drivers/media/i2c/ov2740.c                    | 114 +++++++--
 drivers/media/i2c/ov8858.c                    | 220 ++++++++++++++----
 drivers/media/i2c/wv517s.c                    | 206 ++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  80 ++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  30 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  34 ++-
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
 include/media/ipu-bridge.h                    |   3 +
 15 files changed, 617 insertions(+), 135 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c

-- 
2.53.0
