Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F33546C5;
	Tue, 19 May 2026 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204215; cv=none; b=Vrp8zWHcUNW/fSebOhs7BhmetKV7kXcaMNFYP0gJS2gLpGA7A8iDUYSgZwXFVso94uE4wbtsvnPEzs85LFeMjSipa1ztm53RHetFL/qR6IJ0V4Z3QVqtC7Kw15iv58U17JBoyMThrU36BbQ97qAWOAlPVAlGzLL+zmnr2z7fBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204215; c=relaxed/simple;
	bh=J5uRh40+OAR9qQbDxJScq8AjW1kvRbf58f8DL4MiXFE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kdeUs3mtvjYN1ywD6+pT3qIUlA2udYDreNQTBe8tJ80jsij+IBNcOt0azfwYCkF11jgv/6A3VWVoGVWI/H4btej258kzmnI3duejkVzBMxVfntTHmzoaCnmL1KPmgk3vtG28JnhRtElidxT969uE8TqbvIZaHoP+jlG1DqTKxXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QygATNyP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QygATNyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779204212;
	bh=J5uRh40+OAR9qQbDxJScq8AjW1kvRbf58f8DL4MiXFE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QygATNyPPsqpMvJR860gbwUIpKYQ+jTNK7RjD5tnGN1u6C4Hz4dv5/oLJdNzFHWst
	 VAFY77H9pBXFOv4IS0s4K7hd9g69jpPCYTQjs7MYY94BtEPBgUYdiqA+Ez7BwglvIl
	 uEARESUO8XmLZgNSX5XjD7ozyDnq2zEjfIliKAkIDD7kSdonht1VeFsW6bM16oznx1
	 GkMOKwwVettggpspCGAuRfVJvKZRMJhHuqLKyu51XY+do6B/RsDEr8xhHan9heU3of
	 y3C30uhN9vrrTvhyMUzZobRvcvcKKVCKxMN1Pu/vx2FZ+WOXdCrVLrsRduMYtLCrC5
	 Dc7c7RhK3JHKw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FFF117E0234;
	Tue, 19 May 2026 17:23:30 +0200 (CEST)
Message-ID: <3f3249a242678ddec55dfe99f2af7f0ef584c696.camel@collabora.com>
Subject: Re: [PATCH 08/16] media: v4l2-common: Add NV12_32L32 pixel format
 to v4l2 format info
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Arash Golgol <arash.golgol@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 19 May 2026 11:23:29 -0400
In-Reply-To: <20260518102451.417971-9-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
	 <20260518102451.417971-9-paulk@sys-base.io>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Io4WDaSkU1Y5jR/tsxne"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-Io4WDaSkU1Y5jR/tsxne
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=C2=
=A0:
> Represent the NV12_32L32 pixel format in the v4l2 format info table.
> This is a 32x32 tiled version of NV12.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 6194d6eb9c56..fe7141883ec5 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -315,6 +315,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
> =C2=A0		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV12_16L16,	.pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .b=
pp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> =C2=A0		=C2=A0 .block_w =3D { 16, 16, 0, 0 }, .block_h =3D { 16, 16, 0, 0=
 }},
> +		{ .format =3D V4L2_PIX_FMT_NV12_32L32,	.pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> +		=C2=A0 .block_w =3D { 32, 32, 0, 0 }, .block_h =3D { 32, 32, 0, 0 }},

Same.

+		{ .format =3D V4L2_PIX_FMT_NV12_32L32,	.pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
+		  .block_w =3D { 32, 16, 0, 0 }, .block_h =3D { 32, 32, 0, 0 }},


> =C2=A0
> =C2=A0		/* YUV planar formats, non contiguous variant */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },

--=-Io4WDaSkU1Y5jR/tsxne
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagyAcQAKCRDZQZRRKWBy
9ME7AP9hYNnKXQAbYgOlXayEewD55EyS7Vr63YPgeiTKCE3ThAD/Z373RZ23uW9v
z3e/8hqLNyE/+nLnsApzH0j10KaRKwI=
=Tttd
-----END PGP SIGNATURE-----

--=-Io4WDaSkU1Y5jR/tsxne--
