Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080158;
	b=I0DboGv1tOymR1F4hAmjCvk5gG10lmUZoMXTlJsONs4AHEMb/ZR3rxET+k8oKBJF9+CE
	 u+sSI/qHOttBh0PaVYI8M6LOm3298LKV3jnvHP+J6Xtu58ofxbcQrOZIO3uLgOOgoIXx6
	 xopUepAl2UlCHdm79HeftPFD4nHy6XymxZ4hl2xhgQqJxiWLLn4IZreaALjC3GmmrLWHW
	 dN4CIZ3HvmSCe8IitMYzrmSEnnUhHZfot7Lkuzt1fo2kmBRS5oDpepF4m9tqXolvp8s0y
	 GuaSx/glxGutajcI562ybMRzKAN8Ux0alqG4qhD3Q2mjfrzUJHart0FvK4khIMv/FDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080158;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=PIbc9nua4UQ3nCZc5X1MLVQJdNQY3d2tUCjTbTWr54I=;
	b=QHTLcPJ1+rAuBzOQoSgHNkUS/tUmaUAqeqwa3jm0n1dkxf5Nudie8UXP+NBgnh3Oq6Jt
	 Og9nSv/eFYw8Z5qVE6B4nzR7VDw+8l0YHyGRjJTQdU2OyEbe6i5RKAbCg6Y4QvskcJsxC
	 2NrYltnIUy7F001BDOdt0d3EaDlEBNGLVPMcjLvtMH/2n2JNBdUvtdUOQIn6p9ZvnfJl2
	 sldJ8d+Zi5iiOHxh+5//MlEGYbqy+fw+007aaGNLv9/TEC4fsBCBGBw2uEkfKt80kmEed
	 0rv8+WHTgXob4ecvffUaSoPqng+2yXdV/G2jQtYLXeagXKUtqN6EsFADtVMusKz5PQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ui3sw50S;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BFE606A331
	for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 09:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BFE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ui3sw50S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795080158; x=1826616158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yRKTK5+jsUXRx/48CtGdISI2pY2UyjV5mlrYW4kkyuA=;
  b=Ui3sw50SWxF28KfNVIjcNuJwsTQk7yUOb4gR0n8joEJ76je43xDjYR6I
   rFrtSRvA8k/ZzQJjFYT/yZF9mFU5QFsfLOGST1Pe5loFJgUve0iedFI1L
   k5dOuKwvmyUZFWTUSY7K8ODNRJLeRrQBa++eX2XQrsosT3A2w3aL9nfZd
   TyTp9kjfQ9ueEbYKJmif+VW2PxOzHw+2UqU5yiXMNmf/hSgfQAjMeRJR5
   oCz7mybG08SX7zWv1uOiJj+xAMFE5U0KJQjuiaJakje3Xx7x7Mq8MA0KA
   zL7Ew3aYmDWCSUg4ehfb1fUnPQFBlkXK4dKKMhTYA/ue7KoQXe6PwE2dx
   Q==;
X-CSE-ConnectionGUID: V8sfCez8RI+8fESk1mnfhA==
X-CSE-MsgGUID: y4Qa45z3Rv6b9kI981uH5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3951869"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3951869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:22:37 -0800
X-CSE-ConnectionGUID: 9RuU3NfxTWqF3oUiIhRu5A==
X-CSE-MsgGUID: KjJsZKtwTHm6PnyX5uUnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10611252"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:22:34 -0800
Date: Thu, 19 Nov 2026 11:22:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: DelaySystem@tubot.lat
Cc: nuno.sa@analog.com, andy@kernel.org, gregkh@linuxfoundation.org,
	jic23@kernel.org, dlechner@baylibre.com,
	Michael.Hennerich@analog.com, linux-staging@lists.linux.dev,
	linux-iio@vger.kernel.org, linux@analog.com, krzk@kernel.org,
	linux-kernel@vger.kernel.org, crofts@kernel.org
Subject: Re: [PATCH v3] staging: iio: adc: ad7816: use dev_err_probe() for
 GPIO lookups
Message-ID: <av6_10q49dJE_s9i@ashevche-desk.local>
References: <20261118-batch1-s3-warn-v3-1-f622d212deeb@tubot.lat>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-batch1-s3-warn-v3-1-f622d212deeb@tubot.lat>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 18, 2026 at 10:22:17AM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> 
> GPIO lookups can return -EPROBE_DEFER.  Convert the rdwr, convert,
> and busy GPIO lookup failures in ad7816_probe() to dev_err_probe(),
> which suppresses the error message on deferral and records the deferral
> reason.
> 
> No functional change other than defer handling.

...

> static int ad7816_probe(struct spi_device *spi_dev)

While at it, add

	struct device *dev = &spi_dev->dev;

at the top of the function and use in the code you have touched.

>  	chip->id = spi_get_device_id(spi_dev)->driver_data;
>  	chip->rdwr_pin = devm_gpiod_get(&spi_dev->dev, "rdwr", GPIOD_OUT_HIGH);
> -	if (IS_ERR(chip->rdwr_pin)) {
> -		ret = PTR_ERR(chip->rdwr_pin);
> -		dev_err(&spi_dev->dev, "Failed to request rdwr GPIO: %d\n",
> -			ret);
> -		return ret;
> -	}
> +	if (IS_ERR(chip->rdwr_pin))
> +		return dev_err_probe(&spi_dev->dev, PTR_ERR(chip->rdwr_pin),
> +				     "Failed to request rdwr GPIO\n");
>  	chip->convert_pin = devm_gpiod_get(&spi_dev->dev, "convert",
>  					   GPIOD_OUT_HIGH);
> -	if (IS_ERR(chip->convert_pin)) {
> -		ret = PTR_ERR(chip->convert_pin);
> -		dev_err(&spi_dev->dev, "Failed to request convert GPIO: %d\n",
> -			ret);
> -		return ret;
> -	}
> +	if (IS_ERR(chip->convert_pin))
> +		return dev_err_probe(&spi_dev->dev, PTR_ERR(chip->convert_pin),
> +				     "Failed to request convert GPIO\n");
>  	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
>  		chip->busy_pin = devm_gpiod_get(&spi_dev->dev, "busy",
>  						GPIOD_IN);
> -		if (IS_ERR(chip->busy_pin)) {
> -			ret = PTR_ERR(chip->busy_pin);
> -			dev_err(&spi_dev->dev, "Failed to request busy GPIO: %d\n",
> -				ret);
> -			return ret;
> -		}
> +		if (IS_ERR(chip->busy_pin))
> +			return dev_err_probe(&spi_dev->dev, PTR_ERR(chip->busy_pin),
> +					     "Failed to request busy GPIO\n");
>  	}

-- 
With Best Regards,
Andy Shevchenko


