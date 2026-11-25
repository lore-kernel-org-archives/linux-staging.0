Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604903;
	b=TC9Dq1S5n+FCu6j01ulAR+GCrW39Cf00c6VidMPRYiVB1+TS0n/zmc3Q/YqOT6M+wN/R
	 qBev/I+91CXQGa4kvj5EOn++zZq1rAc0VIFKkosHxJRd/5r3VqSeQwNskvAudQlOS8b3o
	 HlnNGzmUqYFvDBuffBPg5Q1DFwpZCh0Hgcnb4XqLoFtLRZQqvT4iyeIjJ6SJJ+DVK66Tf
	 c8xTz5sAWtM2Bu1JgRmGN16N4wm8rWstnSHgVbikc8VLX9WTeYOlxtLMbk4oAPaLV5o4A
	 Ov+6BqB9rJjyqFi0lfzozN0i3pd9AGIMGRMg3gQviEKhhOZ+fE8ph73iYGMJD/m2bVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
	b=trdZIdDmWBrItBUkStKjRg9b40ytWPJmtB/UIjw3VxK7sp1zNodN48e3hGRpiALQKx8y
	 hCS11kMCNeQUF71a5Fni0rYkBUHrq6pDUE3hgah+yI5ejfnD1GFHpGOap2iEiLBZ0tyKi
	 xX7qreKY8NqBK9+2cBDQSVrIxmTSEBpz3sS7OnvmaXzJSL+qNX0UArIw6WGPdwwTCE7G7
	 urDrI/rAsUrF2BzkIUbJjaSRopAwbQVm3jKNnUKeNyE+xEvGUbq7JBnsU1Dkmm1UfohPE
	 XreE6fQDTmUusjpwDLt5RTbFwh6oMaJ5rrmZO4zEBWoBzJq5gbCmbkQ0uAV2ikitsiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U2zGDV5F;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB3606A338
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CB3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U2zGDV5F
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d581da0aaso782699766b.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604901; x=1796209701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
        b=U2zGDV5FUg5ivcAGIDyfNjOQV949gx9FZwGbS2JQXl11lAaXzCtNjlaH2W/+NUBHeH
         8B6FGSGug0l+3uBP8zYIAF3WNvSZdYOsjyM32ZUYzVJFVAsbTPEqUQ/TuRBkbCa/sLUi
         +/jq/6GX6CYReupfnFYXWiMELHaXiBy2D0h+RXChqhZEMgc/iGGdBwYO4pldBgL1UZoc
         bdPUeaEYkMx1pqTrCVQ8BPrpuMZthAWidUWO+/0FsMdTQnQZolmuZ6+eofZUQlc5yQ0X
         Qvt16Cipj4qTjxe7IqxHHNPu3+H6TBZSyaPzRb3fPW7EsbOxwSb9Fjn3S4e19jMIPr9v
         MYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604901; x=1796209701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
        b=rZUL6hl5XAXbm1+sHn3quBacVxZcmxJTVmu5UlF0ZV5k5FpZKbMLna/mVUvGErQQPo
         8l6YtHHrRLpqyVEG9XrbGRfdR0xBF8UGoGiv5NlcYsHGKqLCApRv/PnpYnF1im/KELs5
         C/HhQ4PKCfahfHq3cBdZLlZPlvaq5YUhxMh+taBCQ/y8zaVcjmvxY0HfqD0wyi4/5l/K
         ziQB/guZUCfO+IKfyzRUhWSYGyy5/KcT/XSHEgz9rOfhdlyIHBK9KI4jrhturoUCllx6
         yb6UGjmZgzZT9WDYIeQzIr3E728n3/b7+JLNGXqunKoISh4x05DdzTgd08ATanuHMiUm
         TRKQ==
X-Forwarded-Encrypted: i=1; AL+hErEWeL0sMNuY0X0sSmEbtqzH2mDeZXmjp9h7xxnni8ToQnVApcsvYumPdkyc/VRE2cKydqCccHhMlH998WVl@lists.linux.dev
X-Gm-Message-State: APuU4Z/N+1Uo+mwRjvNv6r6Ll0Ct3Gk4MGCMB1S4PJRkGr4WxWA15jXI
	eiB+HkCMkU7S1vD20+2wzsiJ1gUn/DCHodiCqA8oSH21GBgl2PqxJl8E
