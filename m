Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7E311C04
	for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695271; cv=none; b=paKqgfzE/3nGn3YwROj2HGGYJkeBa+P+76O1a1ZTZ9aLoOlr0rHKfSf1mgq6Ba5M5aAACJpE9dOs/ii1B2OoqASPdDcaNv5Z6C1Aoc/NcZ3qNzf4G/sLKSOR7jInys6ajJYBsTcYBgZb3CJ/FfLHInmCi9dnV6+nc+FRJK2v/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695271; c=relaxed/simple;
	bh=6nKp9OvM0U/PQRaCIknwXCchajckybqXNIeJit8niKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkUa2SCJFDDy0GRbIpf2UIv004/yYw1Z49v41mzcVATOilLFLAUqKwLa5ldUhH2PhS9SeBT37CSKSoKFWGC6pQED7E3wSvwrVllt65WVUD6id6W0ND6mmfwVHzzugVsvD6huAU9C9Tf4EOqPVkPkmmjoZ+5sUFgOHCwEqCwHUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSt9iXkp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSt9iXkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755695269; x=1787231269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6nKp9OvM0U/PQRaCIknwXCchajckybqXNIeJit8niKQ=;
  b=DSt9iXkp7U32n/xIz1ZKveygolEGpSAko+bb80FK3wL9pXFXHs9R9v/X
   s5w+rpDUzqBsvzE0i24iJ0hUX8tfPPg3mnhgASn9urGbk9IZNLMZtAILz
   0kjk3k6ya6X9NABCTwV+rFOIkN0YaRnO5lM835UnvRPEda6MndI6kG3o5
   JvseD7XquwHqbr0CnZ93ljGl5QQIaiXb+igU1c+ANY36FgBQVf6BWyf8Q
   Vm622aCgKTo+KIy0F3oaPUTZx5Eavx+1G6XbP3iIGc7kavGHa6yn8qQN3
   SA2twq+rRkXr/c9v2qTNH2PUpFJpE7isy9rsotSajo/qq6lFG/X3l9Fs+
   w==;
X-CSE-ConnectionGUID: vi+qd7IlR4+eHfnYz6Mveg==
X-CSE-MsgGUID: vb7PBp69T22v4iwPvD8AUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80552355"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="80552355"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:07:49 -0700
X-CSE-ConnectionGUID: DPltBdiPTy620o+AQugqkQ==
X-CSE-MsgGUID: KigNau3YQdii6MUjwXm2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168039808"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:07:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uoiXY-00000006rMw-3Kjk;
	Wed, 20 Aug 2025 16:07:44 +0300
Date: Wed, 20 Aug 2025 16:07:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Whitespaces style cleanup in
 gdc.c
Message-ID: <aKXIoFpHUjSdCbHY@smile.fi.intel.com>
References: <20250820124519.2287171-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820124519.2287171-1-abarnas@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 20, 2025 at 12:45:19PM +0000, Adrian Barnaś wrote:
> NFC: This patch cleans up coding style whitespace issues
> in drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
> 
> Fixes include:
>  - removal of unnecessary line breaks
>  - correcting spacing around operators
>  - correcting spaces between types and names

...

> -static inline void gdc_reg_store(
> -    const gdc_ID_t		ID,
> -    const unsigned int	reg,
> -    const hrt_data		value);
> +static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int reg,
> +				 const hrt_data value);

Can you rather refactor code to get rid of the forward declaration?

...

> +static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int	reg,

This still is wrong, shouldn't be any tabs here.

> +				 const hrt_data value)

-- 
With Best Regards,
Andy Shevchenko


