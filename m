Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3A5EBE
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:46:41 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id r20so11878693ljj.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZYif/qXUCjIlXItIJZJ7t7x6V7RCQjS1IN7zXFkcJZU=;
        b=eKYE/SVzFrsYSwywDGvy23yo/xNfycLoZInrKFeNjwBMKSnuMWl1bg0fiUTr/CQVJS
         DTgBYjO8SYsZoRj6khfuAU4KfuBqnpD/KFK/0vcw/rCoo6k3ymR9d8Jkeb9MP8f5Z6DB
         11wBCymr5UB2CEXShmQl9/Cj/KrVciwkm2Pfb9zHlW08a0G+k7Uh/DciG732PtqfLHCI
         SLhtppuvfiR426QcbVKXvFpRfdy0p1nhHxRKGAMpT89duNyNcyUlQhN8tXa05tda5wnJ
         YYZg9To241R9DOcae2SOvoOOtgV7/89teQjukCOL2jPEhcm2yaZU6nWLz1rMrkXKn/4J
         Xn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZYif/qXUCjIlXItIJZJ7t7x6V7RCQjS1IN7zXFkcJZU=;
        b=DrQ2EElyx7LrIs/qnNPdw7rAUzZDkYjQ6IrS3KellHTYOYWSi5nSeQgTs2kaKavLHQ
         BEQ/OJF943H46poNAznh5coJL2iUSzbAU6/Bv4TJNkOFOk4cW54+t1Jmb65XmGPGJ1RS
         HHxmlw9FezJgNTx0+H5VnniFIGiVwkB1wcL8gTDsBCUlDXRe5R9UTTt0RwSE9+qQvMAd
         OLjogbRbhHq7pNAejAk/vhEfSWSKDHE3kM4lkqPXReau1TcuIaveVXWZUhrVTBqrg/7E
         U8HHjltXha4v7x1fEm7YlmK9gFh2rDwMjQ/Gu61ufmx6QBSvx7+gy/sfsqSsfcKGQMsQ
         4j6Q==
X-Gm-Message-State: AOAM532kCTJifhaFH0h+S/mXh6xaagVPDscHKcYof4tumXBeQzR8ECxc
	MmDH7Z5paMVtA6/QrawQTRIEbUIsbVI=
X-Google-Smtp-Source: ABdhPJzwnsgL0UGwEh/MmpLhmf8eYn/KZ+JyxtGZYB+a9vlz/q8zSg5rXLdNA2bfr5zD6Rl3LR49rQ==
X-Received: by 2002:a2e:ba12:0:b0:246:d5:ead3 with SMTP id p18-20020a2eba12000000b0024600d5ead3mr12797746lja.469.1645389999508;
        Sun, 20 Feb 2022 12:46:39 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id o14sm913955lfo.117.2022.02.20.12.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 12:46:39 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/8] Add V4L stateless video decoder API support to NVIDIA Tegra driver
Date: Sun, 20 Feb 2022 23:46:15 +0300
Message-Id: <20220220204623.30107-1-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support V4L stateless video decoder API by NVIDIA Tegra decoder driver.
Tested using GStreamer [1] and libvdpau-tegra [2][8].

[1] https://github.com/grate-driver/gstreamer/commit/b8509bdbb69b534e61419ea1798f32f9ad2f3597
[2] https://github.com/grate-driver/libvdpau-tegra/commit/f822e95911e5e0c39f8ba19f843ddc1e0138d5ce
[8] https://github.com/grate-driver/libvdpau-tegra/commit/80db4d02369f2a984ce3173d6bc305f32e9fdb97

Changelog:

v5: - Corrected drivers/staging/media/Makefile, where I removed the VI
      driver instead of VDE. This was reported by the 0-DAY build bot.

v4: - Added r-b from Nicolas Dufresne to the
      "V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags" patch.

    - Added patches to de-stage driver, like was suggested by Hans Verkuil.

    - Added patch to enable driver in ARM's multi-platform defconfig.

