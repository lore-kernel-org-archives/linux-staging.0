Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F72256D
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668419321; x=1699955321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tw0S/mrhgXEwhusCWL7HJKtSrqKRfg78N9jta7g7Sfg=;
  b=itbCIYtN7ZiNuP2xPNKdEtcRLU7JET61SAEBvNpA9MDYCoS5ZeNccV5G
   5B4uqLCXxDVHydRTSWj0v+cc8VHwlEeHUsBCLKDe34VO9mipLiBcPSNR4
   xRAXFNJMHN6ggAKb1qPWlyXnJyJ9OtXzbLTUj5vxJI4ECo1O4z7qONdue
   4iLT6EilNnr2VxE26D9laLo484eMDFtRbupNmazAj/mfK0zrDSgqpEiog
   V1TLZXWZXToEuDOUBosUJwlorhPahLkt2960mcZyO88/75v7/NHUtYrob
   m9Cwc96LMhZ3/z8knQSADpHr+1z31yrwRgLYddnApyZyOAeyavn0/zS2K
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="376194144"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="376194144"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 01:48:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="883475174"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="883475174"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 14 Nov 2022 01:48:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ouW4h-00C6V5-2B;
	Mon, 14 Nov 2022 11:48:19 +0200
Date: Mon, 14 Nov 2022 11:48:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] staging: media: tegra-video: Replace custom
 implementation of device_match_fwnode()
Message-ID: <Y3IO4zVqex78+rTn@smile.fi.intel.com>
References: <20220927173011.72571-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927173011.72571-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 27, 2022 at 08:30:11PM +0300, Andy Shevchenko wrote:
> Replace custom implementation of the device_match_fwnode().

Sakari, here you are in Cc list and I never have any response on this patch.

Maybe something wrong with emails somewhere?

-- 
With Best Regards,
Andy Shevchenko


