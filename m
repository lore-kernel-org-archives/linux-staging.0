Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAFC4F200
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711668529; cv=none; b=Pp8F4jgDXtpfSTdDpstWPZACiC8TYc7Xai/E5y5+55ekZKEj3UmMMJYwzBMMeHbP/Rb3mxV0biZ+OtZYCsla89PhcV2081+aWGoYbIj8MkaXBXWiyHCwBIqGc9ZE2XHZKLaL4Q1qJ/XepY5qDXB48qlD94oZCTSzl/LYrofGQ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711668529; c=relaxed/simple;
	bh=af2lsfoXHDLd/352y7E2LEui2nimY5r7GEl4JA0YSJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfH7mRid7g3l50sHoz0eO1m2ItjGlF4n9pDhozcVlDGimSu8Qe928BAy/Rscv2tfq+CLb8QuJOrjG1aam+wM/r9uOd8geXqjhOz/oiXr180uWayt9lKC1uAxGGHbEOY+l3erSOWGJF27i1GXQHPvjx0jZG5/ZD+dEUgwIidT3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rQsMDs4E; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rQsMDs4E"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7d0262036afso70598939f.3
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711668527; x=1712273327; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rgK/m0H462r5jl378Ykwjg1mm44w08HwGWoGWcoQbgE=;
        b=rQsMDs4ERb/OmvJUZLU95ZsOo8scY5ZA/EBO0C7+3dYmrYym3Yugp2Vh0EOInc2iSg
         tZGRB6s1M/iBoDexhhH+rYLMAlzpi4mKfMMfAvPFgHTlVZ2I1hDHLYBw71ETVByIm5LC
         bUzUz6GEd04fpY+6+rCMZrL6QcA9bG2EpBBT1KnBIrrZxYrFU69WoCLti/3PRAk7yaJx
         9nsjC/LyBg+rA0kIfNswYYUqP8uXCjypSKN0pES/lTCVhnBTclCIq00i+qdHVwWSEOzE
         Ns1C8O++STM9e+qwj8feQaG5QCOs2YO7TtvZG7OPTCjnI4WhNTcx3bOpvSud4ystYdvz
         iKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711668527; x=1712273327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgK/m0H462r5jl378Ykwjg1mm44w08HwGWoGWcoQbgE=;
        b=dNgWsccKlyAZUA8mHr8gTf0vBTclhdmGrNJ000wl4QwuNiLCNbSLaelaMUi1yhVw37
         A3zoiGCYqm4Z2LpTnbyDIXAu3f9QJ2QF/jQombDEzMI2euzTpIw/jTxCNFbBD9hLaN21
         SbBvzG8Vmid3NSKqEt/wN1hYw5rWSWNYg3FI3fkfXNKihQ3epvxtqvqnMzO/bcUwhYlp
         Vi0NEmFxQOopE7GW9grynhzfhyd0JD4kXpFDs6GVWsv+ZpqxRlfpbjPhFOPrBJEioIHG
         Eb60eRrRBXLfgul8jD9HjJ1vOAeTM5glNYQOmyMm8denubxZztim8So/1w4E4dy9gfL6
         voPw==
X-Forwarded-Encrypted: i=1; AJvYcCX8DBPQcC0FTf2ZgHtiiq5TdJJFQcRb6jHSy6bxZ2jrhTmw9y5yiGGdtirFolRb9OWgZ4nHtILcMEDgceoZXHluVhaYWzX4P3f4/eoOGg==
X-Gm-Message-State: AOJu0YxhSJnJnrb2t3LmF9CqSYlP1DZbv/YEKfnys7RYiyD8lWSAeWwD
	6hza9efajiQb5FpMCqfy1r7VCRCi9eYFwaQTTfKy7agiWr6Akgdh772899pBbA==
X-Google-Smtp-Source: AGHT+IGs2igEEehahi3XCvRqfhCt+CMMDEaFPcvv5gQgFXaivHDXEVbAns5XERYqvjB1h1K1XUCPqg==
X-Received: by 2002:a5e:920a:0:b0:7d0:8536:42f9 with SMTP id y10-20020a5e920a000000b007d0853642f9mr727107iop.6.1711668526876;
        Thu, 28 Mar 2024 16:28:46 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id y24-20020a6be518000000b007d08e86d43esm608938ioc.0.2024.03.28.16.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 16:28:46 -0700 (PDT)
Date: Thu, 28 Mar 2024 23:28:43 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 10/11] staging: greybus: change strncpy() to strscpy()
Message-ID: <uejqjxh3ntjdyziy3avisav7ghhb3s66iccfwchjkm534zy3ja@3kxet4bu2ck3>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-11-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328140512.4148825-11-arnd@kernel.org>

Hi,

On Thu, Mar 28, 2024 at 03:04:54PM +0100, Arnd Bergmann wrote:
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
> For some reason, I cannot reproduce this with gcc-9 or gcc-11, so I'm not
> sure what's going on. Changing it to strspy() avoids the warning. In this
> case the existing check for zero-termination would fail but can be replaced
> with an error check.
>
>
Arnd, I see 4 instances of strncpy() in this file. Could you clean them
all up at once which would help GREATLY towards:
https://github.com/KSPP/linux/issues/90

strncpy() is an often misued and misunderstood (and deprecated [1])
string API, let's get rid of that thing all together!

[1]: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is from randconfig testing with random gcc versions, a .config to
> reproduce is at https://pastebin.com/r13yezkU
> ---
>  drivers/staging/greybus/fw-management.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 3054f084d777..35bfdd5f32d2 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -303,13 +303,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>  	struct gb_fw_mgmt_backend_fw_update_request request;
>  	int ret;
>  
> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> +	ret = strscpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
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
Thanks
Justin
