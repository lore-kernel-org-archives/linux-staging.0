Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C43EE1F6
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353039; cv=none; b=ljPv+uIitsVFNFaipegjK1qwZDsho1rywAquYoCo5M62SRYk8c58jEGtVywMl4uopUuDg3kMLOf7It/6MuEaid2sgvzNtQ92Ua68GVnXd01Z0/j0btZx1FVe5LXXJ90xT9vWSKo1p9xq4Ymn1AmljPN1FVWTF/aYl4PhltGkGF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353039; c=relaxed/simple;
	bh=qMdwZDsCBrOJkZUqhv1MvpTWq97aqolkMxusnEM52QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1WyL7ragOJNX3WemDeF9JIrai3LdliNLyn/48Aa4W4QYm8PaoMtLjnZrrle+1Ha1SJLE3U4CLpuym/OTn0sqaKazQmTZ4cAyNBdEhv4dynEtv4er3oqo49HeCUotCX84kDDk+o2Fp1lQQ4+9PAEJqaBUfQnvelWMs4QrZhIn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0oXuO2U; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0oXuO2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774353037; x=1805889037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qMdwZDsCBrOJkZUqhv1MvpTWq97aqolkMxusnEM52QY=;
  b=i0oXuO2UWMX8mwXm08nkNhA58YQgwQOqXM/SLxL8Idu+utkTnXl39PjH
   ETGlGyDT24p52NtlPntVk5eObiQQqYa+y/DV/paQh1l7pQEVmwU8bWt6W
   4nVy1xXd8B4qXUn8kVB5dVA78Eh2T19DhSNQMyKvKjS8UL8d4wSiEHyEp
   OYGFe9g2r4u1W9lYH5ftPcyXXEGbhuWsooVrgvT1JDitojgwX2JRP06KQ
   0L59I/Vzwj8HS0tpR7+GvcOkXA9qdlH10QjzS+uonqN8H2lNBw7sYWsq1
   GHPqp/qaeIMGYFLll0uJNk4AgpbYw6cu0Ii0eDW48kvYbqrCGBm+NjjKC
   A==;
X-CSE-ConnectionGUID: wJ0072aYSEKgcZP9UHEAuQ==
X-CSE-MsgGUID: gP/h+uozRLSDavGvfrGiKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92743985"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92743985"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:50:37 -0700
X-CSE-ConnectionGUID: 1V2gU2V9R4eatb4n5+DU8g==
X-CSE-MsgGUID: BZCIPyUlQVuvGboj8655Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221435823"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:50:35 -0700
Date: Tue, 24 Mar 2026 13:50:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org, hansg@kernel.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: pci: remove leading whitespace at the
 start of the line
Message-ID: <acJ6iD5FGE2ZlORd@ashevche-desk.local>
References: <20260324081007.23165-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324081007.23165-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 24, 2026 at 01:40:07PM +0530, Anushka Badhe wrote:
> Removed the whitespace at the start of the line to comply with
>  linux kernel coding style.

Linux

...

>  const hrt_address GP_TIMER_BASE =
> -    (hrt_address)0x0000000000000600ULL;
> +	(hrt_address)0x0000000000000600ULL;

Always think one or even two steps further. How does your patch add value?
For now it's just a warning of a tool or even no warning, just some whitespace
shuffling, which is usually the type of patches that are doomed to be ceased.

Compare to

const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;

which gives the same result + reduces number of LoC for free. This increases
the value of the change. Now, you can look at the rest of the code for the
indentation problems.

BUT, they are so-o-o-o LOW priority thing, that most likely will be simply
NAKed. Can you rather do a real patch instead, please?

-- 
With Best Regards,
Andy Shevchenko


