Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728961;
	b=jSqSN5qtensCnaFsj1Bi3MlRznauQg3gFRIxJqvD8FR4UinjksfMcceybJmniLBNcuHt
	 ZkqDk31P8bvO/obfQys6txJMvYbfiyjb5OTw7N+ZyH8kanrcwtKhDfFNTwZi6cLNRlb91
	 RspBo4IzYhBw+iM7VsXyYwMHReo6qVMj53d4hKPAQBBhcO4Ia4Kh4TRTxVTAkh/jAq2I6
	 T6TBw03PPOzzCBSZYWyVh1JB/IdFaZbDVkZyLVIFXBx2rtVoDNZcCBPrsKgtlAVFdxxhF
	 uOL4v8bHNbtpR0skPVS9cTJP9/v+IhbPazFZm4EoJNfw4tuqcBF4wMrE20w/xFjmMjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
	b=38xWrASmCHcMrCCyxsb3s4AiQL+S6cMEMD0/AqT7Tu3OPefHOvkIzckqmoOqX0+3qSDI
	 sE845QgTv+d75bPCn8ran5cpKVxSps516auUW4VtuCPhRj6xByKojEA/I6fgwB7zpFuYU
	 FIxyLKCKYwfjtZ6IQiDnssAYy5zqa45sHvhN17HCVpv0aoelS/UvlU6eD5fzS+eiWOXie
	 lK2e9+l1TDjXr+9Oe+QJE90UVVL72PF0FB4pcpbd+/GsudpxjKykET4QQaYiXAKuTlrjJ
	 GiQrYVKYVtJztEXENW0dKz09mXWhgAGTextNGZQsN/wkNQXFk3dBmYAkSRupb8swLjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxE11tTb;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872BA606A32C
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 18:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872BA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxE11tTb
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2681781f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728960; x=1794333760; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=RxE11tTb71EJc6te/ZoyrKJ/UP/Et6Kk/UIR3f9MjaJO5JTVpHQZMWaVOzyIpZQmQl
         jJdeptMfIquSA+nTj3k2musnAQtbDlV4rRDpX68FJyS9myUiemEH+IOiMe4RiXE1+yMy
         w81xeE//+cESpmehKf94kRhSEGQ/VWMsRZjkSikRqezj1B4gnDTLae3h4twtnOqyyCFk
         8RE7bXoMkY8vQCJtBuHyYBFMcknI7SkoD5YUiPgckVP1KPYe5d91b0AhZH1bn9xk422B
         53lQGGI5URQ58v4zORNDxz9RVsZi2bVrEsRunoRWCgAwIVXhMOlHc1H4eY1gUrwdTWD7
         1Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728960; x=1794333760;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=2oCVaUR2uXjj3l/fGYWXdx11xJFunLTbhlCqA/8P+bHM4iuNLwnUoAvUhu4HHN6MXQ
         rT6XYc/2VPTVWUIxdwT0pOyQyz7CHwXH4w+Oloa8Wb3E0UgVRK1h9DBQKl/doyZTi0Zc
         ieNgqlob7hWnZegzo0iRTM13sMR9YlC8nu5IKbsYMoV6o4fRueiGfriMMViKdlATKFGS
         Bd9lmpczd7oU4Y9Cc+Ig03DsZr9dAaiXra9tsVyyF2L7KeM1PB4FXDvHxXBZgux3mBll
         B0g1Zq9+avg/nUxy299mt/QbGWzpacrWW4ATfI9tLyctwTbxuuzZIEpSmOQoTSeqLen3
         9GIg==
X-Forwarded-Encrypted: i=1; AKwUvByOsC4nXk0H/xtrreIxvKnpp/CPGffi0nHOa+FRWocAAHpsFGzkCnuAoeUoc8fYQSSpAIYbpwv0NvprHtHa@lists.linux.dev
X-Gm-Message-State: APuU4Z8TfsY8eIYjUbEXXid74q5Pr/JUOd8P/ouIZMSfLY5/QbkOd00b
	rCTHp6bknVJFIC8P/PWMLqBGqZKxkr2/nm+DO1780F4bVCV1+Zde2hv/
X-Gm-Gg: AYBFou3hGHZqm4jTCF+uQy60f4XERl4zWss68gGBAlaMJsuLcFfSqyHrxT7c75JQv6c
	5v84ApiJDU067iX/hVjWHzygaoBQ8VBZlCboserwmhT54DHbe/OFXGCSQcJx2MAaY42VOIDTN9Z
	SEFUxFj0E3wYJ+FXyJCY4HZMN1Bngum0KIOV8L4M4DJJlQxJnxg++cT7ct1/3nL64BZ9/7s5PHk
	QBQE1vVHWy/iN4/pasPfiRDNGTtyWv3DLivVWG96uNnbl0nmHhLychDtj/FYRSH2cSHkQpplwj8
	YancbEg5TUzAgFgT3xuvFQKjUO/mIkaMTBon9D1MClLUsXz8Gk6bz0XTzYzvHN6tRIQBpC/hEGZ
	maNlmqzi8hzRGz9Sigyfe298ZgfaVxRhuh3g5u3QHtcMDv4RNhA0KVmjQSkN+8IHhn+P3l1QspM
	PLNCB6zBFDCzoKaoUaDbHxqbwdHhwXlEyOyaGDbHCVROntv2EHLrRTiXqWfm3vplyLCSlhy/u2z
	4SHN9cptYCPpfKF7XQy1eYK52IFc4KRvh3IGCxsD4vBH/UH08UYqlFJ4CeAbivHBdR7BD+ILqwa
	thXWR58Ypp6KexkYQ72EoTSSKApiMIazSPU777beljChs9+nIbrTovw9uaeqiqVR3Q9fDSDlJYC
	9ZiDJRFrNcP7Gm1XgW0aSqaYD9R/DdlblSPFEh9E2/3dP7WMr5sC4ThMmtWMFF8aDwcbZ8decTO
	QrH0DEuRVD9XIv/HSXBtvx6GcsIf9Ak2hMJjkXvSR47PnubVFg8pe6D/ABE5Um/CW6Ndx7pumzX
	MwshfuZjw1xLp2fQ3+ZLyT9az0XResEUSZBVYXOcVzcSb26Wmq268gox793YQ==
