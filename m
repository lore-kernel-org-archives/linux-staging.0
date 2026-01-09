Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE83398A
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767939401; cv=none; b=MFSL2M8dXQd8CqZFQRPzw3tDh3HUEei1qWZzZzWih/BS7jtoJFIh2GL7KDgm6tgEgWVXmAx9p7ScMprIyt5HJXu9FlqSElLcPYGIScXeIaNpV0jPbWg2jLXvrcBEkqUdEImKvhFncM478QHDacLaBx7Ij7Otq6v1rxVi25oX9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767939401; c=relaxed/simple;
	bh=cxWIEq82U1+VTXKSoxLCWyjOYXii7kvOeox7/MbznYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsoF2jYaIJFs+VVAxztYTOj6RB8c1SDdVMwrDDoCnm7tcbuT4+YWrWwRCU9cx4DIzO135ar1Nj8XHMNoDrvz8SWGsoA3MPaUYmITTBg7uhkCJtjBR95enqb5z2MgJQzhnMVC8MNxoiNKF2IVXYzK7hKXfumO4KWO+AUGXoKYF1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6t9LUud; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6t9LUud"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43246af170aso1466973f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 22:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767939398; x=1768544198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RnVeZep7v8MlBogZmNLcKmMrC4cAku9pIYhPOtu1dhQ=;
        b=r6t9LUudW2/g3kUq4nsfK9PR49B0cjPlmzcTo588/701FxijxAKWNvbhNZb8BQz4OZ
         NROcKuDjbNLKoOCW9JXCDnh8YnuwPAkZPw2H5cMVHIgYGmq5ugexD60ENv0aIHDfkIZ6
         gx8644klX6FX5d/WaNLkvsseLX5Uw3vgNffyi/pF8d/WTsC5PvIIQHN1jsXp6jH6yiEY
         OSQMijLp+gdw0cl98tWjvI/La4NjvBaBwpHbsoM0UwRqeKFy9CwAzJ+Cz/N7sFwb49gx
         4o4JspqCT9VvNRY5zzE/JIdN3dK1jzYkHQmkZcOX6pVazWlYf3ZLC5B/gJ0AjcWOkaAv
         JKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767939398; x=1768544198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnVeZep7v8MlBogZmNLcKmMrC4cAku9pIYhPOtu1dhQ=;
        b=GdcL3Ii0aAlKM6+m0PaifXxKcvuLBITRg+Ks41gjvbtxweOGhIs8dJknkCRn7nIy/m
         7rZB7ohNovtNHtnX+UScy8Xy5YlY2pfHfmZrA9aR3WpQX8/DqmLNfNa9WF+yVUNtXJPX
         4NCVRyoDKKh7p788082/UjQM0mkW3WQTRhfnggiSJP9MGaQrgS2KXmCy9WLV/AGK2yrz
         WtPNQ/aqp/6VnrWl/CKncyiXKeerD9AjoOIJVLJbvwSvDKuXStVFB8LX7qXzRC3huzzS
         93+o8FkCFYdvxr9JIwxRm6QDdgM4lb8DhyedFo756BTY+UvtoWag5j6lcuK/GffGy6gW
         wUAg==
X-Forwarded-Encrypted: i=1; AJvYcCX3aeGFb1bnnBge2OHx/8PaTIeLwDgfAJnB5lhu/o5Xr6k58VtY6PTWb0gnC7/ksCmZA+F2bQloX/cDXqaP@lists.linux.dev
X-Gm-Message-State: AOJu0YxtIBMODGqrOyBUKQSGJYOczDxqACmNV6TwjvB1qLWliHlA88ni
	yqy1WibDvdOQ7Qpc8XGdkmIMWeA5RCqzoWaPori5WK13BfE0hI1nSxtOcgOjiCAkTVc=
X-Gm-Gg: AY/fxX74ibKcMB0035U+pyfS8GGRZCj7maGFqLYzpc0L/ANe4IzdZiKbtvK7F/puzz6
	4FESRop14zEIx397CafOfkGjoKZ1Wt6h/3vHBy4rwX5a4wKQydYveX4KbxhsG2SE0GohZSwHFd3
	MLSAASUNU0grf5nBm4sMyRejxV/ndTe5B43+FJnO0np1ek7yoNRIeZAegIDSfA/8OTeQZhOBz6d
	wdW8lvEKL3GT/b53MYTyUEWmQZjC++1sd1N9zFUObsBE4N8LN+8VWWyVF5tgcXDTnSq7G/l+gBP
	qhSjhL6gmHxh8GkrgIx5R4b1IVDm0GKGU80Y+ibAPwzXIvrhf5qlyYmvqO7rDrl98zkID1yTwpM
	0jksDkuZdPReSMoQn+jMbUQYNNtaDGXLThCmkKtwm+syYCbIdtWsFAqQNe/0KmYFrFGGIq/kAVu
	0zn9QOH5+HQDi8sjvp
X-Google-Smtp-Source: AGHT+IFivkvJjG8RDDGT2kzFg1mBdVrCLyhMl7ynT35itkZqPMT+julOtigzpTGHGKpDuZelQXzGZw==
X-Received: by 2002:a05:6000:2886:b0:430:fcbc:dc51 with SMTP id ffacd0b85a97d-432c375ae1dmr11187581f8f.14.1767939397620;
        Thu, 08 Jan 2026 22:16:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm20434721f8f.36.2026.01.08.22.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 22:16:37 -0800 (PST)
Date: Fri, 9 Jan 2026 09:16:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] staging: rtl8723bs: fix memory leak in
 rtw_cfg80211_inform_bss()
Message-ID: <aWCdQhZL0THdJ88s@stanley.mountain>
References: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
 <20260108181612.2340796-3-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108181612.2340796-3-samasth.norway.ananda@oracle.com>

On Thu, Jan 08, 2026 at 10:16:10AM -0800, Samasth Norway Ananda wrote:
> After successfully allocating buf with kzalloc(), if
> cfg80211_inform_bss_frame() returns NULL, the code jumps to the exit
> label without freeing buf, causing a memory leak. Add kfree(buf) before
> the goto to properly free the buffer in this error case.
> 
> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 60edeae1cffe..d80e23cfdf8d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -314,8 +314,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
>  	bss = cfg80211_inform_bss_frame(wiphy, notify_channel, (struct ieee80211_mgmt *)buf,
>  					len, notify_signal, GFP_ATOMIC);
>  
> -	if (unlikely(!bss))
> +	if (unlikely(!bss)) {
> +		kfree(buf);
>  		goto exit;
> +	}
>  
>  	cfg80211_put_bss(wiphy, bss);
>  	kfree(buf);

This code is so ugly but that's not really related to your patch...

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter
