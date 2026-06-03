Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB5B3F0A9F
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478779; cv=none; b=MDnKtv5c9S9fHrlmzs180Ebi1s2GKP6/0RPgZYICsmKpkHGsQw96MQaS8q16BhCsQKdcgf/OUl1aDoQLnbCb3Kk3upYJDEuTlwE3gRj6f0BEvifoCSZl0Sa4pTlpDKSUx4PPoG7VGdm0cIjURD7hjbcEE3Gwg/5ZuRkqS27WNaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478779; c=relaxed/simple;
	bh=yvYfUG+tm6Y4ovpoosSHN/jEx5DwmFb3r51sEauelfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuQYUe7PcV2532ITobPEOe72xcbpEuF0D86yz/DPGlb3obCeTmAy+KvCGWMaA1QLgyokIbV/+oTUA6zO1xpCe4Z2ZZ8iUVcoKkF+DO+fMh3UBzcW+YHEJlU1QTjjRdaxsqDeLJT7alEaXZEH/hJSRWfoRtUUXnOXBzTuKAbxpOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bP/oRCnY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bP/oRCnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780478777; x=1812014777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yvYfUG+tm6Y4ovpoosSHN/jEx5DwmFb3r51sEauelfM=;
  b=bP/oRCnYC1hfMPoiNfy463bB1egDygx+wHpDwuoadzQZ0v32ufFapPT3
   nM4s+/qzQy0BHlMRies6/mEn43aqFJandJol0/GWeBAbBZ7XkEtsGIgvx
   cF4sCwYsHJJ/lZKVGLd8LZtAwwr0T3S0fGyMO5/3GmYFMGdcRevLi7O5U
   CGvswiU4qKbHu5AEs2p3aYrCH8LKa5EqqyT76gpVd4Kqi4+s42mjk317r
   D6ACk38QnZmAEMX2w79qlzVp5ALbtm/ggQA6yTj/Py+6fY8L4cZ6XAqV+
   vuCWkP9JYI4wIRHCH7SVWWZ3Qy2Lk+J+Odh1vspa5GTeKSOmFWJs8jJef
   g==;
X-CSE-ConnectionGUID: geDpaHsXQHaAHKxNWhG/sw==
X-CSE-MsgGUID: VQEPHmZdSdyQ9zSlE//SOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81311723"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81311723"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:26:17 -0700
X-CSE-ConnectionGUID: xtuEddK4TKKCl3LQNMtNZQ==
X-CSE-MsgGUID: 8y4rIbe/SSqzZuNIMqVDWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248117969"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:26:14 -0700
Date: Wed, 3 Jun 2026 12:26:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Taha Narimani <tahanarimani3443@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: iio: adc: ad7816: Use
 devm_gpiod_get_optional() for busy GPIO
Message-ID: <ah_zMybQBDHakXpX@ashevche-desk.local>
References: <20260603123333.5608-1-tahanarimani3443@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603123333.5608-1-tahanarimani3443@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 03, 2026 at 12:33:33PM +0000, Taha Narimani wrote:
> The driver currently utilizes devm_gpiod_get() for the 'busy' line,
> which makes the GPIO mandatory. However, the busy pin is hardware-optional
> depending on the specific board configuration.
> 
> Switch to devm_gpiod_get_optional() to allow boards that do not have
> this pin wired up to still probe the driver successfully, and remove
> the redundant conditional chip-ID check since the optional API handles
> missing descriptors gracefully.

...

> -	if (chip->id == ID_AD7817) {
> +	if (chip->busy_pin) {

If we get GPIO optional, this check wouldn't be necessary anymore as the below
should return 0 IIRC in this case.

>  		while (gpiod_get_value(chip->busy_pin))
>  			cpu_relax();
>  	}

> +	chip->busy_pin = devm_gpiod_get_optional(&spi_dev->dev, "busy",
> +						 GPIOD_IN);

Make it a single line. Perhaps with a help of

	struct device *dev = &spi_dev->dev;

added to the top of the function.

> +	if (IS_ERR(chip->busy_pin)) {
> +		ret = PTR_ERR(chip->busy_pin);
> +		dev_err(&spi_dev->dev, "Failed to request busy GPIO: %d\n",
> +			ret);
> +		return ret;

You can't do that, it will spam bootlog very quickly if this GPIO is deferred
and never appears. The proper way is to

		return dev_err_probe(dev, PTR_ERR(chip->busy_pin), "...");

>  	}

-- 
With Best Regards,
Andy Shevchenko


