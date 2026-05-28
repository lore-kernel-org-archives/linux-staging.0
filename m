Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED6C3D544
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951626; cv=none; b=HEuSttRk4AZWzsNPUJPkIOrIx0EHVlLqtWs2l8jaCgWAVnUMtMl8eOjijIZ5YPmN2GBWIpPyRZXPy0tej3+81HapCfikBww4EF+LR7KhheLtVi3+QIHHdh/KZCbYVGucpLCNZhK44AJchJM4g/xOPjhp9r9ebqcy0GjIsn4nT3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951626; c=relaxed/simple;
	bh=ZUqKCwdfl/Z3svldLCXHTXgrMCr234sSn5KgkQEDHso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nm76hcBnaNsHM4N8LzuvmJBO1vScDOzcWahDnr6RRPPBqG5OyJW+lunAV05jw8FrCVYsQD5G534debGvNCWRHgSdOhTO4n1OyhLkqgEV9Y8YLtW2+HQGn0q2azOZ7jv4Iwl58tXCcpZlfqIMg2yE5kY+Tg1+xRge3GywwOMTsrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTGWJ1lu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTGWJ1lu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490426d72f7so57347285e9.3
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 00:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951623; x=1780556423; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iZoB4YD60GO1O0jtztT+xKwe9a78W229JrLQ9Ey8GSU=;
        b=aTGWJ1luQzEkBzhNV5X6c17tzRO20XzosOVqynMfLMcNTI8LDyDN0VuClMhU2hg+KK
         OLNtf2tzxBmS72K8V74Sdn48IieJa7M8eE/d/76aJGKR3NriFlcPBgb/nyZ7SpoxYDT5
         9diDCrBFS3IlcWE813w2/sWnBinuLLzpabVY9xPB+tE4bU9EOzmvvgbRKp0IK6cLZsb1
         jpPs8jqmfmqtnRHEIYFpg1EX/Ak48KJ761Px8PnpdJFHa0snxKidbZOdhqo+ZGHQT7Mg
         hPFHnRCm1jN0eNOIakCBAedx6hTdbNE76DzBjaKhlb53QB255xEnI92lNPfpFF/HXx3+
         NX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951623; x=1780556423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZoB4YD60GO1O0jtztT+xKwe9a78W229JrLQ9Ey8GSU=;
        b=GZaGi2JP66LBD/2pc7HZKdHaI9Tc/Lg+QFhTdWQ2T9C0IFzuJeyvCy3COzkqTtRmkI
         0T0wyBtXiaTUXP3IGviAUIHeL/wt6YPM8O+UV+zBb/kx9vd812ilWsi3LtmvSf37l9lK
         rJR/iEWGxMBzSCuyw+ULoLklXcOQ22FNdEKQWZk4dNKLIA9klVEwNP0xi5ndccrBqlzN
         2kvNwsaStDSnwY0aMCI3UkTeSu5XpvUss8nsPaob6AmQnmmvFh7ipGZEa4NulOFdhvZy
         w6n0h3KH8yuTLD0h//kMozUzq63WfFIQRW3Rnkwssii0ebgQHEy85lqOKlOznQWBkrmS
         p9MA==
X-Forwarded-Encrypted: i=1; AFNElJ8R1zQegQXuGYikJy+5uzAibdbGbjhF/mxiV3pRZ5l8uKcAZ0XjM5GOoha1N4P8q1fjCXsYvrVpjI0Xw+Pi@lists.linux.dev
X-Gm-Message-State: AOJu0YzAo5aE78akbPEFN28URzb27XKvSzxvU1KA0yYuVWrba1Blo2t2
	PzYDPfRhQBPvRxs1x5R9wlJ5f3ybsYxWis4DnPzWEL1tP7aI5U3/Auzk
X-Gm-Gg: Acq92OFjTnAPvnq5yiOkEpuhBcqBuCRbBDEIoKM2vOhNCy8nSoobB9Ekly7BX3q07vy
	o+m9JOpidinG5JSir0XrFSIL+JYV/ER+iDOgQwqnzvCNuzB4Qebnoi7jjqATYrqsneO4nJxpKd2
	Zw6qre0ser2+qkE5orpGrtfyt2dR7lQCMlVGU0nwJsI/fV8GyWFpmt5R3LbZnUFWfVYtNrz7xHs
	0Y0BzULghcDPaP05doSnDdsPxwr2XkFxeVsmCatLMljU4i426jivie1wsheme/zj2PQldbAvuv6
	+aO9EalQK49ivrM5HkHIi+dL7hUoxg7tBjJSOqdaDmN0sJ89GNKlLCCKx/6tf8TMNcF8VaPrUBD
	T+dFHwHpYB/Rq9PC4oaI6IFWn5ryvaX76kZFOcFm8rt5VSP2RVHQxMtp3n691UmCGIFEPRRSS4d
	KWLSM65qoPW9M2UPnrTxbEgrLWoVnvtvSoIA==
