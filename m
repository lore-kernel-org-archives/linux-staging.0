Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384CC1A3160
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 18:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093482; cv=none; b=POZWK5FTKPOsZBuo6Jfyel2qqJ1OQA75rmAgRdCAP/g85XN6MGYoL8Qc9jVaZOzPkKiJA+YT66VWZvi0dGDJUjJQ6+wdIDfuC8gi1cYv1tbWw9EoFlJKh7/Xdg0yo5QoXjiW9WfD08+Z60TdaJFJ5X2/1oRdXet5uQAuU4malhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093482; c=relaxed/simple;
	bh=CzhXcIZynkUYhTa9xk3up1JF3DVZT1sly0dsNN+CWGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjyGK/m/hGMckteYijSTAUrwrnNff3X8KgXHIqTZVWMiia4yhtt83vn/tGR5H0Ufqj8buS0q1f98y6P7jX0IIpFqH1DD3RKdFmui/woSWuejxpCegGakuvVr5E1coYL1B6yJkwL2Luza3wPGbYo4mDnjUCU7O2tlQl/yrIiIW/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+cv017V; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+cv017V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771093481; x=1802629481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CzhXcIZynkUYhTa9xk3up1JF3DVZT1sly0dsNN+CWGI=;
  b=j+cv017V3JKqBdf2j1H5alECfmo7pZ33dWl46Jaa1ZGYUHry19gBmJg/
   rRW5wzQahf255QyxeyTVUBDe9Q/C7FEqMEd9EJZjgFmoguTjp2K+OUG4H
   d/dspwCTtZ/fFNGzRYmRjqQbTLQ5vx2Ib95dlOUBwO7SilX8PNn4pgwDX
   xtePCvHbMWbWcohREWnk0gjbKtO79ZX9whNLxmUvPv0CGlpJFmYMWjdPp
   TNAUDLo3V3bIHr697LWrqFKAmQ+9KS2Jcc7JcU9ZD1+mttTl4AmUNMDeS
   39vQ5v/WfopDP+XEHwPxL1ReSv31LhycMCOZqpCI/PmrE4ojdWwT3cz6C
   w==;
X-CSE-ConnectionGUID: snB328RPTDWsSjWs1jmvNw==
X-CSE-MsgGUID: fi9zK85LTWCvAYRBo0bxcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="83348753"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="83348753"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 10:24:41 -0800
X-CSE-ConnectionGUID: oYaomr7eQSWEwQFMA31wwQ==
X-CSE-MsgGUID: xW7YafxoQ7iikz/Q6NK0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="213045002"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 10:24:40 -0800
Date: Sat, 14 Feb 2026 20:24:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Ofek Almog <ofekalm100@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	s9430939@naver.com, architanant5@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <aZC95PE36l0k5TOl@smile.fi.intel.com>
References: <20260214173139.49094-1-ofekalm100@gmail.com>
 <DGEVYFG99X27.1U7FPTF3YE7V6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGEVYFG99X27.1U7FPTF3YE7V6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Feb 14, 2026 at 12:11:16PM -0600, Ethan Tidmore wrote:
> On Sat Feb 14, 2026 at 11:31 AM CST, Ofek Almog wrote:
> > This patch replaces msleep(10) with usleep_range(10000, 11000) to provide
> > more precise delay handling while allowing the timer subsystem to coalesce
> > timers efficiently.

...

> >  	while (pevtpriv->c2h_wk_alive)
> > -		msleep(10);
> > +		usleep_range(10000, 11000);

The whole approach here seems to be fragile. It should rather use completion
mechanism instead of infinite loop.

> >  	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
> >  		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
> 
> Shouldn't we be using fsleep() now instead of replacing msleep() with
> usleep_range() when the time is sub 20ms?
> 
> I feel like I read Andy Shevchenko mention this elsewhere.

Yep.

-- 
With Best Regards,
Andy Shevchenko