v3: - Added new decode_params flags [7] instead of V4L2_BUF_FLAG_*FRAME flags,
      as was suggested by Nicolas Dufresne.

      [7] https://github.com/grate-driver/gstreamer/commit/c5cd847f9c26b7669720ae58f9058de2515f51a2

    - Added new patch that removes legacy UAPI.

v2: - Made V4L2_BUF_FLAG_*FRAME flags mandatory [3] and dropped reading
      of raw bitstream from the driver code, as was suggested by
      Nicolas Dufresne.

      [3] https://github.com/grate-driver/gstreamer/commit/aee292f0f2e84b7654a314dd7e63f916888ffaa5

    - Ran v4l2-compliance [4] and fluster [5][6] tests, like was suggested by
      Nicolas Dufresne. Fixed minor v4l2-compliance errors that were related
      to a partial initialization of the coded format and were harmless in
      practice, but made compliance checker unhappy.

      [4] https://gist.github.com/digetx/5d6bcdab633488f1dcc7c141ab90d30e
      [5] https://gist.github.com/digetx/b06c5d779e9d25afa41d9f46946fe399
      [6] https://gist.github.com/digetx/ac4198bc340e5065aa8ec3288bb21356

Dmitry Osipenko (8):
  media: v4l2-ctrls: Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
  media: staging: tegra-vde: Factor out H.264 code
  media: staging: tegra-vde: Support V4L stateless video decoder API
  media: staging: tegra-vde: Remove legacy UAPI support
  media: staging: tegra-vde: Bump BSEV DMA timeout
  media: staging: tegra-vde: De-stage driver
  ARM: tegra_defconfig: Update CONFIG_TEGRA_VDE option
  ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver

 .../media/v4l/ext-ctrls-codec-stateless.rst   |    6 +
 MAINTAINERS                                   |    2 +-
 arch/arm/configs/multi_v7_defconfig           |    1 +
 arch/arm/configs/tegra_defconfig              |    3 +-
 drivers/media/platform/Kconfig                |   17 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/tegra/vde/Makefile     |    3 +
 .../platform/tegra/vde}/dmabuf-cache.c        |    2 +-
 drivers/media/platform/tegra/vde/h264.c       |  946 ++++++++++++
 .../platform/tegra/vde}/iommu.c               |    2 +-
 .../platform/tegra/vde}/trace.h               |    2 +-
 drivers/media/platform/tegra/vde/v4l2.c       | 1018 ++++++++++++
 drivers/media/platform/tegra/vde/vde.c        |  551 +++++++
 drivers/media/platform/tegra/vde/vde.h        |  242 +++
 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/tegra-vde/Kconfig       |   10 -
 drivers/staging/media/tegra-vde/Makefile      |    3 -
 drivers/staging/media/tegra-vde/TODO          |    4 -
 drivers/staging/media/tegra-vde/uapi.h        |   73 -
 drivers/staging/media/tegra-vde/vde.c         | 1358 -----------------
 drivers/staging/media/tegra-vde/vde.h         |  125 --
 include/uapi/linux/v4l2-controls.h            |    2 +
 23 files changed, 2794 insertions(+), 1581 deletions(-)
 create mode 100644 drivers/media/platform/tegra/vde/Makefile
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/dmabuf-cache.c (99%)
 create mode 100644 drivers/media/platform/tegra/vde/h264.c
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/iommu.c (98%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/trace.h (97%)
 create mode 100644 drivers/media/platform/tegra/vde/v4l2.c
 create mode 100644 drivers/media/platform/tegra/vde/vde.c
 create mode 100644 drivers/media/platform/tegra/vde/vde.h
 delete mode 100644 drivers/staging/media/tegra-vde/Kconfig
 delete mode 100644 drivers/staging/media/tegra-vde/Makefile
 delete mode 100644 drivers/staging/media/tegra-vde/TODO
 delete mode 100644 drivers/staging/media/tegra-vde/uapi.h
 delete mode 100644 drivers/staging/media/tegra-vde/vde.c
 delete mode 100644 drivers/staging/media/tegra-vde/vde.h

-- 
2.34.1

