Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F90A539E
	for <linux-staging@lists.linux.dev>; Wed,  6 Jul 2022 18:29:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g39-20020a05600c4ca700b003a03ac7d540so12079764wmp.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Jul 2022 11:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=veq/Lh4TlAFiqd2as2QsDi+5Sf/Jvx1yYHKwqofOJ9o=;
        b=D/GBtbDoDrd9WwaKJrXkQPvMJSnhagjGlrMvRdZngoIOSQDMFwf3riNka9sKWeqUNZ
         68j9wAd8P1tOp6+eYbBL3LPhXmcL7ncpp3SJbkkONwh9iHnHCvJ0LgIh0ehHtblz6Xy/
         mROak7qhzqZU18vdXSDiBY8UhDFH5gcTJ+UksgT6qUUwNmbmFP3P2OKXyEC0qMF1jZfu
         f9p1UF3PpXu/MPUbJN44Um5RfZ/DowbA8xZPZKvbhPd27bczcpR90fcMTtf5GNkgIHXv
         CLclsFl7XWUrDyTonvk+LNSWdVcvt4vpOy0tqASojUCUBmYAGcuvq1TJ5JO93XcQfVq+
         lTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=veq/Lh4TlAFiqd2as2QsDi+5Sf/Jvx1yYHKwqofOJ9o=;
        b=YkH3TVHvuto5VMmkPiul8aMjIMG32Kjt4+Fk9lVEprWX/vfzVlg5UEHOKZKgty9dW7
         5YYWB9szyLqmVUiv7xBp3E7Y9jfag5iEwRyD36oMMGPVaxUzUNkeIWR12ZIvqJpA1upT
         kPywpEiVFIMwQ+FgFmp8kEW1XRuMKA/MV/SKnbgkrmiT1G5GtcxuekOxKqYtutfmIr0m
         ijy3m+odGvk1vnEdXCsQjH/YhydNOF8Z49zW8zyYqB/6wSJkOUahf4E4gmWg7/paE5Kb
         wLCuck8FKJj3GwsiTWDrcc4d+8Wh6GTFz49b/rg6wDftcHodia+3fG8nfp9G+VR16N3/
         ApBQ==
X-Gm-Message-State: AJIora8apR/wghvs5oTygUVfm4mk6UINrMInPDVz2NtQ9PGTHnxy76e3
	hyZRlLugKsdw6Fpc06XVDHU=
X-Google-Smtp-Source: AGRyM1v+PzFf3H84UTOcP8kXa3ogDH7CjY7F56uHMLIutxGcHvpSyE47mzgtd7yg9gcVbPZPjDejGQ==
X-Received: by 2002:a05:600c:600d:b0:3a1:9712:5d31 with SMTP id az13-20020a05600c600d00b003a197125d31mr24463802wmb.67.1657132151725;
        Wed, 06 Jul 2022 11:29:11 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm5142406wru.28.2022.07.06.11.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:29:11 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com,
	nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 0/7] media: hantro: Add 10-bit support
Date: Wed,  6 Jul 2022 20:28:54 +0200
Message-Id: <20220706182901.78949-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.37.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for 10-bit format handling in Hantro driver.
Most patches adjust postproc behaviour to be more universal. There is
a lot of assumptions, which need to be replaced with more generalized.

Tested on Allwinner H6. Tested with vp92-2-20-10bit-yuv420.webm sample,
which produces correct checksum.

Please take a look.

Best regards,
Jernej

Changes fron v2:
- rebased on media-stage/master
- added P010 4L4 format documentation
- added t-b and r-b tags

Changes from RFC:
- fixed typo in function name
- removed merged patch (P010 format)
- removed broken patch (sunxi frequency change)
- added new patch (media: hantro: postproc: Properly calculate chroma offset)
- added r-b from Ezequiel

Ezequiel Garcia (1):
  media: Add P010 tiled format

Jernej Skrabec (6):
  media: hantro: Support format filtering by depth
  media: hantro: postproc: Fix buffer size calculation
  media: hantro: postproc: Fix legacy regs configuration
  media: hantro: postproc: Properly calculate chroma offset
  media: hantro: Store VP9 bit depth in context
  media: hantro: sunxi: Enable 10-bit decoding

 .../media/v4l/pixfmt-yuv-planar.rst           | 18 +++++--
 drivers/media/v4l2-core/v4l2-common.c         |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 drivers/staging/media/hantro/hantro.h         |  4 ++
 drivers/staging/media/hantro/hantro_drv.c     | 23 +++++++++
 .../staging/media/hantro/hantro_g2_vp9_dec.c  |  8 ---
 .../staging/media/hantro/hantro_postproc.c    | 38 +++++++++++---
 drivers/staging/media/hantro/hantro_v4l2.c    | 50 +++++++++++++++++--
 drivers/staging/media/hantro/hantro_v4l2.h    |  3 ++
 drivers/staging/media/hantro/sunxi_vpu_hw.c   | 27 ++++++++++
 include/uapi/linux/videodev2.h                |  1 +
 11 files changed, 151 insertions(+), 23 deletions(-)

-- 
2.37.0

