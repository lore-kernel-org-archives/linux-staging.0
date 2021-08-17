Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449A2FAE
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 14:03:03 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q11so28796655wrr.9
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VVEiHKfbgxJy3Si7x9qMwuCkodu1ovrZav3yAuRw/WQ=;
        b=NGu0DCEpleG+Ep+gjrtMwj36Cigf1Xn/FwALxpXcDjG/HheiEOcqif1j7C30iNyDoR
         UfnkWvY654GbLJJiiHR7imSwFIKyv9XLT96K8+GsD6oCLfWY1318PUVuH4QQVpXL+5MB
         sWXWF+45ADknPxGX3t+Xe/QTitR63+pwekLYS4LtFAdHYnksZWahfT+1GTFaodEeWnqA
         eOx7tn6jgCs37eoODu+VwLdsRQzuUuonwBBcsUzg/5aaFUc8Y73zeAXoNTr9PLjG3bO9
         GV9fg3sIOtBFLYnWBNiTabJSWHMGHfUzG0ouqf+ehjLzM7Ukg8pSAWhUps4ZDVmX+JZ9
         8Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VVEiHKfbgxJy3Si7x9qMwuCkodu1ovrZav3yAuRw/WQ=;
        b=Mr6+4rfysCw5Kg+5fiHefc8EBxwoX0Mn21Bn/Yw+jnp/k4LaWmz3N8OCGtosmAggQJ
         kuM6PWrak17tvU2y8CPFxB392ztsvVpB45yrvClu+FYE9h2/ZApz4Q5jS/Ag6vyrJOer
         QdOvt7PsLzps2xtKh1L/vKqM8H9ZMh338fopjy24Sgjwy5Z16rh/1l5n9+ITzEfFC4Hq
         P2lXOHOBV5sEfRbojdd3kjGVjz+nMiORleTJ6XXR48lR/xEEE5dUxG1KI3lx4VERzfxz
         ctLdE6wwO+PgZ6J57af5DqpFb4rBeogt1adzToeEdOwo1FEaP2WW4mArlfVD77Bgn339
         S2vg==
X-Gm-Message-State: AOAM5305aS8xGc+96oNFLzHsJN0pko98SXfO8z60TLxKvvKJM8sCMRG8
	Eiu1dRGmMdjYknSFexqnwbM=
X-Google-Smtp-Source: ABdhPJygrj9qfA9fJB+/HxTzsq0FYpI1BCHKBArAxcgyM8xNpQ/5kTdymiAaBBuoBgqjg4SIBuMyfQ==
X-Received: by 2002:adf:f282:: with SMTP id k2mr4338657wro.255.1629208982405;
        Tue, 17 Aug 2021 07:03:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d8sm2628053wrx.12.2021.08.17.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 07:03:01 -0700 (PDT)
Date: Tue, 17 Aug 2021 16:02:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	Linux USB List <linux-usb@vger.kernel.org>,
	linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-mmc <linux-mmc@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	DTML <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 11/34] gpu: host1x: Add runtime PM and OPP support
Message-ID: <YRvBkyfFCqthBIBV@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-12-digetx@gmail.com>
 <CAPDyKFrax-EYtO03W5QWM2tcWLWeMM8hHZCRYFcsenuiP2zObQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fGItigaj8JHSG5hJ"
Content-Disposition: inline
In-Reply-To: <CAPDyKFrax-EYtO03W5QWM2tcWLWeMM8hHZCRYFcsenuiP2zObQ@mail.gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)


