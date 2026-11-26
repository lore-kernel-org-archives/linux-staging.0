Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713755;
	b=pXiyefWQLriMS3VCV9UP9+TyDOLOJukH+nlWObchh50QXHfoo12xoKzgz7JnbIFwEiZU
	 fWk1uRMNvrtOm9y5GtzrM3nUu5eAXR3385MP567ya928O3zXXl4Ajvpl31sndjccD6zm0
	 ZWS4Wz7UXkdx01zDYTrFk7OrWiznsWOMSgO2XvJIGAxIL4D83qES8/ItQcEJx/xIl0tlB
	 uo6G/hdkhiKdcdYWR6hEKI3oWEJVuqQWPZBbcJ0+I+Wo7dpX6FKAHY4Owx95nTlZBc0y8
	 1MqmAMhHWN40F5U3TR9KnOUTJt9w4ECAUK/+HFY/yr+mng+e9ADxxObCtVKE8gKRPhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
	b=SnZPMQDvT0PtRiTWGFbVHSYFWjoy/oxv6V4EdWtTICSGVGgbgoPQl82BD3fxOpi7wVb2
	 He1g4+9Rg0iicVs5LVH+u9GuKaqkcAL3DYSr7g1lAaiMwoskK9t4vE068Jr/9PXUTdSkR
	 Aj/8ie7jeMRr7WCpQMg14NYnmJACrrnqE+FNdhUfZ9Qf+O39PjYjnYK/9VwBPiProBv9V
	 CCy3rF7hgdlhkvnKCv5f/Nv6dodpDN+q1reiOX+ff6GMqviqEk52mVQiUL4bgFS67Bwbp
	 sOV1L4O8e7HPIoPBy+pZ250afCGhLfZu1aT7CRWFzFpDd1ic4Scy4TUQNGUgQUhE6sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vk/UNtmH";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E16B606A323
	for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 17:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E16B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk/UNtmH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so58944295e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 09:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713754; x=1796318554; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=vk/UNtmHWjlz6hpox8WmYKPeYSoXqHSKnW2rEtCyt4Ms9g2Uzn4PK/LoKIhWxtAI12
         f7bJ+9oRdLKjdC2kN0mIGPSn1Mp+bvGzfLIwNcQzWhH3SXat09zI3X1kjYITPC0qWsOf
         q7A7Wu3WcyQv3kPW9+4Y68gyQOG9+1xqeeLsKB0jZZFD4hWLIVpIGImWvRcwZao7bZUW
         UH2354a3DyZl2YhKDG24CdoJQ43R7gtSEWNEgRCGfRLYyjyqyL1Hmg8de7mkrexzN6kn
         NSlL1BPN3biA4ZRZRGOJ25Xfruq5FYvbNaleHE9yfu4/XUZWpa94zsiuViRMMSN7D5d3
         iVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713754; x=1796318554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=C0Qqi4aUm2fvaEtdJ4T9n0VSUL8U4PG+x93GAconCd+0iEpf4KTDh4kVOLsiMBqZtg
         ElwKnfz4jnzMYwNiHlMH9pHpz0IZjUwiFUAO3G/x9tgw06XgGLXByKVd81LFvbWlMilW
         Sn+IINf1vRfeCZ0I648uDaI7crDpOL896q+7q1iREovjrpwdEi4HJPGqOrLInjhIBVbp
         Q2IqOVp1OQCiLB3eR3hzAJceqTXltxqj0HbYLRwC81tN4zFehczRRL6XzcKG0VHE+7lB
         K/qkP+MqfDkEdkLIITN9RyUkv8Z1ttbPN+6x21aMUIadVkGVQu/7kl3vQJk2BYHjQMkf
         mIPg==
