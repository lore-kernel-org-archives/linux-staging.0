Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ECF38F92A
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092746; cv=none; b=BL/NQUSwvEp2Lw2x26rqh3KYSsv8uJWRj+GyOImec6sQ1KtSXBpZTjyEX8ejNWy2cKFMtANpnc/ceBOBTCWgwZJY6HpbRCN/XaQfR7kzsTjdEsZDGtweGNFx0ZIQxmW7mN4F5zYd+543F5WhKvafR84D7IrfcVohgbNg8T/ivO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092746; c=relaxed/simple;
	bh=mdVFz9zH0gf6AUMPOQNmQdWcz9eVnvHcquXcX5W51jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pipRjP9CNn0od5xzF1XjcuseXYtuMlwG5Cx+uWLLXjkgAxGlU8THo4Fzq6IFaNROoLqEWnGCiSZ4QFj4MDk+Syjqx0GZfbUkRt/k85Ag8CxCvP1Z5wjnD3XmbPjOWgwOaoG79oG6NbMZQxxcj9ZbGLE6Nlq2YW2MktcTcXbL+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBCYPizs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBCYPizs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772092745; x=1803628745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdVFz9zH0gf6AUMPOQNmQdWcz9eVnvHcquXcX5W51jg=;
  b=fBCYPizsJUjwzFJ9uNQds7rQkUIRkE5abcU0ZhGeYu9C45pdXfYVcqn6
   LbH+SqYFOXduJRTuAanx2P0IBCP3Oo3sbDkpvdegm+Wis26WDRiG7fhyL
   L/yDBAD4Bi4cFmlvOKgfu3Vd48SlRBQO0tGVWZga+hngFU4jPmrvrZWSi
   DWE2PrSAbIOc1hGWhbix9D4B1BM0AzTY8k01PrfIwY6NCGg1besf0tqcX
   +7dmRA0F9s6rrjgJH3OP6ehu4Pn2hGv+57Sj20uBZLW06ZFYNORxg3aGb
   Z1cmVHAgZabKfo8E6yTJIS4cej1/2IM4q9MeWPKW+Zz26tO7gJNjSgY7C
   w==;
X-CSE-ConnectionGUID: eM3gk8m/RIOXwMOc/HeK7g==
X-CSE-MsgGUID: lzSkAVGwTdecPo2ZD+7U4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72357263"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="72357263"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:59:05 -0800
X-CSE-ConnectionGUID: RLYM8LoERYKrcSUVbv8oFg==
X-CSE-MsgGUID: K6CWka4oSpWr+vFpcTlxdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="239482566"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:59:03 -0800
Date: Thu, 26 Feb 2026 09:59:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Keith Teeple <keithrteeple@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	s9430399@naver.com
Subject: Re: [PATCH] staging: rtl8723bs: split chained assignment in
 xmit_linux.c
Message-ID: <aZ_9RflM8c_ACHjd@smile.fi.intel.com>
References: <20260226001019.1100684-1-keithrteeple@gmail.com>
 <aZ_0OratIkUBNHmy@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ_0OratIkUBNHmy@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 10:20:26AM +0300, Dan Carpenter wrote:
> On Wed, Feb 25, 2026 at 07:10:19PM -0500, Keith Teeple wrote:

...

> >  void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
> >  {
> >  	pfile->pkt = pktptr;
> > -	pfile->cur_addr = pfile->buf_start = pktptr->data;
> > -	pfile->pkt_len = pfile->buf_len = pktptr->len;
> > -
> > +	pfile->buf_start = pktptr->data;
> > +	pfile->cur_addr = pfile->buf_start;
> 
> Please don't do it like this.  Do it like this:

+1, good advice!

> 	pfile->buf_start = pktptr->data;
> 	pfile->cur_addr = pktptr->data;
> 
> Otherwise we have made the new version harder to read than the original
> code.

Not only read, but prone to subtle mistakes in the future!


> > +	pfile->buf_len = pktptr->len;
> > +	pfile->pkt_len = pfile->buf_len;
> >  	pfile->cur_buffer = pfile->buf_start;
> >  }

-- 
With Best Regards,
Andy Shevchenko


