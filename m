Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E818B49E
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724244103; cv=none; b=poBhHEXl8L3+Eq0+R+IMuCdPMMSMKZ434Z2UfbE8nc+xHEX1t0fyfe0f+ER3uv2yaodoi60PtCjWIFLYFNptb79cNaFPcNXKssbYtjWfqSUys15pVbp+5j1adyC8YDtfLKanJicvOwKZoOyL3kcXF+jno+XjoyX1TFz6UrEC8kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724244103; c=relaxed/simple;
	bh=m16333NuJhUKjmerK+UI1er6zEkuRWI+HCGKrjtXjpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7fA2XcpaZKDLdWB+zSVFXOHhYHKWE1qAaCqYAkeC8AoLbhRZ7CefsK1wJqTJuEWDLyGD681Df3w0pPQU1M+3GTx+nb9EvvoRlBH51nHueyZx7pBjXFsV61p1yzO5k9WA28xZAFah1ORAExuAddHZEr4jjVqt1TALjOYXWi8jCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5aLpgxJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5aLpgxJ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53345604960so1609093e87.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724244100; x=1724848900; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SzSNA3O6D+/pcx5BIDsspBVf4kVhsiP9gRRBtQXDenU=;
        b=r5aLpgxJBy1ZZ5edLlTQi3tT4IRnyj+Q6uDO2LO1bvMrUyVVgXYTZ++2TogTPPth4H
         +jvJ03/CTy9DCAnAJtx0GMsUHbUi1meWwXVjOXUlDgAXPYjSbezQvuig4mjkuZO4CHjA
         cy038aCijFFD2JivD2D4L/o4HMZNswmjy0uyhLatVt5x50CxbVBRQPPP9sXYHqSsZozh
         aVJWGFHW85gJfI6kbcSes4nXsqMXKNUWKKUhE4CUGcEWqYjXwiFgKAsrcbhnYfGjS+8I
         RAxUOlQFwU/OHWLnljUgvz0jpzCHbqedhsDazldEEN8ox7RG6GJd8HvHoBxElF946Wzk
         qPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244100; x=1724848900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzSNA3O6D+/pcx5BIDsspBVf4kVhsiP9gRRBtQXDenU=;
        b=ZS8Dc+lFMr0RgwvDLYpFn8bSbGNSvp1aKwMepac9FZxBz/x+tKmUZWrW+XP+Ao/LJ3
         jVEUS2mBKqv1J2eHT9EFSnG9/A5RvXSLu/5QDUptaqP5J5GSjHo6z28t0SmaGcerAkhu
         iGQCZnJ5ejo1dFu7spuL0ObQC8xoKtQFdFACa2S4pPSBTaWTnjMfAHKWhPJKpUJXLh2O
         c/non25YUf9GTdmZy4wFxd9j+fBEhJVVN1XjPs2qHf0ZPRV+GAM3bz8kY5fKDBjSa6Mv
         vL+uctfRogQWaV3vGsHuXzxpONMRNqSEv5z9edrXH494kiclEAAk3nSzrkNZhbRUwfIs
         DOEA==
X-Forwarded-Encrypted: i=1; AJvYcCWl2jazFOvHZBvjxJjz+z9xO/xLa8V8QijIlaY+i11F6QolskxL8xx6AKGXb/pQ2V0MvkD+2FtniLUV3yq0@lists.linux.dev
X-Gm-Message-State: AOJu0YyL3WHbSXahDplqdZgN01/TVxsuF8kh6kthvB4/Us2aetuNDowN
	YCvxSnrkaZX5pJLyh9KieB/Wu9+5O7YBmiKV9eg4I4mCJHRtI2wSa3/F50I5Vws=
X-Google-Smtp-Source: AGHT+IH/CV+hS9wZfJjWFZV+IAy/2IlRdv5hZPgV+hFkCpXcZ9iM7teRb2qcEyyJmrmoGnVcX1Jtmg==
X-Received: by 2002:a05:6512:114d:b0:52e:9f17:841a with SMTP id 2adb3069b0e04-5334857e1bdmr1477124e87.6.1724244099456;
        Wed, 21 Aug 2024 05:41:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a864083fe11sm261055166b.4.2024.08.21.05.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:41:38 -0700 (PDT)
Date: Wed, 21 Aug 2024 15:41:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] Staging: rtl8192e: Rename variable
 CmdID_WritePortUlong
Message-ID: <2f440b36-f771-46f6-90bf-9f0a6112d09a@stanley.mountain>
References: <20240821030856.57423-1-tdavies@darkphysics.net>
 <20240821030856.57423-5-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821030856.57423-5-tdavies@darkphysics.net>

On Tue, Aug 20, 2024 at 08:08:54PM -0700, Tree Davies wrote:
> Rename variable CmdID_WritePortUlong to cmd_id_write_port_ulong
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
>  drivers/staging/rtl8192e/rtllib.h              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> index e82e992dd139..8a1aac7e10a2 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> @@ -616,7 +616,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
>  					_rtl92e_set_tx_power_level(dev,
>  								   channel);
>  				break;
> -			case CmdID_WritePortUlong:
> +			case cmd_id_write_port_ulong:
>  				rtl92e_writel(dev, CurrentCmd->Para1,
>  					      CurrentCmd->Para2);

I'm not a historian.  I know that writel() writes a u32 value for historical
reasons.  But I feel like it's unexpected to create a write ulong which writes
a u32.

regards,
dan carpenter
