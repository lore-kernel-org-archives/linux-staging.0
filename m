Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D65B2CA2
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 18:21:48 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id l25so105354930eda.11
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+T52AWdajEU0KMwv7ankQCL42Q0SKJuFGlF6DjefnU=;
        b=E985xw0Ej99Pw2939m+vR1Px+yO5KBMY2c7mm7AOxIRqqfIARSVGlqIP5YBbgaFb7U
         GfO6NSHzyKu7bcpkx8ICbIwcuvVLu5bTZNOTFH/ZLkifZc66I1yAoqhzqZOcFGtEpYw9
         OOhBf3PqlTYLATo2L54tInP2/4+wUY6/9lRTrMQM8Xr98oXu+4TZqp8H6X8UgcJPV9ma
         rWbtHBV4hB2VlntELWamW0dIMFI5vDf0oq4RrHf7YP/NtJn59zdI0efYvI+DkkMpWQeQ
         xzvAOoTRDf66VwgF4okHtmvaGa9FJUHIowYcJNMJUbsFmEVx+n5yhL8DFHVgzN9BqB5i
         neIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+T52AWdajEU0KMwv7ankQCL42Q0SKJuFGlF6DjefnU=;
        b=XeiUC5VziT36kPtAgsvYE5AdCNaIDfl34Hdi5OqgMfZaaPvVyTNO3n8dkbZzQrTLTS
         nHmCp5u0AQvkDdECbyY7/34J3JAa8H8JtRCsR9Od7luN+EVmju2yrbabFZbPeep9b7tH
         OaZa8JKGLlbhG2ZCgmZwpslwgoxAoj6gEpKmlUQnc9GgOmVf9leHjY9sUruwDe9BRNMD
         w5Pik/A3NxSdGQELSDYOHVCrMcyV+aDf2BN0PI2rB75NrINRmVmfrmleI/d3lJnD93bA
         II85cakM4bIQgjoOM0+3gdkYMUrSDdSyjbyBKrDdWg/NAxq6ScgFplkFV01CjCN6LsSO
         GygQ==
X-Gm-Message-State: AOAM530swLkTx/wo6eA73qvkO3pqA9/IdwgEX+dULqNMizS1RX8QUrzB
	6ur+WFFx2MpOTwa6JK+ZCXLMoTllPphjZWgaAcA=
X-Google-Smtp-Source: ABdhPJx38wxlFqFd6LdFixKPZiuITDYT98pgvSOnzhpA66LWC6Hxwz/OMW9UuWE7hqfT7oK1vulT3U5ZKepzY78Lw0E=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr9210041ejc.77.1638382906154;
 Wed, 01 Dec 2021 10:21:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211201013329.15875-1-aford173@gmail.com> <CAJ+vNU1jENmWAR_5E98Vgb53ctxjxSWJewPW0YC4Yp4DuYTn3g@mail.gmail.com>
 <7216bc863d89faa9fdc5cd8d44c319f7a6d88159.camel@pengutronix.de>
In-Reply-To: <7216bc863d89faa9fdc5cd8d44c319f7a6d88159.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 1 Dec 2021 12:21:34 -0600
Message-ID: <CAHCN7xJevuZhwFwqAFiQxeV6=8iONmr1hwUF4QMfCFWDQ2Ve8A@mail.gmail.com>
Subject: Re: [RFC V2 0/2] arm64: imx8mm: Enable Hantro VPUs
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Tim Harvey <tharvey@gateworks.com>, linux-media <linux-media@vger.kernel.org>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Adam Ford-BE <aford@beaconembedded.com>, 
	Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree <devicetree@vger.kernel.org>, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 1, 2021 at 11:32 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Tim,
