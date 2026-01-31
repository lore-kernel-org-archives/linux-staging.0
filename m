Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6315F22A817
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769871506; cv=none; b=Xrr8f+uoHFM0Fnjkb1h46XszeR3agzZtvkTXCMZTG5is3HrRFLF8wYCcUegHbHPnNqtHRqo+4QDn2xDsCoV3xMHILh76JZDWA4bXzkejX2LsUXzhKcGAqexIKLXSvdf1Gs72s8KsiAXaX0okKH4+1qJkcBG94fKBFQFO9BVEf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769871506; c=relaxed/simple;
	bh=VRoAWJf2eqyTsm72qlw+J05oM9WAqdPOZdmfJYyGlzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRzOqA14xTuxPL6DcXTo7ck8ShDLQZlvj7NP9/vuQoMFXpDHAO1VBfpHME/Y/ykmbTbpM9cKyrX7OLkiZ+RqUsOJrR8HkbBTPrAyNmIi5fqYZyF9UUJrRLILQnY0+DpZF4slVflLy39eJB1wvtYqdDGqN/74W3DgIKiqtoZiaDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0u9WiIr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0u9WiIr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee0291921so27955385e9.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 06:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769871503; x=1770476303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbmntDA2CNBCUun3JC3lcQU9JD6a7apau1HQQEXFXjw=;
        b=h0u9WiIrGOC1izu0sd35qhRfUi0xWEPuyAeNy4FgvbMuxKJwoAyJ4oZ4Q2wcX7kdxg
         AOE4rHfQXGzH9u7rmjye9DsPl37YG/5n3ETwFvT45TPh7aLJg4s+BhvXiiJ8W/fRi5mh
         t/sqdjKzaHfAyUnhAzy6vsnbAKQ71VsOrU3r9c+MNwYtQ/0xdiIqtyHeTp0oGCj3hFIk
         u+40PGoicqe6K6dWobK7B979+YO5ZGk7nfx76ELUAxnR8Q87BWyXcbDVjXeYU5r7WT47
         AueycLzTKjQIAlMqmvFI+m0j+o8znXBt628A1EKW38f7lnbC5N8MUGDG3xVZ02dDAZdV
         0O+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769871503; x=1770476303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbmntDA2CNBCUun3JC3lcQU9JD6a7apau1HQQEXFXjw=;
        b=hlwE9OPBX+F29Zu6KpZs2//0q17Lrqipsjq6ru+3ajW+OpZyJoVxT/DCV2bTGQAxc+
         +9bY79Xs0mlHQVUrxF52KnoWssLOdG+KPhKy4h85lFTBJo43/ksuVphY4qAQp+tunUBG
         Xz9bzUE+DNueohPdnFLGfRVQyP8z6PjhFgZ8J1z7Ku5Xp+1CSLX1E3DO3oWeQmFBEZru
         3iv7aIIjBrYZRGNhFdkOrlxmdD2GBictMNn8p5gX3M8KzpUoJrhdQBXjTaEUtnh2Ht0+
         wmJodTBcOE9kuQ/rONkvC+1bMOcnJ+yQGS/EjXeJgqH2ww5Kwvvq0SaXLYLcfDhmAncN
         w4tg==
X-Forwarded-Encrypted: i=1; AJvYcCXt+zuRYBP4UERsdvrfdAwVx8n/i8nlijaZZb5MKaBq/IUidWoKswMBPrjIiMA+u5PbIx0NSLhuVTmQi9Z7@lists.linux.dev
X-Gm-Message-State: AOJu0YyG+RmnKWkeDC0erpnzMilS5Vp/zHUm6SvvtVfYPvhEX/wiNN9M
	+9S2pG0xmWDQOXYd/PoiPFWkKwoPty+sV0Sh7ktExUUubhD88toNBxK+ud66ulXUyfs=
X-Gm-Gg: AZuq6aLH/AJbzIGph3yD2e7Et22UD73RHUvtcuq/Or5ZkWUdhk4eXELBLMkBbzxkh7l
	B3upvKlGsxbb01awj0aUIf9rocQW7Yk4MA0YaH9vSVQlGksWXdaRJBRnNAQfx64GUK1mqHKhbLj
	pSOUIBE01Ioxag2d19Ua7DV2VR7+D3yQ3mpK96GIo4yQTQGQ2rFk7wkIkIimAGG9W3RiELz9rhi
	9Sko0Kq6MM0SsblPTMyfxm28epfVPhBYhVs9xmo8e+GkiRHrLsLjB462EsMoGB3qCBQ+FOqnD+e
	7s4mf3l9wvWoXVDVisC+Rb6h4cWIA34TV1L2Q7iR+njBWW1mv+YKyDlrG+sLKUmkbwVDgKrwzBx
	zQedYUO7v2B6aHEB3aepvjWuhhcK4EHg1j1U+hJ44cSiBF0O/jLujTTXOIrwreJtQrwNUU44c29
	H/WK83RzeR+GMDhnpt
