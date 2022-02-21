Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A2629A3
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 13:36:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id p14so33261997ejf.11
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hVsxXa9zfJzDSONzhFmUt2n45g2Tl+QAXT1aliotVqU=;
        b=XmTAslYxp5GDy/Vljfy2unr/xoU7gzU3HEjXxhmZ4thZ5TR7G2L0bE47eJF3ebQlbw
         QxzN5HViSUiWkQIDn9p5oVRlfFaJYqvfvfKo6WGh54M4BJiR95utbGShS7OVeaT1iEYg
         vcB4jz3DnGm7gh4eAJazlvVoj8Nb0zHVQTcMu1rAzYJCUcHNVgysTFEE/nMzdDadIOp1
         dQjcLfxZrlApQjxJQlUR+q0M6PgNYQAYYpYa4Kngk4GHTpB/wzPqeQCXhAEdIijKK8KT
         rivlHUC9xLh00Wnc/QdwtCKV+MR69Y8TVx+B0uzytjAVQvH1TSokvM2VDqM6ybQh+0UL
         jcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hVsxXa9zfJzDSONzhFmUt2n45g2Tl+QAXT1aliotVqU=;
        b=cgOwrtsLDMeSFTfq0sWp5+DnUCbDFV+2IGtgD9GOgu9nV+gA77WaX4oD+F/7pWViFm
         yXlEAT3gqaHHwXVIuXJuIZiL4kT9Fw2p22f9tT0rw4V2xhq1klpo2mktMAgLnNKpMTWZ
         vM6dTYgbKMKVPje1BqoKLTSd3ScqkNyc72yfuWrPoSSrIu9NT+ZjQ4+7sfLfWrhvgbQL
         njkk3pUhLHudjcrhtoamvJJRJnAGg639yl+MDp/ZDAMFtiYzaVAtBrhHJyNmxeaNqGXP
         I5j4HE0niH7+kxL0cEIxBllpagaGPLB/5HV48FeRPUNNioTpLsMacu86NcjMUlLig1az
         KUMA==
X-Gm-Message-State: AOAM532D7x3NfKqtOsk7fb3xodNomw7x4iGsQeKCeX3oJ2FQEkkOM/Dw
	//6dpubT0d+4Q73XErtAaWsvX1AKde9xDaO+nEY=
X-Google-Smtp-Source: ABdhPJyEZ/gU5SCeWCcTzpOSzUXpy+j4gBmV01rVq1YoY/L4n7+iMS5I7aLybc0v/YOKIwqJBvvfGM5l8u8ISI4J1mE=
X-Received: by 2002:a17:906:364d:b0:6cd:9109:cfd4 with SMTP id
 r13-20020a170906364d00b006cd9109cfd4mr15717127ejb.198.1645450617442; Mon, 21
 Feb 2022 05:36:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220218183421.583874-1-jacopo@jmondi.org> <CAHCN7xKXoBB4AiJY=wEhZ-8YT=QW4CANe7bapGpjFGnWKm3xmQ@mail.gmail.com>
 <YhLDqUPRe84/JylR@pendragon.ideasonboard.com> <20220221075859.xtilbojle5ghnfru@uno.localdomain>
 <YhNMQGpZ8oRTOxB8@pendragon.ideasonboard.com>
In-Reply-To: <YhNMQGpZ8oRTOxB8@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 21 Feb 2022 07:36:46 -0600
Message-ID: <CAHCN7x+gk9xXOCNB4PWFRSkY=haA1kAnAYB8WFjUDDA4imzj4w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: imx: Destage imx7-mipi-csis
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Steve Longerbeam <slongerbeam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, martin.kepplinger@puri.sm, 
	rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, dorota.czaplejewicz@puri.sm, 
	Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-media <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 21, 2022 at 2:24 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jacopo,
