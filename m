Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7CD6FC3
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863622; cv=none; b=CYdFWVOfh+7cR5U/EuN2MdNI91Rd/uYyEPZpf+DiLVL+K6U65XRps5Uc0FOXLeNVxdxr1XtLiZ4kASnIMNjsjko9x0MVQZ4ZAXQQ6IjCMJRL6OABqjXjH3Ea3LSqkZTGnKWjMcSdqEsx+L7sKo/p5XDV07Zoz2EX2g3nongmiqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863622; c=relaxed/simple;
	bh=n6rWsRfQhHOnDdcNMoA4eBWpEZyRhkYlhRd6+rT4QLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dud5fjNnjfr4VyFveCwGxEae/s1gUo03ayjGyVEYTVcWPy/U2+DamCbFv+uO5Aj7PL+FgL9ipxAaYHnuNwSFOFnqP/zLivkxyUko8pegaJjWjT1OGqlTxHP21tsP3QLO1Uabdr8JpwllAF8Go8iZO/kzsvqYurA4zjCYcjMAThg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PTbZF7Tl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PTbZF7Tl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso31935475e9.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Apr 2025 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743863619; x=1744468419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OoxNzsNchDHOU70Y3i7GeAy+PllFDOdfRlUFcH/VIg4=;
        b=PTbZF7TlLBj6nncIqhanv9rZKsNqw3i9QPOZqCVl98cW5hnjMDIbTV77P8Vk6Y/RgJ
         RKmDfItwudej8FdeT8eztqVOARzzJJdB+Pnrvh7pFeEcYa2LgHypNJMDljNuiPO24zRO
         gbCf2zzBufb4PAyTHu9X6ny+bBxkbk0F22TOoSVPFb6y6FANJs++aIlgq/zlsvTr4fh2
         OioRP5oWUXq5/Obm2urvJGK/11GnrG+U6BpUbMenQLEK35yZKb77P9Gxgfi7lUwFY3if
         /YmlU+tCt83RMQK3s5vMDgzqfR+Pwcoss/MOdVTPm1zuaDeb/7qScmXwtN7kDwSVQJLI
         QrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863619; x=1744468419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoxNzsNchDHOU70Y3i7GeAy+PllFDOdfRlUFcH/VIg4=;
        b=d3eROMBXopd6uYcJNOt87tDpXw/wvsw62oT6hmQE6iMt1QfPV8pGUfdMI19XqdYr/v
         NFqp7Xr0+oC9CeXUPLTEcgycV6WxLOfv8NPmVZAARlqd93cKDWK6XzmylDvoMbiGkf9C
         kKr8aLgEKVEtaxfW9Qy+zYWTkSYjrVUDl6PrWxDANYv+Wq4zclwCBYStWVx9kBRtZJIB
         KNpxKDjF/aYuJpxMG+QwpYvmuCud2+b6b7dJvJUtsJxlKJTEqG3vmAqak9ZmB3v9yHyh
         wKeilrOGvDrGUfX+bgVmfnhDMawQ3xMeLjwpJOylTvrxgui3MySHz/zr/NJvjJBE4kUb
         VDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJq5+uFcH6ruzFK32Sh89D2DUF5nBaY+3SkxN2XaDFMGdxSTkSgpWlIjeHUhI2mzZXqYBdB8sppyqOkv+h@lists.linux.dev
X-Gm-Message-State: AOJu0YxrJHPGoocBy9a3odjWhhYXZB7SCux5ZnVfQLjVBYfWkXFacwFp
	36HM/eFh0zZOSvl2trM/vVAEP6Ds/lBzJIIVSbxYVX3hekGZ78D2eW3eT5ZMbwo=
X-Gm-Gg: ASbGncupsCVt9VIyyAQACxdK6H1R6SnDyiu3L/pTgw/Z52HN1fwWFPD2wkJL/nMnMQD
	pGUcVFVroQ1yeEYGgmIYgZ64kVNIKCvM2nWfOf+wggw+BNgQplXnSCxz/2AreSldbeaM2AugEQU
	2d73EqLiCbKUbgPkwe85hblXhMnRNRIbDu87iDw8y9okncUnxITOfrnMNyQ2VZl1MqNAVS+1qOJ
	ATjsi99RZr7q/GGVufHyRwciizvWyFWcRMVPquMllIPpmR9FEcIfF2OZI5MFVpTTFAVXCyCuFJ+
	gB+GcybaxtLrsdftCweDkJDEn8IeLxIQ2fOSa9/qpRPgRSdKXw==
X-Google-Smtp-Source: AGHT+IGu4vtuFZZLiDsfaR5UTawWVxjaUy8tYom98X0dcbHdh+wzwt4Sj7ZBAAkC9odrdw/Fyb2qoQ==
X-Received: by 2002:a05:600c:a4c:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43ee0768c6dmr19825025e9.26.1743863619058;
        Sat, 05 Apr 2025 07:33:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30226e9asm7222515f8f.94.2025.04.05.07.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:33:38 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:33:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Add error handling for sd_read().
Message-ID: <e8a075e6-1c55-4c61-bc4b-51764b8b2e15@stanley.mountain>
References: <20250405130642.2255-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405130642.2255-1-vulab@iscas.ac.cn>

On Sat, Apr 05, 2025 at 09:06:42PM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling to the sd_read(), ensuring that the memcpy() is
> only performed when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index 21e9f1858745..b21fd087c9a0 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -185,9 +185,11 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
>  			return SDIO_ERR_VAL32;
>  
>  		ftaddr &= ~(u16)0x3;
> -		sd_read(intfhdl, ftaddr, 8, tmpbuf);
> -		memcpy(&le_tmp, tmpbuf + shift, 4);
> -		val = le32_to_cpu(le_tmp);
> +		val = sd_read(intfhdl, ftaddr, 8, tmpbuf);
> +		if (!val) {

You've changed the sdio_read32() function to return negative errors.
That's probably a bad idea.

regards,
dan carpenter

> +			memcpy(&le_tmp, tmpbuf + shift, 4);
> +			val = le32_to_cpu(le_tmp);
> +		}
>  
>  		kfree(tmpbuf);
>  	}
> -- 
> 2.42.0.windows.2
> 
