Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF1E2CAB
	for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 20:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652990973; x=1684526973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IDoXax/th/czTvvvNqgEoZ9RHXqUd3i3Aslf+3U5d4g=;
  b=PSLCrYfF61S6SbXYylDLNC44PceNLEhU5B4OGQbesOEP/GmPMJpWsWZT
   6A9O/ANrK/V6vjCwznSpWfG9L/DjlKFcLEd+AnJ9g0WwCEXn8Ckptkr/s
   Ih/th3sewGD4KhQNelEX3UZzyvThX6YaTngAC5s6+YDPPlQHOARpHAI1N
   5btWoRnSebnZYF4PMjl5p4BcfnwjKNOxRH7hpg3OubJ3u+KREjMe6AOZq
   xBunFyMCRVuDYkaTbEMSL10VJio7mf5T2ip7dCqpcqaqPJ+W/d6Hebjpp
   N/1A/XkRhidccQGyvKu2R/ZgeiWa51MDU7rzWlQcR/5t/1CpIgf6CkEvj
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="269949274"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="269949274"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 13:09:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="524265158"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 13:09:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nrmSb-000GDJ-Sk;
	Thu, 19 May 2022 23:09:25 +0300
Date: Thu, 19 May 2022 23:09:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uri Arev <me@wantyapps.xyz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Len Baker <len.baker@gmx.com>, Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Srivathsa Dara <srivathsa729.8@gmail.com>,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix checkpatch.pl struct should normally
 be const
Message-ID: <Yoaj9baQHs9gZpz5@smile.fi.intel.com>
References: <20220519172503.10821-1-me@wantyapps.xyz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519172503.10821-1-me@wantyapps.xyz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 19, 2022 at 08:25:01PM +0300, Uri Arev wrote:
> This simple patch fixes a checkpatch.pl warning in `fbtft/fbtft-core.c`.
> 
> Reported by Checkpatch:
> WARNING: struct fb_ops should normally be const

...

> -	fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);
> +	const fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);

Why?

-- 
With Best Regards,
Andy Shevchenko


