Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBEA433A4
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311005; cv=none; b=TufmtlvtLSfG78Ko71iqFiysIQE1ped1eod7tMV632WDfQzKnQywvcWxOyJOdwdqORwMqNLMltlXekSG8v/nuR73CfDd9DKc3vo+u+BPeUPoqN7ZqvVUXMKSuHA4/R8MDvngaj2a0ph59YBcGnf6/vobhQwytEiqwPl3OTix/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311005; c=relaxed/simple;
	bh=BkVPf9VvjyU/6g05e8LRsSJlmFpCQMsrY6Q+ll0m+4A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8dmauIK5XHqMOFzXLT4zSf8L2sJgu8fOCytee1aDBx/dQCqPxoqEhQF8xV5nnpz55t6g6KlqxrUsnY6fqTB5aIlx+4++R9RUT1FD7ChtvFu+lalSQS8QPNlLZU/QjnC1XYSJxw/4Htv83/QTwjCB8HxSAWXGEOpbOOLiNW3Ac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=pu3ILKSY; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="pu3ILKSY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a8244e8860so8919971cf.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1751311003; x=1751915803; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zR6ngs40KDKrfuQ8uGrYMi9KPu0z0Fij7dHU34pFebA=;
        b=pu3ILKSYcIKcOFtApykPsWDkkqZBLlMFMh2h8qp9L3kr6nOynImJeA2yONEnOZJPXe
         S2ZofHe+YIBtRHzpt5UvhfsTXdttQXiejJeD2W1Czpk1KV0ROPb9bIUkXF6bhwMlcvvW
         XYZkG50/mtieyxs2Xr5g+el6eD4GCayZyMD+Lbt66X/d2hrCgSot8rjkDPFL4HKg3xeT
         006AMBCbFOspMfVjdwX3MPOZhZDgdczvryLVc1QblioAv4RW63wSUQTFIzo6b6LYbK3z
         l2JpR4adzJwnmB3dFReoy5M7Jm6u9HWigJV442eTStegGF5dXZaMpu4Re+8D6W2rKOyD
         cXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311003; x=1751915803;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR6ngs40KDKrfuQ8uGrYMi9KPu0z0Fij7dHU34pFebA=;
        b=YwpV3hOKOCCOX6qqu95GCGiwhxXvZCtKcmC+io0LDrTpCI3TWnzXRXdb3y397okeer
         VZBKlCAN/a2jbvg80Sv+bIVdcsBr8AOwyox/mB/XRkuDAcFgVuIepE2hiaiXC2mAkVRS
         4NWGJX8ie+vKQydlIOdNqgeloFG2ASne06kbCa1QaAMoaiHaze3etryGHZ75vKF8Vz0d
         b37FfPi2RjYsVUk7LTAxxi+Mx601Ptfzodz2xARtDiqsbxStm0re6qIkjSrhsWfcYvk4
         EWfLdynN/R1cv0wvKmEahRuKU2hKBo8BOBjf1jptjoZA07LkpV93VLKrpWOAIeG8wG06
         PUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtqY/47UQ7et+K2KAZk49CFZYPhvRpGcHHYHz1DwyF2443HglvEc0WCRAbWBythlFCYnccDbexOZV+qfnj@lists.linux.dev
X-Gm-Message-State: AOJu0YzCT1bHtHlKAUR5Sf2UJP7W5w95nFYyMo146pkn94qb94RdLEJP
	fH5wJC61B8LStssaIAdvNv0W/MbvEL2nCi0RswukSG5kfv1Jf8adsE+NrnHHhkQY9z8=
X-Gm-Gg: ASbGncuYDa7tZGY8VbiBOxLDOMxBPfOdyz/kevpyXw8sJ2UdQtpq9/ahwgpH7tG9z1b
	9QRX+3jdPbBmaI2FyjJLBRjV0s217QczHmvI1T2cPUKukq98C1ZKRKGofwV8zVgM2Iu4D9intKm
	n7+S4IiHgwlUE4NlZLEfWSUB296+/+BSZnDm9HfWEq835ArzX4sUZ83toveL1i1WehbXp4LO4pA
	5PtyBKXIR7B5nxz5YUMg/uc0W4zvoNOHxH5U70Bql/Tx6tuAuqKnxfA4DnEkn3qu9wsApSzgMyv
	Kh305CdI2td60Cc22HchELdc1wtirRqoqamJecjwMzoRsQX7KF+9yDclStynzm2huok=
