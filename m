Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ABCBA40
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 21:01:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pf5aY-0006RO-BY; Wed, 22 Mar 2023 22:01:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pf5aW-00600B-VU; Wed, 22 Mar 2023 22:01:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pf5aW-0078GS-7J; Wed, 22 Mar 2023 22:01:40 +0100
Date: Wed, 22 Mar 2023 22:01:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
	elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4] staging: greybus: remove unnecessary blank line
Message-ID: <20230322210140.xocbx7t4opo2tqmi@pengutronix.de>
References: <20230322113735.31214-1-eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7q7putkqdcorqid"
Content-Disposition: inline
In-Reply-To: <20230322113735.31214-1-eng.mennamahmoud.mm@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev


--r7q7putkqdcorqid
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 01:37:34PM +0200, Menna Mahmoud wrote:
> Remove unnecessary blank line before struct as reported
> by checkpatch:
>=20
> " CHECK: Please don't use multiple blank lines "
>=20
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>

Looks good to me now. Thanks for not giving up.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--r7q7putkqdcorqid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQbbLMACgkQj4D7WH0S
/k7wQgf+ONVndGTHzhy+YKot/A+pZ9zlWAAJfJnxJbCjhLQnmIepoZGbGLY35dXs
kxnpfkm4+BOxJ8XaMh17TTit9MgoaDNbAajhI3D3ssvjL3ty5NK/aU5FbtYK7cB5
H9rufT4+ew9h59P+OkndlFdArjEOKuNx8YY2KUkdc2kOsKAJXwOnM44MKwRmM40X
hnNRfcF5UeHA7inux3952me5wzdiym2JUq6x9xowrKU0TOdUklDZhUwxlO//NeBK
T57BaRK7NBPl5WG2NA6rLVeRHnzADSR7W2AXYJTV8ZFSjvelvwjaJd7Bf4UTZk9N
kPnHTdnkBKbzNXqw5yQXHAWe5Xcbfg==
=sOsU
-----END PGP SIGNATURE-----

--r7q7putkqdcorqid--
