Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605989;
	b=pqUkjt8wgEEhJ6NYuOuQ7KgDQBLc/EzxkzmQYTn0VQZLyEk7yseQCoin9eXS3cDCZrg9
	 50tFKgGtPbunQKRlz8E+5CcNROcZtcNEWo+jkjSnt2WrMqgDmvJrHGUdNfVRcDMwMy6tW
	 Mtmsp27ylmY14RxUz7Y6b9dYaZ2kuC1Mz5a+59dqOcHPtWm0qoA72/QrxKxdePazic/BO
	 eQhQCu1XytHL85vmkJ0NDUaHS7Y/VrNgKpNv2isSjQuld+MTyP1gJJ4EnPC8fe0y5+l6j
	 sDHL1K+pF3jbXB9PP1H79vwsY6tDvxMx7aRzWnri622wVRtaVuj4vOy6EBrnA61sKyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
	b=KPRaFmdb6EIjYbEkvTzyi1ihaIHudL4UgbrTUVUCTDIPxzXWUeC93yMqMhe/b0ztt4Ka
	 0L14pTCagZIJX0EXZV6LSfMb91n2b5i+JFiAG5JqtRRmof4NdtLffKo6RIU1vmBxrNAbj
	 nbX3oDz+MhbSSvSOzaCHbI6IXF4zmn8mS6LKs5Skh4IHGIyakrSbMroVAWP5kWADOAVBR
	 oipaKa1N0O3hSiXy6mvj6bxxV+CdA7vqLvlJsBKnvvKatdC43wBUei3d2e7oJXh3vObqh
	 2u1NA5tpz7T87t7nKk9JGhQSNhZxYhFkfanSyVpUa9gijknK4VYEC2p3/PJigFCoeNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GKDXczr4;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB9606A331
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDB9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GKDXczr4
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso6604668a12.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605988; x=1796210788; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=GKDXczr4Bmr1GO8AdVLZgpW0aw6Mb9gaPtvtpVxlhMOIvbbr/QeHNhGLRnf9Tl+0Oq
         Qycbe6pMgqZnT7sGxwto6BoK5rDHHraVr+eMPR0r3FlA8h4ycmoeHqe4xFtb5fxQF4gB
         seH8g0ouFPqQPZPXvT/EfCMnXxbi/xDOq1GQ+veOD2CYie8mDO1t7E5ec9fqXNP4tr9I
         C5gycJ0lUCk2QKanNOdIK2S/p4eTyajkwjI8oQ/04j+uYjfqh2cEj7hXdO9SJjsPSwi4
         P55t0rCV10QXeGhO6cYy6mBhTqW4FsjGOX4p2dleUocTDzBH/DLVV942IVwPl9Z6Mduh
         W/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605988; x=1796210788;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=yyNMMVQUrrJNmJ9DRtl8jo1+KDT6MhAitv1Njb3PSKM06PnUBLfwWgfrfM4RhHPBRI
         CP2ztIe1rlLGqY2+cmDzOLn5JbLHjpw0mTj0qHbbV5bupQuZqRDAH4Boqu9K8gOhsPNg
         OVM9yolQu6c0WE/Jg2b3a9BsfxqAQ7Huo7Yi24eTgm3+E+9fNcQBTaQOgXcz9dCq9MQm
         iPXM8PjnkSxrWKMOLt7TbK9SgXAAR5d7mvgWG6cVMld0f1DaiKI6Bjt6rpnm+K2Wmb1S
         5xzfKaPMqUEhrbv6rETDPAm4qjZY+ZUh49nkV+h3D0MpJcROtLfWlvNKKQxgIo7S+IgD
         CHUA==
X-Forwarded-Encrypted: i=1; AL+hErF5smHSjAyazIZt54aqeuPjNrsA0JEIHN25pWjCKQKS58aKlE2Bkh5m/3vFgS4DXUnsBTV+wAe8VscME9wr@lists.linux.dev
X-Gm-Message-State: APuU4Z8YsAynDCtAGfQY0rYmSwlcu3oDVJIrV/BhRRm69YziPfgCpf03
	GXr7N2rngrB1BsuPNAnb0legIttZioLa+iQIi1dsCECEP7h1ppXRpTe5
