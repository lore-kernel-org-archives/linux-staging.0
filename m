Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D173EDE7F
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613376; cv=none; b=pGYYs/1VyBJwa4M4le6o1QAsyKB778UrFO9wxRUTheLokFm84o+7aHZR04rYn/IJ9Mw63CnzhYlUaSVHbff+IEG96WkDM5HKUw0X3uGdFlL3umamDqjF8ybOyXvRmrJ2/Tb1w9A0JMbTg+HRo3gyERDJvmq46BSUOhN+VbjmxvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613376; c=relaxed/simple;
	bh=Nlg8Iomep7NHl+3W4p3P3mZPQJUQxuy3EEKfvqNot60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMfOUKtqlKns1sxlXGMKbzYt/v4YfMSVhuz++1a3Pi7DRJyGK5ElrIi1Lp7JaowDyTd4muCED47WqvXkgP4eQsz1okQjW7dhhwHmZO+BDXubAikW5l2cuT1QykbzHEuui0+7GE74Y51mmyP4Kx0j9iXZCJ51kPBcDdGi1OVGQ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQsqGjPf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQsqGjPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778613376; x=1810149376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nlg8Iomep7NHl+3W4p3P3mZPQJUQxuy3EEKfvqNot60=;
  b=KQsqGjPfiXKEK3cTg7sXHfIBQ0HjArZ7TdcCffW3P/rQZqNO9lrgDo8O
   dGlIFMq7nDaPq57gqUvZOrwhFACn06prhQefL9jGJjc6HwBxe5EofGCAE
   qJzKptTpCJRwwy3cwntwDk91P4N1j4/Vo22/Krul0jV1aMppWw+cigtWN
   ONOgaaD0kJq3ZzPOglux5xIDRblwCknDfdOLfrZ9mhzG+FAdXCWCbr46E
   HI6iujYel3l4oJsAvLqs8Wssa4EYz1+3C1Na6gkRw7mbTIwDvLY/Jx+xa
   gXkCHZDTQO2qHbgZdLN0C0doeNZYqIMCotZzVhwBgvyK7cdw5623I4BEw
   A==;
X-CSE-ConnectionGUID: eovR77efTaC4LD6zsWbE9g==
X-CSE-MsgGUID: E9+gXreOSfuK0gqubrqClg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79248290"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79248290"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:16:15 -0700
X-CSE-ConnectionGUID: inW+ZvqEQGqpeizbR++UDw==
X-CSE-MsgGUID: JIWRgqa8Sl2JCSO7WHubBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="261338791"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:16:13 -0700
Date: Tue, 12 May 2026 22:16:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: gregkh@linuxfoundation.org, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: convert sysfs attributes to use
 ATTRIBUTE_GROUPS
Message-ID: <agN8et6OW183t5TH@ashevche-desk.local>
References: <20260512183007.14511-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512183007.14511-1-shawharshit116@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 12, 2026 at 06:30:06PM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() calls with the correct
> ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
> driver structure so the driver core automatically adds and removes
> the sysfs attributes when a device is bound or unbound.

> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---
> v2: - Use DEVICE_ATTR_RW() macro instead of DEVICE_ATTR()
>     - Move DEVICE_ATTR_RW() definitions closer to their callbacks
>     - Remove trailing comma after NULL in attribute array
>     - Remove extern declaration from internal.h, not needed
>     - Use ATTRIBUTE_GROUPS() macro and add dev_groups to driver
>       structure as suggested by Greg KH and Andy Shevchenko
>     - Compile tested with: make M=drivers/staging/fbtft modules

Thanks for the update!

...

> +static struct attribute *fbtft_attrs[] = {
>  

Now it has stray blank line here.

> +	&dev_attr_debug.attr,
> +	&dev_attr_gamma.attr,
> +	NULL
> +};

...

Otherwise LGTM, and if Sashiko and others are happy with it
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


