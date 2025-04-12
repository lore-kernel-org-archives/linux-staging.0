Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF79126BF1
	for <linux-staging@lists.linux.dev>; Sat, 12 Apr 2025 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744479379; cv=none; b=LfRsNVt3lmfIu/E9IC2LNLLa6OCHyRWA0DX+LilDKWJCc4XOaLuAIZusXcDa5ZfzOKqzHKfRKn1Xfv+44Gt1v4x9vdsKt1+Wt8b89Kqkz0wg7Gyw337F7FNqMnQ/5+HTvgmudhmZOzoyHbR6Q/tp7SkubRSxi4rjGOuqdVolTr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744479379; c=relaxed/simple;
	bh=VdpEtQHS4RANXbcAki1/hEz3qxnYZZMo5L/fS3da740=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/jqKjxaoPdZmxWgeKiX8my3lV/FG3Bknqj3Qxegb19OeaMeg7LIKic5W8EJaPZeRM0K928i5YbD8mjiNE9WtIUiiX1aiAhGp6c9FgrNQcTrylTxzEguLeQGBcxKjxQfcn9JLSedRjddfizbYDMU/jbk48SQre1shtz4k9uuit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lQBImZAy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQBImZAy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1766250f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 12 Apr 2025 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744479376; x=1745084176; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X7dkdux/S+32xfZZQlqaPzDOWY9Jh7gDAqzffHnwOYA=;
        b=lQBImZAy2oc+s1RRSYDcrxkNmWxiM9nExxFhddG+4+keoxlIkzOoa4oOjVmMGy7gjO
         AE6Cp7mVhATh5Dls7YzUUPFwbHi1zcTp7P2p2XSEIMh6ZB1GnRLNzcFLnO0YBaXYi8oy
         wqP/n16OouB+x+xiqxakKFK/v8BkI3Z6RtpYN6rmJ232dENA7DLuV/VyvcZ28C/P88U6
         mnfZfP0EQoyf2tvtEr9h95jWvLROXNKlk2ZM1HOc7Q2amZGUUr3l3yrxmFfEa98Ds+Vv
         LnHxvvtFcC7Nv01Hxyt1sByPwzAnpM6PCaQ9tKa1WHywwrIva4W2KbLKtD+czR3L0yOI
         be/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744479376; x=1745084176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7dkdux/S+32xfZZQlqaPzDOWY9Jh7gDAqzffHnwOYA=;
        b=Hu7b2aGxY5hOeZ+vAn/y2f9Ni5oJJeMAD+iMLazEUWFmOx8wi7EbsWcgbYnno5mpyO
         XY44qUOtiBWWSw+C/zcg+UEpz7q24LEKfU3LZC8o3PEb0m6gaJK/HZZ8861f7S/j8g06
         Yf8QuW3JglNuRnil1Bh5KJnqOIqn/9mTtPd832cgt7NBYqvrt0wQkGTYxn4NwCSfuAx3
         zAs8tcbllbIFf19QsvwT8f2Gtde62QY+1HhnsHEA22BuER/wDVfXBNee3H02ZAbU+fSr
         eKr469k9c42sKHeNT48pPhB+1wMZyX6ai7fQXEKLs9R93C89NxB9wqYN1ZhSxzqCIXiF
         IGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCURrEI0B4abjHYeHDqS/SUqk+tyDNTWrnu5MOr2EnYgA974EifYKcrrW9ilvBGDVWVoOsJwXYlTWYaWlpoD@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf772mB7P972bCsjXWmANA5K6h9zmMFDcrwSeiZGijmTwO75ct
	9i03+bUyFermDVFn7exN28nqhYUGIEbw0VxxqA19syVYP6dr62JfAT2DbQnDiWQ=
X-Gm-Gg: ASbGncvjh3Y5iZ1ehMsNBRzgCoLOrndgLJ2yxbixB4qfdiHcUCjbrCWB/ahOUUspaK7
	DMTZ4hRwimuBUPZ/gwBMNUYAaSMbViCnPxJePGcwC7Nm4VCRu6BjPZCDD6CTtTcVKETAZm7qOdq
	gHLFnZVmX9zEVJ2goLIJBvZSyBqH65Pu0ZzvtxXkLaJA8Q081oSqr1Y9myRE/445Cchh+TVtfhq
	Djddc/9xb9zwgKQj8ASGjxb8Xy2SkGI6MNi8SyWO51hqNT0RmF90IkUfryenXXFpzFhxZumCPhf
	NR8GZQQeA1ZIUFRGly7Npq3zEFJzOFAGha9fx6w3JRUJ9Q==
X-Google-Smtp-Source: AGHT+IFUwejHUevcPeJvr4IraPW9g0C7hsZdWHMbJKLSZE5OrOow4mt8Oerm5HFlqnfXpeaKs6Touw==
X-Received: by 2002:a05:6000:248a:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39eaaebc6femr5723855f8f.36.1744479376207;
        Sat, 12 Apr 2025 10:36:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf445515sm5508587f8f.89.2025.04.12.10.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 10:36:15 -0700 (PDT)
Date: Sat, 12 Apr 2025 20:36:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] staging: rtl8723bs: Initialize variables at
 declaration in odm_HWConfig.c
Message-ID: <04e0e0c1-5d21-4910-8063-c1ef67bc1eac@stanley.mountain>
References: <cover.1744285781.git.karanja99erick@gmail.com>
 <f8fd7b9ec1a1fc1a65be5e7735b37c42032e9715.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8fd7b9ec1a1fc1a65be5e7735b37c42032e9715.1744285781.git.karanja99erick@gmail.com>

On Thu, Apr 10, 2025 at 04:06:07PM +0300, Erick Karanja wrote:
> Make the code more concise and readable by integrating the initialization
> directly into the variable declaration in cases where the initialization
> is simple and doesn't depend on other variables or complex expressions.
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index 994b8c578e7a..85cda5c3a5b5 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -52,9 +52,8 @@ static u8 odm_evm_db_to_percentage(s8 value)
>  	/*  */
>  	/*  -33dB~0dB to 0%~99% */
>  	/*  */
> -	s8 ret_val;
> +	s8 ret_val = value;
>  
> -	ret_val = value;
>  	ret_val /= 2;

Better to write this one as:

	s8 ret_val = value / 2;

regards,
dan carpenter

>  
>  	if (ret_val >= 0)
> -- 
> 2.43.0
> 