X-Received: by 2002:a05:600c:444b:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490424aa04fmr424471365e9.11.1779951622941;
        Thu, 28 May 2026 00:00:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092654befsm20791325e9.6.2026.05.28.00.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:00:21 -0700 (PDT)
Date: Thu, 28 May 2026 10:00:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] vme_user: tighten slave window bounds and validate
 offsets
Message-ID: <ahfoAU0pdx8G88bT@stanley.mountain>
References: <20260527211425.569038-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527211425.569038-1-lucas.fariamo08@gmail.com>

On Wed, May 27, 2026 at 06:14:24PM -0300, Lucas Faria Mendes wrote:
> Limit slave read/write operations to the allocated buffer size to
> prevent out-of-bounds access when a slave window is
> configured larger than its buffer.
> Treat zero-sized windows and invalid file positions as errors,
> and reject VME_SET_SLAVE requests that exceed the slave buffer.
> This makes the user access driver more robust and avoids
> silent EOF on invalid offsets.
> 
> Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>

No Fixes tag.

This is a grab bag of changes.  It needs to be split up into
multiple changes.

> 
> diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
> index 11e25c2f6..ca65cb57c 100644
> --- a/drivers/staging/vme_user/vme_user.c
> +++ b/drivers/staging/vme_user/vme_user.c
> @@ -181,6 +181,7 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
>  	unsigned int minor = iminor(file_inode(file));
>  	ssize_t retval;
>  	size_t image_size;
> +	size_t max_size;
> 
>  	if (minor == CONTROL_MINOR)
>  		return 0;
> @@ -189,16 +190,24 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
> 
>  	/* XXX Do we *really* want this helper - we can use vme_*_get ? */
>  	image_size = vme_get_size(image[minor].resource);
> +	if (!image_size) {
> +		mutex_unlock(&image[minor].mutex);
> +		return -EINVAL;

The original code looks pretty shady.  Sure.  This is fine.

> +	}
> +
> +	max_size = image_size;
> +	if (type[minor] == SLAVE_MINOR && max_size > image[minor].size_buf)
> +		max_size = image[minor].size_buf;

I don't understand this chunk.  It seems unrelated to a zero
return from vme_get_size().  It needs to be in a separate patch.

> 
>  	/* Ensure we are starting at a valid location */
> -	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
> +	if ((*ppos < 0) || (*ppos >= max_size)) {

Fine.  The zero size - 1 is no good.

>  		mutex_unlock(&image[minor].mutex);
> -		return 0;
> +		return -EINVAL;

No.  You can't change this because it's API.  Also unrelated.

>  	}
> 
>  	/* Ensure not reading past end of the image */
> -	if (*ppos + count > image_size)
> -		count = image_size - *ppos;
> +	if (*ppos + count > max_size)
> +		count = max_size - *ppos;

This is unrelated to zero size so it would go in the other patch.


> 
>  	switch (type[minor]) {
>  	case MASTER_MINOR:
> @@ -224,6 +233,7 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
>  	unsigned int minor = iminor(file_inode(file));
>  	ssize_t retval;
>  	size_t image_size;
> +	size_t max_size;
> 
>  	if (minor == CONTROL_MINOR)
>  		return 0;
> @@ -231,16 +241,24 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
>  	mutex_lock(&image[minor].mutex);
> 
>  	image_size = vme_get_size(image[minor].resource);
> +	if (!image_size) {
> +		mutex_unlock(&image[minor].mutex);
> +		return -EINVAL;
> +	}
> +
> +	max_size = image_size;
> +	if (type[minor] == SLAVE_MINOR && max_size > image[minor].size_buf)
> +		max_size = image[minor].size_buf;
> 
>  	/* Ensure we are starting at a valid location */
> -	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
> +	if ((*ppos < 0) || (*ppos >= max_size)) {
>  		mutex_unlock(&image[minor].mutex);
> -		return 0;
> +		return -EINVAL;
>  	}
> 
>  	/* Ensure not reading past end of the image */
> -	if (*ppos + count > image_size)
> -		count = image_size - *ppos;
> +	if (*ppos + count > max_size)
> +		count = max_size - *ppos;
> 
>  	switch (type[minor]) {
>  	case MASTER_MINOR:

Same review comments.

> @@ -394,6 +412,9 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
>  				return -EFAULT;
>  			}
> 
> +			if (slave.size > image[minor].size_buf)
> +				return -EINVAL;

This change is not explained well.  It would need to be in it's own
commit message.

The size is supposed to be checked in vme_check_window() so this
is the wrong place.  I looked at the checking and it seems okay
to me.

The rest is just more of the same.

regards,
dan carpenter

