Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF041369D7A
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786084287; cv=none; b=c+idFcwgMSsx8KSRWo0RIHc5jCuvQJWTAt2mrIyHDjCa7zhXxTkz/NSsALE6eAq3FPERhJP3zba/1GIAjOvYkVacQ5GYlZVCCgYMzrpnU1KUEGiYG6nFJ2q17lB7rPla6AWtn/AYisXPUeLrkBaOzblAOV1yJhI9ZVXhwMRRNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786084287; c=relaxed/simple;
	bh=3lx5y7D2BH46IdHqSY10Ho6u3jWIrliReytwLOs3oXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZXVW3uT7GhhkX5peNV42Rollgtbfch6N7D5/3/1epbSKAattzCgWypDMlqbQp/6xyBNrosS3J7mDo14VbC2E1ZQx2qXuoh9cuxu9+OCzRnRdEU+ao6l3zMIJiSAhTOMesXkzKw0wxn/aRqdBSERTkeRr0Y7u2dP6uKDhh512Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hloe6zsN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hloe6zsN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49802c418b5so28313225e9.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Aug 2026 23:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786084284; x=1786689084; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TRI/BMp4S2EUObR2RuO3BEX7TL3pPneQPDQ8x7rfvY=;
        b=Hloe6zsNx2CcC/4qQR1PkACEzbKYzXI5uBs8iwtvvL/U/ZwMRuUuIXQlmpmaRZ4LiI
         BFbfj+z6R85SxEyBmULtgooChRsEp+jGfjGSmLXamOT5abeHajmGpWyh8hwvE75u2rXD
         5IJQJlAJfg80PWdSTlO9TGEjYgDi/0lJXroQt2dJjvW+7GxYFq7lJCsoxY5qvLYq+F7q
         QqJ0dFNjKo5kxLKkfQRKLHWDGH4sa15xCvkRB+I/paNvW9SAYekg4hQFCZBCLKO9qpkV
         NjdaiJ2RawuDncR2vr0ahSsIto6qWKFn4OhvRksxdt1oYMC5jQhAZS0IqvTJvP0N1Sic
         vExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786084284; x=1786689084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TRI/BMp4S2EUObR2RuO3BEX7TL3pPneQPDQ8x7rfvY=;
        b=tL1o0RNCVzV1x0n3aoXf5lVblS5yQX+jX56Ap0XQZFqpLZdVBBDdlCSNTnpbcvIxXb
         twZffwvgWB+QSwNmuWG56hkQ8XQTNkWxdEwDumROpGJ1TmT6nk1I9ZRRHGdaQjiiu6gB
         UzkvdficdYng1JLYM+Xw+/PReKFnoehRXlkPRc+TB1bTQsjs60MX2/CEukN15Rbzvmdk
         mKmJi+RWdu/rSQUT+JufURARdq6L77fxM48nJT3pRS4IC1OnZeIs2SYZGk+umBl7fhDX
         zNZI75Aps85VqTqZnPhQQYEO1p1qRSwR/hiXjjDIBFgR/iy0bQDNrlRi1Jfm8Zjpg8GU
         jjJA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7mTFQLe33zf7cwGPTAOlvnF7FuyqGyIiEnrKdc0w5arxUP4yUm7ZWjbfi3u8A6H+zfJLi2Wr4CWSGHV8O@lists.linux.dev
X-Gm-Message-State: AOJu0YwWI/7jj+By/eIIedclCKLGdMewUNnldGVrql/947K1wPeU+bPf
	krpVpCCGkGwM/fYsY/ZDSKgQClPTXI+70vLGX8DjUszxxJga2bOdSbp6
