Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120511D172F
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490503; cv=none; b=KiBoHtpQhkVsJs3asOXI1QDpdvuD0Bvh2ZJra4djBLAZTXqpis57dhU5K60LIOHXxHMIH98ZHX09NSyf7UDxTM2sBR3dhqE2fiaqctLBULykjPQpnHiZ5w28aRpGNxwKxEiYguAHcZpi3RyL1YMrm3PpKh6u7CGqatN4aSM/Fwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490503; c=relaxed/simple;
	bh=3UcgYWbawCrKqnDgXfJyWHag37jLry65DZFURo9649w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0c2Su3y5cZUTOK+emouTuBxiyZuPWw2VXZRyg+a3TAoDcA0axQry3yk7iFfMDA59AX505/lJvOciGzj55Q2QO5Gu+54exYrL5kmuT5wYBm+TUe8hVT5LAZZ6JciX6hxS9z9Ot5e+WGbyjyFS9rYxnPY2FwC3E/IaRzemkOpWlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iecD3WyF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iecD3WyF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d518f9abcso1578480f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 12:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730490500; x=1731095300; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VyOSdZozKOWrrNO+3IjlLg6SrCFccraJpEYre6+ope4=;
        b=iecD3WyFb9nZUxY+m5EFfSNlIwVFqX42IvU5pFJ7yzGaBIpYz8+9UPm6q2zcCRRhsM
         +oRmAsVObu8UerjhxEvD6sSCKBZ9yFafChzergxMIZxTEwKLdQS29MDZ2YQfxv0o+XMA
         YVoda9PXQ2DZOEQ19gKfY5Tagea8dOYCXYO0gqKN0JBzCAvmy5XJElmpBa5StCJ+PnNq
         YXZ/0YCqSg2rCj7v7dx6G9FsdpyVAUpgEqXcJviWigeBGYBpa0YIrMJhcGSduCW+BwNj
         ipRt9OWo+bjBzuT64Y/+DK/Q5H8RipFHy5Bda9eNOeEs+ouqNpU+Mg0CdRXbDXJwWWTk
         U55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490500; x=1731095300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyOSdZozKOWrrNO+3IjlLg6SrCFccraJpEYre6+ope4=;
        b=YRGbGgV6/ynxlbVyFUPs7xmKKWA5shmro8B3NdJXhyXReslxFW7H2SGKxAwm1horzE
         r7uji8kW8V+ziFzqqlC0O3FLwMZ2m1OpQuP4sLh/+79L/IX5ZELBMs2zO/Rn0PyviTc2
         ESEKbJ8NFLFAbpjtTXthepmF3ZKm7HbuCMxfhGRkJOU7rqndpFX1Yg/PvluJmabkTd5I
         +2RvM2PeR7I6CumZaT6eABsB+Joaeuu6OnMfBciS5vC/FyJB8Iyzmv0MNsQQr+SGrUak
         69kyYU8IfzPcgXPSkDxz+1zuRPN9PTlJxQ4n8x2aTUJvLNPWTaFYH5a3T2YBMYR9cTMR
         mC6A==
X-Forwarded-Encrypted: i=1; AJvYcCWMMPMZ2s9fMuZfv/bQ+w5IWYS5lB327fsfrfBpB6GwS5HPwe/GSIDISANGz173Qi1hHdZ8JTLN2m6pAAV6@lists.linux.dev
X-Gm-Message-State: AOJu0YyAHMiHVp3WDSu9KSs2HcJpHqCQEKBA/SoYraKvHBgHD3HM3cFh
	mQ68x+3q/awnqkGxd6lD36EM34NuX8x4f78ql1zMge9lpfaNAAPmkrTz4mPcdD8=
X-Google-Smtp-Source: AGHT+IEgrI9/MtejE5D2yrq6YK8eiMxUyT5D3Anib7RxObpFW22X85P9QXkSDkMps5fnbwBE2ASoBA==
X-Received: by 2002:a5d:49c2:0:b0:37d:39c1:4d3 with SMTP id ffacd0b85a97d-380610f2ea6mr17995150f8f.6.1730490500309;
        Fri, 01 Nov 2024 12:48:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d429dsm6074722f8f.31.2024.11.01.12.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:48:19 -0700 (PDT)
Date: Fri, 1 Nov 2024 22:48:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 3/9] Update messaging and usb_device refs in ni_usb
Message-ID: <ab4f8854-8d97-4c9c-bff1-86a73b4f7cab@stanley.mountain>
References: <20241101174705.12682-1-dpenkler@gmail.com>
 <20241101174705.12682-4-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101174705.12682-4-dpenkler@gmail.com>

On Fri, Nov 01, 2024 at 06:46:59PM +0100, Dave Penkler wrote:
>       Replace GPIB_DPRINTK with dev_dbg
>       Replace pr_xxx with dev_xxx wherever possible
>       Use previously initialized usb_device pointer
>       for usb_get_dev() and usb_put_dev().
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
>  drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 377 ++++++++++++----------
>  1 file changed, 205 insertions(+), 172 deletions(-)
> 
> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index 9ff56b063681..50ec934fe8be 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -132,13 +132,14 @@ static int ni_usb_nonblocking_send_bulk_msg(struct ni_usb_priv *ni_priv, void *d
>  	if (timeout_msecs)
>  		mod_timer(&ni_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
>  
> -	//pr_err("%s: submitting urb\n", __func__);
> +	//dev_err(&usb_dev->dev, "%s: submitting urb\n", __func__);

Just delete commented out code.

regards,
dan carpenter

