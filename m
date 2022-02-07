Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102E2F28
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 14:20:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id o2so1739622lfd.1
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 06:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h3tbiA/lTi3RceFrCX7kiLbJf35Q7/dK3vulX9P+oDY=;
        b=JW2DmgktGCtA3lWb39uboPmJ/rAOmziMI7D4FBMRu/JiWFb9Bc6bLr5fOzz9rFUAfJ
         NK6wb12oDKAPKRhNZ/njTuhqH3rm2S+jbCUPptrfVJvn8Bh9pXKBZfHMjXjl0p95S50K
         NNrKCnwFhWW81SOC1w3GvYNo4nEXMD87p0mGxYnboB44dBiB0ByLSCj0GZgs77XcvzyP
         aIzQ9pxln+8wLs9D+DjrTuU8IKmK5Bd/hsPHf/c3vdguyYDc36ezSmZhb8eJOVDJKwOT
         RdYOqBYM09vlVdcUbPMcjQWFdH/F1KPo3xWR51ptcNMmjXgu0DUVdnyJjBb/pVNZByL/
         Y4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h3tbiA/lTi3RceFrCX7kiLbJf35Q7/dK3vulX9P+oDY=;
        b=LffFw/VRVHTYywHSv39VfF7m8bwHQbChID7Ou4WSamR9e5uqL6GdbTPOF7ybXUTPU3
         /R2Oz9jXn7C6jNB3g+us2ByOsshMrvUDfNbGFr/8GuOVQbK+ELwtLf5A8wjgmZXraYFr
         T1xZFtH5mYnNnqivbbQr5LUxxWocYAtIBvNsj9Vh7Nst0knXO0FnYAQqbrvkZ1lvga6C
         Y8J011nDKRcTM7qPZZHvmCq3dkx45WToBucYmnfaDfd96lMjjz5D0wiNS5iSyZk8Qi8y
         6TMcdHb4PoZ5O9aCiNWpDzEaOZgJxkd8cj2RqjcjwwmntNoutsWYW7NV0NDye6GusNjk
         8iYw==
X-Gm-Message-State: AOAM531e1ZBWTqbC4DlfgPx8Iv+Gz4MbbvjIIljjZHjQdjWcZUBrLhIr
	mF53wZ5Nd4nH3XwmPGulp/g=
X-Google-Smtp-Source: ABdhPJz2jRYtIQf+VDpFxEpPreJRl6beEed6w0QevCoUzi6YYmwUUYAO93liG/ahZTUzdPK/TXnA8Q==
X-Received: by 2002:ac2:59ca:: with SMTP id x10mr8666478lfn.499.1644243620782;
        Mon, 07 Feb 2022 06:20:20 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id t13sm1515599lfl.94.2022.02.07.06.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 06:20:20 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add V4L stateless video decoder API support to NVIDIA Tegra driver
Date: Mon,  7 Feb 2022 17:19:33 +0300
Message-Id: <20220207141937.13089-1-digetx@gmail.com>
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

Dmitry Osipenko (4):
  media: v4l2-ctrls: Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
  media: staging: tegra-vde: Factor out H.264 code
  media: staging: tegra-vde: Support V4L stateless video decoder API
  media: staging: tegra-vde: Remove legacy UAPI support

 .../media/v4l/ext-ctrls-codec-stateless.rst   |    6 +
 drivers/staging/media/tegra-vde/Kconfig       |    7 +
 drivers/staging/media/tegra-vde/Makefile      |    2 +-
 .../staging/media/tegra-vde/dmabuf-cache.c    |    2 +-
 drivers/staging/media/tegra-vde/h264.c        |  946 +++++++++++++++
 drivers/staging/media/tegra-vde/iommu.c       |    2 +-
 drivers/staging/media/tegra-vde/uapi.h        |   73 --
 drivers/staging/media/tegra-vde/v4l2.c        | 1018 +++++++++++++++++
 drivers/staging/media/tegra-vde/vde.c         |  945 ++-------------
 drivers/staging/media/tegra-vde/vde.h         |  121 +-
 include/uapi/linux/v4l2-controls.h            |    2 +
 11 files changed, 2170 insertions(+), 954 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/h264.c
 delete mode 100644 drivers/staging/media/tegra-vde/uapi.h
 create mode 100644 drivers/staging/media/tegra-vde/v4l2.c

-- 
2.34.1

