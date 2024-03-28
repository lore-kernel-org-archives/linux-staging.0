Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145A39FD4
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711634604; cv=none; b=AiJoOSxdhefeaRv+eAtUYCvnK8GqmqmO+Nj7dHo/7I4L2Noak/wPptCSo6JEXfVkjRz1/EoTGqwe9ggS51z+XPJ/2QHXUFAv/2InTqQNRm7kcKz3CHuUWZyGBkKvPjtTd2rnFSAVya1enPvna0PiEiX74EXRzLT/AEJjsmtom1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711634604; c=relaxed/simple;
	bh=1CRhwGIJSKhMbpQ/RBExx1bECy0jy3gMQ+/TAbtgpUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSwLA0tx9QChQD/rv4bjVzUZ80Rk1yuNQILQF3LiFrVQF9jbg1+W6MG27atfdNS53isBmM7Yl3dnbtJgb0lad9WA5rKsKS5epsg2wLU4Lq35A43kmGTyi1NcSiz6sDwtPWKmZx+7/qqvsfHFC8knd87vSk6auoBXsunrU4XeEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUtlWcvX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUtlWcvX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56899d9bf52so1328615a12.2
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711634601; x=1712239401; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7sKGYLNVMGXVEBGiVnvjU98J22psaopjpEMp6FYlRJU=;
        b=iUtlWcvXHEnmnvechscuU4K8Fcqmer/2Zg9ErCMWwsgwsE8FJJWkNMCujASFDyGI5I
         gCrxkzDP4El4CdYJsd7leD/YdzzvVn/Fhn2a/whvivyYVjNno3gQt8HC6Mz0b8LwFOpx
         RqOdxcVtrqgyzqvdQ2H41NT+KoPm4tIH2nHsBpbb2oZm2KWIWuCmgFEgTlJaArkrUVDS
         9IjSbQOIm2n8z+dncT2lJgLAooUrBjUekuNHN9a0+xLqAGdEMp+81jBT2nNO/0Gf3uOd
         RDGurNkvQDOm4ecJJ1H6QWf+MjttL3st0khjQ2AhyNrUTYEb/zp+1pcCGPXANhtxI2zj
         NdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711634601; x=1712239401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sKGYLNVMGXVEBGiVnvjU98J22psaopjpEMp6FYlRJU=;
        b=M39Ky7FgieF3YPFf4RacflCTrZddV6VbEfeNrlPKvlS/tHnFeOroL5Jyd3kRCEEQkm
         hso/+OQhdU85vO1MfLusUynRwJ+pK2Rk553h+MbFEMBhgqviZCNzXrznIfnFR+T+XFOI
         77sDh3Gu+xRm743UdZNVdQtHKbikcCboko7pYZh8mKWfLNIqfE3TiIYUanFw66bbFM0S
         If0jm+H4I5V6aXHuUtN8V8EtqlJWqxkWD7l++nsPddfPP5oIZkPiE8McUbvx9KTNSN0O
         ekgPcQjKIUJv0pW6HZfJs2e7aYpwEelP5z5mp3HFZkThLIR7Ji8rCM0P2KnqtyLnPSaV
         psng==
X-Forwarded-Encrypted: i=1; AJvYcCVxkK/CmohgRs+sBmc/6s8SmsY7yRQ7vCUjOfgSHA2/kJtzlXCQau55GWCMUhhk0kNYKkVtgBXU343dhvEIIKdFDyC/N5mc/T/p0dnHmQ==
X-Gm-Message-State: AOJu0YwV0IVLvHKZYbsutz6/fbTKht8a4KURUV54dRQU9NjX7BHjTFY7
	IqOiX1xKFusGKps+qUDGHuBhcV3H+S6gvrwDiVydd9QEnlONgOPscoiO6X+VPLs=
X-Google-Smtp-Source: AGHT+IFCInzZpL9neFPC+ou6pgAku6KUY9RgTMC2MkaJLzHuJMtbTOz1CQwMNI0J3x0j2Qa4AC/izQ==
X-Received: by 2002:a17:907:6d1a:b0:a4e:1ff7:5c79 with SMTP id sa26-20020a1709076d1a00b00a4e1ff75c79mr1982741ejc.14.1711634601273;
        Thu, 28 Mar 2024 07:03:21 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f5-20020a1709062c4500b00a455519bcb3sm788519ejh.55.2024.03.28.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:03:20 -0700 (PDT)
Date: Thu, 28 Mar 2024 17:03:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shahar Avidar <ikobh7@gmail.com>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com, robh@kernel.org,
	felixkimbu1@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: pi433: Remove duplicated code using the
 "goto" error recovery scheme.
Message-ID: <9c5b4159-da26-49d8-9682-445c01b19a51@moroto.mountain>
References: <20240328121244.1244719-1-ikobh7@gmail.com>
 <20240328121244.1244719-7-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328121244.1244719-7-ikobh7@gmail.com>

On Thu, Mar 28, 2024 at 02:12:44PM +0200, Shahar Avidar wrote:
> pi433_init had "unregister_chrdev" called twice.
> Remove it using goto statements.
> 
> Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
> ---
>  drivers/staging/pi433/pi433_if.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
> index 62ce75b07bf0..e538f1d4e787 100644
> --- a/drivers/staging/pi433/pi433_if.c
> +++ b/drivers/staging/pi433/pi433_if.c
> @@ -1400,24 +1400,25 @@ static int __init pi433_init(void)
>  	 */
>  	status = alloc_chrdev_region(&pi433_devt, 0, N_PI433_MINORS, "pi433");
>  	if (status < 0)
> -		return status;
> +		goto fail;

Just return directly.  Do nothing gotos are bad for readability and they
create Forgot to Set the Error Code bugs.  Also there was a direct
return earlier in the function so it's better to do things consistently.

>  
>  	status = class_register(&pi433_class);
> -	if (status) {
> -		unregister_chrdev(MAJOR(pi433_devt),
> -				  pi433_spi_driver.driver.name);
> -		return status;
> -	}
> +	if (status)
> +		goto unreg_chrdev;
>  
>  	root_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
>  
>  	status = spi_register_driver(&pi433_spi_driver);
> -	if (status < 0) {
> -		class_unregister(&pi433_class);
> -		unregister_chrdev(MAJOR(pi433_devt),
> -				  pi433_spi_driver.driver.name);
> -	}
> +	if (status < 0)
> +		goto unreg_class;
>  
> +	return 0;
> +
> +unreg_class:
> +	class_unregister(&pi433_class);

There is a debugfs_remove() missing.  I have written a blog that might
be helpful:

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter

> +unreg_chrdev:
> +	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
> +fail:
>  	return status;
>  }

