Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE49296BC5
	for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695058; cv=none; b=Zo8LaLU3JqAH/bAdiFMGndcAu3GZ08dgckAlgA7/Jpti+KWE5/GT2IsVgZ6b3qFAlJoKRNTTM+W1SGmmZCUnH/5ZsHvkyvmfoQyHRY4NP13h9J76qigc4ZU6mevbHMDmVKQ5riF4ilKN0LOQR9eusz069UkQdER06dVhwwk3lPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695058; c=relaxed/simple;
	bh=MTEmr6PLWX1CfiIGNeCXCHdIIUWkodJVfLUhpASrxR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hB1LSV2N7B6wGOPyQVxJ+HxGH0MjViSC8F3z3MZeCFFJGYG6jOl2ir1cPRx4MFD1M/cTguBk1v0QL+/MDrhMIZER2c/iETaHx3/JmdcG0erxR1dFYmXxKGSw5agYrIqE1bO7gK+JRjT2BQy4gwMHbLdLKZ2p/p6J2DFEB1Xz8zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WktKyF3T; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WktKyF3T"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a286135c8so4825315e9.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755695055; x=1756299855; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gY7XVkJ6w+vjaw3X44Oc8ca14AVZViv5sVYFg+uhWoE=;
        b=WktKyF3T2eYswj/HvboVHE31LNrKIWKWXTbYrzj17eoHsFgM7HCuZzP9u3qAKaTKLD
         jDKvLNns9O8hzZkWuphUg00qvzjPnIgOrxfPQP888S6pFFgoE5GhAl7irPw9/f9KRotd
         uPIwq8hu6PTPCUuh8o7UA5cTgBSTVHAfExrDe9RAd987XgHTew2I/NNnI3YyYewKd0E+
         hkpJqum7ioDqRYTBFBDkoZJLWoVQDiLZH9+B4EWZzvE18q2sxWYdlHERQTdMfDE+168f
         khY0d17dxC6iaN+If2mrWJdXAT5CZe+YqMoVwS8B8sBu9OgPBPnp++xLsQiUIwXDosNq
         8+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695055; x=1756299855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gY7XVkJ6w+vjaw3X44Oc8ca14AVZViv5sVYFg+uhWoE=;
        b=io1k6bkSkKDli1bPFanbMcgLQ0j5JjFZpnnsb2CtNDIBdc1JU6UvmIyRfKRzsH9kY1
         XHnv0wpZwpEKhummup1a4P5oTdbhDe7ZHwde2pcWudS9Ilhs/92eGlKzag5Rpa7/4bWa
         /jKxcFwa82Cnj6A5Qdk6Ke7oIV5uPkmAIot4LIa6uZt0bxQT7fHK7VHZfx6IZcOqPLUG
         uYY8kL5r7H41tlXPN7WfbfiHdgeMsfYyANtB6rGXhudJst7QZtFvfJvga8ZL/4h4XLsf
         PkhzLP3Ry6iXd1j7x+dQPUET2FxSJshJSReztrxPH7bzh+6DyFx+aV5UTKcM3bYcfm+x
         YdAg==
X-Forwarded-Encrypted: i=1; AJvYcCVLfOFoaSk+HREesVYNe/NTZ5/WeKNLiLRyZrm0fhVjXfWlz6NFzLseGConwdH/cTAxOOkJIIJcTabv9iX1@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjp/ALPPYj82IlkU1xW2K1wo/vyWkXQJH1SVlMtPvhJliNsyvQ
	9YTXVzBVAIet0qU9Usun/Xm3G/4jK04I3K111mCyJbvoWlXZeE54YRLhvIagNtJb4EbAsRNkbJh
	92+Pj
X-Gm-Gg: ASbGnctOUzqqVnW2Prd2ZGVwUGzozMtWjERncmxK+rTWXKaAXCnT/IA4yfmZ+CW2WHh
	tzVyScG2GdCHtwIX3WZ6h05tNe9FuYBnFSHDX26WPPqrdXnV9fbs34fckAldz3KknDX5ziL2+eu
	Z34I9UV9TZHtbXj6b5ydGNdqkn0R3Mezafh7AXpDtcGJcKnvjoDiOX6mtIH1tIS5zQJ0wjuHnWc
	RTjmpyRLPe/Gk/+7U17P9YCIJhionTbNP6ZJ++lQSEf0NY0FoDtZ/CK89ffCEOQNrfZqXdnCfL4
	L7QqqsuPoUtySNgQMMhEKofxvJ57UCspZknhDQevoac6yIIXFp22TnIEgF4g7KZgsvXnxJArj1M
	9K3iprjwaou2G56mv+2OQZVR6NfAO2gETkgAOXrL19e3o4Z7cUIztUA==
X-Google-Smtp-Source: AGHT+IFDXUSqh4DOnr6eHhJBZWOZMSWPHk/5O4ChkMSVZ6URykazM/OIpEHf8YVEdfT818C1CmnNkQ==
X-Received: by 2002:a05:600c:1988:b0:459:dd1d:2ee0 with SMTP id 5b1f17b1804b1-45b43e0339cmr54417895e9.0.1755695055064;
        Wed, 20 Aug 2025 06:04:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b47c30dc1sm31620545e9.6.2025.08.20.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:04:14 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:04:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Whitespaces style cleanup in
 gdc.c
Message-ID: <aKXHypUfl00qE0yP@stanley.mountain>
References: <20250820124519.2287171-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820124519.2287171-1-abarnas@google.com>

On Wed, Aug 20, 2025 at 12:45:19PM +0000, Adrian Barnaś wrote:
> NFC: This patch cleans up coding style whitespace issues

What does "NFC" mean in this context?  I only know it as the networking
protocol.

> in drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
> 
> Fixes include:
>  - removal of unnecessary line breaks
>  - correcting spacing around operators
>  - correcting spaces between types and names
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---

[ snip ]

> @@ -85,8 +79,7 @@ void gdc_lut_convert_to_isp_format(const int in_lut[4][HRT_GDC_N],
>  	}
>  }
>  
> -int gdc_get_unity(
> -    const gdc_ID_t		ID)
> +int gdc_get_unity(const gdc_ID_t ID)
>  {
>  	assert(ID < N_GDC_ID);
>  	(void)ID;
> @@ -96,10 +89,8 @@ int gdc_get_unity(
>  /*
>   * Local function implementations
>   */
> -static inline void gdc_reg_store(
> -    const gdc_ID_t		ID,
> -    const unsigned int	reg,
> -    const hrt_data		value)
> +static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int	reg,
                                                                         ^^^^^^^
Replace this tab with a space.



> +				 const hrt_data value)
>  {
>  	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
>  	return;

regards,
dan carpenter
