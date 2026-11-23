Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472750;
	b=wkDYHwUSS9eScLpkXaexvabCnQ7z+Wun+Tp2x/jK/aYYxkN/Vhce3xL6ZWg1TxPXMRMu
	 8slM57xBho8IpK6eRDXeCde3vVVRw3FJrNivj8CdQeIX9Q4ieJoCLPHhbIL75eBTJbxla
	 OxDZl9TsAYbbKmG/P5pfjVrDrM4Z9ys3kX434YyxdYKo4R32MmfgHKf6sN93VJWJoVet/
	 DvN3K/OZXYKkQc2BQl558P9EsOeVw4KsuHcRo3V4RP1H0aqkiWjGjr2sK6oWB0af/ENzM
	 widHanJ6Nj5z4eoLvqLPm5imSCA9s0XkvnCBdoCL3fJI6w9G2uygkyDKMBi+67Cquvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472750;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=JX+HHBcYrn3L5tSgwvRkhN44cZXQrgeMOcFjZIISQlg=;
	b=rBb9SvEpRqLkLCueO/u63w4gC2wbNJ8zu2MsK23n61r3HmE+cctojD6I/OmWnPrdlgFz
	 uKUAvtMaYn1rjVyIoZ8erm00q1rDRvD9lld7emENSPjC3IdxrvKWsF6LRN5t7tK6rnx0I
	 8fT+DgPKnOzk7YOpHcFxgJH4iP3XFmJF9f5NiRrArvOwH44yoji3NQl99O0SR3sRk+615
	 S7zsWQkqAa012Kyo5w+qX5zxNmXMHMfz5u5iNY2MRRzlVZNA50V3R0BtAbCpGktiCN1uN
	 td23M/um62oR7kKG+FI+b9kZTsZTWTV+lRVYLGeexGzSf5sh2rR6bJqym7m+vOAIiKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GhC6SClc;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35362606A31E;
	Mon, 23 Nov 2026 22:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35362606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GhC6SClc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795472748;
	bh=fGAAPcKd6neM53/qNC4krvVR7BMl/k9dOCzKOiSZl1w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GhC6SClc0hZW2vieXL75I5S4Soj0UI262Mm8goxTT6F5gkpZ4O/dfD47hr+sJ1C1P
	 BSMKy51uiY/6vKfZFPa2n82onhcR5sA2l057o8ynNoi0EatkmAswyxUj6L7rvTLjMb
	 o3GkgI3axQtvTGp1UGx4Ye2h/U/B82kz4Sw5DZyhjPKWzn9LULLK+45M+VJJgGCdZw
	 CthGBLlHQybBawW4rJBYTY6uh3lwrsYEYcCLRUObc+wk77ldDxQhCdX7IwI8fz5AO7
	 K3LNbTOLVjswX0eKA6l+zDSbvKguMKzvI2yX1VOKK4lZmqltLqzV9Nm2wdZUX2qJvh
	 tNe+CueCnVl/g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 05B7517E0DB6;
	Mon, 23 Nov 2026 23:25:45 +0100 (CET)
Message-ID: <24a2298a6aaa561990b38fe6aabd1a6734c01982.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: uapi: mpeg2: add MPEG-1 flags
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
Date: Mon, 23 Nov 2026 17:25:44 -0500
In-Reply-To: <20261121-b4-cedrus-mpeg1-v2-1-95e4decf03fa@gmail.com>
References: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
	 <20261121-b4-cedrus-mpeg1-v2-1-95e4decf03fa@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-4L4mp99RXxCJlUHtrXto"
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

--=-4L4mp99RXxCJlUHtrXto
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 21 novembre 2026 =C3=A0 10:10 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> Stateless MPEG-2 decoders can decode MPEG-1, but the uAPI cannot say a
> stream is MPEG-1, and decoding it as MPEG-2 is wrong: MPEG-1 has its own
> inverse quantisation mismatch control, full pel motion vectors and
> D-pictures.
>=20
> Add V4L2_MPEG2_SEQ_FLAG_MPEG1, V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD and
> _BACKWARD, and allow V4L2_MPEG2_PIC_CODING_TYPE_D for MPEG-1. Drivers
> that cannot decode MPEG-1 or D-pictures reject them, also in
> VIDIOC_TRY_EXT_CTRLS. Kernels without this change accept the flag and
> decode the stream as MPEG-2.

We require open source users to demonstrate the usage of new APIs. You coul=
d try
and port either ffmpeg or gstreamer. Considering how hard these are to find=
, its
pretty historical kind of stream, you should document few known sources too=
.

Nicolas

