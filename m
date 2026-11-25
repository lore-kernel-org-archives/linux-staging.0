Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604902;
	b=cWiKJnz/yw/8OlBqWrk2FIFGBsP+FKkinhjziBlNFb6PzMvJotLfTJZ7aUOoRdMUUsx4
	 TkarBo5Z8xgMVWbVAcctzTBRE93jaDBs/YUB7wqNDoWgg076hfEScec8YpbivTYQ7FFCh
	 K9F8sq89yqQrU6QUI+f2GF5lnZ8VpYi+UWYoMh+joZv4BnJlXFWym6vJq243siBQhHnLS
	 G+vxKcVoSfnVKm5v9Y7RwFeLzsb9pfVOEn+lVVTpqDIgfe0YcqbK4fX6VyHOAeEphN53d
	 kwUcX0N47bqbHJztkXOCfMyL/TnnBOojnXQr2NDzgDa0aZ3ju8yF08IMIWg+1Y7GSog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
	b=H2lFu6iy3B/PJqFmnqWOT2r6dnmMHpGzku2uQXgayGDlW7mJjD5V1mbYKsCz1xzMAtQ/
	 MULYPN3G4CChHv9o9Ntj5NvWqGN/WkVx8g4RJ9Jta6aVhd9NvhQ/XRCtRyAc4fn7s+Plf
	 aaQDsPxEWrOpxwMsJxeNKwvv/oLMQ8iharVYwnSwRz1+hJFF1HADJ+1md9MukebQYXEjO
	 105fLQxRItMdAJN5I6yQY6MjTPqXChxcfjqpMIUTpAFhw6b1sHURD7kzlRnlUFvKyBsur
	 DrfxAzyqayP3p+lEsUl40iZpwLROd42JCcWCt3sKy+fQFze3uA59tpSrC7w3JgGIv1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKSf+kvV;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF4606A327
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FFF4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKSf+kvV
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso57678266b.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604900; x=1796209700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
        b=jKSf+kvVTBv2V7oieMAf0pHjmc5QjW/Yvx6GNDOZ0Usypq/QZRuqouTH4DmdZt6pdg
         u+LB6N14UinVgoG+Cpd7tgxt3OsJ0RR7WyULncS6bPAxd+AOk4PLSWTJZiXTgdi9/cT3
         3PxFC3BkiOVNH2kUqGCxnttQS9gQbJ9m3qlxYtWK/OPBGGlgwr6/5gsIcVHL4btkaEmf
         Km5CdRaX6iFa6qMugvQc4C2NzA8ag355Avwbw+uAq+kwO3SgLW2xD+dyZh+ExzV3S7x6
         SiCSrE3oc+td9VXnKrr1Yikveo+CX6YW/8VCFtiSGYzD0DnVL1bLKwu9jJadQJD00VFT
         GZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604900; x=1796209700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
        b=lFkwyGNMsiRPaXjw8Hw4EckceNOuZOIogdQPQlagKcUH4Bwlppo0R9IOor0Ho6x7au
         OUETszlJ4HlEe0KFsszo1pO86AhuknlN8CqywVsky96iovA4ST6LrOEZPmegtRk19h9R
         fsnci1VnaSiggx3IUOi3+U4Ui/q4GvF71gsBOhxwnp/kunIEva6MCKnte7Iiz6TX59cL
         WM/r/R8Fz5nTw6BqKe+FWmIjZooFzHiUK+KVpbMNACR1YSwhfmlyFx0bM8vXhZK9b8me
         NJ9YiDxs0yyM6VU3ErLpPoXY9ucsRm07+7i2I5qcYX+OIxzTF7I9xTWXqKvjrhT2R/Ig
         txuQ==
X-Forwarded-Encrypted: i=1; AL+hErGkkX8ttVSzYEbGB/vCMtdhgXdq1MNJTwfqrThs2bvm6QWIGLIWZIw5VJ7vuTrHTD5EJEB/UvAdZY1WrolN@lists.linux.dev
X-Gm-Message-State: APuU4Z+14XDWtw8M0T11rC4dOjQd4E8Khn1jf3j2unAR7h+LSE7pFpPm
	zGlKURuhbgAqTUYypnYwnqQDCYoe4fa/N8XO5D9lLVlVkwB8lLXKIU1c
