Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013081AA7A5
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708767; cv=none; b=L0mLJIx/8VqVA1BYAstPh/evx/Dekm9rv9e6oa4TcXrIW6JRPypq/CPjcgPRrrI4MNDrGsrzUFiZ3hGPU6v379GN9jLaQI+yRTE6eliDnqmXEolFPQmIFDBPHr9tj2MPZaqQjty0mANTVh+mdynrWoaP5HfZQydS/UuGCiXkjF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708767; c=relaxed/simple;
	bh=5n26+7Eb9Ctuhh6z7GrE22CUnNft0rCMOTsCtn4nm8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4tDAW7gE2HsauGB34Qk1cNZy7dai8rgaOwT9Ih4vWzOQn9H1SWU2SPc73kEkbB+liBmBp9UPoAGpxQxGxzCYf2yvaHAuGViM/1ejj1cweGDFDXgWbzmeSYkdnbo1pQQSpTIo2VnItkrZaKdWBK3GjaRnhtojiRdBnG6bW/u6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WW1UfQ3e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WW1UfQ3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730708765; x=1762244765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5n26+7Eb9Ctuhh6z7GrE22CUnNft0rCMOTsCtn4nm8Q=;
  b=WW1UfQ3eBt2oAj2vu78Vib2ux7FlLsVWDtaytoz4/3e1h3s6MNp4fhON
   Hal0aPBOLPxve0coanIh0csRqVoxPJOvmTPJUO59S6Bex5JMHqTeBaPId
   2ZS75Y2WrwxF436qiELsOgWVluljSDKZOYlOAXZrbUyjgST/zVDsc/ypy
   RBG8PGt3WbZdiwi4lhECmS+PUT8Eass8sXF+jwW33S2A+KljKeyxn5ss+
   9+mO5nhqdRNG+dGQQXfp1CW9O8bwOCvA3mthQB5FBmxR604U7svNc1BVT
   fXEe1lmMrGVvZu/F0vFIw/HHvbifHfNLzKURQSV35Ymv/dnjzFdEAxhFY
   Q==;
X-CSE-ConnectionGUID: TxThpihRQ/CNlgm038qilg==
X-CSE-MsgGUID: JKKOOmMDRXuDk3Br6JSAnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52954096"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52954096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:26:03 -0800
X-CSE-ConnectionGUID: Rn0qklN4SCCXK8pukA8nmw==
X-CSE-MsgGUID: rQRhzDZiR32i6hqrr4yMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="106927565"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:26:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7sPO-0000000AytU-1dpi;
	Mon, 04 Nov 2024 10:25:58 +0200
Date: Mon, 4 Nov 2024 10:25:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Li Huafei <lihuafei1@huawei.com>
Cc: mchehab@kernel.org, alan@linux.intel.com, hdegoede@redhat.com,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <ZyiFFr1fbEn2JkWq@smile.fi.intel.com>
References: <20241104145051.3088231-1-lihuafei1@huawei.com>
 <ZyiEXYWU1Yt03UNc@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyiEXYWU1Yt03UNc@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 10:22:53AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 04, 2024 at 10:50:51PM +0800, Li Huafei wrote:
> > In ia_css_3a_statistics_allocate(), there is no check on the allocation
> > result of the rgby_data memory. If rgby_data is not successfully
> > allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> > ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

...

> > --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> > @@ -4181,6 +4181,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
> >  		goto err;
> >  	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
> >  	me->rgby_data = kvmalloc(sizeof_hmem(HMEM0_ID), GFP_KERNEL);
> > +	if (!me->rgby_data)
> > +		goto err;
> 
> Which kernel version are you patching?
> 
> The problem, you have reported here was fixed ~4.5 years ago.

Ah, sorry, I misread the line. Indeed, this one is still present in the current
code base.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


