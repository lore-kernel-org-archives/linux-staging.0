Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B42D7C
	for <linux-staging@lists.linux.dev>; Sat, 11 Jun 2022 12:08:09 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id o10so1932147edi.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Jun 2022 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MBpWW3Rm0qHu8VKriKsz69J9U1fr852JTooAqUcIBSs=;
        b=JGka//OtRrj4t/9GKYq/cGyzcLKCd9fNKHwtrSi+iMrLBxCIe2vjiURLMrjDKJLb9i
         JhDL2oISE5D3tswqByIX9F9OkKCv+psJVaNkSsMpoEpwjp7Praxnsf0QO4whgqiCKqft
         e0sxcPfUYpCiP5T0+JCyneRANM0HE00abZtoi6vIYFQs36/pfjFaifVK9MFkCoxsC9Sj
         7LQeB/O2d0URJ+CkxOWYEryOmn3HbV+vcBBzYthTuyExaOtWnEWO3ON1H/NYb68rQnRB
         ca0/ss9BbrMan95qXWzhv5iec3hRIsVXq7Y62uVTXM2BqZfuFDb5QvbyoyPPibnlfu3z
         c1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MBpWW3Rm0qHu8VKriKsz69J9U1fr852JTooAqUcIBSs=;
        b=JW7Z0OPsUCwpEKEsILASdfgtWnjZbiN6JJy3qXzjeovb2OBvRPD3hcHdl/2L2lBRdR
         g6cfEPO3dtYsvx/T5a8+lApd9MSD8YtQOX+Dxy+MWuFxMeJxaQO3FdXxB0MwdG0KU1xP
         NcUWxZZ7m4WD+Ng0UMpKSaPbBtIEfGbFbhOyw+ixk2P/qgwO3v1Sjhm4XTKVXa40yNTd
         OFFgtxRYRhFgAqFwBwDCf8+bSV5udDJXJKXdsJAOXk2FFnPk8YNjXd2gkCU8CFqD18SC
         WW3LOyCumE16tF6uL8zqPu9EFP7siS5BbZaQJeUIzqUzMWLATMi7l/WkgrNF+0Wn10dG
         sbtg==
X-Gm-Message-State: AOAM532OKBGb+Jn4gt3aMuL5bZ79XSFGusrFi+kd223LVcga3bal3/Na
	+Lec6GbHb5Y4IhreDURZUQ==
X-Google-Smtp-Source: ABdhPJzUrTZfe/FzjHAMv8CZN44ZkvnDaQwFgVdQHT0CWx1GHxFj7YcfX0sdZb0Bk6zZ3I6MW6m/Tg==
X-Received: by 2002:a05:6402:228d:b0:42d:e319:7297 with SMTP id cw13-20020a056402228d00b0042de3197297mr56166642edb.79.1654949287554;
        Sat, 11 Jun 2022 05:08:07 -0700 (PDT)
Received: from ?IPV6:2001:9e8:b963:4d00:eb2a:1586:942f:ce9f? ([2001:9e8:b963:4d00:eb2a:1586:942f:ce9f])
        by smtp.gmail.com with ESMTPSA id q4-20020a50aa84000000b0042617ba638esm1318458edc.24.2022.06.11.05.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jun 2022 05:08:06 -0700 (PDT)
Message-ID: <8efa6811-ee17-4dd2-23a7-e0471af8c0a6@gmail.com>
Date: Sat, 11 Jun 2022 14:08:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 4/5] media: rkvdec: Re-enable H.264 error detection
Content-Language: en-US
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220610125215.240539-1-nicolas.dufresne@collabora.com>
 <20220610125215.240539-5-nicolas.dufresne@collabora.com>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20220610125215.240539-5-nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 10.06.22 um 14:52 schrieb Nicolas Dufresne:
> This re-enables H.264 error detection, but using the other error mode.
> In that mode, the decoder will skip over the error macro-block or
> slices and complete the decoding. As a side effect, the error status
> is not set in the interrupt status register, and instead errors are
> detected per format. Using this mode workaround the issue that the
> HW get stuck in error stated and allow reporting that some corruption
> may be present in the buffer returned to userland.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 23 +++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 55596ce6bb6e..60a89918e2c1 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -1175,14 +1175,15 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  
>  	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
>  
> -	writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> -	writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
> +	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> +	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>  
>  	/* Start decoding! */
>  	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
> -	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
> +	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E |
> +	       RKVDEC_H264ORVP9_ERR_MODE,
>  	       rkvdec->regs + RKVDEC_REG_INTERRUPT);
>  
>  	return 0;
> @@ -1196,10 +1197,26 @@ static int rkvdec_h264_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int rkvdec_h264_check_error_info(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	int err;
> +
> +	err = readl(rkvdec->regs + RKVDEC_REG_H264_ERRINFO_NUM);
> +	if (err & RKVDEC_STRMD_DECT_ERR_FLAG) {
> +		pr_debug("Decoded picture have %i/%i slices with errors.\n",
> +			 RKVDEC_ERR_PKT_NUM(err), RKVDEC_SLICEDEC_NUM(err));
> +		return VB2_BUF_STATE_ERROR;
> +	}
> +
> +	return VB2_BUF_STATE_DONE;
> +}
> +
>  const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops = {
>  	.adjust_fmt = rkvdec_h264_adjust_fmt,
>  	.start = rkvdec_h264_start,
>  	.stop = rkvdec_h264_stop,
>  	.run = rkvdec_h264_run,
>  	.try_ctrl = rkvdec_h264_try_ctrl,
> +	.check_error_info = rkvdec_h264_check_error_info,
>  };

Actually I'm not sure I fully understand what you are expecting the
userspace to do with the information that there was an (HW!) error,
which might or might not be bitstrean related. Resending the
corrupted(?) frame until the HW fully hangs?
As the interrupt reports an HW error it should (at least also) be
handled driver-side and the HW is known not to be able to fully reset
itself in case of an error.
I think this will make behavior worse than it is now (for real-life
users) where errors are eventually just ignored.

Alex
