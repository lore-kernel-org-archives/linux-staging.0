Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34D305E32
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 19:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061407; cv=none; b=jXSJABdjMwmyhGzlnb8qXnm0AbwfHGEMO8vdKTU5zQTXGp3DzjMryo+mi1ivVVFYSZQWCYFquyH3xflZg2VMqtTqPSwhZbtlMHT8kbHQFdWl8+Xg68bKIyZyLpTbTurloj5vB7RK29nI0sofk5nrypqVoMCPnog8f5xykCl5aGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061407; c=relaxed/simple;
	bh=9XJmP5Zv0m0XvpH5yX6YdmF55NDMAU1dVmNSfErk8Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWRY1I/tFlBjzCOc6/Atjr439uRKKIhgbAEOeMqAlxjfxQYCgLXxtwxabWADmYx2u0vL2iOk9Nz0PWlnDwT4iQksO+LomJIra9dlMMoMeyYHf/Wj4dgj7dg6nvWteXHLpuinyaO8mViPJWbYP2gXFh/xrmlOoa0srhmvCRroA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=er+cP7/r; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="er+cP7/r"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-480706554beso52455045e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 11:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770061404; x=1770666204; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIj5bc9c6vnIYo8f60ma9Tq489xKeyteUNnrezyXRkA=;
        b=er+cP7/rGPGZZZLAEzo3/i+G7SMMQHsERnxS/LTAlZ+VdLn0yCcIKRIBcVo3kBibsI
         e1LtwaCAxEayot8EavFYeOBiNoomhBP4YYctvCTqsN+wIC4OZZpbWMyFmBbo9I1wh3rX
         uIsXF87TaW0Kh2TkIOe7DydHWm4wN/cDb8SG+uzNnN5MZY9qwfwfOmcNt1A6zXqg72pT
         qblnEPQ/AO1NXnn5DHe3qRX31z6eROyNk2r4k5C3V7v/O1yJQuzGQG80qp8tSvEJQXJv
         RgOpGjRAtFi3diO2sOzPRvUDBSbZGe/HLCtDoeeuNiziAK8vtFJrvAb01VQ62GfJviEw
         vOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061404; x=1770666204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIj5bc9c6vnIYo8f60ma9Tq489xKeyteUNnrezyXRkA=;
        b=Mz3FKMyunSKqsMn5jFfEg/XCtusZZULCwt2Crr19S+JXuJVjJfZnbQWKeRFOfiQDhN
         sO1NQeJZ20R24Vgg9kjv27Gb+5l+UpbWgp3kPaa5NJtloHsZzrT7D0FrAZJiDo57DkSU
         skbv50wXCq4LiXa0FBsCSthdKXNQ8PuwIkja+4+crnhw4xiWSuAQQGSUqCYLtrbaAEgr
         pm/hX3Ytt+QMvNFBv8dUIQRhJru3y7oISHFvzGrrB3rmdrH71dEj+mSw0CCoaoQ+7QKX
         it7WoGAA6YcXa8a7H834Kps1hCV48AP9IeXq5DJJfZDtD62RF0tcbQgaLWNysD06kTcx
         2HCA==
X-Forwarded-Encrypted: i=1; AJvYcCXQo+eU6qHdJgvdo8pG0pxDRld6AGwsx8ecmgopeS+bSjlgWYnrCs9P2yKPUf388kYUTruiYwV2cIL9g5tI@lists.linux.dev
X-Gm-Message-State: AOJu0YwSiSeYOsudmSTuEWUpQWzo/p7aiCxCH97ezgC5iCzktOueo6dQ
	kAIeh06zLaHouIUvupI7YZpcShKMaECvn4DDW1lhn5zqTxCWNy33ScYrHqx03+s1FRk=
X-Gm-Gg: AZuq6aI06IEqJuEg/YO0AL1EbGPiyK+7Twdunp7qALxxGkWJLh0/LH2gESNGVtSdeWg
	bv3O2jzp4m/pJ76TW7c4t2DgcUBnHIVwMOa4ZHMXM0cWmtWmXiwUJ0cFoELuZTLbqSnbZBk4lK/
	csJlxgHTRX7NZLEaZpCCaWvDxaXDEfqgSeGoipSg6H5ipLBbgFePs1G32FqKEMXv2DDltg/0eXJ
	j6VYLasBxbbz4n3sbYPD3awF0HY0lSXYwfI/tTv1nu9g9BVjagNrcKt2mwlz3wVBUrAsX3iIZzy
	PXR4FHlS3+AaAKoKXx6MFXIVM+lZTGEBk014ZP6sa/nGQeKhPS8++ssCl+n+l6NieB18PschYZw
	HTlDxAV8Awx9ium5VRMki/GQAJmYgD71otOpAn7GuZnsoipXS1sBmZ0acvBptdLOL8SJ9m456OS
	6+z+Oraf4y5SDfSVPk
X-Received: by 2002:a05:600c:354c:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-482db49d193mr164987515e9.26.1770061403703;
        Mon, 02 Feb 2026 11:43:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2e3bf18sm103677055e9.19.2026.02.02.11.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:43:23 -0800 (PST)
Date: Mon, 2 Feb 2026 22:43:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] staging: axis-fifo: refactor device tree parsing
Message-ID: <aYD-WAtKfZrmCuDB@stanley.mountain>
References: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>
 <20260202142047.30704-3-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202142047.30704-3-gustavopiazdasilva2102@gmail.com>

On Mon, Feb 02, 2026 at 11:20:47AM -0300, Gustavo Piaz da Silva wrote:
>  static int axis_fifo_parse_dt(struct axis_fifo *fifo)
>  {
> -	int ret;
> -	unsigned int value;
>  	struct device_node *node = fifo->dt_device->of_node;
> +	int ret;
> +	u32 width;
>  
> -	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
> -				   &value);

In the original commit then there were a bunch of changes and it kind of
was fine to rename "value" to "width" because you were also changing the
commit message and it was nice that the error message matched the code.
But in this patch you're just deleting error messages and changing the
goto end to a direct return.

At that point, I would prefer to see a really minimal diff.  No function
renames.  No changes to the line breaks.

> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
> -		goto end;
> -	} else if (value != 32) {
> -		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
> -		ret = -EIO;
> -		goto end;
> -	}
> +	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width", &width);
>  
> + 	if (ret)

Delete the blank between the function call and the error checking.

[ snip ]

> -	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
> -				   &fifo->rx_fifo_depth);
> +	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth", &fifo->rx_fifo_depth);
> +	if (ret)
> +		return ret;

This is an example of changing the white space.  It's unrelated.
Whey you were changing to use a helper then it was related, but once
we delete the helper it's not.

regards,
dan carpenter

