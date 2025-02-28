Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BE81F0991
	for <linux-staging@lists.linux.dev>; Fri, 28 Feb 2025 17:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740764408; cv=none; b=lsGAc0Ti4F0obKwPbwFdprp8TV23TGeeG+HqbGe7jxYztzSrRR/1euKxuGA9pMv9acq0FCn/xH3aCOU2L9/FN4MSYUFUqxjmsCvNhg9+6RVhJ1hV+THZ7kisoAoIe8p+qdc4gc1JrTaRgWCFDxNjAi0n3/LjIny7McY87fIhM+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740764408; c=relaxed/simple;
	bh=nhR/P/6U5t/QZbBIPrPO7uVnSy5xVoKPhPv0X5+5HOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUPpIHtl4e1/0MWhbDoJQnPtHrI4ZtHB7eSQPxUv328s4Xm40CEfVzPshxlLBw8hfyFjw4cZHCXyMOvhzdYBH7Cymkj6xMal++8gj0AdC9XQC/041Axb2siIBCbDT8huXRKw39IbYKP8QZomwzbUjbTJKAdFpP2t3gnsz5z1Nz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eHY6otDW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eHY6otDW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso1991922a12.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Feb 2025 09:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740764405; x=1741369205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=riQXDN9QZs6LxV8yAa+6lbOT9fE5uen2D3eotym0+Xk=;
        b=eHY6otDWiBq4pOyPce5b6fDutOvhSon3zgsZ2sDGvubfR3fNoRP7qfBWaDBZUFrV39
         rFk7CQ50HJHMBCsyfWeoGwSOGIfCYg4qlaO594eWXAW2Xca+Dgp8vTio4q6wuy0HNJ5I
         ItMXH7qY65UHqIiJTWmIAHv3+/jrlojI0OwACQwhJ8anN6qxZzJ4YhXwCI5tGZuF+zdS
         jd0w3GZc0eNcPi+/V6vsREx4da2j5iPY8BUyOjfgia/l4MDQdmGewaMpfF+H9XFEYWDw
         9PZ8g6/ZQXNRle07knAidv6lAxPKdI0D1FN5Pe5hFE5abDovHpqY6bgTbYi9MpXkJ+vJ
         HgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740764405; x=1741369205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riQXDN9QZs6LxV8yAa+6lbOT9fE5uen2D3eotym0+Xk=;
        b=OKBdP9rxMIugDXvphzlf26NL0VMUM1CdRNgJuwlfIe083waY4SEMmq9il2+bpKKXvU
         +kuxQDV/dhtAIUJ9CyWuHxkXh2j0DBeeyRKaMnqWbVXoBgOjlaeL3bc8tSOuIWTaZ2JR
         y61AK+OMo35YxhPO2Sd1kDv7pgeMDFwAMl1gIbwPeS0Fp/D548+MRp+jwIMoAbtQGFqi
         oQXadf3whk0+1a3PhroE8BL94HseUPe62IHrCoJxNsoCjF3IxGm+hUo9a9t9wafIG9jP
         G2ZAKaaOX2wAT+fsTed+MMoPdqOD96p+bKadhmwriAuxvKu/5o40Z2Whz+nBYqBI8ydq
         +Sow==
X-Forwarded-Encrypted: i=1; AJvYcCUgPlPmd62W8hpbD0JaJdeT1Rhzdm/lbziMmlM+z845dZhIsOFifJknng8m2BpqGUs1MHlPNhWVj/qY3AHn@lists.linux.dev
X-Gm-Message-State: AOJu0YzxSE9zituxAjeBw8VC/ApLLVgiiLXsQi6LJZIjxGIo744sGRj3
	c7fI/yXXiorsQKP/t0sCUgCH4ldj2tPnUpAAH+AAYczNPtVQa6iUBOZxGQReqHg=
X-Gm-Gg: ASbGnct3/C3zSIuOTtSo4tuL1aURk2tYsZzNPfNWw5KEPbmOaEchno6/fV7bCAjXnsh
	w8VieCrKhuLXvhSaG95Br5y3wNVUWGPSxaUFr/Wg4avZVXSw1UJK7BRHo7xQMozyb8NCZP50JLt
	a75+/Gx/m75DCJuxaJS099/JrUo5OpEt5vNT/Wp7OqBBgb0NhA+/apdcRQZ/+trrqVeUB7bPdQD
	0SOCFtGxLz/TI2Q4Z512ZQk52KArIL4va+lzPywgk7r7d/wS9ZB0VolmCi8jNIFZ7pLNNSO3fzL
	9TLsL9/z2ZwnqA184UCzenKCW3s8cIw=
X-Google-Smtp-Source: AGHT+IH9J6JKqMSthgE9WEHmeCIetbaaQ9ZpNXV3XeAC+1XH1Fo46T2ivFKqFX77iByopRqjkr30Kg==
X-Received: by 2002:a17:907:3e0b:b0:aa6:832b:8d76 with SMTP id a640c23a62f3a-abf25d95298mr449951666b.12.1740764404831;
        Fri, 28 Feb 2025 09:40:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c6ee4b3sm316011766b.112.2025.02.28.09.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 09:40:04 -0800 (PST)
Date: Fri, 28 Feb 2025 20:40:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] staging: sm750fb: Fix CamelCase variable naming
Message-ID: <ba45d980-c6b1-482a-8bfd-457a92d3e24b@stanley.mountain>
References: <20250228162359.14029-1-lima.gabriel.luz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228162359.14029-1-lima.gabriel.luz@gmail.com>

On Fri, Feb 28, 2025 at 01:23:54PM -0300, Gabriel Lima Luz wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Avoid CamelCase
> 
> Signed-off-by: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_power.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
> index 63c9e8b6ffb3..33e852fe6949 100644
> --- a/drivers/staging/sm750fb/ddk750_power.h
> +++ b/drivers/staging/sm750fb/ddk750_power.h
> @@ -3,10 +3,10 @@
>  #define DDK750_POWER_H__
>  
>  enum dpms {
> -	crtDPMS_ON = 0x0,
> -	crtDPMS_STANDBY = 0x1,
> -	crtDPMS_SUSPEND = 0x2,
> -	crtDPMS_OFF = 0x3,
> +	crt_DPMS_ON = 0x0,
> +	crt_DPMS_STANDBY = 0x1,
> +	crt_DPMS_SUSPEND = 0x2,
> +	crt_DPMS_OFF = 0x3,
>  };
>  

It seems these are not used.  Just delete them.

regards,
dan carpenter

