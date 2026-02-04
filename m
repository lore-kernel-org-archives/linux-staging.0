Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E486F2F2
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211841; cv=none; b=KbGEPcUvbxTiWBKDSEjt5/DuwFMlN0NLDoMfMWhUfCmb1b7bTcByrMSXcp5JDwO+OIsw2IharlxQ3EhWmNlYDhEH/WDZTWetZz/Gxf2yljkUW2kH7B8+Dzfnsban1X4fAnUFtPv4CeTVBIe/TOTxeiGmB6PBdO7TiOndnA4SU2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211841; c=relaxed/simple;
	bh=ghFo9rN6UDz+6pO4uKLzDP1kmIdCGZgaAG6wovl74go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsMF8ttFLJEsfYDX19QIEbM88pqFMH0yUk9Fevrluye4R4M5MkVhJ5YPR2hsq6vJDwxWulG1XMaWJzewb+2xzru/xaOGBX99UGfl9mPNnV/5IULyLRqH16HdcaiEOZUCDfrQ5fZehxQY81aWivuJKFfMVzrV3UUOdjsxxL6TOvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUp2geIC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUp2geIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770211841; x=1801747841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ghFo9rN6UDz+6pO4uKLzDP1kmIdCGZgaAG6wovl74go=;
  b=JUp2geIC2wEur3mjHaml6OrjhQtKxVRlj2eUobvyeqqsXwk319tZOPRt
   3GDaVwLZf1fKKW09VCPy2oSP8fkey4B0EeW3Hz8db3hxAnnQgEy2SzDfN
   g01im2EVEKcfeb8Bs0PXKuM4gsOKAgq3JFXCPZnGWHU+OO/jk7qdFIqmg
   MmPHleNEldWaVNzEcB61gwjahpFomTNmkKs41uC3Ai61q46PB7fgiFT/Q
   23Pl+3XNLgzOLjyictXvTTZuAmUq/PV+qclU/nArz8pbUwqJaKNB69yN/
   yVv73zhYJEZSDVgx+lVnmpOZCZ+G0uRYiB/TCy+FQU48fsRhCXBS+Age9
   g==;
X-CSE-ConnectionGUID: PGvOaIdvQoK3d+2HFayT6g==
X-CSE-MsgGUID: orc/G7CWQ9KHDw6l4Kt4Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71379986"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71379986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:30:40 -0800
X-CSE-ConnectionGUID: IC9PTNV0T5KJj6/u3Fj6lA==
X-CSE-MsgGUID: nMItKCBIQYW0VS75zra3yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="240848153"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:30:38 -0800
Date: Wed, 4 Feb 2026 15:30:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] staging: rtl8723bs: replace rtw_malloc() with
 kmalloc()
Message-ID: <aYNJ-yAqd7SqP1GR@smile.fi.intel.com>
References: <20260204131347.3515949-1-s9430939@naver.com>
 <20260204131347.3515949-3-s9430939@naver.com>
 <aYNHrXRGvWyJ82cB@JMW-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYNHrXRGvWyJ82cB@JMW-Ubuntu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 10:20:45PM +0900, Minu Jin wrote:
> On Wed, Feb 04, 2026 at 10:13:44PM +0900, Minu Jin wrote:
> > Replace the wrapper function rtw_malloc() with standard kmalloc().
> > Call sites were reviewed to use appropriate GFP flags (GFP_KERNEL or
> > GFP_ATOMIC) based on the execution context.
> > 
> > About GFP Flags:
> > - GFP_ATOMIC is used for allocations in atomic contexts such as
> >   spinlock-protected sections, tasklets, and timer handlers.
> > - GFP_KERNEL is used for process contexts where sleeping is allowed.
> > 
> > Also, convert error return codes from -1 to -ENOMEM where appropriate.
> > 
> > Signed-off-by: Minu Jin <s9430939@naver.com>
> 
> > Reviewd-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Apologies, I noticed a typo in the tag.
> It should be:
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> Please let me know if you need me to resend v7 for this.

Let's wait a bit (24h), but usually Greg requires a resend if something needs
to be updated before applying.

-- 
With Best Regards,
Andy Shevchenko


