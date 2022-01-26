Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07529CA
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643206203; x=1674742203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+bpZlvDIlAqOTrKi8qQY7oqDaN358NSulwLrW+ejnTU=;
  b=oFQqJ+XWY38YLFj+p2N8G9E6unmNWenIf+EY/tuCcal50jIsspjrdPNG
   UE0m3H1KydyYoKWbUvP10vpIsQbMuhLWHdzTA8ndRcUv8ledI+lM8LLRs
   4VVzrAXiPaKSlo78cEn529yWPOfsKbIBmoE4jvZpy0/+7HWSNE3xjFzTw
   UE2ebW6sWd5U7iHg+OKCwJNEaU3H8YSae/iBjjMmtXFNLF7uI+F0gQ9BH
   EAxIU5Iv3+KU0JamrPXSIrdz4ZvKGkyc6Y2orWbmDfs55S/1/JDZp5eMG
   2okx6XPQc8fe6l2LgLUZgE+GMQ5+mwsYCWVbM4yGmZ5ie4vGJbtOSCi2v
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="244154736"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="244154736"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 06:09:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="581113085"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 06:09:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nCiyO-00EcSP-TH;
	Wed, 26 Jan 2022 16:08:32 +0200
Date: Wed, 26 Jan 2022 16:08:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Phillip Potter <phil@philpotter.co.uk>,
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFV4EJosayH+e6C@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 26, 2022 at 02:46:08PM +0100, Javier Martinez Canillas wrote:
> On 1/26/22 14:12, Andy Shevchenko wrote:
> > On Wed, Jan 26, 2022 at 12:26:36PM +0100, Greg Kroah-Hartman wrote:
> >> On Wed, Jan 26, 2022 at 12:17:08PM +0100, Helge Deller wrote:
> >>> On 1/26/22 11:31, Daniel Vetter wrote:
> > 
> > ...
> > 
> >>> You are describing a transitioning over to DRM - which is Ok.
> >>> But on that way there is no need to ignore, deny or even kill usage scenarios
> >>> which are different compared to your usage scenarios (e.g. embedded devices,
> >>> old platforms, slow devices, slow busses, no 3D hardware features,
> >>> low-color devices, ...).
> >>
> >> All of those should be handled by the drm layer, as Daniel keeps
> >> pointing out.  If not, then the tinydrm layer needs to be enhanced to do
> >> so.
> >>
> >> Anyone have a pointer to hardware I can buy that is one of these fbtft
> >> drivers that I could do a port to drm to see just how much work is
> >> really needed here?
> > 
> > I have bought myself (for other purposes, I mean not to convert the driver(s))
> > SSD1306 based display (SPI), SSD1331 (SPI), HX88347d (parallel).
> >
> 
> I've just bought a SSD1306 (I2C) based one and will attempt to write a DRM
> driver using drivers/staging/fbtft/fb_ssd1306.c as a reference.

You should take ssd1307fb.c instead. And basically create a MIPI based driver
for I2C. Then we won't go same road again for other similar devices.

> I didn't find one with a SPI interface but we can later add a transport for
> that if I succeed.

-- 
With Best Regards,
Andy Shevchenko


