Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10673BB9F7;
	Tue, 19 May 2026 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779222855; cv=none; b=ft5uD8D+1nUooIa5HnJcAbQCjEZzSTAVglm37/nIP4I27yaZuMNLJZIFow82wj9C/7RamoabYA/qfLhuv18h/LyaH7NNjDUjQlmETqyCgOwmL9bv9A58OtSdP5iHyiZlGdlGmNOOcgwitr90s/03ama1OdroP2u4Bijo5HKBHqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779222855; c=relaxed/simple;
	bh=cCfpJ0FR0Xvror28LHF5k9WcJj7AtanNNyBrvIuu7go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb2wARjcT/PChqrNsXPP3jTR+4RgrmvACVeDEdN0fyIn9Iz4YcoOij+cZL0rKqLEnC9/PJmKPI8oZnvtfMus5bi/vtYH7rQeb5F+q7Jb7MuWP7bkvTw3nkptT5uodip/s83YA4LOo71kOD4rrCqTmv0ZNmLrISfXlz6PmegKlrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 55C2C1F8004A;
	Tue, 19 May 2026 20:34:05 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 12170B40847; Tue, 19 May 2026 20:34:03 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 974A7B40839;
	Tue, 19 May 2026 20:34:01 +0000 (UTC)
Date: Tue, 19 May 2026 22:33:59 +0200
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
Subject: Re: [PATCH 05/16] media: v4l2-common: Fix NV15_4L4 format info block
 height
Message-ID: <agzJNy_IR1HaPkm6@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-6-paulk@sys-base.io>
 <d2c20b4cac22f04bf864534edf27993236ac9e09.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v1H1B5yuXqBZF6e6"
Content-Disposition: inline
In-Reply-To: <d2c20b4cac22f04bf864534edf27993236ac9e09.camel@collabora.com>


--v1H1B5yuXqBZF6e6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for the review!

Le Tue 19 May 26, 11:16, Nicolas Dufresne a =C3=A9crit :
> Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > The NV15_4L4 format is specified as a 4x4 format, not 4x1.
> > In addition the block size should not take subsampling in account,
> > so specify it as 4x4 for both luma and chroma.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> > =C2=A0drivers/media/v4l2-core/v4l2-common.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index 554c591e1113..77a0daa92c2b 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -309,7 +309,7 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
> > =C2=A0		/* Tiled YUV formats */
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .b=
pp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .=
bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > -		=C2=A0 .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 1, 1, 0, 0 }},
> > +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> Only the block_h is broken. The block_w is in "pixels" which for the UV p=
lane is
> component pairs. So both set of tiles have 5bytes stride. But since the s=
econd
> set, the UV tiles, are interleaved, they only have 2 pairs of UV per row.=
 So to
> me the correct fix is:
>=20
> +		  .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> If its not the case for the camera pipeline, then a new format is needed,=
 since
> this format should perfectly match NV15 + VIVANTE_TILED in the DRM world.

Ah yes I think you're right, I lost sight that these are semi-planar
formats with two components per chroma memory plane.

Good catch, thanks!

All the best,

Paul

> regards,
> Nicolas
>=20
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .b=
pp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > =C2=A0
> > =C2=A0		/* YUV planar formats, non contiguous variant */



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--v1H1B5yuXqBZF6e6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoMyTcACgkQhP3B6o/u
lQw+XBAAh6LR+jAVOs8ZXJJqb+lYenbNR9A2g3xCPOjo3adHpfiHAQcXqj63ZOnc
a8gIPoK93exsnpVb42T/TXTmle7jWfimUZRXS00xSUH43BzZjb9mWak4N6zF7ySn
Qy3HKmfhX406S3O/a8VzIrmLGhMO/zEpfe6U7ci24KbKU36A2x9GmAdthYZemEXh
NNZG2sIuchlDvIPvw613wS1UzmYuANgeNZzWbZXDhF8DL5fqXvu2GXNpdou6/nmh
/ctnj06gU1OMQib2F/QIezK9m3n+NeVsNa8FfN5IOIY/iLLg6qDsN+ciiB2NIYrc
TNy4329mteseTg57EGcEx4vK5M7KYWft2FWRb5Iw/Y002ovmfQtbs0EcvqRwJEa+
t6jvo1eLHhHwmOowzWeqGVJGOVE4RLrZd1YuTxx4AUgfoNRqMKBvrJfyy13GiK4Z
+JxQYXQKlNSVY4hPr2DzOD8gO0pv90JOGbfV/vXaUmBrr4U2Os0VWaxLHTemV25Y
Sk3dBCNO7uthp+3hX2UAuKlVwJyXQeAUjzbMjpk2fAp8EriCjatDjEDyXymM5MXk
MAI2VZZcTm3Al+RWWR7AL+JrQd/MkKAMXqWlFzN5RaqvBj+3FecKE25779Ttt0BQ
yLE3MNkcVrYj2N0GXcRz8ItAVbwNDvelppOKro/0/DTpPQkuugw=
=z6to
-----END PGP SIGNATURE-----

--v1H1B5yuXqBZF6e6--
