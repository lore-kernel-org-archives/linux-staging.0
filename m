Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A492142466A
	for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750587; cv=none; b=Z/aGsyUyWXjRHCU8Hnq+27o3TwUdbHfw1nVYZgKqWkL8mebwp7XQMkyj5uIxzga7gDi4Naxlr5MaES5XXoQYZqJRCoFvdAKbTvnbyN1cbByiloQN8ZBwLfU/45eTgn3++uaTr4Pl893nLNwYBmIkpBGF1o/TCCLyxWMAofWorBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750587; c=relaxed/simple;
	bh=qcDpiJ4AaNaIfcHB3+7d9TBQ8LYaMki9ck1aZS0bXBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDR7nf9oLtCEERhQ3DcIBO/7qsHtaCb0Qw6ZWUz6i6R7yyu6Ego9Lz+aJ0i5bNJZZf2wxvl0w422OgGEF58xW6RD8T01lLXv3/JYNRYQVP31Vndzu3f+z3ztMZoonkh10MaCCzJVY4k6XFipd3fMYXeZqDiiY/mWVorI0SttnM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNZINCPJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNZINCPJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a5ded53570so1565819a12.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750584; x=1788355384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsHIzkq6RIx3RtCgQAXVkYxzKqk0k5//JakmHy5WmdM=;
        b=WNZINCPJu8fw7yzLRylHUWl2CK7nNMHrD/K80FIQNQaoRKEhyPBcOJ25BZNuXnYlIt
         JbmnDlSO3GWWxZyXF/nwV2yBBdAbnai0/AalWGHsen7l73hj9+H5tRRhTkhLbkQe7syS
         zCwROUucoGr6nZ+d5EgRdT5ApL3SeKJsy+3suJ5866OTRabG8vLtSOikSVvhBRUGtCBW
         wa3nYUfXBCcJUWr1aoHPduJhrJyTLhHFBvZuiMJPNLa12uBV8069jViDxXWiw1CMhQzr
         Hb0HEHrBc5TFxbFkLdiF94sVc5qjlPoeVx5IJCy7H8plGL9HFhfl8U+cjJnMallvdzBE
         VgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750584; x=1788355384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsHIzkq6RIx3RtCgQAXVkYxzKqk0k5//JakmHy5WmdM=;
        b=jg4YqBeh7Fcc6FRaZO5lvG2Mlqu4A1Gw3gDY2L9D5UP9HghBMG5NXCL0iIBAq421wP
         Zsc3dX40fg+Kwpc/GclfhgzEngmTuSTpIirRG57iix6+zADl6PmhdEo8wyxVO34Wou86
         i4Yd2aODh64o3ionYqZpCwjcBKemsKUYZl8LcNa7cRXVgfVp5fpSo9TA6cLlZdtJiUtY
         h8288/yKI+Iwa8Vwn1k4Rivlwi3/RQlWJDcPb+vjLW4UCz3oKWSIKW8vd/0Q+CfLoj2F
         nskfGto+wmtIGvO+g60tg4Xk9XL4IK3KotMnVvk2UFEGxaHPksOpG80xSnLwocQ6hAKc
         q1og==
X-Forwarded-Encrypted: i=1; AHgh+RrzZ0V67OU/8tkWXzBlQ/ouKdgTWY8J9yYGiJZF2o3V2ZuTA5Sf50J2Ab6KSfyRmpAREys8x54Eugq7MVPZ@lists.linux.dev
X-Gm-Message-State: AFuF++mKtmJhHms83CZL1dMMx3XGoKZrxYAT2q3ynJfiT1RjCWjR/0qa
	cOf+61UZcb+/j9OHNTgSU/SeLApkB9wQWcZsNagp65iBCa3Kc1EvrEWW
X-Gm-Gg: AR+sD10PfM2za5cY9fkjapMnA8ErX9vcUJ1bbP4fqNIkdank77FVktIuStutCn8rqny
	7PNVd+gd2Yn9S7jM9HxTV/S4OVsXaqEEhrCJW2+LFwDAAP0GF9AyNEu7S6d75jyckXnuKfhQQUI
	QFklVh5XEk1z8/GOkMHPoWU4RmCCR8QFsdHiXki5UfASn5NPKgKZPKoE2azeVcM6Onxf8Jse0Bo
	HySE6UzM/ov3OMUtYpn1WwuRs6yCYZYA+kEuIUikUltIQrF7D5VfcgfySUk+R5bq5OLpeygl/cW
	8bncs65vdc/6HpAMfOy9f4ZpTWosYeEYDSRoMKPoEguEISNfW0J7XtAJlfBle3arrN6B9RY7Q1J
	dLIECoUaNzPNVIxBBJFQSq94Jnf1Dg+R9NHFQa0jVFTTqWrYQT7ORvVsBhoQ6TiaeUsocxCtdk7
	X1NKwWbL/kvW37HSEGQX9oXdALbGkhrP1q4SDQwgFvue1G95bwa8LsfYQ5Xirzhsq11W4t9NJk0
	uA0oRYC9ui/13oCKEhpfoKTrwh0M0mTg86ISiou7bM=
X-Received: by 2002:a05:6402:510a:b0:6a1:4458:7f2d with SMTP id 4fb4d7f45d1cf-6a5df5f1153mr8425305a12.5.1787750583618;
        Wed, 26 Aug 2026 06:23:03 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:03 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 0/8] media: Add Lenovo Yoga Book YB1-X91 camera support
Date: Wed, 26 Aug 2026 15:22:48 +0200
Message-ID: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L exposes an OV2740 front sensor and an
OV8858 rear sensor through the Cherry Trail AtomISP.  Its firmware does
not provide enough information for the existing sensor and IPU bridge
drivers to construct the camera links.

Add the ACPI IDs and bridge data, describe the two AtomISP camera links,
support the Yoga Book sensor clocks and modes, allow explicit raw Bayer
capture, expose per-channel white-balance controls, and add the WV517S
rear-camera lens actuator.

Raw output remains opt-in and disabled by default, so existing AtomISP
users retain the current format-selection behavior.

Tested on a Lenovo Yoga Book YB1-X91L with continuous OV2740 raw capture,
OV8858 test bars and real 10-bit Bayer frames, and live white-balance
gain changes.

Maurizio Casciano (8):
  media: ov8858: support 19.2 MHz clock and CHT gain setup
  media: i2c: Add Yoga Book camera ACPI IDs
  media: intel: ipu-bridge: Add Yoga Book camera sensors
  media: atomisp: Add Yoga Book camera configuration
  media: atomisp: support the Yoga Book OV2740 link
  media: ov2740: add manual white balance controls
  media: atomisp: allow opt-in raw Bayer capture
  media: i2c: Add WV517S lens actuator driver

 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |   8 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2740.c                    | 170 ++++++++++++---
 drivers/media/i2c/ov8858.c                    | 134 ++++++++++--
 drivers/media/i2c/wv517s.c                    | 199 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  19 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  24 ++-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  17 +-
 .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  81 +++++++
 .../media/atomisp/pci/atomisp_internal.h      |   6 +
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  13 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  15 ++
 include/media/ipu-bridge.h                    |   2 +
 15 files changed, 625 insertions(+), 67 deletions(-)
 create mode 100644 drivers/media/i2c/wv517s.c


base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
-- 
2.53.0
