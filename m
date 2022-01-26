Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF602CA8
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 13:19:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244144948"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="244144948"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:19:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="628300420"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:19:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1nCiC5-00Ebgm-A1;
	Wed, 26 Jan 2022 15:18:37 +0200
Date: Wed, 26 Jan 2022 15:18:37 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfFKLfSKUdo1UVfF@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
 <20220126102858.GX1951@kadam>
 <1b665bb8-7acb-519b-0a02-ef0f2dd4b524@redhat.com>
 <YfFE61IQus3SMQRZ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfFE61IQus3SMQRZ@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 26, 2022 at 01:56:11PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 26, 2022 at 01:37:00PM +0100, Javier Martinez Canillas wrote:
> > On 1/26/22 11:28, Dan Carpenter wrote:

...

> >    fb_hx8347d.c (DRM driver in drivers/gpu/drm/tiny/hx8357d.c)
> >    fb_hx8357d.c (DRM driver in drivers/gpu/drm/tiny/hx8357d.c)
> >    fb_ili9163.c (DRM driver in drivers/gpu/drm/tiny/ili9163.c)
> >    fb_ili9341.c (DRM driver in drivers/gpu/drm/tiny/mi0283qt.c ?)
> >    fb_ili9486.c (DRM driver in drivers/gpu/drm/tiny/ili9486.c)
> >    fb_st7735r.c (DRM driver in drivers/gpu/drm/tiny/st7735r.c)
> >    fb_st7789v.c (DRM driver in drivers/gpu/drm/panel/panel-sitronix-st7789v.c)
> 
> I'll gladly take a patch that deletes the fb_* files that are already
> handled by a DRM driver like you list here.

None of the DRM driver supports parallel interface for these devices.

-- 
With Best Regards,
Andy Shevchenko


