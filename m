Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9A72
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 07:52:16 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1leYnu-00050R-93; Thu, 06 May 2021 09:52:14 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1leYnt-0002yk-L4; Thu, 06 May 2021 09:52:13 +0200
Date: Thu, 6 May 2021 09:52:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Sven Van Asbroeck <TheSven73@gmail.com>, linux-staging@lists.linux.dev,
	kernel@pengutronix.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] staging: fieldbus: anybus: Make remove callback
 return void
Message-ID: <20210506075213.uytlw6txmgstapam@pengutronix.de>
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210506064843.GA1432@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7q6ggvm5elpc3lb5"
Content-Disposition: inline
In-Reply-To: <20210506064843.GA1432@agape.jhs>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev


--7q6ggvm5elpc3lb5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 08:48:44AM +0200, Fabio Aiuto wrote:
> Hello Uwe,
>=20
> On Wed, May 05, 2021 at 10:29:22PM +0200, Uwe Kleine-K=F6nig wrote:
> > The driver core ignores the return value of struct bus_type::remove()
> > because there is only little that can be done. To simplify the quest to
> > make this function return void, let struct vio_driver::remove() return
> > void, too. All users already unconditionally return 0, this commit makes
> > it obvious that returning an error code is a bad idea.
>=20
> looks like that the commit description hardly matches what you changed
> here. You changed the return type of handler remove() of struct
> anybuss_client_driver. Are the latter and bus_type tied in some
> fashion?

Oh, vio_driver leaked from my copy-and-paste template.

> Why using :: notation?

If you have a better suggestion I'm all ears.

Will resend with Sven's Reviewed-by and
s/vio_driver/anybuss_client_driver/

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7q6ggvm5elpc3lb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCToCoACgkQwfwUeK3K
7Am0Dwf+LVneco5MAnnnTHd9euAjmxZj/miyaOOtrqUIubBnKj0nJ73/JZ0bCQg/
kw5qKncOBUMtX8nejT+YkXMvQmvQedkG+w/6FXG3SNppCTsuBV0PcHGPGGB4jHek
Lkjbyr6avS0zQmIA1QGuCBKEnEchmItIFe5vAWQA148XRpKCl6pL79yPvTFzH9ij
kaXFzhFq98g7oY0steqglWJi1NvcS7jmkpAIo0QHXkckSkvi11xwX1K24Pma4ZYZ
8qht8fb/45mhQ+iJScNTDunDGYgpiPVKsqolF8QoixNc2yjriB9QJVSKYrYPyPuL
53Wxf4VSlhohmlDAZEkRzzoLGgW5AA==
=33sp
-----END PGP SIGNATURE-----

--7q6ggvm5elpc3lb5--
