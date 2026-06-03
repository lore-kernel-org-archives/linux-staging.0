Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B43D25AD
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780505497; cv=none; b=Gwy7YQ3mpC7zFGdk6by5vwPE7KGYd7ofTgW0GXJJ5vjCqOKM9UWIqUWllIP4eGqwo7HL8dQ8sM2IWNEbc6FfSdzDns5Du59H4uxe5a8nJI6YvzmdjQDr+Az211MXm2FaH6JBZuN1dW+HKJfImP0F1GD7HsdhM1k/0933Ib0ouoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780505497; c=relaxed/simple;
	bh=9zex/oZNw62OdeQiIgl4XFXCFGp0nqo8+vP08DCK6Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iyw3NMYyeckkZLAPS6+Q7e3HHfw80H85vhXfeIzfRP7u4Fgum87E0gFpHMwcPhCcX+WdELaE9SfGucxxuwrz/HoA/PbdKnKHzI+V/dWFWUmb95KLrA+Kdlyvgzg3890ZVXYa6lLcVG9G2R5GBmigFlmZvgiAObjTo8FroZuyvPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4ZZaCsj; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4ZZaCsj"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so7727462a12.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780505495; x=1781110295; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tVUSNrgyJbcEG3S/mElelWcmLhgtsutmOseyskElsFw=;
        b=B4ZZaCsj6M2mtJELy1HEDWj9jF7G8T+QdzcR68Er5XxoiwClhNWvxL61OUugZ50fIQ
         2z2bc58RLCOBWugtx2q1NIxl6vpo9FGIQj9waMjuI6SyWCU6Dawm1VBKZWNs8sOi40t9
         deViRT+5Ti1aiJvLBpaf2vG9KP1H6bX6kpTLlLqkXFWtRyrIloF/XRPqpCDrWW3RQwcu
         i3lymnIBhEpFgDnI9OnUVN52XllkUb590zT8qDu7qbXPJA9vfm+dEgwDfci5TmV6mwU9
         bIFJnMYU8qf0xvhO6M+llvC8ZJkr8zID3cqqgwDJzxrwlxEfCLSQiRT1Id7daqjYIJfg
         1p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780505495; x=1781110295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tVUSNrgyJbcEG3S/mElelWcmLhgtsutmOseyskElsFw=;
        b=WE9fmCb9Fze1stR6x00LQ7pyESWMFjrCjna3ioEyMl9yyRS//EQjzncPBv+TBxIuPi
         soyAJaXsbhe7HBoRqzuSW9jd1P/TQZkJ/Ulm/tzpj6a2uDz+Lh/slBSrmjM1ikdp/TEt
         XBrOQdG3FpF36hAbAvQdXCDCFZUZrJmV5mEGVxRpWfJ+qdRNER1RYypZvQF88qikY5wk
         7WIkPF9Mc+nXRJ+jMXDc1xKF7otBqYNRgc97p/zw2xZA3DnPlK0vgxFzskTpUEM2x+Ju
         O68/+6W7f8f/pGXHMMZFZOo/KNIEZgxKoLfTsG3G6icK7mIjIL8SuYOZR0yTYpUrEWdn
         iLdA==
X-Forwarded-Encrypted: i=1; AFNElJ9kSfrGG1ic6gUMLgbmrJwUVhPvglZWFANKbgcdtmERHiUvGYneckef/MVyj0+JWY497yVCqb+7ZFGuOqhi@lists.linux.dev
X-Gm-Message-State: AOJu0YwPIT5pHmCXPiRz7GiiQVuPMtNLCyYO29XDRX6P2lhAFks6XEKk
	p9Nub0kKuBOmkJYl4BZOUHnD9LEnp5emUB+6KkzmD/MeiRxF2whLzLjg
X-Gm-Gg: Acq92OErwhH0d+kyNgj/HQi119ztoAbZ6csjFi6q8ZGccThQKuhIiF4FSjom9Y1am5y
	2UR7TmHkiAdUo565ZKxq1+F8HO8Fu8S9EtrxK1TVfocrhxY10TpIHbm75J+Cd4bJ+erfvJE8IA8
	Hx4toftYQc85fA6wt54KDFDKkYxlj5mlwps8NySSi9/2/ziUM/VBDB4BJHBvSUA3auHfNTSzkqI
	pComgjVYEMYdRIppxYh2v2YmPaW2w9v+nPpvlyHc58FgiKPufvsYZ4Wk0dyC0kihlCnsHdGTS0c
	N6DDlyTOVCwwbIJg8VO2dW6iDULDoO6BUe315IFHwR6PlmohlzKaOzcDxZQpyw9Yo+suZsSp7Qq
	tFEfhC2lYgPGkt4aZhmZhDEaWRH/s+ndD6uOaIjI3jh7GR21BzgYSjda3UJbQ9RBNMm5OHmAkyx
	QSvkw8rN2k2Zog7n1Xq72kcVei5ttTrYprqsfl9ikw
X-Received: by 2002:a05:6402:249e:b0:68b:e0de:1386 with SMTP id 4fb4d7f45d1cf-68e714da6bcmr2214247a12.13.1780505494626;
        Wed, 03 Jun 2026 09:51:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65027662sm1509422a12.11.2026.06.03.09.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 09:51:33 -0700 (PDT)
Date: Wed, 3 Jun 2026 19:51:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?utf-8?B?Vm9qdMSbY2ggS3LDoXRrw70=?= <vo.kratky@seznam.cz>
Cc: gregkh@linuxfoundation.org, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: Use min_t() macro for type safety
Message-ID: <aiBbkqntNHqD1sct@stanley.mountain>
References: <20260603131928.44274-1-vo.kratky@seznam.cz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603131928.44274-1-vo.kratky@seznam.cz>

On Wed, Jun 03, 2026 at 03:19:28PM +0200, Vojtěch Krátký wrote:
> Replace the open-coded ternary operator matching a minimum calculation
> with the standard kernel min_t() macro. Because 'count' is a size_t
> and 'rem' is a signed integer, comparing them directly introduces a
> signed/unsigned comparison risk. Forcing both to size_t via min_t()
> ensures safely typed comparison and fixes a build-time macro assertion.
> 
> Signed-off-by: Vojtěch Krátký <vo.kratky@seznam.cz>
> ---
>  drivers/staging/most/video/video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8ccccf..709f61ed0322 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -178,7 +178,7 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
>  	while (count > 0 && data_ready(mdev)) {
>  		struct mbo *const mbo = get_top_mbo(mdev);
>  		int const rem = mbo->processed_length - fh->offs;

This feels like an AI static analysis inspired patch.  The concern here
is that "mbo->processed_length - fh->offs" would result in a negative
value.

> -		int const cnt = rem < count ? rem : count;
> +		int const cnt = min_t(size_t, rem, count);
>  
>  		if (copy_to_user(buf, mbo->virt_address + fh->offs, cnt)) {
                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
But if "fh->offs" is a crazy value then we're still using it here so it
doesn't make sense as a real solution.

So do some more analysis and figure out if the change is required or
not and if it is then try to find a complete solution.

These days we would tend to use minu() instead of min_t(), btw.

regards,
dan carpenter

