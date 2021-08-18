Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1642FAF
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:42:12 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q11so4474633wrr.9
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 09:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W5GdT8EduZhugpUzvA2/GGwOnhoyQZEiDeyMUn6wh8E=;
        b=bycOHzTRH+aRXcUmSXBOsZG5Gkzo5xIQfqMjeSwTAggOfBKGiaEZit8SDMA+PJV/4R
         +SioqGMlkGUdU6qIL2kxqre0MEaJPxbT+4UymP0e0nIcatW2YHuqV6G0EIqPFtuQCXGi
         Jbq09VFv7EPVyH4eqNrlwu5USRtrIn6CMQC5U3LS+A02T5Q9fvgScM1H4nhBKGtN6RUL
         Y7XsBkNrly0Ys3jNk9rVgELVdzM5wqEqZJwenqVHtLxnyDipXrN6bN2LOmUK3dXnQ22U
         JiAZrzffEiDVy9U9R9IWv6dEQafAII9n5gfOOnt2dMqQTo7gBmHpvFh40BS5bWEuQ0Sg
         o14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W5GdT8EduZhugpUzvA2/GGwOnhoyQZEiDeyMUn6wh8E=;
        b=OT4rCIMfCqAMgLQ+zFr1SbDFmPi/6e/520c4mReBed/RzKuatd5x9BjbyETr9JjJKN
         lR9NDRCswpYP89okjlIA7uqURAPlRPNn/BvH8xbfWpVOWjh/fScTxD+5OzoogB6EhNy8
         Zji0Ns1Y8cPLlHPnMhoglvcinrbpx1EXzjZYxr5ZuofGLJowZZpDtThcH6tq2UNCyRqn
         NKieacqilLQQtdxYsbwkoJ8BfjnOpkVhfkho3zyolohUMHfH0Dpl+5gOCiAy1xk/mPZM
         lTEK5mvxhnVF212OWtkL70iXO6zYAdwKalpSuAIb4Exsvs8lKYBzpSUcEr8lOtL1Xq6W
         PbKg==
X-Gm-Message-State: AOAM533FqEA5CGeFCc2R0Qpiq6FWipbQz4MB3klHeORxSEnjYhWmRp8L
	ewLePdzXNYAmQaiXRm78HmE=
X-Google-Smtp-Source: ABdhPJybiNwCfJ6kqxUImknf7ykkkk34GLtm70yXj+iZARNGInDoPzAW6ue7Kn6H0xv3rLWosSR4+g==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr11446318wrt.226.1629304930527;
        Wed, 18 Aug 2021 09:42:10 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v12sm296002wrq.59.2021.08.18.09.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:42:09 -0700 (PDT)
Date: Wed, 18 Aug 2021 18:42:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
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
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
Message-ID: <YR04YHGEluqLIZeo@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-8-digetx@gmail.com>
 <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZRswRx01OcPCxpgj"
Content-Disposition: inline
In-Reply-To: <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)


--ZRswRx01OcPCxpgj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 06:05:21PM +0300, Dmitry Osipenko wrote:
> 18.08.2021 17:07, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Aug 17, 2021 at 04:27:27AM +0300, Dmitry Osipenko wrote:
> > [...]
> >> +struct clk *tegra_clk_register(struct clk_hw *hw)
> >> +{
> >> +	struct platform_device *pdev;
> >> +	struct device *dev =3D NULL;
> >> +	struct device_node *np;
> >> +	const char *dev_name;
> >> +
> >> +	np =3D tegra_clk_get_of_node(hw);
> >> +
> >> +	if (!of_device_is_available(np))
> >> +		goto put_node;
> >> +
> >> +	dev_name =3D kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
> >> +	if (!dev_name)
> >> +		goto put_node;
> >> +
> >> +	pdev =3D of_platform_device_create(np, dev_name, NULL);
> >> +	if (!pdev) {
> >> +		pr_err("%s: failed to create device for %pOF\n", __func__, np);
> >> +		kfree(dev_name);
> >> +		goto put_node;
> >> +	}
> >> +
> >> +	dev =3D &pdev->dev;
> >> +	pm_runtime_enable(dev);
> >> +put_node:
> >> +	of_node_put(np);
> >> +
> >> +	return clk_register(dev, hw);
> >> +}
> >=20
> > This looks wrong. Why do we need struct platform_device objects for each
> > of these clocks? That's going to be a massive amount of platform devices
> > and they will completely mess up sysfs.
>=20
> RPM works with a device. It's not a massive amount of devices, it's one
> device for T20 and four devices for T30.

I'm still not sure I understand why we need to call RPM functions on a
clock. And even if they are few, it seems wrong to make these platform
devices.

Perhaps they can be simple struct device:s instead? Ideally they would
also be parented to the CAR so that they appear in the right place in
the sysfs hierarchy.

Thierry

--ZRswRx01OcPCxpgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEdOGAACgkQ3SOs138+
s6G9mg/7B+N6pKP5RLa+6MqSqr6J1GJQB7fIfzIcmA+LrnV32JQkR+5m6b7bfiYa
DoWB783TtFILVyc4wpZ/rsEbV7fjEXQiyn4NP44rTeb/EIm54Ls30KodfLm2e+RB
bomthI0uoJmGnwrE/l73t4XFVGOfslcYBTGhJpGoS6y/mWsszBziqsv7TZjK9EFx
oBHc5ZPXK6jg2jNdB214Qt9mFH0Y4e23XwC8NH8YRmPANz+BHUX5yLOqpNzBFBqX
6pltXB/ddB7OMVqgbyghTDPHPr9TM86APIFi29w6aqeXx4JPrih2jtxugr7wDu1r
05XNQifCKrPCdLHRU6KmSCiOt+9cN3Ze4GIok4i/qVaSJh0oZip+rblv8GCeAXzV
zra4hTvTG6SNtcYqEZb87DpB7lzU5umKm11TQqjRDH+wEiXcCVFtY1qtvv/WZXfV
OXMG4pYoU70hxKnlp+MlhsX+1tkWnpb4us35yEYxAv7UqUEXPqaHdRNT4uO8tiGy
s80pZ6s3Bm1PGRo6wO3dvLh4OXT6QY2Ov+lwZmmUHurizSvRvZ/9B/pL6HLG3NWM
x1513tBCxJb9dMPsLPK9BZbY1mDopAa6XjMjiaIVkDbrEs7zF0doeksIw50os1Bk
dNgOWnghgHtl13lzRRLHi/H4onElpL3LCiDteV0kIurgC4v5DeM=
=SBkO
-----END PGP SIGNATURE-----

--ZRswRx01OcPCxpgj--
