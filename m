Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8B72C0296
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605423; cv=none; b=L92Fdpb8HfrE8rLEQKpY/AtBovY73VmaBUJ3lnKomGDWqhJBW8kZFvh3kYCpetwUqmpYDoWHyj+4sK98N+D4uj0z7RsYxdCmf3gN6sUE7Whdr6oDFezTJi+NM0PUpIuNdTR7h3/74EfC4+BSnfh5jfWxmRFdW0qUTNeilcy0fqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605423; c=relaxed/simple;
	bh=Q+7P68BobSpIPHS4RvT5H4ifxMw0+x43h+6RrwoFA1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fkbj+CGt0TYF7sg0u6YmeYKtxMM28bWgqeXTGvmex1hYwChwrO/mEZYsdVlVE7BK5nEP/JjFHbNKJHNOR0pTEUd7ICGfQbRkTfk4mjC3bPVOGnPSk1Ph9gBoCzB7xyCq+rfUmtFWpacFW4SaqFg3t+0sy5upwbOr7134O9oiru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YydMnhtj; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YydMnhtj"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8edda5d56a5so4094906d6.3
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786605421; x=1787210221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZNs+AMFgatTwzN9rphFKvuE/0PEQZq3clco5zUvQjg=;
        b=YydMnhtjXHV0pcFm9VyQ12Q+wAGmkWgb+ClY+1BGnTD2xOze7XjHGpXAoW65x0u92Q
         UBbsdslikI7DPJXCKy8wl/fabSp8BaGuXdPzbIxoXr3KNVJBLakP/R3fn+Ewjn53UdWL
         wi5M/7UPEeOnQWY/e+CCY1ZHicNeeG9th1RSwVIhLmWJjKAlGypJncg6qD//rQgNFCoR
         yt6mycvL9fyLOWiVmazSpYR9V1h5ZSiGKdvh6ZVWQghLq/7G4HC2JDTbE+tNSLKSyZNd
         ypFBjD5vcN9Ow8v8j7jD21XjkE/s9RUY6fSPk5LlEEpZZModG698/f7HOJJ5xOeeEB5z
         OGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786605421; x=1787210221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZNs+AMFgatTwzN9rphFKvuE/0PEQZq3clco5zUvQjg=;
        b=ccZoMxxaZ/06O/05haejJ9YL2ChvYPdWVq0MU7xtGAw7R1o0pvBzP/9HVe2Ex2dZAS
         hsie+mSsXCtFVF16CnVKqkDYMlXjK9LeSYti0kbWsfCvAJ0OgHNcj7i3XXkIal6m8ra8
         qj7RL2Gem6joy8NnAaI4D9Je5UCafKj4fmveH2+2gled/HrRAc+DtRnpVl7YwuwbuYHd
         cjLRimMETesKiNw0fIURlGJPRJuOK9aWi4LMyP5sRtOxP95Lnw83BymlWhm+nQsDN3NG
         9BUC2MCjQyep+NK60BkQ4gFb93yjLfNUtqeg7aSAlq5P4rDI7T9/4/T3xZgDsyYoWmOh
         Is7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqve3jbLM3QstOVttGJbHe/oXpDNpIp9AGqBhZIHNSJkIrSEhFzKMXUb6bdAbjyvaOW9eRzFMLkBM0Au6fQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxALAlrzMqiGPm0h4YoGNByS8bIfYJuAKQHhvN9uUVqBOJ9DL2W
	ZNDX8eMuu3eqfuMzlXaNiVL9yYR4eRM9Ouunt5oLxNCQ997wq4q+Gwf0
X-Gm-Gg: AR+sD12oeteXRtC41XVENFPijv1y+PF59CAq4rmHv1IdrVZQj81kHv6b5XYJqCAHmz9
	/jpMA3FAkL+bRzIRr9xOA4xYUgURs7DEI7l/7BeN2E3l7lMAdkjMxHYxfIP2ktMvdYe5CyJo9Rl
	soaGS6SD1lET4Am+eMp7hs6jsi/4gy6yX97rCGDOBjuqKYKnsGxhDhT1z4R9SLYw/9BLX9OgJ7l
	s2QndpqjwfQzTnCU8GQGOGLfTFs5HYAAWrgal9eNbROV8Y+VcznQzXUARGutCRkH12VKIRe9yxR
	A6+dvfsauHMw9WfG2A6fGyWs4KqUyVvXhmBYUwrdWgoFE3zchgekavUsMQi3zcVqES4SrHYexds
	qhiAP/PA4w4niBII63rCoaaQ3r5ktJz1BPGxoT13ojKlO7BhZuNpvPsEymJvfePtu4z9uHZj4zi
	OJFwGlNeN6B+FmRdunUIXrLwDiS6OtgKtwfpPuqRh6DP4NCKbNdYLNqVbynn7wFMo=
X-Received: by 2002:a05:6214:2603:b0:907:bfc0:781e with SMTP id 6a1803df08f44-90a80c5bb43mr29730496d6.30.1786605421629;
        Thu, 13 Aug 2026 00:17:01 -0700 (PDT)
Received: from localhost ([37.19.206.57])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a81a9e973sm9023086d6.39.2026.08.13.00.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:17:00 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:16:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rishab Madhugiri <rishab.madhugiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Use ARRAY_SIZE macro
Message-ID: <an1vaFk4UrhQPkSu@stanley.mountain>
References: <20260813020354.152120-1-rishab.madhugiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813020354.152120-1-rishab.madhugiri@gmail.com>

On Thu, Aug 13, 2026 at 02:03:54AM +0000, Rishab Madhugiri wrote:
> Clean up loop bound calculation by replacing sizeof(bds_factors) /
> sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
> to improve readability and maintainability.
> 
> Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index 0ee52637e..83519dd8a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -2160,7 +2160,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
>  	bayer_ds_out_res->width = effective_res->width;
>  	bayer_ds_out_res->height = effective_res->height;
>  
> -	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
> +	for (i = 0; i < ARRAY_SIZE(bds_factors);
>  	     i++) {

The i++ fits on that line now, so move it up as well.

regards,
dan carpenter

>  		if (effective_res->width >= out_width *
>  		    bds_factors[i].numerator / bds_factors[i].denominator &&
> -- 
> 2.43.0
> 
