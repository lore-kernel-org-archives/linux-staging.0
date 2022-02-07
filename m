Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF322F25
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644224400; x=1675760400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3q7+SqBI2GgshV3UoRqEu16qrk0YWcyeAt/eQ10eGQQ=;
  b=BIAcytUi+yN5ol095S0Kw29te+fHaKEt4EFdbn8DlLZgFOqwsulP5TEl
   nsGpRzXZtzvf3VWo6Hq2oFKMv0KfR/9NT4m2DvPafCjcdyZEPQ3upnXFW
   AT8REj7HIJWF1HYx+DQga99c1hlqq8Xwj691WgJTrPQ5oOq2hjfO5K9dp
   dDa3JM5FYAf4BXih11xZRbqyqVMJl5ve8dA6ZmR8p6wtu3IuSi53opspT
   E7Kzr71a60rCM5hPYeAYS5v9rOiH6RDsvwGC3AF9ustF+D4XpbnCpfTsW
   gR0nGz7Kft8gaDn8V7m0apTQfr/Oj1uJLR9pZzFTk42tB09+zM97QfgVe
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,349,1635199200"; 
   d="scan'208";a="21926093"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 07 Feb 2022 09:59:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 07 Feb 2022 09:59:51 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Mon, 07 Feb 2022 09:59:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644224391; x=1675760391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3q7+SqBI2GgshV3UoRqEu16qrk0YWcyeAt/eQ10eGQQ=;
  b=fKmaIiHbp+6AdAp/d22RJ7EIZVM9jMSOArCTXAdRipzOsT0g5A5+AlMw
   5Xi4U/G7stcN6qccKshBR3I55eNBlClOkj3OuN+h543ulaInTZS7rDGUX
   vtqGJtJhwS8oAXPTMR1deWPetnrkwWzs+g8HmmVRruSxFJrNO1Y70ppHt
   WM6BJl3Xo7Z3QxQNRjEXWKpeVirQ1qUlnm5JsQfMyfCYnef+74567wL7M
   SpNa8ta0K4DBFasYsHPYUaLKuFSC7WXG3kr+4gK8vCYWHr+YbBHjaFMEf
   pdXYXaca15inuXQqRrH1P72Kh6b3kdhh/3jRIIWxkA19hFax1dVzaeWdq
   g==;
X-IronPort-AV: E=Sophos;i="5.88,349,1635199200"; 
   d="scan'208";a="21926091"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Feb 2022 09:59:50 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9D5C7280065;
	Mon,  7 Feb 2022 09:59:50 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (EXT) Re: [PATCH 0/8] imx7/imx8mm media / csi patches
Date: Mon, 07 Feb 2022 09:59:48 +0100
Message-ID: <3154909.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Yf3sJuyNJWMOOo2D@pendragon.ideasonboard.com>
References: <20220204121514.2762676-1-alexander.stein@ew.tq-group.com> <Yf3sJuyNJWMOOo2D@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Laurent,

Am Samstag, 5. Februar 2022, 04:16:54 CET schrieb Laurent Pinchart:
> On Fri, Feb 04, 2022 at 01:15:06PM +0100, Alexander Stein wrote:
> > Hey everyone,
> > 
> > this is a set of patch for imx[7] media drivers based on next-20220203.
> > With this set I was able to capture video frames from a MIPI CSI-2 camera
> > in my TQMa8MQML + MBA8MX hardware. The actual camera used is a Vision
> > Components 'VC MIPI IMX327 C' camera. IMX327 is compatible to IMX290.
> > Patch 8 shows the DT overlay I'm using, not suitable for merging.
> 
> You may be interested in
> https://gitlab.com/ideasonboard/nxp/linux/-/commits/pinchartl/v5.17/sensors
> /

Thanks for your feedback. Working on imx290 driver for proper imx327 support 
is on my todo. For the records, there are also patches at [1].

