Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA07173
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 17:49:04 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id m9so12214248oia.12
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 09:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+NLX3R1cE70RQfveZRD6FH9WgGQntlpSO5v8UvTcWFc=;
        b=pBM5BTKeJF5ayuNLJyfZOfHiGDI1ZsCzdpCy2ANcmLXxEy30QSBbe8P3oEj7usFApd
         LuwaT+lEJxm1+Cek9HZKcZ2Ax8mx7CgScbcC1pIIe9KX15W/2Le3EDwBgVXSKlQR84EY
         XfzSpvWqVjrIMgMR0q1x+uYCxZlx1s77eSuJSOsd1Hct6cG/5Nvfn61ThsFmAgJDSgHz
         fG7/WDYyzDW4yT72wqgXp8V8aH7mbyi5BM8/B6RkELX7tKp4qk2NrSmVWtFooTYZ4g4+
         chZLJ4j5BYtZofzPDmcsdCOc6D8TrLyMVZdXdD+oSIaqhRAOoDvm9YWTrd2oIyEzUucR
         OgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+NLX3R1cE70RQfveZRD6FH9WgGQntlpSO5v8UvTcWFc=;
        b=b0PZsHaXC8qiMAJtV+B9H13hRSKd3P7Cwzb7k8F1i+7xJAr4/174x89264XmzJ/c2W
         KQBeCq5IlKngeEid1IejuHaVSRwSdmiykO10mgnYwESgYN4CeDATr6XLgwxhBv2DG/iC
         fJjAwWiabrWFVKytcqUYFCvYlng98Q8cSBN9YnIv33Z75tmXY/0OufY9lueaLdkizhXX
         HniqXUhFrhoEzW52pFI7H+vT5cBky9ZyW8fcMv+VaqWABbqG5CFKSr9WDqcNXT8UTsZr
         3SZOXFbNpU6+qnuboxAch/QjJT43KbHxhj1lwd1c86sfk9FQHH1D0Wv6P9+naIRNmunK
         74dg==
X-Gm-Message-State: AOAM531Rlno7uAnBSqIoCL3CLdMNQP6xYTQGS0VC3C2iCpvQAt9kWTnX
	ntoF0dhw3THWpLWEmTB/9KPcUw==
X-Google-Smtp-Source: ABdhPJzj7F2gOyTNGb+hp2IschcMiHIeJMXg5e0x4my2DCxicYn20Rr+QiuG8pgtjjBJZjNj7uusnA==
X-Received: by 2002:a54:4004:: with SMTP id x4mr2448324oie.18.1643046544089;
        Mon, 24 Jan 2022 09:49:04 -0800 (PST)
Received: from eze-laptop ([190.194.87.200])
        by smtp.gmail.com with ESMTPSA id j19sm3642063oih.3.2022.01.24.09.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:49:02 -0800 (PST)
Date: Mon, 24 Jan 2022 14:48:56 -0300
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
Subject: Re: [PATCH V3 09/10] media: hantro: Add support for i.MX8MM Hantro-G1
Message-ID: <Ye7miOjf0LUruuEk@eze-laptop>
References: <20220124023125.414794-1-aford173@gmail.com>
 <20220124023125.414794-10-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124023125.414794-10-aford173@gmail.com>

Hi Adam,

On Sun, Jan 23, 2022 at 08:31:23PM -0600, Adam Ford wrote:
> The i.MX8MM has a Hantro G1 video decoder similar to the
> imx8mq but lacks the post-processor present in the imx8mq.
> Add support in the driver for it with the post-processing
> removed.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks a lot,
Ezequiel

> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index a670ddd29c4c..b281ac4fb79c 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -615,6 +615,7 @@ static const struct of_device_id of_hantro_match[] = {
>  	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
> +	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
>  	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>  	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
>  	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index f0bd2ffe290b..c00b46e06055 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -299,6 +299,7 @@ enum hantro_enc_fmt {
>  	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
>  };
>  
> +extern const struct hantro_variant imx8mm_vpu_g1_variant;
>  extern const struct hantro_variant imx8mq_vpu_g1_variant;
>  extern const struct hantro_variant imx8mq_vpu_g2_variant;
>  extern const struct hantro_variant imx8mq_vpu_variant;
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index 849ea7122d47..9802508bade2 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -327,3 +327,15 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
>  	.clk_names = imx8mq_g2_clk_names,
>  	.num_clocks = ARRAY_SIZE(imx8mq_g2_clk_names),
>  };
> +
> +const struct hantro_variant imx8mm_vpu_g1_variant = {
> +	.dec_fmts = imx8m_vpu_dec_fmts,
> +	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
> +	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> +		 HANTRO_H264_DECODER,
> +	.codec_ops = imx8mq_vpu_g1_codec_ops,
> +	.irqs = imx8mq_irqs,
> +	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
> +	.clk_names = imx8mq_g1_clk_names,
> +	.num_clocks = ARRAY_SIZE(imx8mq_g1_clk_names),
> +};
> -- 
> 2.32.0
> 
