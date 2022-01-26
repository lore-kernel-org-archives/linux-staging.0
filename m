Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B129CA
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643202492; x=1674738492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ufV8tnp4+s0eKaTq+EbumSk5nBwGFfL7ygpVjn/q6M8=;
  b=DJoiR609ZMFB+pbXzobcT05iWbvMu1QHLtXPzw0GKBEMvHOED4NxtYZS
   HusuAwH+HkIyftGmhRJPdnQRtOS2d3mzT3+rdPHYHl2y2POxdhdDaXOMz
   xnRz3dNDZtxRhXc5vr4MXiqRPDeOsDP0kw6IUUjwdHoOql5S3Vxx6ZHN+
   ia8OyO4bJTOsK1qvoYUCaVUOmqstysMdl9Xw/kQydGidMxOpZfSFeLHR/
   v1jud99A/PgNRNG3Rsh0JRi4XPK9JmHa51ZfWZOwpeN7Aq48XXzL/i9Sg
   mZwKMWqSbxT6vABEkxgNLENbJyVuxvd7EpZ6XFJOzDy9DMYKjB3PGXCkC
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230118682"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="230118682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:08:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="581098861"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:07:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nCi0h-00EbS3-GQ;
	Wed, 26 Jan 2022 15:06:51 +0200
Date: Wed, 26 Jan 2022 15:06:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Phillip Potter <phil@philpotter.co.uk>,
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFHa3ayE9wtil9Q@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 26, 2022 at 11:31:45AM +0100, Daniel Vetter wrote:
> On Wed, Jan 26, 2022 at 9:31 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:

...

> > I'm ok with the files moving if the dri developers agree with it.  It's
> > up to them, not me.
> 
> On one hand I'm happy anytime someone volunteers to help out.
> 
> On the other hand ... why does it have to be resurrecting fbdev?
> There's an entire community of people who really know graphics and
> display and spent considerable amount of effort on creating useful and
> documented helpers for pretty much anything you might ever want to do.

Why nobody has converted these drivers to be DRM based?

For all these years no new conversion happens except couple, which
I don't even have a hardware to see. But I have the hardware that
is supported exclusively by fbtft driver.

> And somehow we have to go back to typing out things the hard way, with
> full verbosity, for an uapi that distros are abandoning (e.g. even for
> sdl the direction is to run it on top of drm with a compat layer,
> afaiui fedora is completely ditching any userspace that still even
> uses /dev/fb/0). And yes I know there's still some gaps in drm,
> largely for display features which were really en vogue about 20 years
> ago. And we're happy to add that support, if someone who still has
> such hardware can put in the little bit of work needed ...
> 
> I don't get this.

I don't get how Fedora is related here.

It's not useful to bury the /dev/fbX out for the devices that
the use of are black-and-white output on small embedded systems.


-- 
With Best Regards,
Andy Shevchenko


