Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD15D392813
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091977; cv=none; b=nM/3K2HMg/JUiPIXvDlCm38H9YZN7d85hEAhA5AIsnTuU1ojOYkFgzeNSOnq2n3fbiRoXvhh9z06R1ckm3wEUmFHibnCdH7rNazGD7QkiEh1Es3modj4v1a//x8jaQhSikBZmfbkCREdSarOXTmYl9roTzc7VxY/hIBQGH6VDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091977; c=relaxed/simple;
	bh=ZpwIQUPmBHkMKxQ8tlC0wxQSF+8zr4oViEcqWJbz5RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CG+V6L065Z3z8En6FG9+za0Qzq7SBRfMft5WF++ImLEx+Y1tEcwXluHhfkTj8xoHbk+Bigl73tLg55OyumoyYtPDFJIZYumTxvAblYeR0/xjWozMUHjyrDWMxGZErYIjtA34srqfvyQQHdgoxgND5Hexpsgb2oUgWNvNhqB3NOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0PAUn48; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0PAUn48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772091975; x=1803627975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZpwIQUPmBHkMKxQ8tlC0wxQSF+8zr4oViEcqWJbz5RU=;
  b=D0PAUn48YejDKdfiHgyoZfPT7m0ZPNgbPe6PYZ5aL3/sEw4NN5Bc1HvI
   k/BabwW4BB0N4Hn4TbDM0wXQqQ9MbKQ505kng6StaZGnST/ZZt/8FkjgY
   rqTpQrbmrso65zTRvevjpGSP9ROAbgAiJ0oRsQnYnWcaWgwHDX+I9Rmqf
   GIyKvC4TwxV9N1Qw/A3j02ULXuN+ergTHzYMHbhyNRXK/O6Z6ty9fCL5h
   ERBsk8phyG/s2hwaY3e0WT5o/+ac6Z9gBuw+N2JW48AJTotPrPbsBx1lE
   dsByYZpj7uRfitlWhb3eHKKBvIsYJElFYuj5oUzKuFYxJ3awPW6vNgb1/
   Q==;
X-CSE-ConnectionGUID: jiSf6wlkRd6eoING19pYfA==
X-CSE-MsgGUID: WuF1MgezT3O5HpaZPOL/0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="77015017"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="77015017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:46:14 -0800
X-CSE-ConnectionGUID: OZ1hXrjWRe6NQmpJPqFvmg==
X-CSE-MsgGUID: TuyKCFxtRSePaDSd9efJKg==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:46:12 -0800
Date: Thu, 26 Feb 2026 09:46:10 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: fbtft: fb_ra8875: replace udelays with fsleep
Message-ID: <aZ_6QvJPZplh6xtd@smile.fi.intel.com>
References: <20260225204602.134218-1-azpijr@gmail.com>
 <20260225234100.152320-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225234100.152320-1-azpijr@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 12:40:36AM +0100, Jose A. Perez de Azpillaga wrote:
> The write_reg8_bus8 function uses udelay(100) twice to wait for the

write_reg8_bus8()

> display controller. In non-atomic contexts, fsleep() is the preferred
> API as it automatically selects the most efficient sleeping mechanism
> and avoids busy-waiting.

But how do you know this is the non-atomic context?

> Update both instances to use fsleep(100).

-- 
With Best Regards,
Andy Shevchenko


