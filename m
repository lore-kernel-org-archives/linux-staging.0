Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C872C9C
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 13:10:07 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id o20so87168763eds.10
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 05:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=psqq8AxoCtsUWk+9+3wi7F1REcnczjIneOZP6k7X4Bw=;
        b=l4/fnlsaIWrU7XKiQ7Y1Xotl89tt0lQGwCgppt2kzLRde0Zmvr3uL/Twu8Q7HJmzBR
         h4+y76Vejnslwze2Z+R8qRc4gxovJ/kYrOq7ftE7Y9OdEMUi4w8BXAZots4MkDbo6uNt
         5BZfMIA14nVRhnyWayWC4kykR9tqSlO4q9yYaNPdWpqtfzwWnkCKsaxiPU0ydjvc4WtN
         iD/9tLaLxnFTHnLTxvOiOsLKVvImmerZK+VlpUahAATlZQZ8TkrZKYFQewtGRxQ4AgiM
         zGCJX9iDSYqMQcqCaFNJz6Nth6NbTQ2TahaYIJVvz3oOXl8EEmGVcYJA9YilTEaNnPYR
         UpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=psqq8AxoCtsUWk+9+3wi7F1REcnczjIneOZP6k7X4Bw=;
        b=quMnrLHpJZr0zKlWsZuuvjQxKLGrcRHkV10I6xYDXk8X4Nl5t+m4o3n25sENx6QJYs
         TdnFuHbun3pWzgwzOQNaOHb/idXq/hjjZaerGcWPci1skvgNfonVDKNdF+jUWlAl4noY
         opuLtaBzhwAXr2mOTkI+x393evEDxH3uojqDEaVbzLJ5Vq1JzNB1u4hj+xz0BmRqN/pg
         qdJEaILOKQTBDobB1+fMD+OPOefbk+obIae2V4dUGxJsmk4T3ASZHQrLXrS9R+4OFH0x
         BjFritIvr+GdRthusUnjPIFpGAv/rz+BCAU8SchOQNx4/nM/VLS7sHmNwZGXxjE3PExW
         buTg==
X-Gm-Message-State: AOAM530H8VcTmGrNinxGRNQ+XA67s0vYOEIbNFnHcFG0c7XxQrNnl+dq
	aAEJ0Mvxu+EHRe+DHIngYrPmuOaCREabfxM4cYE=
X-Google-Smtp-Source: ABdhPJyJ7BpFsLTq0XQBuilAPWj5q7Udd6T7s6oVqbuEeN+5S7fO/uyVzU/41WmJNvE51tkKZn15ArvhQa/v+6Od+xc=
X-Received: by 2002:a17:907:2d12:: with SMTP id gs18mr3229632ejc.198.1639660205253;
 Thu, 16 Dec 2021 05:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211216111256.2362683-1-aford173@gmail.com> <Ybsyd9/nRrszJ5f8@eze-laptop>
In-Reply-To: <Ybsyd9/nRrszJ5f8@eze-laptop>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 16 Dec 2021 07:09:53 -0600
Message-ID: <CAHCN7xJGpjCw5TLOXJ1r-KtcRNcUVqwa2qhmwCrLuTf4aJqBkQ@mail.gmail.com>
Subject: Re: [PATCH V2 00/10] media: hantro: imx8mq/imx8mm: Let VPU decoders
 get controlled by vpu-blk-ctrl
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media <linux-media@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, 
	Adam Ford-BE <aford@beaconembedded.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas Stach <l.stach@pengutronix.de>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 6:35 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Adam,
