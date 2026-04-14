Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173703A16A7
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154819; cv=none; b=bpd2YX/ZoSYht1F7anxwk64yO+MfrdB4DzSFuztfHlcOpfsfexdARnugpSVohEBCPYnVRBy8TAQtlS43y7BRJ93e/eH8z60wfM87zvNU3Li8PMyyE4OtmTYNo27eMyYEHX26xexw65G49wQnnDLOODUjKnqYtQUIMhDRFFHIy1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154819; c=relaxed/simple;
	bh=2cAwolY5z2GXVz3PlWBCXl25KcupGpdiCLYh6FZ6Y58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgIlUbZ/RxYPOeX0BRewdWVjFMVBCfRcJ1YOTbmVW4N7jiBapz0Chr0oanTo4IRc4JeXmkIHq4oAIkUJg8yM4T3l1fS/SApngPNdxnF5BTxxMkaootToBWtX7lq8myvNGI39qFROuib9X5trX+R63ydLAz8H5uBU4MeRrq2gaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hv/msIbf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hv/msIbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776154818; x=1807690818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2cAwolY5z2GXVz3PlWBCXl25KcupGpdiCLYh6FZ6Y58=;
  b=hv/msIbfZLsPJGoBTtu7rHLEHCNM6cclCxGWj5mFTErrjd3o+lF5Nxz4
   hlcZIrrx6xPwOwcrDbfGgPnXdzjPdADTWA01ftnk7HOVcbhw2yZ9Aks20
   f8g9FpWUfNVkpZ1p/ftYtxUguMKmk7Taz6Rpa1mmRWW9tYJ2hnzNBU3io
   X1V2yAVCUHIG4ix4mKFawdtiw4Ct5IkVJdrGCJKn+yGc23rj36ePHemeA
   fpZk0WFh1jZaaHi0KHXQVtUkuLKON22NVcZDrEyGZIC9fQt+OYXSjQJIF
   YeuhmB6x5YVTxMptfpefmrAkeor6PxX8tFOr0XfeQrQCQEvWuiLOeuN1Q
   A==;
X-CSE-ConnectionGUID: mI3JqqGmQcSw+ZWtYjURSA==
X-CSE-MsgGUID: Gt/LqWIiSv27egkRMjYOrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77215906"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77215906"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:20:17 -0700
X-CSE-ConnectionGUID: htPIXgnDQ2qwboE1oGN/aw==
X-CSE-MsgGUID: uHDivzrvSKWPZNTEKiQSVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="228990646"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 01:20:15 -0700
Date: Tue, 14 Apr 2026 11:20:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad34vKH8FhDIWijv@ashevche-desk.local>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
 <ad3wxbGGPxxm72_6@ashevche-desk.local>
 <ad3zDOhTjfwy_vj9@stanley.mountain>
 <ad30An8Oi_D-UTB2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad30An8Oi_D-UTB2@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 11:00:02AM +0300, Dan Carpenter wrote:
> On Tue, Apr 14, 2026 at 10:55:56AM +0300, Dan Carpenter wrote:
> > On Tue, Apr 14, 2026 at 10:46:13AM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 14, 2026 at 12:43:06PM +0530, Shyam Sunder Reddy Padira wrote:

...

> > > > --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> > > > +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> > > > @@ -194,7 +194,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
> > > >  	struct rtw_cbuf *cbuf;
> > > >  
> > > >  	cbuf = kzalloc_flex(*cbuf, bufs, size);
> > > > -	cbuf->size = size;
> > > > +	if (cbuf)
> > > > +		cbuf->size = size;
> > > >  
> > > >  	return cbuf;
> > > 
> > > Now to the code. This is still buggy. The problem is that the size is not
> > > validated and when it's 0, the same issue (dereference of invalid pointer)
> > > will happen.
> > > 
> > > Dan, JFYI k*alloc*(0) returns not NULL and not valid pointer.
> > 
> > kzalloc_flex() basically can't return the ZERO_SIZE pointer.
> 
> I meant ZERO_SIZE_PTR.

Ah, true, I missed the _flex vs. _objs part. Then the patch is fine as is.

-- 
With Best Regards,
Andy Shevchenko


