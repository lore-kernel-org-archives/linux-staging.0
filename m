Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD27460
	for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 17:35:07 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-101b4f9e825so172623fac.5
        for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TvnWQVWBqHCFvzeuhdV7clHAx5dh+MQYePzQD0+y7Uc=;
        b=H+O2K3BiOmZ+iqTzP8zSGWs+YhD8kbBM9gCO4EZmWjmuqQ/9IIrumNFeCy//6VjU1w
         yM6Q02DG/+NgZ80SHDKhMAbHXn9b6ohS/6PY13azn70NcyE6uqmHRstHJuNDoH3Un1Ph
         37YXniXZA3pAShQCYFnsyRE26Im/37hnjk+v0HaZ7R9t7wEZ1G5eS9ISp7JgISS7I2hN
         A9anibvuevrFfzTUSdar4tlT8kFla1X/nfr02qpm1Bj09lMFURTKRufmPUwlY2MjRZmy
         KG++nNE8wBAwIkQMYixHiXkCRlaAb/+iz/QfRiAHDg4laMF0zX7xn13/RzBQnBHr9917
         wDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TvnWQVWBqHCFvzeuhdV7clHAx5dh+MQYePzQD0+y7Uc=;
        b=UeGV42zP/q5x5DRWyxOtTe4fv5jc88j384sLWu+LEIqw8OPhBZrZOlTC0h/ANEwR26
         Ac1z223QiNae0WGey4r0uyq08jIQ+D7ywAehBrbn5z+22TFVfQEwRW5gqISh+Qv4DxO1
         8s6xv97rcb/4XGrYqyecQpNe3a8JCNHClHXQZ9P3deSwooMSV4Bw0q4+ejl4UfYB8jPo
         p+GWbgxGpe4BEoPBwOvgyReRcyWASnzDlU+r7gV3md1khCtbcdaijhPErWuesKaA57pZ
         OLWBsLimPcnsZijf2kB8T/IcOtlfnjB+UZ1nL8d8UQwfs9H2UVnrYHlOFuAEOwz625HM
         oK4g==
X-Gm-Message-State: AJIora9/waZ2243hmH+lUmUvWFYXoVERny4ivy9lOrUQlqalofTlw1Oy
	SQ6wm+BztJ7H6exqvY615G4VUQ==
X-Google-Smtp-Source: AGRyM1v7vHSixqg0jIsfWA3Xuzr25gaoV363cLZK0Dvg5ZZL2eE9La/e2ncLhw7ZXvNyB6nXsNZz3g==
X-Received: by 2002:a05:6870:cd02:b0:108:a476:f2ac with SMTP id qk2-20020a056870cd0200b00108a476f2acmr7067746oab.184.1656610507002;
        Thu, 30 Jun 2022 10:35:07 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id o7-20020a056871078700b000e686d1386dsm14181497oap.7.2022.06.30.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:35:06 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:35:00 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, mripard@kernel.org,
	paul.kocialkowski@bootlin.com, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH 4/7] media: hantro: postproc: Configure output regs to
 support 10bit
Message-ID: <Yr3exPUv0OVKgwlk@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-5-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-5-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Fri, Jun 17, 2022 at 01:57:59PM +0200, Benjamin Gaignard wrote:
> Move output format setting in postproc and make sure that
> 8/10bit configuration is correctly set.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 2 --
>  drivers/staging/media/hantro/hantro_postproc.c    | 7 ++++++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 8407ad45b7b7..c929f2974a01 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -167,8 +167,6 @@ static void set_params(struct hantro_ctx *ctx)
>  	hantro_reg_write(vpu, &g2_bit_depth_y_minus8, sps->bit_depth_luma_minus8);
>  	hantro_reg_write(vpu, &g2_bit_depth_c_minus8, sps->bit_depth_chroma_minus8);
>  
> -	hantro_reg_write(vpu, &g2_output_8_bits, 0);
> -
>  	hantro_reg_write(vpu, &g2_hdr_skip_length, compute_header_skip_lenght(ctx));
>  
>  	min_log2_cb_size = sps->log2_min_luma_coding_block_size_minus3 + 3;
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index a0928c508434..09d8cf942689 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -114,6 +114,7 @@ static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
>  	struct hantro_dev *vpu = ctx->dev;
>  	struct vb2_v4l2_buffer *dst_buf;
>  	int down_scale = down_scale_factor(ctx);
> +	int out_depth;
>  	size_t chroma_offset;
>  	dma_addr_t dst_dma;
>  
> @@ -132,8 +133,9 @@ static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
>  		hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
>  		hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma + chroma_offset);
>  	}
> +
> +	out_depth = hantro_get_format_depth(ctx->dst_fmt.pixelformat);
>  	if (ctx->dev->variant->legacy_regs) {
> -		int out_depth = hantro_get_format_depth(ctx->dst_fmt.pixelformat);
>  		u8 pp_shift = 0;
>  
>  		if (out_depth > 8)
> @@ -141,6 +143,9 @@ static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
>  
>  		hantro_reg_write(ctx->dev, &g2_rs_out_bit_depth, out_depth);
>  		hantro_reg_write(ctx->dev, &g2_pp_pix_shift, pp_shift);
> +	} else {
> +		hantro_reg_write(vpu, &g2_output_8_bits, out_depth > 8 ? 0 : 1);
> +		hantro_reg_write(vpu, &g2_output_format, out_depth > 8 ? 1 : 0);
>  	}
>  	hantro_reg_write(vpu, &g2_out_rs_e, 1);
>  }
> -- 
> 2.32.0
> 
