Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3D133293
	for <linux-staging@lists.linux.dev>; Wed,  6 Mar 2024 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735049; cv=none; b=B2WKqm7U22YatQ70z2IGVj8Pu9dLNJLP3QR6HnZIsDie18AoyflN+aAvV6+HPk6bdjCGIIhq+xiEgAui9IOopqcEAf3/MAR0zW0MHPRiCHGUArkGugGVyq28bw/7Roq2bBDNa/PD6ENno1pCKbosOhcFaXGO3b3NjfMZAmCr+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735049; c=relaxed/simple;
	bh=D55zblidkL3ckE+AmtkNPXQnODfYtAxEddZ5M/AL7lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M16ZyhWu0CK7CZFNzt9adNERmiTEdk4cNhzHHbfmuy9Hz2wdsSxKYKeDf4PBGFJHdt8chRLLEnUv6tjPe6om+xwI4VS6fXqPmYIVCC9FCUlndNFrAvIM5qSIPhqQ1/gPSE1A5Ar5pnnUjjCrHXSMOaPHx/5XbGOvDKgWomHXl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yMfv2qYx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yMfv2qYx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so49658535e9.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Mar 2024 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735045; x=1710339845; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S4nfN6YbZjdl+jd88R4xaz7uFPn5Ccodd8JF1GyHVFM=;
        b=yMfv2qYxSmfEiMvs2f1OX2BXxnj2bdxnmDZMRrkodle2e62nk7oUK9sjw6IfUQ734u
         +141ITKkaCBIOrafLKnH7QHVbfI6NtHpop2Jmsp4Vp6RY6UvdEYwxSgwXMk5hLkcNqn/
         hCmSqdEcKVmCIovo6ru1VfpRH8HMT3G+f3l14rfehmyhM1+q/a2L6x84Ri9xFTQ7n+Z9
         VbvtAsv14AAaa0F5rRmbLPQsHcrwlBvWbtsfuW04R3Ag24yuLw/RGZ8JpEUjgaN2JgwD
         3t2tcQpkDWkcCxm+oiYJxqCinz0CcBgA0BH6u3fWEJoyM6jT1de0HMsd4hyVOcb5AWM8
         1H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735045; x=1710339845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4nfN6YbZjdl+jd88R4xaz7uFPn5Ccodd8JF1GyHVFM=;
        b=jSUXZRJtmjBu+zmtlFkwZm6b293v5teLoi4VN9QzLy2n+thKZWiFnL5sfyUk7d7jnl
         cW4/2pyZlXlyMSimIfWKRproaefpOC/ZdAfyvC769cvF7KJqhYk0Q0RMhUJ4hL5TmOx/
         /3aFT24OIS5gnJHFKl6BWZB9cp1ww2Wlhc42VyHH1xT0xOwpspvsk0FOTH/j45iaIpJg
         bffPlEsuJ9IZSJRs6BG99sSSWcsefWReqR+XZyMmfiKE34LpiJFjEe38EnJeX4GghtXG
         EP6FwpEyuQxODp3NuzVxeHLKKPkY5oVAmve3u4mgyAGJmGf5ot1iL/frw8haIl7QEciH
         f3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVwUKvFko1e7nS0jMBdeMfcIpKyOTxmxcvRXEhQOkOdPKvYR611k5+22mCxaOmhfRICqP9D1AAm60pJv9NNVDpUIMgJ5QEWXOu7AzxrMw==
X-Gm-Message-State: AOJu0YzXKC8mUqGQM9Ds3R3zHqaO6kZAQYAavLgsDbtcYfYmdBRWTa0L
	pRzGmE88mOxW5E+6tYFZjJM8icDP1e8KAFiyN0sdwlWXXTHhFN0tt8KDo/by9h4=
X-Google-Smtp-Source: AGHT+IERmlyJCEwEASgOi5a4L2ybD14kuymZDGs7u2XrY8A0Ry6r+u23L39/I9/RdxpfQRdKBbC4GA==
X-Received: by 2002:a05:600c:a019:b0:412:e290:3dd1 with SMTP id jg25-20020a05600ca01900b00412e2903dd1mr6740090wmb.9.1709735045052;
        Wed, 06 Mar 2024 06:24:05 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b00412a31d2e2asm21339809wmq.32.2024.03.06.06.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:24:04 -0800 (PST)
Date: Wed, 6 Mar 2024 17:24:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 4/7] staging: media: starfive: Add multi streams for
 ISP
Message-ID: <1efd7773-4b53-44dc-8885-4259b5823bb9@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-5-changhuang.liang@starfivetech.com>

On Wed, Mar 06, 2024 at 01:33:31AM -0800, Changhuang Liang wrote:
> ISP support multi streams output. Add stream_count to save the number
> of stream on.
> 

The ISP can support multiple output streams.  Introduce stream_count to
store the number of streams.  No functional change.

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-isp.c    | 28 +++++++++++++------
>  .../staging/media/starfive/camss/stf-isp.h    |  1 +
>  2 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
> index 9b5745669fa6..1bfd336b14a1 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp.c
> @@ -92,15 +92,27 @@ static int isp_set_stream(struct v4l2_subdev *sd, int enable)
>  	src = stf_isp_g_index_by_mcode(fmt_t_src, fmt_src->code);
>  
>  	if (enable) {
> -		stf_isp_reset(isp_dev);
> -		stf_isp_init_cfg(isp_dev);
> -		stf_isp_settings(isp_dev, crop, fmt->code);
> -		stf_isp_config_yuv_out_stride(isp_dev, crop->width,
> -					      fmt_t_src->fmts[src].bpp);
> -		stf_isp_stream_set(isp_dev);
> -	}
> +		if (!isp_dev->stream_count) {
> +			stf_isp_reset(isp_dev);
> +			stf_isp_init_cfg(isp_dev);
> +			stf_isp_settings(isp_dev, crop, fmt->code);
> +			stf_isp_config_yuv_out_stride(isp_dev, crop->width,
> +						      fmt_t_src->fmts[src].bpp);
> +			stf_isp_stream_set(isp_dev);
> +
> +			v4l2_subdev_call(isp_dev->source_subdev, video,
> +					 s_stream, enable);

s/enable/true/

> +		}
> +
> +		isp_dev->stream_count++;
> +	} else {
> +		isp_dev->stream_count--;
>  
> -	v4l2_subdev_call(isp_dev->source_subdev, video, s_stream, enable);
> +		if (!isp_dev->stream_count) {
> +			v4l2_subdev_call(isp_dev->source_subdev, video,
> +					 s_stream, enable);

s/enable/false/

> +		}
> +	}

regards,
dan carpenter
