Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CCB1B263
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 15:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709392988; cv=none; b=XHYWdzSHuiHZHDfI2tgORwsrhn2+WTAuElxWn1+Gge3S3mhf91nHSYNLoxBMtEafonh9Lh5J6bf6xiywYH6oDYbGiAnPJQX7sYPuEYlJUPXCPum+ubxGLRcKOHJgJIur2kFr18rCi+JD9GfbotCMtu9zaRKDiXd8FiI+2XmoJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709392988; c=relaxed/simple;
	bh=At3koup2VviNDZCVLU1l+Lb3pUdJLRnNtkzTZionXlk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nggtL3x2GxCJriwIegKEmju7UNQGhTpR1skBK6RU8L8Y7ZvSqyM5+ARBpsBJVOhDzNlGLUHY0GbRTxyivrhBkDo2BUBkczhMy0NU7plSQKi/CyLRZn2xU3sjA5MOXQFU2yKBStMl40RFf72Iy9yxIPkpAuRlfflB9G1oVP0olwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekJIz2qP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekJIz2qP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412d501fb96so3126785e9.0
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 07:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709392985; x=1709997785; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7rzo5E+RHg0C/U2GFdAHU5U5qrBuZYlX6RBI4q7dlI=;
        b=ekJIz2qPEeSaEOCJ8rH0eNcvdM8ZAFrR6FZ+TBrLzhPpVZINTQNDDUf4kTf2loUcDJ
         Nuwn1w+LR5lM6mdLnptgwHrLNInpvPuYgp2alBuptwqFsUBPMYcTF3O6rOyJhmLvCuBC
         Itk43Z6O4cm/T6K803/2PW0cesg2LUVDQZurGtLbrrXrldQKOXTBjRE23Zbh/DM0E+Il
         6w3Rg2IlraUWvNvMMrOLWdtwY1aiFWYDEhNE2R3xeagH/NZA340JZDdmABsRuWpWLxiI
         sN0zI2PcxSKjWnUhp1Xkuk/A/LMSeVk51s8jOz5lXuinKgs5zT1gt0nyAM1rGB1vrLxl
         vzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709392985; x=1709997785;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A7rzo5E+RHg0C/U2GFdAHU5U5qrBuZYlX6RBI4q7dlI=;
        b=i13W2jKulouIJ/EDWbzntUSb2BRjmUIJR7vZ0DP5XxX4THmn26pX0F3yCEAUc0W2A4
         piiHNEHmZjNrbXsNEY303zQwe2k2mGdJRt4Gfa5VtoNnrjS6yjZ7faXm60ksyRGoOTF3
         c5c/6AtbS2qHwUNeCY/up0niIx3o9suGAVXOn37TggQ2gcKxQUek6NNMVji1sDBlrPb3
         WUTQuJZxy8YGhbiCENGzs8o8kCMybCFcFD1WGxczfiuWBsOl5F5FA6WMJZijDD171iXL
         qTB3y3ulP7tMls6eb7HKZVhvAVGLAqwxq/y1SnVuMMXpVq36hf1xNz23u7XsI8MxFHgG
         AxCA==
X-Forwarded-Encrypted: i=1; AJvYcCXrcrZ6Ur4mXG9b5Fr7qk8vyRCZWY1EhnAjIt3KoEIYqEx8pIg2018HoxetQf1xMSo6Di76d+5yzGI+KHn7bcvWNUQgSEjzt9VEIH7cyg==
X-Gm-Message-State: AOJu0YwA+7yZIhWyvjC4dGdsw8XrCPGUycTURjXZEnB+M6HwusC+j7yx
	Phfi2hTwN1sCQWwxrADjzXC1ZbJk0rlFUsy4GfJy8QYjVJM/PnDU0bifFncY
X-Google-Smtp-Source: AGHT+IF9EsswUNlrC8dO3hIulzO0/nAlfpDfjvuB54ZVatBrhaWcGqVfEjcX2nY29ypVQwZKsWWmYg==
X-Received: by 2002:a05:600c:468a:b0:412:b0d3:62f4 with SMTP id p10-20020a05600c468a00b00412b0d362f4mr3921542wmo.26.1709392984465;
        Sat, 02 Mar 2024 07:23:04 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d4583000000b0033b47ee01f1sm7486148wrq.49.2024.03.02.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 07:23:04 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Mikhail Lobanov
 <m.lobanov@rosalinux.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
In-Reply-To: <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
Date: Sat, 02 Mar 2024 15:23:03 +0000
Message-ID: <m3ttlolktk.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dan Carpenter <dan.carpenter@linaro.org> writes:
Hi Dan,

> On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
>> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
>> Assigning the channel the result of executing the get_channel_from_mode function
>> without checking for NULL may result in an error.
>
> get_channel_from_mode() can only return NULL when light->channels_count
> is zero.
>
> Although get_channel_from_mode() seems buggy to me.  If it can't
> find the correct mode, it just returns the last channel.  So potentially
> it should be made to return NULL.

Correct, thanks for the fix. Will you or me send a proper patch for
this? Taking also the suggestion from Alex.

Thanks in advance.

Cheers,
   Rui
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index d62f97249aca..acd435f5d25d 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>  static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>  						u32 mode)
>  {
> -	struct gb_channel *channel = NULL;
> +	struct gb_channel *channel;
>  	int i;
>  
>  	for (i = 0; i < light->channels_count; i++) {
>  		channel = &light->channels[i];
>  		if (channel && channel->mode == mode)
> -			break;
> +			return channel;
>  	}
> -	return channel;
> +	return NULL;
>  }
>  
>  static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
