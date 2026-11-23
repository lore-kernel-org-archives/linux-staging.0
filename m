Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472788;
	b=Y5pWj7dN7MVNDw/Il4KRBxSF0PEnqC4Ae0gVetZ5zPdwMVetrYu1TnYoJwoqnyOxeB+5
	 nlHUQkc2rQP9UoAiAOY4kx87REfSpFCui8grUPHRfl66jiLnpLlqM+4il26VkL5PIve9F
	 PlgMC+BP/RcusIJwih3h6F3DdId3kCC7LtwTA4yidjDfGACAZl9ByfpSvfdW6x8kG2n8x
	 jXbvynSN7EdAkmE2XqnBSQX++YTN8/pus+MnaU2y0IhW0/hOHRnEneyGNVSWzzG9eKrTd
	 YIFvfmlxZH0P2vWgZD4rrxmgZH23v5veY73ZeGCLAOp7IF7MAz8QU6CTwNd0uR2UvFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472788;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=zL9FW6qmJVERb9uBjlstt4dUn5W525DT8FCMzg4JX1I=;
	b=3rHPS5m2fA/MYoSapqi7+6gFvLOiDPRhvy4DPyzZbBYU93V+tdGLgmYxp10xhvIlBzRJ
	 wJ7UL5eLzUAxJgNzbCz+wX3vN4QIPLzTgF75XxGk2g3gBJt0vXB04EQrMbsN1we7mmaaX
	 5eDNV1kiWStKLpWX1bSdKp/TlFIzWiWtGUbSU4qMDceX4eUOhmzUH9cji0pE0cDMIfyTc
	 JfWiK37gQK3EeIawVL+QW4+zIDOnPvdtVhAROk4lykcW884e7OfsVNAw1egylXeCQwacU
	 E04cox8LBUrCBUY80ceBkPkK1rqyKmyDf5tVghsbqwLb0fLyaeZO+fN/UfnZcXdD0/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ntYxdNfw;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC8606A322;
	Mon, 23 Nov 2026 22:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CC8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ntYxdNfw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795472786;
	bh=jafCJiO5kEDoT7LeCzSexDLui/CmGZgBcYWpbAal89Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ntYxdNfwbYMnR4G45krGiMK/xALKPCbBjGzrhhLZGJQYQdwmRIX5bijv4Rj14dK7C
	 YoIU6u0/EddOz3/sPdJScestRmDdf7TqRSAspK9AodsFySnvLSrxw0AQjQ67/sHDhZ
	 +oC3+nJZlvNNbwEx7VZ3xLY7EUBEv6uvDz7H74nM2NP4NdK1o4bXh6Gz25gIHf0PXd
	 onMmipYGNV55v3SSLWC2IgIQoPJElx9DzDTmGBpAqe8DRMojWjUdrrXwFUhCqRjPcO
	 skrk3XF/3Mcke4Qw3KUSoOqJDSBxCqUPpw2lWsqCic43iwh2yRWnmIK7X6lavKcMmb
	 VAhExsYZuVxOw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 424EA17E05F2;
	Mon, 23 Nov 2026 23:26:24 +0100 (CET)
Message-ID: <adfcc7bb137c294d01395dff64bfb915d2f34a5e.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: verisilicon: reject MPEG-1 controls
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Hans Verkuil <hverkuil@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski	 <paulk@sys-base.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland	 <samuel@sholland.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Christian Stefan
 =?ISO-8859-1?Q?K=F6v=E9r-Draxl?=	 <ckoever@outlook.de>
Date: Mon, 23 Nov 2026 17:26:23 -0500
In-Reply-To: <20261121-b4-cedrus-mpeg1-v2-2-95e4decf03fa@gmail.com>
References: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
	 <20261121-b4-cedrus-mpeg1-v2-2-95e4decf03fa@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-fZd9Y1jimBb0WSf6xeuw"
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

--=-fZd9Y1jimBb0WSf6xeuw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 21 novembre 2026 =C3=A0 10:10 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The driver decodes everything in MPEG-2 mode. Reject
> V4L2_MPEG2_SEQ_FLAG_MPEG1, the full pel flags and D-pictures, which it
> would otherwise decode as MPEG-2. Compile tested only.

That change flags the the API is not backward compatible. Please fix.

Nicolas

>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 26e5d5547466..c910a69e8e3c 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -264,6 +264,16 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>  =09=09if (sps->bit_depth_luma_minus8 !=3D 0 && sps->bit_depth_luma_minus=
8 !=3D 2)
>  =09=09=09/* Only 8-bit and 10-bit are supported */
>  =09=09=09return -EINVAL;
> +=09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_MPEG2_SEQUENCE) {
> +=09=09if (ctrl->p_new.p_mpeg2_sequence->flags & V4L2_MPEG2_SEQ_FLAG_MPEG=
1)
> +=09=09=09return -EINVAL;
> +=09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_MPEG2_PICTURE) {
> +=09=09const struct v4l2_ctrl_mpeg2_picture *pic =3D ctrl->p_new.p_mpeg2_=
picture;
> +
> +=09=09if (pic->picture_coding_type =3D=3D V4L2_MPEG2_PIC_CODING_TYPE_D |=
|
> +=09=09    pic->flags & (V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD |
> +=09=09=09=09  V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD))
> +=09=09=09return -EINVAL;
>  =09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_VP9_FRAME) {
>  =09=09const struct v4l2_ctrl_vp9_frame *dec_params =3D ctrl->p_new.p_vp9=
_frame;
> =20
> @@ -435,11 +445,13 @@ static const struct hantro_ctrl controls[] =3D {
>  =09=09.codec =3D HANTRO_MPEG2_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_MPEG2_SEQUENCE,
> +=09=09=09.ops =3D &hantro_ctrl_ops,
>  =09=09},
>  =09}, {
>  =09=09.codec =3D HANTRO_MPEG2_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_MPEG2_PICTURE,
> +=09=09=09.ops =3D &hantro_ctrl_ops,
>  =09=09},
>  =09}, {
>  =09=09.codec =3D HANTRO_MPEG2_DECODER,

--=-fZd9Y1jimBb0WSf6xeuw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawS9jwAKCRDZQZRRKWBy
9FgnAQD8bTw31XYUe1vtqtfkbGoUUqyeBO03yvS9WjlSeEZEqAEAwb/xlN87u1WT
eKzhSo5iACnSctSO6DI1zERR4hborwY=
=+31i
-----END PGP SIGNATURE-----

--=-fZd9Y1jimBb0WSf6xeuw--
