Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8FA223338
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281770; cv=none; b=pL2vCBxN9sSEbS6P35GQ6/CEl2RgwkyXRwXq+jsY+QpgjbOG2BfyNx1+FMKdcrmZgfLRwTql1yVsnC4aB5sW71b2Tg8xO6EHzecP73RRLzMX1Rs+68hVPFLXKYaXlGk8ZiE70or6U7l4k6uiaPxFAQxJgxHok9fLxoU3COx2yzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281770; c=relaxed/simple;
	bh=FLTLlRj2l99VLo6DxkctWbbapbGFjWXzr0jrRSqXp5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7FSPSxzBLV9inyag7yHjxSdPpTYIyxlJNqDCJFDO4611ToiLhx3SMySuI9FgxYghkhgC/7mY3rBaDbXaxEIPSPspmxdUPf5vkW2MlRCQ0slVG2HEZTYv7FOx68th/OuQIm3pDplRHV+55+PJEySu3+/9eWi1dbWBxZx7ghBi7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=la0s4pUQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="la0s4pUQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3cc95b0cc21so273856f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756281767; x=1756886567; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDBYQofHZrYl10kQ9PzJbTY770l6maNuIETUuPQwgh8=;
        b=la0s4pUQzZEe3FtBi8cEinF9zbN+68T/Dhs2NaL2CZWltb8pTUwQN6pZjJZid1gsqO
         S7V1l/HRky6k2XwxWadXTWU66jxcqYf5NIY9OpmAhEOtHSp+8r/yzeIMKDpnSkszrzWf
         JeZqxCwRRCGdLVOZGY97+xkjHkIx+9pdW0j/tbXZ6lHG47Ca5SI4RB51FsDzQRqocz34
         dsjDXqydhJwCN9jG/tlBlxukrgnrVVIvw+qFl5KNfrwccjl0+smaRN9IQDfwIdj+Ge/L
         5ixCNWrVM7MCg7wpRv37EZNN+taWyNet1IjUbzMXmzUjrBvrg2JCOyhAeZxVES9wWalx
         zpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756281767; x=1756886567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDBYQofHZrYl10kQ9PzJbTY770l6maNuIETUuPQwgh8=;
        b=hJP7aJdVAKUuhVjXs5T5rLm4EAL2R7xPVN4DuA1FdrfTEGaGeFr2PMRiDGErh+l0B3
         oJjkNpAthmaa3diNnpG+01s86ioyayHVDJBcAFVAc/kEP28UgmX8bPWzw/hy2FH42Dud
         y9qhIbpoyzx6bqhzncUeh86b55dn+1Bb25RIcjImCYCPd3XrTBYGj8t3/yZcJMBSUEA8
         C0RbSUUwozhI9RBP7IQ3R7/1+dSM2e66O50sl90JCo9+64UroFxU6JJ8JoUKtPgkvArQ
         ywWbPV+8vqWk1Ghrl5uGw4+v+Nk6mGJvIgAWMwKgvX6p7pez6vVmDtDPDFtcT6af04Ox
         i88A==
X-Forwarded-Encrypted: i=1; AJvYcCXZlllxJ8NrraYJ+3+IaKkcs9dzsVRP5lLlwSIC8E9K8OI820CRHBVGi0w9fnF5OUCSjxpFfC8iRMRxfx9i@lists.linux.dev
X-Gm-Message-State: AOJu0YwXA4daVChdUS2mJXGBVJTHOE2mcRXgdgjhFyGbGR209BTJcaos
	ZLXX1WIoe+qNqG4Fkg6WLTgyG6ntjHZUf5tAKcLGqDh3m8xz4Utbm+QSt6pA0NpzK+k=
X-Gm-Gg: ASbGncuvcBZImhIdGcl41C4/G4SuFbcxMeT1oN4VS+hvfix+IpmJFox56u0yTcBGPqW
	rP3V+uPD5IOTbBDXs7J0k1PplvhWcA3eHpZUg+D40zIFbZv0m1+46psBRiboAXI6vs761H4jL37
	/4d2nhMd7TQ23S2HjaVwe3EPsOv8jg1NeKxkm2S2dlWcIJ6PWmVadC054JGj3lb8NtBCAG0J0BS
	JcgPnKQsoxCzZ2i4AqWzqHolW4Jj0bIBQzmcM4kCTrYmmcI+B4hwS/iChzGe+PUHm4LrcIo8qTM
	J9GcHtdo9NxikZoU80rEOyRCKMRHDF/RljxhZZkIxpR/MwgF9tCDBhe5p5NObuaY8T7fRXW5CWn
	WP15LDLj6ttEuzdY1Md2LN/MB5V4=
X-Google-Smtp-Source: AGHT+IF6Rlth0CMRJNdIQHC/Hhgq3FdizOsAb3JDfqJzuNPw+A8sYYuExQ63wUeMcxziaJJlxQPtDg==
X-Received: by 2002:a05:6000:40dc:b0:3b9:14f2:7eed with SMTP id ffacd0b85a97d-3cc22e34bc6mr2220251f8f.56.1756281767311;
        Wed, 27 Aug 2025 01:02:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c70f14372fsm19327876f8f.28.2025.08.27.01.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 01:02:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:02:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: drop redundant conversion to bool
Message-ID: <aK67oBH4cQ10C4A6@stanley.mountain>
References: <20250827031500.91732-1-zhao.xichao@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827031500.91732-1-zhao.xichao@vivo.com>

On Wed, Aug 27, 2025 at 11:15:00AM +0800, Xichao Zhao wrote:
> The result of integer comparison already evaluates to bool. No need for
> explicit conversion.
> 
> No functional impact.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c        | 6 +++---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 692d0c2b766d..570c99192d3f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1597,7 +1597,7 @@ inline bool rtw_is_scan_deny(struct adapter *adapter)
>  {
>  	struct mlme_priv *mlmepriv = &adapter->mlmepriv;
>  
> -	return (atomic_read(&mlmepriv->set_scan_deny) != 0) ? true : false;
> +	return (atomic_read(&mlmepriv->set_scan_deny) != 0);


mlmepriv->set_scan_deny is either 0 or 1 so it's cleaner to just do:

	return atomic_read(&mlmepriv->set_scan_deny);

(avoids the double negative).

regards,
dan carpenter

