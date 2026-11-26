Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732662;
	b=JsiRbgL2B/x/UKpeTiKdF76ULa9DSasbG5wY8DHG/nTl5nqeEB5Y7JV0zI5fW9GtX4Gm
	 55paRet3f05HR0SY1K1k7jWBlElsFIHsKjlWJG+Wq+bwrX96uxd7F+EPMXuO+U7nRrfaH
	 NUR12SN4Z/CJDZR5UWBcG4WZLfIcthAPtnTER6GP9hx0adTUFRoNRgqDS+nqQpUhz9OAp
	 Qtm6tCdefmMmjSbMR3G0kb5+Wu2KNlnbtUyxAMIk1+NkdVFo/Sp7SbAyzepK4GfJCcm02
	 uConjLRcJTJ9fE5CghFXYtPXrkvdEe7XZPNLpRloUiAT7fj7RnH4j5qmXwrJpx5TPyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732662;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=nU7JvJls8+BK1T4tqOKjGDMIPhugRu8aj2ala05k94s=;
	b=jIyx1Qau5EIx+1TlZjuE9ZY1L8zM1SGVmTT7XVyEIoeckCcwetcBbwUJS7kohI+2Hte+
	 2XPuHKLkgrVDCEtNdbAasHnVkOnHHPvVVU0iVhQNetQbqZF4zJT8TinNwqBTBRTYmKH+k
	 JZzrX480SmY8ZFmqOYPFIlshkhTXEPvtk3xOsPw9nn2Jt+dIRWBBC5fycW8wTPcj0qhMI
	 GaEnVuS9VrHUpFuuNDXRAFUCMHehYGcaGuVbpkR7nEvXIOhrUhYl70qUXcG7Vg23ZWBz7
	 K0xZ/Bioz7f1i+jQNbWryAbXXFt/21bcsBu0zvC6UcmQvtRTnKx3GMukjcjioGk3ZoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BukykUC1;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025CD606A31C;
	Thu, 26 Nov 2026 22:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 025CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BukykUC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795732660;
	bh=Owe8kxDEvzCOhmlF/Weij9GtmDLQR7uOC/feDg+FZLo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BukykUC1j20vf/NtwUJdpGMYEkq30q7wc7l3DwgOGFRNABI+YqNZ9zdJ0QQA3MuLu
	 iq+U0TYNJiXGNO/iFxyyvsy730usRkuXDRA02Y1XlgiyWSptnJxka2DXNTVpFyQUK8
	 HtD1eeh9kGu/4dyNBWUjqyLwIz8paDW+2/opwX8g996VRMCkjjMGFQnjnNzVFGa8Zx
	 S1RHeTOCqQH1Dm/QKyio9ddg22AWAmDVSG4Th2bJ98RrLDlXzZrxbsZUn2MXCR/isY
	 LHmcAbyqMaraafczSwEZwA9WM8iF4+R2+EmxL92L66pJZpL+6NlM8IkNITbvT+Ay9Y
	 +RSe75VEPEd7Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6721C17E09ED;
	Thu, 26 Nov 2026 23:37:38 +0100 (CET)
Message-ID: <9f9f220a3b7189184fed9e94420b30122c37746f.camel@collabora.com>
Subject: Re: [PATCH v2 02/11] staging: media: cedrus: reject too large
 H.264/HEVC SPS
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:37:36 -0500
In-Reply-To: <20261109175016.42061-3-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
	 <20261109175016.42061-3-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-ETJLAagiiSV4GyW2Gs0L"
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

