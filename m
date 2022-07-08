Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAB87A
	for <linux-staging@lists.linux.dev>; Fri,  8 Jul 2022 09:54:23 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id w62so4827115oie.3
        for <linux-staging@lists.linux.dev>; Fri, 08 Jul 2022 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vEaJ5po9Za//FEsrnkPxw8yZtxSE9rhk4WCBsPOWM7o=;
        b=IKPynV5CRGV7vLXVINTPyxkKjJie+puMmQK+dPjIBcPew6KRz2RR05MmLQG9MQGwK6
         4lhKjJMDx0RhUt1VGaTH/NQvXq0/hjYiY6MaLRdMInpaOH3E8VXCXBbupYvOBIXXvfcX
         rdHsJPLSGFljCjcLKPVLBv9pO/Vj64ltNtjPloOoU0OT35mWSxBaN4rKPhcT8actbOiI
         H9G2S4h3fz0vfo/q1kc9d/xmS5Bs1U1RHp6iOmFpatIy4ZTpgvXV4LG6mhATxYpO5Zfa
         R4q1vFDGI1WVz6fOL3ckOwlc7NzapmEGuUv67cmI+GSYJIv6CcNcAPdZG/q41zI06Vwf
         59ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vEaJ5po9Za//FEsrnkPxw8yZtxSE9rhk4WCBsPOWM7o=;
        b=Rg/alQjwnrnFuLBcwMCoRww/zojKlskvqX0+SjsrOMzFPeQIh2zhtrYeUkxFBsNd0x
         mNpag+Rz89mJj3nxFr4aUeXRk3igS4m3nS9tVavBkJSU4ap0QqwErfrqiMPI4S1Kg67Z
         uD6rendvtq+i1kXwoRu6C3lg41UM7Z45Ug1pd4iunoCIZR2ByWvBW/uwDrOQPbWApFPP
         ULopzkQAQpUFUNQtbXF6MaJ+FoB29dT54IQsDp3gPmHcI2DEjrikfohvIv1aypZ946pU
         h6TjU5AT338WQLCjcm4gc80xi+wZPfkBdNStiA6hdCJyIZtjxtDjzYf68Ea0hrz8SZT8
         9f7g==
X-Gm-Message-State: AJIora+oTolo2T0jYpxxs+c4ZYv2XkmcsB90r+/foyAinTaAmAPIk4e8
	J3Ym1F0JnO9gfAjLMQSPIrUNLw==
X-Google-Smtp-Source: AGRyM1v4wJ7JVr6gpnAq37NLXMjnCZVAR1q0WYYm/dBK+pZJG0d6tLmmRs6CSDsDhSuogKiYR+xGfw==
X-Received: by 2002:a05:6808:eca:b0:2f9:c581:3f76 with SMTP id q10-20020a0568080eca00b002f9c5813f76mr1328601oiv.138.1657274062762;
        Fri, 08 Jul 2022 02:54:22 -0700 (PDT)
Received: from eze-laptop ([186.13.97.246])
        by smtp.gmail.com with ESMTPSA id b11-20020a9d60cb000000b00616dfd2c859sm11916643otk.59.2022.07.08.02.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 02:54:21 -0700 (PDT)
Date: Fri, 8 Jul 2022 06:54:13 -0300
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
Subject: Re: [PATCH v11 13/17] media: controls: Log HEVC stateless control in
 .std_log
Message-ID: <Ysf+xcbuIyYy7HIn@eze-laptop>
References: <20220706093803.158810-1-benjamin.gaignard@collabora.com>
 <20220706093803.158810-14-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706093803.158810-14-benjamin.gaignard@collabora.com>

On Wed, Jul 06, 2022 at 11:37:59AM +0200, Benjamin Gaignard wrote:
> Simply print the type of the control.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index ff8a61f24d0a..c5c5407584ff 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -307,6 +307,21 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_VP9_FRAME:
>  		pr_cont("VP9_FRAME");
>  		break;
> +	case V4L2_CTRL_TYPE_HEVC_SPS:
> +		pr_cont("HEVC_SPS");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_PPS:
> +		pr_cont("HEVC_PPS");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> +		pr_cont("HEVC_SLICE_PARAMS");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> +		pr_cont("HEVC_SCALING_MATRIX");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
> +		pr_cont("HEVC_DECODE_PARAMS");
> +		break;
>  	default:
>  		pr_cont("unknown type %d", ctrl->type);
>  		break;
> -- 
> 2.32.0
> 
