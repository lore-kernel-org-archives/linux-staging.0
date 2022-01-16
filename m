Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD122C9D
	for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 18:56:40 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id o12so32801253lfu.12
        for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 10:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4FmdEgxbwPubxxkiia0kL4WCWZwqzpIW7ElFWNYU4w=;
        b=nd2wFlld9Wox3ENuyt7ne2Y/cGmtRcvWl4a5Lz2OMrM/SQr0/KGsi7H43qpU9uqKeB
         iA2d826iTLLmq441+mZJB8Zqg7SGO7PF7RhfIWJmpGxry0M5OawIUxWjtG928YVNicep
         DOykfnwQPQ9hPLpk6fT+tjiMJf/Pxl7kiTKEbfi9SPm5ma4o+k9KeQJD9w30+DgHgFUH
         euVjst8As27WKt1SNSljgMBvLgxdR3W4HImDj22mIHxaEWoc0/Ck5HKgddSoRALqOghN
         RNAJYHf9/svbxHnwNsKuKKDbjXS2ATgb5zP2sRTGx6LKZTWucWnwCTf9m+/VPwS7p8Zf
         YYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4FmdEgxbwPubxxkiia0kL4WCWZwqzpIW7ElFWNYU4w=;
        b=6ZKX6ua3qIhd3Xwb6zYQgJ1wfxzKjBt4trZ+vifbiUB24pGwrE9RkjR2WefdJ3aWBf
         y8OBFdQxIzehmAY62S4E6EHav2yz7Zo8NZcHvlOOPN4jGuiA2XeJw6GJ+qqcuvq6oL9q
         zmCoNYMG5JFKBTFf1RNv0qzBkunL/4o8uth8VbZOrwBNvNbspY8UvM6Q8N0xP+NzuxwX
         KwCyKhc90FHQeHrowDWo/qVBhX8EdZVUn6VwOd2i4Zb2XPPLiyqEHCRZxeeV6apla2U8
         A4zJHDqOB9VPARTvOeK/qR+wfpmwzzTQG+Oz2n0uSOE0EQW6FiHlXKuaUNOb+xtiB4jF
         zxaQ==
X-Gm-Message-State: AOAM530+TqvzR42sIe343fqxkVr4eXwxMHr04i6SxqJy6689HRLzHL6T
	DEwwJL+EOyZSDqtGmI6/moA=
X-Google-Smtp-Source: ABdhPJwKMDcf+qSy168mw1tEQzGEQb93396LqX75APtUu/vyMHnWvtpiNM4h5UqaYX1yiaWMRmSBmw==
X-Received: by 2002:a05:6512:ea9:: with SMTP id bi41mr13930971lfb.54.1642359398013;
        Sun, 16 Jan 2022 10:56:38 -0800 (PST)
Received: from localhost.localdomain (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.gmail.com with ESMTPSA id j2sm1179597lfe.18.2022.01.16.10.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 10:56:37 -0800 (PST)
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
Subject: [PATCH v2 0/3] Add V4L stateless video decoder API support to NVIDIA Tegra driver
Date: Sun, 16 Jan 2022 21:55:53 +0300
Message-Id: <20220116185556.10657-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support V4L stateless video decoder API by NVIDIA Tegra decoder driver.
Tested using GStreamer [1] and libvdpau-tegra [2].

[1] https://github.com/grate-driver/gstreamer/commit/b8509bdbb69b534e61419ea1798f32f9ad2f3597
[2] https://github.com/grate-driver/libvdpau-tegra/commit/f822e95911e5e0c39f8ba19f843ddc1e0138d5ce

Changelog:

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

Dmitry Osipenko (3):
  media: staging: tegra-vde: Factor out H.264 code
  media: staging: tegra-vde: Support V4L stateless video decoder API
  media: docs: dev-stateless-decoder: Document frame type flags

 .../media/v4l/dev-stateless-decoder.rst       |    3 +
 drivers/staging/media/tegra-vde/Kconfig       |    7 +
 drivers/staging/media/tegra-vde/Makefile      |    2 +-
 drivers/staging/media/tegra-vde/h264.c        |  940 +++++++++++++++
 drivers/staging/media/tegra-vde/v4l2.c        | 1018 +++++++++++++++++
 drivers/staging/media/tegra-vde/vde.c         |  700 ++----------
 drivers/staging/media/tegra-vde/vde.h         |  127 ++
 7 files changed, 2181 insertions(+), 616 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/h264.c
 create mode 100644 drivers/staging/media/tegra-vde/v4l2.c

-- 
2.33.1

