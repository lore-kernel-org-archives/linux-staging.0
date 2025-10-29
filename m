Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1296954652
	for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761715793; cv=none; b=YxTcfFu0hJiNbNl5fDLl1RYxfm41D3eLyMmqx7Q22QXGjmMgM+73qqTQYgMtCXu7PyWy6XsdjbZco967rH9TnDd3aqHY/nPN5363WXyPdfIfS1N6my48Ah5ZWj39DBS7V7k6ZzSEHMe5un9AjqwR3Ucs6F5G3vq1sPV/5YRGKgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761715793; c=relaxed/simple;
	bh=08/mzPYxSm/1nDpxNMmjbrtO5PkDhUO1zOysCCv/okI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGsR1lTsODqd8+BmsVzZ1RnZJWAzLWXDszIg0Dj49UzJguYdp0CziG+csXaXhuzSm3s692UgmzZwtC52U3MLqn8uaCOFj/oC6N4kV2v/8mr8s7O1n294iPMVzf+L+MGyQYQLj9egWh0wiXZzmh6YHQbxs2ThhVpNTPja6hZrq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDHV9MJM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDHV9MJM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so3114515e9.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Oct 2025 22:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761715789; x=1762320589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pHaGH2NXIUYjcvzs9hO31NRTn0XjtT+KRdHL3PUBxU8=;
        b=jDHV9MJMFF0jvdWOGFUauo+b4X3HMDPDFSgajUI2h17rcPmyQXvYLC5J0QKoEj8VAQ
         aUv5CK5aI70+O06Nx0qhvl6YEnrXfVy60B15xgeb7zhAo8CS4XbhEREthi0AOdIxE+0N
         mKCpZvnFr0TarMBLiIZznP3ubjdDlxIyijVOT0salLtgKkMu415cLdCUB6zT2JHO/Knf
         c81ZI9W/r/0F8Yy7QjBnIoCRUlEyrEBWg38X6NMhaUd38LvXh5aV78H8qo6PQ8DZQ8Pm
         JJ/BLG7dMcixO88czZpoHB11lBDGiQ2c7sTE6z+2lINzqqdugFRU9RBtdGMFVGOsMqmK
         Cjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761715789; x=1762320589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHaGH2NXIUYjcvzs9hO31NRTn0XjtT+KRdHL3PUBxU8=;
        b=G+5V6y2fcfeHr2r+A5x/2OVZlytFoD33UuUAgRsRrMIWix398XRUvVuyfIquzaCRGR
         0GwlVl186QykLVxOx6Rq1nPrek4D9xOd87Ad3fuF/b1VXBeXvzHvIkoPydlp56x34oE5
         oHf2OJE6BljG9tvatfZpPuaJWqyt7JVERMpE5SePRXZ9WoTijBHvaIM6ZJwvPMHz4SFb
         6qISYG8iArK8oxvAS9e5dfGsxQkBPfI1esxxkfitiaip28yhKP5YTJpGhxlkb8BpS87Z
         7yRrzz6PhJCcGNp2RGJJrM2sKJjHeCgDdI+sdhp/cmmG0Xbyh2zhQjQ/pKAu3InZwd5s
         u68w==
X-Forwarded-Encrypted: i=1; AJvYcCW/4r7Te6ejCTBpYiAjH3JOy5biY7ZVmsiVrAg6y/Q19zN0a/ZwwFI8aCm/1v1mV+isoTS/bymvUnuOVDIn@lists.linux.dev
X-Gm-Message-State: AOJu0YyYYPprTQ66QZLGIFtG0fQpfz11dJSduUFPC7LJZbejAHHpFBbQ
	w+0sZnkJ7nIovLEMS8kcHvQI/FB1wWQ0DXn0Sk9C/Lk8BDt9gOzMMNvMEbfLx63cMgM=
X-Gm-Gg: ASbGncvX8VfGSleTGipNGQetEdhEvIlUXhuumnWjrPYzQe3G6aOD7Zqhl1QuyB6VqUL
	VBwIfkFM9pBTrCkED/T4MthwmqtZyT7GniSxaZzMRNd/xFTKLVE//71/8d7Zga2dDEbSaFXe9ET
	TpOcraTJQ77n3AxXNOuEySXYx+XKgaFxIcg7EXZPiKPQpbBM5D9QDPMc1ib6MNQR5Qbqg2KsF2w
	BEa2tJwQ988980oJwMZqHCbcA3FJGt2bqgaB7TUmBMJ0TxT2E1ztFjX5VWdLircW+pRXdIPUTyd
	jVUuYGTB60xjaUJoMxE5YYOqKH8SmziysNhKMNsQwxO2402dNNvmoQK4znV+bPx78Qy9NwupIyH
	jjJtNvVq1KjZCCwfqNaAu29orRP64VuRJZMIIkDRqvoNeofs88u1CeDChBBxnJ71n9nP1pvhJF4
	zdsTIyQuzHLAOtJtft
X-Google-Smtp-Source: AGHT+IHG2WznNN/Rizk/zJNzOf90BpJVy0QqUr8IDk1RCx9tIDyYps0DxYX9Z8QZNUQwV5GlDx1Ltw==
X-Received: by 2002:a05:600c:58d7:b0:46f:b42e:e363 with SMTP id 5b1f17b1804b1-477181c334emr32548945e9.20.1761715789186;
        Tue, 28 Oct 2025 22:29:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771e3c878fsm28225995e9.17.2025.10.28.22.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:29:48 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:29:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
Cc: sudip.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: style fixes: align call and split
 chained assignment
Message-ID: <aQGmSIinidUQnHT4@stanley.mountain>
References: <20251029022123.5829-1-cristiandelgobbo87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029022123.5829-1-cristiandelgobbo87@gmail.com>

This patch was really confusing because I had no idea what I reported.
Just remove my reported by tag...

This is not a v2 patch, it's a whole new patch.  Don't call it a v2.

On Wed, Oct 29, 2025 at 03:21:23AM +0100, Cristian Del Gobbo wrote:
> - Drop previous change that made g_fbmode[] elements const (broke build).

But if it were a v2, this isn't the right way to send a v2.  In a v2 this
would go under the --- cut off line.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

> - Align the continued arguments of sm750_hw_cursor_set_size() with the
>   opening parenthesis.
> - Replace a chained assignment of red/green/blue with a temporary
>   variable to satisfy checkpatch and improve readability.

These are unrelated changes.  Do them as separate patches.

> 
> No functional change intended.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Signed-off-by: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>

Also run your patch through checkpatch.pl.

> ---
>  drivers/staging/sm750fb/sm750.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 3659af7e519d..94a99af4320e 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -121,8 +121,8 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
>  	sm750_hw_cursor_disable(cursor);
>  	if (fbcursor->set & FB_CUR_SETSIZE)
>  		sm750_hw_cursor_set_size(cursor,
> -					fbcursor->image.width,
> -					fbcursor->image.height);
> +					 fbcursor->image.width,
> +					 fbcursor->image.height);
>  
>  	if (fbcursor->set & FB_CUR_SETPOS)
>  		sm750_hw_cursor_set_pos(cursor,
> @@ -538,7 +538,11 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
>  	}
>  
>  	if (info->var.grayscale)
> -		red = green = blue = (red * 77 + green * 151 + blue * 28) >> 8;
> +		int y = (red * 77 + green * 151 + blue * 28) >> 8;

y is a strange variable name.  It has nothing to do with the y axis.

regards,
dan carpenter