X-Received: by 2002:a5d:5d09:0:b0:48e:4835:de5f with SMTP id ffacd0b85a97d-48e6e4fcf2amr28751210f8f.47.1793728959547;
        Tue, 03 Nov 2026 10:02:39 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm26248330f8f.46.2026.11.03.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:02:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Tue, 03 Nov 2026 19:02:37 +0100
Message-ID: <P3FCc6YrSeexw_Zto5zS4g@gmail.com>
In-Reply-To: <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-3-jernej.skrabec@gmail.com>
 <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 2. november 2026 ob 19:44:38 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The hardware decodes whatever picture size the SPS describes. An SPS
> > beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
> > are allocated, makes the hardware overrun memory and hang. On H616, the
> > JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
> > 4216x528) leave the hardware wedged, so that every following job times
> > out until reboot.
> >=20
> > Validate the SPS picture size in try_ctrl. Move the size limits to
> > cedrus_video.h for that.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
> >  .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
> >  3 files changed, 44 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stag=
ing/media/sunxi/cedrus/cedrus.c
> > index c3331b4f3f02..45deebddb630 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > @@ -28,10 +28,38 @@
> >  #include "cedrus_dec.h"
> >  #include "cedrus_hw.h"
> > =20
> > +/*
> > + * The hardware decodes whatever picture size the bitstream headers de=
scribe.
> > + * Reject sizes beyond the hardware limits, or beyond the capture buff=
ers once
> > + * they are allocated, instead of letting the hardware overrun memory =
and hang.
> > + */
> > +static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u3=
2 height)
> > +{
> > +	struct vb2_queue *vq;
> > +
> > +	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The hardware decodes whole 16x16 macroblocks, and all capture
> > +	 * formats pad the buffers to at least 16 pixels in both directions.
> > +	 */
> > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > +	if (vb2_is_busy(vq) &&
> > +	    (width > ALIGN(ctx->src_fmt.width, 16) ||
> > +	     height > ALIGN(ctx->src_fmt.height, 16)))
> > +		return -EINVAL;
>=20
> If my memory is correct, Hans rejected this kind of construct in try_ctrl,
> because if you are only doing try() it shouldn't fail like this. Instead =
we can
> validate in the real s_ctrl, but I believe the downside is that it makes =
the
> error asynchronous when a request is used (perhaps that's actually wanted=
 ?)

You're right. This is not the best place to check size, since it can be
bypassed as sashiko bot find out.

My suggestion for v2 is to split this to two stages. Max width and height
check stays here, whereas buffer size check is moved to setup() callback.
=46ailing there it will mark buffer with V4L2_BUF_FLAG_ERROR.

What do you think?

Best regards,
Jernej

>=20
> Nicolas
>=20
> > +
> > +	return 0;
> > +}
> > +
> >  static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> > +	struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_=
ctx, hdl);
> > +
> >  	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS) {
> >  		const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> > +		u32 height;
> > =20
> >  		if (sps->chroma_format_idc !=3D 1)
> >  			/* Only 4:2:0 is supported */
> > @@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  		if (sps->bit_depth_luma_minus8 !=3D 0)
> >  			/* Only 8-bit is supported */
> >  			return -EINVAL;
> > +		height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> > +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> > +			height *=3D 2;
> > +		if (cedrus_check_pic_size(ctx,
> > +					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
> > +					  height))
> > +			return -EINVAL;
> >  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
> >  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> > -		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus=
_ctx, hdl);
> >  		unsigned int bit_depth, max_depth;
> >  		struct vb2_queue *vq;
> > =20
> > @@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  			/* Only 4:2:0 is supported */
> >  			return -EINVAL;
> > =20
> > +		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
> > +					  sps->pic_height_in_luma_samples))
> > +			return -EINVAL;
> > +
> >  		bit_depth =3D max(sps->bit_depth_luma_minus8,
> >  				sps->bit_depth_chroma_minus8) + 8;
> > =20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.c
> > index adc7f255d7cf..2521315abdb7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -29,11 +29,6 @@
> >  #define CEDRUS_DECODE_SRC	BIT(0)
> >  #define CEDRUS_DECODE_DST	BIT(1)
> > =20
> > -#define CEDRUS_MIN_WIDTH	16U
> > -#define CEDRUS_MIN_HEIGHT	16U
> > -#define CEDRUS_MAX_WIDTH	4096U
> > -#define CEDRUS_MAX_HEIGHT	2304U
> > -
> >  static struct cedrus_format cedrus_formats[] =3D {
> >  	{
> >  		.pixelformat	=3D V4L2_PIX_FMT_MPEG2_SLICE,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.h
> > index 8e1afc16a6a1..367e52158f01 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > @@ -22,6 +22,11 @@ struct cedrus_format {
> >  	unsigned int	capabilities;
> >  };
> > =20
> > +#define CEDRUS_MIN_WIDTH	16U
> > +#define CEDRUS_MIN_HEIGHT	16U
> > +#define CEDRUS_MAX_WIDTH	4096U
> > +#define CEDRUS_MAX_HEIGHT	2304U
> > +
> >  extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
> > =20
> >  int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>=20




