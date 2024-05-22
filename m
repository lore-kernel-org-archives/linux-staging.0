Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2FA1CD13
	for <linux-staging@lists.linux.dev>; Wed, 22 May 2024 06:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716359715; cv=none; b=psJZuC81mRooD7yLmpWsjtyS7zA0oktsLbck00MOd7u6BLrtyefV6DvIFfVJG9d7O6J+IKIJD1XKR8fztVmr3eQ700Q6uDkdO04TuYO9KMtHUbFUDm+KuXGVk6gbXWbaLHpZF89e1d1bGea6OjovsHOpNch0TZbCfU0ZL06SM70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716359715; c=relaxed/simple;
	bh=X8rLGo0UlJp2wtKgpA+t8cBG/O4x7c1LqkTnEXK4a/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPQ0TGzMhSWUrLNZe7G0Z5Kz3lshKg3wtcPiNqmpD6z1FP8UF4Slvn30oEi3tAqHFx35cDpdChoVRkAr2YVmWNXWEw/E6ag/xO+Dr5TvwYRKoDiF+/TvKQghy1T48G7gd08VvIFGSNP43PrP/7mc2X7q4YcjDYmTEDnx7E4NIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9fZ3-0004gb-HP; Wed, 22 May 2024 08:35:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9fZ2-002UMT-E7; Wed, 22 May 2024 08:35:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s9fZ2-009mSN-16;
	Wed, 22 May 2024 08:35:04 +0200
Date: Wed, 22 May 2024 08:35:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jack Zhu <jack.zhu@starfivetech.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-staging@lists.linux.dev, kernel@pengutronix.de, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: staging: media: starfive: camss: Drop obsolete
 return value documentation
Message-ID: <qftrobdg46arzt5isc2fwmgwncnszkcfcsw3gf3exk7a6ubhzv@w4icj5ykvskl>
References: <20240424140249.542283-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="irto7zmcai2v5kbc"
Content-Disposition: inline
In-Reply-To: <20240424140249.542283-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev


--irto7zmcai2v5kbc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 24, 2024 at 04:02:48PM +0200, Uwe Kleine-K=F6nig wrote:
> Recently the function stfcamss_remove() was changed to not return a
> value. Drop the documentation of the return value in the kernel doc.
>=20
> Fixes: b1f3677aebe5 ("media: staging: media: starfive: camss: Convert to =
platform remove callback returning void")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> during review of the patch that became b1f3677aebe5 Changhuang pointed
> out this patch opportunity. But before I came around to send a v2,
> b1f3677aebe5 was already applied. So here comes a separate patch.
>=20
> If you prefer, feel free to squash this into b1f3677aebe5.

Who feels responsible to pick up this patch (or alternatively give
feedback)? Did I forget to address the relevant persons?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--irto7zmcai2v5kbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZNkhcACgkQj4D7WH0S
/k7//ggAgqCR5IcnjUsAPtllfh8Zcrl8n3PJ7M0KomFrfg5bfcfrHuLQJgVU3kNH
mehcN/LaVLSNoT9zl23q6Sbr+3AFG8DfFKcSFAY7qX78PGlqFoqK29cZcGxr1tEV
F+JzO2MERburA/cbz5/88axVq75zY9uGiuPtnFYjv0amoYg7cWm9WzP6XzdkOr8E
dC9i6uE6lrYK0Ap90XIydmnPlUWhD6MEis7cF7TrVIN+nHYJBDsyVE78jmu905Ag
N9oYpv5r+9Z8kdsP4Ba8XFNaVJP4eNMXnpmhqD1ySB5N01L7H+Kv/c5uGYda1bsG
cQoBtYQCD3j5fviXV357pVrYZf1yWg==
=6Qcj
-----END PGP SIGNATURE-----

--irto7zmcai2v5kbc--
