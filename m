Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A862C6BB
	for <linux-staging@lists.linux.dev>; Sun, 28 Jul 2024 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722167182; cv=none; b=ReQ0Tz9Tg05yXbLONi6d5mEV2KIJd49ll+Kr9eRjnCFEXRfA/9DetErumZUH+Z0zJvp6NOzfI8Sdn3LGg6Mm79iEa54oZGtWj3rmkhwUFmznxOZMRZ722JY2ykNMsV0loCx+mM33ZvNrPSo8fJ/z0ycB19TrtPbnzB/ihGSQC4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722167182; c=relaxed/simple;
	bh=+z87nA1Y00AL4sMT64kGifYWqtgmhO1S1figOc16cqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ak3EQuSk7vDIzPPn1ypAHVY/tbqgb9fYPvffHocLjrYa22nG9k72R0mFLW/EDJQCYJTfWWOwitJ7P8D3adx/aVx1IGPWjoAC/l48ZzvlXzrqOpWcj7WuOj2X6t8tRRtnZMbMfzDR/dfFGEtFVMMqb0pbXiISwZn3KXUGTQV8cig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WDP/o5Zc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WDP/o5Zc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+z87
	nA1Y00AL4sMT64kGifYWqtgmhO1S1figOc16cqE=; b=WDP/o5ZcRr1U3dhiLhkH
	nrk6gQzo9F+t3A0ylOxEq/p9bmj+aJK7pjZ6X+VP/Qit8Nvkcdi3ClZQrJmSWIrA
	tf+fkGtQN6AB8AuXKnkurJq2EDn3HjKtM0zOMD5SlH/+AWc59ykQn2/ehlFtvf9r
	P4wT0KFTBVpSyDwCDdQJ/twnnAkwU3ECL0FIYZjKcWSCIQV8hDqAYAjIZe013JEh
	UDcQ7n8KfY5/1a4MLyyiu4fuwJ74/UTNM6JoMnRVbScOSfW+2Ugb2QSrj83Xjk3X
	S6ib1l3/eqk6i7zuC3Ini2/A+/XdG2gQ7VMKXQFqupHfPGXYRu7yjyMAFeibjQD9
	3Q==
Received: (qmail 3798994 invoked from network); 28 Jul 2024 13:46:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2024 13:46:08 +0200
X-UD-Smtp-Session: l3s3148p1@ul9RSk0e7ocujnsv
Date: Sun, 28 Jul 2024 13:46:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Zhang Shurong <zhang_shurong@foxmail.com>,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] staging: ks7010: Remove unused driver
Message-ID: <ZqYvgNHQSb638mQ3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Zhang Shurong <zhang_shurong@foxmail.com>,
	lvc-project@linuxtesting.org
References: <20240728052552.GA8748@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QoiuYAprfMstUV9a"
Content-Disposition: inline
In-Reply-To: <20240728052552.GA8748@matrix-ESPRIMO-P710>


--QoiuYAprfMstUV9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 07:25:52AM +0200, Philipp Hortmann wrote:
> Wolfram contributed this driver in 2016. He is not using it anymore and
> confirmed it to be removed.
>=20
> It is hard to find hardware around the globe. When it is offered it is
> expensive and performance is low.

=2E.. using interfaces which are long deprecated.

>=20
> Remove unused driver.
>=20
> Link: https://lore.kernel.org/linux-staging/igi27iwrzg3ovgj3sym4gsi45timp=
kt4vkl5ss5dbftdzat6p4@ctxcjocvunpt/
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--QoiuYAprfMstUV9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmamL3wACgkQFA3kzBSg
KbbfhQ//XY7wcD/9Jb3I3oEcjLpo4SG1DZCLTtcmdwv9fOrS7oyXO+H8Z8gLsNOJ
wxfJMt24UmDSNusOm4BstQGYRZSeETD3F6WmNgqunP/okjFEDAhjxpixrT3n7PNF
FNVqyG/7Uc0VBz3T0sp8Z8K2jZ/1LHmlN3wm6eEcEB8MGTaHKnoAW4UPX/9f+mhw
TkVqEzFUSpFf19fi4TEoWsvKo1EmX4gs5yNlXRrxLFUUyddG5ty8/3Y8pZ+lIXR8
qYtW7V2ZqzzbDs3NPW1T6wlvwbQ5NV6TV/AQ8mlB07TO187uNZohJKMyeNUj5tHO
jAg7jJw2RmamGYolGTN/Sy8H0DAjJ9h4tuwOwfXP87DiCHHfSgOtIzb7HbbYHooy
8/VW4lnyraiJEwdb27OC0NjrPSkThqLx5lZlPpUQdqNX2wssTq6y0EIKb7j4IGRQ
DvNnGfjwQSKW8m2x39DoCYGNHbko30nq10Ilqu+/kG4ui9eKGUn24VEEhi3mPUgb
UJYfC+Occq/RcFCVxQ+28ftFop6K4loWss42Q0tREIBP51cgIBhBmfD5Z8QzlyZj
n6cQt758kLnDeS4JHfrffaLZbE3XR8dayS0gGO+P84M72aurcXAZh5kr9brt1G19
L/+OeFpvPvjtWvLiyAkLfFoBG6RUQ9UGpVmBo16We0JXRpeDCAQ=
=Rnmf
-----END PGP SIGNATURE-----

--QoiuYAprfMstUV9a--
