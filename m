Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3B213C907
	for <linux-staging@lists.linux.dev>; Fri,  5 Jul 2024 21:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720214161; cv=none; b=JCLukichAjji+GifFjbPzWlDuuO/Ili8C3UudkFBM1q3g+3AUztZ9D1xzjVxnqOjZD/8M0m4BfmYyCdcYRiGu6p8Ie1jNzqjfphYhGVbNIS9C4G9zH7IIWfVBPXOeMYDMgQTTuaRWz7531SgpaaEnBuXQn5MJmA6SYV0UXGuY4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720214161; c=relaxed/simple;
	bh=Ic2LbMsnguoiVKQxFU8pj07QFdAiHGA4m/Zz8tgBXXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T07XfiCcIle9d4osraS9EQpq/OG2bAcD8NPSYZ2xPuUI2Ch+PrAX81cutKL2q3D177l/Z0Dhh+XuoGCRuaqxAJqtRlPSffesN9OCEreHJXcMJ1+WET86qwosVFr/bNH0bpwVBLVi/1ug1HxJ/gFYeJTJCaybMO8wh5t4MtONAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZHfYl3Gq; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHfYl3Gq"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c9cc681ee4so1071510b6e.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Jul 2024 14:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720214159; x=1720818959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gP9IOClOy8ifyUWle7kU/4az/csdyAUwswyqqTMCtkM=;
        b=ZHfYl3GqlvROhu3tf4CbOsYoI4a1JB3MHUzIZDuRNJ7qrUmrUgoMms57foH9HIL+M5
         moU+GrEZA0THXsEx4iR9MInQx23DJIkVl9+77FC/ZyfsT2LODeO5IQvw8Ozsg4Q6WNfY
         2/Y0LQQr9x9kHGpzq0QDs4NIL6/QTj4hDzzZcpam4M7ap6ZrtjzN7taOHq3jfeGEngGW
         GC2G5FENSJgi5gdH2iQeK85sJ35ZDRAghJ6Lm8G7thZvBQcGidnf0L6RkUGAIZ0lwaXT
         INtCRo+mDFqzOU+6DYeyi12oa/VS6gGj/WaflBsTf5hqYuEEwnM1A8dWYADzfadhSzTi
         SAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720214159; x=1720818959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gP9IOClOy8ifyUWle7kU/4az/csdyAUwswyqqTMCtkM=;
        b=XGjvpvgVln4pbrUGSbYmO3x9LuktKyYrDAaUtRZgitTfXYPc072G8MHb+V7FHg8F5e
         mE45o8GdIL0nN97bS3yFC7a6d7Lhx98BesI2jXn6MLs3ON2WDSrzbmBCc7DmgDInu7VB
         hzHMmuST3kY51yR4HLpwAS9EyEsliUzs2xstrL4QV9QODWMc8doZTcXz6NsvtogmmuXY
         L8HmYi5+AEvTSjOVO2oA1jIVHxzwf/BfusJ1Z3A/IWCIgTdHoVXBu6Pqwn4rXKn0wq6t
         bNzjNOvs5bU5nM3Eor7UOw0wdBjrZWlO/I7/lJgkZ+O5RxpRohJ0GSC46Flocul5RAku
         KTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUavJ4LXq2k4w2AK8NxnOofE29M37GzBMTNnJTp/uGGIDMhjBy2r7/UTH7O+Dk1YWbc0chsAJvNx5jP29sGRekt1CC5pkP9uxSXp27hOA==
X-Gm-Message-State: AOJu0YwmrVBE6GZG3igeXgvELjg7fIqJ9rnRW1gGnO+4W9ZPYprTeDj9
	iguKkz+oKnvX18Uy1GCEXvVPhVB9v2aJc2eS0UIAWqZypfr1RQPpSI1XthtPAAA=
X-Google-Smtp-Source: AGHT+IGg7afFMV1Z0RlmTODc0srTZIscy4siYacHBPJuH2yHilodO9FOk+F9DHD5HFbdlLZVm4LPsw==
X-Received: by 2002:a05:6808:1211:b0:3d9:2415:da73 with SMTP id 5614622812f47-3d92415de10mr612343b6e.42.1720214158777;
        Fri, 05 Jul 2024 14:15:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:11fa:6fae:6781:5836])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d91bed280csm304951b6e.41.2024.07.05.14.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 14:15:57 -0700 (PDT)
Date: Fri, 5 Jul 2024 23:15:54 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zhang Shurong <zhang_shurong@foxmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] staging: ks7010: Remove unneeded check in
 ks_wlan_get_range()
Message-ID: <dd8d077d-4e04-490b-bf2c-dbeba8010db0@suswa.mountain>
References: <20240705204434.10541-1-amishin@t-argos.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705204434.10541-1-amishin@t-argos.ru>

On Fri, Jul 05, 2024 at 11:44:34PM +0300, Aleksandr Mishin wrote:
> In ks_wlan_get_range() variable 'i' which value is always 12, is compared
> to 2. This check is unneeded and should be removed.
> 
> Remove unneeded check to clean up the code.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 13a9930d15b4 ("staging: ks7010: add driver from Nanonote extra-repository")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>  drivers/staging/ks7010/ks_wlan_net.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
> index 0fb97a79ad0b..d56dae73e7ed 100644
> --- a/drivers/staging/ks7010/ks_wlan_net.c
> +++ b/drivers/staging/ks7010/ks_wlan_net.c
> @@ -972,10 +972,7 @@ static int ks_wlan_get_range(struct net_device *dev,
>  	 * in bit/s that we can expect using this interface.
>  	 * May be use for QoS stuff... Jean II
>  	 */
> -	if (i > 2)
> -		range->throughput = 5000 * 1000;
> -	else
> -		range->throughput = 1500 * 1000;
> +	range->throughput = 5000 * 1000;
>  

This is part of a custom IOCTL.  According to the comment, we're
providing the 5 million as information to the user which I guess they
might use for QoS stuff...  It's kind of pointless.

Anway, the patch doesn't make anything worse.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

KTODO: delete custom ioctls in ks7010.  (requires careful audit or testing)

regards,
dan carpenter


