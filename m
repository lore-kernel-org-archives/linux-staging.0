Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A931A37AA65
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787208; cv=none; b=dPZBMN9Zzm6SU1ax9abVUV1PBDETEeXkiIkayM0b97Rf2WA24cTQm2AOyXS9lAph6XBCNV7DDvw4mpjeTTjJsDCAzqxsq7fhkDXC14dPEQtEhJXD5GsHv65+R+MZyt23txS4nMnggaMUp9ygMb3diLRcUhrLCf9500Y64xhXV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787208; c=relaxed/simple;
	bh=aypHnN9reC8L8eyUnvgwOvzHn+KPVFzjiikVKD3mP1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6monlvIrKn93aSypklVaGOrIIAv+nIt5hUfl+PVN55CSKNEDFNZDNPaQ0+8o8c6VAGYYSztRhIAJYeBLTiBjcVNui3PcZz10UQz4PLBMnFGt6gW6qJHjRNIVqNmaQRPYg73wWMB8pAO4nLO4NkA6OLPYHrnUleCHYrPwaVxJOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcxh8mg9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcxh8mg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781787207; x=1813323207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aypHnN9reC8L8eyUnvgwOvzHn+KPVFzjiikVKD3mP1E=;
  b=bcxh8mg9h8OsEyCdADWtL5ZubdN70cFE4ulNxGf+x0ZI09dZiKKLrHVv
   JgiCW07v+9qxxHsGT26OjUmeW8OAhEOm4R9t75umBuZNz3LetQXLuVV8c
   pk4dbb8DwMwW/DaY6c2yetCrWQsS/6gElQCZxpZYsH4D9CrB+1zMv5c70
   QeUDrlLTP2T2y+vB+X2MbPi6YHZR0i1Ml+xO8qakehAX6XP8ZsKJ2voEF
   pFMiyi2ds5e5VxV0P0hBWYVAGgNIjlfHknpkJdUvguK/HUrmnpCJMWzGo
   hPAKcrDOkdApW/qXIuPlZoerW4u3S3WOaHxaJTzjrFL+2EKq58tB9pP+K
   w==;
X-CSE-ConnectionGUID: HQGOfErCRaOsUs3lYX2gNA==
X-CSE-MsgGUID: CChPdg7MRU60aegQzmM7BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82387882"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82387882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 05:53:27 -0700
X-CSE-ConnectionGUID: OB+f9B2nTt6093pbAheJ1g==
X-CSE-MsgGUID: XBiHXvFKSLqx/bFtKjORaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="247211081"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 05:53:24 -0700
Date: Thu, 18 Jun 2026 15:53:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: prefer __aligned over
 __attribute__((aligned))
Message-ID: <ajPqQSudT9mS1e53@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618120951.42956-1-igorpetindev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 18, 2026 at 03:09:51PM +0300, Igor Putko wrote:
> Replace the GCC-specific __attribute__((aligned(a))) with the standard
> __aligned(a) macro to match the kernel coding style.
> 
> The checkpatch.pl error about complex macro values is a false positive
> here, as enclosing the macro expansion in parentheses breaks declaration
> syntax.

...

> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h

>  #define UINT32_MAX UINT_MAX
>  #define UCHAR_MAX  (255)
>  
> -#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
> +#define CSS_ALIGN(d, a) d __aligned(a)

Ah, nice finding! But this header should be killed. It means that rather
kill the macro altogether and replace all occurrences with the proper
attribute (see the history of math_support.h as an example).

-- 
With Best Regards,
Andy Shevchenko


