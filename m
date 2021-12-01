Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8068
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 12:58:31 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x6so100944336edr.5
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D5PW8BhdAuu4oqSswIsrh+4cgg8Ko16BHPb2BC0DyDc=;
        b=ShtUvDfW5PyLg35gKksvBhAIF13Qdlo2k1kJ5nf9ddtcN2IWargq9oK9uH9Mj7mOlM
         yrZ5ncJ7wlQ3v3gaY2hNqU4iayvlI7vavUCnibRCmaVdQk34nmuQKcpVe0PohmHbMvqP
         Nx1ViR1M93mzRFKRGh73XszDpowN3KMR+Opzfq2PvivLIH0YhKXdc+DMIXTeShsMgFxl
         9/rGywoLb97EPLIPX0ys7IEZFihb9iHe1IeX3ailUU8luIz9EXUyP9Qn6V0BocL4t0CC
         j9BgxuSZEW7jn2HQAkvAuK6mVu7ghUJOjDX/Fe7XXV7vRQ/AHlnQE8pbKWqG8SpIt0l0
         Nf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D5PW8BhdAuu4oqSswIsrh+4cgg8Ko16BHPb2BC0DyDc=;
        b=Zml5HVd3sVXYL1f6lKMqjzap7sN0UvQM7NwUVseMFEMApcIqpHjpjr8KiVZQRrK8YJ
         5MdsH1xeFRubTAUITByzG48YG/j4GCAmXD2HdQvucA9H/AYQ8pxhcNIjHras9/Qpl4pN
         O/wfvx4bOYLZ/8EyI3X2baxAtwG0KIcYZe/C4u4GXUbmyFTc8btxmas+5iXuFOFF8Ifr
         ZHgvh+Ik3ecJwFy8oRkAYCuHaDAHHgGSFEi2gpNHq9Bgsnlpkigs9rw5oamXMkGrby22
         uV1qCVeYko3f36YoNxJeZ2bct5jnbHoSZ55q5ev66CZrvVHo5wWI5M4lYNfaGDYPNyDM
         K68A==
X-Gm-Message-State: AOAM531oxgjZJOSK/xNAbGoGHvdU8wel3fam7YnsbOt69yO2G2EmCnB7
	0WT6g76RiiFdfYFJefJU8lmuX3v3wEZfIya9wxeclA==
X-Google-Smtp-Source: ABdhPJz9iOdDKNgMdJzD0gqeRB73Q1A4iiFR0FxNxz9fFpszk+uTamQrvcRyI5fCgzr/AcT0r10edZjMU7/6TzU7sCE=
X-Received: by 2002:aa7:c946:: with SMTP id h6mr8446283edt.190.1638363509446;
 Wed, 01 Dec 2021 04:58:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211201013329.15875-1-aford173@gmail.com> <20211201013329.15875-2-aford173@gmail.com>
 <CAAEAJfBBFhRtW2wmoA6T+yyM-nurUbtPqYHKPHjeRdKzA34PcQ@mail.gmail.com> <CAHCN7xLGTadbr+=-j2yJHFn233dgHic28njej8LHS2M0WwtqYQ@mail.gmail.com>
