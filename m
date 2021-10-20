Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551682C80
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 15:26:53 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id d3so28413110edp.3
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FULRWRoy+gFirZw/mkbBQ8q4cmksOwfrZ4guTg9Tl+U=;
        b=nex+L4XOCZL4tbASApL9Xuh4hwhhgN1r2dNtvKsccumvMfzlzHnB2ya0gT4hvAjmJw
         827pqm61slx4Acel7pjiOYQkc0mxObWKMnil/93jtkCedlJqgTVxNTzG0WHAzbSOonSV
         7BF4MCRJ/Dhap6Lr3BFTVT+PmXLV4HSgBvffAWLtkf+rUI3EFJF3jeyDyXgBpnEXeCVu
         Je1YBGxaTJRDbeTsBbVOun+xNeH1HMeqinOjh0PIL5+IqSkV1H8d6y/8G3g64ARjkhOc
         P01A37usngGKNmDkVoWSerl3pLBKsR9C7A7rmfrC9t6dGnsI0b9DLkx0lnFZXhwlSZlX
         FzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FULRWRoy+gFirZw/mkbBQ8q4cmksOwfrZ4guTg9Tl+U=;
        b=gA74UkfDMGQ+t40Ypa3CMEitFVtRwEtB8p/6xpvXwkQL7SpyvgLUUCRtf15rfB7vIi
         FbavreWt1x6HyceFztrvcg0iIRFWBR0+Z0du43xSTEC2D3/j7xp2XWqJNt5Ue9s7PKwh
         O8ohTaUoijH1d5kdHLYCdD1g+2VxjYxgrPe4GHlJx+pO89w2BpydDpZPTMWZbHaERcCg
         /YHJwNeqzvDn2THryi01J8Mwxxj7HKA7HZEPqa2738mcfDqSKs0uFKu7laBWEpUEsdhS
         PUc3FwOLWJxY8TK66VLXaEsZsWHzlZK9apiSRDhdhSwQ8Y6SpksKym4tg7n58AteKw30
         KClg==
X-Gm-Message-State: AOAM531m3mwcOXkAdCQdqn57PxjA5ovzlBi+HSl+ah0Tej1clq0GO+yw
	mCmldlVTPxUOhXwuDSE707DSM7HmUYHECmkdUO+Q9Q==
X-Google-Smtp-Source: ABdhPJynf5WOUxsBGg41X8Q4IxKp7op0CxQNUvHHG1TjyFF9SWSPhrPl3auMquoy9cL8gXK7A2UEISMfsGVCy9cAOqw=
X-Received: by 2002:a17:906:e011:: with SMTP id cu17mr21963ejb.244.1634743552270;
 Wed, 20 Oct 2021 08:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210929160439.6601-1-andrzej.p@collabora.com>
 <11847752.O9o76ZdvQC@kista> <CAAEAJfBYwbUrjUFvs70u8YkuBgrCK6LuYdT9Y2Om7OLo6_cV1g@mail.gmail.com>
 <4350097.LvFx2qVVIh@kista>
In-Reply-To: <4350097.LvFx2qVVIh@kista>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 20 Oct 2021 12:25:40 -0300
Message-ID: <CAAEAJfDkOUp_kzrR-eAUiwO4EGHcuQVpCxBJwJr5_pZZqr-xwg@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v7 11/11] media: hantro: Support NV12 on the G2 core
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-media <linux-media@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heiko Stuebner <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Collabora Kernel ML <kernel@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Oct 2021 at 12:04, Jernej =C5=A0krabec <jernej.skrabec@gmail.com=
> wrote:
>
> Dne sreda, 20. oktober 2021 ob 13:06:59 CEST je Ezequiel Garcia napisal(a=
):
> > Hi Jernej,
> >
> > On Tue, 19 Oct 2021 at 13:38, Jernej =C5=A0krabec <jernej.skrabec@gmail=
.com>
> wrote:
> > >
> > > Hi Andrzej!
> > >
> > > Dne petek, 15. oktober 2021 ob 19:19:47 CEST je Andrzej Pietrasiewicz
> > > napisal(a):
> > > > Hi Jernej,
> > > >
> > > > W dniu 14.10.2021 o 19:42, Jernej =C5=A0krabec pisze:
> > > > > Hi Andrzej!
> > > > >
> > > > > Dne sreda, 29. september 2021 ob 18:04:39 CEST je Andrzej
> Pietrasiewicz
> > > > > napisal(a):
> > > > >> The G2 decoder block produces NV12 4x4 tiled format (NV12_4L4).
> > > > >> Enable the G2 post-processor block, in order to produce regular =
NV12.
> > > > >>
> > > > >> The logic in hantro_postproc.c is leveraged to take care of
> allocating
> > > > >> the extra buffers and configure the post-processor, which is
> > > > >> significantly simpler than the one on the G1.
> > > > >
> > > > > Quick summary of discussion on LibreELEC Slack:
> > > > > When using NV12 format on Allwinner H6 variant of G2 (needs some
> driver
> > > > > changes), I get frames out of order. If I use native NV12 tiled
> format,
> > > frames
> > > > > are ordered correctly.
> > > > >
> > > > > Currently I'm not sure if this is issue with my changes or is thi=
s
> general
> > > > > issue.
> > > > >
> > > > > I would be grateful if anyone can test frame order with and witho=
ut
> > > > > postprocessing enabled on imx8. Take some dynamic video with a lo=
t of
> > > short
> > > > > scenes. It's pretty obvious when frames are out of order.
> > > > >
> > > >
> > > > I checked on imx8 and cannot observe any such artifacts.
> > >
> > > I finally found the issue. As you mentioned on Slack, register write =
order
> once
> > > already affected decoding. Well, it's the case again. I made hacky te=
st and
> > > moved postproc enable call after output buffers are set and it worked=
. So,
> this
> > > is actually core quirk which is obviously fixed in newer variants.
> > >
> >
> > Ugh, good catch.
> >
> > What happens if you move all the calls to HANTRO_PP_REG_WRITE_S
> > (HANTRO_PP_REG_WRITE does a relaxed write)?
> >
> > Or what happens if the HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma)
> > is moved to be done after all the other registers?
>
> Those two macros aren't used on G2. Andrzej introduced new postproc helpe=
rs
> for G2.
>

Ah, so the issue is specific on the G2 post-processor.

> This commit solves issue for H6:
> https://github.com/jernejsk/linux-1/commit/
> a783a977c0843bb4b555dc9d0b5d64915cd219e7
>

Right, but see this comment:

    /* Turn on pipeline mode. Must be done first. */
    HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);

I have vague recollection of why we have that comment,
but I'm reluctant to move post-proc enable to the end.
(or at least not do it on G1?).

> >
> > > This makes this series with minor adaptations completely working on H=
6. I
> see
> > > no reason not to merge whole series.
> > >
> >
> > Do you have plans to submit your H6 work on top of this?
>
> Of course, why would I work on this otherwise? :) But before I do that, I=
 have
> to clean up and split one commit, which adapts VP9 G2 code for H6 variant=
.
>

OK, sounds good.

> If you're interested in changes, take a look here:
> https://github.com/jernejsk/linux-1/commits/vp9
>

Will take a look.

Thanks,
Ezequiel