--fGItigaj8JHSG5hJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 02:04:38PM +0200, Ulf Hansson wrote:
> On Tue, 17 Aug 2021 at 03:30, Dmitry Osipenko <digetx@gmail.com> wrote:
> >
> > Add runtime PM and OPP support to the Host1x driver. It's required for
> > enabling system-wide DVFS and supporting dynamic power management using
> > a generic power domain. For the starter we will keep host1x always-on
> > because dynamic power management require a major refactoring of the dri=
ver
> > code since lot's of code paths will need the RPM handling and we're goi=
ng
> > to remove some of these paths in the future. Host1x doesn't consume much
> > power so it is good enough, we at least need to resume Host1x in order
> > to initialize the power state.
> >
> > Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> > Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> > Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> > Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
>=20
> [...]
>=20
> > +
> >  static int host1x_probe(struct platform_device *pdev)
> >  {
> >         struct host1x *host;
> > @@ -394,6 +423,10 @@ static int host1x_probe(struct platform_device *pd=
ev)
> >         /* set common host1x device data */
> >         platform_set_drvdata(pdev, host);
> >
> > +       err =3D devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
> > +       if (err)
> > +               return err;
> > +
> >         host->regs =3D devm_ioremap_resource(&pdev->dev, regs);
> >         if (IS_ERR(host->regs))
> >                 return PTR_ERR(host->regs);
> > @@ -423,12 +456,9 @@ static int host1x_probe(struct platform_device *pd=
ev)
> >                 return err;
> >         }
> >
> > -       host->rst =3D devm_reset_control_get(&pdev->dev, "host1x");
> > -       if (IS_ERR(host->rst)) {
> > -               err =3D PTR_ERR(host->rst);
> > -               dev_err(&pdev->dev, "failed to get reset: %d\n", err);
> > +       err =3D host1x_get_resets(host);
> > +       if (err)
> >                 return err;
> > -       }
> >
> >         err =3D host1x_iommu_init(host);
> >         if (err < 0) {
> > @@ -443,22 +473,10 @@ static int host1x_probe(struct platform_device *p=
dev)
> >                 goto iommu_exit;
> >         }
> >
> > -       err =3D clk_prepare_enable(host->clk);
> > -       if (err < 0) {
> > -               dev_err(&pdev->dev, "failed to enable clock\n");
> > -               goto free_channels;
> > -       }
> > -
> > -       err =3D reset_control_deassert(host->rst);
> > -       if (err < 0) {
> > -               dev_err(&pdev->dev, "failed to deassert reset: %d\n", e=
rr);
> > -               goto unprepare_disable;
> > -       }
> > -
>=20
> Removing the clk_prepare_enable() and reset_control_deassert() from
> host1x_probe(), might not be a good idea. See more about why, below.
>=20
> >         err =3D host1x_syncpt_init(host);
> >         if (err) {
> >                 dev_err(&pdev->dev, "failed to initialize syncpts\n");
> > -               goto reset_assert;
> > +               goto free_channels;
> >         }
> >
> >         err =3D host1x_intr_init(host, syncpt_irq);
> > @@ -467,10 +485,14 @@ static int host1x_probe(struct platform_device *p=
dev)
> >                 goto deinit_syncpt;
> >         }
> >
> > -       host1x_debug_init(host);
> > +       pm_runtime_enable(&pdev->dev);
> >
> > -       if (host->info->has_hypervisor)
> > -               host1x_setup_sid_table(host);
> > +       /* the driver's code isn't ready yet for the dynamic RPM */
> > +       err =3D pm_runtime_resume_and_get(&pdev->dev);
>=20
> If the driver is being built with the CONFIG_PM Kconfig option being
> unset, pm_runtime_resume_and_get() will return 0 to indicate success -
> and without calling the ->runtime_resume() callback.
> In other words, the clock will remain gated and the reset will not be
> deasserted, likely causing the driver to be malfunctioning.
>=20
> If the driver isn't ever being built with CONFIG_PM unset, feel free
> to ignore my above comments.
>=20
> Otherwise, if it needs to work both with and without CONFIG_PM being
> set, you may use the following pattern in host1x_probe() to deploy
> runtime PM support:
>=20
> "Enable the needed resources to probe the device"
> pm_runtime_get_noresume()
> pm_runtime_set_active()
> pm_runtime_enable()
>=20
> "Before successfully completing probe"
> pm_runtime_put()

We made a conscious decision a few years ago to have ARCH_TEGRA select
PM on both 32-bit and 64-bit ARM, specifically to avoid the need to do
this dance (though there are still a few drivers left that do this, I
think).

So I think this should be unnecessary. Unless perhaps if the sysfs PM
controls have any influence on this. As far as I know, as long as the
PM kconfig option is enabled, the sysfs control only influence the
runtime behaviour (i.e. setting the sysfs PM control to "on" is going
to force runtime PM to be resumed) but there's no way to disable
runtime PM altogether via sysfs that would make the above necessary.

Thierry

--fGItigaj8JHSG5hJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbwZMACgkQ3SOs138+
s6EqjxAAs5FWbje3iCJOP7sod6VEu/M7e7ZG4mEPa2/e+EajCY0rD+kJaknBVNdK
htJY+3B3pez2I2TjXZtaFOzcXEVl0e94EIQb8bY1wZEFLg91V6DTPfnvbEPb9BN8
kzesliKQKiVhD/gG5D/9K7TnEFThE2JTj02MDE7Q6opTEaxlKgAN8jrbkNCuAOUg
wCrzFqRzmbVuuZrGkA/xApbfCh7lTLObvJ1enX9IB0s/WZZfej3PrylP5U379Nab
OA1JisBmk5NHgi8djWyeN/X+urNAYDixcJIfwPqs3yqb3+piiG+X+oNX8Xz6byUt
bZJ86CC/A4XGufnL7A0+ZKrd/UYNH3WE17R16LxFytD1chZQ82aWyVIJPGLW+42q
k6lWheWwNsn2Gua2ZOlUfkC9fRD6Sj/fSnqRS0zgslnq/n80VGIz/35q2zCZ1tiG
D4hRPhQukShFXdCy/HaNXbtdXfTGZH8owlNDiDArmoIclSj+828GRbMqDTJDVxUs
RldB6jISMtRo/iBpCoj9VM1h01kedIHXimkm8zsOyVWYapi6ScKSbMqWaPS02SSe
Fc5t4wnn/jSruWZ5HVHU+iOOmlU6Buli+4cQZQIsUOb4FD4V+BrEO3ArlYzxkzH5
mAM+3LofUzwqGi67FOn92GGM/LJZcDAX6v5c8WjnpM1uh5VdR5g=
=8GYQ
-----END PGP SIGNATURE-----

--fGItigaj8JHSG5hJ--
