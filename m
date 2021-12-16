Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC6C2C9C
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 12:35:12 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id m25so25198187qtq.13
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 04:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vMJB1aoNNzykfp3G/uhAU//Zm4FJ8pgEumwJR4eZPQE=;
        b=uVZapaBZWViN/Kq9YIuwvz4r3LUokp9yMQsFGhGsCNTzIPUjuXRDCB8GbPjN4KT+oF
         ljnZRQDH6Fco83Pgrz9A1enMk+PecgORM0/KTg6HVPb41+ziDA48Ak517+iIemcqL7fQ
         5kwBxWPTgIWQysVWugryjk+EsSDhyWFygimVbeTIw2ptHyw0C7FUhLGQDCaIkjij6TUx
         IttwSYAGslyVxKxaFe7pO827gPeIO8Z2Hf5pNo0a6LdDzMl4muVwaJ7KxjSQUt54ivq/
         9EY3NqEQmsxuuplFvO0ASJ51/OqpOvzDOdJB/1th7P0InWmo2m+Hfr0Bwzj7Ug3RYqbM
         ffvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vMJB1aoNNzykfp3G/uhAU//Zm4FJ8pgEumwJR4eZPQE=;
        b=5RAyQwVrMOHU+Azfq8x6ZGYi8QhQP/7ybp6LLzKgM8cerxplWuEDcAjIAlN23wO3wB
         2Dda8hzJbNw3zJA3e9btZxWgCjK19Edc/BqELqHu9Ko/72O6jvmJnhHZCJztAveAiRsr
         JUTT/Bq/kTHjBylaiu/AqspJsjtc7gikNlbUOBLI73jJQLHWkEyiABK/f7x4rS8iC97x
         I2JXQwtPcAnbB7lfmZ870FOxTgs6hFlYFtUAvzeHfT/pCQ7h2BEEdehEvAExJTdB8LvH
         b0TRtz0s1vk3pvc8r1Yeokiu7t7eLu9Nyiqnz05cV/cNASf2S8BgjucdPo6pcZzYneOq
         //6w==
X-Gm-Message-State: AOAM533rqAV71Rs7ED8v17C9kxIgZ/gg6aqNRyYRo51AXQYZqQYgCGst
	kqlb3aOwFy1joLYqd1V7+6mzrg==
X-Google-Smtp-Source: ABdhPJy4bAMnS+nFRBZhZYQzCHH5qKj4kY5qQvkyBlSRLoNZkRNUHanlsVWvoWi61fG01C3OtEh79w==
X-Received: by 2002:ac8:5745:: with SMTP id 5mr16364192qtx.85.1639658111425;
        Thu, 16 Dec 2021 04:35:11 -0800 (PST)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id o9sm3936751qtk.81.2021.12.16.04.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 04:35:10 -0800 (PST)
Date: Thu, 16 Dec 2021 09:35:03 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, abel.vesa@nxp.com,
	aford@beaconembedded.com, benjamin.gaignard@collabora.com,
	hverkuil-cisco@xs4all.nl, Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH V2 00/10] media: hantro: imx8mq/imx8mm: Let VPU decoders
 get controlled by vpu-blk-ctrl
Message-ID: <Ybsyd9/nRrszJ5f8@eze-laptop>
References: <20211216111256.2362683-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216111256.2362683-1-aford173@gmail.com>

Hi Adam,

The series looks really great.

On Thu, Dec 16, 2021 at 05:12:45AM -0600, Adam Ford wrote:
> Both the i.MX8MQ and i.MX8MM have G1 and G2 decoders.
> The two decoders are similar, but the imx8mm lacks the
> post-processor, so they will have distinct compatible flags.
> 
> From what I can tell, the G2 decoder wasn't working, so splitting
> the i.MX8MQ VPU into G1 and G2 makes it easier to control them 
> independently since the TRM of both the i.MX8MQ and
> i.MX8MM list them as distinct IP blocks. This also allowed G2 to
> become available.
> 
> With them being split, the power-domain can shift to the
> vpu-blk-ctrl which is available on both i.MX8MQ and i.MX8MM,
> but some of bits are different, so they'll have separate bindings.
> 
> Lastly, with the G1 and G2 operational, enable the i.MX8MM.
> On the i.MX8MM, the clock speed of 600MHz was chosen to match
> the default of the kernel repo from NXP and can be overwritten
> by board files for anyone who under/over volts the power rail.
> 
> There seems to be some disagreement between the TRM and the Datasheet
> for the imx8mq as to whether the speed should be 300MHz (TRM) or
> 600MHz (datasheet), so feedback from NXP would be very much
> appreciated.
> 
> The repo used as the starting point was:
> git://linuxtv.org/hverkuil/media_tree.git for-v5.17e
> 

