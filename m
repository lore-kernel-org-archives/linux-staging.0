Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1A32116F4
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634600; cv=none; b=e2UTBlE1xBRLWQ8LJBiuu62h3Qscsa+5rU4ncNWhEZzwV2CVa/5YBvyqFr8DlTZsG72E9eMEz9lddGXM5Ri8WSIX01jqOnoSVsCS00BFS9PSqLnbxOr0PFX/yRYDpEwVVSHULjlE9L6ayhqEHaCLouXh9iK12x4nfXXOhpwa104=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634600; c=relaxed/simple;
	bh=KJYwgD8a5x3dFWij9qo8R0F8k3yUFjNN+Nah1NIDZs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFUjPvP7D2zL2+oM+Cj4xwH/Jfd9H56cKLFg0QQJbUvyPGCfk0GfpQajHHfKBNRryj4fXnS2B1O4M0KC3idrssHUGVLEQ+/fN4CD7e2sM6kO4l5nFoZt9HicE/7GZO4uJIOfuNh//OPYZQErlJIqsbGA+YsGBJjeumbWf2b5wIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUCbpSUx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUCbpSUx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483a233819aso68268725e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 06:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772634598; x=1773239398; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vItL+rwbobOFxMZ3mkQBXQUgxfP7hCn2bqDZg0FE4Wk=;
        b=PUCbpSUxvIJ8oCl2P6UA7uONymUKKZrLXWCozvAsOXPnzSi4au56BXUaIUDEEziD/r
         QjQC3KoOyrcmS9Te9ScljfFwIsiOOiH7OEO+LtpjUCeNM9Ld8YNZnyPPFCanuBHYynWZ
         BAnCO8tpxLsjzlF3vd+aQsiZo3QtnK2P2x2KgifaJysgyVOoMO2zmWOgn+e1C9nTEDgu
         /Ey5AGTRRcLgjYgLKsCb6JQlSSu2ugnGnvfJEEY8Q/yc4LJ5d28eO8ycLNiX+4W72tQr
         Ui7GPU73Du3L7gRTUKHKBRcHM7JXGCapGf6Nf225zz/CNYfZuCc5BKG9gj3GSUbgHMMB
         rpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634598; x=1773239398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vItL+rwbobOFxMZ3mkQBXQUgxfP7hCn2bqDZg0FE4Wk=;
        b=UJqvbt1xB6J1D1K+v+alrmM3mJB7xKMpxDKElczS9ztOb17NXzN1oaPemGUHAz8Cla
         E/zKGcqp5JINCkp/GiRSZ+86xR3g6qZP3c1Z5Jq1SH7KOaM34H6pwX37ecKf8qm+nanA
         K7UIwlCHqLjtA7BYvWy8m+9ozbECWBS0/NeNVais3gvZaFUOC6O9G5NlsKxIoNWvG8MT
         zqyfxoyHq9lXfMH+zjm3Kfk+iZYqpNWuT8w1WSMtfr+8ZPpwyxe518tUBujpdJgHev8Z
         UrXBqDJB8FJL+yFtZuZJvclJKKNNgqFyGkNKLSlMPejm8Fp4HbdPhVkOriJEVBe65oQe
         KMsA==
X-Forwarded-Encrypted: i=1; AJvYcCXcFVWOuxy1oQuqS7KwxUNkVQ8UMCgjDMqpXGnuyFGyd/NoUMZ4gIdDPXDR0OUQ8OUyl8FRlilQYiPuGXvH@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr48HvvkYLWO6sqm7DwNg/P2KckAzkr+dCOEsIinP9yF/3F4Zs
	sYtwGXlmYjF+pF3INFXw7+irf3adknR7mHdWNcXKj0XkJqVM0LgZ74F54ilTsRQsEe4=
X-Gm-Gg: ATEYQzydI0f5u0Ir2gr62g1zQWwB7KSlegbem2cwftEZQrcbRjTUukp+U0njzoEq4iL
	QGOObdY72LVsFHcM0YmasQF1kCcLAZLvuoHZc/HiiNySI/MUF3+eS9rCXd1pXa937ca/ynwipTY
	aqGg+gdpGdKC8jn+WkaX489jPNCjRgIQxOFMxlNPrTa0kxdpA0uZxeT8KOradQIMJdAFw9h6zer
	Sp0UOYrIRIPJo5dU/WvnF6TlipFrlhUXP9fr1sfhxeFLPeB/G0C1xjemrLfLHPGx8h3geJ5ghlK
	RlwnGvJYPIYZQxhgXz9nRlvosONSZl7+ZQjhg46jW+rFRhpGWgTf4iebeeHSOufg+Vl7oWFrq1K
	SxZc/s80AnQhGOA7mtx17X+cGWzEtQmEwt65HQcF7CEgt5wyCm9ZKsWwy5WNqlCw6n45RTnbih4
	jnjwqaUJ6aihwXZTXd1EoxUgCmyYWg
X-Received: by 2002:a05:600c:1f13:b0:480:4a90:1afe with SMTP id 5b1f17b1804b1-485198bab53mr33785625e9.34.1772634597557;
        Wed, 04 Mar 2026 06:29:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm68911555e9.12.2026.03.04.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:29:57 -0800 (PST)
Date: Wed, 4 Mar 2026 17:29:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] staging: sm750fb: sw_i2c_write_byte: return
 -ETIMEDOUT on timeout
Message-ID: <aahB4trbBPTc9B97@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
 <20260304084545.156170-6-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304084545.156170-6-officialsohamkute@gmail.com>

On Wed, Mar 04, 2026 at 02:15:44PM +0530, Soham Kute wrote:
> Return -ETIMEDOUT instead of -1 when the I2C byte write times out.
> The callers check for non-zero return value and treat it as failure.
> 

"The callers either ignore errors or treat all non-zero returns as
failure and return -1."

> Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> index 0ef8d4ff2ef9..a17f758dda6c 100644
> --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> @@ -294,7 +294,7 @@ static long sw_i2c_write_byte(unsigned char data)


Need to update the comments at the start of the function as well.

   234  /*
   235   *  This function writes one byte to the slave device
   236   *
   237   *  Parameters:
   238   *      data    - Data to be write to the slave device
   239   *
   240   *  Return Value:
   241   *       0   - Success
   242   *      -1   - Fail to write byte
                ^^^^^^^^^^^^^^^^^^^^^^^^^
   243   */
   244  static long sw_i2c_write_byte(unsigned char data)

>  	if (i < 0xff)
>  		return 0;
>  	else
> -		return -1;
> +		return -ETIMEDOUT;

I don't think -ETIMEDOUT is the correct error code.  Maybe -EIO or
-EINVAL.

regards,
dan carpenter

