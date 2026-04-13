Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC613A6405
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068509; cv=none; b=gOvDXfCa8+mFT4pgsqDwKhnTTxftqFbhf25s/CBbEovkYTn0XbCNG/vKcZS0ufmuqqeBwrRKDhV/uKjVRooiHqnai/nHA+rZrXkisNI8X2vm8eI0Xbr8w7uCwv0O4iEYZdSSrF2BR2YWZA8XOrQ3104qb5SGaBNJVN1g81iXyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068509; c=relaxed/simple;
	bh=quZVGeXcNSTruvSPIgy79uCUxaqv3oB1d3yNl9q1uts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKulHtjQJ5HFxUn/+e+yjgLwJMq5sN411bOa+BsTuaTgSIrZDg/bGbFrWTfvgBJJjHfx71+OpMTx+pynPZMIsT0sEcnAts3jg77YqN56V1jp/sw0i1M1S5sp4TTZjMiJUU21U+jiOZLy7dbvUWUxD1HW8Di1EEkITYF4ppQGh4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHSzWUr8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHSzWUr8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso49360745e9.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 01:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776068506; x=1776673306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxL7NBpm6fOiY9vFikulF9wM2xEFgsGl8u5ELNG6Df8=;
        b=EHSzWUr8OnrTL7w2YpAFqsicE92gc/yGR/fFhwvsK7FIvmTWpuSU2lvUoDZZI7NCQr
         CakKskP5rStY7sev69BnTpQamNnY8Ocv1XqG2oTlbZUg03W27yvUd4wvux+H9x2It1uS
         CGzm/tDU/86mKirfSiz2vxi/L1pTGs1A+ANjbOwXomqw20QZH2TiTCyeTm2/51mrSR0Y
         fg5o2WL4iDgt6GrU1lbbCWTysSbbEUgoJDuvASV6m0thQXiVSvkOYtZ08Q0sM1lsyPiU
         k68qKlIXXBkwJB2L4LViw/ytyXxYEjenhnByIWnNhDfyN1JOjbKsvgV26TumackHP/BJ
         RFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068506; x=1776673306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxL7NBpm6fOiY9vFikulF9wM2xEFgsGl8u5ELNG6Df8=;
        b=U2hs1GIqMcxjEfRZjfWaQi4zx0V4ha08veHF6dzUHYHyI4/Qtm71doaugoN0ZNkHnW
         JgW9ld1LFiarbD8TLl4z6KjALnbB6vmKYY3BnAkrrM85jfADTZK/Ml8bqhQhq2C4y2AC
         g7HTddLrG9/IpWocqzIJFIzfnshEFz2nw4DqD2K9FcmkR/gaFAd9yR3rxWuFJ2SD2rgT
         epMQI1jJtknHR5VqpxUWUkSrA7ori6U2UkxJADGZPioE92nzGgII5cKDDYpvwGEHIJj4
         YuQm5qN+di0Cm/81XJonsmPgwvv2ti51dtDIZLImh5TWXnQUUKXa0tQsAkpQjqe/NKRq
         8NIg==
X-Forwarded-Encrypted: i=1; AFNElJ+y6sVFBwuXe1STqjQq14MCkFzo1fRBQmDsU90/HB2mhqv9lW6hbdTdES4jl3GdDzJNkEiPDCrl3xrwVpBa@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4OAqtVsg9CvKi36Q2SdvjV4tF6AsXhahHWd791ovfNT68He9M
	XjEN0aAdz3P2y1P8ihy1zbkfDw3dDGur+N5vTZ9IxDsTs3GqACdKdwOL
X-Gm-Gg: AeBDiesNB5RaOKwEZLQDv0GLtb79AydO51pK0WCdJOTZQ9LwxDwbH7GtZxO0Q8VbxUU
	H2KjjlT6dPSS7cTOCyTbGYj1x0Isa/JYUnxHrEVNj+H0kIm+qqTSc43RGnKxJ4ZdmafSO83ey2A
	EuPAA3kA07BaS7fsKdsSsz2N7ohtEnea2QD6NaBjYfv+mXaSpnSXrpMSBzy8VHywQc8rrXJA2Ua
	x37OlqCzp4Xmuprp3zdCE5pAUSHxCEPt7HronwOyIaxBE4HpS4JPymDYNOIMLQy88uJRtTrC5p4
	Y4QDEftb8XnCEPRavZjFOT8IPnb/FGnpPXfpzcjS90XT/kESDBDoJuHozKD1tngBWlUDaULX0Ur
	Hu9bJ/Hfh7lGKy0UCG3ecphtaC4AFopkc6xjw4HI5+PcwVkNM6WN2ZY547i2UENESo0i/PpszdO
	CTQTVTQxI6JChwbB+d2xI=
X-Received: by 2002:a05:600c:8b30:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-488d67bf79emr177041365e9.6.1776068505834;
        Mon, 13 Apr 2026 01:21:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5934a6dsm305318865e9.11.2026.04.13.01.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:21:43 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:21:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: nvec: fix pm_power_off teardown in
 tegra_nvec_remove()
Message-ID: <adynlKves3yAAcCA@stanley.mountain>
References: <20260412205117.387125-1-hossu.alexandru@gmail.com>
 <20260412205117.387125-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412205117.387125-2-hossu.alexandru@gmail.com>

On Sun, Apr 12, 2026 at 10:51:17PM +0200, Alexandru Hossu wrote:
> The remove() function unconditionally sets pm_power_off to NULL regardless
> of whether this driver instance was the one that set it. There is even a
> FIXME comment acknowledging this. Additionally, nvec_power_handle is never
> cleared on removal, leaving a dangling pointer to freed device data.
> 
> Fix both issues: check that pm_power_off still points to nvec_power_off
> before clearing it, and also clear nvec_power_handle at the same time.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 75877038847f..9fe9b7a3491d 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -907,8 +907,10 @@ static void tegra_nvec_remove(struct platform_device *pdev)
>  	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
>  	cancel_work_sync(&nvec->rx_work);
>  	cancel_work_sync(&nvec->tx_work);
> -	/* FIXME: needs check whether nvec is responsible for power off */
> -	pm_power_off = NULL;
> +	if (pm_power_off == nvec_power_off) {
> +		pm_power_off = NULL;
> +		nvec_power_handle = NULL;
> +	}

Linux power off handling is a known mess...

I wonder why the original added a comment instead of a test?  To me
checking for if if (pm_power_off == nvec_power_off) makes sense and I
can't see how it would hurt anything.

At this point, we're unloading the driver so nvec_power_handle is
about to be freed.  Is there any benefit to setting it to NULL?

regards,
dan carpenter

