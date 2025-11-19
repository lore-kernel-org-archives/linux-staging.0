Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDEB335BD5
	for <linux-staging@lists.linux.dev>; Wed, 19 Nov 2025 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543690; cv=none; b=PvBjbSz7rlYf9qEacylDtRgyAZO9MPreckhVjykShih4LsFopEZfbDBN4CFBRChijWG3FnIiNHzADk+xJLUqgJ3YEV2WvIoNRjk53QoVKHlcXoor89thO275t/dh8VkCycX5GSvuITvl+Jk+4YnptnDs5l7OVfCG9Mt1wgd0Nnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543690; c=relaxed/simple;
	bh=q6da8jLQtnLnim6HyWRfNmg8bV209AFrRAch7qncfbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZWGx6Slnws2WVRrOqExf3AskbVeGl1fEzFqZ850qsfXWh/0kBJMx5Fpa0YlIGcCpYi8SP2P02mOmJPspd6Oh6p3znaZWWCKea7nD3kHwAfL8IIx4xxhRkx5ZsUQ1zGbmv8SHrykmRY9DbGthH6P+ZTuA8rB2MhwX9mQi94LRHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbC18wiS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbC18wiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763543689; x=1795079689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6da8jLQtnLnim6HyWRfNmg8bV209AFrRAch7qncfbs=;
  b=IbC18wiS6nGQsXbcEjH8BQgYihVPa9bDeXRtmRfTzPG0M1n/zVkpPKL4
   XdmaB6qRWag7lKIXKFd4zwrqnXsHCOQbkE2n7Y8toUCGWlOHvKYR6ta/E
   CImCgHndqOswGia2LZMzjNdYB7gm+Y8DBraPL+czRPVqxpIcizQ6+NUfi
   VmKPzC0QW2rBL681b0BcvjzG8koDbEQoXsXjZIKdGO50jvyxQ44/M+XCg
   8iMUlcf30ovH6ELoYpSgAxLK8xZy6FCZPKdZPiR9HFmkmiAXLelDCSr90
   taLI7fS5KvdnGuVuWcwwLofmsG4obk3V6TxUAl7+/PybFn30Hupy2A05I
   g==;
X-CSE-ConnectionGUID: QW2nFLtZT6Orl3oIXXKblA==
X-CSE-MsgGUID: J/UUdRFuQiSly0KIRlwCFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88232441"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="88232441"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:14:47 -0800
X-CSE-ConnectionGUID: oHYrWS8ATQebFcLjYXGykg==
X-CSE-MsgGUID: DikRyuhjQLyYtee9Ng8YEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228346786"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:14:41 -0800
Date: Wed, 19 Nov 2025 11:14:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 01/21] lib/vsprintf: Add specifier for printing struct
 timespec64
Message-ID: <aR2KfgzV1_3ZzXhT@smile.fi.intel.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-2-andriy.shevchenko@linux.intel.com>
 <aRcnug35DOZ3IGNi@pathway.suse.cz>
 <aRd5HHUBu2ookDv_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRd5HHUBu2ookDv_@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 14, 2025 at 08:46:52PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 14, 2025 at 01:59:38PM +0100, Petr Mladek wrote:
> > On Thu 2025-11-13 15:32:15, Andy Shevchenko wrote:

...

> > I wonder how to move forward. I could take the whole patchset via
> > printk tree. There is no conflict with linux-next at the moment.
> > 
> > It seems that only 3 patches haven't got any ack yet. I am going
> > to wait for more feedback and push it later the following week
> > (Wednesday or so) unless anyone complains.
> 
> Sounds good to me!
> 
> But in the worst case all but untagged can be pushed, the rest can go
> to the next cycle.

Just got a "BUILD SUCCESS" from LKP and since we gained even more tags
I think it's ready to go.

-- 
With Best Regards,
Andy Shevchenko


