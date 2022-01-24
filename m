Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C8173
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 18:09:56 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id f4-20020a4ac484000000b002e3e221d769so6089802ooq.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 10:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w8jEaMLPRMyJjaBqD5TxMdjhSUQ8JiEnfyk34bIQgP0=;
        b=MrjpOMe3g8JRIYbcToQd2Qu0I/b5vrX/3XGjf2EZ40WzlqwVFZSR95GOwQ9Gfumk0I
         ArgdPOpGK3Awj4Zw99kwMljilayLReiw+HH3afCWGRMsNfXAK8ZpL3elx0qx3ileBGON
         2ziL9O/d6luadbzWZFnmxRkYJohVyZxiqFsq3BSwSSHsKRhc5jHbszi0RaXvMfwnhL56
         wFIr1QoKW2yzpuzN5DJnrNsTViFEDYj/UQ1W0bw/zSzG1UPIe9m2oVxlgjAlcfbsUSdt
         hntaUGXfZwJKnwcoDtrBOa3ZE9XNGWIpXGYSKCdiTEaBycSmDy/v4s0r8aESzt24uWT4
         TAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w8jEaMLPRMyJjaBqD5TxMdjhSUQ8JiEnfyk34bIQgP0=;
        b=6XPsl7oerqxuWH3p3on+vKR82JMIw5W/hjWvTka00QDKVlVeAWAhfCZaQTF+wGMqSl
         q+MwAOOuHE0ll74kaLuHwQFZSgg7mBY6o9uXiaZ6mLVVcMTufN7Lr0iPzN2HYPXfCG3B
         ul0pb0TNjPuGGs1ToJySpCd0rwjwo0rO/1sFEfA+rZ0xLgI0Ae+16A+fmkDN8Uin9n/q
         e3lbkqRBeG+QusiHBDsPPUdulljc3nY9+6qUkVBvPiEIRpNwLXFAQBdrUKKbxZHQIz4V
         coPfGi3mkECt9YYtQOAeKIxujMZoirKP0uvfeP1lP13ZF+/XD23iArKmHt015pVifwik
         5sGA==
X-Gm-Message-State: AOAM532dyt1kljJFY8EfjRFwwlS4/W0VRFo/EQlJWUY7Dh5SIBc00o3l
	elHyLYuDavExNtukz5gbJxYxRw==
X-Google-Smtp-Source: ABdhPJz4x/txLXzb74n94I/1helpFS6e1Nqmg4vkIylbZ56TsLFfUK7qbzKJzg6iX/R8pA5+uMINOA==
X-Received: by 2002:a4a:8c2d:: with SMTP id u42mr11072142ooj.7.1643047795762;
        Mon, 24 Jan 2022 10:09:55 -0800 (PST)
Received: from eze-laptop ([190.194.87.200])
        by smtp.gmail.com with ESMTPSA id z20sm5456490otm.25.2022.01.24.10.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 10:09:54 -0800 (PST)
Date: Mon, 24 Jan 2022 15:09:48 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org, aford@beaconembedded.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH V3 05/10] media: hantro: Allow i.MX8MQ G1 and G2 to run
 independently
Message-ID: <Ye7rbLhM7OkjeiTz@eze-laptop>
References: <20220124023125.414794-1-aford173@gmail.com>
 <20220124023125.414794-6-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124023125.414794-6-aford173@gmail.com>

Hi Adam,

On Sun, Jan 23, 2022 at 08:31:19PM -0600, Adam Ford wrote:
> The VPU in the i.MX8MQ is really the combination of Hantro G1 and
> Hantro G2. With the updated vpu-blk-ctrl, the power domains system
> can enable and disable them separately as well as pull them out of
> reset. This simplifies the code and lets them run independently
> while still retaining backwards compatibility with older device
> trees for those using G1.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 6a51f39dde56..a670ddd29c4c 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -616,6 +616,7 @@ static const struct of_device_id of_hantro_match[] = {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>  	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },

Since you might need to resend the series anyway due to the
issue with arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi,
could you add a small warning for the deprecated compatible string?

This will be a useful hint for kernel developers and system integrators
about the devicetree changes.

Something along these lines, maybe?

        match = of_match_node(of_hantro_match, pdev->dev.of_node);
        vpu->variant = match->data;

        /*
         * Support for nxp,imx8mq-vpu is kept for backwards compatibility
         * but it's deprecated. Please update your DTS file to use
         * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
         */
        if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
                dev_warn(&pdev->dev, "%s compatible is deprecated\n",
                         match->compatible);

In any case, the patch looks good:

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel


