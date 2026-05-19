Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A74A400E0A;
	Tue, 19 May 2026 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203918; cv=none; b=Qs7y+OUm/e78Yd9oU5v2S8hLbtPiYLmiClJYEPCVZohyo+x/8Pdk3Wgd82WTz3WwNtnrz4KTA4nnxMbO2++dBgNTs6RB3Ao9dffYzQaJ20NVr9jVt22XTlXFPTOAq4y3oqzKemXlP0fFztSisM7/sUhGL2mSeQABQMa9rV1P4Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203918; c=relaxed/simple;
	bh=dlTcJ0ukscF7NUiOKGS0cBKBGDiqOOgRWDmZi2AcUkI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AIk/FbHYvxJmN9htsWMu/YMWgbrTqspDAj3EAuIe2FXrWgrGTFccgTX68Zy7f0I7mUgnj++LMtQGQb6LKNyz4YUj10g6GAdmNUsqfQ2OzyEZ/oqwtINgrCzxJNbflXZCk7zYZvfFuVOWx6SQqfoJhuv+2w3uSTWBjJiNfGwkOEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q0dcKdCX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q0dcKdCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779203911;
	bh=dlTcJ0ukscF7NUiOKGS0cBKBGDiqOOgRWDmZi2AcUkI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=q0dcKdCXZ5HVJhDJieIazk7XPmFm2ygrXpB/nqWG8oC4Y/XCtrpSABBPKUHrdDhNE
	 ATk9OBxefXWaD8Ixx3dHvbXN9yB9c5sRnUof2ugdVXQ03/dVc2E1ZgTaFbXiUXkCJv
	 q6QjgMMq1NAkVxnwMeEt+gwN/oLnxcYVGmhMa8SQViQIPdBF5d4ROAGdNwIMtkUP1y
	 09AcMowXJ9uKXJn6NgSykPiaNev9K5+QEAo1W8VzKqILYSFJtb6MCP8tFyVvkbEQn2
	 7h3WQgGPXSsz52JGu4aiGZ62jzSbCLWE2azgWaAv5EKJLKsC397yALIpPqTxElHjCB
	 ntseTUe7mRRSw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA6DF17E0234;
	Tue, 19 May 2026 17:18:29 +0200 (CEST)
Message-ID: <689495bda73de063506d0a63de79b9e099747aa8.camel@collabora.com>
Subject: Re: [PATCH 06/16] media: v4l2-common: Add missing tiled format info
 block sizes
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Arash Golgol <arash.golgol@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 19 May 2026 11:18:28 -0400
In-Reply-To: <20260518102451.417971-7-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
	 <20260518102451.417971-7-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-TG6IA7MczaywLWJwvwWo"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-TG6IA7MczaywLWJwvwWo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=C2=
=A0:
> Some YUV420 tiled format info definitions are missing block sizes.
> Add the missing block sizes (they are all 4x4).
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 77a0daa92c2b..e142d40c71b9 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -307,10 +307,12 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_GREY,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0
> =C2=A0		/* Tiled YUV formats */
> -		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},

.block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},

> =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bp=
p_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> =C2=A0		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
> -		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},

.block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},

This one is speecial, this format does not exists. I believe Jernej made th=
at
one based on assumptions, the actual HW should produce NV15 4L4, but I don'=
t own
that hardware, and so I never managed remove that last "user" of it, which =
is I
believe H6 VP9 decoder.

Nicolas

> =C2=A0
> =C2=A0		/* YUV planar formats, non contiguous variant */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },

--=-TG6IA7MczaywLWJwvwWo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagx/RAAKCRDZQZRRKWBy
9FG0AQCmk+1TScHghmIvvWe/dPiMpOsOio1Y+H/dE2nbMFgLAwD/eHkfQJdQ+yQJ
J+iyq2+WOkh1bcV9Wd6fSThZhpuCtAc=
=B75G
-----END PGP SIGNATURE-----

--=-TG6IA7MczaywLWJwvwWo--
