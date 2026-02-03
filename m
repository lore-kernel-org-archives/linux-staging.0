Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F542FFDD5
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131509; cv=none; b=PxAP5oJjaHyeaTpdApAEsVAyZKBzAtE9e6YcQBwWeW8xb0aLTjUyWz8EVsk8DpCKCmBnNabFAakOiQKVWw+eEV7RNBUh209MekawgI60lxqsXmSxXq4yxPXTd3EfnLgwCwpaiN9EIxaqHneh2zbbIn1DwJJBBjpBsTOJ9nDknCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131509; c=relaxed/simple;
	bh=oyF4O2bNDvkeozS5FbX7Z7I6t+g7ufKWmpVh0nDzAX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1kAeuLY/L2V+PwA4Obyz8GqtEzDFUMdtMzaRZMYWbdzvCoTEjt13GGcFmVaoiUx4bIERaZIwzh2Bp16/zOPN2sDUVLb46iRp9evaJw/CzHSVm7Hswy+wLm4u1e1suRiyEMLSyKpM2w+NQKwyL/ySxF/ijeXX/Wx/hxHDTN+Prs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yuk9AYfp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yuk9AYfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770131507; x=1801667507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oyF4O2bNDvkeozS5FbX7Z7I6t+g7ufKWmpVh0nDzAX4=;
  b=Yuk9AYfpt6PshDDgr70z3yeR7k3sUl51bgI72ZCX50nLZyuTCJ4ELe+/
   ZplXH7EO6JkbJAMjxLBtENGp41pHh9bq9LO9bhaL45HN+WsuDteI8DyUr
   Wu/ewVicDqVFxklv1+9qqX6lZgmYn7Y5KT6tOooxETv9apull2Z0hdj4h
   8UZuAxXc8j2cchcuA6iCNfc4b/cbZuNjJc2OjEoERNyXbRLt+RENa1WGb
   BrSC/KHT5tKSwljenQzabc+8KzHsrCVlI1nzBNQF7jhJjffH1a9wnSBC/
   0LZi0OpWHOjaxxktp4uwWnLzlGF1tuXzT2rU4bEv7g7bJidmAs2a0EJ+7
   A==;
X-CSE-ConnectionGUID: 2D/3pCq0QDGBo10RiwYOfQ==
X-CSE-MsgGUID: gAe06zp0SPC/grQJtGThqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73901216"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="73901216"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:11:47 -0800
X-CSE-ConnectionGUID: +gf1UDVmRuGcqwiA2cAcYw==
X-CSE-MsgGUID: 8N9H/0sjSNCTropcNWoLEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="240549171"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:11:44 -0800
Date: Tue, 3 Feb 2026 17:11:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, andy@kernel.org,
	linux-staging@lists.linux.dev, straube.linux@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] staging: rtl8723bs: replace rtw_zmalloc() with
 kzalloc()
Message-ID: <aYIQLjkhSfTvYJif@smile.fi.intel.com>
References: <20260131193001.303307-1-s9430939@naver.com>
 <20260131193001.303307-3-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131193001.303307-3-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Feb 01, 2026 at 04:29:59AM +0900, Minu Jin wrote:
> replaces the wrapper function rtw_zmalloc() with kzalloc().
> 
> I reviewed all the call sites to determine the appropriate GFP flags:
> - GFP_KERNEL: Used for initialization and configuration paths.
>   init/probe, config/setup
> 
> - GFP_ATOMIC: Used for critical real-time paths.
>   including interrupts, timer handler, region where spinlocks are held
> 
> Replace sizeof(struct val) with sizeof(*ptr).

> Use kmemdup() where possible.

Shouldn't be here. Are there kmemdup() conversions?
So, collect kmemdup() in the first (currently absent) patch followed by
kmalloc() followed by this change.

> Remove blank line after kzalloc().

-- 
With Best Regards,
Andy Shevchenko