X-Gm-Gg: AZFdTZcub6RlO2KSJ4n9TQgXEpNbY1KYpFPyD/NNgShQa/UNRLWMU6xJ/hLBwPP5R5X
	EXkILSiFaWZStmOYD7drULu9mKwXwXKv0mnyintQKWlhtvFEApbH0SSuvtyMCS4OSCCSfBsf6ZV
	eT2p7Ds28EDJlZZJYHf3mPII7n6Z2uMhwFGnj/GHc44/OUshW9skYQDKec2W1pgyY4wMUq8mFsH
	yNUv4Pb4k/uubac4GOwgVHJ8hJSpUy089jwqVERfoAh2s5CwHc824b86UijOWKHynnkj/cpekJu
	IOFy26CZ7BWQ4gKZqU06nCDlKMxtwn3ibVoQatDeUS++p6jcHAjVcxYibqyFV3kSJOhL/Jhh7HK
	5QovU2lnqhSQIbYe7vtYUpXE5TM8bD8TaEEf/iABGF/wCQEqWLhIPx8K3xEO6gIvQi09yqGSPTt
	7OIT1bPLs4dT3qkA0LquLQ3YaiTW4Bsn6l2OYQslYqLWGsXrXO7qsU7eJ/PLWKv/ccrFxXNxmJM
	gXQT0KGFLhzxIaOPRNeT22Gra7IsPuJg3nXG9k0TnkIgXpW5+YFZtfXdntzGbBdCSmWKDPYAwVK
	lwPRiGEj3KMPVEGgoWxp/lT5lmV+E6nEk8SSEqiXhl2dqfmdV1yEUBFTMTTvyI56GB0ev5OQqsM
	ykv4m9/4lEQ==
X-Received: by 2002:a17:907:1c9c:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c519ac70721mr350640166b.48.1795604899681;
        Wed, 25 Nov 2026 03:08:19 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:18 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 00/13] tegra-video: Convert to media-centric pipe
Date: Wed, 25 Nov 2026 13:07:37 +0200
Message-ID: <20261125110750.223628-1-clamor95@gmail.com>
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

A minimal set of changes required to convert video-centric pipe into
media-centric. I know that moving to /media should be last commit,
but it may be beneficial to keep this history in the /media subsystem,
instead of leaving it in staging.

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

Svyatoslav Ryhel (13):
  staging: media: tegra-video: Move driver to media/platform/nvidia
  media: tegra-video: vi: Drop controls consolidation into VI device
  media: tegra-video: vi: Expose all sub-devices in the pipeline
  media: tegra-video: vi: Drop subdevice passthrough and input ioctls
  media: tegra-video: vi: Implement link_validate for video entity
  media: tegra-video: vi: Populate stepwise frame sizes via vi_fmt_align
  media: tegra-video: vi: Report stepwise frame sizes instead of
    querying subdev
  media: tegra-video: vi: Enumerate supported formats instead of
    building bitmap of compatible formats
  media: tegra-video: vi: Configure capture format locally without
    subdev calls
  media: tegra-video: Remove remote source subdev helper
  media: tegra-video: csi: Scope pad and state ops to TPG mode
  media: tegra-video: csi: Add pad and media operations for own CSI
    channels
  media: tegra-video: vip: Add pad and media operations for VIP subdev

 MAINTAINERS                                   |   2 +-
 drivers/media/platform/nvidia/Kconfig         |   2 +
 drivers/media/platform/nvidia/Makefile        |   1 +
 .../platform/nvidia}/tegra-video/Kconfig      |   0
 .../platform/nvidia}/tegra-video/Makefile     |   0
 .../platform/nvidia}/tegra-video/csi.c        | 298 ++++++--
 .../platform/nvidia}/tegra-video/csi.h        |   0
 .../platform/nvidia}/tegra-video/tegra20.c    |  18 +-
 .../platform/nvidia}/tegra-video/tegra210.c   |  18 +-
 .../platform/nvidia}/tegra-video/vi.c         | 643 ++----------------
 .../platform/nvidia}/tegra-video/vi.h         |  19 +-
 .../platform/nvidia}/tegra-video/video.c      |   0
 .../platform/nvidia}/tegra-video/video.h      |   0
 .../platform/nvidia}/tegra-video/vip.c        | 102 ++-
 .../platform/nvidia}/tegra-video/vip.h        |   0
 drivers/staging/media/Kconfig                 |   2 -
 drivers/staging/media/Makefile                |   1 -
 drivers/staging/media/tegra-video/TODO        |   5 -
 18 files changed, 433 insertions(+), 678 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (75%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (99%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (98%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (68%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (95%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (71%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)
 delete mode 100644 drivers/staging/media/tegra-video/TODO

-- 
2.53.0

