Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4899E2C81
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 15:54:19 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 11so6623400qvd.11
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JHQQ/ZPuMNBwfivK9zPtMYjZexbN/EgHfRTfb4X4FQM=;
        b=WilbUexRA01zQ0bMJZW4pqq0QhYgb4cjNMoYFpt/WN/kAwF2xzUpyfU1vmmjKkQnvx
         uOROisI1Hd25EaL/aZ4K1rDMkV4aT4ZtcAM3mAqwnnE1WvfK99MCJ6feMHFjtHQT7SjE
         VV5YT5M4Qo+Uu8Zd5HJaQM4LtKuMVcqpMf0JX9jpDrbdtZmOJ6dnujH4Db/u7CovMjCq
         DeFsPhEgFBltMLYOMkvGKaUwP0faoEj5P91nNZRBOTdRlQi3FSJBsTKOWNk8jci6DPXN
         KlDu1ZdeqcrMoQRYjtv8GcVZ1Ky8gx91c3Y4UgfFucJr5iRXsPSkEbZsLiWaNvZKPlf1
         vRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JHQQ/ZPuMNBwfivK9zPtMYjZexbN/EgHfRTfb4X4FQM=;
        b=N2DPuXKzQHfvGVmHrO2Wy41pTXGA8DO/7bnWY81s2ozG5jDeUYSOmV2yb8MatsPAD8
         AK98DyauiEj436A51Wn0yvgaaQrU/XZLBdwzNePZ440o3hiH6clVwPSnN9eMJGqbgv2m
         lmnXY6L1rxX78K+3PM58G8vjY5H8FTkbJgxDZ7MEDpuJRP01//q8ElBIEbXl6VouYqKr
         WEymOanZt6UwTuvgHA6t4QpO4+XIxh9cf7maBcdNUc8oWGl5s85aPUiS9yI1SM+8u1f2
         719+wWzyElU9eag0sVJ720cMjrGn6vqeVr3/NJICjo2qxBv2kc9DO8en9P4XXLfFmqkK
         7+bQ==
X-Gm-Message-State: AOAM530HPJ8aaHeto7BtB8ns+26KOpQgLaayNKMPszT1nv7t3OAw81X3
	rhFSbQOFDeXqgZ9MMPgBCT7uvoobsVxeGQ==
X-Google-Smtp-Source: ABdhPJzVAQ4pK19I9ktgZs5SQ2HXyEEnpkAMWqKmsXbgQremDteXueDeFV7UIfAnw16lGzesZAT+CA==
X-Received: by 2002:a05:6214:1267:: with SMTP id r7mr10933942qvv.16.1633708458308;
        Fri, 08 Oct 2021 08:54:18 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 207sm2261102qkd.56.2021.10.08.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:54:18 -0700 (PDT)
Message-ID: <a2759c8f5ec47bf6a96f69e103994dc20198c39b.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: rkvdec: Support dynamic resolution changes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Chen-Yu Tsai <wenst@chromium.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>,  stable@vger.kernel.org
Date: Fri, 08 Oct 2021 11:54:16 -0400
In-Reply-To: <20211008100423.739462-3-wenst@chromium.org>
References: <20211008100423.739462-1-wenst@chromium.org>
	 <20211008100423.739462-3-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le vendredi 08 octobre 2021 à 18:04 +0800, Chen-Yu Tsai a écrit :
> The mem-to-mem stateless decoder API specifies support for dynamic
> resolution changes. In particular, the decoder should accept format
> changes on the OUTPUT queue even when buffers have been allocated,
> as long as it is not streaming.

As commented in the code, it also requires the CAPTURE side not to be busy, not
sure if its worth clarifying, I don't really mind.

> 
> Relax restrictions for S_FMT as described in the previous paragraph,
> and as long as the codec format remains the same. This aligns it with
> the Hantro and Cedrus decoders. This change was mostly based on commit
> ae02d49493b5 ("media: hantro: Fix s_fmt for dynamic resolution changes").
> 
> Since rkvdec_s_fmt() is now just a wrapper around the output/capture
> variants without any additional shared functionality, drop the wrapper
> and call the respective functions directly.
> 
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 40 +++++++++++++--------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 7131156c1f2c..3f3f96488d74 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -280,31 +280,20 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int rkvdec_s_fmt(struct file *file, void *priv,
> -			struct v4l2_format *f,
> -			int (*try_fmt)(struct file *, void *,
> -				       struct v4l2_format *))
> +static int rkvdec_s_capture_fmt(struct file *file, void *priv,
> +				struct v4l2_format *f)
>  {
>  	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
>  	struct vb2_queue *vq;
> +	int ret;
>  
> -	if (!try_fmt)
> -		return -EINVAL;
> -
> -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	/* Change not allowed if queue is busy */
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>  	if (vb2_is_busy(vq))
>  		return -EBUSY;
>  
> -	return try_fmt(file, priv, f);
> -}
> -
> -static int rkvdec_s_capture_fmt(struct file *file, void *priv,
> -				struct v4l2_format *f)
> -{
> -	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> -	int ret;
> -
> -	ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_capture_fmt);
> +	ret = rkvdec_try_capture_fmt(file, priv, f);
>  	if (ret)
>  		return ret;
>  
> @@ -319,9 +308,20 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
>  	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>  	const struct rkvdec_coded_fmt_desc *desc;
>  	struct v4l2_format *cap_fmt;
> -	struct vb2_queue *peer_vq;
> +	struct vb2_queue *peer_vq, *vq;
>  	int ret;
>  
> +	/*
> +	 * In order to support dynamic resolution change, the decoder admits
> +	 * a resolution change, as long as the pixelformat remains. Can't be
> +	 * done if streaming.
> +	 */
> +	vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	if (vb2_is_streaming(vq) ||
> +	    (vb2_is_busy(vq) &&
> +	     f->fmt.pix_mp.pixelformat != ctx->coded_fmt.fmt.pix_mp.pixelformat))
> +		return -EBUSY;
> +
>  	/*
>  	 * Since format change on the OUTPUT queue will reset the CAPTURE
>  	 * queue, we can't allow doing so when the CAPTURE queue has buffers
> @@ -331,7 +331,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
>  	if (vb2_is_busy(peer_vq))
>  		return -EBUSY;
>  
> -	ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_output_fmt);
> +	ret = rkvdec_try_output_fmt(file, priv, f);
>  	if (ret)
>  		return ret;
>  


