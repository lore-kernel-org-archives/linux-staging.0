Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644643;
	b=jvbG1ithrMlTv5gtMzKilvlUNAGVDZBvWT2J2TLSqBKeOBdauH9JnkzyJWYpJD1DTyBG
	 /k3CD4ozQuuPThp+BtNKn1ePRNeuw75fTXLhPA4K0l8NitB7bLcm1oulUFUvoN4V7AjNf
	 zEPNHcN1AzHQUrCvzr/B4t8TgqA47SZnwS+QJApwNQ5VoJiE5nSF5/nmo0jYKQlYpvVd3
	 pZg9Z3fS/6GYV2hhXFogw85lMc+B/w/d0ZED7/7HYUV2Q1HB46qMKz13XLIXCAiiZKtlu
	 bPESv76asB2kzayAYlBLv0QooV1CiZ9bZYBrBa/o5vUNUHdoY/FDNrQkv4P4mcq07YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644643;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=p6CVl7gF5SO+M3azMcnLtDCMGbFMXlYSv3PbyorJeCU=;
	b=v5vdjbJXT92z2vN2cG90Dj2JmQF8fwiLL32JOtho99mXFpV2jAYEhMxQISoBnwknHjhC
	 ipq9Pjk/ijU52vaha+fgLHLhw2MpgwwfAX+a/bQ00m4+3pf297TBaluPWhyESqHAapQ9V
	 kQ8uxIDCxn2wJw2ra2PX6PfWYJXzKzQ4f30fVIr+vVGm88fKiJ3YHhZuoO/E3cXOTh+cH
	 by75L9unR4IQXKlaMQA624RfshR+By7iXsYosl5mcF2zJwGBUV3726Tk/CaO6ud5v8Czk
	 aCjuLSQGl/i1TANO1ABVdy91cr9AHlOtji+Xn32+mI61iEJqxhEunJnvonDF9LWR6yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J5yVG86I;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3CE606A32D;
	Mon,  2 Nov 2026 18:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3CE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J5yVG86I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793644640;
	bh=1b1gqyZJY4nCTqGVoGeaoE3im0FP2/g5iJwa3Uj9fVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=J5yVG86IE24/MENFsZ/R4o116/XhS/TtWt6KiEt809tw3Poxn3GZjRX5Lu1e26SbB
	 ui6agSC48xqWTAu/XkNzTuM+EkkbMICnhz4TIwBJmCvA+UVc/Y9r21pZ4GqyLPFIym
	 WvJliKogjxC6AqGhlXwSpMmzxm6pHEuDmPvupobkqjNvpCHMQ+rdERJQF9vW/8mCGl
	 JCRJtvySljm1JQudgV9SFF28nsR21TjMZCpg87yzwDO9StYvhMO07BmP7njO6UJUno
	 tG9oG0xglpJvtisvvyFTRto2na/TY797MLig7PigCPfi+1BSXjNIVwod+d+ArGMMR6
	 TYATCLSZw8odg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D411A17E07F6;
	Mon, 02 Nov 2026 19:37:18 +0100 (CET)
Message-ID: <f52dbe76bc9434c71f9f0c8fb2587a93cb4e0860.camel@collabora.com>
Subject: Re: [PATCH 01/10] staging: media: cedrus: free MV-col buffers in
 buf_cleanup
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 13:37:17 -0500
In-Reply-To: <20261102170303.1973892-2-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-2-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-ouXYUpHo3ejCdJE3I2Bq"
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