X-Gm-Gg: AZFdTZejaKGY9GGSOujus96dBOWajygf/Wo9XFw7e04iNRvLJe+PKlZKW5uWugkGnps
	xEmC7Lqy4NvytWDVZs4zDJH6nfWWynNtVe7d2/QuLkdTQXTpHQ6uAh+jBtfw52zavNHuuVbj8Pa
	8TRi7uXwppFzrnlN8x7hvCpaYE+2pjddKQdAOKXkAsAJtTJtk3FjlGpbM3h3t6QEG0zfjwsb6Iy
	/r+KdDQgstxubFLsevs1xXml/FCFeX6XSxB8Zod+U9+keZTEksEA490kEdYfLvWjRlEJ01dRaHg
	vMDtYpb0K/YMhOryPZ8+aK373KQMofIZKhJNaL3q8FoKpVJXNIjqzcaCwhiSoJzmr9enW8Lsohh
	6g7rb10APbvMya9UDUfEXMR60ca6NCembVZppmc2hAQQNxxXo0K8iOPi92q2Nd0tZYVqtWmJvBw
	0QUWgLT2Nk162JNgNLtkvmwFeoEUh024vPDtZgD02hWvBtKKsb+x3XZ8WOL1U+Dvc4Iae3fEUye
	kmo8Uzq2vPD0Sp/rstUPzLotPP7GxAg5ed0h62RLoNaIYM+LeEowFxSsNKqCIIlQYBzdFU0S7rD
	QrXwoPBhkGUzqtIng91PUqdvRSzK7jHrqJ4vFut3qIKPlhLK/iAAMk7Nu0iU/rDvaHbyWti6ODz
	irMTp9jyrJdrbbOIuK7UCm4S1/yQ8A90=
X-Received: by 2002:a05:6402:1155:b0:6b5:7312:4f48 with SMTP id 4fb4d7f45d1cf-6ba37e90a38mr10062440a12.28.1795605987551;
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/7] Tegra SoC specific Video Input updates
Date: Wed, 25 Nov 2026 13:26:06 +0200
Message-ID: <20261125112613.237333-1-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset contains various SoC specific updates for Tegra Video
Input driver:

1. Fixes for Tegra20 and Tegra30 VI configuration (clock adjustments)
2. Moves Tegra210 specific code into tegra210.c from csi.c
3. Addition of Tegra114 CSI support

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

The "ARM: tegra: Remove fallback compatible from Tegra30 VI node"
should be applied with "dt-bindings: display: tegra: Remove Tegra30 fallback"

This patchset is based on
https://lore.kernel.org/lkml/20261125110750.223628-1-clamor95@gmail.com/T/#m46981c261c3178126ce806aabddcc38cc33f747e

---
Changes in v2:
- "staging: media: tegra-video: Move driver to media/platform/nvidia"
  moved into media-device conversion
- dropped:
  "media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper"
  "media: tegra-video: vi: Use entity function to check subdev type"
  "media: tegra-video: vi: Adjust pad assignment logic"
- fixed schema clock-names configuration for Tegra30 and Tegra114
- added "media: tegra-video: Move Tegra210-specific functions from common CSI"
  (Move and staticize the tegra_csi_error_recover() and
   tegra_csi_calc_settle_time() helpers from the common CSI file into the
   Tegra210-specific code)
Link to v1: https://lore.kernel.org/lkml/20261113161819.36847-1-clamor95@gmail.com/
---

Svyatoslav Ryhel (7):
  dt-bindings: display: tegra: Remove Tegra30 fallback
  media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC
    descriptions
  media: tegra-video: Move Tegra210-specific functions from common CSI
  dt-bindings: display: tegra: Document Tegra114 CSI
  media: tegra-video: Add CSI support for Tegra114
  ARM: tegra: Remove fallback compatible from Tegra30 VI node
  ARM: tegra: Add CSI node for Tegra114

 .../display/tegra/nvidia,tegra20-csi.yaml     |  37 +++-
 .../display/tegra/nvidia,tegra20-vi.yaml      |   5 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  34 +++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |   2 +-
 .../platform/nvidia/tegra-video/Makefile      |   1 +
 .../media/platform/nvidia/tegra-video/csi.c   |  75 +-------
 .../media/platform/nvidia/tegra-video/csi.h   |  11 +-
 .../platform/nvidia/tegra-video/tegra20.c     | 171 ++++++++++++++++--
 .../platform/nvidia/tegra-video/tegra210.c    |  71 ++++++++
 .../media/platform/nvidia/tegra-video/vi.c    |   8 +-
 .../media/platform/nvidia/tegra-video/vi.h    |   8 +-
 .../media/platform/nvidia/tegra-video/video.c |   7 +-
 12 files changed, 324 insertions(+), 106 deletions(-)

-- 
2.53.0

