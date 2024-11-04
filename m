Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6451318BB93
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709771; cv=none; b=MvqPhgiNc8ziky+wJjghR+AweE4JXMyQ8IlS2nGiAmZjkuERRRzKDmLhnivijxfDlfLZH6EtnMq7nLYX8wknEDO0Njy2q4H1z/RAgE8UakIvNQtNMlTyDeaQC1sMwmyM6/yj6EeZweo4NTADMR7YZuDkOg0lKF5hcXDOClHON5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709771; c=relaxed/simple;
	bh=PMGJRTXJeSK/uC86GqSqce1IAHbTUORnZbtV9juvMH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogWdQdFp4kCOHgqg+HRVB8po6Am6DvrEN91rZ0D8hgGR7pm8cV1FVpJku4zrF/3fozIkGJM6fSN4HTmFz2XacigvFBzTyLchNlJ+j8YJY09QlddYR0S7gDF/9qH1W/VPjQHQFp7VjSz5np3PM+K5KktLaENflCRS6R4BP+jxX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eUMe+kpU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUMe+kpU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so3635014f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 00:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730709768; x=1731314568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hH2a7p6u9/6yeJieZT1sX7At96845cspMVVeyTD+9Yo=;
        b=eUMe+kpUAJKInGOx0QmpGsmpUo1sPabpbnEmwKzdSZ20619DJ1GPym/L5Zg88bhQ+0
         V9BH3/0veRR1lQM/dIhGPDVjIllZ6itKNeLNV7kVHM0hIOyFvp0iG2cKJTMKa2DfT1tB
         aGkEPEa2g5Tlxb/ZJ0MG3YCBHJycMKvs+mvCmiXGTF6uc2T/ZZqmQQNpZiuzLkLEm3CN
         ff2mJB/7dOcROouTMGgZwXa1hDOMQkc4/PiOBMf3MZ92WEtAirK/ERtBHiVOZ2MJcxSP
         0GMVZzyLbQuOI6QBXXDvAouxQqS65s3UNPuKoYuittAXGv5QHbvVtM/iKZNUJIFSBdfs
         viUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709768; x=1731314568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hH2a7p6u9/6yeJieZT1sX7At96845cspMVVeyTD+9Yo=;
        b=huF5WB23zyKXgvo1+PSjJA0+b0VNjTCBExHz5WkLpHnJhqv5Mjgey83GAU91yoRbcP
         4WZO4KYRCvXpb2qLJp7Iljg0UxskoRG3JYdVjOKDWh8tzLqj/fLYXnRgHkWsEjmq0BLk
         O+xoWodaUc5d/5jlwUeVmyFm+UsEmntxWETQ/UMW4YrZjFb/kAYs8YMXsWBjHHUbMcVi
         noNFFbuXYCxYpT7ptrSWLWVABDqLxnVrr00fx1GiyJvuu7P06xCZqYRP766MucCaurWk
         CXbRjqULW9497cNAZE5NGhSxv4Y7LKVy+lGgnhdkQZi3YdVfZeeKCF/LghATtYwn/dpZ
         F3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCV5v2/C6HQDzMbFlAj1N36pGyya5rLyR3DoiG/f6FKw2YRlUVsKwTbunwUOQUvU0INLL1VPAWi0dEni1W7U@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6R4znZyU4JGYn+jwxItjBG0CfDeeLS2tWOevsGTSDj5LqYC5+
	V3wnuTWwqwxcym3I4UaP0qoxiA6k/Jp5LAazEFuxsDfiU8kNNSGO4bHJX8FlYoM=
X-Google-Smtp-Source: AGHT+IH0YvBRoj68w9YDPGUZW+eoW3tHfaMzoBGwO/I57qJ6sY1IOTj/JfSskMotJCV0el88/SyLcQ==
X-Received: by 2002:a5d:6dab:0:b0:37e:d2b8:883a with SMTP id ffacd0b85a97d-381c7a464c6mr12433759f8f.12.1730709767667;
        Mon, 04 Nov 2024 00:42:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d7e0fsm12460840f8f.47.2024.11.04.00.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:42:47 -0800 (PST)
Date: Mon, 4 Nov 2024 11:42:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 04/11] staging: gpib: Update messaging and usb_device
 refs in agilent_usb
Message-ID: <e51ffd6a-b002-40df-94c0-02eb8cbe8c76@stanley.mountain>
References: <20241103212617.13076-1-dpenkler@gmail.com>
 <20241103212617.13076-5-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103212617.13076-5-dpenkler@gmail.com>

On Sun, Nov 03, 2024 at 10:26:10PM +0100, Dave Penkler wrote:
> Replace GPIB_DPRINTK with dev_dbg
> Replace pr_xxx with dev_xxx wherever possible
> Use previously initialized usb_device pointer for usb_put_dev()
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
>  .../gpib/agilent_82357a/agilent_82357a.c      | 266 ++++++++++--------
>  1 file changed, 156 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> index 748aadc5cebc..68b40831b9ad 100644
> --- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> +++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> @@ -15,11 +15,11 @@
>  #include "tms9914.h"
>  
>  MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("GPIB driver for Agilent 82357A/B usb adapter");
> +MODULE_DESCRIPTION("GPIB driver for Agilent 82357A/B usb adapters");

This should go in a patch by itself.

>  
>  #define MAX_NUM_82357A_INTERFACES 128
>  static struct usb_interface *agilent_82357a_driver_interfaces[MAX_NUM_82357A_INTERFACES];
> -DEFINE_MUTEX(agilent_82357a_hotplug_lock);
> +DEFINE_MUTEX(agilent_82357a_hotplug_lock); // protect board insertion and removal


This too.

>  
>  static unsigned int agilent_82357a_update_status(gpib_board_t *board, unsigned int clear_mask);
>  
> @@ -29,9 +29,6 @@ static void agilent_82357a_bulk_complete(struct urb *urb)
>  {
>  	struct agilent_82357a_urb_ctx *context = urb->context;
>  
> -//	printk("debug: %s: status=0x%x, error_count=%i, actual_length=%i\n", __func__,
> -//		urb->status, urb->error_count, urb->actual_length);
> -
>  	up(&context->complete);
>  }
>  
> @@ -80,16 +77,17 @@ static int agilent_82357a_send_bulk_msg(struct agilent_82357a_priv *a_priv, void
>  	if (timeout_msecs)
>  		mod_timer(&a_priv->bulk_timer, jiffies + msecs_to_jiffies(timeout_msecs));
>  
> -	//printk("%s: submitting urb\n", __func__);
> +	//dev_dbg(&usb_dev->dev, "%s: submitting urb\n", __func__);

Just delete this.

regards,
dan carpenter

