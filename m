Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472E230EF8B
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332609; cv=none; b=kJv4FK8A8PdVDfIw5OpjC7jczltoF3NoAy9+alCpXgigNwoWnIqn6g8KFSAl76UmmbGhs+Kb8m3HhXZn4uxAIUXEeCU39OWLTuj9HiKK4Ng6Ae/IXhbkcpNPkEoR232UW3yjfrC4QJQ2gCypjFOP0mDaEr6Cia6YL0NPKzz7kuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332609; c=relaxed/simple;
	bh=/FgkbgcpoO7PcaB8vSKnNV13orQdV6npMMwLpWb8/gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYECfdUaN8geJrcY4xDeLOwtePItmS5Rr9Au0qO8AKn9Q1BZQNuPsWWfSO0ecJEHa9lQ4M3XQVlmZO3gix2VW8vvmCyCYh+tH6dCojEpTXbdgbVzarzDEcKaGRPAlGGkw8IuAklfdJeCoAqYnekdod0fICX32UV8yh24xoQl4dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kicr0igP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kicr0igP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486507134e4so10231715e9.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 23:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774332606; x=1774937406; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5ScTfIumgjrbpgqD0j/yOTuHEj5IzOxqi+eo7Q3Siw=;
        b=Kicr0igPzUkYO0PSMV24hcUotlz3e6ssxSvDOrJ1e7oLICs8rp0c+oJokeQdZNvDkc
         uYyVJ56dXkAo2flojsQ1hKsZz3elLcCQKKu4YwlFAAmBeR3I5qKGvdUxCevMwI4siXsd
         DXo0Ow1wlwFHcpa5xopFy+meA+++OGpXjT1a2yArKh000bzmpWSgszFIrfg2LYibLnBv
         5KJidgHEES9mWl9i0TomCsiw+MwLZclsjiWmNc5bnfszPBulFN4hvkRVM6Rm88q49KA/
         V3r6PVgQ5YNPVIjOpF6zFlhz7bDL8KDHYrqemUOg+B57ZI6dFFWVvVuQ+Y5PiBLPAU8G
         12Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332606; x=1774937406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5ScTfIumgjrbpgqD0j/yOTuHEj5IzOxqi+eo7Q3Siw=;
        b=TDmEZRmi1cSIjigS7/ld9bEv2tbE6HKUK8+lfm8FHTWmUZN/zpMC6QU9z/LqlElUV1
         uJaF0MRz50OSaQV9yweet8qNsS6EP2dNDT0zXgwuCndWq6RC3muG76zm3wVyUtcdbmL3
         dfULCFlbFPuWwtsh3htdhkARtqbvdCjLu+BdUCkzcoaf1AezUF4n47we2S10lWZl8iQG
         72STAMgLR/6PzFvsboFG2NlIPEyIygI3UALLdGwPBHCHV784ryz0k20FpyvyvJIGwIAP
         E8WTsCDVfTXmZKp1bhKn1DbNjOggVAnyDxdEiI7XHTIMp2XS3Q+hyTvtjbj0jyjBZj/8
         h2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVqFJj71A3UX3knKx02q3oS37McTl5fxR5Gl69iYKoTjJxAj+JP/Oyzzw8CbW3PSB/er+h3s7MY5Y6dwvUz@lists.linux.dev
X-Gm-Message-State: AOJu0YzvJyo6CMgVHx45AKNPQ8Z4U56QzWX6gcf5Bixu55p0uBhAH4mx
	7t2n4NkAvg8BOooMQsQBJ0eDtDXrfGKNu8oqm9LZT3YxV0czmGTNOqWu3uMRNj3EV88=
X-Gm-Gg: ATEYQzw0KSXMzml4kHJQMVMlqBw9JoOLzd5JrQUx5GcK4wctO1+spXY3CIFg8WiDBIq
	2i1zxEhBWHTkcpOsR50mNEMjLK05WRVEnpvn7SlLH0uyR/HTMw3HIMSO6lQOvJ6zMia6y6xNlAA
	2gcVa4LI+GMBw4JO6OD8c0I/L6sQRaksNo+Yx7NAq9/HuWYYoYL8UTG8bAXaryLnpLdPvVtFhEy
	3Z+ZHA/FufyxXVOE1q6YboHoERFkEKfktgkKC37tyAcI+BgGCmSFip2/5pSYJphLljpWrmTojft
	0zLKU/p0XBkYOPYENanhk1aTjDsb0XfWf9PXfHCV8MXJ0phQerdcsTyWymv1bWjcHI2GgEB7Gr+
	GXpY0rJkCliyiQrOekYk4pieV71QbJykFTJ0o/OmRZEr0njSx27cnmvEWpZE5E7+pRK7h7/R0ri
	fmOPgUzgIN2TsqY9F1Sx1W6s6dSl8/