X-Received: by 2002:a05:600c:870c:b0:47f:1a8d:4f30 with SMTP id 5b1f17b1804b1-482db4e2501mr72494205e9.26.1769871502705;
        Sat, 31 Jan 2026 06:58:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbc7f580sm58014725e9.2.2026.01.31.06.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 06:58:22 -0800 (PST)
Date: Sat, 31 Jan 2026 17:58:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: refactor device tree parsing
Message-ID: <aX4Yi0gvXeh3dxn8@stanley.mountain>
References: <20260131140517.29771-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131140517.29771-1-gustavopiazdasilva2102@gmail.com>

On Sat, Jan 31, 2026 at 11:05:17AM -0300, Gustavo Piaz da Silva wrote:
> Refactor the device tree parsing logic in axis_fifo_probe() to reduce code duplication and improve readability.
> 
> Create a helper function axis_fifo_get_u32() to handle property reading and error checking, replacing repetitive of_property_read_u32() calls.
> 
> This change reduces the verbosity of the probe function and consolidates error logging for missing properties.
> 

Line wrap the commit message at 72 characters.

> Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 76 +++++++++------------------
>  1 file changed, 24 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 509d620d6ce7..258bb95f03d4 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -482,68 +482,41 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
>  			    &axis_fifo_debugfs_regs_fops);
>  }
>  
> -static int axis_fifo_parse_dt(struct axis_fifo *fifo)
> +static int axis_fifo_get_u32(struct axis_fifo *fifo, const char *prop, u32 *val)
>  {
> -	int ret;
> -	unsigned int value;
> -	struct device_node *node = fifo->dt_device->of_node;
> +	int ret = of_property_read_u32(fifo->dt_device->of_node, prop, val);
>  
> -	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
> -				   &value);
>  	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
> -		goto end;
> -	} else if (value != 32) {
> -		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
> -		ret = -EIO;
> -		goto end;
> +		dev_err(fifo->dt_device, "missing %s property\n", prop);
> +		return ret;
>  	}
> +	return 0;
> +}
>  
> -	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
> -				   &value);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,axi-str-txd-tdata-width property\n");
> -		goto end;
> -	} else if (value != 32) {
> -		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
> -		ret = -EIO;
> -		goto end;
> -	}
> +static int axis_fifo_parse_dt(struct axis_fifo *fifo)
> +{
> +	u32 width;
>  
> -	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
> -				   &fifo->rx_fifo_depth);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
> -		ret = -EIO;
> +	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-rxd-tdata-width", &width) || width != 32)
>  		goto end;
> -	}
> -
> -	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
> -				   &fifo->tx_fifo_depth);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
> -		ret = -EIO;
> +	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-txd-tdata-width", &width) || width != 32)
>  		goto end;

This goto end stuff is weird.  I get why you did it (because the error
message is the same both times).  But it's like I have to think about
why these have a goto and the others are direct returns and I don't like
that.  I think I probably would have just changed the strings to be
slightly different which solves the problem in a different way.

> -	}
>  
> -	ret = of_property_read_u32(node, "xlnx,use-rx-data",
> -				   &fifo->has_rx_fifo);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
> -		ret = -EIO;
> -		goto end;
> -	}
> +	if (axis_fifo_get_u32(fifo, "xlnx,rx-fifo-depth", &fifo->rx_fifo_depth))
> +		return -EIO;
> +	if (axis_fifo_get_u32(fifo, "xlnx,tx-fifo-depth", &fifo->tx_fifo_depth))
> +		return -EIO;
>  
> -	ret = of_property_read_u32(node, "xlnx,use-tx-data",
> -				   &fifo->has_tx_fifo);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
> -		ret = -EIO;
> -		goto end;
> -	}
> +	if (axis_fifo_get_u32(fifo, "xlnx,use-rx-data", (u32 *)&fifo->has_rx_fifo))
> +		return -EIO;
> +	if (axis_fifo_get_u32(fifo, "xlnx,use-tx-data", (u32 *)&fifo->has_tx_fifo))
> +		return -EIO;

These casts weren't there in the original code.  I hate these casts.
We could just change the type from int to u32.  Or we could leave the
casts out like the original code did.

> +
> +	return 0;
>  
>  end:
> -	return ret;
> +	dev_err(fifo->dt_device, "tdata-width only supports 32 bits\n");
> +	return -EIO;
>  }
>  
>  static int axis_fifo_probe(struct platform_device *pdev)
> @@ -646,8 +619,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
>  
>  static void axis_fifo_remove(struct platform_device *pdev)
>  {
> -	struct device *dev = &pdev->dev;
> -	struct axis_fifo *fifo = dev_get_drvdata(dev);
> +	struct axis_fifo *fifo = platform_get_drvdata(pdev);


This is unrelated.

regards,
dan carpenter

>  
>  	debugfs_remove(fifo->debugfs_dir);
>  	misc_deregister(&fifo->miscdev);
> -- 
> 2.52.0
> 
