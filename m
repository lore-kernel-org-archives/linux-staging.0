Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D4350D74
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135046; cv=none; b=a34dlXdzrfAda+YNN39Wd728IjVSA+Q/IwIw5Wswh5Sm6NbVk1eN3CESDAHEVh1ADr4Z4wR7kCIeShGSNLhEZ8gyV0WZLGIS/HnjFe5Cr5Q0aTroYXIWYdAWQHvbfsScBeCs8+2t4oT41HfIOV7ydej2ZLYOgVerw5S89Lm0aGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135046; c=relaxed/simple;
	bh=PZ1mbJckwHJY4yOabONXFik8vFfJx/UYDjn4Ro1vDHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FE0hd5LP8IN7GzdNGZ+xexmchxo1gUVnWy0llHD2fScy0CqQPpxQ2UsiQvty2ir9bt4oYwCSAsWEKCdDe5IVj6+4Dbp/CLgPVcl9K4s12e1S5txRJ9LNWvkQb9a92/OmbAq7lRm+pr0AxUVT4LbjaXpCklB7dabSNBKL7w+8sWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m96HQAzg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m96HQAzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135042; x=1806671042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PZ1mbJckwHJY4yOabONXFik8vFfJx/UYDjn4Ro1vDHE=;
  b=m96HQAzg9vIGKOV6CZK0Ze1PF5hgwdWEIOKsha7iewaSnVSpQPaZphFb
   7puu1H96yaEYnx69FGqjQBY+T6Y/YSj3W7IpbLJYZYMALA81/lUy6sW7A
   ntw3bpPw7Vqpl7yi/fVfqEPwcLXTMH9cTgE/ZCX2FuL/ye3cX+ImxWbgs
   sFuqaFqC64kGcbtnAUtmyLxy3A43+o9CEo9kPrGyOufFWlY2IN55w1XHE
   lZzDig+6gRs6MhJvfJhqih44gDznRnRhh0xV4s4m602+DedQlgsLcy33E
   obR/QJW/M3yzrLMA82hgKsGiefcFHnMj9xI1T7VoPzPDL4D882GO0CD4Z
   A==;
X-CSE-ConnectionGUID: +yJFlIboQM+NHDIdX7+OiA==
X-CSE-MsgGUID: sNOhFMs/QUmv1NlexJCsVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87264652"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87264652"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:04:01 -0700
X-CSE-ConnectionGUID: P5C5wateQVS3yhD/6xLZMA==
X-CSE-MsgGUID: sFllq6i7QcWu+BgJJClAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="250178420"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:03:57 -0700
Date: Thu, 2 Apr 2026 16:03:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	grondon@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix alignment in function signature
Message-ID: <ac5pOwTLZHFtgyfG@ashevche-desk.local>
References: <20260402091827.2163-1-joshua.crofts1@gmail.com>
 <ac5mFkf5RIEg410Q@ashevche-desk.local>
 <CALoEA-zg2pFEvGGesXJPVfEJQCKZA0Cj5-oqS=U8GUKBd-TRkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALoEA-zg2pFEvGGesXJPVfEJQCKZA0Cj5-oqS=U8GUKBd-TRkw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 02, 2026 at 02:56:08PM +0200, Joshua Crofts wrote:
> On Thu, 2 Apr 2026 at 14:50, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > First of all, missing period at the end.
> > Second, why? Does it fix anything?
> > Third, is this the only issue with the driver of a kind?
> >
> Hi, I was doing some checkpatch.pl work and got a few check errors.
> Wasn't sure if it's convention to group all check errors together or do each
> separately. Apologies for the misleading commit name, i'm aware it's cleanup
> and not a fix.

It is okay and good to group the fixes for the same driver of the same kind.
I don't believe it's the only single problem of this kind in this driver.
But you may double check and fix them all.


-- 
With Best Regards,
Andy Shevchenko


