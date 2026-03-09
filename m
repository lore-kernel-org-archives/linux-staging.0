Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7418421EE6
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 22:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093918; cv=none; b=lj2kp64s0OoFKfl+9CYm8wqCAG29/qPLIg26PAfSRm347Yl0PJCgBmJ6mBynm3OORzIfoJe2cJrHK3xl1eHms30zsCh9EXxN9uNNAPImWjOaTnPatRN8/MfDV8jAEEaOcj37d5TUGp+e72Gw/O2awsDYQEjuNDWAVBem/TNyMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093918; c=relaxed/simple;
	bh=PjWUePiPqWJI6X/GePnLQ5j02XSnOFq4ejtuT0XNOaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+Ec/9vghBNxU9ZMo3cRrHEwNdSrOP/9lAsH5b4zRVFPKaWdAupi7/pNkKT0VJ59PHdESw/L9eeYpG0UXo5HO6HNeG4/jG/24BTUWa/9QJV8BgbPJZPw44s7X1EnF2jC725VZUc57Uux10+npJ6hADhN/FTdfKmcKnx9ZF9SwRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZA3UJL2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZA3UJL2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so15775425e9.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773093915; x=1773698715; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sh1/MPGVOz0ssapVsSFxczXDSSRPJy6NxkgRJpIQR1c=;
        b=rZA3UJL2Rf12CiTKI5mHNB7LXwmwoeoYxY+l8RgUYGG3vjQnpP82JDQnr5wAZc8ifA
         oMAaRjYZt4lGu0MIaqVm69MD3eMFHegM4eX96iXLl2NyuB7cBnGuzTELyYlrYJFkS5ob
         jMnZ0KBFWIdFldq0BxMZYMTs/rS20BSoninnWOblOSBuC7NnV95c8XgDr/kHNLtJnTkj
         FpTWxlnTI3khh3S8Gi7ePKhjk37Ve91jpeMrYlzMGPNxAvt4ywtbV6Qpn9NwV8EuKTWo
         DlokVv3vIx9QyvfJwnJ5PG8txFxgYpLP2vzDgEENe0MMl8ZjqCQf6kyWfEc5NiQ7H3wu
         T56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093915; x=1773698715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sh1/MPGVOz0ssapVsSFxczXDSSRPJy6NxkgRJpIQR1c=;
        b=Q/nrf/qpP17G0XUQ96h9+lfzM/ODEHdHauOteU88ssDvGgvc+kkcVpgn5xaN6w+AdR
         KzLllYRizjER6ofrHJzPE11KQUP+IxaShhJwmdaLqDzU8caQMdStfKFHIZRTQz1GEw5w
         zUQMzU9YmH6lJ6/FNhpG6RrAL6nHiDHkHqKSKB9AN/98EYtZ12d2vjclh3KIxn0Rr70M
         OIKS4A2T0lRmkCVBR0omq/asNsqJmwboS0VXNNMp57Xt8uuewzLFQHJo1oPceQadfpdT
         i0shMf6xSH0fq6ki/7wCOe7LoJ+ooHUQzq9pEBanZRetxDjSXdi7I/QOc7dX2UOVKEDx
         Yqig==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZP4UuQsZxp2xY5Bh22jC4cWJp6LgcTna4iVGG8JI7q9YR2ICi8exsX77VzMNpIrA4glyFxYIdEPClPo8@lists.linux.dev
X-Gm-Message-State: AOJu0YwiMt+/fAk3ECa492ocb5Wnkb9OK++W1nZbo5zF2oodS3arNear
	PGUy5qKKnpfLEZLWkDBYjnu/BwJc46hL9swS/tFpJNOZWOwviMBdnQpOVMP3iG3vs2Q3oEf1p1c
	n3FdE