X-Gm-Gg: AR+sD12gtjbrDjB2e2tiCANjYgSERJdMJrxbEKN+Fyuo3I2t0vjqrWW/+uqDZroJ6Vo
	shnrVx1Io53gia76Y6zDiblai0q5QZWoOK3Xd3XFkJB230Z2BVwlHnCrBrWLpFrGv0a3Td4gItp
	uSxY5uR8zvMIGJb4GsXXonQuZtNGf1yX9JmNP+27cuf4EcqyC0em4HYh4ppj7hZu52YYJs7oBKq
	wX1kjbJHco/fcPxJanQhJ9qGFTnC2o9b5fOzU0Ugc3umxXNliDTZBjXvT7k9pCUJS0wKc/8DkfA
	2ErN7zQuNOtSPnkDpKlf4NQUgCK54v2dqI1IoUVpk645ehB0XeTS6aMvIvWXHznBgR/aoOcHiUH
	Bz4ZYKVNNKSoeJ/Nkj7pXPxrHjdNrtRsyU3vvI0FfqT1FEIqL3rJ4sXyqgZfRSgTXf99fWIPHrB
	T4p81ZSiCw6GDsJ0AxcWgUpr/es+0a3VmphJyDHCRWff53EsCX0xc+NpCy
X-Received: by 2002:a7b:c854:0:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-4994e7d7320mr218609625e9.19.1786084283885;
        Thu, 06 Aug 2026 23:31:23 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f0230sm9334415e9.6.2026.08.06.23.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:31:23 -0700 (PDT)
Date: Fri, 7 Aug 2026 09:31:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Som Tripathi <tripathisom142004@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix bounds check when vme_get_size()
 returns zero
Message-ID: <anV7tkD2AKmQLIfC@stanley.mountain>
References: <20260807012506.579588-1-tripathisom142004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807012506.579588-1-tripathisom142004@gmail.com>

On Thu, Aug 06, 2026 at 08:25:06PM -0500, Som Tripathi wrote:
> vme_get_size() returns zero on failure, as its kerneldoc in vme.c
> states. vme_user_read() and vme_user_write() assign it to a size_t and
> check the file position with:
> 
> 	if ((*ppos < 0) || (*ppos > (image_size - 1)))
> 
> When image_size is zero, image_size - 1 wraps to SIZE_MAX. The test is
> then never true, so the check does nothing. The following statement,
> 
> 	count = image_size - *ppos;
> 
> wraps the same way whenever *ppos is greater than zero.
> 
> This is not an out-of-bounds access. resource_to_user() and
> resource_from_user() clamp count to size_buf, buffer_to_user() and
> buffer_from_user() clamp it to size_buf - *ppos, and vme_master_read()
> and vme_master_write() reject an offset greater than the window
> length. What happens instead is that read() and write() operate on a
> window whose size the driver failed to read, rather than returning at
> the check.
> 
> Compare *ppos against image_size directly. The two forms agree for a
> non-zero size, the new one is also correct for zero, and both wraps go
> away.
> 
> Found by reading the code after Dan Carpenter listed this as one of
> three outstanding bugs in this driver;

There are probably more than three.  :P

> see the Link below. Compile
> tested only. I have no VME hardware.
> 
> Fixes: f00a86d98a1e ("Staging: vme: add VME userspace driver")
> Link: https://lore.kernel.org/all/aj0WWwiOzjLGbY5z@stanley.mountain/
> Signed-off-by: Som Tripathi <tripathisom142004@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---
>  drivers/staging/vme_user/vme_user.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
> index a472a38ef..0df30a3c3 100644
> --- a/drivers/staging/vme_user/vme_user.c
> +++ b/drivers/staging/vme_user/vme_user.c
> @@ -213,7 +213,7 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
>  	image_size = vme_get_size(image[minor].resource);

It would be better to just add a check here.

	if (!image_size)
		return 0;

Same for the other.

regards,
dan carpenter

>  
>  	/* Ensure we are starting at a valid location */
> -	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
> +	if ((*ppos < 0) || (*ppos >= image_size)) {
>  		mutex_unlock(&image[minor].mutex);
>  		return 0;
>  	}

