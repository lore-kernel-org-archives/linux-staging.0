Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625A6390C94
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327265; cv=none; b=SDpoITW/rLaViGi5oEyRk7Me7cI/8VWdoNBmlBxCAEuweOfHPTrs1qK04wdbuD5+3SyKmN5I/ikK/WbB3goAicsTLfWnXVSfr2kPKO6wQAv9Cca6kQnTtg5AlOrLjGx19wLWaAW4lqHkuRlfHYwNpPlgomFxnqLY/RPBGzsIc1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327265; c=relaxed/simple;
	bh=wLIuRyAZ4vtqzULIBF2ElNwy45IZYeuidhdHbrz9OpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEMNR42339aeHzRSlnTafXwpmuj10CR9Lko5dIx5uDW4IvFUpUdAWz2R+Kpy9wp9+yjfLYD/AXxpyWpDLSNqBDNFnqB0OZeo7+pR41UvqJ2cuG8HGlMLzjmkAuXOl7zNLK1mYYHSeMfq0NrmSnDyeB3VUOa2Hg8EVFQmqbHcgV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5ljAEbI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5ljAEbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776327264; x=1807863264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wLIuRyAZ4vtqzULIBF2ElNwy45IZYeuidhdHbrz9OpY=;
  b=c5ljAEbISaEeosRPZhxfHCsU85a1qiSVHFmK9/hMMWJjs/Z/UUBng9TS
   ILvR1q1qtJj7BxGPa100vdz9i0eteaIihB71GgN6QanOmBnNMLpWLRgmE
   Nem1qWeEG//PrqzURVEiw5HxAtkleZXSdfwPtNjY5DsByxkJZ1VXN3LPb
   tUdk/BqThJOwHiW7yLMHN2XSYAUJLzwyJqPMxPW/KLFKKgFEw0eAaMfF4
   tP6V0o708Ex1aZ99fZpizA9xZW4p4s3SBT1ZK0697mFKt4d2936uLMWAZ
   zl7M31jylRD3EbfLC5xT+/7K8YrQLmb62GDSttqHEDSJAafzfpjI8Onx2
   w==;
X-CSE-ConnectionGUID: Sge2brpTQzemn7U9U+DeVg==
X-CSE-MsgGUID: 0HBELXXPRUGr8fCjanLO0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76486560"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="76486560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:14:23 -0700
X-CSE-ConnectionGUID: 5uv2gY2tR9CzsxGIG9aB7Q==
X-CSE-MsgGUID: +5jPgjSERieSLXx+aSjJ7Q==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.173])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:14:20 -0700
Date: Thu, 16 Apr 2026 11:14:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix map and vmap leaks in stat
 buffer allocation
Message-ID: <aeCaWgzGY5Z3PJay@ashevche-desk.local>
References: <20260416072731.2489513-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416072731.2489513-1-hhhuang@smu.edu.sg>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 16, 2026 at 03:27:31PM +0800, Huihui Huang wrote:
> Our code analyzer reported memory leaks in
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.
> 
> In atomisp_css_allocate_stat_buffers(), s3a_map is allocated by
> ia_css_isp_3a_statistics_map_allocate() and its backing memory is
> mapped via hmm_vmap(). When dis_buf allocation fails, the error path
> frees s3a_data but does not unmap or free s3a_map. Similarly, when
> md_buf allocation fails, neither s3a_map nor dvs_map (and their hmm
> vmaps) are freed.

> My patch adds the missing hmm_vunmap() and map free calls on both
> error paths, matching the cleanup order used in
> atomisp_css_free_3a_buffer() and atomisp_css_free_dis_buffer().

Imperative mood.

...

>  			dev_err(isp->dev, "dvs buf allocation failed.\n");
> -			if (s3a_buf)
> +			if (s3a_buf) {
> +				hmm_vunmap(s3a_buf->s3a_data->data_ptr);
> +				ia_css_isp_3a_statistics_map_free(s3a_buf->s3a_map);
> +				s3a_buf->s3a_map = NULL;

Are these NULLifications needed? It sounds like it tries to paper over some
potential UAF cases. Is there any possibility to access s3a_map at this point?

>  				ia_css_isp_3a_statistics_free(s3a_buf->s3a_data);
> +			}

-- 
With Best Regards,
Andy Shevchenko


