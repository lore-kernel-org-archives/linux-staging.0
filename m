Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F6533A70E
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808842; cv=none; b=Zqsh8PAKegzE0UgZYeyothlDIuYor9N43mbvyLxQMukmtRXduEGugXVElpKXFSpaG/uOUr8CVd/GuY0tFfAl6C7hP+IZSHQPu6kEnNoXGAYNfqCwd9yDTJhLRUkhQGo1297bR3qB2/Jr3+CaikJzdN/9mbbcnzyBg4FSqJGGvbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808842; c=relaxed/simple;
	bh=UCrTSNwjQsS5GkBHqGVBy/OXjFKvnuBgLBSgAWMk2rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poQA40QAXW+mEHmeKxx/1fzd1hU4/HBjbJcBT+uE8Sn04MoL4Sk/DkOT5PvzDcNR1C1DxMZkZjKWJuGVYt7VAwFUSm2r+SYk9zKPevIvIQHLCWStexpKHhbI8uUi7dCs4H3fVjpC6EzDOBTY9wHIjDkEqL/w9sAYRD8XGz3O1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8lxzXoI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8lxzXoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772808842; x=1804344842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UCrTSNwjQsS5GkBHqGVBy/OXjFKvnuBgLBSgAWMk2rI=;
  b=L8lxzXoI1vB8IhTFnnX3Eu6Rnq/7EfDpRvtAiJxk5jQ+oiGMhktxGdMX
   fyWcz3STY3KnXMT0sUTfeCJbDljQxgPETfa63Fk20c/alDcspNFHjq7/s
   HfTPAPj14zoO3gvbiycYUUK6v15s4wisfwpartFbCd0LU0M0Psk20ou+N
   /hunqTitNEWHvAXMYxIPCAR+pxsMrhuII+W+nK2uqNqXb7PJ1JzgbqK0q
   7uPxFZrtqPgrG0FN2y/G2rSogF4yKNbiE2qO/Rww6y1deFyWqif5x+D3r
   T50CrBQCW37V/U+3lnadOMxDAv+leUa8k6ji7LlURVkYuwAKNnyf2Hkrz
   g==;
X-CSE-ConnectionGUID: /ht6G0eGSEaJwVtHl7VSdw==
X-CSE-MsgGUID: r88gRGr9SwusRpPZyodPCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73790722"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73790722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:54:01 -0800
X-CSE-ConnectionGUID: gu1gvYqbTTWKIPZ2C2kkog==
X-CSE-MsgGUID: EACPI++4S/unSyyJd1w1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223512783"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 06:53:58 -0800
Date: Fri, 6 Mar 2026 16:53:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michael Harris <michaelharriscode@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] staging: iio: adt7316: remove shift/offset macros
Message-ID: <aarqg9NBUYpkFKDW@ashevche-desk.local>
References: <20260305-adt7316-correct-macros-v2-0-3702e3841c42@gmail.com>
 <20260305-adt7316-correct-macros-v2-2-3702e3841c42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-adt7316-correct-macros-v2-2-3702e3841c42@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Mar 05, 2026 at 11:16:59PM -0800, Michael Harris wrote:
> Remove shift/offset macros and instead use the corresponding mask with
> FIELD_GET(), FIELD_PREP(), or FIELD_FIT().
> 
> In cases where an appropriate mask didn't exist, it was created.
> 
> One of the shift/offset macros was used for a convoluted dynamic
> bitfield extraction. In its place, a helper function,
> adt7316_extract_ad_lsb(), was created so the shift/offset could be
> removed.

...

>  #include <linux/i2c.h>
>  #include <linux/rtc.h>
>  #include <linux/module.h>
> +#include <linux/bitfield.h>

Try to squeeze it to make a longest (but sparse AFAICS) ordered list of
inclusions. With given context

  #include <linux/bitfield.h>
  #include <linux/i2c.h>
  #include <linux/rtc.h>
  #include <linux/module.h>

gives 3 out of 4 in order.

...

>  	dac_config = chip->dac_config & (~ADT7316_DA_EN_MODE_MASK);
> -	dac_config |= data << ADT7316_DA_EN_MODE_SHIFT;
> +	dac_config |= FIELD_PREP(ADT7316_DA_EN_MODE_MASK, data);

FIELD_MODIFY() ?

...

> -		data = msb << ADT7316_T_VALUE_FLOAT_OFFSET;
> +		data = FIELD_PREP(ADT7316_AD_MSB_MASK, msb);
>  		data |= lsb & ADT7316_LSB_IN_TEMP_MASK;

Ditto and so on...

-- 
With Best Regards,
Andy Shevchenko


