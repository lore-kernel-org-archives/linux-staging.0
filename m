Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E36AA6
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 20:25:20 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id x5so3695778edi.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcjgtAok98U2SdMAJ0Kw//o2AG36vAJD03liJbGmfKA=;
        b=QmCRISHCtLT+nw3UyvqMWIcz2JHpZRJ3D/RM3RoaQUco5QZdlnmA6O44Y4WVp8YSWs
         yoHUczvN/fqgBGNgXJQEUtGy95ns7Fu6s1kSfrF9F7zUoGf4l6EonDRTo8TIvRO/T9GM
         9NgleDUsZiDfY5O4grl6ShE0f9roHAPrIg4HW2S4Nnq6NSyaNoLWbnFxhiz949wGw2iS
         kJA4EcIAwVU9R1/GLXGN1Qj4Q5uBMUJ44WhV06KKSICX3GxrpLY6KEGF5XpuDEpopsAu
         SAwZmkBveS9R8OE2GX5hPiM7RK587tFIMSaal5EUQ7CQOLOsOSJmYLuxKx4o6VMHNqNK
         U6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcjgtAok98U2SdMAJ0Kw//o2AG36vAJD03liJbGmfKA=;
        b=oBNaTyR9cz+k4ewhXd3zANVbEyVef7xYASUjyZK673idx/QB2pD8d//nSX2158PYCi
         jiPFEKGIt+qjBeXZbI2z9Rb5JCKrfMqGSDjNlP8S8IGpn4tCxyGaHqPPuHCPm1AqhPC8
         gDZ/5OPZQf6H29lHHNCR9/TNyXUVEpjTavXFGYL5dz2gpnbQP1Bo4AByV21jX9CtS24v
         HNFclJV/EArhuKuT7wzUpbvejfc1jSVK+D40hwMpA0QEHfchLeJKCCqU1/bJIHx0yTkJ
         HCjfIck26m9corpU7+3rcMWj08ltevnPBNcy5ibDppL89lWDYvDqaFX+ztQ+X3g8c5We
         MDeA==
X-Gm-Message-State: AJIora8SGmNwJQ6Vd0a/AQqfn0nGBIFNbR7hBhVCjzRGuNFGL1AnxXrf
	dQps720vG624Um677Z8DFAU=
X-Google-Smtp-Source: AGRyM1va8bmngwqVTSbwaYJ/gAA2ee63zz6lO5d5tNZrnNA6y3P7Nr9g2uZFj4UdnOWIR3Jiv9JYjA==
X-Received: by 2002:a05:6402:60d:b0:42f:ac38:af75 with SMTP id n13-20020a056402060d00b0042fac38af75mr8463062edv.203.1655411119232;
        Thu, 16 Jun 2022 13:25:19 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906329500b006fe8a4ec62fsm1186760ejw.4.2022.06.16.13.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:25:18 -0700 (PDT)
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
Subject: [PATCH v2 0/7] media: hantro: Add 10-bit support
Date: Thu, 16 Jun 2022 22:25:06 +0200
Message-Id: <20220616202513.351039-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 10 files changed, 136 insertions(+), 20 deletions(-)

-- 
2.36.1

