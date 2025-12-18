Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9226E6F0
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041969; cv=none; b=ai74PYRVStLZy/8mPeiyZT5xpMus2XgTDGP+yoj1C8P6H/K6t5TjS3L1dgneJtmig4X6rhR8KSmDfAUObeUn+JcUAVMABcC9NLEywxjoqkQcQQ4E22lgjL+P4ayZRqYw3IqC7mfuqvwD449tqJt0EitYSRJEM293hT1GwdYP1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041969; c=relaxed/simple;
	bh=havm6bqjb6lnBnYAm3GPOpMNKkte4SuOAffY/lS98Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx/s1FQYAKA96ULUx8kn+fL02xfb86k/HqdH8CtCqPO4qV8Q5R5LiSFuyO9MzAf3aavD8DNlLKySxXhw4/mwE+BpWM6FIrtgbgzb4ai4lggmyDe3HlC0dBpwxgiH455rp1zNK+8hqSAf2Fvv8t0EtRc6LuSOGRyIkThNuDQ/OS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fbr67tHw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fbr67tHw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso2327455e9.2
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 23:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766041966; x=1766646766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9yVXoB/OYBdhrkXc0cF/nS6Lq/SPgGWFM6QmRezHSI=;
        b=Fbr67tHw/ZuD2OE0lVPL5RGjWb35wPA7BK5sg7cUHD+LQTdjCdw81iOCqCM0Vvv2d+
         svBkP6MlVElLhgVpcljUTsXrM7ZqML3D0gfjXZo14SKQ/oNfUkWH7JvihlO0GmmKtMfy
         Jj5OZaV73WnSM8ATalvoWa5skvcsMw2fp/QfY0ln8BfgUmnKnVouycrHQszGm0tU0oQQ
         O2EzVoGXpc3RGl6M0WnSGZdoQqEl4dTP5unvtx/14dPuR1ClrPIIssz1K9AGBIu6cXnc
         IIvINQMZ0X4Go6YY3YOnldLHXm02KOrT7RpJZdpUlba04VZmJzXdLeH/0vt8twqMuIb3
         uKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041966; x=1766646766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9yVXoB/OYBdhrkXc0cF/nS6Lq/SPgGWFM6QmRezHSI=;
        b=obWihdkz2fmVMv+4rBgAsU1rmk5xysiEp9YkO9y07XDr0p2UBD1Zakd4uwHJZTcNtF
         XQs2G95Owjekh71RRvykyfsWIVp+BGKQs/NCKJ+ws6J+YwqR5x5Zm4W8TI68mqiun1SF
         /Ks+kXRUWuuDxG6vaXKZ7XerT18aNH4gviiOZt6ZDfpgekghTdTzZfvIKhhJUXFNIWAe
         oXPgDACwtyPjueisq+C0MX5eTcpJyeSlekum2YMkVDEXXus7U+q2wQ3kMpfifvudXNvm
         nRyjLTfaj//exxsxRZobMAoxUiMkYLbVuKVqrUDGourGH/cRTDOzWGS10gdnIPB96nVT
         Qhvw==
X-Forwarded-Encrypted: i=1; AJvYcCV6rR7tbKrIPCSZ9PPIIK1kUdkg3qKVxGbTUQawaO5dJaelcc/D6AWWWwwYr0GEnb0zbdePORooaXfgqcXy@lists.linux.dev
X-Gm-Message-State: AOJu0YyBmElMJWgfpWgs7Q2LztKBC6mK36sIIIkkL8q4LhrIvyS3d4E+
	Psgy4kCkWdVSRPvU6q7U3trhhJ3vK4me2NqIrxNaQ3m0u76YSyQYfmThlgXkPi1j6E14Yn1K/Nn
	6oLa0
X-Gm-Gg: AY/fxX74AFnkrqhQtuMYFKiiV8YRm5g7+xkvbwwnSBccdhADqCZNHSGG8mVX399Vwps
	rz+cKOZBI6JmiDAiRMXb3PR0BJCB7CNI0f9s3cjQ/zKuWO0aSKk2M27tQXcqM/7lKlYbY6rZs3/
	Vz3WNI1DSWgjJKhU6N18ON+oLj1yJpI2n8EtFAq8/jSo41Rj2WjN6N/TwDuN9muoGz6tZaEcuQ0
	JLf9fcButZN9wxijSOgncsOGlrOo404fa4hMRBBgkSctF/uAeYOCGn1ZoMbMMu12BGCVMGmuwHv
	2/H1acH7UUP0n2DIifdp9MOWIXablRluWvx7gT+kN3bBCepXvAktjMPE4eVAkeR4Gkq4Ky92JRF
	3qExQ68E99cjnFblFXK8s4f78GknfDHhMHEM52+jU90qLozJmwXvq1tAcnpfrfu1BOYy2kSuF8T
	KAL7y8V0m63pr1TF6QlzbZZYp5Ptc=
X-Google-Smtp-Source: AGHT+IHo5/JDwq31zF6KkHTuBIz8aun+WZrAHtozzUrszrWr/Eth7iMknLzyeFJBQFaf75it8rPdxg==
X-Received: by 2002:a05:600d:14:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-47a8f9a825amr167451685e9.1.1766041965589;
        Wed, 17 Dec 2025 23:12:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aed4c7sm8304385e9.18.2025.12.17.23.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:12:45 -0800 (PST)
Date: Thu, 18 Dec 2025 10:12:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] staging: rtl8723bs: check return value of
 rtw_wdev_alloc()
Message-ID: <aUOpadPIsbYr-yI0@stanley.mountain>
References: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
 <20251218011414.1781294-5-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218011414.1781294-5-samasth.norway.ananda@oracle.com>

On Wed, Dec 17, 2025 at 05:14:14PM -0800, Samasth Norway Ananda wrote:
> Add missing error check for rtw_wdev_alloc() in rtw_sdio_if1_init().
> 
> rtw_wdev_alloc() can fail with -ENOMEM when wiphy_new() or rtw_zmalloc()
> fails, or with other negative error codes when wiphy_register() fails.
> Without checking the return value, initialization continues even when
> wireless device allocation fails, potentially leaving the adapter in an
> inconsistent state.
> 
> Jump to the error cleanup path when rtw_wdev_alloc() fails to ensure
> proper resource cleanup and prevent use of an incompletely initialized
> adapter.
> 
> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index 1d0239eef114..432bc6aa1d90 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -296,7 +296,8 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  	if (rtw_init_drv_sw(padapter) == _FAIL)

This call to rtw_init_drv_sw() does a number of allocations.

>  		goto free_hal_data;
>  
> -	rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj));
> +	if (rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj)))
> +		goto free_hal_data;

So this goto should free them as well.  I have a blog about how to
write cleanup code in a systematic way.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter

