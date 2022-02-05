Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619E2F23
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 03:26:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64DD9472;
	Sat,  5 Feb 2022 04:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1644031039;
	bh=MF1Nry36t68LVNnn7A0TBCRFeeRlWgThbbD4gCDGK74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWM5tOZ/vlsN2sOXeMhg9byXmp3zj+gnxHIbmzeH5oiCx6lzgRd5syOh5pNAZFVLk
	 amn/V0MNfLEbnKKGXpz1zZt8wZ8UEVPbqEYNZBsF6KhhPLNyKJa9KrV9j6dylhwpdX
	 wVdDahyiONa97eeoQugHxOZOE9PgdgjCA1oM/SZQ=
Date: Sat, 5 Feb 2022 05:16:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] imx7/imx8mm media / csi patches
Message-ID: <Yf3sJuyNJWMOOo2D@pendragon.ideasonboard.com>
References: <20220204121514.2762676-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220204121514.2762676-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

On Fri, Feb 04, 2022 at 01:15:06PM +0100, Alexander Stein wrote:
> Hey everyone,
> 
> this is a set of patch for imx[7] media drivers based on next-20220203. With
> this set I was able to capture video frames from a MIPI CSI-2 camera in my
> TQMa8MQML + MBA8MX hardware. The actual camera used is a Vision Components
> 'VC MIPI IMX327 C' camera. IMX327 is compatible to IMX290. Patch 8 shows the
> DT overlay I'm using, not suitable for merging.

You may be interested in https://gitlab.com/ideasonboard/nxp/linux/-/commits/pinchartl/v5.17/sensors/

> Please ignore the FPGA part, this is mainly for power supply and GPIO reset
> line. This is currently a custom driver I'm working on, but I do not want to
> focus on in this series.
> 
> Please note I tested this only on this imx8 platform.
> 
> First thanks to Dorota for the patchset at [1] (patches 1-4) which is necessary
> to capture correct images. I integrated Hans' review into it. I hope the
> I didn't make a mistake and the original author is kept along. I used v4 for that
> patchset, it is v1 again in this set. I hope this is not confusing.
> 
> Starting from patch 5 there are small fixes which allows me to configure my
> media device.
> 
> Device configuration:
> ```
> media-ctl -l "'imx290 2-001a':0->'csis-32e30000.mipi-csi':0 [1]"
> media-ctl -V "'imx290 2-001a':0 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw]"
> media-ctl -V "'csi':0 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw]"
> v4l2-ctl -d0 --set-fmt-video width=1920,height=1080,pixelformat='RG10',field=none
> media-ctl -p
> ```
> 
> The media-ctl topology is:
> ```
> # media-ctl -p
> Media controller API version 5.17.0
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial          
> bus info        platform:32e20000.csi
> hw revision     0x0
> driver version  5.17.0
> 
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
>                 <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: Sink
>                 <- "csi":1 [ENABLED,IMMUTABLE]
> 
> - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:709 ycbcr:601 quantization:lim-range]
>                 <- "imx290 2-001a":0 [ENABLED]
>         pad1: Source
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:709 ycbcr:601 quantization:lim-range]
>                 -> "csi":0 [ENABLED,IMMUTABLE]
> 
> - entity 15: imx290 2-001a (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev2
>         pad0: Source
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw]
>                 -> "csis-32e30000.mipi-csi":0 [ENABLED]
> ```
> 
> Note: MIPI CSI settle times are not calculated correctly right now and need a
> manual overwrite:
> echo 13 > /sys/kernel/debug/32e30000.mipi-csi/ths_settle 
> echo 2 > /sys/kernel/debug/32e30000.mipi-csi/tclk_settle

The reference manual isn't very prolix on tclk_settle :-S That's
something I'd love to figure out one day.

For ths_settle, is the issue on the CSIS driver side, or the sensor
driver side ?

> I ignored the settings for xfer, ycbcr and quantization for now. I do neither
> know how they will affect me nor what it should be.
> Also I did not focus on v4l2-compliance tool, this is a further task as well.
> IMHO imx7-mipi-csis.c should also create an immutable link to the camera
> sensor.

That makes sense, but note that, while CSI-2 is meant to be a
point-to-point bus, there are boards designed with multiple sensors
connected to the same CSI-2 RX without any hardware multiplexer. They
keep one of the two sensors in reset at all times and are lucky that the
signal reflections don't mess things up.

> [1] https://patchwork.linuxtv.org/project/linux-media/patch/20211104113631.206899-2-dorota.czaplejewicz@puri.sm/
> 
> Alexander Stein (4):
>   media: imx: imx7_mipi_csis: store colorspace in set_fmt as well
>   media: imx: imx7_media-csi: Add support for additional Bayer patterns
>   media: imx: utils: Add more Bayer formats
>   [DNI] arm64: dts: tqma8mqml: add IMX327 MIPI-CSI overlay
> 
> Dorota Czaplejewicz (4):
>   media: imx: Store the type of hardware implementation
>   media: imx: Forward type of hardware implementation
>   media: imx: Use dedicated format handler for i.MX7/8
>   media: imx: Fail conversion if pixel format not supported
> 
>  arch/arm64/boot/dts/freescale/Makefile        |   4 +
>  .../imx8mm-tqma8mqml-mba8mx-imx327.dts        |  95 +++++++++++++
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |   3 +-
>  drivers/staging/media/imx/imx-media-capture.c |  20 ++-
>  drivers/staging/media/imx/imx-media-csi.c     |   3 +-
>  drivers/staging/media/imx/imx-media-utils.c   | 130 +++++++++++++++++-
>  drivers/staging/media/imx/imx-media.h         |   6 +-
>  drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
>  drivers/staging/media/imx/imx7-mipi-csis.c    |   1 +
>  9 files changed, 262 insertions(+), 15 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-imx327.dts

-- 
Regards,

Laurent Pinchart
