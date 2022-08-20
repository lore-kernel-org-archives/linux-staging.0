Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9520E7;
	Sat, 20 Aug 2022 08:25:52 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s11so8054833edd.13;
        Sat, 20 Aug 2022 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=B7LHKZXiDo4tLgHB6cmJPlzOB/uKwgbfurm+nzgUe+E=;
        b=p+dqT78pelXkOW0sDj8MLcQ5jX1HotYr5JkcBSFygVOwDxRBdEqt9xnq7TfqgW9/+p
         Zioh65SOtP1PQBtFhLNHyIWYjs8iP+mjthkm+Mj06v+ZoIpawrO92qRjK4uKqYx7ZMN2
         ZoXQAOruFg/atZLgQLVeMO5rNMYwkLJ3YzRS7Fo9ROV+8x4xcWrh8JSHvhi8jCLgxJ85
         o7vjehOb9IXISg+8lAqWiwr+QYO76WQl7WIUZy+HEWi+EssoTzCAGmTqq6U1y4KCFLVk
         5ul1GMMEsNnj/rULYvT31AIzKywf7dfH7VS1ohtWtyAdAYXQiRYyBCs9hpahnC5S+jYp
         w4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=B7LHKZXiDo4tLgHB6cmJPlzOB/uKwgbfurm+nzgUe+E=;
        b=QxutNO/GiGd8HJBzyO+ls92phLGILwHStuq3Ng3EZ5cLT67B7XppAOxKguBErggzRj
         yfLMlZmHm74jzCv6qSH/fv7WrOGhju9DvsHFRALAsyxVUfzv410x9IXII5uMlky9LTKj
         kh+xFV4fqaj99af9VCHtZQ4eE/v2zh+Ljy8wh5v87nuWO8usiaxZyYm/z7+gSbDAluHN
         2wFPVl/NgJhPY1XPQtmb2gNu9gJMYkAYE4e2MEdkVgo+B2UN0EqnXP8bY2UoAtV4LZ/s
         keApA5SWG9oVN027/PvrjQoG5BnDDMnNmsE3MT3YPeYGOai5ZS5v9AHqvxqXauTACI23
         ZIJw==
X-Gm-Message-State: ACgBeo266g71LMBUTSa+CQ3AaoMVheHSurxgf2VR6+I85y/oUBS4sq/g
	9/N9QIOVulsY/8wBObeYYLA=
X-Google-Smtp-Source: AA6agR7J7U4+sJRzsXWy+KBWBJUbDx3IgOuhnw1m+2GDVVHCxRzhbKySXySLSCV3aGXB4BFAWw6fOA==
X-Received: by 2002:a05:6402:5ca:b0:445:c80a:3c2 with SMTP id n10-20020a05640205ca00b00445c80a03c2mr8771757edx.247.1660983950869;
        Sat, 20 Aug 2022 01:25:50 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id d10-20020a50c88a000000b00445df5738dfsm4267553edh.73.2022.08.20.01.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 01:25:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>, stable@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] media: cedrus: Set the platform driver data earlier
Date: Sat, 20 Aug 2022 10:25:48 +0200
Message-ID: <4733096.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <47ce07adc73887b5afaf9815a78b793d0e9a6b54.camel@collabora.com>
References: <20220818203308.439043-1-nicolas.dufresne@collabora.com> <4418189.LvFx2qVVIh@jernej-laptop> <47ce07adc73887b5afaf9815a78b793d0e9a6b54.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 19. avgust 2022 ob 17:37:20 CEST je Nicolas Dufresne napisal(a):
> Le vendredi 19 ao=C3=BBt 2022 =C3=A0 06:17 +0200, Jernej =C5=A0krabec a =
=C3=A9crit :
> > Dne =C4=8Detrtek, 18. avgust 2022 ob 22:33:07 CEST je Nicolas Dufresne=
=20
napisal(a):
> > > From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > >=20
> > > The cedrus_hw_resume() crashes with NULL deference on driver probe if
> > > runtime PM is disabled because it uses platform data that hasn't been
> > > set up yet. Fix this by setting the platform data earlier during prob=
e.
> >=20
> > Does it even work without PM? Maybe it would be better if Cedrus would
> > select PM in Kconfig.
>=20
> I cannot comment myself on this, but it does not seem to invalidate this
> Dmitry's fix.

If NULL pointer dereference happens only when PM is disabled, then it does.=
 I=20
have PM always enabled and I never experienced above issue.

Best regards,
Jernej

>=20
> > Best regards,
> > Jernej
> >=20
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > ---
> > >=20
> > >  drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> > > 960a0130cd620..55c54dfdc585c 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > > @@ -448,6 +448,8 @@ static int cedrus_probe(struct platform_device
> > > *pdev)
> > >=20
> > >  	if (!dev)
> > >  =09
> > >  		return -ENOMEM;
> > >=20
> > > +	platform_set_drvdata(pdev, dev);
> > > +
> > >=20
> > >  	dev->vfd =3D cedrus_video_device;
> > >  	dev->dev =3D &pdev->dev;
> > >  	dev->pdev =3D pdev;
> > >=20
> > > @@ -521,8 +523,6 @@ static int cedrus_probe(struct platform_device
> > > *pdev)
> > >=20
> > >  		goto err_m2m_mc;
> > >  =09
> > >  	}
> > >=20
> > > -	platform_set_drvdata(pdev, dev);
> > > -
> > >=20
> > >  	return 0;
> > > =20
> > >  err_m2m_mc:




