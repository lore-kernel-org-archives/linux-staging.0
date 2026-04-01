Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2C3B95E3
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033999; cv=none; b=TyMgqOT7/Rp1W4xZAzzzByqJOFhEoDnRwSLSjf+1VnmGBPPiNnnmRygIULsqPiDm1EYkXxoDU9pzCySXLOlNV52A3mcbJfYY4HIjCv2n02X+4ty6h3Q3imZb7fRs9MvWDVcF9fmDR+lK2aTtUtYWjy06MYqQtqltbUgImPLyFgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033999; c=relaxed/simple;
	bh=y1bNRcq12Qxq27peoftGvFUoCas6fOGtr58zlt/Djlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpGNYp6z1vVo91cVzuQ8UV+XC7Yz/ATDqNksc2ySnTOHDwuHbfwwbN40JG06sL/tkD2nXqP9yPgdp2NzkN7gQTd8VcGFvDRiyMjsEYY0RrDB8LfU1Ubg4zRbjVlpkwsD5C9tiAyTcW0tgcsXdZ4KyZE5hkarXXzF6vlrYg8Qkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgv4ZzLp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgv4ZzLp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so54031915e9.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 01:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775033996; x=1775638796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWnWEKtH0ylGdVC9CRK6gwqNh+lWBWqZdfYCPLzOndM=;
        b=pgv4ZzLp702FVOSd9eJRvC+J3Uhtq7b8iSLRZHrlVxrBq8YLWv1nijOU4FP2Vxk7mf
         QInpPFdBSPSupjoevhJY6hmihXbytVzuodbg8nEyZ6kzGjAmhxJSdGaNa2gvrkWmzTHI
         RrAd6hGtv8MvIJnOCj/I88cQEs74FCdZfvLRnrskaTtZcnjkJTnPCk9UZpkkzZmnHkwS
         ZxvcbtUBnpfv20LMFCyv4E22wYwvgzuj45+VJWeD+slRuW3YhtDDQKK8PJTop7YWsOHg
         8RIoOlLhPUwcQV1o9Z7d8WI00RCQ6on1AH+z5FQvGmCnJKDBC1TsExrhFhl/Jrmlrhzv
         L/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033996; x=1775638796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWnWEKtH0ylGdVC9CRK6gwqNh+lWBWqZdfYCPLzOndM=;
        b=L/XX3/FO/WZLeEQqyyOZYFZR1tpO9U3J/g3K9ugeOL0GJ4qkWm+8zpsxJCES9ZF9Cd
         2nBRbO+cYhf1U7ojrMMzFlZlxe0bM5oZPF+u/AKPwuYPjPb4bqq/VS2e2TDzLtqgPWa2
         e1erhFdrEB6whC4gBAppTqrBjj09BOZY6OW8XAfqBJwyqfFQUS9kR9Rti391DvLaDode
         mHC7DqGgvtOkHFnku5PLrZAZDVnZ04g/RX04+gUf+P0WW3xQfX1hZUeH4d6RT84/316p
         jbYED7q7WvaOHzn94tWdmQ8/lyljymgYsKUQKUr3usbGCW+W9bx7ZBGYkMsyG/PnpMG5
         JK3g==
X-Forwarded-Encrypted: i=1; AJvYcCWvuzcXdMoUCW7kDMY/BZfkRHleJ3cUWTfCuyZcIY9iN8tC7QALAeAVQdP+YoFFwNO9bg++i5fNKN8at/7u@lists.linux.dev
X-Gm-Message-State: AOJu0YzF6DgyMoFs+uMDj0zshQrawYIPsBCkFL7WzOTcFKUQ8bPfK1YW
	M4Dn1HhrK6oKqpQ0ne/Kxctutm+X5KWISA1DePdGkPJ2exFW5jf4fn6B
