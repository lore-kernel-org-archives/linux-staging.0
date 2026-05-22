Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA3C3D669B;
	Fri, 22 May 2026 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448543; cv=none; b=CESuTt/gX9XenSCqWnDSc+PVvydj3uzmqBa4IfrjkE4n67ryc+P+TkuINVdJgGZ5wYhFn+q4DfpMjMFJAg6Jvh8m3CvUTfr8X+TTPajMgSMjj2GG4M8JbGzRfl/MGHvBQGKcqAigJR/Azp7Oq2DfQH/4hZHy6hibVlZUwvxbEyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448543; c=relaxed/simple;
	bh=2ZzTHm3H9lJutC9JWzV0RRTouRHJeFEdYJjeqtxWCzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lS9iDxjS0Os3pkxC1Ju+TvowoFOdH3Yw5fGBJkFhMaSNFKw7rpRimIDguhTDKBjoUFQ2dFtwJN2sogRHHJiel4i4VbSeCXFJfuWftmlK4ktlMLDKzdaXir7Pmg8+mfA1QPOPBQQOwrIMScCui9xMNNIZ7b/VgYVo1K3zsW0xIL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 687923700297;
	Fri, 22 May 2026 11:15:38 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 08C8FB408D0; Fri, 22 May 2026 11:15:36 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id BB3DEB408CA;
	Fri, 22 May 2026 11:15:35 +0000 (UTC)
Date: Fri, 22 May 2026 13:15:33 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: arash golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
Message-ID: <ahA61YIGM4Bqipu7@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-15-paulk@sys-base.io>
 <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="my01EG0z/4JNTjDd"
Content-Disposition: inline
In-Reply-To: <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com>


--my01EG0z/4JNTjDd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

Le Thu 21 May 26, 12:53, arash golgol a =C3=A9crit :
> I used LicheePi Zero Dock (V3s) with the following pipeline as test setup.
>=20
> ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
> sun6i-isp-capture
>=20
> I verified TRY and ACTIVE state handling, including changing TRY
> formats without affecting ACTIVE state. Format propagation from the
> sink (csi) pad to the source pad was also tested.
>=20
> I also tested streaming with the sensor test pattern enabled and
> verified the captured output was correct.
>=20
> Tested-by: Arash Golgol <arash.golgol@gmail.com>

Thanks a lot for testing this! Did you test just this patch or the other
ones (especially sun6i-csi format enumeration) as well?

Also if you have an opinion on the code itself feel free to drop a
Reviewed-by tag, a lot of this work is very similar to what you did for
sun6i-csi and other drivers.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--my01EG0z/4JNTjDd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoQOtUACgkQhP3B6o/u
lQyUew//eizFgJVGOhQ0FRIaPgONOOjys2DARGCXB3iuhfDoWvdG5fb1Ednuqi8u
QQ/KWW+vMgaB/aogtcSaaP2F+g+QU9iZ4r+1vvQl7Dmz9c1gr4cN4Wtbre1IFJ73
x9Weab1T9QDO+rRvhQ9i6v3xV4dN0M5UyhGDUfrby4ncO8sWrGyQymF9BWWAE4HT
K1dRGaAbaSTpXIL/bfI6FIK2hojGIBYUUkxnuG8u7nNDu2MmWDS8/qHU4wxmzfYe
VaXY542BzXyD+k4hJ8npaezHY8WfrP7DfaQAINXxywAtmbfY/ZrLJQWlIbem/HdY
J0clVD2GEfqG3aIP8mbzc417ND3PzubuYvUN8fY3tXXkCf5jYegANsOgPoFCzfmF
ZHzedumGdrmbY8cYCu3oSWUq2Ub+5Mp1zO43u3J5Dlx8vtmbsZP46D+dgoSgCr92
Cf5fpJh1vr7YsX9TP6cBcY4+o3mxEE3f9A5/NqpLHUMXOj1Lkq16r9weAencDGlx
k/83DgF3VEOQmooXR1THCnRKmbxY62Vn+IvHTIEtJIZFn4DddwHxq0cjQkfZwkIa
3kMXwVchPZHmIpBCQM0+jr836XspjxDEgdsQ+iQwpZiMZhbSOhTxbTWVpFpcmzJ5
fp/nwpcscXW9KdZty3zpYNE8d34xQCF3RGFSPMDZetQFDK76ZH0=
=512O
-----END PGP SIGNATURE-----

--my01EG0z/4JNTjDd--