> +	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
>  	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 4a19ae8940b9..f0bd2ffe290b 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -299,6 +299,7 @@ enum hantro_enc_fmt {
>  	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
>  };
>  
> +extern const struct hantro_variant imx8mq_vpu_g1_variant;
>  extern const struct hantro_variant imx8mq_vpu_g2_variant;
>  extern const struct hantro_variant imx8mq_vpu_variant;
>  extern const struct hantro_variant px30_vpu_variant;
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index f5991b8e553a..849ea7122d47 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -205,13 +205,6 @@ static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
>  	imx8m_soft_reset(vpu, RESET_G1);
>  }
>  
> -static void imx8m_vpu_g2_reset(struct hantro_ctx *ctx)
> -{
> -	struct hantro_dev *vpu = ctx->dev;
> -
> -	imx8m_soft_reset(vpu, RESET_G2);
> -}
> -
>  /*
>   * Supported codec ops.
>   */
> @@ -237,17 +230,33 @@ static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
>  	},
>  };
>  
> +static const struct hantro_codec_ops imx8mq_vpu_g1_codec_ops[] = {
> +	[HANTRO_MODE_MPEG2_DEC] = {
> +		.run = hantro_g1_mpeg2_dec_run,
> +		.init = hantro_mpeg2_dec_init,
> +		.exit = hantro_mpeg2_dec_exit,
> +	},
> +	[HANTRO_MODE_VP8_DEC] = {
> +		.run = hantro_g1_vp8_dec_run,
> +		.init = hantro_vp8_dec_init,
> +		.exit = hantro_vp8_dec_exit,
> +	},
> +	[HANTRO_MODE_H264_DEC] = {
> +		.run = hantro_g1_h264_dec_run,
> +		.init = hantro_h264_dec_init,
> +		.exit = hantro_h264_dec_exit,
> +	},
> +};
> +
>  static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
>  	[HANTRO_MODE_HEVC_DEC] = {
>  		.run = hantro_g2_hevc_dec_run,
> -		.reset = imx8m_vpu_g2_reset,
>  		.init = hantro_hevc_dec_init,
>  		.exit = hantro_hevc_dec_exit,
>  	},
>  	[HANTRO_MODE_VP9_DEC] = {
>  		.run = hantro_g2_vp9_dec_run,
>  		.done = hantro_g2_vp9_dec_done,
> -		.reset = imx8m_vpu_g2_reset,
>  		.init = hantro_vp9_dec_init,
>  		.exit = hantro_vp9_dec_exit,
>  	},
> @@ -267,6 +276,8 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
>  
>  static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
>  static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
> +static const char * const imx8mq_g1_clk_names[] = { "g1" };
> +static const char * const imx8mq_g2_clk_names[] = { "g2" };
>  
>  const struct hantro_variant imx8mq_vpu_variant = {
>  	.dec_fmts = imx8m_vpu_dec_fmts,
> @@ -287,6 +298,21 @@ const struct hantro_variant imx8mq_vpu_variant = {
>  	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>  };
>  
> +const struct hantro_variant imx8mq_vpu_g1_variant = {
> +	.dec_fmts = imx8m_vpu_dec_fmts,
> +	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
> +	.postproc_fmts = imx8m_vpu_postproc_fmts,
> +	.num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_postproc_fmts),
> +	.postproc_ops = &hantro_g1_postproc_ops,
> +	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> +		 HANTRO_H264_DECODER,
> +	.codec_ops = imx8mq_vpu_g1_codec_ops,
> +	.irqs = imx8mq_irqs,
> +	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
> +	.clk_names = imx8mq_g1_clk_names,
> +	.num_clocks = ARRAY_SIZE(imx8mq_g1_clk_names),
> +};
> +
>  const struct hantro_variant imx8mq_vpu_g2_variant = {
>  	.dec_offset = 0x0,
>  	.dec_fmts = imx8m_vpu_g2_dec_fmts,
> @@ -296,10 +322,8 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
>  	.postproc_ops = &hantro_g2_postproc_ops,
>  	.codec = HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
>  	.codec_ops = imx8mq_vpu_g2_codec_ops,
> -	.init = imx8mq_vpu_hw_init,
> -	.runtime_resume = imx8mq_runtime_resume,
>  	.irqs = imx8mq_g2_irqs,
>  	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
> -	.clk_names = imx8mq_clk_names,
> -	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
> +	.clk_names = imx8mq_g2_clk_names,
> +	.num_clocks = ARRAY_SIZE(imx8mq_g2_clk_names),
>  };
> -- 
> 2.32.0
> 
