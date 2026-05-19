Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051DB35CB7B;
	Tue, 19 May 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779223053; cv=none; b=sb8arXzlakOa2w1Fny/XvcdtkxzJ3cy/uAp9oyF+RKURRa2UR4Og/1chTAPoP3s1lnCc6Lfe2a+Se0Ewu9sIrHlGRTiqjB/ON9nCFISWP9bHG6FmqmQTTs4H4EwPW9FCJBiTbQfhBblrVw0bgmC/9V6KE1FGNW/Dty+g0d8/9/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779223053; c=relaxed/simple;
	bh=U3uMzGCgQitddBZmz3MDenkZIrSIJ6ND7ntkRyu6z+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0CdSZV3Av5FCH7YD8M/eOGpwSvsKYjIaUq9GJtUL2RmP4YT+6atsP48ENFAyx5WpsEbL0wwfKeO1DAUhkI7q2fB1iSvRHmnSCimVNdoWicYqlPfB25C3ZOoRHk0iHjCVru9HEvgLdNXxegjogsAwlIm2GDrTrpdJj7ZGY+DqTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D518F1F8004F;
	Tue, 19 May 2026 20:37:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 4D9C4B40847; Tue, 19 May 2026 20:37:26 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 11335B40839;
	Tue, 19 May 2026 20:37:25 +0000 (UTC)
Date: Tue, 19 May 2026 22:37:23 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 06/16] media: v4l2-common: Add missing tiled format info
 block sizes
Message-ID: <agzKA11feGZExvEP@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-7-paulk@sys-base.io>
 <689495bda73de063506d0a63de79b9e099747aa8.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDQIAplM8RyG3VNl"
Content-Disposition: inline
In-Reply-To: <689495bda73de063506d0a63de79b9e099747aa8.camel@collabora.com>


--qDQIAplM8RyG3VNl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le Tue 19 May 26, 11:18, Nicolas Dufresne a =C3=A9crit :
> Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > Some YUV420 tiled format info definitions are missing block sizes.
> > Add the missing block sizes (they are all 4x4).
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> > =C2=A0drivers/media/v4l2-core/v4l2-common.c | 6 ++++--
> > =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index 77a0daa92c2b..e142d40c71b9 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -307,10 +307,12 @@ const struct v4l2_format_info *v4l2_format_info(u=
32 format)
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_GREY,=C2=A0=C2=A0=C2=A0 .pixel_enc =
=3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1=
, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> > =C2=A0
> > =C2=A0		/* Tiled YUV formats */
> > -		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > +		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .=
bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > =C2=A0		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }=
},
> > -		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > +		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> This one is speecial, this format does not exists. I believe Jernej made =
that
> one based on assumptions, the actual HW should produce NV15 4L4, but I do=
n't own
> that hardware, and so I never managed remove that last "user" of it, whic=
h is I
> believe H6 VP9 decoder.

I don't think I've ever tried it but do I have some H6 hardware around,
so maybe I could test it eventually and figure out if it really uses
this format or not.

I guess it doesn't hurt to keep the definition either way.

All the best,

Paul

>=20
> Nicolas
>=20
> > =C2=A0
> > =C2=A0		/* YUV planar formats, non contiguous variant */
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--qDQIAplM8RyG3VNl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoMygMACgkQhP3B6o/u
lQyhfQ/+OihZP1pX+KtLZHb5PzSuHG0dNVPtJqPXxuifAq/+8LDU7nVA4PnCrecI
XgxCEuVL34zttetOPT6eEv3bS5ggk83M/Cc5rB4eQqvmJvEF9CtPH42w0oTphKY3
+0tdM1crZVVxMOZAWf0h0/vPcxU0u8k/9fiNhXGxZoHebaJKRYDsM/GRmdx00sRG
NZhyZda+siMNnD8U8GHh5BYC8jJaGXdNRfVbybTSy4gy6lfxHGjCNXyPUip2CuVl
aorL2mN5Tn6u2k2CeVsiNtFY88piEoKPNCj3qPrBwpfJus1shJT6KzG7hV0VkmWJ
q4X6AifqLw2xKTrXKr2bn8ZuoPTU+1NXRW2AAZSjJZ3UEULyc2FMPeyl63PRx5mu
5qFLO6oODog4myIXxRgX5I+348Woyk2fJlkiuQtwgropwM7IQsANfngK6NlJtK5+
SGIu6RpmqaRsok/80menkJHVbe9eVWY5s9dFE7hOtZDIuuJzit5Iaa1u6659MKcN
+2Q5z/EsdeMfSWtN58hhpCP+i/pv7K/tmswIjFl8/tFAMLld6dtQbUYDaDtnF26f
K0CBJjm6GCtl9JgcCUAgXgHsKbxe0tAYL89dciy4Gurl0tRbUfEDr5NgUHQ5UtON
EY4XD09tRKRV2RUt8y2S64q6kzTRZ999rAOoOveEj79GOO7AYNs=
=PJVw
-----END PGP SIGNATURE-----

--qDQIAplM8RyG3VNl--
