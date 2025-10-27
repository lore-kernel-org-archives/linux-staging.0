Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E411A0BD6
	for <linux-staging@lists.linux.dev>; Mon, 27 Oct 2025 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761552945; cv=none; b=dUgHzTPlr+joJmY/cjaBi5ZVCRk/olXmCRSBn/N/VoCq0yCdz8K/AEQUcmTaOiN8K1632fTqRl7fkzEn3hGKKFntZnNNRJZd2uRZMqznMiktiorFIK6Nm19fQdfzSNcb8dNifJjTltQJu+OObWQYitymXUDAvsW6h4l3az+GxXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761552945; c=relaxed/simple;
	bh=WwKDAtuQ20D01jVdtRfvMGKLaalNFcjLEA1dkVK4nu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCllkPvNn9VxjCYurr54khYDFnkDdcaX4X04AhL1d42RE8eLFwVnLYeRatuI7A0qORsVMl8Ftp36kMTbWgQjReSFLborCesO+3jz0lOPXihti8B+56wz88ii12NvKT7gsxwOW7hH+J3lGPmpv4XktmnE40xBeKlndrPUESMrYf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L1HJvzZ7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L1HJvzZ7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso12779885e9.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Oct 2025 01:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761552942; x=1762157742; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VCBeTLhApGGiqkKyRfbUgLkYILC1Vq+3fS3KeJIjhg=;
        b=L1HJvzZ7r6Qmy79DvhU3JdVf4qljEe91uwPIATKqP1id1MhetknFOmQnsrBeewiQNt
         4BssXFavWXWHWIMFZvTigVCrk7bAzL1RzninWgPXGmzUg4/h0PxWbghgti9Qif3t2TpO
         NxTxHk3h9MohAU0U/OyxfMgV7xgEJfmrleVUlA/GdkP8eTJLKXL+EG1uKrhCJIbBguVQ
         NV0hLsHL0ywrFWBuHCHsp8b6eynePGa4QNIEEiGO7xKDWeQ8SOYScnva5F75/FEyIRwW
         jhM9+ypLk6vcZB7eFPEK91pIhwll43RDtCgB5Ka6hFid8uivvcwByDDsIDdr30f4vB4m
         B29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761552942; x=1762157742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VCBeTLhApGGiqkKyRfbUgLkYILC1Vq+3fS3KeJIjhg=;
        b=xU88ZZ+oX2wXFXRs+gJryTJae2Wtyi0/5WKPu/lyonrgioJeJsMqh91TfEpWWL3vWq
         g6OlSG1Q88MycidHl904fiH71heEXPNPoQhuq+Pdhl/TwZBdIjTL0TTO5vWZ626JeMNK
         8eXOBIlXJ/YGHmyUzLsxvF0HeY6D/fvXO2OvCXHTSvDIw3k613L/YIhKbupo9/wXHARS
         RWSOm7JIUABZZx4gV/Ap8Y2+bWtm+URdI2GhjCLNZejSScGHfYVf/7GkzB5RvscvhHpp
         1vcGYQDfyDAHY5JlNIliJasVsHWbMzO1ezYy6TL+RI6l61rym5VAyOzyGdDOPC6H2LlS
         JBAg==
X-Forwarded-Encrypted: i=1; AJvYcCVN3rPRtB4AA5AoB+2peMAZa7fY9wRCEmBJ2e52NTLzTJ2+2shmx0Ai0emHx7I1wDicNBJ5hl5OLyimhaYA@lists.linux.dev
X-Gm-Message-State: AOJu0YxyDVWnSXIfnc4ZL26mZpAdkDJ4yBP3mv8tgBuWlNQ0iZUAb6+J
	xhhd1Ex6jorKm1sCMc1gUuVOIIr932ywAz4ZpX8EVQ19RCNQVlVA4P8eO5r2CARykM0=
X-Gm-Gg: ASbGncsSinjJdCbUTeFRpUD4sXUWiD4ZZ6K4pLGp5Xirv8HuAgrCmjP/e9xdh4NZzdO
	m9Bihsdbyoi425nQdOLi4QFO7azyCeHEyeaiRMZcawEGt5Eg705onMZPguiSp304/oBPb5CUDCZ
	q5CX+HgR0Oh6sLr6VgQlYNJeTJqEYNseh88M+/KmCprrYQVK/Zm+fVNpQTo8JArIj9ZZqgXgjAa
	gKu4szLBh6tkVnCF2VfA7TQTxaJXOrU7Sifabo8s1XJkh0nSLT7qpfCMenOXc9D/OmH9PCEgLNz
	sioWG5lJIFw1UxRDC7Dkm5RlRmZGRtlw2Qk5rvzZpi0U2JBTfO9lO2moCPZ/cSPKfX27stMLV47
	0eJWoquSzZxufHOT/haq9ZRp8ddV41k7q3n7GWt7YBE3s1QhbR9BMK+rjhNZEF8bqP0VI1GDv6T
	BnmTurs33IVqOJDWhx
X-Google-Smtp-Source: AGHT+IGIWZ+lmA7GDak4870XTiv3Yj8BU4Bmg1GQHYPOkEGe2jc+lTeJlZIP+IYjxTa6CteNWBl2Dw==
X-Received: by 2002:a05:600c:548a:b0:471:ff3:7514 with SMTP id 5b1f17b1804b1-47117877736mr281675505e9.12.1761552942082;
        Mon, 27 Oct 2025 01:15:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475dd4a36easm122063665e9.10.2025.10.27.01.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 01:15:41 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:15:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
Cc: sudip.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode0 an array of const
 pointers
Message-ID: <aP8qKZkEA0FUkaYC@stanley.mountain>
References: <20251026233432.1707-1-cristiandelgobbo87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026233432.1707-1-cristiandelgobbo87@gmail.com>

On Mon, Oct 27, 2025 at 12:34:32AM +0100, Cristian Del Gobbo wrote:
> Change g_fbmode0 from 'static const char *' to 'static const char * const'
> so that both the array and its elements are const. This addresses a
> checkpatch warning and matches intended usage.
> 
> No functional change intended.
> 
> Signed-off-by: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 3659af7e519d..ceb89ee99ce0 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -33,7 +33,7 @@
>  static int g_hwcursor = 1;
>  static int g_noaccel;
>  static int g_nomtrr;
> -static const char *g_fbmode[] = {NULL, NULL};
> +static const char * const g_fbmode[] = {NULL, NULL};

This breaks the build.  Please, at least try compiling your patches.

regards,
dan carpenter


