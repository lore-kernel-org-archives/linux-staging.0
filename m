Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AADB38757A
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 08:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440956; cv=none; b=YZO++/RHgkBYjFa2H8VIWaIldS8uJNOe7/Lp8Lnp5Sa6jLIwuARBNZSM4ulb6GT+cDo8fTyMe4+626o51LIJ8JqgNWNrtvu6SLOLEJdWDHtLcIBWd5RDR6IK7lnKfjq1wjcLhnw25h3UKTtJ1qC1yjDv6A8vJm4PtqwProJnv3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440956; c=relaxed/simple;
	bh=ioXHuHf5x8kilTZvc0/LkC3Lf+ZlVpDUaLVfD874aak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3bJwNa3jMeSGaLIZkTmC4YnWzfbsCoANIXzBMVFRVeJdeyh8mK8M3n0CCFarANx/YxwRFzX9zkk1P2zeYtXEtdSKfA4XDfg9yeQ1I3USlfqvOYlu1bcgT/ulBzV1UpmYK7C3bwx+Sxali6dsvD5V9dUQ1W4VjQBCVpRaDgEPw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NImM+8f8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NImM+8f8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso45231955e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 00:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772440953; x=1773045753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bQpkpONAoiB21faTuam742HCl3Sr2eZ199nE2z/ULBc=;
        b=NImM+8f8HfyY2ycXClFgLtSVLwUdmRWj1vJFBdBONqPWRa9wTXTODQJOt9ITUEZj8w
         VUl688QcLdAuogFF95fgJyVuuNZSXB1Nv8+0gQZEy7GMNDVtN8TWPxcULtG3WpK4Wm/m
         rlEls+DBK5zHsucL87bT3AzXtb/1FY6YpGpAiIKXlMDC1CPKjxOsUtxV+O7ObUbugGxC
         cQ3wski6IOmCzBAc+XVE4mFa+YpEj3RWHKR/+NbwkGYXcmoDvuW9xoY/9393dqIuCPSr
         UXAfXUWzrZrP70RGbWJsC89T66YdHCoWVEeevVetHqapRfETNNU8f9JmvjAVj4MqcVne
         1lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440953; x=1773045753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQpkpONAoiB21faTuam742HCl3Sr2eZ199nE2z/ULBc=;
        b=f8XN3UgumNj+5+PS0Q/E36zZs4jojbjTwuHnPfdcBtuTYxpte3TnQhmwLuhFQBG4up
         sLA5g+MwYy+bWPLL9jdtbzwTCMTxwrAua3QY60eIhASjR28GndX6FJwKFSdWiBnI87Vs
         b1jioQpgIjrmiRts1yrgALacDh+c5Re9WbMZuajIdMW3ArC3zWBiKtlS+jGUUWB6n3Hl
         5sFEgY3BzvK71j/9oz4VgeFSe9bhO31PyAyEYS5RF5wG2Uxe+iGqm2TdXUmgU3SSgL5f
         vQ9j5SZTg34gPLvRtAEtf8D8BQLXb9P2KNi1ESNMtrfMcyMCVjxFYIYEkNnKz3noqOwn
         lUwA==
X-Forwarded-Encrypted: i=1; AJvYcCUPRKuiIBORLjdFzS7GvhJytlfAlYgaD4+UTjHyZNfEikSgtLh6B3Tli8tc6In/QK52kAA0/A97W+UoRckx@lists.linux.dev
X-Gm-Message-State: AOJu0YwuXY9orYKhFOwbxs1w8nHC5tdqAajdNC8OYD0XK1xLlnPcMp0c
	+Ftz9VBL+UWSxFxu18dgMel5PviHp9aQxaOCzDBiTOuy+5cQgKf55rZLR0/0m1xYNVo=
X-Gm-Gg: ATEYQzzOVUzWA+qVdoP8aZGFjLo+GOhbVDaMrMwfyPOT4hgJEuANlBwRC5CUCqWWI+4
	ai1FAtdUdjsoMpN4Xl/wtmBd81CZznq0Wnz6Mupo7Xk/uIG60y5NMEUFd8XaRp3Bf59C0wmd0vL
	8BMFf+voUqGp8QilcUrWKKwTjYX0VnkKzIP/9ajgaKSslO0oNbQNgLfNcGAQCPbzikcMbRIIVzS
	GMLa1IKF2sFX1DSFkj9P45bLzdcN+Fhz9BmlzVoD2D0OwXSOd9wRnoI9m+B1QI6hXWEQ/m+CRj7
	N862KTP8AaMgfz4GWacpz0StJc5ZC0O54bjqEPvUz2EXTvj20swNFE4KsAOlvkpc4MyZFeEkLIn
	YMmnUr4x7yMfRrRfitByi5o2djJbXxbktslQup/XsD4luaN67n7YnRp6JY3ZU4EYcAjsV5lS7mj
	HjuKaD3GXfKeWIftJ6YuEDitoJIicl
X-Received: by 2002:a05:600c:8b01:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-483c9beb38emr216751065e9.35.1772440952833;
        Mon, 02 Mar 2026 00:42:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcd0818sm123136905e9.26.2026.03.02.00.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:42:32 -0800 (PST)
Date: Mon, 2 Mar 2026 11:42:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH v2 01/10] staging: axis-fifo: fix alignment and line
 length in wait_event_interruptible
Message-ID: <aaVNdHRYBHqArrMS@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>

On Sun, Mar 01, 2026 at 09:48:06PM +0000, Josh Law wrote:
> From: Josh Law <objecting@objecting.org>
> 
> Signed-off-by: Josh Law <objecting@objecting.org>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index aa90b27197cf..aac2c58ef9b3 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
> +					       words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}

Btw, Greg already NAKed this patch from someone else.

https://lore.kernel.org/all/2026022711-showoff-bakery-8235@gregkh/

regards,
dan carpenter


> -- 
> 2.43.0
> 
