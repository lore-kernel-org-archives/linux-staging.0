Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0197418BC0E
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708580; cv=none; b=qc34kWr00aY8Z1CXj8Epd310aP1LWUImqpGLjKeMtNpxZbyi9+W17aGvEfZA49WB/R6G6FNQZ37cdnwOgazYv04izZBBL5d+mTYPKNIld3grJ9iBlTZeW07d1kss5XU8IUBvUynJJ77OFlHiPoNnVH4W3f3bTnl7onvxLlrQmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708580; c=relaxed/simple;
	bh=5HaADQkVXbGTf737meYf1U8wE2PbsYxiU69KbYTKBYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvJOobdBdOk8Wxtfcc0TzGUqehuXV2OmMpwqLcdGoCDlNE+iw+C3NIhBOXfGr75SLYC4liCqbjQP4EZZJrJgkWY8j6yzduINmpaapDp4Z8f7SPePhaJfr2KbFiwqa3hcQPOcwMzTo6YoaVNh27fbum1LaUUBpJT6k0toOLV/GOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: eLG90MNdQWi1iZ8krW8jxQ==
X-CSE-MsgGUID: kRy0XFZVRfizoyt0DhqXWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="34182245"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="34182245"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:22:58 -0800
X-CSE-ConnectionGUID: 9FWodsSYQRaV9okRow9tKw==
X-CSE-MsgGUID: 6DtA0+6yRAKWEPHoPGXhKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83108262"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:22:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t7sMP-0000000AyqD-2o4O;
	Mon, 04 Nov 2024 10:22:53 +0200
Date: Mon, 4 Nov 2024 10:22:53 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Li Huafei <lihuafei1@huawei.com>
Cc: mchehab@kernel.org, alan@linux.intel.com, hdegoede@redhat.com,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <ZyiEXYWU1Yt03UNc@smile.fi.intel.com>
References: <20241104145051.3088231-1-lihuafei1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104145051.3088231-1-lihuafei1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 10:50:51PM +0800, Li Huafei wrote:
> In ia_css_3a_statistics_allocate(), there is no check on the allocation
> result of the rgby_data memory. If rgby_data is not successfully
> allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

...

> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -4181,6 +4181,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
>  		goto err;
>  	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
>  	me->rgby_data = kvmalloc(sizeof_hmem(HMEM0_ID), GFP_KERNEL);
> +	if (!me->rgby_data)
> +		goto err;

Which kernel version are you patching?

The problem, you have reported here was fixed ~4.5 years ago.

-- 
With Best Regards,
Andy Shevchenko


