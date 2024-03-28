Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B969A7F470
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711643735; cv=none; b=Lgnt9reXgRqUN5KcbWBscyehT/+yF59npW/y1c60JiylELg89YeCj6H5K8p7nLuj4BzgRoVWHLnUeAokMuVuNn+xTeLNzOKMwBXa3sclgM4uQZINHjvoswP2lrUEVxAGGxzyBYa/+hgTmxqaLOkWqTyXJr1/BhkFES22v5/cgfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711643735; c=relaxed/simple;
	bh=JWJtXJcUZY3AnWXjwt7iRcnwQ6zGkVqoL86keyxldpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc+eNOGXzVlN7d7E1UQhdgswxvwWP7K7mAmmym24ZvSVy9hbWGVrZGYZu26HDm1j4VapOi5LIPCJvzyZgEJReUSoq4LdpfAn3OwnFmfPs4hgbFwxHGyfVXJ4YoFni25RS8bZHSLRHhue0cGRXSQMiFwJVcFhaDabKAG/YqXMH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XU2xl0CO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XU2xl0CO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c36f8f932so3927351a12.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 09:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711643732; x=1712248532; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCUTxfQ4sQDe7I2H/wHmYFn/xpUZAljeyI/mp/W6HYg=;
        b=XU2xl0COJIZXRO4w+lUdsRWOZAYbtYa05q+ZV8g6sJFVQ040fwWCW4XJLOZG5zx7pe
         niO38DNL1siM8r466aK0KADZrs6SfkkB7s2ExH4a/UZ/D5EyMicjVL9nGjVyB7Me64if
         fqx3ZMNxhzZAkYhhvRbC+sb9xw1Cf8vBLEUouCg/mZSGgoCLVKHbnp1qje3rM+JvfkuD
         oUbPMgRucUvEkDorX754wc2qi+HU+ufoUAVPAHgsLQxVw/+ZtjuceU8EFH70cbqA8r9C
         WjBZc9jWwNb4D5YYTqlH0TMmkLWpqPw687bHvFYcVV4DOd590NoPEdAHg7uObmfqJwdN
         pwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643732; x=1712248532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCUTxfQ4sQDe7I2H/wHmYFn/xpUZAljeyI/mp/W6HYg=;
        b=eD3Z9fPWmhXrOqTc4kZK9qVcs7GRVQooElhh28ImPYfdTKaQzPobRFORuLUCNMOB5G
         TSPAbv/Op2ZoOGA46n4y4SlNwDTPFfk+RQXqzS/+CQbKcTVk63GrDMpR5uMW1rIFDHkK
         9eoNT7SBnKLlFiyEvpRgwsx9jFm1/nFEhwXc7l4Nqa9CzWQY+HYn2pifk/OP/87ZMUbE
         2mlhIIP4TkcX5Hn+Hn/xVOsDxfbdq5X4GwuWYx8zp1EJqS3wvmzV8+AkmEGbf7ua2UFM
         CKzee4CHHK01wY1NkcB4UnsLdE6hYPHKW0bHTvNEvQ/crzYmeIo5b1499VlJhf6QINaT
         cUbg==
X-Forwarded-Encrypted: i=1; AJvYcCWnlwNkXR/Qzy452/Bce2Vic4Jl1oSNedwJYTfy671o56OvyTLUO9ivgw/XWISHq8Suu5JbscWxLkXXAy0Oir8ymODC3RdGryJwdVOXvg==
X-Gm-Message-State: AOJu0YziSvsPhe3stQy8fJRmsSiEo7V3J/rZ8vHIBrZAaLY2QoCSCjPF
	WbKb3GQf8B0TGYYYP4/E34fAfzFBsvEsIbhN+u8Xeaa31qLEkGFQPGm6vVnQ6O0=
X-Google-Smtp-Source: AGHT+IFTY80fk9XyBaSRDppe2um+6T7AR4MPRN+imdT7eIFfQ7qJN7VFb8w45tGYOcGd3+eFKHHHsA==
X-Received: by 2002:a17:906:228b:b0:a4e:4d9:7ce4 with SMTP id p11-20020a170906228b00b00a4e04d97ce4mr2492742eja.30.1711643731940;
        Thu, 28 Mar 2024 09:35:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h9-20020a1709060f4900b00a472c4b9486sm937920ejj.84.2024.03.28.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:35:31 -0700 (PDT)
Date: Thu, 28 Mar 2024 19:35:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Micay <danielmicay@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 03/11] staging: replace weird strncpy() with memcpy()
Message-ID: <695be581-548f-4e5e-a211-5f3b95568e77@moroto.mountain>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328140512.4148825-4-arnd@kernel.org>

On Thu, Mar 28, 2024 at 03:04:47PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When -Wstringop-truncation is enabled, gcc finds a function that
> always does a short copy:
> 
> In function 'inquiry',
>     inlined from 'rtsx_scsi_handler' at drivers/staging/rts5208/rtsx_scsi.c:3210:12:
> drivers/staging/rts5208/rtsx_scsi.c:526:17: error: 'strncpy' output truncated copying between 1 and 28 bytes from a string of length 28 [-Werror=stringop-truncation]
>   526 |                 strncpy(buf + 8, inquiry_string, sendbytes - 8);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Since the actual size of the copy is already known at this point, just
> copy the bytes directly and skip the length check and zero-padding.
> 
> This partially reverts an earlier bugfix that replaced the original
> incorrect memcpy() with a less bad strncpy(), but it now also avoids
> the original overflow.
> 
> Fixes: 88a5b39b69ab ("staging/rts5208: Fix read overflow in memcpy")

I don't see a problem with this commit.  The "sendbytes - 8" prevents
a write overflow to buf, and the strncpy() prevents read overflow from
inquiry_string.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/rts5208/rtsx_scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
> index 08bd768ad34d..a73b0959f5a9 100644
> --- a/drivers/staging/rts5208/rtsx_scsi.c
> +++ b/drivers/staging/rts5208/rtsx_scsi.c
> @@ -523,7 +523,7 @@ static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
>  
>  	if (sendbytes > 8) {
>  		memcpy(buf, inquiry_buf, 8);
> -		strncpy(buf + 8, inquiry_string, sendbytes - 8);
> +		memcpy(buf + 8, inquiry_string, min(sendbytes, 36) - 8);

I think your math is off.  The string is 29 characters + NUL.  So it
should be "min(sendbytes, 38) - 8".  You're chopping off the space and
the NUL terminator.

This only affects pro_formatter_flag code...

This code is such a mess.  I'm not sure your fix is the complete fix.
When I see code that's clearly buggy like this and it's not sure the fix
is complete then I generally prefer to leave the static checker warning
as is so that we are reminded of the bug occasionally.  How close are
you to removing all these -Wstringop-truncation warnings?  Maybe we just
add a comment or a TODO item in the drivers/staging/rts5208/TODO file.

regards,
dan carpenter

