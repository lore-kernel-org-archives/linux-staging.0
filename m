Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586724;
	b=L1fYSvyZ1RjxzMlGYvW15oywaTg2/onUP3ugyOnTeyM5tqmPDLtRKLv+l7PeHGp6H/w/
	 kC5uirdB7q0FUS7WlMuGR19NN49D7qhJbkwV1ty+H4/uYrZ1KVwPfi7NUm9VAd57YCXk2
	 Whg7wDQH0S0NWXjGRBZLttHZ+Pp87TssVpwqEK11FyvwUvfMQLKst1Tw6wRron2qr48cm
	 Slf8F6FufY1VMWl+U6KeNN+LM6rCK5gsGqdtSnf7v6KTPL447pbv7QIWm1cTMO6nMjg9C
	 VKoNfczXn+gpqHzwsoBugDfmPBmhGEHR+cncXAO6/E3uWz/NAaYBz3+7BEBKmJY2qRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
	b=fyOglrO1NjFeeWSNRic1fkqGxT0QCNxQ2KPc2aABTXoUYvYXqL4K+Clv05lbQGPVDIru
	 2CglazGBdWSOd5Mi8ySIKspkFzpDKcV4ILdk8lu9TV1UDO8JYBqkIDXsow1eK4dUUb5tW
	 s5wtzaXijvNY5hhpCYepMKhPOulT682H+nD4bvFYd1sd+6u7Of+ASf4Px0aT6wX8EoGte
	 GWkgWGmTzDMm5vd/7t2qX5SbRzoA5wOVuZc3xVldwRdRt5FrmwGv+PqHsNA2qyZGdlA0j
	 j40x4l8Z2uQIgGYFDNeurqTjWbkfTyGIDQ718SuOew05R425dtIIwmZC9dUlHZmVltQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ai7p3r97;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65796606BA8F
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65796606BA8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ai7p3r97
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so216101666b.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586723; x=1795191523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
        b=Ai7p3r97Nr11AMkqX41dxtrUYGkrkcA8m2ofEBUjO+RtnPrBj8Kqv1zIlGVH0I6PYb
         WhWkyxAzJtMJE1X3nwdsiMJ5sOV3YLjIgBG6+SlUPOG+dBjcFELScFanvwDP6N3MqNqA
         qgkbeHSZ2/RKghyvemaesq06+edKCeFJ0exTNG9YdFXynUPZIO7ijwW75zX2aC1pXOlY
         A4UfMkBVzmN1eqqRf4hnD07AjeFd/1Lt2O23No3sKaqEjadavWND/VgGjrxCiHoTzucz
         CFwxT+Ou0HhgJR4eUD/K7/uB/GesAwjsBMFsBIIxZt0KdsYHee4/y4gCZrcbQourktsC
         2qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586723; x=1795191523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
        b=zufEIl7ORRZPESHAm8azfNbMelXX610zDdu/rkqQQxCM7V0X1sqmNtuHhpaOgW+d9w
         fb4rOf2SsSWje957gaJGaFPh6x9umucacHvkhVjmlxs5gSOVxht83Tr2R29zyqj1Vtf0
         FjYohjroE3vXIlJAZdYj/ef0TWtfCw1Q09jchXc8n5GAofMNq7GmTUpPp9OuJFOVE9M0
         ir2nZeK+JedbdjkXByxZuQgrFF5PGNrGecZamogjgs5B47kysYOdLgPix2fBFfYJ2ACu
         mHmp+VtwNsnLQ+EZeW97K90Qwas8TkzPXVqxAnnVWmU4nP6bNRujXdCxuao+m3EzE3sp
         THxg==
X-Forwarded-Encrypted: i=1; AL+hErGrUPL7V8/H9ZbH9munbqcYgZUcTj49LkoK8wu6OekgOl9dRW8SHZLIuCDgtP3vOFun7WGFs5Er2BWOKg8X@lists.linux.dev
X-Gm-Message-State: APuU4Z/HKgl00+ZkMrc+CmMRjCLnjMH6T0T2GnlWZRBzqCwjkpUz0mrg
	DAxubbfS/qvAkKQz7uVXmvtls9N8rm56u1Vl5MfUiX38LDBNUzv5WEzL
X-Gm-Gg: AYBFou0hvj5/rgfCkEbZtYuOXUkmw9XCYPOal7w056NRJNT1AZd071z/EdmSudct19x
	FRtRhzB+shPSgx70n3uucjCZPxU8RHsncVMTh9ou35CBNTVbR0iuhqPgBPVuvA7QwYU+lQD2kkb
	e7jHrreB0WlFKSs1N1aCsk5WRzNepYpU9iavgwxO09dqkda3nNiseNg33VYkmImhoHQBsFuq55Z
	6g2j5tRHyD2t+K4hpOjhTxGpJozKiIcsCCdwuNqXxo/akPZghPzlO8aExGMRleGXhI4NKFbGhor
	S3XnDre5gVAKQVmLot8jgZcMjPERXVZ5K5JeH91rb2iXSUqeWbwJ48R3nQke3Iqg/hgrjkF9iY0
	LVSKXdb24en/kxfKbqzeSZACjWuVhOebHsInAtJvFAhhO600PHqlTBkWPvupjZL9OknqpbezlrJ
	ta/BrP1v8nyoE54t0QwcmUTJJC/DujUKrlayzu9+ncf/QfrNPfWIEzevtSZTuIYFWD4MBva3sle
	hmcy+Zphvu9gFj7Rn8BruP0A1mhEvZCuc+i9TUSr/Mn+JLOhpVzCw/sTNuTDnLTb34cZWl+bPrk
	gPj/kDJaPvhDozhcfxQjGjpcWFCadYqamABcEdMHVIQe3tbKeqSOycVmeDqP8cz8j+xIIWXovjW
	Ydi7OLAv5ow==