X-Forwarded-Encrypted: i=1; AL+hErGf+Cjabme2Ergmib/73epX+Kaj6anm19WXXayYmwdWsakEo28XOm6vOMQRdMMWsMos2DCpVYoTOWw2oSTv@lists.linux.dev
X-Gm-Message-State: APuU4Z+h7sea/bl5Cj/lCKY3fNFoA5b+Udi7q36n1UjpkiG0dppv23Ql
	MeD2o1JkWC1D5ohBNP3NiZO7Kmf5+YRT6xACmH9WFigLnSZZh15yk2Mw
X-Gm-Gg: AZFdTZdatXxH3LykJUmv+KWAuv0B3pRxrFfVtF9tV+ZSpNmJn9qhJYTQNMlTyGcBH4v
	fGW0Ww798ioEA0W+evHAkPfakX0SvXaqXk6XCzywiU4MDihhbs9aL/qNn4Dp/p7uqWUdpmmEhRd
	JC42pGwIMGdcsRkEH6dlzXNsdmRfSTiBckfOIq9mHIFK/hp6Co6nTjnSX8JYD0iREmVDipulQ17
	ckXWVbWE37R28wgAFH+FjHwS62BKqQVc35jdSuIrUuu7BHLHq057Y4XmfshMujVnu/Ke07onBa9
	pnuXfPRzQ1uYLUZVxcZrm4Nep1OloJgjiPh8hveDmid7mOsWIBHjK+yPNsE0UkkdYQehYFh1Bvg
	AqdJcCfnxTWSURYoY9M9PkcxcC9OUkmGtI1rGRYxO73+xaqdI7cM8Z9DSS0CozSPi84PzhBmnhe
	a1dyw0z9ny4mn162jrR790YgifHjYH/69M5Q8lb+a45xW92W7U8VccEYSjLRVt67SG1SJn7w1qJ
	X8EIguXWACwVUzp0grJi/M8uXV1IXAu6GlQk6xuugR1eZgyt5pCCYac0ReV8DP07FZXkgDDGnES
	QnrqBBMiXGdhuo1AE4LbhSn8QujUymWm1D68i5vFEDutk3ji3MvQtt8QsqkTIKnYPmeD8Cx5/nX
	B88Qaw3P8dr8l75873VXzeEHN4xeWhSqzY+1KF5ggtRbm1072l7Ys0phwfWlxm3JN6sMy3FBgkn
	cfULopvAkUnKuo7j/YN6YQeGmT/1i737LjrkRk3EaocKiFpVF7Nt3fs5hu2bmSRo7W2FjDDQ0dJ
	Qe670C2TCjhFfsF3nWxNI48ylfOYDInuMl7bAd13c6ngSoMkQ7agz7je3TBS8Q=
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr450092465e9.25.1795713753675;
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm348317715e9.0.2026.11.26.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@kernel.org>, aiyengar1990@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 2/2] media: cedrus: report only the picture as capture payload
Date: Thu, 26 Nov 2026 18:22:32 +0100
Message-ID: <KjxG6AExQdOXUtc6OkeVCQ@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
References:
 <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
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

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:48 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> For 10-bit H.265 the driver appends the low 2 bits of every sample to
> the capture buffer and counts them in sizeimage (extra_cap_size).
> buf_prepare reports the whole sizeimage as bytesused, so userspace that
> copies the payload gets the private plane as part of the picture.
>=20
> Report only the picture; sizeimage stays the allocation size.
>=20
> Fixes: 65429ba82572 ("media: cedrus: h265: Support decoding 10-bit frames=
")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index 9b2d24e77fdb..b7e0cbe548e6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -511,8 +511,15 @@ static int cedrus_buf_prepare(struct vb2_buffer *vb)
>  	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
>  	 * it to buffer length).
>  	 */
> -	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> -		vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
> +		unsigned int payload =3D pix_fmt->sizeimage;
> +
> +		if (ctx->current_codec->extra_cap_size)
> +			payload -=3D ctx->current_codec->extra_cap_size(ctx,
> +								     pix_fmt);
> +
> +		vb2_set_plane_payload(vb, 0, payload);
> +	}
> =20
>  	return 0;
>  }
>=20
>=20




