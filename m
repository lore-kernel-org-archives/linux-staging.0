Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299372
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 13:56:44 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id a4so1964098wrr.2
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=w5NxWLLzhgPNs7hgKxObXSucJQTrVLPMT6JRaxXmMGg=;
        b=rHQPvxjAuK2Pff3yz8wDRSkCbFh7jdBrno1hGfOSliik/K37WXholSfq5fnbl5g4tD
         D9vY7q3tQDIx7X7eAU4HPA9exN2PxY47yjtGnDFc9DcUbUjdKD/t1jVq9lghDvpLXU+R
         pCYRfvxuY+DKcNtzYOhoMg8+knE65iw6S2qZ7W9zNn0KBSIhCg/9aJpu4iI6Rh4VXDEm
         foteZEQ9xZRj2agkDMGY4k/OtG/fii1KtIPHqcJhYbE1uCP7M2IJr1FY1eE6FKN3bOn4
         JP7mDe8VW2XdfAOOiKruStlKFvdgDN38R/D4KsTpR33qet0a19AEiNmLGQGlj1+SlbUP
         zS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=w5NxWLLzhgPNs7hgKxObXSucJQTrVLPMT6JRaxXmMGg=;
        b=hEAwvU4RwuY/ijJhHuln+HEWcT9rmSZS0NvDIYC6DcSxja7gxbzoocgood2YEPOzkM
         FF2sjM7702nUQzQ1geA3s2F4AP2JaKycP+EUEFtJjHfJcZqWeORsnUer/9jCKK2sVTk3
         cZCxoJkMuCQ+R+FwfAZmKtUvD0EaKzlHiC7akGtGXZ5DFCIQ9AZvjX4y0UJWTqFBjsxd
         YV3HHVGiCY6ppZuo8slUw1IQPjqkffe+U7z7sI88Gq48YwqHtX7/TaSiwUAu9xoO/Sw5
         olodfUqp4qW7E32CTDHEP9qdV4pMIZ1z8RxR3rDrSNW4YoVm2il5RyD/G/4OBN7LKu/o
         LH8w==
X-Gm-Message-State: AOAM533H3acy1DneLqK60JZc9SmssfuiOFDBQ/zy/E5vSCsc2tcwByFL
	IMQscajG7hT8hAqIdXO1TjQ=
X-Google-Smtp-Source: ABdhPJyV2UBegtSOrw2Zpi3F53Lq+71q6vd8Wp3vO3VMu7mlOM4kKYHZucbGpdf2r8Tyhuih4H/9fg==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr34684916wrr.368.1620223002719;
        Wed, 05 May 2021 06:56:42 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id s5sm6062841wmh.37.2021.05.05.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 06:56:41 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 May 2021 14:56:40 +0100
Message-Id: <CB5D4B64QTP4.GBH80G3VX3B6@arch-thunder>
To: "Jonathan Cameron" <Jonathan.Cameron@Huawei.com>, "Mauro Carvalho
 Chehab" <mchehab+huawei@kernel.org>
Cc: <linuxarm@huawei.com>, <mauro.chehab@huawei.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, "NXP Linux Team"
 <linux-imx@nxp.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Steve
 Longerbeam" <slongerbeam@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 02/25] staging: media: imx7-mipi-csis: fix
 pm_runtime_get_sync() usage count
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <793a5806a63b6313606fd1c344b9eec41e61a440.1620207353.git.mchehab+huawei@kernel.org> <20210505120652.00001236@Huawei.com>
In-Reply-To: <20210505120652.00001236@Huawei.com>

Hi,
On Wed May 5, 2021 at 12:06 PM WEST, Jonathan Cameron wrote:

> On Wed, 5 May 2021 11:41:52 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
> > The pm_runtime_get_sync() internally increments the
> > dev->power.usage_count without decrementing it, even on errors.
> > Replace it by the new pm_runtime_resume_and_get(), introduced by:
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to dea=
l with usage counter")
> > in order to properly decrement the usage counter, avoiding
> > a potential PM usage counter leak.
> >=20
> > Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> Not a fix as far as I can see, just a cleanup - so perhaps not this set?

yes, the original changelog of this patch, that I acked,  made it
clear it was a cleanup:

"
Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to
deal with usage counter")                                                  =
                                                                           =
           =20
added pm_runtime_resume_and_get() in order to automatically handle=20
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.
"

This one above is new, but I saw Mauro is going change it.

------
Cheers,
     Rui

>
> Jonathan
>
>
> > ---
> >  drivers/staging/media/imx/imx7-mipi-csis.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/stagi=
ng/media/imx/imx7-mipi-csis.c
> > index 025fdc488bd6..1dc680d94a46 100644
> > --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> > +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> > @@ -695,11 +695,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev =
*mipi_sd, int enable)
> > =20
> >  		mipi_csis_clear_counters(state);
> > =20
> > -		ret =3D pm_runtime_get_sync(&state->pdev->dev);
> > -		if (ret < 0) {
> > -			pm_runtime_put_noidle(&state->pdev->dev);
> > +		ret =3D pm_runtime_resume_and_get(&state->pdev->dev);
> > +		if (ret < 0)
> >  			return ret;
> > -		}
> > +
> >  		ret =3D v4l2_subdev_call(state->src_sd, core, s_power, 1);
> >  		if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> >  			goto done;



