Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B152168
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:31:32 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id n17so1907751iod.4
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p13TQCGRgvTCj7GLIu8Z93zm/cda7I2vNls+/ZaL0QM=;
        b=JBqdhLlyiTRdjTAFVH2wDzWwLUlOYdDczEEuEf3zHgPMq7wBbGHcAuS+BNwoDx5jm4
         JFCeOQ1konG8R5lKoNXtYBPDwh9BbIptwVvqRBup3R0p5AWm15vQg/MkRwRVPqno9Qrt
         Gb9FgCFYqRtcXQvE+Gx9I1Nr6rziQBKGK0BuUOHQWl5yd1320wVfpphrLhkqmlM8TK4G
         cEZFceZGifQnrJ2ChiiYOes9MtiEZJm8hfqNXexTFcn9xW5zRliNSeVJUL4lwq1XHkjw
         zFW+KTAWl8Av+kfeLL2jpULggIOn3BQRpq1wA5/BkkB+JrBthfm1c9iId2VMg0A8N6wv
         8YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p13TQCGRgvTCj7GLIu8Z93zm/cda7I2vNls+/ZaL0QM=;
        b=faeUCxS2pQivYjQckffkbGgIS9I+2AFuW1woYExHFqwu3/jp3qLhT023wYe4E4LPin
         NZzikNwm+1NeznigF2MjRDa0tePorz6UmJt/PqELwPWsf3xvf0UZX3WOJyLlQ2laZC9f
         SurWvb9WSWGZdMP9uIIE8eR2GC2ElciMUZ0H4h8VuoJZIRQFTsy56ByrlGNHb3ihFub6
         znz5iVXo8oYX3yB4YLByFSzSTEKevW+5QtnETuCk6kog5gxPwovrnQhknWn7BfdDsmgS
         QWEpXSedvTvI6KN+mtJiOBYElE0AP8lqVPMO49gmlMgSTO8ixuOv8RYYbKOWyZcrQeg7
         VJEQ==
X-Gm-Message-State: AOAM530c0Yro6SIQB3DZNOfQfHusPyY1Fk7TAlJgcVeaVlLsHdhSsy01
	DW3PIZZHGxt3xtR7WYnvWQI=
X-Google-Smtp-Source: ABdhPJzHCWRlnTtYi6nXYxXBg2TQ4f+2rkUAUGFd1hsyBRLoC3kM1to4BkOmAaLnPAU6IfQ3gDwJ/Q==
X-Received: by 2002:a05:6602:1407:: with SMTP id t7mr7255403iov.78.1642991491139;
        Sun, 23 Jan 2022 18:31:31 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:582d:ad0e:e5a6:94b6])
        by smtp.gmail.com with ESMTPSA id w4sm6625633ilq.56.2022.01.23.18.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:31:30 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V3 00/10] media: hantro: imx8mq/imx8mm: Let VPU decoders get controlled by vpu-blk-ctrl
Date: Sun, 23 Jan 2022 20:31:14 -0600
Message-Id: <20220124023125.414794-1-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the i.MX8MQ and i.MX8MM have G1 and G2 decoders.
The two decoders are similar, but the imx8mm lacks the
post-processor, so they will have distinct compatible flags.

From what I can tell, the G2 decoder wasn't working, so splitting
the i.MX8MQ VPU into G1 and G2 makes it easier to control them
independently since the TRM of both the i.MX8MQ and
i.MX8MM list them as distinct IP blocks. This also allowed G2 to
become available.

With them being split, the power-domain can shift to the
vpu-blk-ctrl which is available on both i.MX8MQ and i.MX8MM,
but some of bits are different, so they'll have separate bindings.

Lastly, with the G1 and G2 operational, enable the i.MX8MM.
On the i.MX8MM, the clock speed of 600MHz was chosen to match
the default of the kernel repo from NXP and can be overwritten
by board files for anyone who under/over volts the power rail.

There seems to be some disagreement between the TRM and the Datasheet
for the imx8mq as to whether the speed should be 300MHz (TRM) or
600MHz (datasheet), so feedback from NXP would be very much
appreciated.

The repo used as the starting point was:
5.17-rc1

Fluster was run on both i.MX8MM and i.MX8MQ

At 600 MHz, the i.MX8MM had the following:

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 55/61 tests successfully               in 8.299 secs

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 90/135 tests successfully               in 71.200 secs

./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
Ran 139/303 tests successfully               in 218.079 secs

The i.MX8MQ had the following:

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 55/61 tests successfully               in 7.732 secs

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 90/135 tests successfully               in 58.558 secs

./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
Ran 144/303 tests successfully               in 271.373 secs

V3:  Rebase on 5.17-RC1.
     Remove imx8mm-vpu-g2 since it's identical to imx8mq-vpu-g2
     Remove unnecessary examples in YAML files.
     Remove some unused variables.

V2:  Remove references to legacy dt-binding from YAML, but keep
     it in the driver so older device trees can still be used.
     Fix typos in YAML
     Remove reg-names, interrupt-names, and clock-names from YAML,
     since each node will only have one of each, they're not necessary
     Add Fluster scores to cover letter for i.MX8MQ


Adam Ford (7):
  dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes
  media: hantro: Allow i.MX8MQ G1 and G2 to run independently
  arm64: dts: imx8mq: Enable both G1 and G2 VPU's with vpu-blk-ctrl
  arm64: dts: imx8mm: Fix VPU Hanging
  dt-bindings: media: nxp, imx8mq-vpu: Add support for G1 on imx8mm
  media: hantro: Add support for i.MX8MM Hantro-G1
  arm64: dts: imx8mm: Enable Hantro G1 and G2 video decoders

Lucas Stach (3):
  dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
  dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
  soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl

 .../bindings/media/nxp,imx8mq-vpu.yaml        | 68 ++++++++----------
 .../soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml      | 71 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 23 +++++-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 63 +++++++++-------
 drivers/soc/imx/imx8m-blk-ctrl.c              | 66 +++++++++++++++++
 drivers/staging/media/hantro/hantro_drv.c     |  2 +
 drivers/staging/media/hantro/hantro_hw.h      |  2 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 62 ++++++++++++----
 include/dt-bindings/power/imx8mq-power.h      |  3 +
 9 files changed, 283 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.32.0