X-Gm-Gg: ATEYQzyr8Zb+SYZ+AVjLyI6I8Tb04R0WRRANcFha0OsTQP6b2aMdSJXzBmFuECmHrm/
	IKalK6Ssd48uZ2W2aCgBuO86Rageo7cKWUZKil4aX7aPbe7PcMIGOFLknWWa56iR6iXVKvZdHJm
	LzMY85QMCwVJnBzBj2GHEiG8gypKfnYhPD8K1VCWa3nH3A49OfUDdGU2JA6tQBoOsS0nk09Vjgu
	A/hPosndt4VIv4IC+ctW6lrAzYlztoBNGvndfHlXaMJLOSuF4CIYfc9tg4EW4sp89kJfp0TRWpT
	nS/hMcTsyDei9OrF+BXOMgkF57jamhJAvi7/CobnwfyU606Uml9CVisu1SkGmKCAQeAbFlFl1O4
	gQM0ptKW33MtiIWg5aO/qnz0Z2uhcq1+0XHgracnkbMUbmB54Q+8uIhC0SU5WnHdCE2o+/Rgfwc
	HKm1L0LkeYOMKZWFmc0fE=
X-Received: by 2002:a05:600c:828f:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-4888356271fmr48534175e9.11.1775033995737;
        Wed, 01 Apr 2026 01:59:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c561750sm125374045e9.2.2026.04.01.01.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:59:55 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:59:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: rtl8723bs: add separate label for freeing
 rtw_wdev
Message-ID: <aczeiMNHuBaEO2op@stanley.mountain>
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
 <20260331153255.22764-6-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153255.22764-6-omer.e.idrissi@gmail.com>

On Tue, Mar 31, 2026 at 05:32:54PM +0200, Omer El Idrissi wrote:
> The original function would "unregister" and "free" padapter->rtw_wdev
> IF it ran into issues after "hardware operation functions" were set.
> The problem is that rtw_wdev isn't even allocated at that point.
> So separate the rtw_wdev_unregister and rtw_wdev_free code into it's own
> label, add error check to rtw_wdev_alloc and move it up a bit.
> When rtw_init_drv_sw fails goto free_wdev instead of free_hal_data.
> 

This commit message makes it seem like this is a bugfix but really
it's just a cleanup.

> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index aea9b4e19874..a088dae40a19 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -268,12 +268,13 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  
>  	/* 3 6. read efuse/eeprom data */
>  	rtw_hal_read_chip_info(padapter);
> +	
> +	if (rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj))) 
> +		goto free_hal_data;
>  
>  	/* 3 7. init driver common data */
>  	if (rtw_init_drv_sw(padapter))
> -		goto free_hal_data;
> -
> -	rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj));
> +		goto free_wdev;
>  

Then this part here re-orders things and adds new error checking
which seems risky.  Adding error checking for the rtw_wdev_alloc()
function is probably the right thing, but it needs to be done
separately and labeled with a Fixes tag.  I don't know why you
re-ordered things and it isn't explained in the commit message.

>  	/* 3 8. get WLan MAC address */
>  	/*  set mac addr */
> @@ -283,12 +284,13 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  
>  	return padapter;
>  
> -free_hal_data:
> -	kfree(padapter->HalData);
> -
> +free_wdev:
>  	rtw_wdev_unregister(padapter->rtw_wdev);
>  	rtw_wdev_free(padapter->rtw_wdev);
>  
> +free_hal_data:
> +	kfree(padapter->HalData);
> +

I don't have a problem with re-ordering the cleanup.  That
stuff probably has never been tested and it's easy to review.
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

So the commit message would say something like:

"Generally, in a clean up ladder, we would free resources in the
reverse order from how they are allocated.  Here we potentially
call rtw_wdev_unregister(padapter->rtw_wdev) and
rtw_wdev_free(padapter->rtw_wdev) before the padapter->rtw_wdev
has been allocated.  This does not cause a problem because those
functions check for NULL at the start and return directly, but it
is a bit messy.  Re-order the error handling in the cannonical way."

regards,
dan carpenter

>  free_adapter:
>  	if (pnetdev)
>  		rtw_free_netdev(pnetdev);
> -- 
> 2.51.0
> 
