Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8956F29CA
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 13:27:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230121341"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="230121341"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:27:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="532757290"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:27:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1nCiJE-00EbmO-Lq;
	Wed, 26 Jan 2022 15:26:00 +0200
Date: Wed, 26 Jan 2022 15:26:00 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Andy Shevchenko <andy@kernel.org>,
	linux-fbdev@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Phillip Potter <phil@philpotter.co.uk>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfFL6AQ7UbKYS1gl@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <YfEmuGVQ+IlhdQDh@kroah.com>
 <CAKMK7uEiUH8vD3jUCDPXFbF2YS5LygJLVOosbnUnvMP0MU2kTg@mail.gmail.com>
 <YfEtZD0uYp9yngvq@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfEtZD0uYp9yngvq@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 26, 2022 at 12:15:48PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 26, 2022 at 11:52:16AM +0100, Daniel Vetter wrote:
> > On Wed, Jan 26, 2022 at 11:47 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Wed, Jan 26, 2022 at 12:02:36PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
> > > > > > Since we got a maintainer for fbdev, I would like to
> > > > > > unorphan fbtft (with the idea of sending PRs to Helge)
> > > > > > and move it out of staging since there is no more clean
> > > > > > up work expected and no more drivers either.
> > > > > >
> > > > > > Thoughts?
> > > >
> > > > Thanks for sharing yours, my answers below.
> > > >
> > > > > But why? We already have DRM drivers for some of these devices.
> > > >
> > > > No, we do not (only a few are available).
> > > >
> > > > > Porting
> > > > > the others to DRM is such a better long-term plan.  OTOH, as no one has
> > > > > shown up and converted them, maybe they should be left dead or removed
> > > > > entirely.
> > > >
> > > > As I mentioned above there are devices that nobody will take time to
> > > > port to a way too complex DRM subsystem. But the devices are cheap and
> > > > quite widespread in the embedded world. I'm in possession of 3 or 4
> > > > different models and only 1 is supported by tiny DRM.
> > >
> > > Great, then let's just move the 2 models that you do not have support
> > > for in DRM, not the whole lot.  When we have real users for the drivers,
> > > we can move them out of staging, but until then, dragging all of them
> > > out does not make sense.
> > 
> > Can't we create drm drivers for these 2-3 models? Like we have drivers
> > which are below 300 lines with all the helpers taking care of
> > everything, this shouldn't be too tricky.
> 
> Agreed, having the hardware to test this with is the hardest part.
> Andy, this should be better to do in the longrun than trying to keep
> these other drivers "alive".

I see, I'm not objecting the place, I'm objecting blind removal, so
as far as the drivers, for which there is no alternative in the tree,
are in the tree (even in the staging) it's fine.

Let's keep a status quo then.

-- 
With Best Regards,
Andy Shevchenko


