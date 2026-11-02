Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645818;
	b=Ad20SMfty1q50P61DlmW+oYEDYqTcWXWMKelE3BjX2nDSLDj8cOk/t1he2MbwAxHzQ5S
	 FvPJhn7r/SgTK1inz3K/GnI9zXse3D02ZTBBAPRvBNqkiXH5BnV/hE3x4RaQFm1k5hDjo
	 GVMBtbVnUvRCGKQpeTNZLC1NcTbk32CSm/girCSJe8VdJT5Q48fTgRNGODurHUtzVSW1o
	 gCiwceXUCWLc142iPbORdfk1lMOaFHODdkmWFkx8cZFtV+ql2zJq5KmT2x8ml+k5odEYg
	 WlmbSvH47i47ENICMrDUXxkKDuAu9HhyGQd2Mq8PaGSZSU5eWRrlk6aLY5Rc8Mk+Uqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645818;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=Em7LgszDC3yV2ax9pGbeyhWHik0oIvE0LFFvVjdiovc=;
	b=cFo+HnFt7DxUuK08HdQXcpfHqcA0G+8ecejsuhccA0WNcQmltZHZekh0tV7a6ByJA+0k
	 fb3ckRaQ0Y8zy6U456T1SNeCiHQmk4UJIlddwawwP7CkK4AlBVzm7EKj4a2Fqgml/qr//
	 6mcIgiysLt6P7OEA/Rfuwj+WTAw8sdVbGbnyYY4ceU7PkEQjs3g/xt3P3BYBH2kk7ByT8
	 rUKPuU4gZGpxK7+mQQeBZeeDZjC2QVWQuCZ1ci02B+7eZyP0IEj79i9DYI97D8W/+0FiS
	 yxCkxjCFbk2dkNf0E65efsSolR2j0PheqsfQJJ/UCmEU1mu+wnzDdj1ElK4ihwgWk0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BQyDa+Qt;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34A5606A327;
	Mon,  2 Nov 2026 18:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34A5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BQyDa+Qt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793645815;
	bh=fOLpOB2LsNGYFnbSGDntDvT7olJ/DoIyk1p1zTIGGg4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BQyDa+QtEF/80OwP/TH+CIWiZ+c9fDqQ4cNvyl03AhCjS4ptcy81Q0y/fQiCY8QiB
	 plyP4LTlwcILzEXf+9jijXl1qYlprb6cPDDX6WY/mDaASVNkVxdTlofccdqA1aMC91
	 KAjiiJ6CRyfPDKRssS/i/c4wf341SFNsBryfEti9CUuXwIsqBzIgEyKzg29/DGVl3F
	 LcLpxYWK1Nl2FS+nhQPIIK+L8UZxumV0kZvnudDqKTXVAYl7D+1bCZ/LIfzJlFEPxM
	 YLBZtoQNBIfbDbRGCrd1jgCpRq47kSZrDIKJbSveNLz6xzDLwOslbxTxhsSTPnucex
	 ySWR8mk8GhWTg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F78E17E07F6;
	Mon, 02 Nov 2026 19:56:53 +0100 (CET)
Message-ID: <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
Subject: Re: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field
 height for field pictures
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 13:56:52 -0500
In-Reply-To: <20261102170303.1973892-5-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-5-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-P2HLuzwLLDfm1tPGi+tN"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


--=-P2HLuzwLLDfm1tPGi+tN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> A field picture covers only half of the macroblock rows of a frame, but
> the driver programs the coded and the boundary size of the whole frame
> for it, as for a frame picture.
>=20
> Program the height of a field for field pictures, like the vendor
> library does.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index 10e98f08aafc..ca66a3c6b830 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, s=
truct cedrus_run *run)
>  	struct vb2_queue *vq;
>  	const u8 *matrix;
>  	unsigned int i;
> +	bool field;
>  	u32 reg;
> =20
>  	seq =3D run->mpeg2.sequence;
> @@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ct=
x, struct cedrus_run *run)
> =20
>  	/* Set frame dimensions. */
> =20
> +	/*
> +	 * Field pictures cover half of the frame's macroblock rows; the
> +	 * vendor library halves both the coded and the boundary height.
> +	 */
> +	field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> +
>  	reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> -	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> +	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> +			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> =20
>  	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> =20
>  	reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> -	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> +	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height / =
2 :
> +						   ctx->src_fmt.height);

I'm not entirely sure, but I see:

	fsize->stepwise.step_height =3D 1;

But I don't think interlaced video can have odd height in the first place. =
But
it also have an implication here as you are not rounding up to a multiple o=
f 2.
Not sure what is the proper fix, but I have this impression something is
missing.

Nicolas

> =20
>  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> =20

--=-P2HLuzwLLDfm1tPGi+tN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujc9AAKCRDZQZRRKWBy
9FCtAP9jsMoceNEcZBP9smOFURh22hfFhq9F7bGhoIiXygecnwD/TZd0tE9tcnxF
yNRD1b/TdxpJUTqjYdMx/wp68lb2mAs=
=X4Qg
-----END PGP SIGNATURE-----

--=-P2HLuzwLLDfm1tPGi+tN--
