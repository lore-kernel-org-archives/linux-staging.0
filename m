Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F20443634F
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917824; cv=none; b=f4kpw24tub5EPAlBa/9L3jF95J3piTC0O810rbXen5yQ6dsbXSb0+OdkLEzHBKjboVc+FPkkfmOLtjNA0TSFYC6HUHS4DS6FC6xZAAGVLBL/c2zgAW03hOMiHcFvIDsFptLtmmrMac/rZ9yFHwLr1MbHmBMdA4O11TKWDFZgj4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917824; c=relaxed/simple;
	bh=aOWJQjtG8CoTLYoqVg1Xzp7TxliJTjiG4ySFbEXZz28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ386gr6BKU8MX+R3f7EiGEl3XU9vvtAkj2swiNrKztlW4iqAbduRCYeILC+PSjbj/00TEwjwLGeBG9XUaEo3Ccrp5MPsGYVaZnJlIDfmT4m6vQl1pejOiCC9XtJhpz9aeVT2qFnOdjAerLaXj1lOHwIXZgGetn4gCJMVwZrB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qwofv8/z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qwofv8/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768917823; x=1800453823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOWJQjtG8CoTLYoqVg1Xzp7TxliJTjiG4ySFbEXZz28=;
  b=Qwofv8/zIip7FNc8w8eMLQYEfRQP8noQ4+5w0vuJjrbvnqSTe41E62DL
   Ebs0ANS+rcezyyHpk0owfNoRR3iGrnZfbl0KRjv70ZSVqyp3U08zVen5e
   LtbaCj0MwMt6jPiV1pdceW8GnYxgdP1lgNkRghXVK3KLHHwWp5BEUx9Cf
   h1QM9zVs1el7SpBZNZTSShesrbzFTWA9+/ESP4EO/nKWuvodIJAmSxbtw
   slmDp6FsoLHofTWaGUuSOfokXOpvw1FXLhnaB531029UenpO+sCTDdVus
   eCsWM+OaviqcYDsCYZdqOkZwG49ilviyq2+3qNIZV7lk+sdcnnBj5Tj3h
   Q==;
X-CSE-ConnectionGUID: VCCd1p+OTmSgcDZmAQeLzg==
X-CSE-MsgGUID: z2IT88BpT+yCrOsChzTcAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70030242"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70030242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:03:42 -0800
X-CSE-ConnectionGUID: 0+2HwwLaRl6r13Fv/yRblQ==
X-CSE-MsgGUID: qttdO35SQ/+zVNRW5Htmqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205749307"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.240])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:03:40 -0800
Date: Tue, 20 Jan 2026 16:03:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Minu Jin <s9430939@naver.com>, gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW-LOZdXo6zLhT_x@smile.fi.intel.com>
References: <20260120132241.2119454-1-s9430939@naver.com>
 <aW-KQbHblIy-MTIu@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-KQbHblIy-MTIu@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 20, 2026 at 04:59:29PM +0300, Dan Carpenter wrote:
> On Tue, Jan 20, 2026 at 10:22:41PM +0900, Minu Jin wrote:

...

> > +	signed int ret;
> 
> Don't put a blank line in the middle of the declaration block.  Just do
> "int ret;".  Everyone knows "int" is signed.  Don't follow the local
> style when the local style is wrong.  Also only use s32 when it's part
> of a networking or hardware spec.  Just use int.  Do people imagine that
> we'll change int to be unsigned?

Not in a far past we changed char to be unsigned :-)

*Yes I know that it's a bit different case.

-- 
With Best Regards,
Andy Shevchenko


