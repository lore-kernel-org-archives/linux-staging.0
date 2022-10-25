Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1347B;
	Tue, 25 Oct 2022 15:35:49 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 49DEE40005;
	Tue, 25 Oct 2022 15:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666712142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gljpnoLdjIj8FbPBucJH+YyBjAPYhwcjGzRd/+2JJQw=;
	b=T/k+AbuL8LIp52QrJAzo2LJ42AWkOjjNgtqUWu+ZMYuYLjkK3uHkRY6euDkBQnKVI9swFN
	eOjXRCVBfx+yazWvnC1AOhcEucXdZPWFju49HXACZIR7D8mRxKNbKpg2QSWDYTFqQcN+sy
	Y9dbhiVyXdoXaKIevjkUq5tefS2e1VC/T0JcLSt121Yo+11tj33qPc+MJ9qoZXqHrqlxsh
	LaeJFQJii+k3kuHzbDgEGFsl7CBdrnzDqbo8UQiKjF+WDjbqNrpzUy/QaH5Q30BWBwLU+M
	7IIibejt4/ltjZ2XrdJXEMLVK0j6ygPsAAzFrlKNc44EqHWs2/T30qqRGGzQzA==
Date: Tue, 25 Oct 2022 17:35:33 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, mripard@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
	samuel@sholland.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] media: cedrus: Add helper for checking capabilities
Message-ID: <Y1gCRR8gMwy84WiT@aptenodytes>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com>
 <13124586.uLZWGnKmhe@jernej-laptop>
 <Y1f/U8NxyJo/pMAH@aptenodytes>
 <8131177.T7Z3S40VBb@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0MKLJJwphdxhPi/7"
Content-Disposition: inline
In-Reply-To: <8131177.T7Z3S40VBb@jernej-laptop>


--0MKLJJwphdxhPi/7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 25 Oct 22, 17:28, Jernej =C5=A0krabec wrote:
> Dne torek, 25. oktober 2022 ob 17:22:59 CEST je Paul Kocialkowski napisal=
(a):
> > Hi Jernej,
> >=20
> > On Tue 25 Oct 22, 17:17, Jernej =C5=A0krabec wrote:
> > > Dne torek, 25. oktober 2022 ob 08:30:28 CEST je Dan Carpenter napisal=
(a):
> > > > On Mon, Oct 24, 2022 at 10:15:08PM +0200, Jernej Skrabec wrote:
> > > > > There is several different Cedrus cores with varying capabilities=
, so
> > > > > some operations like listing formats depends on checks if feature=
 is
> > > > > supported or not.
> > > > >=20
> > > > > Currently check for capabilities is only in format enumeration he=
lper,
> > > > > but it will be used also elsewhere later. Let's convert this chec=
k to
> > > > > helper and while at it, also simplify it. There is no need to che=
ck if
> > > > > capability mask is zero, condition will still work properly.
> > > >=20
> > > > Sure.  That's true.  Out of curiousity, can
> > > > cedrus_formats[i].capabilities
> > > > be zero?  Because it feels like that's what should be checked.
> > >=20
> > > Yes, it can be. It's the case for V4L2_PIX_FMT_NV12_32L32. All varian=
ts
> > > supports it, so there is no special capability needed in order to be
> > > listed. What would you check in such case? Condition still works for =
this
> > > case.
> > I think the problem is that (bits & 0) =3D=3D 0 is always true.
> > So if the input caps are 0, we need to make sure to return false.
>=20
> No. If format (or any other) capabilities are 0, means they are supported=
 by=20
> all variants and it's expected from cedrus_is_capable() to return true.

Mhh, yeah. Not sure what I was thinking. Sorry for the noise.

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--0MKLJJwphdxhPi/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmNYAkUACgkQ3cLmz3+f
v9ExOgf+JjLX4UvV2q9WgfaedsDfvk8XQ59souVqoWl11kJGfLC74ip19V7R5ttI
wo4Vl3QiaxHTpEYnd+v2TEMNDQwJtDsiGk5q3WseMkq+43RNU2CVO7+CUHSZOx6P
YYoAxWRCHLdXReHCGlfLsTc2UrarJpwXrHZmb/90czDBLoLJ2vmlmKPUbGq1lLyx
EfYgbipaDMydKh5EVaQ8/1cGzDhZ37eUiISHtz/0yppi87pkLPK27AHMKtwSlThU
GSqVolVkhfnSqDZGFoMsjQ+SiWA+4ff1WSOZeJcEfr0mNoFi0rh0ZWz0mkpZoRfd
XzMOHG4IkTS/kHaQ9Th2p3x+9ANCXw==
=8Pgc
-----END PGP SIGNATURE-----

--0MKLJJwphdxhPi/7--
