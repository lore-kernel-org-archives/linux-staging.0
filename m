Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816C42BC28
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 23:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786057260; cv=none; b=bonay2tpCYdMlJkGnVX9TfEZaE8++ctrFnZqyEtGPDN6i4fQvanjVh5qR1iRVoRXEjV5g4QjDV1/PhrMGQMBl9ZMrVGrXpZh4RYVCsZMQ8pLCXzgvIvNQsvSsx9fyvfpvMsTOyZJVFdU9ZYBig8Hy/V9+a9sS5II39YRNh8opzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786057260; c=relaxed/simple;
	bh=OOfjWBUKCBP04Sb8WPemOEBKJqDnF1z6yOcHlGH3dvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEKKgJ/8N0HFb+ClvpUK+Srdhcx8EKLVivou8NBmRooSjLV8OE6Q3qBY2kxZmfosTnTmDKAlYE//XMmhcccsuXx2ueNSydVjwxBHYt8MNylCKqqa3z8HrDry+mG9awr4RdaddbeMRDEwYuj1pPkjJDI+kpHN1mwV/15X4KZ0fYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReZLWiCa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReZLWiCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786057259; x=1817593259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OOfjWBUKCBP04Sb8WPemOEBKJqDnF1z6yOcHlGH3dvY=;
  b=ReZLWiCahDuHT9Cwv4PccVociqsRJzS2DO11iJUgakB5Tp+eUnjXbVLI
   8IdUl+rO4sxCGWIOhD2dyx1K2mLzmvVgOddlNu0iCu/T6wwDc2btZUKsE
   t2sz5xhHC+LuYSOQLGvSx2OggtSQgpAAwB6XdUMEN8Cfn6ktiyh95h1Jt
   pqMOiT0xiLuATLjHAixAwN0BncacPaRrsJAR9eYsPMMioIghoj8Rt47wk
   NzwqdZ7eloKaOfmsRa0rX0hJ5QGJ2njrniNggHPy7Y12PL0s1XWSP/a9f
   pwaeakwC9K+nKC2KzRMtVfphe6XUXQJgzSDsJ73V7GpdXvxB/Y5ML1ssq
   A==;
X-CSE-ConnectionGUID: IrICwcD4T66tciOipjqGug==
X-CSE-MsgGUID: 8Bv5Vs7dQrG8+oeAZf0mQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89191411"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="89191411"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:00:59 -0700
X-CSE-ConnectionGUID: kIsW3pUrTaiQI7oJF8qCxA==
X-CSE-MsgGUID: uCX+Qd/5Qeit8hXxD79A0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="255991797"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:00:56 -0700
Date: Fri, 7 Aug 2026 02:00:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomas Chimenti <tach.365@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] media: atomisp: Remove useless return statement
Message-ID: <anUSJQw8RxTCoJEu@ashevche-desk.local>
References: <20260723152146.86978-1-tach.365@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723152146.86978-1-tach.365@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 23, 2026 at 12:21:46PM -0300, Tomas Chimenti wrote:
> Fix checkpatch error 
> "WARNING: void function return statements are not generally useful"
> 
> Signed-off-by: Tomas Chimenti <tach.365@gmail.com>
> ---
> Hello
> 
> This is my first patch, any feedback would be very welcome. Thanks

Right.
Please, read lore.kernel.org linux-media@ archives against this driver to
understand what to do with this patch.

Also, if you are in a group that is mentored, tell to the mentors to stop
looking into this driver by a newbie. This driver has much more urgent tasks
to do and it's not trivial, it also requires a real HW to be at hand to test.

-- 
With Best Regards,
Andy Shevchenko


