Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE397A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 00:16:31 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id q189so8566326oia.9
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 17:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sDeGF+MYx4+61NVMd2dbBEp/m5RR7DyRrVH6YT77uYY=;
        b=8FpXIGs0demQMcF9wi+HglWWgziC9NDgvpiniQ4bKSgMVGNPvEIhbaNVe74GaFGxXz
         AzyXQDBrUgmXW0I7c+4PfPkGrlZt14dFiHByNfcaB5ZHtigjt2351EUvpfQhpwl2iYvs
         YK/kRH6XyM9r+5wuPcSLZZ3a7pvZrRdqbWv9JaDTBTwzmY2qvN8XAd1SYKigWClPx/mi
         o0GH09HKV1TDyt1I4Wfd/T2epQmjiQflvLNwzTq4XBU1pVLsweaxLNT6cb+DiinVMIPt
         d2QE3iccjlYOyKjWB3x++6ZajTyu1+SbJZ3sRLxyPCDkNCEE39FgMCGRSdzTeP/mqoIp
         MPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sDeGF+MYx4+61NVMd2dbBEp/m5RR7DyRrVH6YT77uYY=;
        b=3LAvHIMElr9l7Nlx8X8hWKCHqQlSNrcCBl/MyzI6VF1kBS7izhHn6QOwb0CgAX2CA/
         4G+e9E/+pKTFRrfNvjjXyksCQBL4uy6USwJLtpGE2I5sALVB/p+c1cEEqWJOqSeru/9V
         2aasR/tYji9+powp2C4UXOJg0qh6iUB9fTZCMB95do+spNWtvWomoCKYZ6lvnnhFJNBX
         KVIVM2yPh/2Ax9OvbZd52EcROoippakQ7GlsrvqI0LitIkIxr1RHWkxqr1qg1/1qnaER
         Yxe4GLdOldW/fkGnjc1CyB7oGDhmbHldIi1l7iwdVwCeb4D9MPorXTyeHENFTbKtGzKV
         oJbg==
X-Gm-Message-State: AOAM5338SlH4Avn1MQLWTLGTF/OaK4aKsyna5eOcL2SLTGJg9L0vKh7E
	K54/puXZmnq7mpXvZDuIHuQW4Q==
X-Google-Smtp-Source: ABdhPJxihSPqr2QYA2oL/jcuxEUYVVKdwk8aKwxld6QbdGF7LeA3ST+QQ7UwApuCRdUE/4mhD9DORQ==
X-Received: by 2002:a05:6808:1207:b0:2da:7087:8685 with SMTP id a7-20020a056808120700b002da70878685mr9251992oil.167.1649031390668;
        Sun, 03 Apr 2022 17:16:30 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id w22-20020acaad16000000b002d9c98e551bsm3647786oie.36.2022.04.03.17.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 17:16:30 -0700 (PDT)
Date: Sun, 3 Apr 2022 21:16:23 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, nicolas@ndufresne.ca,
	hverkuil-cisco@xs4all.nl, gregkh@linuxfoundation.org, wens@csie.org,
	samuel@sholland.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 4/8] media: hantro: postproc: Fix buffer size
 calculation
Message-ID: <Yko41wsU2r7ScL1c@eze-laptop>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
 <20220227144926.3006585-5-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227144926.3006585-5-jernej.skrabec@gmail.com>

Hi Jernej,

On Sun, Feb 27, 2022 at 03:49:22PM +0100, Jernej Skrabec wrote:
> When allocating aux buffers for postprocessing, it's assumed that base
> buffer size is the same as that of output. Coincidentally, that's true
> most of the time, but not always. 10-bit source also needs aux buffer
> size which is appropriate for 10-bit native format, even if the output
> format is 8-bit. Similarly, mv sizes and other extra buffer size also
> depends on source width/height, not destination.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../staging/media/hantro/hantro_postproc.c    | 24 +++++++++++++------
>  drivers/staging/media/hantro/hantro_v4l2.c    |  2 +-
>  drivers/staging/media/hantro/hantro_v4l2.h    |  2 ++
>  3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 248abe5423f0..1a76628d5754 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -12,6 +12,7 @@
>  #include "hantro_hw.h"
>  #include "hantro_g1_regs.h"
>  #include "hantro_g2_regs.h"
> +#include "hantro_v4l2.h"
>  
>  #define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
>  { \
> @@ -137,18 +138,27 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>  	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>  	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
>  	unsigned int num_buffers = cap_queue->num_buffers;
> +	struct v4l2_pix_format_mplane pix_mp;
> +	const struct hantro_fmt *fmt;
>  	unsigned int i, buf_size;
>  
> -	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
> +	/* this should always pick native format */
> +	fmt = hantro_get_default_fmt(ctx, false);
> +	if (!fmt)
> +		return -EINVAL;
> +	v4l2_fill_pixfmt_mp(&pix_mp, fmt->fourcc, ctx->src_fmt.width,
> +			    ctx->src_fmt.height);
> +
> +	buf_size = pix_mp.plane_fmt[0].sizeimage;

Took me a while to see that the main change is taking buf_size
from pix_mp, which now takes into account the bit-depth :)

To me this makes sense.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel
