Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B1374A07;
	Fri, 10 Jul 2026 20:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715658; cv=none; b=VdyNyDyLg7Oi68r4PUF1zP3PNGu/q+miUnnuHVhWxXV0oMdIud4z9Z221H2uO3Sce622HqiGswfoQ7o4hrrzx5HaHiJ7fjwpdAxVPkc9n81OHQUVVOJB9MBxQfSljuRVu6eahreeEiqN2uZWk7eL9UAuRJVBf7ObNvKCiTgT7kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715658; c=relaxed/simple;
	bh=kFqP1SwfQdKDLFQD5xhHmRMizA4ezwfJNsHrrbW4o+4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T7wzmZI1VKJlnbgWhRzwfCZHG2zuDXtQVtTfjkXvMwh0cqKMRfia91hTC4tzkA/seYxhzQ+SBzSHTrMKQEYi4mQgaI/S9ZW7Yo9r+jz6Ue/cznG3JfdSBQ7zvp4sGsT2oU1yrGKgV6Pb98ENfP/lHHi+N4DfC9IgyroRer5mXdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KbSl3PH6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KbSl3PH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783715655;
	bh=kFqP1SwfQdKDLFQD5xhHmRMizA4ezwfJNsHrrbW4o+4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KbSl3PH6Saw1w+474Ri3Uyuj3xk4BgEBFer3s4EmtQ81u9k0iUYsJIgd+UNM/bFHC
	 opqud7ioS6PKkjrAifA6JpwL6FL86HmxN0HtYnXMzz7xqMAfgCHPQcSfpgtUwRwLdm
	 khZfQkjytLqbTDDiqo2egdPNloK30uGNY4x4RNz6ngiQerxTCZ8YBFOLN/S+0MLmAs
	 FJLd3Cy/wcpzyOYb7yTfPibd+SCLREhXqR6tBH9ckmVyUmFjvNGZ1ImqA5OjbhMyGr
	 VQ2EiByxVV2L4A176Rw+LZPw5YV3Nml+eEMqsZt0ZKNT+yzNceeApBd8PH/bqDtOpO
	 AGIt1L4lRZ7Ew==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1B3417E07A2;
	Fri, 10 Jul 2026 22:34:13 +0200 (CEST)