> > Please ignore the FPGA part, this is mainly for power supply and GPIO
> > reset
> > line. This is currently a custom driver I'm working on, but I do not want
> > to focus on in this series.
> > 
> > Please note I tested this only on this imx8 platform.
> > 
> > First thanks to Dorota for the patchset at [1] (patches 1-4) which is
> > necessary to capture correct images. I integrated Hans' review into it. I
> > hope the I didn't make a mistake and the original author is kept along. I
> > used v4 for that patchset, it is v1 again in this set. I hope this is not
> > confusing.
> > 
> > Starting from patch 5 there are small fixes which allows me to configure
> > my
> > media device.
> > 
> > Device configuration:
> > ```
> > media-ctl -l "'imx290 2-001a':0->'csis-32e30000.mipi-csi':0 [1]"
> > media-ctl -V "'imx290 2-001a':0 [fmt:SRGGB10_1X10/1920x1080 field:none
> > colorspace:raw]" media-ctl -V "'csi':0 [fmt:SRGGB10_1X10/1920x1080
> > field:none colorspace:raw]" v4l2-ctl -d0 --set-fmt-video
> > width=1920,height=1080,pixelformat='RG10',field=none media-ctl -p
> > ```
> > 
> > The media-ctl topology is:
> > ```
> > # media-ctl -p
> > Media controller API version 5.17.0
> > 
> > Media device information
> > ------------------------
> > driver          imx7-csi
> > model           imx-media
> > serial
> > bus info        platform:32e20000.csi
> > hw revision     0x0
> > driver version  5.17.0
> > 
> > Device topology
> > - entity 1: csi (2 pads, 2 links)
> > 
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         
> >         pad0: Sink
> >         
> >                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw
> >                 xfer:none ycbcr:601 quantization:full-range] <-
> >                 "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
> >         
> >         pad1: Source
> >         
> >                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw
> >                 xfer:none ycbcr:601 quantization:full-range] -> "csi
> >                 capture":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 4: csi capture (1 pad, 1 link)
> > 
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> >         
> >         pad0: Sink
> >         
> >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > 
> > - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
> > 
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> >         
> >         pad0: Sink
> >         
> >                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw
> >                 xfer:709 ycbcr:601 quantization:lim-range] <- "imx290
> >                 2-001a":0 [ENABLED]
> >         
> >         pad1: Source
> >         
> >                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw
> >                 xfer:709 ycbcr:601 quantization:lim-range] -> "csi":0
> >                 [ENABLED,IMMUTABLE]
> > 
> > - entity 15: imx290 2-001a (1 pad, 1 link)
> > 
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev2
> >         
> >         pad0: Source
> >         
> >                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw]
> >                 -> "csis-32e30000.mipi-csi":0 [ENABLED]
> > 
> > ```
> > 
> > Note: MIPI CSI settle times are not calculated correctly right now and
> > need a manual overwrite:
> > echo 13 > /sys/kernel/debug/32e30000.mipi-csi/ths_settle
> > echo 2 > /sys/kernel/debug/32e30000.mipi-csi/tclk_settle
> 
> The reference manual isn't very prolix on tclk_settle :-S That's
> something I'd love to figure out one day.
> 
> For ths_settle, is the issue on the CSIS driver side, or the sensor
> driver side ?

I can't answer that yet, but during my work on a fslc linux-5.10 I noticed 
that the link frequency and/or some other clock was wrong, so the calculated 
value didn't match.
Anyway I get the impression that the final values might also be affected by 
the actual hardware. But I do not know any details regarding this.

> > I ignored the settings for xfer, ycbcr and quantization for now. I do
> > neither know how they will affect me nor what it should be.
> > Also I did not focus on v4l2-compliance tool, this is a further task as
> > well. IMHO imx7-mipi-csis.c should also create an immutable link to the
> > camera sensor.
> 
> That makes sense, but note that, while CSI-2 is meant to be a
> point-to-point bus, there are boards designed with multiple sensors
> connected to the same CSI-2 RX without any hardware multiplexer. They
> keep one of the two sensors in reset at all times and are lucky that the
> signal reflections don't mess things up.

Still, even if only one device is actually powered, it is a immutable link 
from v4l2 perspective. You don't switch the sensors on the fly, or do you 
really do that? In the end immutable links are only a minor issue (to me).

Regards,
Alexander

[1] https://github.com/raspberrypi/linux/commits/rpi-5.10.y/drivers/media/i2c/
imx290.c



