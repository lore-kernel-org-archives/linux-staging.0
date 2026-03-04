Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DC2773F0
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634666; cv=none; b=ZzhGQCOpOZquJvT7K689PNb2SOBpKiyn77vS7DN99SjD2z8nBemlw0Gx1KQ04TkXHPjTqDR/QELyeOEbqQ40z7bkXfG9BE35JTGm6MS/zIAgz7FcA/07tYC2kl8T4fhCNQide/psnpEIDJKYz0LeWZqT5in03HJw9/ibv+JUOVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634666; c=relaxed/simple;
	bh=49HstGghE6b9RLyZMCCzIFM2zryy+XzLsfNn9PHJj84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IymIC0g+eHZFYlRW4gRCN3y6Ftp7zeYnIXPsNePeZB9rMLKrXFPoZlPkNdmQdbmEZAmd6Z3uiWmp7x8RdAkjIYwfK9cdIbCFY0c5HeGaSnnPuqVxjfYpYRqss/+Grj4hbaWrU5r1NapQdplXeDFV+biqa4Cm5yMYUcx6MXjlkqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5+ufZC4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5+ufZC4"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439cb5af25bso408846f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 06:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772634663; x=1773239463; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e22QuF4Z77P320CkhRoj854rwaL3cGinuHQezA/B5ho=;
        b=r5+ufZC49RsBofCx23Hru58wwoyBESRVyQ24ODbg/xsG+ClBK1UUybdFbyeU5kuqTA
         rV77ItSyJBs4S5HdCfzA5bIG32J5UPBSdHdWKkd9d8ghzBT6K6lFjb41W1YKCpWlZEii
         d3sjHGQ+lN8FZi2AFAZSLgcg1ggzFUvNsu+q1yhpLF74FM0qys4DxbA1HtOV2acFCnqy
         ve1qcOgFYyxOoWcu2YBFkEkkkNGycZVTp11+gHBr96tQd2ebRFFFEk5eN0QiZyRUr14U
         Oe7fOEEbn6Rx+X9Ye6dsFUx6A3hg/dJcB34gLgchWGIuzEyxeZMBCsPqH/Xm9r1j/2ic
         eVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634663; x=1773239463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e22QuF4Z77P320CkhRoj854rwaL3cGinuHQezA/B5ho=;
        b=LwRSaewPinZaeuXB9jPzkk/t0j9cjVqVWDzWJ/uEZdLh2DyDq8k0EBMUXtKY+jUtOi
         YLtGuUDkawdk4gNkrDewrI2mBbuIPdn++NW8IKGkvfUiHJptOmTlGagQTIEgNP85rD5W
         4kbg7DJ0BghTg/xjDeaW5EH3r8TWG0pJZUFk3TMr7ZYOtXnJAuMAycZvahUCSOVAHrzl
         bIswXvAFvtV/UH6BPEFAaG1IDRsB0RAf8wt7DUdtz3oRm1dr/BFwcTBAuNaRe45KcxuO
         UYgew1nNxNr+xey1wR/fZQ5MoFTCPY7gYbMC/16Uepulc0bTPTP7xBesEwOUgkRndCxg
         Qdfw==
X-Forwarded-Encrypted: i=1; AJvYcCUV10XV5Gy094wlHfPdlrD0gz0u/Sw7poZjrqozIp79lREz5DcBp93eRg/FHkTlr3xKyXklUqDJVMOgnDT2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6TpqxyuAo2LIggxZvMpcQS9j829eqLOXpWv+6qw7T6LrgJs8L
	5S22vXkgr7LbE+LU20evY+QjpWDnmLYCz+xYuanFOqSyGKgDeyoK//svCK3CKgW8KLo=
X-Gm-Gg: ATEYQzwGjThETrmXqezriWSzB2APt233DRISPhu3/ZtUO01RLglLOdZxJXvK2ADx4+V
	NRs333p7PizUS3PHm24gfapRCCZEBHexH6WcwE0H0JxVMZ8VSN64ObZqP+4nQ/Pej6853zgJxgU
	FEuVu3lIJcDsIEQljMQt0eQ+xsVYIyJ0tnayJjKp25bG0ahyrjKb+gsm5G0kjryAc+8wayW8Fae
	M/jDKm89iJv83GeiYn7g6NaTiHl9/GNN7DET0eecfp8wSAmkiagBWlNAwA0auOdeU+0MtFGOeMq
	I85c3dcCcwmNuPJGVhQOiMtMFrhAqmNq6B/iro00IH98xXKtFzpBfb0Xx6uqvfl5SlOBHv5mTCS
	AwujO+4ktLHIA5zuYx2l/HHsc6nvz9sjYkBUxRj4ZGwSXtA4r1/PPrZ+7odSv58a/bxEcbk4FCK
	BQ0Vri97B+JKjyln9XZek9y3RJxxh8
X-Received: by 2002:a05:6000:2404:b0:439:ab3d:1c27 with SMTP id ffacd0b85a97d-439c7f6a523mr4415308f8f.2.1772634663326;
        Wed, 04 Mar 2026 06:31:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ac9f3e5bsm34010210f8f.37.2026.03.04.06.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:31:02 -0800 (PST)
Date: Wed, 4 Mar 2026 17:30:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: sm750fb: sm750_sw_i2c_init: return -EINVAL
 for invalid GPIO
Message-ID: <aahCI4E54NjUwT2m@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
 <20260304084545.156170-7-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304084545.156170-7-officialsohamkute@gmail.com>

On Wed, Mar 04, 2026 at 02:15:45PM +0530, Soham Kute wrote:
> Return -EINVAL instead of -1 when the GPIO pin number is out of
> range. The caller checks for non-zero return value as failure.
> 

The caller ignores errors.

> Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> index a17f758dda6c..d90a93ab8fdc 100644
> --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> @@ -394,7 +394,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
>  	 * range is only from [0..63]
>  	 */
>  	if ((clk_gpio > 31) || (data_gpio > 31))
> -		return -1;
> +		return -EINVAL;

Need to update the comments for the function.

regards,
dan carpenter

>  
>  	if (sm750_get_chip_type() == SM750LE)
>  		return sm750le_i2c_init(clk_gpio, data_gpio);
> -- 
> 2.34.1
