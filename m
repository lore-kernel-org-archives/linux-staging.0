Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242371
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 16:56:09 +0000 (UTC)
IronPort-SDR: mPfZEZY4B5YHyUStPa1KShfXBNtWvl3f/O/23qlBVdr6T9OdLPSurOmsXNzynLeERtXIKAkpTv
 7tOVCoF1pGMA==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="196614908"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="196614908"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 09:56:08 -0700
IronPort-SDR: UfKVhAS4HGuIl3apXrQJCsFL3vlyN0GGn2fENaHT29ZuNVWNPey5dREwdyShiKJVKnsY7pCp2V
 ffQfvMYdQzoA==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="527029629"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 09:56:06 -0700
Received: from andy by smile with local (Exim 4.94)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1lc9xL-008C2n-Sf; Thu, 29 Apr 2021 19:56:03 +0300
Date: Thu, 29 Apr 2021 19:56:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Phil Reid <preid@electromag.com.au>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 3/4] staging: fbtft: Don't spam logs when probe is
 deferred
Message-ID: <YIrlI+bo5Jm3orUD@smile.fi.intel.com>
References: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
 <20210428130415.55406-4-andriy.shevchenko@linux.intel.com>
 <20210429144244.GE1981@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429144244.GE1981@kadam>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 29, 2021 at 05:42:44PM +0300, Dan Carpenter wrote:
> On Wed, Apr 28, 2021 at 04:04:14PM +0300, Andy Shevchenko wrote:

> > +	if (IS_ERR(*gpiop))
> > +		dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);
> 
> This should be a return statement:
> 
> 		return dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);

Thanks!

Funny that I have trapped to this and my patch that adds __must_check to avoid
exactly this situations had been reverted :-(


-- 
With Best Regards,
Andy Shevchenko