>
> On Mon, Feb 21, 2022 at 08:58:59AM +0100, Jacopo Mondi wrote:
> > On Mon, Feb 21, 2022 at 12:41:45AM +0200, Laurent Pinchart wrote:
> > > On Sun, Feb 20, 2022 at 12:19:30PM -0600, Adam Ford wrote:
> > > > On Sun, Feb 20, 2022 at 8:56 AM Jacopo Mondi wrote:
> > > > >
> > > > > Hello
> > > > >   this series includes patches from two series previously sent:
> > > > > https://lore.kernel.org/linux-media/20220119112024.11339-1-jacopo@jmondi.org/
> > > > > https://lore.kernel.org/linux-media/20220211180216.290133-1-jacopo@jmondi.org/
> > > > > v1:
> > > > > https://lore.kernel.org/linux-media/20220214184318.409208-1-jacopo@jmondi.org/T/#t
> > > > >
> > > > > Which can now be marked as superseded.
> > > > >
> > > > > The first 2 patches performs the de-staging of the imx7-mipi-csis driver and
> > > > > are now reviewed.
> > > > >
> > > > > The rest of the series builds on top of the comment received on:
> > > > > https://lore.kernel.org/linux-media/20220119112024.11339-3-jacopo@jmondi.org/
> > > > >
> > > > > If DUAL pixel mode is used in the CSIS driver, then the CSI block of the IMX8MM
> > > > > SoC needs to be operated in dual mode as well. To do so, use the image format
> > > > > sample size to determine in the CSI bridge if dual or single mode should be
> > > > > used.
> > > > >
> > > > > Laurent could you test on MM to see if it works now ?
> > > >
> > > > Jacopo,
> > > >
> > > > Do you have a repo I can clone?  If not, I need to know which branch
> > > > to apply to the series. I have an 8MM with an OV5640, and I'm willing
> > > > to test if Laurent can't.
> > >
> > > I've applied the patches on top of v5.17-rc4 plus a few backports, and
> > > pushed the result to
> > > https://gitlab.com/ideasonboard/nxp/linux/-/tree/pinchartl/v5.17/csis.
> > >
> >
> > Oh, you've been slightly quicker then me :p
> >
> > I was about to ask Adam if he was interested in a branch which also
> > contains
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> >
> > As he has an ov5640 :)
>
> Do you mean
> https://gitlab.com/ideasonboard/nxp/linux/-/tree/pinchartl/v5.17/sensors/ov5640/v2
> ? :-)
>
> > Adam, if you get here faster than me, please try Laurent's branch and
> > let me know. Otherwise I will provide a branch with a v3 of this
> > series and the ov5640 changes as well, if you're interested in testing
> > them.

I should be able to get to this today.  Are there specific resolutions
or formats you want me to test?  I assume I should test the new ones,
but I wasn't if there were some that were less confident.

adam
> >
> > Thanks
> >   j
> >
> > > > > On top two small patches I was carrying in my tree to add more formats to the
> > > > > CSIS driver, the last one with the caveat that RGB24 is transmitted on the wire
> > > > > with one format and stored in memory with a different one.
> > > > >
> > > > > Series based on top of the most recent media master branch.
> > > > >
> > > > > Thanks
> > > > >   j
> > > > >
> > > > > v1->v2:
> > > > > - Remove per-SoC handling in CSI bridge and only use image formats
> > > > > - Add TODO note to the staging driver
> > > > > - Fix PIXEL_DUAL mode comments for imx-mipi-csis
> > > > > - Add output format translation to imx-mipi-csis to handle RGB24
> > > > >
> > > > > Jacopo Mondi (7):
> > > > >   media: imx: De-stage imx7-mipi-csis
> > > > >   media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
> > > > >   media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
> > > > >   media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
> > > > >   media: imx: imx-mipi-csis: Add RGB565_1X16
> > > > >   media: imx: imx-mipi-csis: Add BGR888
> > > > >   media: imx: imx-mipi-csis: Add output format
> > > > >
> > > > >  Documentation/admin-guide/media/imx7.rst      |  2 +-
> > > > >  ...-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} |  2 +-
> > > > >  MAINTAINERS                                   |  4 +-
> > > > >  drivers/media/platform/Kconfig                |  1 +
> > > > >  drivers/media/platform/Makefile               |  1 +
> > > > >  drivers/media/platform/imx/Kconfig            | 24 ++++++++
> > > > >  drivers/media/platform/imx/Makefile           |  1 +
> > > > >  .../platform/imx/imx-mipi-csis.c}             | 59 +++++++++++++++++--
> > > > >  drivers/staging/media/imx/Makefile            |  1 -
> > > > >  drivers/staging/media/imx/TODO                | 26 ++++++++
> > > > >  drivers/staging/media/imx/imx7-media-csi.c    |  8 ++-
> > > > >  11 files changed, 117 insertions(+), 12 deletions(-)
> > > > >  rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
> > > > >  create mode 100644 drivers/media/platform/imx/Kconfig
> > > > >  create mode 100644 drivers/media/platform/imx/Makefile
> > > > >  rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (95%)
>
> --
> Regards,
>
> Laurent Pinchart
