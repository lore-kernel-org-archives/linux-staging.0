Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3933A9DB6
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954550; cv=none; b=IEefPejKHJ68qn2DGVpDSQhcvfnd5HOtZZz8w4aC08EpjUAOMxJ+Vd7012zNfn80unrS1dlMTacS7mimJilcQoyY8mJkarBY7p9LDuBp/Co3lRY618eaClCzbY9Rb6GEU7vl5mqvDtWJ2l2GFCFpNzsKFeHmE54tWOzbtha6BLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954550; c=relaxed/simple;
	bh=F9bgYMlUcSdEWfqlcZxhQPzu42zhWF8wvMu2b/ef3tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Er/ITtSGzKwNZ1nCFmI2DUrQ3y2btZdDpr3zId7WO9JihJevP2QXUXFCtmu/OmOSIF2sDVn3WWiokNRx4Z/S6n8IlErjt1UB8VgSgtE2PwrEBXS9ekR7sk2FM0B8Lz1g6YH/I1o94bVYXXkFbtd1M0C6wFPkrtNhkU9paACyY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvCwPpvT; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvCwPpvT"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38bd3bc3061so40958651fa.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774954547; x=1775559347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHyYYaZtY634lUMIpsDDIFlFya4BZQiw23fUYcSR5VU=;
        b=LvCwPpvTZlqFz1t+RVLQ/WCdF1bf+yxCyUMJsBcXvS6Kk5vKuYX0uAbvIPUZFwwpcM
         n+zR5eEJIVS+EIoj4eY1tZr153oQjuYYrKFQH7V2nssW9phN/RzD6keCuTB8t9HnGi/m
         elcDCgkOuYXG3OBgbq5MK7vOn/aq9/t8cpyAbBOENAU6nlAr4zuFlA9SujGp6bNln0Md
         latQ/qPhUSn9a2vIt3R0nO3mAADWQcajIgkqKPs7LQUD50NyGvk+ooXvbGZSAXtapLgG
         AX4DN5oRCryhJHcU0BpZDAf+afqkBgDbGBl8tb+zweLrnQp6LbvdvryL61qcLWf/yhtZ
         dPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954547; x=1775559347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHyYYaZtY634lUMIpsDDIFlFya4BZQiw23fUYcSR5VU=;
        b=sI9dKMA6TTve0+kQlQclhngPXdoAlSsDS9upkRbJo89MPGezklqj4YBaHS03OeXzJX
         DPGTlfh+d7+khlJjnIaYWq+rMJdiweSwIJKdIGOg5Ur16jl3z0PcqrI17EJS/hRLAodx
         BrjXTqrsDTlpEPF+gOGxbBkxDyxlNK/3iIq+pfhHs9tOsGDF5yP5ZlWby7/qcPi9th8J
         5QYgzZU7qpif4JRUWpEoPop41/cFUfAP7zcVacx5B24KYG8qx5WQiCqhPYH4fJlLltSv
         kP3qwtMvM6WacbdY4GGOHhl6a/G8GRPZ4n7L6Ruhzt/8IRwFFPxhf+0+QBGgUhRn8mOV
         a/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwuzNykQXji5E4lVD2qg8D4QeNvD8qrc7bxr5zNOOPl2Sf7S7upNpE+9fHEA2Six3xKB398j4WPucCjTkw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6S8cliqxO9nbFXjEHBVDkWcs3ADTCRtfKT853+aHtR69b/9Bx
	O1IqOHCerJjdpqIVTcDFdEOgR7h1/VIG+aJrjEN4A43OawMK20Vmbt1O
X-Gm-Gg: ATEYQzxWKlAVM4g0ycX3fZP5TDlh1awAzUgRzgbTaaqC82lcM7u4zhbXy4SAL5PcdIn
	1geckQkCHwgWNm2dTXsn1rUb1UbhlHs4uCHqz8L2DN4B77m/6Lk/weX1cHlwhv0hzEHeVnv6nGF
	2jl5PDWEjA8HP2+W82cEOnUUWsU7m/K5aqfgdXZUp5xSnnSBLMkEDE1meTiX0nXQ3uNoIg+QulY
	VFTB/vZjX+tz8aB/PFCpvxESKGw/YdXwcq1yazkPCUxIz9fNP24OUI1b669ssh9hfdr8ROsG4tS
	MZcDQJvwWsV4HeENwRa1s+CuLdSiNErcbrUOdAXf2VvrWncyNVC/OlBBj8Rx0lPlFTMOvHevQMr
	guM51EcuYkC8SWeeXMCeYffgPimofljC45XF/PBJDlBsvz+x9eEf0TWUKhPrtSePG2kBXaASjtu
	rCddHvLJMPGoBqqRuJVl0=
X-Received: by 2002:a05:6512:2308:b0:5a2:7d84:6a44 with SMTP id 2adb3069b0e04-5a2ab5fa471mr5245936e87.6.1774954547081;
        Tue, 31 Mar 2026 03:55:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1443f46sm2421490e87.43.2026.03.31.03.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:55:46 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:55:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: grondon@gmail.com
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] staging: most: dim2: replace BUG_ON() in
 service_done_flag()
Message-ID: <acuoL4DRi0pmsQY1@stanley.mountain>
References: <20260330182255.75241-1-grondon@gmail.com>
 <20260330182255.75241-3-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330182255.75241-3-grondon@gmail.com>

On Mon, Mar 30, 2026 at 07:22:52PM +0100, grondon@gmail.com wrote:
> From: Gabriel Rondon <grondon@gmail.com>
> 
> Replace BUG_ON() calls with an early return since the function returns
> void.
> 
> BUG_ON() is deprecated as it crashes the entire kernel on assertion
> failure (see Documentation/process/deprecated.rst).
> 
> Signed-off-by: Gabriel Rondon <grondon@gmail.com>
> ---
>  drivers/staging/most/dim2/dim2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 48315f8cd..b820c3647 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -271,8 +271,8 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
>  	unsigned long flags;
>  	u8 *data;
>  
> -	BUG_ON(!hdm_ch);
> -	BUG_ON(!hdm_ch->is_initialized);
> +	if (!hdm_ch || !hdm_ch->is_initialized)

hdm_ch can't be NULL.  It's a pointer to the middle of a struct plus
an offset.

regards,
dan carpenter

> +		return;
>  
>  	spin_lock_irqsave(&dim_lock, flags);
>  
> -- 
> 2.33.0
> 