--=-ETJLAagiiSV4GyW2Gs0L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 09 novembre 2026 =C3=A0 18:50 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The H.264 decoder takes the picture size from the SPS, and the HEVC
> decoder the position of the slices. An SPS beyond CEDRUS_MAX_WIDTH/HEIGHT=
,
> or beyond the capture buffers, makes the hardware overrun memory and
> hang. On H616, the JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056,
> 528x4216 and 4216x528) leave the hardware wedged, so that every
> following job times out until reboot.
>=20
> Reject an SPS beyond the hardware limits in try_ctrl, and move the
> limits to cedrus_video.h for that.
>=20
> Whether the picture fits the buffers can only be checked when a job
> runs: the SPS can be set before the buffers are allocated, while the
> OUTPUT format they are sized from can still change, and a request
> doesn't have to carry an SPS at all. Check it in the setup callbacks,
> so that such a job fails with an error buffer instead.
>=20
> Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 16 +++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus.h   | 34 +++++++++++++++++++
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 ++++
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  4 +++
>  .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
>  .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
>  6 files changed, 65 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index c3331b4f3f02..197213911bf7 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -28,6 +28,15 @@
>  #include "cedrus_dec.h"
>  #include "cedrus_hw.h"
> =20
> +/*
> + * Reject picture sizes beyond the hardware limits. Whether the picture =
fits
> + * the buffers is checked when a job is set up, see cedrus_check_pic_siz=
e().
> + */
> +static bool cedrus_pic_size_supported(u32 width, u32 height)
> +{
> +=09return width <=3D CEDRUS_MAX_WIDTH && height <=3D CEDRUS_MAX_HEIGHT;
> +}
> +
>  static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  =09if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS) {
> @@ -42,6 +51,9 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  =09=09if (sps->bit_depth_luma_minus8 !=3D 0)
>  =09=09=09/* Only 8-bit is supported */
>  =09=09=09return -EINVAL;
> +=09=09if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
> +=09=09=09=09=09       cedrus_h264_sps_height(sps)))
> +=09=09=09return -EINVAL;
>  =09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  =09=09const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
>  =09=09struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedr=
us_ctx, hdl);
> @@ -52,6 +64,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  =09=09=09/* Only 4:2:0 is supported */
>  =09=09=09return -EINVAL;
> =20
> +=09=09if (!cedrus_pic_size_supported(sps->pic_width_in_luma_samples,
> +=09=09=09=09=09       sps->pic_height_in_luma_samples))
> +=09=09=09return -EINVAL;
> +
>  =09=09bit_depth =3D max(sps->bit_depth_luma_minus8,
>  =09=09=09=09sps->bit_depth_chroma_minus8) + 8;
> =20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index 54f867949fba..c2318521d7e5 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -274,6 +274,40 @@ cedrus_is_capable(struct cedrus_ctx *ctx, unsigned i=
nt capabilities)
>  =09return (ctx->dev->capabilities & capabilities) =3D=3D capabilities;
>  }
> =20
> +/*
> + * The decoders take the picture size, or the position of the slices, fr=
om
> + * the bitstream headers. Check that the picture fits the buffers, which=
 are
> + * sized from the OUTPUT format and padded to at least 16 pixels in both
> + * directions, so that the hardware doesn't overrun them and hang.
> + */
> +static inline int cedrus_check_pic_size(struct cedrus_ctx *ctx,
> +=09=09=09=09=09unsigned int width, unsigned int height)
> +{
> +=09if (width > ALIGN(ctx->src_fmt.width, 16) ||
> +=09    height > ALIGN(ctx->src_fmt.height, 16))
> +=09=09return -EINVAL;
> +
> +=09return 0;
> +}
> +
> +static inline unsigned int
> +cedrus_h264_sps_width(const struct v4l2_ctrl_h264_sps *sps)
> +{
> +=09return (sps->pic_width_in_mbs_minus1 + 1) * 16;
> +}
> +
> +static inline unsigned int
> +cedrus_h264_sps_height(const struct v4l2_ctrl_h264_sps *sps)
> +{
> +=09unsigned int height =3D (sps->pic_height_in_map_units_minus1 + 1) * 1=
6;
> +
> +=09/* Map units are macroblock pairs, unless only frames are coded. */
> +=09if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +=09=09height *=3D 2;
> +
> +=09return height;
> +}
> +
>  void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id);
>  u32 cedrus_get_num_of_controls(struct cedrus_ctx *ctx, u32 id);
> =20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 892193c12b2f..e8229c60d3f5 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -518,9 +518,15 @@ static void cedrus_h264_irq_disable(struct cedrus_ct=
x *ctx)
> =20
>  static int cedrus_h264_setup(struct cedrus_ctx *ctx, struct cedrus_run *=
run)
>  {
> +=09const struct v4l2_ctrl_h264_sps *sps =3D run->h264.sps;
>  =09struct cedrus_dev *dev =3D ctx->dev;
>  =09int ret;
> =20
> +=09ret =3D cedrus_check_pic_size(ctx, cedrus_h264_sps_width(sps),
> +=09=09=09=09    cedrus_h264_sps_height(sps));
> +=09if (ret)
> +=09=09return ret;
> +
>  =09cedrus_engine_enable(ctx);
> =20
>  =09cedrus_write(dev, VE_H264_SDROT_CTRL, 0);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 6c643862ab73..aa772a8d71c8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -445,6 +445,10 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx,=
 struct cedrus_run *run)
>  =09cedrus_buf =3D vb2_to_cedrus_buffer(&run->dst->vb2_buf);
>  =09slice_bytes =3D vb2_get_plane_payload(&run->src->vb2_buf, 0);
> =20
> +=09if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
> +=09=09=09=09  sps->pic_height_in_luma_samples))
> +=09=09return -EINVAL;
> +
>  =09/*
>  =09 * If entry points offsets are present, we should get them
>  =09 * exactly the right amount.
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index adc7f255d7cf..2521315abdb7 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -29,11 +29,6 @@
>  #define CEDRUS_DECODE_SRC=09BIT(0)
>  #define CEDRUS_DECODE_DST=09BIT(1)
> =20
> -#define CEDRUS_MIN_WIDTH=0916U
> -#define CEDRUS_MIN_HEIGHT=0916U
> -#define CEDRUS_MAX_WIDTH=094096U
> -#define CEDRUS_MAX_HEIGHT=092304U
> -
>  static struct cedrus_format cedrus_formats[] =3D {
>  =09{
>  =09=09.pixelformat=09=3D V4L2_PIX_FMT_MPEG2_SLICE,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.h
> index 8e1afc16a6a1..367e52158f01 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> @@ -22,6 +22,11 @@ struct cedrus_format {
>  =09unsigned int=09capabilities;
>  };
> =20
> +#define CEDRUS_MIN_WIDTH=0916U
> +#define CEDRUS_MIN_HEIGHT=0916U
> +#define CEDRUS_MAX_WIDTH=094096U
> +#define CEDRUS_MAX_HEIGHT=092304U
> +
>  extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
> =20
>  int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,

--=-ETJLAagiiSV4GyW2Gs0L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawi0sAAKCRDZQZRRKWBy
9BRlAP9eK2kDg6lH7en/MTu+oLKI1ss9mEyXuvEqaPE3BjozhwEAz1wtjPv4Hwkz
aSmEaVfKC1WBZ9ZuUIjyeHs7dwmqEQM=
=Ka3t
-----END PGP SIGNATURE-----

--=-ETJLAagiiSV4GyW2Gs0L--
