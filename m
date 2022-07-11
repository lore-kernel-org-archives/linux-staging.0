Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A7F2F33
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 21:22:03 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id v187so318645oie.7
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 14:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DlVNbxuhHiE0YW6IfxJk+i5c5jEODpePbQ6g9q+lpxA=;
        b=LwQWUEinUCMBYYBc7qN0jExmAf2FO1r7LHie57nyLt7LixbPeeSEj7hUEJpKkzW/Fm
         WyRVBjp5IRx/nfORkIB8sLI8hBJqSZArmXI2x/3EMVw9B7BLhREJIzGu6w189Cab8vie
         PT8LeimE+0s5AQVydZTLezmrvDOrxHH0Tehe6doNqv9q6kwQ9HJkpwgco8LU30Xo8y12
         0NBcP/pqmrWALkCaprRW3cVGgJKAu1HBjRd2GhtH+Iuv0xFhQb+k5PnugA14UIPqH0R8
         Gp9qXg7dtiXDb2quprYaa5Dk3F2PUEIU3ircOaoZN9Wko4fdp2Yd6KZOur8FC6n9Dypl
         vgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DlVNbxuhHiE0YW6IfxJk+i5c5jEODpePbQ6g9q+lpxA=;
        b=iWlHb481nPtgm5lFGE7N0xdPJTpCY76d+x+ycaUiAB9hPnMYSR36SfKdMhXXgBUJQq
         1uyvv5okbIPINwzC4kRaeB/eKsJiGvyvIuhljyHA+iZRQS9bJP/+eFOijZ0sk6/GQXMM
         0di3FN1hyg5BT/EymARUIb8+BzbZz9V9VQddAD9axCUnTlxybvJK6whQNL/V7fB4HpFO
         LPQwPhlI2Fs3W87TCxGMixCKQhzSCVNtyLPGLaoRcuW8QQyOOMQig1ZUB2ziioOZG5km
         yqOHE1OWYtA4R6CyAxS+vioPuY/wEOXJ83FGwv5HEfxMdnElqh+zuA2yjRIU9SyXN1J2
         3JAg==
X-Gm-Message-State: AJIora+voptU3utFjeyUednrIg+zEZCZv9t9lt3xxATwCid2xROJ/8Xh
	lXHHur1qxNRCEia/Sst4Sfb5mA==
X-Google-Smtp-Source: AGRyM1suX5HCZoxqdbv5pRbmEJaW0Gk9ndmhHnqFYwBqop5sOUVwue3ket7abTy1gwO4u/a3nPw/mg==
X-Received: by 2002:a05:6808:1a11:b0:33a:87d:d9c3 with SMTP id bk17-20020a0568081a1100b0033a087dd9c3mr211788oib.175.1657574522456;
        Mon, 11 Jul 2022 14:22:02 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id q4-20020a9d6644000000b00616d98ad780sm3032840otm.52.2022.07.11.14.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 14:22:01 -0700 (PDT)
Date: Mon, 11 Jul 2022 18:21:56 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
	samuel@sholland.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] media: cedrus: Add error handling for failed setup
Message-ID: <YsyUdCcMHYBJCFY9@eze-laptop>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
 <20220620175517.648767-5-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620175517.648767-5-jernej.skrabec@gmail.com>

Hi Jernej,