X-Gm-Gg: ATEYQzy0RgHbaFIiqXXRoGqnjj30S4YsV9RxZQZBw9pIrANAl3p/u7H4Wyj/zawzak7
	ZJw9IOVXR3ZjRdi5CkZ/d/QvbrDHrFFiHSUa60cNtPfSJbdLiL62bUgt81xcy9X7UeFJhfmpFl/
	+wLdMe2yb+3C3fTfGDGVvzAnBD5ufSwrS7iC3nas67s5BEEdGUx7iRqYYQN+JhHjf6Lmp1IqMp6
	XKMZDwA9cjpX3uSesBtGJXFCehDp4qtlFapGfCjDW1hEtJvg1daiOmePQJaZF6YqgosDXRYgEhG
	/euGmy/aKbRGKRLusTegFA47xt8nVo3inrYMYICYPzAgaFSQejc7/Eq3laVf46LH7ULGe7DrU5M
	V/nzWrtR8m8VFX8LWeVyd0aO48q6Rjce1kuSDOENgtdtOg0rIuJ93mgC0NkK/UMXE59THxtrIRl
	6NcFzXogTxTkS5Wb92JITEr4bDiiL1
X-Received: by 2002:a05:600c:310f:b0:485:390d:74f1 with SMTP id 5b1f17b1804b1-485390d76ebmr93464035e9.13.1773093914913;
        Mon, 09 Mar 2026 15:05:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a6bbcesm23594395e9.3.2026.03.09.15.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:05:14 -0700 (PDT)
Date: Tue, 10 Mar 2026 01:05:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luis Soza Rodriguez <luistermc789@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Soza Rodriguez <contact@sluisr.com>
Subject: Re: [PATCH] staging: greybus: loopback: use sysfs_emit in sysfs show
 functions
Message-ID: <aa9EFyfi9iprkQzi@stanley.mountain>
References: <20260309165522.26388-1-contact@sluisr.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309165522.26388-1-contact@sluisr.com>

On Mon, Mar 09, 2026 at 10:55:22AM -0600, Luis Soza Rodriguez wrote:
> As per the kernel's documentation, sysfs_emit() is the preferred way
> to format strings for sysfs attributes. It handles buffer overruns
> safely. Replace sprintf calls with sysfs_emit across all loopback
> sysfs show macros.
> 
> Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
> ---
>  drivers/staging/greybus/loopback.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index aa9c73cb0..3a502d89d 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -125,7 +125,7 @@ static ssize_t field##_show(struct device *dev,			\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%u\n", gb->field);			\
> +	return sysfs_emit(buf, "%u\n", gb->field);			\
>  }									\
>  static DEVICE_ATTR_RO(field)
>  
> @@ -137,8 +137,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
>  	/* Report 0 for min and max if no transfer succeeded */		\
>  	if (!gb->requests_completed)					\
> -		return sprintf(buf, "0\n");				\
> -	return sprintf(buf, "%" #type "\n", gb->name.field);		\
> +		return sysfs_emit(buf, "0\n");				\
> +	return sysfs_emit(buf, "%" #type "\n", gb->name.field);		\
>  }									\
>  static DEVICE_ATTR_RO(name##_##field)
>  
> @@ -158,7 +158,7 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  	rem = do_div(avg, count);					\
>  	rem *= 1000000;							\
>  	do_div(rem, count);						\
> -	return sprintf(buf, "%llu.%06u\n", avg, (u32)rem);		\
> +	return sysfs_emit(buf, "%llu.%06u\n", avg, (u32)rem);		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>  
> @@ -173,7 +173,7 @@ static ssize_t field##_show(struct device *dev,				\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%" #type "\n", gb->field);			\
> +	return sysfs_emit(buf, "%" #type "\n", gb->field);			\

Please, keep the \ characters aligned properly.

>  }									\
>  static ssize_t field##_store(struct device *dev,			\
>  			    struct device_attribute *attr,		\
> @@ -199,7 +199,7 @@ static ssize_t field##_show(struct device *dev,		\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%u\n", gb->field);				\
> +	return sysfs_emit(buf, "%u\n", gb->field);				\

Same.

>  }									\
>  static DEVICE_ATTR_RO(field)
>  
> @@ -209,7 +209,7 @@ static ssize_t field##_show(struct device *dev,				\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%" #type "\n", gb->field);			\
> +	return sysfs_emit(buf, "%" #type "\n", gb->field);			\

Same.

regards,
dan carpenter

>  }									\
>  static ssize_t field##_store(struct device *dev,			\
>  			    struct device_attribute *attr,		\

