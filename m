Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506624;
	b=1now6Nbs5V3coOHQPbIfjNF40WgeLEd3mqTkVltrpVD3qfTjh2Y0eTKpEi1TCxGqqepg
	 5t8D93PYVjIY4ig5S6QKpge2D48oxii+bWoD8OnGaFEVLoqfoajn7qBLD8Rd5TBr7jXUg
	 upbAnIyG1OBk0G0DZLCUgXLdYfqt5uctYxwHac4mAa+H5RamS7Z7aEzeMlgqlf8+oePzM
	 fDTBKk/u4h+8RzsnWRyjNNOfclgh8TiC+k8nO+G8EEJ9amUmdjmB0Z/1SILa+1DUSAN0r
	 DyjFTBLhbUvwvxFhWsP4HoYGEgfxbH2flPtq0IeMe26qlAvkWHpoRBAwgqGtRMs0Vjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506624;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=BOAhYd+/2KwHojxdDPU49asrApwh5bJzKO1tNywOM7A=;
	b=sgUYuH3ezEgHDEzvzoEevMTSnUfVgMCjWn3lgnOri7KZvHE0J2zBqybHkmqlKn9ZzUs+
	 37UAPMVOUEpbbCrxcC9+EcT4l9CAPLIyoz7PRJml9MiLhrn63upt2wlbpGQqriBDiOS9e
	 QA8bxjX44190Xqmh2/j08zxp+1LkL3O85GM6p6qbVdtpxgyx5CbO466Dvhzlf9DHnClq5
	 HpCgrlwTb4yIUCq3CsR4nlqyoNJcIzn3/hWryKfrIsx0tXMTJt5YHF/zvzdIOcJeVoawq
	 tg5L6VUWQw7F24Eoj3mf0Mw3XJ7FMHlPyS6U7lJMB0PwGorKFUc/ohz3w2hMERMk/7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S4HBRm7x;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41150606A322
	for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 07:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41150606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S4HBRm7x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795506625; x=1827042625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pMnfyxRyMU3BLLeYu4bTbmzgW2ZEDPkWh/JASLDZ0BM=;
  b=S4HBRm7xAFYApwRx2YwkroUqIYFrMIHsfJcgaK9K4bs2IR4Rcg5SZZav
   s2o4JUD1yghxJNRzzxeSz1Qsn+PooVJhdoKMWwMPIIRDFMWv4p2ylJtt8
   8X/9BR9yJbipGJgynNNDvsEo4aW6MFyCuTs0XCRN1q+ZeyCecp6zBIwDI
   P/7RIfWqLv1e7TXQMUo7cc8RkEu9M8LyIePLew48JWKx4FZPWAgixzJ8i
   ftQ4tOq18njRk3x5WeMPp1y+pajnw2l4INfhmEjTdOZtw1Vy5J8mOddrN
   6BOi4iEi0IRUjLoriOP5ERQbFshXNHuRX59D+L1wiUwUVP11RWieUo9B4
   g==;
X-CSE-ConnectionGUID: Z2+W2oDJRx+yY5MJMjlSkw==
X-CSE-MsgGUID: T4Ho1vLjSuOmOKsN9FeSUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4209774"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4209774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:50:24 -0800
X-CSE-ConnectionGUID: r94kpKyCTx2pMWp3SYLtZw==
X-CSE-MsgGUID: uG7iP/aSRCyO7U+MLqC6Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11282309"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:50:20 -0800
Date: Tue, 24 Nov 2026 09:50:18 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: DelaySystem@tubot.lat
Cc: andy@kernel.org, nuno.sa@analog.com, gregkh@linuxfoundation.org,
	dlechner@baylibre.com, jic23@kernel.org,
	Michael.Hennerich@analog.com, linux-staging@lists.linux.dev,
	krzk@kernel.org, crofts@kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux@analog.com
Subject: Re: [PATCH v4] staging: iio: adc: ad7816: use dev_err_probe() for
 GPIO lookups
Message-ID: <awVBui6dpNyD-4ps@ashevche-desk.local>
References: <20261123-batch1-s3-warn-v4-1-47cd8d7d4ce9@tubot.lat>
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
In-Reply-To: <20261123-batch1-s3-warn-v4-1-47cd8d7d4ce9@tubot.lat>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 01:47:16PM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> 
> GPIO lookups can return -EPROBE_DEFER.  Convert the rdwr, convert,
> and busy GPIO lookup failures in ad7816_probe() to dev_err_probe(),
> which suppresses the error message on deferral and records the deferral
> reason.
> 
> No functional change other than defer handling.

...

> static int ad7816_probe(struct spi_device *spi_dev)
>  {
>  	struct ad7816_chip_info *chip;
>  	struct iio_dev *indio_dev;
> +	struct device *dev = &spi_dev->dev;
>  	int i, ret;

Preserve reversed xmas tree order.

...

> -	chip->rdwr_pin = devm_gpiod_get(&spi_dev->dev, "rdwr", GPIOD_OUT_HIGH);
> -	if (IS_ERR(chip->rdwr_pin)) {
> -		ret = PTR_ERR(chip->rdwr_pin);
> -		dev_err(&spi_dev->dev, "Failed to request rdwr GPIO: %d\n",
> -			ret);
> -		return ret;
> -	}
> -	chip->convert_pin = devm_gpiod_get(&spi_dev->dev, "convert",
> +	chip->rdwr_pin = devm_gpiod_get(dev, "rdwr", GPIOD_OUT_HIGH);
> +	if (IS_ERR(chip->rdwr_pin))
> +		return dev_err_probe(dev, PTR_ERR(chip->rdwr_pin),
> +				     "Failed to request rdwr GPIO\n");

> +	chip->convert_pin = devm_gpiod_get(dev, "convert",
>  					   GPIOD_OUT_HIGH);

It's perfectly a single line now. BUT... Do not touch lines that are not
modified after the main subject, id est moving to dev_err_probe().

> -	if (IS_ERR(chip->convert_pin)) {
> -		ret = PTR_ERR(chip->convert_pin);
> -		dev_err(&spi_dev->dev, "Failed to request convert GPIO: %d\n",
> -			ret);
> -		return ret;
> -	}
> +	if (IS_ERR(chip->convert_pin))
> +		return dev_err_probe(dev, PTR_ERR(chip->convert_pin),
> +				     "Failed to request convert GPIO\n");
>  	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
> -		chip->busy_pin = devm_gpiod_get(&spi_dev->dev, "busy",
> +		chip->busy_pin = devm_gpiod_get(dev, "busy",
>  						GPIOD_IN);

Ditto. It's one line now, but it doesn't belong to this patch.

> -		if (IS_ERR(chip->busy_pin)) {
> -			ret = PTR_ERR(chip->busy_pin);
> -			dev_err(&spi_dev->dev, "Failed to request busy GPIO: %d\n",
> -				ret);
> -			return ret;
> -		}
> +		if (IS_ERR(chip->busy_pin))
> +			return dev_err_probe(dev, PTR_ERR(chip->busy_pin),
> +					     "Failed to request busy GPIO\n");
>  	}

-- 
With Best Regards,
Andy Shevchenko