X-Google-Smtp-Source: AGHT+IESAXpZrbCN9sq0IGqWEgBIgw7TERMevL4glDJMzoeekiYHSxfwJOAsDJinhURnk5aOEcbJIw==
X-Received: by 2002:a05:622a:2611:b0:4a7:14c3:7405 with SMTP id d75a77b69052e-4a7fcbb0be4mr267384891cf.27.1751311002729;
        Mon, 30 Jun 2025 12:16:42 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::c41? ([2606:6d00:17:b699::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d81asm63480201cf.65.2025.06.30.12.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:16:41 -0700 (PDT)
Message-ID: <82be6ca4c33d394fc52fbe2a90362fa6955d0a47.camel@ndufresne.ca>
Subject: Re: [PATCH] media: cedrus: Add support for additional output formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hans Verkuil <hans@jjverkuil.nl>,  Jernej Skrabec
 <jernej.skrabec@siol.net>
Date: Mon, 30 Jun 2025 15:16:40 -0400
In-Reply-To: <20250523154359.2454180-1-paulk@sys-base.io>
References: <20250523154359.2454180-1-paulk@sys-base.io>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-PkVzrifhkU38IZasPoP3"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-PkVzrifhkU38IZasPoP3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hi Paul, Jernej,

Le vendredi 23 mai 2025 =C3=A0 17:43 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> If VPU supports untiled output, it actually supports several different
> YUV 4:2:0 layouts, namely NV12, NV21, YUV420 and YVU420.
>=20
> Add support for all of them.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>=20
> Looks like this patch never made it, sorry about that.
> I've rebased it atop media/next and added my Reviewed-by tag.
> ---
> =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 18 +++++++++++++++=
++-
> =C2=A0.../staging/media/sunxi/cedrus/cedrus_video.c=C2=A0 | 18 ++++++++++=
++++++++
> =C2=A02 files changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index 32af0e96e762..168d89c5a16d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -86,9 +86,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
> =C2=A0
> =C2=A0	switch (fmt->pixelformat) {
> =C2=A0	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_YUV420:
> +	case V4L2_PIX_FMT_YVU420:
> =C2=A0		chroma_size =3D ALIGN(width, 16) * ALIGN(height, 16) / 2;
> =C2=A0
> -		reg =3D VE_PRIMARY_OUT_FMT_NV12;
> +		switch (fmt->pixelformat) {
> +		case V4L2_PIX_FMT_NV12:
> +			reg =3D VE_PRIMARY_OUT_FMT_NV12;
> +			break;
> +		case V4L2_PIX_FMT_NV21:
> +			reg =3D VE_PRIMARY_OUT_FMT_NV21;
> +			break;
> +		case V4L2_PIX_FMT_YUV420:
> +			reg =3D VE_PRIMARY_OUT_FMT_YU12;
> +			break;
> +		case V4L2_PIX_FMT_YVU420:

Just so its recorded, Hans added a default: case here while applying.

regards,
Nicolas

> +			reg =3D VE_PRIMARY_OUT_FMT_YV12;
> +			break;
> +		}
> =C2=A0		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
> =C2=A0
> =C2=A0		reg =3D chroma_size / 2;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 77f78266f406..9fae2c7493d0 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -64,6 +64,21 @@ static struct cedrus_format cedrus_formats[] =3D {
> =C2=A0		.pixelformat	=3D V4L2_PIX_FMT_NV12_32L32,
> =C2=A0		.directions	=3D CEDRUS_DECODE_DST,
> =C2=A0	},
> +	{
> +		.pixelformat	=3D V4L2_PIX_FMT_NV21,
> +		.directions	=3D CEDRUS_DECODE_DST,
> +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> +	},
> +	{
> +		.pixelformat	=3D V4L2_PIX_FMT_YUV420,
> +		.directions	=3D CEDRUS_DECODE_DST,
> +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> +	},
> +	{
> +		.pixelformat	=3D V4L2_PIX_FMT_YVU420,
> +		.directions	=3D CEDRUS_DECODE_DST,
> +		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0#define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
> @@ -140,6 +155,9 @@ void cedrus_prepare_format(struct v4l2_pix_format
> *pix_fmt)
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_YUV420:
> +	case V4L2_PIX_FMT_YVU420:
> =C2=A0		/* 16-aligned stride. */
> =C2=A0		bytesperline =3D ALIGN(width, 16);
> =C2=A0

--=-PkVzrifhkU38IZasPoP3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaGLimAAKCRDZQZRRKWBy
9PJgAP9YO0WJH/NNq+CaJXSgK9tAYcGlb9/A+rt2u9ac3/xO2QD/SGzZr5aodnIh
3ut2Ast1YM6fTcN+X5020Z2kjtkjGgc=
=mibq
-----END PGP SIGNATURE-----

--=-PkVzrifhkU38IZasPoP3--
