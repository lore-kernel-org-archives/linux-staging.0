Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F462421D
	for <linux-staging@lists.linux.dev>; Fri,  4 Oct 2024 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728032472; cv=none; b=bA6uG0A5TA7sWLXHwAgm7ZavkMqieRtwSIxMECFEhUY+NG2HJc5AfHgzu5bEOJEfrIXY0KEVh9+PaWsx1rk+FjWQd6PM7NXMaVvKQq4VaON7rt3iH/73haAlWUEm+8TW/jfwb+Fa7nz3iB/9qy5Q6zPheKvN5mDGieACUnc5LNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728032472; c=relaxed/simple;
	bh=dXkff5X4f2aO5FSQf7DH2ZEj+n5WLcizAHNEHDT0LpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGVhcmVxDX6wekSsIR0ll0qYrLEOGGOrcUBM+RxbzyCVIKngkqgiNEdlkALQxLJ0TGbghdCSS79UAwc9NJADx2sXfXgDycDl9qc1WFLhCBmQwwP+7Qt7vVxBIUQGFDLIZNchLizh45zaCInct2odngPaLSSyxy+JsixI9g3RDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2wWwYVw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2wWwYVw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so11308145e9.1
        for <linux-staging@lists.linux.dev>; Fri, 04 Oct 2024 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728032469; x=1728637269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LcemWjXMW7EZND3msCXeV1BDAvqAABSJZyGqgZUq/M=;
        b=z2wWwYVwdmoCIo8mQRU7Q2rjZ0ckmozBYPFISmVRKUYR3l+gZvOKZ+EN3QS9uajf0O
         1lJ7RzKv2jz4ZQOz6+H+fuPqLPv3oaLo5KJCX0OhBW7QYRwDeigfRXqTiazgTsrEl7+b
         wysB+UDqnWYZN9zN013zAD97Auh46BeXcl4WIzruyGJw68Q5tPikMqdf2RlBoxPxthcY
         nCFeogkTqyzfQ/PT0k7nEQLAllGy5mrInXgyW48DlcPbhXe8LDPqhcsNQDswOa5W3SDj
         PnALAbYTE+TeKWkbY2m4HzHnZ137igTWWHAVJVrsVH77aN9kqyKx2Y1InLmHEfcJ1sxg
         X7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728032469; x=1728637269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LcemWjXMW7EZND3msCXeV1BDAvqAABSJZyGqgZUq/M=;
        b=ojM0dhZjIolYUCTfCvBvkSi+vMIXhuyS5ZlC+FWwBb2Iru/RqJS7wGFG4yj6mkrdzR
         cQHvbe5SSxw7jOcc01Cek3fM6hBnsHMQoxd2YeRBnTZfALzKLmsH8Z6ym4sGk3L5ESci
         dvC25qjP2a/C4kIKqowc6hoqhHzBZcdqpeZIZd5zrO+sh69hE4kDNh0JcxbHIDw8rn7C
         DZS8Oyqed7lJNygGI4mmV9iJT+pd0KQsBTeKdkha+s3CsAeaXNyTi+QSCjzeDYT84lsV
         BVuFekjXWgG/ZqKzA95SZAjtRAXh+7hPn6WSh4DNeiCw7eQBqzb95Oj8NU6jX0DO84iS
         z2Og==
X-Forwarded-Encrypted: i=1; AJvYcCUGNQagf7iRbF03SLnw0/dQl7ZuFlOWkgq6/ss5FuqTyO542jpQIFOUZQtIfRn93Lj7/yuEtfV7LALLNcVi@lists.linux.dev
X-Gm-Message-State: AOJu0YwKITOEKHX1BUY1AsKbIUm6e6AbAgQh+kXilf1d4mGfbn3pMXTc
	ihRZ3Z+1L1Q8CKugFdEdNpRueObxF+gpel8/eNA5Z/0MPEWpGrfPCcsyv3zsgNA=
X-Google-Smtp-Source: AGHT+IH2F097a9rbFrai1UAcOgCa03oAlZmgpU9uxn3bVQHoFviJk2Zrku/H1KBvh8/iLOntHx6elw==
X-Received: by 2002:a05:600c:3c92:b0:42c:b73b:fb43 with SMTP id 5b1f17b1804b1-42f7df9fe14mr39717125e9.12.1728032469047;
        Fri, 04 Oct 2024 02:01:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a201fesm10354345e9.1.2024.10.04.02.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 02:01:07 -0700 (PDT)
Date: Fri, 4 Oct 2024 11:00:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: jonathankim@gctsemi.com, deanahn@gctsemi.com,
	gregkh@linuxfoundation.org, ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gdm724x: fix returning -1 with return
 equivalent errors
Message-ID: <47723ac6-9131-49f2-8746-1bc8845187cf@stanley.mountain>
References: <20241004022025.7015-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004022025.7015-1-rodrigo.gobbi.7@gmail.com>

On Thu, Oct 03, 2024 at 11:20:25PM -0300, Rodrigo Gobbi wrote:
> As in the TODO file, use proper error codes from PM callbacks and init.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Only one reference was left, regarding the packet_type_to_tty_index() but
> I think it's reasonable to keep it that way since it's for tty index purpose.

Better to return an error code there as well.  It doesn't change runtime
behavior at all, we're just having a discussoin about cleanliness.  I think
error codes are more clean.

> 
> There is a RFC to delete this driver at [1], so I'm not 
> sure if this change is worth it. Anyway, I'm submitting 
> it and I'll be waiting for an opinion about this.
> Tks.
> 
> [1] https://lore.kernel.org/lkml/50020db0-3bad-41f5-8da3-c66bc0a90fe6@gmail.com/

Most likely Greg will keep merging patches until the driver is removed.  It's
up to you to decide if it's worth your time to keeps sending the patches.

> @@ -991,7 +991,7 @@ static int __init gdm_usb_lte_init(void)
>  {
>  	if (gdm_lte_event_init() < 0) {
>  		pr_err("error creating event\n");
> -		return -1;
> +		return -ENODEV;
>  	}

This should be:

	ret = gdm_lte_event_init();
	if (ret < 0) {
		pr_err("error creating event\n");
		return ret;
	}

regards,
dan carpenter
