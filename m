Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732764;
	b=VZqKQqfd6rqdD1u49Wopp9gOVZKoJEwUtiAGn2pow6WN1fzkxdQopQfK5uCIyVCXr4D7
	 pRVufUhZq/bnbIIEo1fHJdTXZXUnIuP7Fgf//VdIUMTGq/R93Gmg0iXz4xeeo20ZSZYQp
	 Z/ZJG/8Cocx6/1BOsfCg5fChMnkcRn2ZxXV6+yMQAeKpejp30OWigSTPc0Fq/QeJAoy0S
	 +xmPrCyPmMj3A79C97TYRMXi1mCg5kG46DuIiRZ6OFeXkAwOmYegZTXG5dQYC7CHY0F5G
	 2hrXjZLumW2MoqN/Ml9gZlpKe+ce8aT+DOmhDUBFGKJeokGI9jVc11NReSpVznzntLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732764;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=3b/rqhQmT3xmc1qWoR3hWslCjOL5zdfyC8hHmCQeVuc=;
	b=qFYRRPDjJTTEVkDS3Fz/glls3U73A9cZPKlPwDnT3HSya/oz8O+7G34U8OoTRzIT2POF
	 c0QhQJtT/cu4sgAQcqzQfcKADf6s6qAASd303S27Mzyy+DPXgifLZXiTFUf4nDQZ58ZZB
	 FHpPIZnsyRUSzv/s3bgqfNhtha+AgO6mhaDYBc/Z/qbNcyxiilchyqcoOq+ILVABv4x2F
	 TwG5RqBHsLtGlg7FEzJXhI88pmB1qlbF/Ntd1mpv15i0h6qwkb4hi0mGoe5XMAqZEMdrj
	 SPyLxeGS1kOMBDYz2T3DO0Iv8BcE2mNaLQQFIm+S13d0lAJTlKrLJD+O1MNx+k8WtQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kbuy3Uio;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24D606A32D;
	Thu, 26 Nov 2026 22:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB24D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kbuy3Uio
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795732762;
	bh=vJprXkooLTTizDoYN7nK7CbdvrG0cpdJhVlxvvq+ljA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kbuy3Uio/Blyvn6RmMve1NZrU3dW+aDj06ubrTEwyTRuE+st6/3aVKExgoGJRUbMm
	 nxrTvT6D4bNOvOTQhOiuQAOL+3fnwEXwIvnd2+LgL37HoUc28QSgz4gCC2sIKd/wgv
	 LOQ3+5dd1QfBJaNq/OrqNm0F8Y5zt3XObHYELbDAjeOoriK0AOBTOk+0TdHz1g2Lso
	 XHnIQT2QTkR0oiI/SMu5J+lOdYq5wnljAk2yLWYt3uoJQEJEoQA9znxBTnDoHqixJb
	 bNpqyRpBceEpdzFKaBg2eyJNg/821gGyrXFaW7z5ENQjxRFzijhzp448V366aHgbVb
	 vHTqSa/Lvm9nA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 339E517E0DCD;
	Thu, 26 Nov 2026 23:39:20 +0100 (CET)
Message-ID: <74b063cdc772987150f00e084e60503e32291f23.camel@collabora.com>
Subject: Re: [PATCH v2 07/11] staging: media: cedrus: validate VP8 frame size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:39:18 -0500
In-Reply-To: <20261109175016.42061-8-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
	 <20261109175016.42061-8-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-8Q9KLiYJnGx9xs4o2J0/"
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

--=-8Q9KLiYJnGx9xs4o2J0/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 09 novembre 2026 =C3=A0 18:50 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> A VP8 key frame can change the frame size. If userspace doesn't
> reallocate the capture buffers, the hardware writes and reads past the
> buffers, which shows up as IOMMU page faults and decode timeouts.
>=20
> Like for the H.264 and HEVC SPS, reject frames beyond the hardware
> limits in try_ctrl, and fail the job in the setup callback if the frame
> doesn't fit the buffers. The VP8 frame size register holds the size in
> 8-bit macroblock counts, so VP8 frames are limited to 4080 pixels in
> width.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c     | 10 ++++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c |  3 +++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 197213911bf7..6c6aa45f5f96 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -28,6 +28,8 @@
>  #include "cedrus_dec.h"
>  #include "cedrus_hw.h"
> =20
> +#define CEDRUS_VP8_MAX_WIDTH=094080U
> +
>  /*
>   * Reject picture sizes beyond the hardware limits. Whether the picture =
fits
>   * the buffers is checked when a job is set up, see cedrus_check_pic_siz=
e().
> @@ -54,6 +56,13 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  =09=09if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
>  =09=09=09=09=09       cedrus_h264_sps_height(sps)))
>  =09=09=09return -EINVAL;
> +=09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_VP8_FRAME) {
> +=09=09const struct v4l2_ctrl_vp8_frame *frame =3D ctrl->p_new.p_vp8_fram=
e;
> +
> +=09=09/* The VP8 frame size register holds 8-bit macroblock counts. */
> +=09=09if (!cedrus_pic_size_supported(frame->width, frame->height) ||
> +=09=09    frame->width > CEDRUS_VP8_MAX_WIDTH)
> +=09=09=09return -EINVAL;
>  =09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  =09=09const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
>  =09=09struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedr=
us_ctx, hdl);
> @@ -248,6 +257,7 @@ static const struct cedrus_control cedrus_controls[] =
=3D {
>  =09{
>  =09=09.cfg =3D {
>  =09=09=09.id=09=3D V4L2_CID_STATELESS_VP8_FRAME,
> +=09=09=09.ops=09=3D &cedrus_ctrl_ops,
>  =09=09},
>  =09=09.capabilities=09=3D CEDRUS_CAPABILITY_VP8_DEC,
>  =09},
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..fecca343bd92 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -662,6 +662,9 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, s=
truct cedrus_run *run)
>  =09int header_size;
>  =09u32 reg;
> =20
> +=09if (cedrus_check_pic_size(ctx, slice->width, slice->height))
> +=09=09return -EINVAL;
> +
>  =09cedrus_engine_enable(ctx);
> =20
>  =09cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);

--=-8Q9KLiYJnGx9xs4o2J0/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawi1FwAKCRDZQZRRKWBy
9AVeAP0QqqSJZ3Yi76IXym+ARoRij09yWYrM1P4qCnP48U+tbAEA+kUzIe/ld2xe
WskL55bZCsv3njtlNiKP/49DrxTEtAI=
=e+YH
-----END PGP SIGNATURE-----

--=-8Q9KLiYJnGx9xs4o2J0/--
