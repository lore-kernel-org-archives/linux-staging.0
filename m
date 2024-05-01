Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F450248
	for <linux-staging@lists.linux.dev>; Wed,  1 May 2024 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714572393; cv=none; b=AMD6vb3srkZD9GoBTlEYY0rBr8IdL3R5yQm/JuXcd7jpCtT7euaDwPjaZ5v+hepHEdIz+ulxCZz2bMWbB90Ddr+PGD3FjdH/2pWaxw1VaEtAJd9+YSTnUOJGquW/ckmdo+sTw8d1NPF4Aq1v2PvjSG2pd7UdGHe9ldi+UQ1ZiHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714572393; c=relaxed/simple;
	bh=ap95sRSBchjF/M6qtGbRKOjwOWiqypvpzG+i+mqKGuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlTibEB41oE9uSvuHswyffZer7EIEFOox2ztQcVYOnb/MwV86ybk9Pp1OzyJoPN2Y/jyZDEZ1xRIORyo1wtONHmWGUT8aIx+qTxVlIgBJtf1/PcRtJiXh5ntuDn9OAd/pQipytfeGs7fb4M1FuH/f57n1SZF8qx+Z/RLuPUZIbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMyE9qwU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMyE9qwU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b79451153so39169785e9.2
        for <linux-staging@lists.linux.dev>; Wed, 01 May 2024 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714572390; x=1715177190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dZfz70z0T6WsL8T1SfMzUnt6nyE7+lsRqawb7s4pzH4=;
        b=RMyE9qwU40Pg7qaP6NMhqifmITZ+MxBlVhZ8K6GPNH1LNGgM7CkmJz7/bLAIMm/MfX
         30RvTEPQHRxQjBzVA8DPm2YhQLc01uSipKr0JA+VgEw8Koi6/qPbXrlrn94RZdAIr75D
         E8taYxWqPhoFl56/qrUGo4kI2hJgZkdXzyvVRAg7cSw0GMOoxZW9PSnJWoN3LWLK7csJ
         tFGszYW/FoRKKlV/NDow70pgaS7Ee0cL1AGxRF3I4RWXMy/5/Oyt8KeokAsXdNONH4+s
         0mtRursPa7LKWpFY7RTfz3Md2RN8ZLiB7wjcfdm5XbPz1sOdZp7/lsfKtFUCSKS1RIlK
         YtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714572390; x=1715177190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZfz70z0T6WsL8T1SfMzUnt6nyE7+lsRqawb7s4pzH4=;
        b=i4kW+5GOFG5219btaoKz5KU0LPBHbRgNSogUmVp73jaqqPttPa9ZSogyuLE47SLoY4
         ZOEBQpKaE6ROCGyFcJ4szF35oLzWp/4gZ8vSPkROiO6fkuRfWv74H3B6pfVQrsbd/2iK
         KuHrjW54prc6MfR0cVpCOXQFKZyiUrcto0nY1ZXo9tS2njZ/H+cRk9IWMHzUOd4kDH4T
         owKnpvpbWHZ6i1GPmcYzQmD3gASHNmCTH7G3uqT0gkoB0fpeRkjpvu2F7jegKMwrqnyj
         Tc97zfBfG/WV5fpBwDXrf7vr1AA+nl5c3yNzAdT6vRbRXdID/xhQ//1uRsX1wDB2BDZN
         w5kA==
X-Forwarded-Encrypted: i=1; AJvYcCWPmjm55EJPrj3GwB5/5adUvsuSbXdEXGs7benn9OBI/RsI0n7tNm3OA5QHyQcd+mqXzGaVIHStSw9UynR0n7rXljDvg3iVc64N42PKwQ==
X-Gm-Message-State: AOJu0YwXGDI1TnQc4iB3a+R4eSFR5DQliw86IocOlfdSI2bCmAXlApCb
	0kUnrF0yOVM8lp7yiqUDM+W5k30EbJ3TKRcLYFZzItZye6/a2uz41jjr9lPEbbM=
X-Google-Smtp-Source: AGHT+IEiNaR5Cn/+ooprU55AdeahgioYEMn15o+8Mt5SBbXilTTmivQUVQe66a+zwqBUsYT+P6+dsw==
X-Received: by 2002:a05:600c:458d:b0:41a:9a6a:41e1 with SMTP id r13-20020a05600c458d00b0041a9a6a41e1mr1846593wmo.29.1714572389827;
        Wed, 01 May 2024 07:06:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b004169836bf9asm2306123wmq.23.2024.05.01.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:06:29 -0700 (PDT)
Date: Wed, 1 May 2024 17:06:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shahar Avidar <ikobh7@gmail.com>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com, robh@kernel.org,
	felixkimbu1@gmail.com, krzysztof.kozlowski@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: pi433: Rename goto label.
Message-ID: <3005db51-58f7-4247-a37b-02933767f644@moroto.mountain>
References: <20240501055820.603272-1-ikobh7@gmail.com>
 <20240501055820.603272-3-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501055820.603272-3-ikobh7@gmail.com>

On Wed, May 01, 2024 at 08:58:20AM +0300, Shahar Avidar wrote:
> Use destroy_class_and_remove_dbfs instead of unreg_class_and_remove_dbfs.
> 
> Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
> ---
>  drivers/staging/pi433/pi433_if.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
> index c8c1d296184b..4fffd7007040 100644
> --- a/drivers/staging/pi433/pi433_if.c
> +++ b/drivers/staging/pi433/pi433_if.c
> @@ -1409,11 +1409,11 @@ static int __init pi433_init(void)
>  
>  	status = spi_register_driver(&pi433_spi_driver);
>  	if (status < 0)
> -		goto unreg_class_and_remove_dbfs;
> +		goto destroy_class_and_remove_dbfs;
>  
>  	return 0;
>  
> -unreg_class_and_remove_dbfs:
> +destroy_class_and_remove_dbfs:
>  	debugfs_remove(root_dir);
>  	class_destroy(pi433_class);

This is cleaning up something which changed in patch 1 so it should have
been done in patch 1.

regards,
dan carpenter

>  unreg_chrdev:
> -- 
> 2.34.1
