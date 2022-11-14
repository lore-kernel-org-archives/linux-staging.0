Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A960256D
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668421262; x=1699957262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K5wPzpccjMxIfZGkMrxAyy4j5vQB4o52SipEQ2qLVls=;
  b=XqiGJkuppUpIoJGZIQcEC1M65WaRkL8qKH8XT8xutNFE06YTlPz/yD2f
   UI38Xb8zPuw2mEm64YQ3v1CfXePWtzYGu8mLy1RYeOi5lrxx3s2158BY4
   FAtd0XrQR8d1CfP/mE2iFTMoQFPDLTfd/MIQDsvYIM6YjxHjTDzzGjsrV
   1o4LGZVboIjjFjLYR2zkPcmkhzbk9L6ku1UL0leTn2a7ZBuHfdSpJveL2
   4TT3cB4b1Rw+lrK+7ltTvrzJK6uqbweSuZea0kfo8M/euOdLPZxKdqGvx
   +Rrzf+fmlcUksF0x+68pcQD3dx1DJj/Bx6+X4imlig31k5P61EUrKVk4X
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="398225459"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="398225459"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 02:21:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="671506019"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="671506019"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 14 Nov 2022 02:20:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ouWaH-00C7Mq-0b;
	Mon, 14 Nov 2022 12:20:57 +0200
Date: Mon, 14 Nov 2022 12:20:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] staging: media: tegra-video: Replace custom
 implementation of device_match_fwnode()
Message-ID: <Y3IWiNTjOose0ewr@smile.fi.intel.com>
References: <20220927173011.72571-1-andriy.shevchenko@linux.intel.com>
 <Y3IO4zVqex78+rTn@smile.fi.intel.com>
 <Y3IPdAg8wnjzbQPU@paasikivi.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3IPdAg8wnjzbQPU@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 14, 2022 at 09:50:44AM +0000, Sakari Ailus wrote:
> On Mon, Nov 14, 2022 at 11:48:19AM +0200, Andy Shevchenko wrote:
> > On Tue, Sep 27, 2022 at 08:30:11PM +0300, Andy Shevchenko wrote:
> > > Replace custom implementation of the device_match_fwnode().
> > 
> > Sakari, here you are in Cc list and I never have any response on this patch.
> > 
> > Maybe something wrong with emails somewhere?
> 
> You should have received a notification from Patchwork the patch is "under
> review".

It it was one, it was not a separate (per patch basis), so I may definitely
missed it.

> It's in my PR to Mauro now:
> 
> <URL:https://patchwork.linuxtv.org/project/linux-media/patch/Y3IJwomIow2+vdMh@valkosipuli.retiisi.eu/>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


