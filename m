Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40EA4F
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 09:14:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="399800445"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="399800445"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:14:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="643246585"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="643246585"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2022 01:14:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ox2sl-00FC7R-21;
	Mon, 21 Nov 2022 11:14:27 +0200
Date: Mon, 21 Nov 2022 11:14:27 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/20] media: atomisp: Move calling of css_[un]init() to
 power_on()/_off()
Message-ID: <Y3tBc4u/oZ6jacrm@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-18-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120224101.746199-18-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Nov 20, 2022 at 11:40:58PM +0100, Hans de Goede wrote:
> atomisp_css_init() is always called after calling atomisp_power_on()
> either directly or through getting a runtime-pm reference.
> 
> Likewise atomisp_css_uninit() is always called after calling
> atomisp_power_off().
> 
> Move the call site of these 2 functions to inside atomisp_power_on() /
> atomisp_power_off() to make this more explicit.

...

>  	dev_dbg(isp->dev, "%s\n", __func__);
> -	atomisp_css_uninit(isp);
> +
>  	ret = atomisp_power_off(isp->dev);
>  	if (ret < 0)
>  		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
>  
>  	ret = atomisp_power_on(isp->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dev_err(isp->dev, "atomisp_power_on failed, %d\n", ret);
> -
> -	ret = atomisp_css_init(isp);
> -	if (ret)

>  		isp->isp_fatal_error = true;

This was only set when css_init() failed, now it may be set even when
power_on() fails. Why is it not a problem? Commit message doesn't shed
a light on this change.

> +	}

-- 
With Best Regards,
Andy Shevchenko


