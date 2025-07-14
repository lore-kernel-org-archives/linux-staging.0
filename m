Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A0613D521
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752527380; cv=none; b=XtUmLYyFPzMjobbpHwZqrCkjjoXrqcFz5S56yY35hW3kuxkYS0eGm+LhHlTw85dtmoI6ZTzy0H8EGt4yY32f+LBLJ9bp1qQi/aXFEzeCUPDDEdxqcPl46vVA4eZAkTy9rKqNwM9oUQK488Ox4G/xtwKUgQ6ypRIbo+plKA014i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752527380; c=relaxed/simple;
	bh=Eo0o2hEb39hiPyghzkvSTKfu8tBjairbI2YusZgQgHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN57dY+X0jNx7ws7RZEI1TwEIt4P+6Uc1Bn/g2cZRWqeop8EYE7XPTSOb9EZ0fWO7tUDv0m5psAgEei952uurEpDSqa1phiyxMPw0ol6oYxD3uXrNCAPpJZ2KAO+UN7Ne40TXqBD2XCUIKfa/NjSxdCp1QYjYL1O7mvUbFT/otA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j9jHHPNj; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j9jHHPNj"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-408d14c7e92so3150440b6e.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752527375; x=1753132175; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvTi+cy+QDC0rQAzEsO6ZT46EiAuz4DM9iAPl2nhYbk=;
        b=j9jHHPNj93S7NQalbpgCdNj7Et58woexPJtnK/llU/EhdM1+ylf1crpfvZVVGSQ97a
         bP0sOfEaw4eKuY1XoZ/NUsBo8SeHLB9xvexbzuG9JxRZTNlw7wValo9FQoHjewzw41Ff
         lt8f01bMfJRJnsJv9ZKezjfoWp2WX0TSPdSKMV8ug7dnAJPqLO5UQoXl4lCpWnsszKJP
         jNCJpkv3AYaO/XdD57FwziB23QE36T+0E+YlWHw2HKKNJV71NBSSUIVaJZIcy2Zau/qv
         A6t6WMgDSmoiJJ5JpyWpwxXgX9DDcWwCfM8XXobPO9aJYruAYac9zXjq1FrphGyCD/VE
         AGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752527375; x=1753132175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvTi+cy+QDC0rQAzEsO6ZT46EiAuz4DM9iAPl2nhYbk=;
        b=Y/YtF92REKhUNqxFadEmcDUQUqplanECKLuwSJJg90EdW+EweTsweeO3vriWaa0om+
         kqo6rJCa3ZE57I8/QmkxI6F6llPhv5ArEqw8NcrxUCOd9nu16cmkcSgwX/pw6d432jzR
         72g4XVUMviaRxUVJAtQgdZy+dIExW5BOp61T35BooM6jT6JKSYkbtQk4MWtGVH5d5t7x
         Hohrk9aUNSMLD+EYSFHWiVp2SHNZ4fiei3tkXTMnAS4C2HnWiOx7PnbY+86mJU+6ZOZ3
         hkuqERgCSKW2KJbfASK8iBxT9Eqtx6j7HevjPZcx0uXqL4FE2YY8y8PvLFxXesk09cG7
         WB/g==
X-Forwarded-Encrypted: i=1; AJvYcCVJdizV/evuwa/z5160aNHt24wRaWRzLSO/NtnMEKsowpUZlnZ9EMW+3YU/+brlQHxbEhO9ED2vNm5oyrcj@lists.linux.dev
X-Gm-Message-State: AOJu0YwUrgjUn7iGnQReUfycU5KjhRayIZ7wYLLCmorEYXIfUiXep01P
	f0Y5vw0VzbYg4sgsWbxkQGu6p5uCjcQE52zzkdVazJG1e8pVWwIW0TzCWNPQxzL081Y=
X-Gm-Gg: ASbGncueYHBq3DmjXFn99SVCsGJrOV2XMl200U/l3z4AuNoo/IYs8XStu/CZ2pVoq96
	hR7qH143chxKyM2C+JDEcx0kFxmx4ITK5RtaSg92cf9U3cJNQmRyJHshiv/kthw4FzMrf71ttEk
	SRyXL0sXI6jJs/K9WWnoQxeVpQCPH0ZakgXI0ACqSASB3hN0S+i7X5/a2nRUjA9Qs3eXysZ+zct
	p7XycgFBh4vuQJBisGqG2U9UIAtN8y7WW9wi8hHzwGYy+YkeW8/+5eP/3g6DATsb+Flr0vOv46+
	GUaKmF2ZHy6Mugn/MZbnNTTY+/BP9ibPEuUzwas6UVe0kOXeb7rUpJ3mfDZezBDGWabPCH8zu6J
	ZSKRmN+vMB0mGVDU+CY1p1Bfv48f2cgJ3AuslDm3O
X-Google-Smtp-Source: AGHT+IERTMOpjsDRrZFdMuMNdim8TfF6hlXEjvbR3D4xp58pSuklvW4nDe2xvA8xk6yFe6KPdBlrbw==
X-Received: by 2002:a05:6808:11ca:b0:406:71fd:b610 with SMTP id 5614622812f47-41539d98e0bmr10236884b6e.33.1752527375538;
        Mon, 14 Jul 2025 14:09:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41418c0c259sm1635798b6e.5.2025.07.14.14.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:09:35 -0700 (PDT)
Date: Tue, 15 Jul 2025 00:09:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sina hosseinizad <sina.hz@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: atomisp: stylefix
Message-ID: <6519f649-82bd-4f58-b99a-731fb86aa1a6@suswa.mountain>
References: <20250714142645.88038-1-sina.hz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714142645.88038-1-sina.hz@gmail.com>

On Mon, Jul 14, 2025 at 04:26:45PM +0200, sina hosseinizad wrote:
> change the spaces at the beginning of the line to tabs
> 
> Signed-off-by: sina hosseinizad <sina.hz@gmail.com>

You probably want to capitalize your name.  It's supposed to be written
like you would write it on a legal document.  (These Signed off by lines
are supposed to be like a legal thing which says that you haven't stolen
any code or violated any copy rights in this patch).

> ---
> My first contribution to the linux kernel, so starting out with a stylefix
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index bc97fa2c374c..bd3a017490ef 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -2347,7 +2347,7 @@ int atomisp_css_video_configure_output(struct atomisp_sub_device *asd,
>  }
>  
>  int atomisp_css_video_configure_viewfinder(
> -    struct atomisp_sub_device *asd,
> +	struct atomisp_sub_device *asd,
>      unsigned int width, unsigned int height,

The other lines don't match now.

regards,
dan carpenter

>      unsigned int min_width,
>      enum ia_css_frame_format format)
> -- 
> 2.39.5
> 
