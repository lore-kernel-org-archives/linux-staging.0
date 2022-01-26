Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0632CA3
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 15:34:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244173841"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="244173841"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 07:34:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="581135528"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 07:34:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1nCkIW-00EeDr-KP;
	Wed, 26 Jan 2022 17:33:24 +0200
Date: Wed, 26 Jan 2022 17:33:24 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Phillip Potter <phil@philpotter.co.uk>,
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfFpxEJ6L18DJQil@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <75a10e6f-ade7-01d9-9523-9a1936f8a2cc@suse.de>
 <YfFNhsPr4kS2/LXa@smile.fi.intel.com>
 <df377b35-8913-a8c6-760b-073f462780cc@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df377b35-8913-a8c6-760b-073f462780cc@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 26, 2022 at 04:02:23PM +0100, Thomas Zimmermann wrote:
> Am 26.01.22 um 14:32 schrieb Andy Shevchenko:
> > On Wed, Jan 26, 2022 at 12:41:41PM +0100, Thomas Zimmermann wrote:
> > > Am 26.01.22 um 11:59 schrieb Helge Deller:

> > > It's always for the same reason: the hw is old and devs have moved on.
> > 
> > It's pity to have a working system with an old hardware that no one in
> > the kernel community gives a shit about because simply they are not in
> > the same boat. Try to be on the people's position...
> 
> Yes, I do care about old hardware. I made helpers for converting fbdev
> drivers to DRM. I even made the initial commits for those drivers where I
> could find the HW on Ebay. [1] I made sure that every single of them at
> least gets fbcon onto the screen. So interested devs could start
> immediately.

Thanks for doing that, I at least appreciate it.

> Yet, no one ever showed up to convert even a single driver.

I have helper in a limited way to test / enable drivers on some platforms
where it wasn't possible before (you can easily see what I have done by running
`git log --oneline --author="Andy Shevchenko" -- drivers/video drivers/gpu/drm
drivers/staging/fbtft`), but DRM is completely new subsystem to me if we talk
about driver conversion or so.

-- 
With Best Regards,
Andy Shevchenko