Message-ID: <273883f0479afb1037d9b4b815937267b6bd658d.camel@collabora.com>
Subject: Re: [PATCH v2] media: cedrus: reject invalid active H.264 ref
 indices
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland	 <samuel@sholland.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 10 Jul 2026 16:34:12 -0400
In-Reply-To: <20260409223001.1-cedrus-h264-active-v2-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <20260409223001.1-cedrus-h264-active-v2-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-Ru0Xnwyd0QYxoSMl4+y9"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-Ru0Xnwyd0QYxoSMl4+y9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 21:30 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> Cedrus consumes the active ref_pic_list0/ref_pic_list1 entries and uses
> their indices to look up decode->dpb[] in _cedrus_write_ref_list().
>=20
> Those active portions are the first
> num_ref_idx_l0_active_minus1 + 1 / num_ref_idx_l1_active_minus1 + 1
> entries in the two reference lists.
>=20
> An out-of-range index in that active portion can therefore read past the
> fixed V4L2_H264_NUM_DPB_ENTRIES array.
>=20
> Checking this in cedrus_try_ctrl() is awkward because the request-local
> DPB state may not have been applied yet. Instead, validate the active
> entries at the actual Cedrus use site and fail setup with -EINVAL if one
> points past decode->dpb[].
>=20
> Entries beyond the active reference counts remain ignored as before, so
> this does not change how Cedrus treats unused tail data in the
> reference-list controls.
>=20
> Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Changes since v1:
> - reject invalid indices in the active reference list entries instead of
> =C2=A0 silently skipping them
> - keep the validation at the Cedrus use site, but propagate -EINVAL back
> =C2=A0 through setup
>=20
> =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 32 +++++++++++++=
+--
> =C2=A01 file changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 3e2843ef6cce..58c411c580f3 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -186,10 +186,10 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> =C2=A0
> =C2=A0#define CEDRUS_MAX_REF_IDX	32
> =C2=A0
> -static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> -				=C2=A0=C2=A0 struct cedrus_run *run,
> -				=C2=A0=C2=A0 const struct v4l2_h264_reference *ref_list,
> -				=C2=A0=C2=A0 u8 num_ref, enum cedrus_h264_sram_off sram)
> +static int _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> +				=C2=A0 struct cedrus_run *run,
> +				=C2=A0 const struct v4l2_h264_reference *ref_list,
> +				=C2=A0 u8 num_ref, enum cedrus_h264_sram_off sram)
> =C2=A0{
> =C2=A0	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.de=
code_params;
> =C2=A0	struct vb2_queue *cap_q;
> @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
> =C2=A0		u8 dpb_idx;
> =C2=A0
> =C2=A0		dpb_idx =3D ref_list[i].index;
> +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> +			return -EINVAL;
> +
> =C2=A0		dpb =3D &decode->dpb[dpb_idx];
> =C2=A0
> =C2=A0		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> @@ -229,28 +232,30 @@ static void _cedrus_write_ref_list(struct cedrus_ct=
x *ctx,
> =C2=A0
> =C2=A0	size =3D min_t(size_t, ALIGN(num_ref, 4), sizeof(sram_array));
> =C2=A0	cedrus_h264_write_sram(dev, sram, &sram_array, size);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> -static void cedrus_write_ref_list0(struct cedrus_ctx *ctx,
> -				=C2=A0=C2=A0 struct cedrus_run *run)
> +static int cedrus_write_ref_list0(struct cedrus_ctx *ctx,
> +				=C2=A0 struct cedrus_run *run)
> =C2=A0{
> =C2=A0	const struct v4l2_ctrl_h264_slice_params *slice =3D run->h264.slic=
e_params;
> =C2=A0
> -	_cedrus_write_ref_list(ctx, run,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->ref_pic_list0,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->num_ref_idx_l0_active_min=
us1 + 1,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEDRUS_SRAM_H264_REF_LIST_0);
> +	return _cedrus_write_ref_list(ctx, run,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->ref_pic_list0,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->num_ref_idx_l0_active_minus1 +=
 1,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEDRUS_SRAM_H264_REF_LIST_0);
> =C2=A0}
> =C2=A0
> -static void cedrus_write_ref_list1(struct cedrus_ctx *ctx,
> -				=C2=A0=C2=A0 struct cedrus_run *run)
> +static int cedrus_write_ref_list1(struct cedrus_ctx *ctx,
> +				=C2=A0 struct cedrus_run *run)
> =C2=A0{
> =C2=A0	const struct v4l2_ctrl_h264_slice_params *slice =3D run->h264.slic=
e_params;
> =C2=A0
> -	_cedrus_write_ref_list(ctx, run,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->ref_pic_list1,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->num_ref_idx_l1_active_min=
us1 + 1,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEDRUS_SRAM_H264_REF_LIST_1);
> +	return _cedrus_write_ref_list(ctx, run,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->ref_pic_list1,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->num_ref_idx_l1_active_minus1 +=
 1,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEDRUS_SRAM_H264_REF_LIST_1);
> =C2=A0}
> =C2=A0
> =C2=A0static void cedrus_write_scaling_lists(struct cedrus_ctx *ctx,
> @@ -338,8 +343,8 @@ static void cedrus_skip_bits(struct cedrus_dev *dev, =
int num)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void cedrus_set_params(struct cedrus_ctx *ctx,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cedrus_run *run)
> +static int cedrus_set_params(struct cedrus_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct cedrus_run *run)
> =C2=A0{
> =C2=A0	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.de=
code_params;
> =C2=A0	const struct v4l2_ctrl_h264_slice_params *slice =3D run->h264.slic=
e_params;
> @@ -351,6 +356,7 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
> =C2=A0	size_t slice_bytes =3D vb2_get_plane_payload(src_buf, 0);
> =C2=A0	unsigned int pic_width_in_mbs;
> =C2=A0	bool mbaff_pic;
> +	int ret;
> =C2=A0	u32 reg;
> =C2=A0
> =C2=A0	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
> @@ -393,11 +399,17 @@ static void cedrus_set_params(struct cedrus_ctx *ct=
x,
> =C2=A0
> =C2=A0	if ((slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_P) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_=
SP) ||
> -	=C2=A0=C2=A0=C2=A0 (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B))
> -		cedrus_write_ref_list0(ctx, run);
> +	=C2=A0=C2=A0=C2=A0 (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B)) {
> +		ret =3D cedrus_write_ref_list0(ctx, run);
> +		if (ret)
> +			return ret;
> +	}
> =C2=A0
> -	if (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B)
> -		cedrus_write_ref_list1(ctx, run);
> +	if (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> +		ret =3D cedrus_write_ref_list1(ctx, run);
> +		if (ret)
> +			return ret;
> +	}
> =C2=A0
> =C2=A0	// picture parameters
> =C2=A0	reg =3D 0;
> @@ -478,6 +490,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 VE_H264_CTRL_SLICE_DECODE_INT |
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 VE_H264_CTRL_DECODE_ERR_INT |
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 VE_H264_CTRL_VLD_DATA_REQ_INT);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static enum cedrus_irq_status
> @@ -531,9 +545,7 @@ static int cedrus_h264_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	cedrus_set_params(ctx, run);
> -
> -	return 0;
> +	return cedrus_set_params(ctx, run);
> =C2=A0}
> =C2=A0
> =C2=A0static int cedrus_h264_start(struct cedrus_ctx *ctx)

--=-Ru0Xnwyd0QYxoSMl4+y9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFXRAAKCRDZQZRRKWBy
9Ap7AP91sNPmAgcI3iMnUbZuyceQHmW98L8g/MoNNo5CzoVA8AD8CrNyjRHerLeE
9TCKOFj51ZEWvIh8SHuQ+s69PJLWbAA=
=fCRT
-----END PGP SIGNATURE-----

--=-Ru0Xnwyd0QYxoSMl4+y9--
