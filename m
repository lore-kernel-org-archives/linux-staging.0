Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236C87477
	for <linux-staging@lists.linux.dev>; Sun, 10 Sep 2023 13:21:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31f6ddb3047so3357521f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Sep 2023 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694352105; x=1694956905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3yiYILhEuCNUQeqPmsTOJF5pdnP1MyjjDZaseeFDik=;
        b=N4VPaUTFgoomwQULqPBhylfFYcbCgb3ftUygPooMbbsMuC65ejbP6nWjntd1JU8gGn
         8jMa5YBEiHpZpu9MRopzOOeZ2D29AzjwlBBK5P3dXA6PLoUUgkDNsU9sEDgGGxGvUVLi
         DTPsdDHgZzphhQzGrSvrteycqCC6bUsSig1BQUey6gLW99xF9qALeXyw+C3wMZXC1R3O
         G4LjKyB7yj+awYkvqo8LbvaEscGLlxgTbQMmlsm7VuUm2Rq6Y9QBHBy9GqWZidA2BmqF
         c1mKntkjyORC7q0eCbIZtaNmZD1gKibe54ubO5J28Ex0YVPcKZkv2P6E8O8iUXboQzbf
         vyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694352105; x=1694956905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3yiYILhEuCNUQeqPmsTOJF5pdnP1MyjjDZaseeFDik=;
        b=xBs0Jgq4SDlNzuR5v3DasROHISRh6UJ7vLfo37L2y69mNMrm2TsqEckOO4bxD233gk
         Ixy3N/r+z1B8Ix+dHjqOhrKBdD2Oe2NgJpOgADv8OGGPPwIirtsHD1cTEsxDRfr2ZCgG
         mZLiSVIlaogP0En9P5PC7oFWhGf4l5ES3pQm2AK+Fe3Jk4ctcVaXXF71kV2VAklM5Izk
         TeQv7AWMSLhIZLK/IVmJ2I51Y7aKWyWjZQbN7fvi0pU+ZoctAhKqqy0IlL9SX6RUp6TO
         1PUYKMU8nP0zo0kS9Qh1ruWIydc/Rr5NUhEKPe/2J1IiaemT5Io/J+BrS4i7gdoO2ynz
         hGRQ==
X-Gm-Message-State: AOJu0YyNmA7bmaxXFKU0m0NVxbk70t3tya2dk86DM8efW9fnjVdKQ5LR
	D04oq/dvlBRH4UWWOJoCM7c=
X-Google-Smtp-Source: AGHT+IHBW5u0oYJcRGEvrYuxS4KJf+ofoX9BINJgRqjlcAtgbTBDPybxSD7j2EjBbYgPCuTfVGTdFA==
X-Received: by 2002:a5d:4809:0:b0:317:73d3:441a with SMTP id l9-20020a5d4809000000b0031773d3441amr5628694wrq.46.1694352104814;
        Sun, 10 Sep 2023 06:21:44 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d22-20020aa7ce16000000b005233609e39dsm3358895edv.30.2023.09.10.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 06:21:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject:
 Re: [PATCH v6 14/18] media: verisilicon: vp9: Use destination buffer height
 to compute chroma offset
Date: Sun, 10 Sep 2023 15:21:41 +0200
Message-ID: <4856958.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230901124414.48497-15-benjamin.gaignard@collabora.com>
References:
 <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <20230901124414.48497-15-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Benjamin!

Dne petek, 01. september 2023 ob 14:44:10 CEST je Benjamin Gaignard 
napisal(a):
> Source and destination buffer height may not be the same because
> alignment constraint are different.
> Use destination height to compute chroma offset because we target
> this buffer as hardware output.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
> ---
>  drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c index
> 6db1c32fce4d..1f3f5e7ce978 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ctx, const
> struct v4l2_ctrl_vp9_ static size_t chroma_offset(const struct hantro_ctx
> *ctx,
>  			    const struct v4l2_ctrl_vp9_frame 
*dec_params)
>  {
> -	int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
> -
> -	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 
8;

Commit message doesn't mention bit_depth change at all. While I think there is 
no difference between dec_params->bit_depth and ctx->bit_depth, you shouldn't 
just use ordinary division. If bit_depth is 10, it will be rounded down. And 
if you decide to use bit_depth from context, please remove dec_params 
argument.

Best regards,
Jernej

>  }
> 
>  static size_t mv_offset(const struct hantro_ctx *ctx,