In-Reply-To: <CAHCN7xLGTadbr+=-j2yJHFn233dgHic28njej8LHS2M0WwtqYQ@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 1 Dec 2021 09:58:17 -0300
Message-ID: <CAAEAJfDqBezv1_ZsF3vjAFprZYuaE7krkSXa4vzAfMZp5_z+sA@mail.gmail.com>
Subject: Re: [RFC V2 1/2] media: hantro: Add support for i.MX8M Mini
To: Adam Ford <aford173@gmail.com>
Cc: linux-media <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Tim Harvey <tharvey@gateworks.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Adam Ford-BE <aford@beaconembedded.com>, Rob Herring <robh+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Dec 2021 at 09:36, Adam Ford <aford173@gmail.com> wrote:
>
> On Wed, Dec 1, 2021 at 6:25 AM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > Hi Adam,
> >
> > On Tue, 30 Nov 2021 at 22:33, Adam Ford <aford173@gmail.com> wrote:
> > >
> > > The i.MX8M Mini has a similar implementation of the Hantro G1 and
> > > h decoders, but the Mini uses the vpu-blk-ctrl for handling the
> > > VPU resets through the power domain system.  As such, there are
> > > functions present in the 8MQ that are not applicable to the Mini
> > > which requires the driver to have a different compatible flags.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > > index fb82b9297a2b..2aa1c520be50 100644
> > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > @@ -592,6 +592,8 @@ static const struct of_device_id of_hantro_match[] = {
> > >         { .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
> > >  #endif
> > >  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
> > > +       { .compatible = "nxp,imx8mm-vpu", .data = &imx8mm_vpu_variant, },
> > > +       { .compatible = "nxp,imx8mm-vpu-g2", .data = &imx8mm_vpu_g2_variant },
> > >         { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
> > >         { .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
> > >  #endif
> > > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> > > index 267a6d33a47b..ae7c3fff760c 100644
> > > --- a/drivers/staging/media/hantro/hantro_hw.h
> > > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > > @@ -211,6 +211,8 @@ enum hantro_enc_fmt {
> > >         ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
> > >  };
> > >
> > > +extern const struct hantro_variant imx8mm_vpu_g2_variant;
> > > +extern const struct hantro_variant imx8mm_vpu_variant;
> > >  extern const struct hantro_variant imx8mq_vpu_g2_variant;
> > >  extern const struct hantro_variant imx8mq_vpu_variant;
> > >  extern const struct hantro_variant px30_vpu_variant;
> > > diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > > index ea919bfb9891..c68516c00c6d 100644
> > > --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > > +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > > @@ -242,6 +242,32 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
> > >         },
> > >  };
> > >
> > > +static const struct hantro_codec_ops imx8mm_vpu_codec_ops[] = {
> > > +       [HANTRO_MODE_MPEG2_DEC] = {
> > > +               .run = hantro_g1_mpeg2_dec_run,
> > > +               .init = hantro_mpeg2_dec_init,
> > > +               .exit = hantro_mpeg2_dec_exit,
> > > +       },
> > > +       [HANTRO_MODE_VP8_DEC] = {
> > > +               .run = hantro_g1_vp8_dec_run,
> > > +               .init = hantro_vp8_dec_init,
> > > +               .exit = hantro_vp8_dec_exit,
> > > +       },
> > > +       [HANTRO_MODE_H264_DEC] = {
> > > +               .run = hantro_g1_h264_dec_run,
> > > +               .init = hantro_h264_dec_init,
> > > +               .exit = hantro_h264_dec_exit,
> > > +       },
> > > +};
> > > +
> > > +static const struct hantro_codec_ops imx8mm_vpu_g2_codec_ops[] = {
> > > +       [HANTRO_MODE_HEVC_DEC] = {
> > > +               .run = hantro_g2_hevc_dec_run,
> > > +               .init = hantro_hevc_dec_init,
> > > +               .exit = hantro_hevc_dec_exit,
> > > +       },
> > > +};
> > > +
> >
> > I believe you are missing VP9, which explains why you get
> > a zero fluster score.
>
> That's what I was thinking too and that's why I was wondering if I
> should wait on G2 until more of those G2 patches have been finalized
> and accepted.  Is there a way to test the HEVC?  I didn't see one in
> the fluster list.
>

VP9 is on its way to be merged. There is a pull request from Hans
already: see https://www.spinics.net/lists/linux-media/msg202448.html
which includes the git repository and tag you can merge/rebase to test
it.

It would be great if you can test G2 on top of that, but it's also fine
if you want to just submit G1 for now. Up to you.

Regarding HEVC, currently Benjamin is who knows best how to test it.
Thinking about it, perhaps we should document this somewhere?

Regards,
Ezequiel
