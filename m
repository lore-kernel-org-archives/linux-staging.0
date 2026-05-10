Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7155633F5B1
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778394187; cv=none; b=Rfak3D/uEAFnySGc0XoaxlFu1BKoJMBuV3yDKbuJuRFoLXj+S+hQBR3gz8BfahurMwU6WvHoVFgB/mJh3s2nqljnC1psHoXyjc1RMaZ0L4XlwHGajVI/rEFHWWchBOWJXYg1Di71uSZP2naos3HDA37IqF/TmmeLAEs65E7+dl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778394187; c=relaxed/simple;
	bh=DemQALTRe1W/SGwESwIR0+U3c8CZVOze6PFTRJJTlxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKjw0QAfqFyPWPWgWcHp3jbkc04ut74mfnJ0qSsf9u6NRgH8oEpIatU+yVUN4OILH/39J70B39fix9DnjJzJ5/OS0c70NbZdROAJjdQ2OAgtrgsGuQuBGdtCTNwtPEjqbNnK7oZ1u8RXQOafD4BDtKSRdpf7l/1GLrWK260VsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVDE5JLU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVDE5JLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778394186; x=1809930186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DemQALTRe1W/SGwESwIR0+U3c8CZVOze6PFTRJJTlxw=;
  b=iVDE5JLU2ho9kgJ8yvmMuWHPG0TINs+VZFpH0Q+PqQVNspp8C6aSfaO/
   mCkeI0S0Pnc9oOS0F9FsVpI3rXcjASd5ULE3gviLMKHeW/RxQSoHnQdN/
   wtSGkqx0U0eMBFMX9tBKa7ndEgzdAmLPlABcsqQkchkxyjM421Bd7qG38
   1SPRx5giH6vjqR0/e7RpW5JHdtuUeQNSv9UBbP6lqbe6qBu0Aab69NK+S
   GqzLcnFFgNS0plHlwlbBByJkDwNi8cbIAuoLWDLJLb49Tl+faF2ktyjdI
   n5KEZfVLNiv3XVdhsSx3cEV4OYma3o77AkLSG+R57e5FtFZLleiAAs6yl
   A==;
X-CSE-ConnectionGUID: hf1M3z6dR5G5sPKwAfRWuA==
X-CSE-MsgGUID: qls/A0a7QuCDMGtHsthBng==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="78452904"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="78452904"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 23:23:05 -0700
X-CSE-ConnectionGUID: IREfSvvhTjaOISPJh3L5xQ==
X-CSE-MsgGUID: xmnjNMkeTninQMw2aLEhYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="275285352"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.171])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 23:23:03 -0700
Date: Sun, 10 May 2026 09:23:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: check SPI write errors
 in probe
Message-ID: <agAkRBbJiTmWxGtS@ashevche-desk.local>
References: <20260509090320.85481-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509090320.85481-1-dennylin0707@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, May 09, 2026 at 09:03:20AM +0000, Hungyu Lin wrote:
> The probe function issues three SPI writes to switch the device
> from the default I2C protocol to SPI protocol, but ignores their
> return values.
> 
> Switch the repeated SPI writes to a loop and return an error
> if any of them fail, as failing to switch the protocol should
> abort the probe.

...

>  	/* switch from default I2C protocol to SPI protocol */
> -	adt7316_spi_write(spi_dev, 0, 0);
> -	adt7316_spi_write(spi_dev, 0, 0);
> -	adt7316_spi_write(spi_dev, 0, 0);
> +	for (i = 0; i < 3; i++) {
> +		ret = adt7316_spi_write(spi_dev, 0, 0);
> +		if (ret)
> +			return ret;
> +	}

There was an attempt in the past to do the same and it was NAKed, so is this now.
NAK.

Instead, add a better comment, if you wish, with the citing from the datasheet
to explain the magic here and why we don't check for the error codes.

-- 
With Best Regards,
Andy Shevchenko