On Mon, Jun 20, 2022 at 07:55:14PM +0200, Jernej Skrabec wrote:
> During decoding setup stage for complex codecs like HEVC driver can
> detect inconsistent values in controls or some other task, like
> allocating memory, can fail.
> 
> Currently setup stage has no way of signalling error. Change return type
> of setup callback to int and if returned value is not zero, skip
> decoding and finish job immediately with error flag.
> 
> While currently there is only one place when setup can fail, it's
> expected that there will be more such cases in the future, when HEVC
> decoding is improved.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Looks good and it's very typical to have a setup stage
to put actions that can be allowed to fail.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  2 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   | 21 ++++++++++++++-----
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  5 +++--
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  8 +++----
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  4 +++-
>  .../staging/media/sunxi/cedrus/cedrus_vp8.c   |  5 +++--
>  6 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 3bc094eb497f..d2b697a9ded2 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -162,7 +162,7 @@ struct cedrus_dec_ops {
>  	void (*irq_clear)(struct cedrus_ctx *ctx);
>  	void (*irq_disable)(struct cedrus_ctx *ctx);
>  	enum cedrus_irq_status (*irq_status)(struct cedrus_ctx *ctx);
> -	void (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
> +	int (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
>  	int (*start)(struct cedrus_ctx *ctx);
>  	void (*stop)(struct cedrus_ctx *ctx);
>  	void (*trigger)(struct cedrus_ctx *ctx);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index aabe6253078e..b0944abaacbd 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -28,6 +28,7 @@ void cedrus_device_run(void *priv)
>  	struct cedrus_dev *dev = ctx->dev;
>  	struct cedrus_run run = {};
>  	struct media_request *src_req;
> +	int error;
>  
>  	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> @@ -89,16 +90,26 @@ void cedrus_device_run(void *priv)
>  
>  	cedrus_dst_format_set(dev, &ctx->dst_fmt);
>  
> -	dev->dec_ops[ctx->current_codec]->setup(ctx, &run);
> +	error = dev->dec_ops[ctx->current_codec]->setup(ctx, &run);
> +	if (error)
> +		v4l2_err(&ctx->dev->v4l2_dev,
> +			 "Failed to setup decoding job: %d\n", error);
>  
>  	/* Complete request(s) controls if needed. */
>  
>  	if (src_req)
>  		v4l2_ctrl_request_complete(src_req, &ctx->hdl);
>  
> -	dev->dec_ops[ctx->current_codec]->trigger(ctx);
> +	/* Trigger decoding if setup went well, bail out otherwise. */
> +	if (!error) {
> +		dev->dec_ops[ctx->current_codec]->trigger(ctx);
>  
> -	/* Start the watchdog timer. */
> -	schedule_delayed_work(&dev->watchdog_work,
> -			      msecs_to_jiffies(2000));
> +		/* Start the watchdog timer. */
> +		schedule_delayed_work(&dev->watchdog_work,
> +				      msecs_to_jiffies(2000));
> +	} else {
> +		v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev,
> +						 ctx->fh.m2m_ctx,
> +						 VB2_BUF_STATE_ERROR);
> +	}
>  }
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index d8fb93035470..c345e67ba9bc 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -493,8 +493,7 @@ static void cedrus_h264_irq_disable(struct cedrus_ctx *ctx)
>  		     reg & ~VE_H264_CTRL_INT_MASK);
>  }
>  
> -static void cedrus_h264_setup(struct cedrus_ctx *ctx,
> -			      struct cedrus_run *run)
> +static int cedrus_h264_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  {
>  	struct cedrus_dev *dev = ctx->dev;
>  
> @@ -510,6 +509,8 @@ static void cedrus_h264_setup(struct cedrus_ctx *ctx,
>  	cedrus_write_frame_list(ctx, run);
>  
>  	cedrus_set_params(ctx, run);
> +
> +	return 0;
>  }
>  
>  static int cedrus_h264_start(struct cedrus_ctx *ctx)
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index 46119912c387..cfde4ccf6011 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -326,8 +326,7 @@ static int cedrus_h265_is_low_delay(struct cedrus_run *run)
>  	return 0;
>  }
>  
> -static void cedrus_h265_setup(struct cedrus_ctx *ctx,
> -			      struct cedrus_run *run)
> +static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  {
>  	struct cedrus_dev *dev = ctx->dev;
>  	const struct v4l2_ctrl_hevc_sps *sps;
> @@ -385,8 +384,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>  		if (!ctx->codec.h265.mv_col_buf) {
>  			ctx->codec.h265.mv_col_buf_size = 0;
> -			// TODO: Abort the process here.
> -			return;
> +			return -ENOMEM;
>  		}
>  	}
>  
> @@ -703,6 +701,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  
>  	/* Enable appropriate interruptions. */
>  	cedrus_write(dev, VE_DEC_H265_CTRL, VE_DEC_H265_CTRL_IRQ_MASK);
> +
> +	return 0;
>  }
>  
>  static int cedrus_h265_start(struct cedrus_ctx *ctx)
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index 5dad2f296c6d..4cfc4a3c8a7f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -48,7 +48,7 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx *ctx)
>  	cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
>  }
>  
> -static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
> +static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  {
>  	const struct v4l2_ctrl_mpeg2_sequence *seq;
>  	const struct v4l2_ctrl_mpeg2_picture *pic;
> @@ -185,6 +185,8 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  	      VE_DEC_MPEG_CTRL_MC_CACHE_EN;
>  
>  	cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
> +
> +	return 0;
>  }
>  
>  static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> index f4016684b32d..3f750d1795b6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -651,8 +651,7 @@ static void cedrus_vp8_irq_disable(struct cedrus_ctx *ctx)
>  		     reg & ~VE_H264_CTRL_INT_MASK);
>  }
>  
> -static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
> -			     struct cedrus_run *run)
> +static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  {
>  	const struct v4l2_ctrl_vp8_frame *slice = run->vp8.frame_params;
>  	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
> @@ -855,6 +854,8 @@ static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
>  		ctx->codec.vp8.last_sharpness_level =
>  			slice->lf.sharpness_level;
>  	}
> +
> +	return 0;
>  }
>  
>  static int cedrus_vp8_start(struct cedrus_ctx *ctx)
> -- 
> 2.36.1
> 