>
> The series looks really great.
>
> On Thu, Dec 16, 2021 at 05:12:45AM -0600, Adam Ford wrote:
> > Both the i.MX8MQ and i.MX8MM have G1 and G2 decoders.
> > The two decoders are similar, but the imx8mm lacks the
> > post-processor, so they will have distinct compatible flags.
> >
> > From what I can tell, the G2 decoder wasn't working, so splitting
> > the i.MX8MQ VPU into G1 and G2 makes it easier to control them
> > independently since the TRM of both the i.MX8MQ and
> > i.MX8MM list them as distinct IP blocks. This also allowed G2 to
> > become available.
> >
> > With them being split, the power-domain can shift to the
> > vpu-blk-ctrl which is available on both i.MX8MQ and i.MX8MM,
> > but some of bits are different, so they'll have separate bindings.
> >
> > Lastly, with the G1 and G2 operational, enable the i.MX8MM.
> > On the i.MX8MM, the clock speed of 600MHz was chosen to match
> > the default of the kernel repo from NXP and can be overwritten
> > by board files for anyone who under/over volts the power rail.
> >
> > There seems to be some disagreement between the TRM and the Datasheet
> > for the imx8mq as to whether the speed should be 300MHz (TRM) or
> > 600MHz (datasheet), so feedback from NXP would be very much
> > appreciated.
> >
> > The repo used as the starting point was:
> > git://linuxtv.org/hverkuil/media_tree.git for-v5.17e
> >
>
> I believe you should be able to rebase on top of
> media_tree master. As far as I can see, it contains the VP9
> support you need.
>
> Also, please cherry-pick the following fix from Benjamin
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20211208164418.848790-1-benjamin.gaignard@collabora.com/
>
> This is queued and should land on the master branch very soon.
>
> > Fluster was run on both i.MX8MM and i.MX8MQ
> >
> > At 600 MHz, the i.MX8MM had the following:
> >
> > ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > Ran 55/61 tests successfully               in 8.299 secs
> >
> > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > Ran 90/135 tests successfully               in 71.200 secs
> >
> > ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> > Ran 139/303 tests successfully               in 218.079 secs
>
> I imagine the reason H264 and VP9 tests take so long
> is some pixelformat conversion somewhere. It would be great
> if Fluster could have test vectors ready in the pixelformat
> the hardware produces :-)
>
> >
> > The i.MX8MQ had the following:
> >
> > ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > Ran 55/61 tests successfully               in 7.732 secs
> >
> > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > Ran 90/135 tests successfully               in 58.558 secs
> >
> > ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> > Ran 144/303 tests successfully               in 271.373 secs
> >
>
> ... in any case, the fact that fluster is passing is already
> telling us the driver is in good shape. How many jobs is the above
> running in parallel?
>
> If you want to do some other tests, you can build a gstreamer
> pipeline, with sync=false, and decode a few 1080p video, e.g.
> https://jell.yfish.us/.
>
> Something like gst-launch-1.0 filesrc ! decodebin ! fakevideosink, or
> so.
>
> Then, you can run the pipeline in parallel as many times as you want:
>
> gst-launch-1.0 filesrc ! decodebin ! fakevideosink filesrc ! decodebin ! fakevideosink filesrc ! decodebin ! fakevideosink ...
>
> (GStreamer lets you concatenate src ! sink src ! sink, in the same
> gst-launch-1.0 invocation).
>
> > V2:  Remove references to legacy dt-binding from YAML, but keep
> >      it in the driver so older device trees can still be used.
> >      Fix typos in YAML
> >      Remove reg-names, interrupt-names, and clock-names from YAML,
> >      since each node will only have one of each, they're not necessary
> >      Add Fluster scores to cover letter for i.MX8MQ
> >
>
> Looks great.

Any change you could give your acked-by or reviewed-by to the patches?
 Even if they need some work, I can carry those along to the next
revision when I do the work you request.

adam



>
> Thanks,
> Ezequiel
>
> > Adam Ford (7):
> >   dt-bindings: media: nxp,imx8mq-vpu: Split G1 and G2 nodes
> >   media: hantro: Allow i.MX8MQ G1 and G2 to run independently
> >   arm64: dts: imx8mq: Enable both G1 and G2 VPU's with vpu-blk-ctrl
> >   arm64: dts: imx8mm: Fix VPU Hanging
> >   dt-bindings: media: nxp,imx8mq-vpu: Add support for G1 and G2 on
> >     imx8mm
> >   media: hantro: Add support for i.MX8MM
> >   arm64: dts: imx8mm: Enable Hantro G1 and G2 video decoders
> >
> > Lucas Stach (3):
> >   dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
> >   dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
> >   soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl
> >
> >  .../bindings/media/nxp,imx8mq-vpu.yaml        | 93 +++++++++++--------
> >  .../soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml      | 71 ++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 23 ++++-
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 63 ++++++++-----
> >  drivers/soc/imx/imx8m-blk-ctrl.c              | 68 +++++++++++++-
> >  drivers/staging/media/hantro/hantro_drv.c     |  3 +
> >  drivers/staging/media/hantro/hantro_hw.h      |  3 +
> >  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 75 ++++++++++++---
> >  include/dt-bindings/power/imx8mq-power.h      |  3 +
> >  9 files changed, 324 insertions(+), 78 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml
> >
> >
> > base-commit: d1888b0bfd2ddef2e8a81505ffa200b92cc32e0c
> > --
> > 2.32.0
> >
