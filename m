Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D691A285CB3
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508088; cv=none; b=kBbQwAM9yrESz2vn7Q3z/mJ+FjD0TxOyTci4h9F7MiQEcWBKtu0/7/eT6VtHvoIy73CEPQUYzTR5PnKxDGcXckRGLI8jXsVXQPTM09pOuqtLf1Q3QcOtykRG4LWavnBV4kG6BMDmQDp+b9eLCtDD+PKbyRYHc/pVgKQkG3qSCXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508088; c=relaxed/simple;
	bh=nn7+2DPi0Vk6/84iHpl+6OO1INGJcUWpTlvIFVjD/qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2De7DAemnvcDyZumJq8e7NQIZJSRx0Qh4AjVm+LCw1TR/YZfvzYSx9mJYOakULTz0uiaJb8rL75jSxX8Sp3fA9b+9ZC24L0hwIVrPFfIMBSQGqUg2dKQFdZEv9sTyhi07nJ+PrQy5P8GWZUj+h1lcNohaZI9FuwU7+XgmrI1TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDPPQctC; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDPPQctC"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ccdf8d4ac5so37534376d6.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508086; x=1782112886; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfIJ8NJLS2iVdVFuYqB5vEsChL28xPZok5XYeoWnpW0=;
        b=fDPPQctCnicrchQKsxlToUgUSOgjl1WnzSB9d1F639cQQUph1OZBEo8ZqDzOMKfBlT
         ax3H72VSAROwT0gc8mIVkn6A3z1TIWdbDPNUK3AAZqg3kQQBFbg5DBa5apFtVc1H0Krh
         rqd8LclTK5xHJQF5LW9GzkgPYd8EgjF2opMZOA1OWdLH8Uj746UWXfVhPuJc39Mg10ML
         DCy3AR4faelM/DakRmpq8DTDVjOSteOJxHsllq0Sas0/Nq9G+eBkcxhaLjW35H4++T5w
         WfhdU+k43rb5ot4GZkpWUHdrvIelPZHFBkprnmnMUFRlpH+8YC284adXWGksXRLJ1NVH
         Acag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508086; x=1782112886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfIJ8NJLS2iVdVFuYqB5vEsChL28xPZok5XYeoWnpW0=;
        b=M76gSdyRf9PhAVECQUVxaLu6+LpjIVYo2v1WWb4hK6YSf0DURMbYiUBXXknAchFskT
         w2rW3Bv986aczfJTZywkgJQ7t2Ojz1C25Klt6lys9Ggj+z+/81Iyhr2DTr/4T3BKOVc9
         DS82eHvjsCHzq0j6oUGkgvVo/kj9SLCF1xV/bNrQG+gm5zOY6uJtqr9IuuCzCf50NoZ6
         87Y4vFtrwl3fPxnn3sZn8q8o5A5Pfg1y4ULjbhp2BAfX8MHn9ahC8o8Uggr06q3bkcAz
         mK9vFop5ZtbwpEzLh2JDOFl71LJoVsZTSM8kPs4+yQFuZ0Ne+bt7hu2dnaNvbepDaqvM
         LPhw==
X-Forwarded-Encrypted: i=1; AFNElJ+BC1qn1hcabSRds4x8kFd4A/khoiqwwGtAXGyLHGbXMdfX07kwS6aGWNuT6kQBrujvUqqnxXftdkpgoebG@lists.linux.dev
X-Gm-Message-State: AOJu0YwR1qqepyzhu9Gr5/Cki4IpHZKHYi223es39VTX0FpJclwUBz9T
	6XMC2YW8Dw6uztTW9CBQttBMEXgRCGwUMr1GuRK2jH0Bppjv1GhovoKk
X-Gm-Gg: Acq92OGpZCZn4kbX2IjrTL8J1SRaVRZNuUba+BqVz2IoGn7kE3/3R/uhJjCpIfluc2p
	3+UEBN8kxbQ2Q6b6mcEvCMOYAANJBUUwnWDRaA4c5/zfay2wcXfFQtIqzHKPoNoaYuNya4XLB7Q
	s6znipytppxH06DQ9S9E/SXDkKFn+z7JAhot36X4yjzYETacFj9w0egr6MdjVcsV/3IN9COXi+R
	ptyPmIKaCbRVo/dLE27wZK43JMiOQrVxVaXSuerBE835FxbGbytYQm72v6i8omIj/+BOP1rNh7d
	F+CfJbEj3QNMU0Jxjm/DcU5CFvcMBJ8gYWUyYWEZTorf0e8nv/pGoAAGNQ5oOzdG6k5zQdw/6lk
	cPjgt6ZAwSgleez3Frn4Y9tGBaTCG1YbmCUBa7Kmve9FSVFfoWGWIE0H/ajuuHLhauy1f3lOEFs
	GRBCkRwkR6pecg+s3A
X-Received: by 2002:a0c:f403:0:b0:8ce:c4cd:90b5 with SMTP id 6a1803df08f44-8d32e30db3fmr247247706d6.35.1781508085747;
        Mon, 15 Jun 2026 00:21:25 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d304578816sm103457206d6.23.2026.06.15.00.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:21:25 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:21:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: abdelnasser hussein <abdelnasserhussein11@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: greybus: audio: check sscanf() result
 directly
Message-ID: <ai-n7jNPT862Wscj@stanley.mountain>
References: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>

On Sun, Jun 14, 2026 at 09:08:57AM +0300, abdelnasser hussein wrote:
> Smatch warns:
> 
>   drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
>   warn: sscanf doesn't return error codes
> 
> sscanf() returns the number of successfully matched input items, not a
> negative error code. Compare the return value directly with the expected
> number of conversions instead of storing it in ret as an error code.
> 
> Also remove the redundant else-if check for snd_soc_dapm_aif_out. The
> widget id is validated earlier in the function, so the remaining branch
> can only handle snd_soc_dapm_aif_out. This avoids a compiler warning
> about a potentially uninitialized variable.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/
> 
> Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
> ---

This static checker warning is triggered when we propagate the return
from sscanf().

>  drivers/staging/greybus/audio_codec.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 720aa752e17e..6daa4e706792 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
>  	}
>  
>  	/* parse dai_id from AIF widget's stream_name */
> -	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
> -	if (ret < 3) {
> +	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
>  		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
>  		return -EINVAL;

So this code is fine as-is since it's returning -EINVAL.

>  	}
> @@ -323,7 +322,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
>  			ret = gbaudio_module_enable_tx(codec, module, dai_id);
>  		else
>  			ret = gbaudio_module_disable_tx(module, dai_id);
> -	} else if (w->id == snd_soc_dapm_aif_out) {
> +	} else {

Yes, this is what the static checker is complaining about.  It thinks
that the if statement might be false.  But to a human reader, the
else if or the plain else are equivalent.  It's just a style choice
which way to write it.

I would just leave this as-is since the original code is fine.  To be
honest, most old static checker warnings are stuff that someone
already decided to leave as is.

It's better to write new checks.  Just look for simple fixes in git
log and then you can vibe code a check.  Better to work against the
devel branch of smatch.

regards,
dan carpenter

>  		if (enable)
>  			ret = gbaudio_module_enable_rx(codec, module, dai_id);
>  		else


