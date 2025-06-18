Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD862153D8
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278851; cv=none; b=tAVyDNhzOREqpz+T/lZ/DMjtTKBUJi7qYX0bikH+27rYoAl26elm+frEd1zROc6pr66yWNTJFxKwy+sUz5z13PEFIcUv0RtArDP/qAJR5XGnraMnEvoVjVOo2td3zxDu7xx+b7ulP2m37FDqkmZUv10T90xSttTKIQxN6cbQ7HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278851; c=relaxed/simple;
	bh=viIN4VP4ODTE3djzQhDO1XWP0PqliIn78TPsOQ8wxdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU5oEglvj3bXocEhTuW8Vcd6TwaB5Odjau9bsOorpPVKId5As/F1kfIMUF8OK+fpz9EoPceILvpybk9/TJ5gl8+jIxTPSZ1IVZOm6m9O2UxjKr4fgvuYyWjlwQbSSdrGC56j23k0lqGvPV5wiraIGHM+owMfuMK1AyXl4j9UJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5HfqCfw; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5HfqCfw"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7387f21daadso36725a34.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278849; x=1750883649; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=itEi+BZb0SH8g2JgLmUkzbZyvLO/gnia385Cdpkx+2c=;
        b=o5HfqCfw5iYRf1GMh7aD4qT0947bBK/bpDkT3QSoKVTZ6WI1VPBx9tCTG/ecu3TXcT
         2KWNhXavdr8qsUtgYvzhkO+xbR8rEY9uqI261gfGS51kcZwSO1CmBBdDKBjB0EKWfM2x
         HXoJJd9QAwmIeo4cL8JjHs5kbQeMy4jg/nph7W2xsRop42j/iVE60Eco+P4MgSeYpkPt
         oKDy6RAVVbEs+UZBW655FnQBMQg8ECePayn00SmJpTn0s4/zcjn4TZczLNzrh0wR8AyW
         AtAQ8Mstg+xLmObL3GcX4vaqhzUOipMUA5y5hLToo9bhQE6Vbvwre2KTDcyRPq9CmiKg
         ok4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278849; x=1750883649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itEi+BZb0SH8g2JgLmUkzbZyvLO/gnia385Cdpkx+2c=;
        b=R6rFvApHUa4TVYmSRR/Cn9c/uLbg2Qo78kfbXAytochIqdkInc6cCsUupfGF335W2+
         nuNYd/P/R+2dN30dx7yLQG8kj2ALG9WJ01GClVY0zogoJB247+xrnew5qEPrzte14oI2
         iszM/qps5esfA2gVpjMIG0Su7ekjMej1l6Whc0e7ytv/3OjW7UcSkbL0YOcUlr3FF49k
         7MVcrJUO3A0H0Ez01T67cfkAzQdP8SXVMePxlbMOyaGl3lW9C9m3+3Hyx5ng1r/2gfhW
         2uPFWD0bIZK7qryfV6TwkNOQKPq6+PY/BQuOISJ2sFgl0bYdMhM/rGhWEE2PA6xrh3d5
         Rtkg==
X-Forwarded-Encrypted: i=1; AJvYcCU11aIDhj7Q92nroEFvmGLtIN5c0BK/9lvPajNpZGuWSREICJafAiZ+dlLNwpjhszKeK3I38uzFOBWBzw41@lists.linux.dev
X-Gm-Message-State: AOJu0Yye6wBSSR1TFU6h4WGsWvmaAXydc/wWgkaaSGKzqD0BESn4oPoM
	dD+qmOzEKjKq0AOCdokC9R1ALoCYKAbK1jl7g2RGrR8Fa+TX/FOWu0XgQ2b0sEggYsc=
X-Gm-Gg: ASbGnctTVy9XYDEZaZlT0M6Yy0WrQtgfD7bsb6Isjz+3yJM2eGle5uZ0DMvFLTRpkzs
	FYpQ6eQkd8wS8mNUBi417mTFlaS6GEKuovVR7bzv8KHAqzK9+xc2y42Yajgu2xcOLGdZJ1QhIBd
	iyb0PdKwZfgqgI4b+4GSj7Wnby/N6oQp38EI4In2RF+/+5HoxZv/Nsksisvodii1xHSTwnzv9L0
	PPtgYeP1rB95zw2Xyj51wldv/w8dx8FGuojEhbfxq1kkhEWOsBFsjb1rD46rxPFFTMj89u2Pwda
	GcA7NW4x1EtDj6pxT9zBaIbuh8D46QoXmFeytTqlADLDH0Yrb1lRsDg9KAL2Cm83o9qQpHpFE1r
	f2ba1
X-Google-Smtp-Source: AGHT+IE0YqCSUx+2aZl3yM1oe6wZyYRvGwCB+3c+qJkS9lsIeREn9u3N08+YRVrqkSVKntvccr5Jdw==
X-Received: by 2002:a05:6808:505c:b0:400:e771:ab80 with SMTP id 5614622812f47-40ab5003edcmr688846b6e.0.1750278849164;
        Wed, 18 Jun 2025 13:34:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b78f9sm2500687b6e.44.2025.06.18.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:34:08 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:34:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/5] Staging: media: atomisp: i2c: sleep time
Message-ID: <3cbb1d28-fb95-4a58-b8e6-fee6c69e62c7@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
 <20250615231143.1558392-3-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-3-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:41AM +0200, Thomas Andreatta wrote:
> moved to usleep_range instead of using msleep which could sleep up to 20ms
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index f35d1a16f627..48ec2cb03806 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
>  			goto fail_power;
>  	}
>  
> -	msleep(5);
> +	usleep_range(5000, 6000);

I guess this checkpatch warning is just a trap to catch people who are
too confident.  You're not supposed to touch these unless you can
test the code.

regards,
dan carpenter

