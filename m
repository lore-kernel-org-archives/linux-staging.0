Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52F47E
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 05:17:55 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id z8so1358852oix.3
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 22:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EaYNgx8KbJOaAquzTTA9wZHzyzdVTdSankAvb1CZzyQ=;
        b=x5n6cdCJEE/VCj3mLhng1qEaAEHHuW6CnLjYyMKJ8C5R5ZP0Q7JKSOAngNXZvEssT6
         qYwF0nXkMrFHlG642wUJQ96R8zpKlbaA/iAu1W8vgASVZWN7754Y3hfqO2OLH7MlHlKO
         ME6PI4A7vIvIay1Q1f8uJsQT4BK9tIPX8xmd/ugQJKSMeeEZPAKla6chmuZzSlbn/t7P
         mGKdo/EHI/X1JEU3CvMq6WouABaUMJBGUExshvChDadmSyo+WH+DcM5YIqYJa+roV5UP
         F0HGy42FpfZK4jAnq9YXXQQ5XGQc9/lIKTTMJwH4O9fdpI4TOuVX59WoOrmEpLxIWeL0
         B4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EaYNgx8KbJOaAquzTTA9wZHzyzdVTdSankAvb1CZzyQ=;
        b=1WR+KZHUNgl7SyUXgKo9VFBz0iYXz17nJJbO5BQY7H/vSEYM8Sxpv1TuNLYprmRNnD
         4Oc9BaQShxfM3X1cRuPNCY6941Yj9K24RIwIpxKpaOcB+eGLDUmUikwGcKHhw4g9aMgE
         MqeR/ryvwh0V10as0M2p4fW6huf8UbSSaB/jANcvhS9k1dWIyW6Fqyf18aiSJarvJB4J
         CRdJ2K0xH1KeZmWovA4tOhRHuTKi/+/oDTU1ElV2UIxytwOii1NFwFmETGBSAim+lHjc
         /CsIxHI4HAh4PK/cTLUnzlHfVcRPA4xVm5bzriPeG16lFql1oam4/Wo33Fzd5vdhMUjc
         rexg==
X-Gm-Message-State: AOAM532xc2J77sA2GnA2igic17N9joOUKLYvbP94Ucbo7urQTCzFAwK6
	GW5i7wM8U0EHklUxADP5SIvRNA==
X-Google-Smtp-Source: ABdhPJznshMWCCRKhfXQIHf+0aM9ZllfI4xIqhhI3AR7UIbt17C0rKLn8MOFpYfzpZrwKU3Nu8zULQ==
X-Received: by 2002:aca:f286:0:b0:2da:58ba:c578 with SMTP id q128-20020acaf286000000b002da58bac578mr2846902oih.127.1649222274622;
        Tue, 05 Apr 2022 22:17:54 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id gk6-20020a0568703c0600b000de4880b357sm6038605oab.50.2022.04.05.22.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 22:17:53 -0700 (PDT)
Date: Wed, 6 Apr 2022 02:17:48 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@collabora.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 15/24] media: rkvdec: Move H264 SPS validation in
 rkvdec-h264
Message-ID: <Yk0ifIfQmk9n5vyu@eze-laptop>
References: <20220405204426.259074-1-nicolas.dufresne@collabora.com>
 <20220405204426.259074-16-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405204426.259074-16-nicolas.dufresne@collabora.com>

On Tue, Apr 05, 2022 at 04:44:16PM -0400, Nicolas Dufresne wrote:
> No function change, this moves H264 specific validation into the H264
> specific code. This is in preparation of improving this validation and
> reusing at streamone.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 23 ++++++++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.c      | 23 ++++++----------------
>  drivers/staging/media/rkvdec/rkvdec.h      |  1 +
>  3 files changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 8d44a884a52e..0dcbcb1bac80 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -1137,9 +1137,32 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  	return 0;
>  }
>  
> +static int rkvdec_h264_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
> +{
> +	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
> +		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
> +		/*
> +		 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
> +		 * but it's currently broken in the driver.
> +		 * Reject them for now, until it's fixed.
> +		 */
> +		if (sps->chroma_format_idc > 1)
> +			/* Only 4:0:0 and 4:2:0 are supported */
> +			return -EINVAL;
> +		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
> +			/* Luma and chroma bit depth mismatch */
> +			return -EINVAL;
> +		if (sps->bit_depth_luma_minus8 != 0)
> +			/* Only 8-bit is supported */
> +			return -EINVAL;
> +	}
> +	return 0;
> +}
> +
>  const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops = {
>  	.adjust_fmt = rkvdec_h264_adjust_fmt,
>  	.start = rkvdec_h264_start,
>  	.stop = rkvdec_h264_stop,
>  	.run = rkvdec_h264_run,
> +	.try_ctrl = rkvdec_h264_try_ctrl,
>  };
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 2df8cf4883e2..e3d44d5b35f3 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -29,23 +29,12 @@
>  
>  static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
> -	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
> -		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
> -		/*
> -		 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
> -		 * but it's currently broken in the driver.
> -		 * Reject them for now, until it's fixed.
> -		 */
> -		if (sps->chroma_format_idc > 1)
> -			/* Only 4:0:0 and 4:2:0 are supported */
> -			return -EINVAL;
> -		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
> -			/* Luma and chroma bit depth mismatch */
> -			return -EINVAL;
> -		if (sps->bit_depth_luma_minus8 != 0)
> -			/* Only 8-bit is supported */
> -			return -EINVAL;
> -	}
> +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +
> +	if (desc->ops->try_ctrl)
> +		return desc->ops->try_ctrl(ctx, ctrl);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 2f4ea1786b93..9df0fba799a4 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -72,6 +72,7 @@ struct rkvdec_coded_fmt_ops {
>  	void (*done)(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *src_buf,
>  		     struct vb2_v4l2_buffer *dst_buf,
>  		     enum vb2_buffer_state result);
> +	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
>  };
>  
>  struct rkvdec_coded_fmt_desc {
> -- 
> 2.34.1
> 
