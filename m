Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943607B
	for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 17:40:37 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so133059fac.13
        for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 10:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EGE13E6ZZhU25BMBFH6IJpwsNUcglEsD50ZGiHxhMVQ=;
        b=wjpd5H5KnbK7QTTI1de178JpUIRh8kjd3V+neF7jaJMjKPOwwd8Yj3j6ypd/aj7XyM
         FzeRco6DWJdluLH2th9Nq4HXW38kLqUF3qG1n4XIiBYQ5zcqmNYdWeZizDCDQ33xm8Wy
         Aq73WpUD4rUGSpe56pix+rm8fChl04rPKwtNEekm2OFX5I3OGhJuYUwpxV1TeRJd7F+D
         DeLAlCLrs2bVcRtK5YhtTnLLRzsRtx3/T3KAsaF6pCoOXqbOymhLjFdHJ26WHOojebDo
         BTXJy5O7P4JetRaGRewOjy+iWEcba8u1xtxPSn+QL8OvxWqlXeoLpkq0C6SbUnx176lO
         RFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EGE13E6ZZhU25BMBFH6IJpwsNUcglEsD50ZGiHxhMVQ=;
        b=QwfMhViCdlsxi/f4C6+bqtZAm9DR1EuqxxoqmOoRvlnn5U2C5g5HOeW43QYs4Kzm4F
         0rkZpXXNwezv0iDxESH4IbLUDJO2ZuXm4eUHC/23embYlNZXjNl0kd5Bv9C/CqM/32C4
         KvifSi5j640/CDkLfCUgN5zsBitSew4UFD9gxRMRL/1Iglu/QGznqFaPMWe4cchZZkSS
         mTV+kzmCWFVUIlnJkiBEYadRJnO8wxipUwiO7IbjkQck2UFuxKP/zzSuMaBK1n+02X2O
         p+g0G1KTUz94b1R3WQqcfg11FP5T5K6lbfQtGrQMFruvbof0YKAMAAk/PzEMOpTTUuFo
         9/tw==
X-Gm-Message-State: AJIora8Dj30bLBtCDsOdLoCgdV7YlP28j92Fb+NCq4f9EbKG0ZE8ixub
	Ube/smDG613BH/SSEVhM4nL16A==
X-Google-Smtp-Source: AGRyM1v0Nx0E1opyB9avEAkzQRKPrjH670PrUahCZqH0PNOb+fyeVLDUCCM6nt1U4s8F/ZcMFjbTWw==
X-Received: by 2002:a05:6870:7885:b0:104:9120:c382 with SMTP id hc5-20020a056870788500b001049120c382mr5973550oab.115.1656610836765;
        Thu, 30 Jun 2022 10:40:36 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id m13-20020a056820050d00b0041b8e651c1csm11819888ooj.40.2022.06.30.10.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:40:36 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:40:30 -0300
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
Subject: Re: [PATCH 6/7] media: hantro: imx8m: Enable 10bit decoding
Message-ID: <Yr3gDuzOXk58wTnd@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-7-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-7-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Fri, Jun 17, 2022 at 01:58:01PM +0200, Benjamin Gaignard wrote:
> Expose 10bit pixel formats to enable 10bit decoding in IMX8M SoCs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Looks good to me.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Have you checked Fluster tests passess using both P010 and P010_4L4?
It would be good to double-check.

Thanks a lot,
Ezequiel

> ---
>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 27 +++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index 77f574fdfa77..b390228fd3b4 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -162,12 +162,39 @@ static const struct hantro_fmt imx8m_vpu_g2_postproc_fmts[] = {
>  			.step_height = MB_DIM,
>  		},
>  	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_P010,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.postprocessed = true,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
>  };
>  
>  static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12_4L4,
>  		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = TILE_MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = TILE_MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_P010_4L4,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
>  		.frmsize = {
>  			.min_width = FMT_MIN_WIDTH,
>  			.max_width = FMT_UHD_WIDTH,
> -- 
> 2.32.0
> 
