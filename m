Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3442CA8
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643202926; x=1674738926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5iUtFO+EhpHndQGOg3UJPsNAroHVFCQnJAjNbMjiMGc=;
  b=RBh8k1PrR7YqKwEVSOe+Nlf5Vn3jmCWw/xqCDmWK4jQia3nG8xLgldQz
   ici/3UHd7DlrGBc1zIHS+6eTMMiU6U4SDD4RCVu81mWzD29XLVHlSyYCE
   4tHTNESFOti4cI8opOkYa1576uzW3XxyC0fBAEXM2f1L3AvDIpxOH0uHy
   hFUpMByxVrc84MHMThWVUjEeXPq/Yi88EYW/lRO2/azdopbwFDTXqI/im
   ZQjF/wks57Mqk0Uv0fuJ1CpC20cQjNSdVdPHYf36bvHnFpfy4Rn0XIS1D
   XBcRv9kzwkcO9fWAVslbt72aaAhL5liKgCL9TaXezc3mJ+/y9m2tFGh9O
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309860072"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="309860072"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:15:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="597459271"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 05:15:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nCi5k-00EbXE-U5;
	Wed, 26 Jan 2022 15:12:04 +0200
Date: Wed, 26 Jan 2022 15:12:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
	Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Phillip Potter <phil@philpotter.co.uk>,
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <YfEv7OQs98O9wJdJ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfEv7OQs98O9wJdJ@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 26, 2022 at 12:26:36PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 26, 2022 at 12:17:08PM +0100, Helge Deller wrote:
> > On 1/26/22 11:31, Daniel Vetter wrote:

...

> > You are describing a transitioning over to DRM - which is Ok.
> > But on that way there is no need to ignore, deny or even kill usage scenarios
> > which are different compared to your usage scenarios (e.g. embedded devices,
> > old platforms, slow devices, slow busses, no 3D hardware features,
> > low-color devices, ...).
> 
> All of those should be handled by the drm layer, as Daniel keeps
> pointing out.  If not, then the tinydrm layer needs to be enhanced to do
> so.
> 
> Anyone have a pointer to hardware I can buy that is one of these fbtft
> drivers that I could do a port to drm to see just how much work is
> really needed here?

I have bought myself (for other purposes, I mean not to convert the driver(s))
SSD1306 based display (SPI), SSD1331 (SPI), HX88347d (parallel).

Each of them costed less than $10 with delivery to EU (nowadays maybe a bit
more expensive). I believe it's very easy to find the links on AliExpress.

-- 
With Best Regards,
Andy Shevchenko


