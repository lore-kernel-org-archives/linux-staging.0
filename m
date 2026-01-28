Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CB33ADA5
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 21:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637184; cv=none; b=pl3otd24hhHPbwA6fAdgSaPylfXuusK3ttPHFi1tEPlhVEgOLVmcB3QqtS9zDY7wfFhffuI0Dw1rjgQtagiTYxuMb0m+Pok2fi/LTjGIBWep5ei/kPeEo6q8WeHgeWT9v7lZuqdPnuS5YjaLWmhhPy9ofSzi9MSa+wg2tcnQE8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637184; c=relaxed/simple;
	bh=AFhE2DhuCmWz4/xYsx17af4zeUbbrIDZ532NaG8e7eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjW0YTnHyhEA5LSUY3sCQdea/UELYhEAtEBXz31tVC6Tm9Ey0bjzhGVl3I67o4sT+GHSIci0w6PVxyfoVBrnIyX6RD+nKBBW7qgdCjPpxKCNmIoENWtgyrZmwkKOm7eZAbcLmFIl/9SxrBBMfKa1p5qdVlcZLx3D6fVd/yrmqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSl7M5Sr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSl7M5Sr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769637183; x=1801173183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AFhE2DhuCmWz4/xYsx17af4zeUbbrIDZ532NaG8e7eM=;
  b=YSl7M5SrikxVHxZ8WTwNGWG9p5lYT3Bq2ENtazKhF3iRvOr+KyFBNZ7T
   RxbMojX0Wtcsg3JukcZQzep6JLKeT0w2nBeQzgGHQzIYhwDw24tHVHbEb
   LBEdYBJw61qhyut+8g9A3k6Mw2ASgvGnx0OtewcQkXM4cezVCyxDHhxGh
   bJ8ob4orVfEeQyg2fgzIFvhlicpuOWozciVZtENUtRTGwWsuZQhFS2CSM
   ZBC0PSmI+C2N/UNkxNIKEJg9cD9eKOdIfpVvizsUzanGg7HlVKKnYoipP
   OeAnsLqzTQnvtpC5CvBVqeEIyvU9TiXNM3yEKCBDCjEuADMqvymZ7YVpE
   w==;
X-CSE-ConnectionGUID: Wlbu9i3kSQa3STKoz2iF6Q==
X-CSE-MsgGUID: TvWwEGprQs6l6UaL2Vp1pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88281086"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88281086"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:53:02 -0800
X-CSE-ConnectionGUID: 0HVcFK+WRmSLK4YSG7wOOA==
X-CSE-MsgGUID: WHuDJIK5ROap69fGntuYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208174567"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:53:00 -0800
Date: Wed, 28 Jan 2026 23:52:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, andy@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: Re: [PATCH v3 1/4] staging: rtl8723bs: replace _rtw_malloc with
 kmalloc
Message-ID: <aXqFOmaJc2O1Sfta@smile.fi.intel.com>
References: <20260128140954.1065382-1-s9430939@naver.com>
 <20260128140954.1065382-2-s9430939@naver.com>
 <aXqE76ZJO5RCSyJu@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXqE76ZJO5RCSyJu@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 28, 2026 at 11:51:48PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 28, 2026 at 11:09:51PM +0900, Minu Jin wrote:

...

> > static void update_BCNTIM(struct adapter *padapter)
> 
> >  	if (remainder_ielen > 0) {
> > -		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
> > +		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_ATOMIC);
> >  		if (pbackup_remainder_ie && premainder_ie)
> >  			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
> 
> I haven't read the code in full, but why not
> 
> 		if (premainder_ie)
> 			pbackup_remainder_ie = kmemdup(rpremainder_ie, emainder_ielen, GFP_ATOMIC);

This was typed with typos, should be

			pbackup_remainder_ie = kmemdup(remainder_ie, remainder_ielen, GFP_ATOMIC);

> 		else
> 			pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_ATOMIC);
> 
> >  	}

-- 
With Best Regards,
Andy Shevchenko


