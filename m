Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B75E384CFF
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977685; cv=none; b=Qz70vZJ8gkwi311kHRIxJqe6jVJ2JUl7w/R9pDZs9JIm3ZluCsjKxg8EuS45tvCa8XtmjBjeHVo01t41M8+P1sDjRsXqOcG7wtiLlgzTvG5AWe/NpFNo4PavzlBroefe9WxKBTwu2hAVq2AOiQOgXfXEiiFrWtRvK58CiwXF2PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977685; c=relaxed/simple;
	bh=rdPGG8pktzYfsd4W8n81NxemFwnNGSn28UK5dAbJa5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wleh2FgqUhz6T2WHQc4M4ykiPllfULLHKKrlnAk4L/0GRv86ZdbXBmd36r4S6GSm/9E6A+tDft3Kogtb6bK8EVvu0wV0FLRLLAzf9rTE8R6iFqipCPa1jerZ/n+WxQXCcH1v99OO3vkZN7qAxckZdXGJ8HNA1EF754wwQCbKkls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxWMm8Zu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxWMm8Zu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so492345f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779977683; x=1780582483; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t5ZWNU2/v1WVVM5yKXhZz4uBk/9oPZrNGdrmkhMBSCs=;
        b=FxWMm8ZuFm0CKD+r+zSkAhER+Ba0nWaz60nQtC+/yh07KhGCxD0Br+BeC7qDuIxfZR
         tSrV7dODzy9i1HgR29bHI9Nn4R9tWSlLx5VjqihY7gOiQelKszwMmDCLh23nxydcksVs
         0EMQegRckid6MW7yAXo8rWeD+FPQI50fBG8nr7YdAsSjRwEs0cUuTg+hiZLYJvo0lISE
         EnvSDBtH0E06TPX+yAcKBobmB+fj6WUTo2JKssFY8wWikF3OxYwGFeIJfNXbZRFjqRvz
         MyliQpJNclKoCRx8Co56xt83EDCY7yGzwbiCu4+sM/z8C343w9VSY9uidQEIHgMRQpPB
         R7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977683; x=1780582483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5ZWNU2/v1WVVM5yKXhZz4uBk/9oPZrNGdrmkhMBSCs=;
        b=q8afWZjCQUa2FSwEAE44vbqOxxC3ul9oVXjPRKHN5kYpD8lpGFraBYrNHMt4VTRDVH
         K48lE7n8+7yEwalvRc+/yN/p1EtlPSQMOY+gqFElGZVDE+aPRd9cVpj27qT7WJwF0y8D
         nygTEynlkAZAxJiTvT0rinCntko4BExMI7qdgGWXlID7PFjxa3qLGwkTt/xVcnE12KIy
         rgGpTrOEhfjkgQABX6VJLj4Eajm0MDdVBIQyohpOu0rge+sQg4qn/3hxqyVL8fXIiv7V
         ZHFPTIzn2mJM/q4S8xC4T6RtD7R5srJG27UeKHlHV3N+AyP1RI+joMXNNmEFPp+bEFA/
         bIvw==
X-Forwarded-Encrypted: i=1; AFNElJ8V67MZW3PRFYmG1uVKESlbmAV/k3XTWw1CazL1IEOY4rF3ozgm4/xFuVZ4nVnMLPKF+0TemKuzZtydhEvE@lists.linux.dev
X-Gm-Message-State: AOJu0YwM1S83YkP7PYhyCvYbzdxmOIy04MWBd+/vq3Xj1xuaNftyu9GY
	n9SxdQm1E5A025XhJ32xw+/M0KxwTTl+J+883MwERzK/eT0DSMuD2c/9
X-Gm-Gg: Acq92OGZyECSE5eiczKB+hBuhqLA6QJoug4bvVdlxsLsUcLcuIsRYAiBli5k6O+MgXY
	IjGSkq+A4LYc385Jt6ZlIyZjA7U668wKX0GYTVPIdOsZaJmvwa6vr8vgcnTqHT+AaX2u20OoG4I
	rtN0xkM3QAe3mHM5u1o1My8brja++BwZp1SK7gN1eVtSZAeT1CnObd5We6/A5gZ4RwSI8cJHr1z
	jrjA8hOnmvuNHvuiKgyCQF/B94nf8AKCEyJmvrKZc9cLVUPbotZOEBbRzfp/Amx/Eyi/weq9AHA
	+91C7QnUEZx1lVI9Xj/djKGglX+Mg6gPRtNTqaUrM7+dIgbmaeB7uPnlALP9pM9ZWj1y3sgUgNe
	xzqm8aruZrE162BuqCxA2wmY6Rsz7nDdmz9XmlCXx5t4Ld2e9lTu+KKSQLZxOaOUWfbG97TgZgM
	rxtFutrCiB/4eRiIQCgv87Jjc0YGF+/iB43g==
X-Received: by 2002:a05:6000:29d7:b0:452:bc74:b129 with SMTP id ffacd0b85a97d-45eeceda8bcmr1325768f8f.16.1779977682661;
        Thu, 28 May 2026 07:14:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eeceb5b5dsm2333753f8f.28.2026.05.28.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:14:41 -0700 (PDT)
Date: Thu, 28 May 2026 17:14:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Onish Sharma <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: sm750fb: rename setAllEngOff
Message-ID: <ahhNzvLUTIZ3qq6L@stanley.mountain>
References: <20260528133627.10850-1-neharora23587@gmail.com>
 <20260528133627.10850-2-neharora23587@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528133627.10850-2-neharora23587@gmail.com>

On Thu, May 28, 2026 at 07:06:27PM +0530, Onish Sharma wrote:
> Rename setAllEngOff to set_all_eng_off to comply with kernel coding style
> and improve readability.
> 
> Signed-off-by: Onish Sharma <neharora23587@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  drivers/staging/sm750fb/sm750.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 8f01b3c63fe8..716a8935f58d 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -848,7 +848,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
>  	sm750_dev->init_parm.mem_clk = 0;
>  	sm750_dev->init_parm.master_clk = 0;
>  	sm750_dev->init_parm.power_mode = 0;
> -	sm750_dev->init_parm.setAllEngOff = 0;
> +	sm750_dev->init_parm.set_all_eng_off = 0;
>  	sm750_dev->init_parm.reset_memory = 1;
>  
>  	/* defaultly turn g_hwcursor on for both view */
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index 0492b1afbb11..e8885133da2e 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -44,7 +44,7 @@ struct init_status {
>  	ushort chip_clk;
>  	ushort mem_clk;
>  	ushort master_clk;
> -	ushort setAllEngOff;
> +	ushort set_all_eng_off;
>  	ushort reset_memory;
>  };

There are no users?  Why not just delete it.

regards,
dan carpenter

