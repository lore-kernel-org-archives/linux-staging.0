Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B65315BE
	for <linux-staging@lists.linux.dev>; Sun, 11 Jun 2023 11:08:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8IvO-0005o4-Ri; Sun, 11 Jun 2023 13:07:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8IvG-006dPW-1c; Sun, 11 Jun 2023 13:07:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8IvF-00DAvn-AG; Sun, 11 Jun 2023 13:07:49 +0200
Date: Sun, 11 Jun 2023 13:07:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Corey Minyard <cminyard@mvista.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Haowen Bai <baihaowen@meizu.com>, linux-media@vger.kernel.org,
	Tom Rix <trix@redhat.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-staging@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	kernel@pengutronix.de, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 2/5] media: atomisp: Switch i2c drivers back to use
 .probe()
Message-ID: <20230611110749.jujuc2j6qx2nlihy@pengutronix.de>
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
 <20230524151646.486847-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ylgp6gq634z4w6mq"
Content-Disposition: inline
In-Reply-To: <20230524151646.486847-3-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev


--ylgp6gq634z4w6mq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, May 24, 2023 at 05:16:43PM +0200, Uwe Kleine-K=F6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

the four other patches from this series are already in next, this one
wasn't picked up yet though. There is another change for staging: media:
atomisp in next via Mauro's media-next (branch: fixes).

Who wants/should pick up this change?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ylgp6gq634z4w6mq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSFqwQACgkQj4D7WH0S
/k4EDAf+N/WOndvYElwhTM47DRHzev2j8LYxaENNCO8QpY2ENiN4yJoO/jbnP1ol
iKyvYKSK+hH3cZ8Ixs8060aJFQJHQfEz/tTJ37JLBX3Vz+yoasHzyhW45vXmXLtb
4hRKeleQ9dxjSQPzqjMjkz6shCNBP1qZ45Zp9isC/bcuCSWgMFb86PdRGMdbvCh2
Ru1fyINNtdZ+iady9mT0zwck2GM6ZO5WTeymK8LjMFdQfKgwwHvpFfEMEgRExzqy
W6+3IdGNyQ2HMe4SHY7MhIWwSnGJDbT1v8fnCsQY/1jxr0sXWzQ0QthOKV716Z7+
+na/Hk6kRQWdg0rSHM7H/jNXnUVXxA==
=wJ71
-----END PGP SIGNATURE-----

--ylgp6gq634z4w6mq--