>
> Am Mittwoch, dem 01.12.2021 um 09:23 -0800 schrieb Tim Harvey:
> > On Tue, Nov 30, 2021 at 5:33 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
> > > to be related to the video decoders used on the i.MX8MQ, but because of
> > > how the Mini handles the power domains, the VPU driver does not need to
> > > handle all the functions, nor does it support the post-processor,
> > > so a new compatible flag is required.
> > >
> > > With the suggestion from Hans Verkuil, I was able to get the G2 splat to go away
> > > with changes to FORCE_MAX_ZONEORDER, but I found I could also set cma=512M, however
> > > it's unclear to me if that's an acceptable alternative.
> > >
> > > At the suggestion of Ezequiel Garcia and Nicolas Dufresne I have some
> > > results from Fluster. However, the G2 VPU appears to fail most tests.
> > >
> > > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > > Ran 90/135 tests successfully               in 76.431 secs
> > >
> > >  ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > > Ran 55/61 tests successfully               in 21.454 secs
> > >
> > > ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> > > Ran 0/303 tests successfully               in 20.016 secs
> > >
> > > Each day seems to show more and more G2 submissions, and gstreamer seems to be
> > > still working on the VP9, so I am not sure if I should drop G2 as well.
> > >
> > >
> > > Adam Ford (2):
> > >   media: hantro: Add support for i.MX8M Mini
> > >   arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2
> > >
> > >  arch/arm64/boot/dts/freescale/imx8mm.dtsi   | 41 +++++++++++++++
> > >  drivers/staging/media/hantro/hantro_drv.c   |  2 +
> > >  drivers/staging/media/hantro/hantro_hw.h    |  2 +
> > >  drivers/staging/media/hantro/imx8m_vpu_hw.c | 57 +++++++++++++++++++++
> > >  4 files changed, 102 insertions(+)
> > >
> >
> > Adam,
> >
> > That's for the patches!
> >
> > I tested just this series on top of v5.16-rc3 on an
> > imx8mm-venice-gw73xx-0x and found that if I loop fluster I can end up
> > getting a hang within 10 to 15 mins or so when imx8m_blk_ctrl_power_on
> > is called for VPUMIX pd :
> > while [ 1 ]; do uptime; ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0; done
> > ...
> > [  618.838436] imx-pgc imx-pgc-domain.6: failed to command PGC
> > [  618.844407] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> >
> > I added prints in imx_pgc_power_{up,down} and
> > imx8m_blk_ctrl_power_{on,off} to get some more context
> > ...
> > Ran 55/61 tests successfully               in 8.685 secs
> >  17:16:34 up 17 min,  0 users,  load average: 3.97, 2.11, 0.93
> > ********************************************************************************
> > ********************
> > Running test suite VP8-TEST-VECTORS with decoder GStreamer-VP8-V4L2SL-Gst1.0
> > Using 4 parallel job(s)
> > ********************************************************************************
> > ********************
> >
> > [TEST SUITE      ] (DECODER                    ) TEST VECTOR               ... R
> > ESULT
> > ----------------------------------------------------------------------
> > [ 1023.114806] imx8m_blk_ctrl_power_on vpublk-g1
> > [ 1023.119669] imx_pgc_power_up vpumix
> > [ 1023.124307] imx-pgc imx-pgc-domain.6: failed to command PGC
> > [ 1023.130006] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> >
> > While this wouldn't be an issue with this series it does indicate we
> > still have something racy in blk-ctrl. Can you reproduce this (and if
> > not what kernel are you based on)? Perhaps you or Lucas have some
> > ideas?

i have not seen an issue with my implementation, but used
media-staging [1] for the last attempt to try to get as much of the
latest hantro driver integration, although the VP9 stuff isn't quite
ready yet on the g2-VPU

[1] - https://git.linuxtv.org/media_stage.git/log/drivers/staging/media/hantro

> >
> Did you have "[PATCH] soc: imx: gpcv2: Synchronously suspend MIX
> domains" applied when running those tests? It has only recently been
> picked up by Shawn and may have an influence on the bus domain
> behavior.

I didn't know about this one either, so I'll try it.

When I was attempting to read registers from the H1 vpu, I had to set
"keep_clocks = true" for the H1 power domain or it would hang.  If the
patch Lucas suggests doesn't work, you could try keeing the G1 or G2
clocks on.  I believe it's already set for the vpumix, but the G1, G2
and H1 clocks are not touched by the vpumix, just the
IMX8MM_CLK_VPU_DEC_ROOT.

>
> Regards,
> Lucas
>
