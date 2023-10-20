Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8454D2EF
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ij4nmhb6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso3939945e9.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 00:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697787507; x=1698392307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/KThKo4jmYx+C7nHHaCwoPbIW3yJzTHN31FdSecDUqs=;
        b=ij4nmhb63A7KkfBY5CoXlnuP5g7MdjaXE/BOldFep7IeHINGp2U/QgQN7dakE7Irqw
         2AeObxemQg132iDN4YG/Ny0Wu4d11T7dr1WVo+0xLuI5oVNaHPGax+Gw8yS3JKQqQ3LL
         Y4o5Xag17rLIJo5/3dyabsZPhx+QZHlc/vxXUYI0wDxEbLaUFOgbsuXT/3eWP3PhiSM9
         Y36DJMBbosmxQMKyNwNX3CMmVV69VhGKlD9uCRobBDef4W6ZrgC3mSAv0LGVipup+n+j
         Yz6qyn385mlRkgGSe5VoJDi4eBPjUpdLuN/eCvdH+IV9eXugBoU/VDKuvgajEPpC/W4H
         mcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697787507; x=1698392307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KThKo4jmYx+C7nHHaCwoPbIW3yJzTHN31FdSecDUqs=;
        b=m5KG7y/ViFr+M1UKl4ZFcg7g0kJskvwd81RdxnSo2juDfL3rkOXgdHHP7KdwqrJ3yr
         RsbaHd7KuPJQqFVPYR8oOHBwCg8HfmbL9IpA+1GwKPCjD8e46744r1IYdBaqn6HGLRqv
         2H+EQlRFy+iExQ9iUpvEy70h+KrAkNttlNn5QaGWadPcyYJ+qZ1TU9XExzV8EeZFDZ5f
         qUARU2mmIGIQTCrT9jGBwhZTiMXn82/IXQ7HsEVzXSdHbgKP9SVkiTg7NVGFicpJPztk
         vLnHBn7SC3cUDBnyysUhUkAZSCPNLaxHUPpkr3qJGsJByPF4xIy6/4ViQ9FzA02ntZoe
         nuWw==
X-Gm-Message-State: AOJu0Yzgjz9m2MquRNv226T8c4xFVZx/T1PnRUoSneTWXHhb8iX7c+pB
	0exQ/FTTxgRUNlcb4gKxyx7SNg==
X-Google-Smtp-Source: AGHT+IGYvrLjEn/0tZV4BoVeorM/lJEq8yk5rw3LmUxqDDNSi0iUcz3I5+xYYfWFtT8WkV4Z9Yac0g==
X-Received: by 2002:a05:600c:3b84:b0:3f6:9634:c8d6 with SMTP id n4-20020a05600c3b8400b003f69634c8d6mr874813wms.18.1697787507093;
        Fri, 20 Oct 2023 00:38:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x10-20020a05600c21ca00b003feea62440bsm1451580wmj.43.2023.10.20.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:38:26 -0700 (PDT)
Date: Fri, 20 Oct 2023 10:38:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kenechukwu maduechesi <maduechesik@gmail.com>
Cc: shreeya.patel23498@gmail.com, outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Add parenthesis to macro arguments
Message-ID: <3371515f-aaac-4449-83af-e7f10d60eae3@kadam.mountain>
References: <20231020065439.GA3579@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020065439.GA3579@ubuntu>

On Thu, Oct 19, 2023 at 11:54:39PM -0700, kenechukwu maduechesi wrote:
> Checkpatch suggests using (reg) and (host) instead of reg and host
> 
> The use of parenthesis in the macro argument '(reg)' ensures proper
> precedence and resolves potential issues that may arise due to the
> surrounding code context. This modification adheres to the recommended
> coding style and improves the readability or maintainability of the
> code.
> 
> Signed-off-by: kenechukwu maduechesi <maduechesik@gmail.com>
> ---
>  drivers/staging/rts5208/rtsx.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx.h b/drivers/staging/rts5208/rtsx.h
> index 2e101da83220..7d3373797eb4 100644
> --- a/drivers/staging/rts5208/rtsx.h
> +++ b/drivers/staging/rts5208/rtsx.h
> @@ -39,17 +39,17 @@
>  /*
>   * macros for easy use
>   */
> -#define rtsx_writel(chip, reg, value) \
> +#define rtsx_writel(chip, (reg), value) \

This will break the build.  But also someone already fixed this in
linux-next.

>  	iowrite32(value, (chip)->rtsx->remap_addr + reg)

regards,
dan carpenter

