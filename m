Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76744436
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980297; cv=none; b=Y2BGNQ+oznwKz4S3R7RWX5sU2EtQfCS697gIEXP6cbFXB50Z6WlUDfeepxMuUJhcvLnvSnZzvktZOasAYNBRgSSk8dYXP06Pp76gx4VXWRfE5mEp3bA2Go3w1wOwn8LOzFENINJ269soJaJpSuHlRBf9dlkMmDiLxmYwuIcKUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980297; c=relaxed/simple;
	bh=8TZ8h9doLm4T5ZcxRZp34W6RWvTlUkYM0m+k0tPkreo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3lK+3OLtiP99g0NUGmx+FKsCbPqlkjD+Mf6VQcQp0tsDvzM4vE3Eh+Gd/JVKi9PnfccVm2gRwZR+zo3A4a1txRrmuyORKWxrAxWlyq0b8Ue50J+TNSJP8yxtmvNfRwDU2C6YjRdboROriut/e/B93pL0CqDs2Zp1OkyK4fJ5qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1O4GYna; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1O4GYna"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f04afcce1so247089766b.2
        for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718980294; x=1719585094; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I2J1hvzbN79Iid2NNztax/ipkA856yIGZgD6qfS/S6I=;
        b=H1O4GYnaVjBbkkPpfZ9DS8J2OdO0iwNzq4F4i/+dL3Zvhej/GjQWrEyuAWwC3p0Tzu
         fq/o4iqUUqB4WCtk8Ip6s9Wh602lwe2+hV4FNBG/+CYxpiRxQX51nY75VrSKiBgqYDTx
         cX6saBv3pQwJyvJnaRK/bhGY6pC4nCMnRjK3ozGew+Wc43SM3ciNTOWfvPr/CsrrR8W/
         NhDCzEOONtrkCByd4C/bf/f6UYKx11Ivndenl/9LSp+Z5HqXoyXVj/fI8iQUBSr5rXvf
         ut2vZUiYtAiOQJkLEAKI9pMkbhkmasrjtCxKFu/VnTFPdnFmQmj+AbosUlZUcVga2PGs
         +ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718980294; x=1719585094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2J1hvzbN79Iid2NNztax/ipkA856yIGZgD6qfS/S6I=;
        b=ATBRtq0RVHaeGO3iUU4W1DdXZIwJlQE+fTEb1ScpYvGanOiNOmLmGnmAl1A4KM1oow
         QMel8dCkIAunM+M/U8XQxMs5JAUMEVxLPZ1VRY+Lotr4qm9jxpL+gS6eBYhaczQ9Xf7Z
         5Ns9QQtRZgenSB8BbCdMzKa4GF7QCVqdpjGQlyv3nq2kCCYhkm4SRniSEBAG8CWGATkF
         JoyCBpFOWlYxgut+Qx85+CFC2eMRLhGsnRsljAIHTqleNlQIreHhKjMYdpnfJ1CfKav4
         Im+dzJd/4Gv31gjtDQC3RxtE05pvq76PZVCwW7OPKcGt4WGkpCvq6+4aetmi0CzQn7kj
         PHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpcbvEZI2It6vosf48faA5JKa07ydMzXzFlC+YhgQJYyRtkB48/ckm5sP13DqHmUZUGtGCHsvWSTeI+FV1sNHiyJWcgCxyb5J7RGrBUQ==
X-Gm-Message-State: AOJu0Yzi/VITy6YmrS2iTsXw4I41oDIgsjfjtqvEpVxXT5lrx6JYJxbT
	3YtMSRwRZgyUudKoGR/RNcEJPB0F6/BJgpJ/5mS8IPPsXpyuzynCN0kfA6kLg3Q=
X-Google-Smtp-Source: AGHT+IF/ZulmKgrtcLVetIAqvPgxV5MD77BpcV5AbXd/OUAWpIhPGgO8b57jjtVc22z5kztFmtDvVg==
X-Received: by 2002:a17:906:99d2:b0:a6f:4c90:7958 with SMTP id a640c23a62f3a-a6fab609d79mr741882066b.12.1718980293924;
        Fri, 21 Jun 2024 07:31:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf5606f4sm89376066b.159.2024.06.21.07.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:31:33 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:31:28 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 09/10] staging: vchiq_arm: Don't cast scatter-gather
 elements
Message-ID: <f655db50-b9d1-4b06-b1d9-5bfc22fd2756@suswa.mountain>
References: <20240621131958.98208-1-wahrenst@gmx.net>
 <20240621131958.98208-10-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621131958.98208-10-wahrenst@gmx.net>

On Fri, Jun 21, 2024 at 03:19:57PM +0200, Stefan Wahren wrote:
> The kernel uses different types for DMA length & address,
> so better use them.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index e3d49d4bdb1d..9e6102c43e00 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -162,7 +162,7 @@ cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info
>  }
> 
>  static inline bool
> -is_adjacent_block(u32 *addrs, u32 addr, unsigned int k)
> +is_adjacent_block(u32 *addrs, dma_addr_t addr, unsigned int k)
>  {
>  	u32 tmp;
> 

You can't actually use more than 32bits because *addrs is u32 and it's
part of the UAPI.

regards,
dan carpenter

