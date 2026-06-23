Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6763655E9
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206772; cv=none; b=Jm+J57myBf74CDsmmpZlgWGmP1qEVIdiZE95Uy79fifgYHGdLILEzowHo+XaBfm0Rpx81FmiHOjfnBVlbLsp7Tg10EltGUGMde7pl/tQrKS3jstjNpOLT8mGyDZUalkpkxUVTUFnEgHxj5lzhThEnBroYLk2IWW50ciyA7+J3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206772; c=relaxed/simple;
	bh=4cB5K1MyOwAljSIAB5h7y5ycwAo3C4xLQVfz3v4GAzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1P9/kBe+n3V05PzeLtfBrULHddCjvZeqeSL5jfrmfZ7kcBmCgB/NHq6Zyt4sd5AxBBLDWzXn4Fxl3aSFIwIdPKiTstX5kggbBzDMm02dUjixnKM6tVPnaqOFgxmdEn7ie+6JJB+71DPyAoxYa5uZ7iAzAMYt3lXGQUiUgB+3os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8uod8sM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8uod8sM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782206770; x=1813742770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4cB5K1MyOwAljSIAB5h7y5ycwAo3C4xLQVfz3v4GAzM=;
  b=a8uod8sMauYbWfesq+1ySRcR04CV29R3Jy9LwTFWY43XQJFkljT4Lk3G
   FFryj9f+3EwhOci+F1Ub4K6zWNLUkToQeu1NRC3F5wVWCG6mrvLE7T26P
   tT6ci/3Tr0W7ReAGl3E3J9epiGjHc71cXjQZ/3PlejWGCpWjDuDJo7Ys+
   Xu8hxsovbzbSYMLX8LMRylzigLvq8mZda44Uu+q58xQc66ox6/YbgQ9N1
   bmf6umEBf0qoyAwuL7pv+M5IYMrqIegu375g/jgAY1Pz5OJAnGNSOA19/
   8ohlLi/YiiiJXjTrpNQQvYTUD/WvNjGNG+SEG/9chvxH0YUHw9FfLobah
   w==;
X-CSE-ConnectionGUID: +YwJzEDUTLKbLTGQMkh6dA==
X-CSE-MsgGUID: Vi53qc87R7uL4s4C1dwuvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82714272"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82714272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:26:09 -0700
X-CSE-ConnectionGUID: zEZVrUorT9qnndCarBVKHQ==
X-CSE-MsgGUID: tmp9o37zSa+KBzMYh1pQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249593710"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:26:07 -0700
Date: Tue, 23 Jun 2026 12:26:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mani Bharadwaj <manibharadwajcr@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: anr: move trailing statement
 to its own line
Message-ID: <ajpRLLxE3iBt5ZGL@ashevche-desk.local>
References: <20260622184100.33490-1-manibharadwajcr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622184100.33490-1-manibharadwajcr@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 23, 2026 at 12:11:00AM +0530, Mani Bharadwaj wrote:
> Move the return statement in ia_css_anr_dump() to its own line
> to fix the following checkpatch error:
> 
>   ERROR: trailing statements should be on next line
> 
> No functional change.
> 
> Changes in v3:
> - Fix subject prefix: add missing 'media:' subsystem tag
>   per Media CI bot feedback.

No. Take your time and read the linux-media mailing list archive for last a few
months in regard to this driver. Only _after_ think about contribution (what to
contribute and how).

...

Also read the process documentation. Do your homework before, please.

-- 
With Best Regards,
Andy Shevchenko