X-Received: by 2002:a17:907:c06:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c5096328858mr256085866b.17.1794586722589;
        Fri, 13 Nov 2026 08:18:42 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:41 -0800 (PST)
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
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
Date: Fri, 13 Nov 2026 18:18:10 +0200
Message-ID: <20261113161819.36847-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

The Tegra Video Input drivers are mature and developed enough to be moved
from staging into the media subsystem. No other changes are introduced.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/Kconfig                           | 2 ++
 drivers/media/platform/nvidia/Makefile                          | 1 +
 .../media => media/platform/nvidia}/tegra-video/Kconfig         | 0
 .../media => media/platform/nvidia}/tegra-video/Makefile        | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/TODO   | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/csi.c  | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/csi.h  | 0
 .../media => media/platform/nvidia}/tegra-video/tegra20.c       | 0
 .../media => media/platform/nvidia}/tegra-video/tegra210.c      | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vi.c   | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vi.h   | 0
 .../media => media/platform/nvidia}/tegra-video/video.c         | 0
 .../media => media/platform/nvidia}/tegra-video/video.h         | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vip.c  | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vip.h  | 0
 drivers/staging/media/Kconfig                                   | 2 --
 drivers/staging/media/Makefile                                  | 1 -
 17 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/TODO (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)

diff --git a/drivers/media/platform/nvidia/Kconfig b/drivers/media/platform/nvidia/Kconfig
index b211b46877f63..53f34308f5aff 100644
--- a/drivers/media/platform/nvidia/Kconfig
+++ b/drivers/media/platform/nvidia/Kconfig
@@ -3,3 +3,5 @@
 comment "NVidia media platform drivers"
 
 source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
+
+source "drivers/media/platform/nvidia/tegra-video/Kconfig"
diff --git a/drivers/media/platform/nvidia/Makefile b/drivers/media/platform/nvidia/Makefile
index 428415ff83de1..97a94b60fee93 100644
--- a/drivers/media/platform/nvidia/Makefile
+++ b/drivers/media/platform/nvidia/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y += tegra-vde/
+obj-y += tegra-video/
diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/media/platform/nvidia/tegra-video/Kconfig
similarity index 100%
rename from drivers/staging/media/tegra-video/Kconfig
rename to drivers/media/platform/nvidia/tegra-video/Kconfig
diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/media/platform/nvidia/tegra-video/Makefile
similarity index 100%
rename from drivers/staging/media/tegra-video/Makefile
rename to drivers/media/platform/nvidia/tegra-video/Makefile
diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/media/platform/nvidia/tegra-video/TODO
similarity index 100%
rename from drivers/staging/media/tegra-video/TODO
rename to drivers/media/platform/nvidia/tegra-video/TODO
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
similarity index 100%
rename from drivers/staging/media/tegra-video/csi.c
rename to drivers/media/platform/nvidia/tegra-video/csi.c
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/media/platform/nvidia/tegra-video/csi.h
similarity index 100%
rename from drivers/staging/media/tegra-video/csi.h
rename to drivers/media/platform/nvidia/tegra-video/csi.h
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
similarity index 100%
rename from drivers/staging/media/tegra-video/tegra20.c
rename to drivers/media/platform/nvidia/tegra-video/tegra20.c
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
similarity index 100%
rename from drivers/staging/media/tegra-video/tegra210.c
rename to drivers/media/platform/nvidia/tegra-video/tegra210.c
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
similarity index 100%
rename from drivers/staging/media/tegra-video/vi.c
rename to drivers/media/platform/nvidia/tegra-video/vi.c
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
similarity index 100%
rename from drivers/staging/media/tegra-video/vi.h
rename to drivers/media/platform/nvidia/tegra-video/vi.h
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
similarity index 100%
rename from drivers/staging/media/tegra-video/video.c
rename to drivers/media/platform/nvidia/tegra-video/video.c
diff --git a/drivers/staging/media/tegra-video/video.h b/drivers/media/platform/nvidia/tegra-video/video.h
similarity index 100%
rename from drivers/staging/media/tegra-video/video.h
rename to drivers/media/platform/nvidia/tegra-video/video.h
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
similarity index 100%
rename from drivers/staging/media/tegra-video/vip.c
rename to drivers/media/platform/nvidia/tegra-video/vip.c
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/media/platform/nvidia/tegra-video/vip.h
similarity index 100%
rename from drivers/staging/media/tegra-video/vip.h
rename to drivers/media/platform/nvidia/tegra-video/vip.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 644aefdb9d41e..8a5f6dcc49adf 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -34,8 +34,6 @@ source "drivers/staging/media/meson/vdec/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
 
-source "drivers/staging/media/tegra-video/Kconfig"
-
 menuconfig STAGING_MEDIA_DEPRECATED
 	bool "Media staging drivers (DEPRECATED)"
 	default n
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 584720e91327c..b8d874766371e 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -3,7 +3,6 @@ obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
-obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_INTEL_IPU7)	+= ipu7/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
-- 
2.53.0

