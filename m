Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7831D71
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 06:17:18 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1leXJz-0002Ha-Fg; Thu, 06 May 2021 08:17:15 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1leXJy-0006aB-BA; Thu, 06 May 2021 08:17:14 +0200
Date: Thu, 6 May 2021 08:17:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] staging: fieldbus: anybus: Refuse registering
 drivers without .probe()
Message-ID: <20210506061714.chy3xeybpquxg7q6@pengutronix.de>
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210505202923.198607-2-u.kleine-koenig@pengutronix.de>
 <CAGngYiViy_o2Wzdn0axWeR1FSijH+5d7yLDTkAL+mQnEMkuJBQ@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opns76ebobfte325"
Content-Disposition: inline
In-Reply-To: <CAGngYiViy_o2Wzdn0axWeR1FSijH+5d7yLDTkAL+mQnEMkuJBQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev


--opns76ebobfte325
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sven,

On Wed, May 05, 2021 at 05:04:55PM -0400, Sven Van Asbroeck wrote:
> On Wed, May 5, 2021 at 4:29 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > A driver without .probe() callback could never bind to a device because
> > anybus_bus_probe() returned an error for such a driver. So refuse to
> > register such a useless driver.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Looks good to me. For the series:
> Reviewed-by: Sven Van Asbroeck <TheSven73@gmail.com>
>=20
> Uwe, I'm glad you're submitting patches for fieldbus. Hope you find it
> useful. This code is in staging mainly because only a single
> company/developer is using it. So if you are actively using this, or
> planning to use it, we can work towards taking this out of staging, if
> you like.

It's not useful for me. My motivation is to make struct bus_type::remove
return void and this driver was just one of the offenders that
theoretically could return a non-zero value.

So sorry, I have no motivation to support getting this out of staging.

BTW: I just noticed there are occurences of anybuss and anybus in the
driver. Is only one of them right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--opns76ebobfte325
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCTiecACgkQwfwUeK3K
7Amu2Af/T4GaJ+XCuVaaE3fexKBPnFvgedQ5W7nhXNkI0pkhyQQO4zquYTgo7wI1
9YotWHVfEEgu38HvsgADPdXhhJ6eGsN4UvmzGUWdELq2qxVOv9aog9cAJWvrX2Ap
iQrHRfw4F9Xwn7z5/Q/oifMUV7xv8MBY372UntFBDomRCYa0Wn66tVE0WfbXxMRO
PoQavsOe+aJNEW+DmhZ1aBEy85+bRTKYbClnJPK7K0bBkKYrFsijejGyKGEH2BhK
3MbSgMsJR3/TPf15//SxtC5mCsnCsu4Inxh3W1n7d6FWhjIiKw9NoS/yTSQZ+9aq
0XOavzzKdqAcRmjUqNVxAXJuPcom3w==
=s2Ut
-----END PGP SIGNATURE-----

--opns76ebobfte325--