I believe you should be able to rebase on top of
media_tree master. As far as I can see, it contains the VP9
support you need.

Also, please cherry-pick the following fix from Benjamin

https://patchwork.linuxtv.org/project/linux-media/patch/20211208164418.848790-1-benjamin.gaignard@collabora.com/

This is queued and should land on the master branch very soon.

> Fluster was run on both i.MX8MM and i.MX8MQ
> 
> At 600 MHz, the i.MX8MM had the following:
> 
> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> Ran 55/61 tests successfully               in 8.299 secs
> 
> ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> Ran 90/135 tests successfully               in 71.200 secs
> 
> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> Ran 139/303 tests successfully               in 218.079 secs

I imagine the reason H264 and VP9 tests take so long
is some pixelformat conversion somewhere. It would be great
if Fluster could have test vectors ready in the pixelformat
the hardware produces :-)

> 
> The i.MX8MQ had the following:
> 
> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> Ran 55/61 tests successfully               in 7.732 secs
> 
> ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> Ran 90/135 tests successfully               in 58.558 secs
> 
> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> Ran 144/303 tests successfully               in 271.373 secs
> 

... in any case, the fact that fluster is passing is already
telling us the driver is in good shape. How many jobs is the above
running in parallel?

If you want to do some other tests, you can build a gstreamer
pipeline, with sync=false, and decode a few 1080p video, e.g.
https://jell.yfish.us/.

Something like gst-launch-1.0 filesrc ! decodebin ! fakevideosink, or
so.

Then, you can run the pipeline in parallel as many times as you want:

gst-launch-1.0 filesrc ! decodebin ! fakevideosink filesrc ! decodebin ! fakevideosink filesrc ! decodebin ! fakevideosink ...

(GStreamer lets you concatenate src ! sink src ! sink, in the same
gst-launch-1.0 invocation).

> V2:  Remove references to legacy dt-binding from YAML, but keep
>      it in the driver so older device trees can still be used.
>      Fix typos in YAML
>      Remove reg-names, interrupt-names, and clock-names from YAML,
>      since each node will only have one of each, they're not necessary
>      Add Fluster scores to cover letter for i.MX8MQ
> 

Looks great.

Thanks,
Ezequiel

> Adam Ford (7):
>   dt-bindings: media: nxp,imx8mq-vpu: Split G1 and G2 nodes
>   media: hantro: Allow i.MX8MQ G1 and G2 to run independently
>   arm64: dts: imx8mq: Enable both G1 and G2 VPU's with vpu-blk-ctrl
>   arm64: dts: imx8mm: Fix VPU Hanging
>   dt-bindings: media: nxp,imx8mq-vpu: Add support for G1 and G2 on
>     imx8mm
>   media: hantro: Add support for i.MX8MM
>   arm64: dts: imx8mm: Enable Hantro G1 and G2 video decoders
> 
> Lucas Stach (3):
>   dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
>   dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
>   soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl
> 
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 93 +++++++++++--------
>  .../soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml      | 71 ++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 23 ++++-
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 63 ++++++++-----
>  drivers/soc/imx/imx8m-blk-ctrl.c              | 68 +++++++++++++-
>  drivers/staging/media/hantro/hantro_drv.c     |  3 +
>  drivers/staging/media/hantro/hantro_hw.h      |  3 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 75 ++++++++++++---
>  include/dt-bindings/power/imx8mq-power.h      |  3 +
>  9 files changed, 324 insertions(+), 78 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml
> 
> 
> base-commit: d1888b0bfd2ddef2e8a81505ffa200b92cc32e0c
> -- 
> 2.32.0
> 
