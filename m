Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73351CF9C
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyZuP-0001ur-2A; Thu, 02 Nov 2023 16:47:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyZuN-0066bg-HP; Thu, 02 Nov 2023 16:46:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyZuN-00BgcN-8B; Thu, 02 Nov 2023 16:46:59 +0100
Date: Thu, 2 Nov 2023 16:46:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 1/4] Remove redundant return value check
Message-ID: <20231102154659.l33yey6fpwyytu3b@pengutronix.de>
References: <20231102141135.369-1-adiupina@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k44lgugu55h4rz4f"
Content-Disposition: inline
In-Reply-To: <20231102141135.369-1-adiupina@astralinux.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev


--k44lgugu55h4rz4f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexandra,

it would be great if you could improve the Subject line for the next
patch submission round by using an appropriate prefix. Currently at
least three of the four patches in this series have "Remove redundant
return value check" as Subject/commit short log. (I didn't get patch
3/4.) Something like

	media: atomisp: i2c: Remove redundant return value check

seems to be appropriate for this patch.

You make life easier for the recipients of your patch because it becomes
easier to see if you're responsible for this patch or not. So you're
wasting less time for people like me who have no further interest in
this patch set and the maintainers of the affected drivers immediately
see what was touched. That's a win for everybody; including you.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k44lgugu55h4rz4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVDxHIACgkQj4D7WH0S
/k6u1AgAqZNEC6WtPDsEh5hU/cTuHNNFKGT716JO9um6T87BDBRqkRv++YaFwVLr
WD7Ie/dvTI1NHjtTzPo2C1fvIzXs9+hsT3sZsThZ9bXMKgy4kB3NCjqcgcwRqHed
c/Mq8nSo/SaxKhvmnAJidSrSWnQLzQEHBw/WbAHQWBdNy4WxkiTGRCWlqOQ+m8lh
KuepCckDqe+4KEP1OZSeOCshBUDhVbUK8sawdECzVkkr7pkzV25uYqwSnn1FVK1p
amK5teXXm5dtsrsg9osGv89Y+6Mzpzm1qLo/+QMUdVwzh+rb4JjcSkiVtNOa3MfV
BwrAiowXSt4Z93Qxpq7DxDdrntWGug==
=XLSN
-----END PGP SIGNATURE-----

--k44lgugu55h4rz4f--