X-Gm-Gg: AZFdTZcp1hqgXqNjm6mmld3UkFefJ5DsoTHdJ/buYWucJHKwjab0ktLb2qE9DX32OUU
	8O5Z3Fir1ZSC+H/o1dsIyvD/P7ThFIQMdjrKPKiRyS2BWbq1nrUk7bZVxsGagznpEAJKjLg2y1d
	Ud4QYBvBYfuRjfkME1Vf2ns3OFJx22Te7SYS/k1J6C4i8rZolmdWLD/VoUSceodmkPZ2lELf3Ta
	laDmsiT9m/kCErOAO8TOOKP4gRqXkzFZCk9F4xP8tLhMyXP6nD0pjwsOpl669Z0U5h67J15MlqH
	kLDalWej4tPHsNptjmmd7s1byd3SymKshkP5yyiYGzj1lzdlEFvk6C4RTx3J7oLsQMVbvFj8H5L
	Gdwpqndt8OUTJ8fn/P3V5uALdLoE9MLhQb3tJR09Uz2aL2d3UiEcRUsMCy5skM1vE4vQk2aniEf
	ggNTfVAaWUf2u/vlkaaACwJ+t2T0Xq+e1x156kHOiL+MVhamtWtq/IDafQFtdqa/vEAiAa2GFgH
	ZmABiDnBYCJNnlT1kuQ9jn/EuOY1WooaggEVGZ6pWc6KKobhsShBIPk/hNQv6dtI5vGO9Hxh3GL
	ypqCDIT0kZDncOP4Jnv1pSbP1BbMeg1VxD33TIosdMP4GPGV1ke9rF292XyXeD4r6EWXDOgc5i+
	hzsYtdKQVlA==
X-Received: by 2002:a17:907:3f05:b0:c41:e0c0:e6b7 with SMTP id a640c23a62f3a-c513a99a69cmr1283264866b.12.1795604901175;
        Wed, 25 Nov 2026 03:08:21 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:20 -0800 (PST)
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
Subject: [PATCH v1 01/13] staging: media: tegra-video: Move driver to media/platform/nvidia
Date: Wed, 25 Nov 2026 13:07:38 +0200
Message-ID: <20261125110750.223628-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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
from staging into the media subsystem. TODO file removed. Path in
MAINTAINERS updated. No other functional changes are introduced.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 MAINTAINERS                                                  | 2 +-
 drivers/media/platform/nvidia/Kconfig                        | 2 ++
 drivers/media/platform/nvidia/Makefile                       | 1 +
 .../media => media/platform/nvidia}/tegra-video/Kconfig      | 0
 .../media => media/platform/nvidia}/tegra-video/Makefile     | 0
 .../media => media/platform/nvidia}/tegra-video/csi.c        | 0
 .../media => media/platform/nvidia}/tegra-video/csi.h        | 0
 .../media => media/platform/nvidia}/tegra-video/tegra20.c    | 0
 .../media => media/platform/nvidia}/tegra-video/tegra210.c   | 0
 .../media => media/platform/nvidia}/tegra-video/vi.c         | 0
 .../media => media/platform/nvidia}/tegra-video/vi.h         | 0
 .../media => media/platform/nvidia}/tegra-video/video.c      | 0
 .../media => media/platform/nvidia}/tegra-video/video.h      | 0
 .../media => media/platform/nvidia}/tegra-video/vip.c        | 0
 .../media => media/platform/nvidia}/tegra-video/vip.h        | 0
 drivers/staging/media/Kconfig                                | 2 --
 drivers/staging/media/Makefile                               | 1 -
 drivers/staging/media/tegra-video/TODO                       | 5 -----
 18 files changed, 4 insertions(+), 9 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
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
 delete mode 100644 drivers/staging/media/tegra-video/TODO

diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9acf..3f391f0b61391 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27903,7 +27903,7 @@ F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
-F:	drivers/staging/media/tegra-video/
+F:	drivers/media/platform/nvidia/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
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
diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/staging/media/tegra-video/TODO
deleted file mode 100644
index c821081668942..0000000000000
--- a/drivers/staging/media/tegra-video/TODO
+++ /dev/null
@@ -1,5 +0,0 @@
-TODO list
-* Add support for Ganged mode.
-* Add RAW10 packed video format support to Tegra210 video formats.
-* Add support for suspend and resume.
-* Make sure v4l2-compliance tests pass with all of the above implementations.
-- 
2.53.0

