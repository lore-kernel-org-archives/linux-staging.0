Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266C1D545
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706288371; cv=none; b=kfWsTKVOThLg+Yz6QKvvHtyMrASjJWU0jkpkdMeQMe8NhO2PGm/pyuO++wzwsRjXOoiP317pVzO9LAvtoz9BdcRSqIdJy37eiY0qi42EJv6o5KrkX8Jyog/B1cx6sbCx6beLMN4FhyxloapXb8kanre+87W7Gc5o+vh/7ux6CCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706288371; c=relaxed/simple;
	bh=K55Rlvt3w6gaXDDlVovrZuJxpLzhpRUjGl6y/U1k/MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtPwDmXBm+otnaAHW+urqzBx8d8AfFVPdorjYg3EKeMjLFekt/idavSeYjR3j5F0oIgERE8lPQxeUvs8ZSUSC6Fe+R9RoYd4Cj2QB1rs9k3Bohm0dxtjjCyRGozZ8Nbk5kbOmsCNLZDDZgQVzbrvr6++rzXmqnI4zc+aBDBNSp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPY4-0002Qf-3X; Fri, 26 Jan 2024 17:59:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPY3-002YBo-Go; Fri, 26 Jan 2024 17:59:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPY3-008nkw-1P;
	Fri, 26 Jan 2024 17:59:23 +0100
Date: Fri, 26 Jan 2024 17:59:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Elder <elder@ieee.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	kernel@pengutronix.de
Subject: Re: [PATCH v5 106/111] staging: greybus: pwm: Make use of
 devm_pwmchip_alloc() function
Message-ID: <yqq3vzx2pni75kx3rhamngrbudcikngcrhvdcvrl45kfz5ypni@mjttju35xhhx>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <fb29256a7f2dcda5ae92119997ac717a6280911f.1706182805.git.u.kleine-koenig@pengutronix.de>
 <4980ba8e-081f-47c3-aa63-a972a266577a@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4p5vvjyq24h4p6cg"
Content-Disposition: inline
In-Reply-To: <4980ba8e-081f-47c3-aa63-a972a266577a@ieee.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev


--4p5vvjyq24h4p6cg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Fri, Jan 26, 2024 at 09:08:15AM -0600, Alex Elder wrote:
> On 1/25/24 6:10 AM, Uwe Kleine-K=F6nig wrote:
> > +	chip =3D devm_pwmchip_alloc(&gbphy_dev->dev, response.count, sizeof(*=
pwmc));
> > +	if (IS_ERR(chip)) {
> > +		ret =3D PTR_ERR(chip);
> > +		goto exit_connection_destroy;
> >   	}
> > +	pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> >   	pwmc->connection =3D connection;
> > +
> >   	gb_connection_set_data(connection, pwmc);
> > -	gb_gbphy_set_data(gbphy_dev, pwmc);
> > +	gb_gbphy_set_data(gbphy_dev, chip);
>=20
> I'm pretty sure driver data should still be the Greybus
> structure, otherwise you're really changing the way this
> works (most likely in a way that's different from other
> Greybus drivers.

The problem is that you cannot easily get the chip from pwmc unless you
add a pointer to struct gb_pwm_chip.

Regarding your other feedback: You're right, this patch is more
intrusive than it should be. I wonder what went wrong. I'll do some
research and rework accordingly. Probably I squashed some things
together that should be separate patches.

thanks for your feedback
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4p5vvjyq24h4p6cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWz5OoACgkQj4D7WH0S
/k4KUQf6A/sgEifOotxBqJrMFHbcBLDZMvOpGfnsNRoeIX4hfmvwVlk7CJwLen3a
hPGCRnc6Gd9YQ3mkZD09npNW/l96CyNrmWV0i0Rk1+InyOgkv2dGjy0hBmOujHoG
FJQ8Pz2ZSSf214erEmsId9DMz+PlePGMSklbbGRifPLHQXRdXsa7261fkMj4iBhI
TOuucEJK4giG3YooM9Dk6z6Z2g6ihIdBtiJ4B3j9bXJn16fFSQzbsX/iKpJbIcOH
7biM2E/2Hz/01qoI9kQ5BUYJXGqoxhbh7zcxmUQJddhnfLvbFVjHsEpyl/apLGfE
KOeinhjrzCD3Z1rSvLZ9iOkS07qEgw==
=2yZJ
-----END PGP SIGNATURE-----

--4p5vvjyq24h4p6cg--
