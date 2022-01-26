Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109762CA8
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643206277; x=1674742277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=37Crpy1HQSpJjEfNxm/BR1LrwtVeACM1zBGmbeLzZvQ=;
  b=F8afU2S3R5K+5/UQbgx/go3ygJcEamyfrAXucPSKHzXFcNZ8fw/I5hi1
   DjWHhsVn+U++Uio0d3hD7a4nGuqMlfE+UyEFVwxeGMQD5xlvfV5CvqUYv
   uMQBXxt1N3W/DLY+3pJyvTydSyFnUBkhqtWiXCZLK64f1lMnVKE+xn3FB
   RIsxInJkeWH8ZGTvWzCda8zHgv2FKSBYhVtq5QUVwCoKo/Rf+ENvHXHR9
   G7J0RF5rGEs5Wh2bFYR05oUctdTfb1uw1hD/pHLy4kNi8hlmgVZpJ5Bty
   1qaI364G3gEuYo3x3yvIZTtYgZ7lssN7ekDZ4idBO2Uq81ckK8b/A/6Cz
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230129209"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="230129209"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 06:11:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="696250344"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 06:11:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nCizu-00EcTp-VD;
	Wed, 26 Jan 2022 16:10:06 +0200
Date: Wed, 26 Jan 2022 16:10:06 +0200
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
Message-ID: <YfFWPmG2D093gz4N@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfFV4EJosayH+e6C@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 26, 2022 at 04:08:32PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 02:46:08PM +0100, Javier Martinez Canillas wrote:
> > On 1/26/22 14:12, Andy Shevchenko wrote:

...

> > I've just bought a SSD1306 (I2C) based one and will attempt to write a DRM
> > driver using drivers/staging/fbtft/fb_ssd1306.c as a reference.
> 
> You should take ssd1307fb.c instead. And basically create a MIPI based driver
> for I2C. Then we won't go same road again for other similar devices.

For the record it supports your device:

static const struct i2c_device_id ssd1307fb_i2c_id[] = {
{ "ssd1305fb", 0 },
{ "ssd1306fb", 0 },
{ "ssd1307fb", 0 },
{ "ssd1309fb", 0 },


-- 
With Best Regards,
Andy Shevchenko