X-Received: by 2002:a05:600c:3e8d:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-486fee26501mr189987685e9.23.1774332605571;
        Mon, 23 Mar 2026 23:10:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm35131046f8f.18.2026.03.23.23.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:10:05 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:10:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix error handling in
 sdio_dvobj_init and it's callees
Message-ID: <acIquuL5WnYbh8Dt@stanley.mountain>
References: <20260323232526.25288-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323232526.25288-1-omer.e.idrissi@gmail.com>

The subject is a bit long.  It's not really a "fix" it's a cleanup.

Subject: [PATCH] staging: rtl8723bs: cleanup return in sdio_dvobj_init()

On Tue, Mar 24, 2026 at 12:25:26AM +0100, Omer El Idrissi wrote:
> Return proper errno values instead of vendor-defined non-descriptive
> _SUCCESS/_FAIL macros
> Callers only check for non-zero return values, so this does not change
> behaviour while improving correctness.
>

This is how your email looks like to me:
https://lore.kernel.org/all/20260323232526.25288-1-omer.e.idrissi@gmail.com/

I can't find the subject so I only read the commit message.  The commit
message should mention sdio_dvobj_init().  But really sdio_dvobj_init()
is not a leaf function, it's a branch.  sdio_init() is the leaf at the
end of the call tree.  The subject should really say:

[PATCH] staging: rtl8723bs: cleanup return in sdio_init()







> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  7 ++++---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 19 +++++++++++--------
>  2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 7ba689f2dfc8..80ff3154f6e7 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -1136,9 +1136,10 @@ static int rtw_resume_process_normal(struct adapter *padapter)
>  	pmlmepriv = &padapter->mlmepriv;
>  	/*  interface init */
>  	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
> -	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
> -		ret = -1;
> -		goto exit;
> +	if (padapter->intf_init) {
> +		ret = padapter->intf_init(adapter_to_dvobj(padapter));
> +		if (ret)
> +			goto exit;
>  	}
>  	rtw_hal_disable_interrupt(padapter);
>  	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d664e254912c..0d6475bfbaba 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -131,9 +131,7 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
>  release:
>  	sdio_release_host(func);
>  
> -	if (err)
> -		return _FAIL;
> -	return _SUCCESS;
> +	return err;
>  }
>  
>  static void sdio_deinit(struct dvobj_priv *dvobj)
> @@ -159,16 +157,19 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
>  	struct dvobj_priv *dvobj = NULL;
>  	struct sdio_data *psdio;
>  
> -	dvobj = devobj_init();
> -	if (!dvobj)
> +	dvobj = devobj_init();
> +	if (!dvobj) {
> +		dvobj = ERR_PTR(-ENOMEM);
>  		goto exit;
> +	}
>  
>  	sdio_set_drvdata(func, dvobj);
>  
>  	psdio = &dvobj->intf_data;
>  	psdio->func = func;
>  
> -	if (sdio_init(dvobj) != _SUCCESS)
> +	status = sdio_init(dvobj);
> +	if (status)
>  		goto free_dvobj;
>  
>  	rtw_reset_continual_io_error(dvobj);
> @@ -180,7 +181,7 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
>  
>  		devobj_deinit(dvobj);
>  
> -		dvobj = NULL;
> +		dvobj = ERR_PTR(status);
>  	}
>  exit:
>  	return dvobj;

This function does some nonsense stuff.  First convert it to
direct returns and then your other patch will be easier.  Actually,
I would leave devobj_init() as returning NULL.  Your conversion to
error pointers isn't wrong but it's isn't necessary either.

[PATCH 1] staging: rtl8723bs: use direct returns in sdio_dvobj_init()
[PATCH 2] staging: rtl8723bs: cleanup return in sdio_init()

regards,
dan carpenter

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..5e093324bbd6 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -161,7 +161,7 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 
 	dvobj = devobj_init();
 	if (!dvobj)
-		goto exit;
+		return NULL;
 
 	sdio_set_drvdata(func, dvobj);
 
@@ -172,18 +172,13 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 		goto free_dvobj;
 
 	rtw_reset_continual_io_error(dvobj);
-	status = _SUCCESS;
+	return dvobj;
 
 free_dvobj:
-	if (status != _SUCCESS && dvobj) {
-		sdio_set_drvdata(func, NULL);
-
-		devobj_deinit(dvobj);
+	sdio_set_drvdata(func, NULL);
+	devobj_deinit(dvobj);
 
-		dvobj = NULL;
-	}
-exit:
-	return dvobj;
+	return NULL;
 }
 
 static void sdio_dvobj_deinit(struct sdio_func *func)

