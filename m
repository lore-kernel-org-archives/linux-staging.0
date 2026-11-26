Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732717;
	b=lusaafX8/yl57IEu3w2yVBzZyLEpaARcbKN5nkOYocLpuRaTKnFR/NM3N4+EC/QdY766
	 7BQ3yVkOR7YLpdGfur372VYz6KLVF6q9VpoVA/iRGBGy1NBQxLvm2EuZUlx+CpDAGxjw8
	 537lP1tkN60jHMSthqbOFdftysAInHcSsLfCsJfQXJAUgBxcsLV8e2pGGG2NZM3IHNzAP
	 ypWYyn77fL4mwO+4Vj3aZ9H18D0fVik7HU724NYt9G9tfFKq2iAJOFN4lZ0tyBol5F9gT
	 uXVfucsDid+eltLAv6U2gIYJk1IEQByxgxan68ng2q5CqDD/N+Etvjb7Sj2/xjoCTDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732717;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=XZN7nAio4vCQPzlVSa+Z+Tj1zggSHcLGwUgRToFRIDU=;
	b=W1hqdz9uhkbwyTyH1xSc1H7WSFWowa9rK3wOqCWaTy1TCWKrNNyHHVvXDgLCTgympsw8
	 673mJv4AFIysodsOlKLSVJbJXP27mWWOCQR6Fu7O/arPO7OKgvNv0OpUPq8PFLCH3auV/
	 NXUMEvnImy7CzDbCqTHSy3Bas0mCZ8WlIHyBZ0CJk0J2FmJ7Xqma/E+cUbT+/ZnHTnGDj
	 9Z2K6AwXTkd383oyTgxymWiACO3OF8HGft6N9ZlCZD7PPEPGAGGwfwAdCI7vbZ+mlMgxo
	 vmiYZK46bPRU55/d83pmAA65JLAqTvL8ZDuHXOxO6fonegaPVh8m67UXApbGJrP54GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YigCRwEN;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC68606A31E;
	Thu, 26 Nov 2026 22:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC68606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YigCRwEN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795732715;
	bh=6cZHffHdnDA5/Zy8f3wwef1VJ/aCiVfcapAWXtcbXqk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YigCRwEN4Yyg8VPXoB1dVDMQZsIHGQKIvezuvrv8zy84+JWcol9HOZTnMFI2IjLGA
	 vhluqkLIojBwVBnQQQZBvbQwu8ZdhMowHlA0Z4JWluLHHS8OjeBXuEr7xYRU5wXEP1
	 tEDOWWEtI5T5ocDmaN3Z2MN1IyEB3NOrfMY2nO9JlKtFJgsGPgAYRo1DZayUG+Yx+m
	 GFR8/7jhOvMa53V4u+M6jMWXVka8mG+3t5Hf68fpLffSB9Va13XGWWKcFeTKQH9Hxt
	 7b4P3Ej0BaxhSB8qFmvAl6QWUhC5kQdD9AU0a+PYRgewSBKOBul+vafO/eyZeRrCMd
	 N62uWi5VWLHkA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 344B617E09ED;
	Thu, 26 Nov 2026 23:38:33 +0100 (CET)
Message-ID: <baeaf9002d73b6b4d12e964eb452b27dee84ea2f.camel@collabora.com>
Subject: Re: [PATCH v2 04/11] staging: media: cedrus: mpeg2: use the field
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
Date: Thu, 26 Nov 2026 17:38:32 -0500
In-Reply-To: <20261109175016.42061-5-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
	 <20261109175016.42061-5-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-xY6Sm5TM6NpVc0XpyBEj"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

--=-xY6Sm5TM6NpVc0XpyBEj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 09 novembre 2026 =C3=A0 18:50 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> A field picture covers only half of the macroblock rows of a frame, but
> the driver programs the coded and the boundary size of the whole frame
> for it, as for a frame picture.
>=20
> Program the height of a field for field pictures, like the vendor
> library does. Like the vendor library, halve the boundary height after
> aligning it to whole macroblocks, so that the boundary of a 1080 line
> picture covers all 544 decoded lines of a field.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index 10e98f08aafc..8252a47994aa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, s=
truct cedrus_run *run)
>  =09struct vb2_queue *vq;
>  =09const u8 *matrix;
>  =09unsigned int i;
> +=09bool field;
>  =09u32 reg;
> =20
>  =09seq =3D run->mpeg2.sequence;
> @@ -108,13 +109,23 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ct=
x, struct cedrus_run *run)
> =20
>  =09/* Set frame dimensions. */
> =20
> +=09/*
> +=09 * Field pictures cover half of the frame's macroblock rows; the
> +=09 * vendor library halves both the coded and the boundary height, the
> +=09 * latter aligned to whole macroblocks.
> +=09 */
> +=09field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> +
>  =09reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> -=09reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> +=09reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> +=09=09=09ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> =20
>  =09cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> =20
>  =09reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> -=09reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> +=09reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ?
> +=09=09=09ALIGN(ctx->src_fmt.height, 16) / 2 :
> +=09=09=09ctx->src_fmt.height);
> =20
>  =09cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> =20

--=-xY6Sm5TM6NpVc0XpyBEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawi06AAKCRDZQZRRKWBy
9IfgAQCbnSz+AgSdIYiejBDLMT37BerQoNp5AUGOwdBHieP41gEAo9nFUZA/TfDs
oZvYPD/VR4QN0qdBzeIAahg6rCQ9YQ0=
=X0n1
-----END PGP SIGNATURE-----

--=-xY6Sm5TM6NpVc0XpyBEj--
