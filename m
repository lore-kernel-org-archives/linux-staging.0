Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6A4DDBA;
	Wed, 16 Aug 2023 10:18:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 2976CC7E6D;
	Wed, 16 Aug 2023 10:10:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B9CDFF806;
	Wed, 16 Aug 2023 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692180593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h5lQWAeW+NPtPE1/7EDtPleEl+xEGXup9jpMcYQ0n6M=;
	b=DlYF10Orb/YRYdAJs40h8geepm6lgzERhMPFuAx1rfJ/3D5mqvGKAigz3jivXKPYWOycQn
	qpxAjJqFrAc0N299pIhFnHFZHdgK/nvL9HTAX6AZ9bhMxRgSGiwOGvbiQ5XggUY7Yo0wMm
	oWEo+kO2upJ/QaYtpHrS5Eon0/ocUF6tCrRS5RA1aHOJHnPiLy3qMkcZSPBPSWSheJ65qe
	H/fSWk1/uHEdaiXI8H0F5lcOYbUqDsyg/lDKX8wUzaV3CfgNe+U5nbe9xR2BN7TsKKUFy3
	njFLId+hO/MILW2rbPy3ZtCs67tNbZoIXSYuzxmrVTDZP/UGsG6PEk+X5scbOg==
Date: Wed, 16 Aug 2023 12:09:47 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: TheSven73@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
	mchehab@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH -next 2/2] media: staging: media: sunxi: cedrus: Remove
 redundant of_match_ptr()
Message-ID: <ZNyga6GGlSiKpMqE@aptenodytes>
References: <20230811024945.2256437-1-ruanjinjie@huawei.com>
 <20230811024945.2256437-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A9Pa7haUiISTifj7"
Content-Disposition: inline
In-Reply-To: <20230811024945.2256437-3-ruanjinjie@huawei.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com


--A9Pa7haUiISTifj7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 11 Aug 23, 10:49, Ruan Jinjie wrote:
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
>=20
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks for the patch!

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 8e248d4a0aec..f52df6836045 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -708,7 +708,7 @@ static struct platform_driver cedrus_driver =3D {
>  	.remove_new	=3D cedrus_remove,
>  	.driver		=3D {
>  		.name		=3D CEDRUS_NAME,
> -		.of_match_table	=3D of_match_ptr(cedrus_dt_match),
> +		.of_match_table	=3D cedrus_dt_match,
>  		.pm		=3D &cedrus_dev_pm_ops,
>  	},
>  };
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--A9Pa7haUiISTifj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmTcoGsACgkQ3cLmz3+f
v9EqXwf8CN23uyCZvWuHCFCGwyazYagcl06F9igVRFlNx1JcpSilPC0s/vCeZzks
240k+JQDOqoIeC6sHKJfyfBWSEWwc7j7GnKQRZnVA0+bU5fl4f3/wDWzKl6hnUVR
aW6ZVyVigGKuTeGw3DwvRXvdFHPvLwAuDJ3SYz2E51XJ06KPaVxZyu2ifoQUqIXk
RWUJkZR6e/lt/9376J5JItKThqFa8LEe2RBk3E55GeNHBXBr2d/9Q36XW/wdow38
E84wzyD4jFeO1iRdm1n0rZIojgtwTc2iPxm+OM8vvGaCdgliLpfpezZZ+1zWuJCq
5+q6bs4Dr5apCGu86U3CcviVi3oL2w==
=frhy
-----END PGP SIGNATURE-----

--A9Pa7haUiISTifj7--
