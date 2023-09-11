Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED433EE
	for <linux-staging@lists.linux.dev>; Mon, 11 Sep 2023 16:36:23 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-986d8332f50so622213166b.0
        for <linux-staging@lists.linux.dev>; Mon, 11 Sep 2023 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694450181; x=1695054981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn6ORcYdF7wmn9zYudPCVDeUReDbRM6yHR4pM4CXkGQ=;
        b=A5h5iELdYOVFGT9btpTKcLHswXUnFbkEojrYH7j3lz6/z5q9D8+spGB6NJdeuU9FSt
         k/n90emrJxR8i7iDszK91DANJQxxmMe3jDAdCudQGd4AJ5fkEEgPL5xF2zEw41m5R5VV
         H9TblNpFCPAmqPtl6HIuU7TLuyYfhQ+XISL0ohQqc2b34DEuHbf9X5TACLcqZZI9hXdf
         AgS5vIjkmRITCkJhqbDHGJk5VDOZZtFDw03XAUtbobA2POo/NhIvHYasfLXi+CdL2uyu
         EY4jI3MVveZUJYVH2x6IMymqVsaxt++VbNVUB9TOiVVNdiDnHLsjJAjTSrfo+v5u7mXE
         ITkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694450181; x=1695054981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn6ORcYdF7wmn9zYudPCVDeUReDbRM6yHR4pM4CXkGQ=;
        b=TdBOQP4icSgj7QDCfK12NTUgVxmYzb7TqtAXGC0RwSEJcmsFMzkCV881i87D0ql6Dc
         zyG3KXHmThiAIhpsgcOna4z5CHxNJBodADOMi/v/c25o5zolV1ZZ2o+DviiXe8SNuSYW
         242GqOchtAX/jdDM2fTvk41J0F6iXGkuUl+7mdmp1ZkAjG84KrOQAAo0005DifadEzwd
         MtBwGXyy8Ha7zSVTppPlMqbMWvu9lI2u/7qiaA2hS9WL9MXmOpkuPQAeKmqHr4MZNwxq
         6I697r+rxS/yOWXcGoWkhg/r2jUNBAHCTuOc+u/pP7EoFCAKb7ASWgoneJZB77Zd7yqh
         lL1Q==
X-Gm-Message-State: AOJu0Yzx+Jsd3rycHdKtZ7qCuyWUuhCuz0T9IYxGjMCPqSCikvYAnehl
	SNRljtbH6qWkueurYIgC570=
X-Google-Smtp-Source: AGHT+IEZkDEwJehDR4fKggLpjoJhnXiAupV9qorq7MLXFhFfk7fRQqvtYUP3Mho6rsQ4juPA6IGloQ==
X-Received: by 2002:a17:906:224a:b0:9a9:e6c3:ad28 with SMTP id 10-20020a170906224a00b009a9e6c3ad28mr9042772ejr.69.1694450181242;
        Mon, 11 Sep 2023 09:36:21 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id h17-20020a170906261100b00999bb1e01dfsm5534149ejc.52.2023.09.11.09.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 09:36:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
Subject:
 Re: [PATCH v6 14/18] media: verisilicon: vp9: Use destination buffer height
 to compute chroma offset
Date: Mon, 11 Sep 2023 18:36:19 +0200
Message-ID: <3248154.aeNJFYEL58@jernej-laptop>
In-Reply-To: <7da0a2ab-032a-9de9-e136-58f973238c5b@collabora.com>
References:
 <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <4856958.31r3eYUQgx@jernej-laptop>
 <7da0a2ab-032a-9de9-e136-58f973238c5b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 11. september 2023 ob 10:55:02 CEST je Benjamin Gaignard=20
napisal(a):
> Le 10/09/2023 =C3=A0 15:21, Jernej =C5=A0krabec a =C3=A9crit :
> > Hi Benjamin!
> >=20
> > Dne petek, 01. september 2023 ob 14:44:10 CEST je Benjamin Gaignard
> >=20
> > napisal(a):
> >> Source and destination buffer height may not be the same because
> >> alignment constraint are different.
> >> Use destination height to compute chroma offset because we target
> >> this buffer as hardware output.
> >>=20
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> >> ---
> >>=20
> >>   drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
> >>   1 file changed, 1 insertion(+), 3 deletions(-)
> >>=20
> >> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c index
> >> 6db1c32fce4d..1f3f5e7ce978 100644
> >> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> >> @@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ctx,
> >> const struct v4l2_ctrl_vp9_ static size_t chroma_offset(const struct
> >> hantro_ctx *ctx,
> >>=20
> >>   			    const struct v4l2_ctrl_vp9_frame
> >=20
> > *dec_params)
> >=20
> >>   {
> >>=20
> >> -	int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;
> >> -
> >> -	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
> >> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth /
> >=20
> > 8;
> >=20
> > Commit message doesn't mention bit_depth change at all. While I think
> > there is no difference between dec_params->bit_depth and ctx->bit_depth,
> > you shouldn't just use ordinary division. If bit_depth is 10, it will be
> > rounded down. And if you decide to use bit_depth from context, please
> > remove dec_params argument.
>=20
> I will change this patch and create a helpers function for chroma and mot=
ion
> vectors offsets that VP9 and HEVC code will use since they are identical.
> I don't see issue with the division. If you have in mind a solution please
> write it so I could test it.

Solution is same as the code that you removed:
int bytes_per_pixel =3D dec_params->bit_depth =3D=3D 8 ? 1 : 2;

Or alternatively:
int bytes_per_pixel =3D DIV_ROUND_UP(dec_params->bit_depth, 8);

Consider bit_depth being 10. With old code you get 2, with yours you get 1.

Best regards,
Jernej

>=20
> Regards,
> Benjamin
>=20
> > Best regards,
> > Jernej
> >=20
> >>   }
> >>  =20
> >>   static size_t mv_offset(const struct hantro_ctx *ctx,




