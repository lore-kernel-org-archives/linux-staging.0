Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11437C
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 11:16:49 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id q129so5280830oif.4
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 04:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WjzH3Bp/QUa2TjJHjxkVQdmU8VTnKhEV9IV9oEFA8ak=;
        b=CEdR9sisN7IB5r5tB2HaKFQKMuuVaopkESp5PcnA5otm521+G6ap3QLvZOf64W+uDM
         4z/o9qUzrs6hJxDfNHi+i8kZh8VKUG8L2U5ZhpEhg2r/fhmpvYuxP+Kb5r5w4iWhH//L
         /wRhOSNcUnSYFHBFRT01NOBqLfxeHeRLSyZAaDLzakXgR1k+7GL4zcobbIZ4du3YHQjT
         BA2zG3n3Jn1/q7rUzwWWYeDZ3D/VSpcb7TZHR1ottkM2XhvwEpZMlq6R+AeEIlGCPDHv
         hUHa7xVJ7/CFr2u2SBGrz1A/NSTaB4gRI7shibJASst6BRstnVDp2eKzGAPm1iiXo7Ir
         nUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WjzH3Bp/QUa2TjJHjxkVQdmU8VTnKhEV9IV9oEFA8ak=;
        b=5oFyCzFFE6om2ZfwwTRD5nd+kK+ym8gEoxeg85nH40HhvdDgbhKgTI1M9Ny/rHHCLg
         rlG9DdujMEfTUbiAdwICSdzUl0OAHlW1Z9A3gCkQseuzAhT6WWkIVmMgHS2KZvDKRs/J
         tPmv6uIiqox+nAUDDH0r8Yrj0tBu5JszVimVSwyy+s/lyHA1+667gs7FUjdW6e71KVw2
         GypOn9v/Wt0vZWepUttseyokubME4uDmOwiS8kdnMT984Mukn0+wbgLXazjccP+UNdQh
         Lg2DfswJnBCajF1Erp/VifRojsSoAqegW4fVQykDuP2RlmH3iVdvIbsjZgSwYKK/DnSe
         QlPQ==
X-Gm-Message-State: AOAM533UrGmn9shHuVneJDlkb0awnga3TNU/lUHI4S4MZGRerWfGpyc5
	Bw1Iwpl6R6Sp5KljFGt9PzKigg==
X-Google-Smtp-Source: ABdhPJwt+k9ISqksCBiUGrS67w5cQJUESwaCZG9FKIOUke5sO/15am/gUUnCSnZtlVN7b/1Iyfy3TQ==
X-Received: by 2002:a05:6808:1247:b0:2d3:5181:449a with SMTP id o7-20020a056808124700b002d35181449amr6301215oiv.83.1648898208790;
        Sat, 02 Apr 2022 04:16:48 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id bm51-20020a0568081ab300b002da5c44e0bdsm1954097oib.28.2022.04.02.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:16:48 -0700 (PDT)
Date: Sat, 2 Apr 2022 08:16:43 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@collabora.com,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/23] media: rkvdec: h264: Fix dpb_valid
 implementation
Message-ID: <YkgwmwTMa83RysKB@eze-laptop>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
 <20220331193726.289559-14-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331193726.289559-14-nicolas.dufresne@collabora.com>

On Thu, Mar 31, 2022 at 03:37:15PM -0400, Nicolas Dufresne wrote:
> The ref builder only provided references that are marked as valid in the
> dpb. Thus the current implementation of dpb_valid would always set the
> flag to 1. This is not representing missing frames (this is called
> 'non-existing' pictures in the spec). In some context, these non-existing
> pictures still need to occupy a slot in the reference list according to
> the spec.
> 

Good catch! OOC, did you find this because it was failing a test vector?

> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 33 ++++++++++++++++------
>  1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index dff89732ddd0..bcde37d72244 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -112,6 +112,7 @@ struct rkvdec_h264_run {
>  	const struct v4l2_ctrl_h264_sps *sps;
>  	const struct v4l2_ctrl_h264_pps *pps;
>  	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
> +	int ref_buf_idx[V4L2_H264_NUM_DPB_ENTRIES];
>  };
>  
>  struct rkvdec_h264_ctx {
> @@ -725,6 +726,26 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
>  	}
>  }
>  
> +static void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
> +			       struct rkvdec_h264_run *run)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
> +	u32 i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +		const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
> +		struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> +		int buf_idx = -1;
> +
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> +			buf_idx = vb2_find_timestamp(cap_q,
> +						     dpb[i].reference_ts, 0);
> +
> +		run->ref_buf_idx[i] = buf_idx;
> +	}
> +}
> +
>  static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>  			    struct rkvdec_h264_run *run)
>  {
> @@ -762,7 +783,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>  
>  	for (j = 0; j < RKVDEC_NUM_REFLIST; j++) {
>  		for (i = 0; i < h264_ctx->reflists.num_valid; i++) {
> -			u8 dpb_valid = 0;
> +			bool dpb_valid = run->ref_buf_idx[i] >= 0;
>  			u8 idx = 0;
>  
>  			switch (j) {
> @@ -779,8 +800,6 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>  
>  			if (idx >= ARRAY_SIZE(dec_params->dpb))
>  				continue;
> -			dpb_valid = !!(dpb[idx].flags &
> -				       V4L2_H264_DPB_ENTRY_FLAG_ACTIVE);
>  
>  			set_ps_field(hw_rps, DPB_INFO(i, j),
>  				     idx | dpb_valid << 4);
> @@ -859,13 +878,8 @@ get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_h264_run *run,
>  	    unsigned int dpb_idx)
>  {
>  	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> -	const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
>  	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> -	int buf_idx = -1;
> -
> -	if (dpb[dpb_idx].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> -		buf_idx = vb2_find_timestamp(cap_q,
> -					     dpb[dpb_idx].reference_ts, 0);
> +	int buf_idx = run->ref_buf_idx[dpb_idx];
>  
>  	/*
>  	 * If a DPB entry is unused or invalid, address of current destination
> @@ -1102,6 +1116,7 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  
>  	assemble_hw_scaling_list(ctx, &run);
>  	assemble_hw_pps(ctx, &run);
> +	lookup_ref_buf_idx(ctx, &run);
>  	assemble_hw_rps(ctx, &run);
>  	config_registers(ctx, &run);
>  
> -- 
> 2.34.1
> 
