Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95137482
	for <linux-staging@lists.linux.dev>; Mon,  8 Apr 2024 20:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712608735; cv=none; b=B7aIiRPz9IAvORwwy+sFPfgaPIL9s3gn/GjYWR/AGTPGi6Y93DSJwNw2XOdFXB3qyB2XTIJVJBYwZ12NFlhadBikQzY8rkKZdLBrTLcxXOi16oAMgEddqnC7uuFEoJ3nbJurXRO+id40DZAoQcisuNxUvwioWbFpfsNLmo8ypI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712608735; c=relaxed/simple;
	bh=lEHoPN6gYhfk4UDi8utcR6Ihx3SZ138a1bYEvCHbXMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrD/PLMhbuyA4Sn2+hURdNSpyo1jL7bK++FxJk2hgt9/n4lo27lgR8N0lyEqI9MK1866pqqQVc8drH26+LZizZ6C8Z7j62llLdmDvuyogImeDnkANU7Dt9r1XKlnysGeI1UEfXYv2ur6QREubKw2hh5B9Uu0CdvAWPJjjOIYcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uCrDcHi1; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uCrDcHi1"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7d0377850aaso188361839f.3
        for <linux-staging@lists.linux.dev>; Mon, 08 Apr 2024 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712608733; x=1713213533; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=66EhmBXE+6opbYU7Qf+U0TLJ3Vt1siSvg3UxG+2mUhg=;
        b=uCrDcHi1xEFPMaxOSdomzbpeRnJAl+l5mDT6IS5cfZYfWfiZTZpFY6+rZEYUL5VREY
         u5DStpH0ohp1eSIc+jK5YqcJeSIB3UNi9Gb++y0k3hKKZxixUcjehB6vmfqbWMmc5ju9
         jg5bjPnQvHop7LyMbtEfOuTnOiwZusrTEfQPmrs56sS0dhzWuq22araaMdEOCmWKm0h5
         Hmdxv+XOV/RjdAZI7KEzrT9hyD14h2kp7zi9VpP2AzhtFOYKOuASeuXrlUImHaOCkcqm
         Z6Qsdi8Q0vGp0YZG2oIOTsgCtk22mtNEU9wrTKGQLiE51Z0puk9Dw9KhoqmmEnam1zxr
         +ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712608733; x=1713213533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66EhmBXE+6opbYU7Qf+U0TLJ3Vt1siSvg3UxG+2mUhg=;
        b=FslhZJunTB8PIP1N9sNksLQHuTUpY/3OJO33IfBlEjwaZHFVGtdc79Iv9gBqSES+3Q
         JqNmvzdNjoiJ3UB+s0LbTQH5uwRwVMpKBJnit0u1GOjwYn7OX7TcLdgGAdcOWzoDPYDN
         VPZQFlQmROSYe+EYuuwfgE72/L/I7015dWFS/NGNgh/Rw5HlPxWjJdb4GvqPZlE63li0
         Y1Jv+jBfOIZTTT5+35OZi6yEu1iH3sPp5ATLgqQ6Y6wXNwkrW6jozQpEuTFQDqKW4mXg
         cKGiyOVnPxuVmssHLWOTp/0BsfgUyuuFjWLbYkum9h58gtJZ52B3I4eksM3XtpdoELum
         +tyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4yOX6gQh2vvs4wlG0EIpEwrOO6pXO5y+wv7rE2/5U6yKM7LihzpB7jnGeL+vV+RAN7veZXeIWRzr78qdqPAhtHedw0HVtgNBNDGFgWw==
X-Gm-Message-State: AOJu0Ywt734BLQRemn6aUKwTfIc71sik/XHOGZFfplrc9f/T6N4AW8TF
	2S6mpdguRvuw/Q1gYAtouMJajJ/l0gZaDO53S5GbQD5hEksWfxgjnDGXmnowSQ==
X-Google-Smtp-Source: AGHT+IE345TzGH9Fq0etBCi6wkGO3vYGKyR4fYGiq6aa+SdZJ1rKU5+HgSIED7L9Bjx9H4TLIj8esA==
X-Received: by 2002:a05:6602:4898:b0:7d5:f78f:ab1c with SMTP id ee24-20020a056602489800b007d5f78fab1cmr3626178iob.2.1712608733081;
        Mon, 08 Apr 2024 13:38:53 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id bv24-20020a056638449800b0047be26df380sm2795121jab.2.2024.04.08.13.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 13:38:52 -0700 (PDT)
Date: Mon, 8 Apr 2024 20:38:49 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] [v2] staging: greybus: change strncpy() to
 strscpy_pad()
Message-ID: <xuqmx35li5pwktklh2rds7zqmsieletfzhkerdvw2agv5zjpnb@2qr5oh7ktdv3>
References: <20240408194821.3183462-1-arnd@kernel.org>
 <20240408194821.3183462-3-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408194821.3183462-3-arnd@kernel.org>

Hi,

On Mon, Apr 08, 2024 at 09:48:11PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-10 warns about a strncpy() that does not enforce zero-termination:
> 
> In file included from include/linux/string.h:369,
>                  from drivers/staging/greybus/fw-management.c:9:
> In function 'strncpy',
>     inlined from 'fw_mgmt_backend_fw_update_operation' at drivers/staging/greybus/fw-management.c:306:2:
> include/linux/fortify-string.h:108:30: error: '__builtin_strncpy' specified bound 10 equals destination size [-Werror=stringop-truncation]
>   108 | #define __underlying_strncpy __builtin_strncpy
>       |                              ^
> include/linux/fortify-string.h:187:9: note: in expansion of macro '__underlying_strncpy'
>   187 |  return __underlying_strncpy(p, q, size);
>       |         ^~~~~~~~~~~~~~~~~~~~
> 
> For some reason, I cannot reproduce this with gcc-9 or gcc-11, and I only
> get a warning for one of the four related strncpy()s, so I'm not
> sure what's going on.
> 
> Change all four to strscpy_pad(), which is the safest replacement here,
> as it avoids ending up with uninitialized stack data in the tag name.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This patch helps out with [1].

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
> v2
>  - use strscpy_pad()
>  - use two-argument form
>  - change all four instances, not just the one that produced the warning
> ---
>  drivers/staging/greybus/fw-management.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 3054f084d777..a47385175582 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -123,8 +123,7 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>  	fw_info->major = le16_to_cpu(response.major);
>  	fw_info->minor = le16_to_cpu(response.minor);
>  
> -	strncpy(fw_info->firmware_tag, response.firmware_tag,
> -		GB_FIRMWARE_TAG_MAX_SIZE);
> +	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error but
> @@ -153,7 +152,7 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
>  	}
>  
>  	request.load_method = load_method;
> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> +	strscpy_pad(request.firmware_tag, tag);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
> @@ -249,8 +248,7 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
>  	struct gb_fw_mgmt_backend_fw_version_response response;
>  	int ret;
>  
> -	strncpy(request.firmware_tag, fw_info->firmware_tag,
> -		GB_FIRMWARE_TAG_MAX_SIZE);
> +	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
> @@ -303,13 +301,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>  	struct gb_fw_mgmt_backend_fw_update_request request;
>  	int ret;
>  
> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> +	ret = strscpy_pad(request.firmware_tag, tag);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
>  	 * fail.
>  	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> +	if (ret == -E2BIG) {
>  		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.39.2
> 
>

Link: https://github.com/KSPP/linux/issues/90 [1]

Thanks
Justin