--=-ouXYUpHo3ejCdJE3I2Bq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> v4l2_m2m_ctx_release() releases the CAPTURE queue before the OUTPUT
> queue. When userspace closes the file handle without STREAMOFF, the
> CAPTURE buffers are already gone by the time the OUTPUT stop_streaming
> calls the codec stop() callback, so the per-buffer H.264/HEVC MV-col
> buffers are never freed. This is easily reproduced by killing a player
> during H.264 or HEVC decoding. Each killed 1080p session leaks about
> 2.3 MiB.
>=20
> Add a buf_cleanup codec op, called from the vb2 buf_cleanup of the
> CAPTURE queue, and free the MV-col buffer there. stop() keeps using the
> same helper.
>=20
> Fixes: fec94f8c9954 ("media: cedrus: h264: Optimize mv col buffer allocat=
ion")
> Fixes: 0ee952c2f484 ("media: cedrus: h265: Associate mv col buffers with =
buffer")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 28 +++++++++++--------
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 +++++++++++--------
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 10 +++++++
>  4 files changed, 43 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index c4b1217c14b6..54f867949fba 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -167,6 +167,7 @@ struct cedrus_dec_ops {
>  	int (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
>  	int (*start)(struct cedrus_ctx *ctx);
>  	void (*stop)(struct cedrus_ctx *ctx);
> +	void (*buf_cleanup)(struct cedrus_ctx *ctx, struct cedrus_buffer *buf);
>  	void (*trigger)(struct cedrus_ctx *ctx);
>  	unsigned int (*extra_cap_size)(struct cedrus_ctx *ctx,
>  				       struct v4l2_pix_format *pix_fmt);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index fc54d993b11f..892193c12b2f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -647,10 +647,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx=
)
>  	return ret;
>  }
> =20
> +static void cedrus_h264_buf_cleanup(struct cedrus_ctx *ctx,
> +				    struct cedrus_buffer *buf)
> +{
> +	if (buf->codec.h264.mv_col_buf_size > 0) {
> +		dma_free_attrs(ctx->dev->dev,
> +			       buf->codec.h264.mv_col_buf_size,
> +			       buf->codec.h264.mv_col_buf,
> +			       buf->codec.h264.mv_col_buf_dma,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
> +
> +		buf->codec.h264.mv_col_buf_size =3D 0;
> +	}
> +}
> +
>  static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> -	struct cedrus_buffer *buf;
>  	struct vb2_queue *vq;
>  	unsigned int i;
> =20
> @@ -662,17 +675,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>  		if (!vb)
>  			continue;
> =20
> -		buf =3D vb2_to_cedrus_buffer(vb);
> -
> -		if (buf->codec.h264.mv_col_buf_size > 0) {
> -			dma_free_attrs(dev->dev,
> -				       buf->codec.h264.mv_col_buf_size,
> -				       buf->codec.h264.mv_col_buf,
> -				       buf->codec.h264.mv_col_buf_dma,
> -				       DMA_ATTR_NO_KERNEL_MAPPING);
> -
> -			buf->codec.h264.mv_col_buf_size =3D 0;
> -		}
> +		cedrus_h264_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
>  	}
> =20
>  	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> @@ -710,5 +713,6 @@ struct cedrus_dec_ops cedrus_dec_ops_h264 =3D {
>  	.setup		=3D cedrus_h264_setup,
>  	.start		=3D cedrus_h264_start,
>  	.stop		=3D cedrus_h264_stop,
> +	.buf_cleanup	=3D cedrus_h264_buf_cleanup,
>  	.trigger	=3D cedrus_h264_trigger,
>  };
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..6c643862ab73 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -858,10 +858,23 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx=
)
>  	return 0;
>  }
> =20
> +static void cedrus_h265_buf_cleanup(struct cedrus_ctx *ctx,
> +				    struct cedrus_buffer *buf)
> +{
> +	if (buf->codec.h265.mv_col_buf_size > 0) {
> +		dma_free_attrs(ctx->dev->dev,
> +			       buf->codec.h265.mv_col_buf_size,
> +			       buf->codec.h265.mv_col_buf,
> +			       buf->codec.h265.mv_col_buf_dma,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
> +
> +		buf->codec.h265.mv_col_buf_size =3D 0;
> +	}
> +}
> +
>  static void cedrus_h265_stop(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> -	struct cedrus_buffer *buf;
>  	struct vb2_queue *vq;
>  	unsigned int i;
> =20
> @@ -873,17 +886,7 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
>  		if (!vb)
>  			continue;
> =20
> -		buf =3D vb2_to_cedrus_buffer(vb);
> -
> -		if (buf->codec.h265.mv_col_buf_size > 0) {
> -			dma_free_attrs(dev->dev,
> -				       buf->codec.h265.mv_col_buf_size,
> -				       buf->codec.h265.mv_col_buf,
> -				       buf->codec.h265.mv_col_buf_dma,
> -				       DMA_ATTR_NO_KERNEL_MAPPING);
> -
> -			buf->codec.h265.mv_col_buf_size =3D 0;
> -		}
> +		cedrus_h265_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
>  	}
> =20
>  	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> @@ -918,6 +921,7 @@ struct cedrus_dec_ops cedrus_dec_ops_h265 =3D {
>  	.setup		=3D cedrus_h265_setup,
>  	.start		=3D cedrus_h265_start,
>  	.stop		=3D cedrus_h265_stop,
> +	.buf_cleanup	=3D cedrus_h265_buf_cleanup,
>  	.trigger	=3D cedrus_h265_trigger,
>  	.extra_cap_size	=3D cedrus_h265_extra_cap_size,
>  };
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index ad4ec3490775..adc7f255d7cf 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -560,6 +560,15 @@ static void cedrus_stop_streaming(struct vb2_queue *=
vq)
>  	cedrus_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
>  }
> =20
> +static void cedrus_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct cedrus_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
> +	    ctx->current_codec && ctx->current_codec->buf_cleanup)
> +		ctx->current_codec->buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
> +}
> +
>  static void cedrus_buf_queue(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> @@ -579,6 +588,7 @@ static const struct vb2_ops cedrus_qops =3D {
>  	.queue_setup		=3D cedrus_queue_setup,
>  	.buf_prepare		=3D cedrus_buf_prepare,
>  	.buf_queue		=3D cedrus_buf_queue,
> +	.buf_cleanup		=3D cedrus_buf_cleanup,
>  	.buf_out_validate	=3D cedrus_buf_out_validate,
>  	.buf_request_complete	=3D cedrus_buf_request_complete,
>  	.start_streaming	=3D cedrus_start_streaming,

--=-ouXYUpHo3ejCdJE3I2Bq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujYXQAKCRDZQZRRKWBy
9MaYAQC7af7M/iQu3vA13UWDWSJwsgChRilK+FyGvc9WhTfadgD/f5TO+6S3+le0
wKsjCcOB2ltOjjW/zIOE0KaezaRYrgc=
=+qzR
-----END PGP SIGNATURE-----

--=-ouXYUpHo3ejCdJE3I2Bq--
