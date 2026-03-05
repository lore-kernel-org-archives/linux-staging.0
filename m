Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5211DDC35
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772689709; cv=none; b=oirS+cMGODSRKMWLuD0slyxhT7TJOZx1htwBc8PJlPXXGMnItoCiQa5hNWiUbD7Wq4gQVEcJNpKhj8gbvf0rEdO5fCsEZP7bPv7SlgXSvYAIWVtGqBNfjjoB29DuhoJaXCQI3YAkrEx3+Y/SIT0wY2ws3PqR/n617C2T+UlrznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772689709; c=relaxed/simple;
	bh=hbtHb7uyJF1aXgsD8bxT0M0kmGebDw4L50Af1vw2008=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oo8dpqRJOdVQMpqtQJJ2odVcSUyQ7FLu8mmZKadDCqXO0oXLnB1WUNTJbMwx/AJ97lg7e+3chvenVIJLTgaTljjN1f0wtGttOQyHjyXrIW9lcxoAN77jTEaueyMcvcb0YHIBxpiL0wdAfc0YhwwEeDjvM0r31APbRd4+XGVDtxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IICd5lZL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IICd5lZL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so1649949f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 21:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772689706; x=1773294506; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tosFlEOKGj8XInQr/E0mYfY51v7I4YOwqCWi7kcZaGo=;
        b=IICd5lZL5jhD8sbcremsd1Xanesu257HvEuyBeyqqeI878Y2Fj1iHwDolFs8jwqujj
         G0FIdZXDxqYQzthVdJrC0pI68G7LEzK65uroFmuTa67jclomXTpIaWXtE17FBo7NJeR8
         WAj0dXFQa0hiAxUjz/gRZZ1azlVjjMjwjKgOx59HV5/YDNgZB7F4B/PlgDrytSwWJgvf
         YV707ReMDhkEiM0Q+hPf1CYHxqMyhRzKrm8AbUJUYZlCR2HEK/MnzzGlDTMjbOM9ehv+
         /QUm/cn2eyywQOt1ocIz/6iS1pOOUGsiE5RcybW1Rve9gYcGxLgnSOjbNrqqQLnz0y1m
         BBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772689706; x=1773294506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tosFlEOKGj8XInQr/E0mYfY51v7I4YOwqCWi7kcZaGo=;
        b=dVsf0+WkDrvgRt/FkGf1nzVNd3b4bdY6EUatnpvwyeeIDMCW+uZzW9FErRzKULoVvT
         i7r2ezg4mil34GZRQZ613MhlOjqdFCKyOOiJFz0HC6eKz5eoB/i5vUWTEst3dvfYB+gi
         tU3xV3vZbx9c7j9GGcVrbJ9kXcWjpO7RWZ8VPef1ax1Z700B0CzTEV+Jily50YjzNORC
         Au/JEHS++0j39RLFkoZskXjRdfaSYFbY++r33nM1GHuzBSPD+AQiLo20wxwEwmsFQH/a
         U83GeATPEyiSU5EyXay+BqVocCOw10XgSsy17Bvty9QTAOJfCFb7BhV7Mf5kZTqjneLQ
         ZcKg==
X-Forwarded-Encrypted: i=1; AJvYcCWWKP+lUfhyfakJf0CXcbE0A3LcSwvjPkWUuu4t04neFLT0pP5gBR2IQWq6qbd68VHl2dlgITWQM9lgay+e@lists.linux.dev
X-Gm-Message-State: AOJu0YzlhGjS/9mXyhYCMLmM3ilh8+SWFL8SAh8EwdhpacRZQ1AsmH6h
	eFl+AhJmnnn/sSqV8cFnFh8z4HDsHVDmD35sny7rKIytSfyeVzZ/DqWt1tWK4UhnnRs=
X-Gm-Gg: ATEYQzzMnSTEy6Jg19JwI3orR19bsczjbrGlKkUGDvB9rJn8syeW9UJ2gPwP0PP2dYH
	AssaovM+7XMX636rY6e+ubuxSDj4qf2CpAzzt+p7su3gw69LNHFJAP6fG+HU2WM5EJRprxSIZjn
	wv46kkDGJPPTFaCl10CwXYgaMafA/1cYqcK8ulACIBXUVCv175h4upI3wMldWI9DfwwOLaEeg1H
	VoqjTRa+0xFTRR3qGhVmv7c/yOnAJK2WqBNkEESTnkVnTbYyIJr6TtTEE8WfnE2DDoe2ZEGx4DN
	LopdEqVmrb/1qS+QpNx6kn7oRlEBIJ3bxNVurNrhzp462AnXlXIQLmCnzoy24Qv9b7nW18WEXsH
	N8gasXynurr8Ij1hzVsvFLFKq0zrE2LJqQoFeWgOr2oHutRrVbhjAHHQiPHcpA2QnecpkZv0MsL
	NmvoyKit7t0mt36SJt0VzgWDEECBQ/
X-Received: by 2002:a05:6000:228a:b0:439:c69f:503a with SMTP id ffacd0b85a97d-439c7fd38c0mr8472479f8f.27.1772689705601;
        Wed, 04 Mar 2026 21:48:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm32639731f8f.18.2026.03.04.21.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:48:25 -0800 (PST)
Date: Thu, 5 Mar 2026 08:48:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: sm750fb: sm750_sw_i2c_init: return -EINVAL
 for invalid GPIO
Message-ID: <aakZJmbAfIvyW02e@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304173529.192067-1-officialsohamkute@gmail.com>
 <20260304173529.192067-6-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304173529.192067-6-officialsohamkute@gmail.com>

On Wed, Mar 04, 2026 at 11:05:29PM +0530, Soham Kute wrote:
> Return -EINVAL instead of -1 when the GPIO pin number is out of
> range. The caller ignores the return value.
> 
> Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_swi2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> index c73943341f66..46599be8d6b9 100644
> --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> @@ -344,7 +344,7 @@ static unsigned char sw_i2c_read_byte(unsigned char ack)
>   *      data_gpio     - The GPIO pin to be used as i2c SDA
>   *
>   * Return Value:
> - *      -1   - Fail to initialize the i2c
> + *      -EINVAL - Fail to initialize the i2c
>   *       0   - Success
>   */
>  static long sm750le_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)

This part needs to be done in the patch that changes
sw_i2c_read_byte().

regards,
dan carpenter

> @@ -382,7 +382,7 @@ static long sm750le_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
>   *      data_gpio     - The GPIO pin to be used as i2c SDA
>   *
>   * Return Value:
> - *      -1   - Fail to initialize the i2c
> + *      -EINVAL - Fail to initialize the i2c
>   *       0   - Success
>   */
>  long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
> @@ -394,7 +394,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
>  	 * range is only from [0..63]
>  	 */
>  	if ((clk_gpio > 31) || (data_gpio > 31))
> -		return -1;
> +		return -EINVAL;
>  
>  	if (sm750_get_chip_type() == SM750LE)
>  		return sm750le_i2c_init(clk_gpio, data_gpio);
> -- 
> 2.34.1
> 
