Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9A31FD3
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 00:25:02 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id b188so8561783oia.13
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 17:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1G2fhWHXOGUibX5yg94QDD822pn32q0wbjaup8hf5s4=;
        b=aLHLHrHcfTvZFQ2F5TbC+6hZWBAhBotkewKH/LbsHTuceDjZOzeR50cv03+s+fBFd3
         8K/70HPL75wiTqDmf/8c+xMQC/mw5pf0P6Kf4P27zwfLxs9lzipCxbRT43cNT10uJ3Ss
         7FTO595x4WxwuhkK2j1PgvdxVr1e8LKwOVBr/rNROIbJP0LVFI43X7WdrZDcetVxi9Ov
         gEvj4N7DYpNtrRhZmG2PWwL+cwqqZKsErYqAhPQlZEdNVO901BmclC85mDR0LdCmwKuS
         NpszSNwMkDbd1D5CAxxyPcQwuxeq3A9l7R3Pf1+pxTG65tfCJuPb1TxJOSBdO4tp/u09
         HuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1G2fhWHXOGUibX5yg94QDD822pn32q0wbjaup8hf5s4=;
        b=C1jHqHs39x7YayG0yUSC3KwfLNdyN63oSpJ0DfOY3qSFtia3zHkhnMvnVpNs9HXuJG
         fbuuwX/lboqXqG2RcUyLADcEtlMvzOnFzVYHDZOuJ7GFDeRikT8rwso51bjjK7kh3nwQ
         vvyk81XbfUxj+zU9YGsGhxWAK1NSZGY/q+KeX9joXE4flb3cUJYYsqOXBm4BX/nhmGZd
         6C7qNcc3JqsM3tcSTRer8/hF7VOu9YlgnkBIyTfatQml+NsfukPgklA25uKMbV7gl+Nx
         e4Cd0FIAvuTARbOjvXlhD2idaTIfMqKU+5U5m65WLaLRhZ7cBtTVC14uEo23pBu9tUBx
         Q9/A==
X-Gm-Message-State: AOAM530xJxFwKUetBMvNYI46cmQ8aGOWe7xBgn5PFIVv129jxfog+349
	fWLz6zXPV/xv+wh5iLQbMImh7A==
X-Google-Smtp-Source: ABdhPJxWaiImogjvxj3LL5WNbNyYGXaY8CHBqh5rfxUrNTI1rxj34lIu0EqgyDqI9lO9zzb5YhWbcQ==
X-Received: by 2002:a05:6808:1819:b0:2d9:beb5:7fa8 with SMTP id bh25-20020a056808181900b002d9beb57fa8mr9184282oib.68.1649031901583;
        Sun, 03 Apr 2022 17:25:01 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id q16-20020a9d4b10000000b005b22b93d468sm3926610otf.74.2022.04.03.17.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 17:25:00 -0700 (PDT)
Date: Sun, 3 Apr 2022 21:24:53 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, nicolas@ndufresne.ca,
	hverkuil-cisco@xs4all.nl, gregkh@linuxfoundation.org, wens@csie.org,
	samuel@sholland.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 5/8] media: hantro: postproc: Fix legacy regs
 configuration
Message-ID: <Yko61YA2DpHi7/4B@eze-laptop>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
 <20220227144926.3006585-6-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227144926.3006585-6-jernej.skrabec@gmail.com>

On Sun, Feb 27, 2022 at 03:49:23PM +0100, Jernej Skrabec wrote:
> Some postproc legacy registers were set in VP9 code. Move them to
> postproc and fix their value.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/staging/media/hantro/hantro_g2_vp9_dec.c |  8 --------
>  drivers/staging/media/hantro/hantro_postproc.c   | 10 ++++++++++
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> index 91c21b634fab..c9cb11fd95af 100644
> --- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> @@ -515,16 +515,8 @@ static void
>  config_bit_depth(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params)
>  {
>  	if (ctx->dev->variant->legacy_regs) {
> -		u8 pp_shift = 0;
> -
>  		hantro_reg_write(ctx->dev, &g2_bit_depth_y, dec_params->bit_depth);
>  		hantro_reg_write(ctx->dev, &g2_bit_depth_c, dec_params->bit_depth);
> -		hantro_reg_write(ctx->dev, &g2_rs_out_bit_depth, dec_params->bit_depth);
> -
> -		if (dec_params->bit_depth > 8)
> -			pp_shift = 16 - dec_params->bit_depth;
> -
> -		hantro_reg_write(ctx->dev, &g2_pp_pix_shift, pp_shift);
>  		hantro_reg_write(ctx->dev, &g2_pix_shift, 0);
>  	} else {
>  		hantro_reg_write(ctx->dev, &g2_bit_depth_y_minus8, dec_params->bit_depth - 8);
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 1a76628d5754..11ae663f11b7 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -113,6 +113,16 @@ static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
>  
>  	hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
>  	hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma + chroma_offset);
> +	if (ctx->dev->variant->legacy_regs) {
> +		int out_depth = hantro_get_formath_depth(ctx->dst_fmt.pixelformat);
> +		u8 pp_shift = 0;
> +
> +		if (out_depth > 8)
> +			pp_shift = 16 - out_depth;
> +
> +		hantro_reg_write(ctx->dev, &g2_rs_out_bit_depth, out_depth);
> +		hantro_reg_write(ctx->dev, &g2_pp_pix_shift, pp_shift);
> +	}
>  	hantro_reg_write(vpu, &g2_out_rs_e, 1);
>  }
>  
> -- 
> 2.35.1
> 
