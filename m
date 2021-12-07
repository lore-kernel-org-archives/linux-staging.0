Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29E62CA6
	for <linux-staging@lists.linux.dev>; Tue,  7 Dec 2021 01:54:59 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id p23so15199177iod.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 17:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GG9IZeKUXqHbwgRlEUez+S6LOG7iNmAE27aQpf7wARQ=;
        b=WqIK77xBg4jom+nkZAVdSaO+QIg13np6F3MKrEpOJxlgBj0edb47bwPLekDQTHcKeK
         FA6d4WHrbDFppB6kaDqVZOMsV1vBjPQVh+b4LV0tRsPi9oMulqUiJH5AW3HVYjxnKDGs
         uiJfjNrUOd9TGOE79/VgAXaRCZsG4oJoFZvJtzTzigoTIhct5DRYBLL89/UYpa3oWGnb
         2cRrKUPPdp9rsOuSJ89vNpJXKg8+bnCPY4SW7GDNgMJ+6s5AeDatpN1Qz0elwnESIzuU
         dL9ubYC0HXa/RCrG9fznbfdPuUPwHGAkPD0ahJB7VYnU5Yo6PtQwfb/ObYmEDfcGR4lg
         +VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GG9IZeKUXqHbwgRlEUez+S6LOG7iNmAE27aQpf7wARQ=;
        b=QnMh6QDzOnRbiqfBY64Ff6Q856xg+YWmbtE0b6M1lFTPynPEJ/W2oNzi7caZBFiLiz
         oM5wureXMOJbk7yBV61piZGJhr9C99iEHJGfkeFJdeiEGnl0PVETLwLXLrehVd7DJeMs
         sN93w9Lu3O/icli3u3NPJtLeoYgucxr2/IZaeMfGb4sUM+lOeMLuR+cd9TUVG4FX+2Jo
         eN5Tjwix33RLOup9Ptr+DHT2rA1wTIvxUwogAYxktUiaoDgUrl4DSu1ouGhcIkG5INom
         CepaXpwUawxCzYHfk9kEeyZ16nRYFVQoqor/eG5eQxNLFCvobny7GprJ2GtmI6hxe4nS
         JNoA==
X-Gm-Message-State: AOAM530LPzoNQTU+Y3hlNr0yTzz9OKchthzyzF/gVaaLpmajOFatsii0
	DvhmSwWrcDM5SWLbzFY6upI=
X-Google-Smtp-Source: ABdhPJxXzleMgy7efHrDCU1qKOzpEcVeClDkZTXS6ODGap4b87zAOAQznzyyx/BOUpKMQ3mjTanv4w==
X-Received: by 2002:a6b:c881:: with SMTP id y123mr36840733iof.53.1638842098503;
        Mon, 06 Dec 2021 17:54:58 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6db8:c9e4:6f6d:f38e])
        by smtp.gmail.com with ESMTPSA id j21sm8623639ila.6.2021.12.06.17.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 17:54:58 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: cphealy@gmail.com,
	benjamin.gaignard@collabora.com,
	hverkuil@xs4all.nl,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC V2 0/6] media: Hantro: Split iMX8MQ VPU into G1 and G2 with blk-ctrl support
Date: Mon,  6 Dec 2021 19:54:39 -0600
Message-Id: <20211207015446.1250854-1-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the VPU in the i.MQ8MQ is appearing as one codec, but in
reality, it's two IP blocks called G1 and G2.  There is initialization
code in VPU code to pull some clocks, resets and other features which
has been integrated into the vpu-blk-ctrl for the i.MX8M Mini and a
similar method can be used to make the VPU codec's operate as 
stand-alone cores without having to know the details of each other
or the quirks unique to the i.MX8MQ, so the remaining code can be
left more generic.

This series was started by Lucas Stach with one by Benjamin Gaignard.
Most patches have been modified slightly by me.  It's in an RFC state
because I wasn't sure how to best handle the signatures and wasn't sure
if I could base it off the branch I did.

Since the g-streamer and media trees are in a constant state of
change, this series is based on

git://linuxtv.org/hverkuil/media_tree.git for-v5.17e

The downstream code from NXP shows the G1 and G2 clocks running
at 600MHz, but between the TRM and the datasheet, there is some
discrepancy.  Because the NXP reference code used 600MHz, that is
what was chosen here.  Users who need to adjust their G1 and G2
clocks can do so in their board files.

Fluster Results:

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 90/135 tests successfully               in 61.966 secs

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 55/61 tests successfully               in 7.660 secs


./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
Ran 144/303 tests successfully               in 162.665 secs

Changes log:

V2:  Make vpu-blk-ctrl enable G2 clock when enabling fuses.
     Remove syscon from device tree and binding example
     Added modified nxp,imx8mq-vpu.yaml from Benjamin Gaignard 

Adam Ford (2):
  media: hantro: split i.MX8MQ G1 and G2 code
  arm64: dts: imx8mq: Split i.MX8MQ G1 and G2 with vpu-blk-ctrl

Benjamin Gaignard (1):
  dt-bindings: media: nxp,imx8mq-vpu: Update the bindings for G2 support

Lucas Stach (3):
  dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
  dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
  soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  58 +++++----
 .../soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml      |  71 +++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  69 ++++++----
 drivers/soc/imx/imx8m-blk-ctrl.c              |  68 +++++++++-
 drivers/staging/media/hantro/hantro_drv.c     |   4 +-
 drivers/staging/media/hantro/hantro_hw.h      |   2 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 119 +++---------------
 include/dt-bindings/power/imx8mq-power.h      |   3 +
 8 files changed, 237 insertions(+), 157 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml


base-commit: d1888b0bfd2ddef2e8a81505ffa200b92cc32e0c
-- 
2.32.0

