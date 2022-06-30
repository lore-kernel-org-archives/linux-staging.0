Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC17B
	for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 17:30:22 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-101d2e81bceso232664fac.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eJY5MsxNfTnDTBWpRfYuGIpnJMS3h7qwIGokJXZf/SU=;
        b=4qpE9Xqlh8LCVZjAhVL6VmJW8gFDr5tVr6AffUScIOD0NsVctK6XwJvGUEQbj1bggv
         Zi0cl94d3kOceYChCHUi9cy7jPTzSvkjIuyReTX5OOfsDLigMNzFrWVth51sbRrvG8SV
         8C0OlVewUuJSoOvXCplJX6YbhSnE9L6+rzL2q3xwpEAOA3L1cCy+RW4vruhvVxUSKEsZ
         LlUg7Xn+IVTwD5Mageii8ELu3At8wUEi36cZ+YxZG/krL/dS65fGTsaZhMqvMI8ExxTV
         QcPxhJebo5cepb+WQclHIKyfnLNpfbHDHoN23kwA9dQnpMqDWxhZw7MmjHFTN2OOMaUp
         qdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eJY5MsxNfTnDTBWpRfYuGIpnJMS3h7qwIGokJXZf/SU=;
        b=3V3MYHMY13OFjlcX8ZeFkuMKyfOZ2QRMqJcbV0f8Lf2/uyTG9+WlY1r+kPa8Xt8o8i
         SBbAzDOpe7Gp6Mo9t5cDnGXIJZZJZ5X/OEL/zQj4ULuhEh2sc9n0d3T8uwWLXziMFidf
         2zBBAIcwlEQTm3qBD5K/W0rrvxBObMsxnybP4JJM6/wCK6q2yme2trYkUqEl7e1Ljyzl
         0WaqLugEbUa++8omaxhIohxjksB/PqaQ5e1d00VHtwCgkFN6L6QIz4F/wT2xcB3fy174
         lD7k5gadeIpWpsqNjTAEV2GKcBom5AABr54sf2aSifCs93eCaRZpUpkzSv1Nuk40spMU
         UptQ==
X-Gm-Message-State: AJIora+5kJ+bvfHTzcZIiMNWnywBms+m1xi8Q3H00gwZwpz4roZBPjJ4
	hHndb/VvM0Q6RXqb9AIUbR1sdA==
X-Google-Smtp-Source: AGRyM1t4nWwAndTq5PNsUK2pyU0AyCgAgapJSJwk+PMvmJlVrviN4+sLMJ1Qy/YsZCdRe9kj2u2IwQ==
X-Received: by 2002:a05:6870:e2ce:b0:101:a7c3:49cb with SMTP id w14-20020a056870e2ce00b00101a7c349cbmr7105251oad.197.1656610221161;
        Thu, 30 Jun 2022 10:30:21 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id r10-20020a056808210a00b00325cda1ff8esm10445255oiw.13.2022.06.30.10.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:30:20 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:30:13 -0300
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
Subject: Re: [PATCH 1/7] media: hantro: Store HEVC bit depth in context
Message-ID: <Yr3dpT/hQHM56c8o@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-2-benjamin.gaignard@collabora.com>

Hi Benjamin,

Thanks for the patch.

On Fri, Jun 17, 2022 at 01:57:56PM +0200, Benjamin Gaignard wrote:
> Store HEVC bit depth in context.
> Bit depth is equal to hevc sps bit_depth_luma_minus8 + 8.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_hevc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> index 5984c5fa6f83..dcb5c8703b6e 100644
> --- a/drivers/staging/media/hantro/hantro_hevc.c
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -163,6 +163,8 @@ int hantro_hevc_validate_sps(struct hantro_ctx *ctx, const struct v4l2_ctrl_hevc
>  		/* Only 8-bit is supported */
>  		return -EINVAL;
>  
> +	ctx->bit_depth = sps->bit_depth_luma_minus8 + 8;
> +

This should set in hantro_hevc_s_ctrl.

Thanks!
Ezequiel

>  	/*
>  	 * for tile pixel format check if the width and height match
>  	 * hardware constraints
> -- 
> 2.32.0
> 
