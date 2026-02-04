Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A823B8BC5
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198706; cv=none; b=k0wnu0jIDq1gfpuEPYWUBQX2R3G0bdR+oN3teB3l8jm19PxU6cewKWOXVNznketNRt2f7ou3O3a6GvY+N1qO2/AvEzFtHuFRPy71GBceHljnQ9iZHMjxfOU4UhJSdA+sVzPqVqZEa1SsJJgEF5tISyJgbyPvH5sjNxvEi8rEPE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198706; c=relaxed/simple;
	bh=ezthpWKnElCR0TA+hKS8v39gnjtVM/93Fiq5mpvui68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1vG9BmrZQaYej7dWES1Rks0Y8+641Tzr4w/1jojZC3pkrElcAIJz8XJNeWV1yYXCxo14ApXw2Dxw6VUlcXpFpOlLipM3IgpZU+qxQYEtmkgDB1QdE3Y39HLU9uMAF331JKwMLzIgkwupXnFSU4IehXHQBmp4E41cMNn7APt2K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZNn9OA1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZNn9OA1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43615d9c5d0so760370f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 01:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770198704; x=1770803504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+pphTL/bI4DAfxN8hx2U5FFoYBqSIHv0mUwG+qB2tM=;
        b=YZNn9OA1+23BCgYuFEU3o9HxGF4rdZ7Z/AKPmphi4agPqAFb0DjDCsnH/xdsXLxVJD
         MjIzqnQicA0/AEr/Dg7I+cJoTpdmaEIm5W4g5L+npWB+hOvPaqazlBpMXrK6NZnooWxH
         ENWBuAL9EnJ4EbjIYEXIVOCn5dJB6EUoF1TODoR7qNDWClOyn1svYsI8Bl9R8Go0UaIb
         o+jZ6VmjDRziHTXeMzGKCDz2ZRB8HD4IRVRCrtmxEMCkJftMMaAUzpX6RA9dINqo6YE7
         YyeQ8/hpD+7huyfl72vRf6dZBVeLjSndzkz0b6af+vYxaH3nPgpKZcKRYG1MhUgwDKXc
         6Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198704; x=1770803504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+pphTL/bI4DAfxN8hx2U5FFoYBqSIHv0mUwG+qB2tM=;
        b=ty+sHsGs3wWnAKbSTyQlq5Jt9Ahp/Rgu3ulzWgsDODN7LumvuncqiX6c/ZLE0U1/dj
         vHEld6TTeGRUb8M+ve5/msIZAFQMfSVaBg2YN3m/GkhZJqjszikkV41BCQsHptyhF8eu
         G2v5fOG8y8GeExgSNtXPPBpAcrqZlrX4b7Gg7z28UioRfvZbjYtkortc5FcYusoR+bhq
         8l5vm0ZVv3ZM9YN16tGwDxxvK5u2iYfWeFUn4+GPAQBpFUIZwBovOt6oHClkueJk9fwE
         2PAzkG45U87sbwJHjmM29iphiIPk9EZZ5FiGNPkwzf7AHDax2zvmEgz2DURugpBNnYNT
         d/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSy4F1dTgbIJZcTku5ta4iEjEKIFlKkkhl259cREMGUoF0iLPAxy8xsCqPcwe8JWbMQxlJgmaEbWX/xZWk@lists.linux.dev
X-Gm-Message-State: AOJu0YzrMCrEP1D+K5EV6GOhHGhL9hD1JlC+v8AghnDsC3amPSDmr2hZ
	83i/1lFilJnt9G4Q4rbRBJ+A4gT2RO1wenOW7m5t0usmc3KfaSwpST9Ra0vChfrtjgg=
X-Gm-Gg: AZuq6aItLqb+T8M+p7CP9amxxtOzQh6NWgzYTw0xXkPhNx2maPxV/yPyvpcbPwBgtGJ
	c9H+noXPbi+3eYBi4TXy3I8g7IjOXuuaSKsJ1zmTPN0faoKCGyTknlOttMC4a+6zuhwPAU97RDn
	Bwpiy+HQ4mC2vri4eL4fR6eLrTqgwd+LVVdPhNoHvH4Macrx0aXFncUnEKGDc6eXFjgO7+zB5sn
	fHI7C4Frino66CMJZGescD+/uFmVK4DRc3hNhpPR/YI8GaeC9SpGnnXgI3R6QFoyKes3UipAS1w
	r8Fx2tBSgdOLTE2BSQbsxp2akG/n0ypfTRVcFtG1mzrOV0hk5NjQ6yMias7pmoGGIdmVN5ZiX8W
	OWSe6yzMJk7+nJdtIvfn83DSC625ojPp4hbXSvRZCpDU7NPOSPJJcL5NrQi43myMmChbcZ7l/gy
	wolv4RTJMHfUYG57Ox
X-Received: by 2002:a05:6000:4284:b0:435:9223:c625 with SMTP id ffacd0b85a97d-43617e465b0mr3425732f8f.28.1770198704522;
        Wed, 04 Feb 2026 01:51:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180659b8sm4734092f8f.43.2026.02.04.01.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:51:44 -0800 (PST)
Date: Wed, 4 Feb 2026 12:51:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: sm750fb: replace strcat() with memcpy() in
 lynxfb_setup()
Message-ID: <aYMWrfvxLALsy8-l@stanley.mountain>
References: <20260203230758.3056-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203230758.3056-1-iprintercanon@gmail.com>

On Tue, Feb 03, 2026 at 11:07:55PM +0000, Artem Lytkin wrote:
> Replace deprecated strcat() with memcpy() in option parsing. The
> destination buffer is allocated with kzalloc (zero-filled) and the
> write position is tracked via pointer, making the null-terminator
> scan in strcat() redundant and potentially unsafe.
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index fecd7457e..4c6e84c03 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -1163,7 +1163,7 @@ static int __init lynxfb_setup(char *options)
>  		} else if (!strncmp(opt, "dual", strlen("dual"))) {
>  			g_dualview = 1;
>  		} else {
> -			strcat(tmp, opt);
> +			memcpy(tmp, opt, strlen(opt));

This has exactly the same security issues as the original code.

regards,
dan carpenter

>  			tmp += strlen(opt);
>  			if (options)
>  				*tmp++ = ':';
> -- 
> 2.43.0
> 