>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../media/v4l/ext-ctrls-codec-stateless.rst        | 34 ++++++++++++++++=
++++--
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  1 +
>  include/uapi/linux/v4l2-controls.h                 |  3 ++
>  3 files changed, 36 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index d7a3b8ef03a7..f51017b5d6f0 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -1317,6 +1317,22 @@ FWHT Flags
>        - 0x01
>        - Indication that all the frames for the sequence are progressive =
instead
>  =09of interlaced.
> +    * - ``V4L2_MPEG2_SEQ_FLAG_MPEG1``
> +      - 0x02
> +      - The sequence is an ISO/IEC 11172-2 (MPEG-1) sequence: the invers=
e
> +=09quantisation uses the MPEG-1 mismatch control, motion vectors may be
> +=09full pel and pictures may be D-pictures. Drivers that cannot decode
> +=09MPEG-1 reject this flag, also in ``VIDIOC_TRY_EXT_CTRLS``. MPEG-1 has
> +=09no sequence or picture extensions: applications set the fields that
> +=09come from them to chroma_format 1, V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE,
> +=09frame pictures with V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT and
> +=09V4L2_MPEG2_PIC_FLAG_PROGRESSIVE, intra_dc_precision 0, the flags
> +=09V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE, V4L2_MPEG2_PIC_FLAG_INTRA_VLC,
> +=09V4L2_MPEG2_PIC_FLAG_ALT_SCAN, V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV,
> +=09V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST and
> +=09V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST cleared, both components of
> +=09``f_code[0]`` set to forward_f_code and of ``f_code[1]`` to
> +=09backward_f_code.
> =20
>  .. raw:: latex
> =20
> @@ -1366,8 +1382,12 @@ FWHT Flags
>      * - __u8
>        - ``picture_coding_type``
>        - Picture coding type for the frame covered by the current slice
> -=09(V4L2_MPEG2_PIC_CODING_TYPE_I, V4L2_MPEG2_PIC_CODING_TYPE_P or
> -=09V4L2_MPEG2_PIC_CODING_TYPE_B).
> +=09(V4L2_MPEG2_PIC_CODING_TYPE_I, V4L2_MPEG2_PIC_CODING_TYPE_P,
> +=09V4L2_MPEG2_PIC_CODING_TYPE_B, or V4L2_MPEG2_PIC_CODING_TYPE_D in MPEG=
-1
> +=09sequences). Decoding D-pictures is optional: drivers that cannot
> +=09decode them reject V4L2_MPEG2_PIC_CODING_TYPE_D, also in
> +=09``VIDIOC_TRY_EXT_CTRLS``, which applications can use to find out
> +=09whether D-pictures are supported.
>      * - __u8
>        - ``picture_structure``
>        - Picture structure (1: interlaced top field, 2: interlaced bottom=
 field,
> @@ -1415,6 +1435,16 @@ FWHT Flags
>      * - ``V4L2_MPEG2_PIC_FLAG_PROGRESSIVE``
>        - 0x00000080
>        - Indicates whether the current frame is progressive.
> +    * - ``V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD``
> +      - 0x00000100
> +      - full_pel_forward_vector of an MPEG-1 picture header: the forward
> +=09motion vectors are in full pel units. Only valid with
> +=09V4L2_MPEG2_SEQ_FLAG_MPEG1.
> +    * - ``V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD``
> +      - 0x00000200
> +      - full_pel_backward_vector of an MPEG-1 picture header: the backwa=
rd
> +=09motion vectors are in full pel units. Only valid with
> +=09V4L2_MPEG2_SEQ_FLAG_MPEG1.
> =20
>  .. raw:: latex
> =20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 6e751a043a21..a12359626121 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1049,6 +1049,7 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
>  =09=09case V4L2_MPEG2_PIC_CODING_TYPE_I:
>  =09=09case V4L2_MPEG2_PIC_CODING_TYPE_P:
>  =09=09case V4L2_MPEG2_PIC_CODING_TYPE_B:
> +=09=09case V4L2_MPEG2_PIC_CODING_TYPE_D:
>  =09=09=09break;
>  =09=09default:
>  =09=09=09return -EINVAL;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2e..e7e6030ac00c 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2007,6 +2007,7 @@ struct v4l2_ctrl_vp8_frame {
>  /* Stateless MPEG-2 controls */
> =20
>  #define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE=090x01
> +#define V4L2_MPEG2_SEQ_FLAG_MPEG1=090x02
> =20
>  #define V4L2_CID_STATELESS_MPEG2_SEQUENCE (V4L2_CID_CODEC_STATELESS_BASE=
+220)
>  /**
> @@ -2055,6 +2056,8 @@ struct v4l2_ctrl_mpeg2_sequence {
>  #define V4L2_MPEG2_PIC_FLAG_ALT_SCAN=09=09=090x0020
>  #define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST=09=090x0040
>  #define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE=09=09=090x0080
> +#define V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD=09=090x0100
> +#define V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD=09=090x0200
> =20
>  #define V4L2_CID_STATELESS_MPEG2_PICTURE (V4L2_CID_CODEC_STATELESS_BASE+=
221)
>  /**

--=-4L4mp99RXxCJlUHtrXto
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawS9aAAKCRDZQZRRKWBy
9DjeAQD/AB413RIOudh7Noe1qnnb5Kzj1Cmq6mZZKtnd2um+CAD/fcf5tS7LToUl
fYVwwCwQ4ktac4g5XWrf68wO+Afn0wE=
=9OjG
-----END PGP SIGNATURE-----

--=-4L4mp99RXxCJlUHtrXto--
