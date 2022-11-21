Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55FD63AA
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669037505; x=1700573505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ceh0DaFQWSL4oJtGHDPdZNHSDLWu93eSVmt8Lic6F1g=;
  b=lWocZUdjZibHHe+AGZs5UiYZ+DGNUvn3hmIdRXkWC4jRemkQrLgwm1Jy
   YDrDgtsW1jP0I6wewFNIH5jN7Vtn7NhQvqFzAE2ibdjwxn755UGrj1qGm
   qr/dXZYy7Kxirfl7hWjQz7/AFVTvMtZAowMijBtuOFSyUzMuljZckBJa8
   e8xoLRzHEG7ZbpIbK1B4yQuDdi/d4TbgQT9vayjZcfo1smEFQ0+oE4/3N
   C+hZAALMGT/dhsCfKw5m3cFCHp1A3Aobr3mEVKcAUHy+fz3dVLwtrCAbO
   FigtQKSReIf1u8RvNwIxdyFrIIoPrP5p7o1KO71f2BCXy/Clgu+zOoe4m
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="293945697"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="293945697"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 05:31:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="643320284"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="643320284"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2022 05:31:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ox6tY-00FI8e-2N;
	Mon, 21 Nov 2022 15:31:32 +0200
Date: Mon, 21 Nov 2022 15:31:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] atomisp: Make bds_factors_list be type of struct
 u32_fract
Message-ID: <Y3t9tNlXZCHcw4jd@smile.fi.intel.com>
References: <20221118184309.60834-1-andriy.shevchenko@linux.intel.com>
 <837c5412-5019-c78a-d890-7fedd4064a9e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <837c5412-5019-c78a-d890-7fedd4064a9e@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 21, 2022 at 02:21:30PM +0100, Hans de Goede wrote:
> On 11/18/22 19:43, Andy Shevchenko wrote:

...

> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> I've added this to my media-atomisp branch now and will
> include this in the pull-req which I will send to Mauro after I've
> run some quick tests (tonight or tomorrow).

Thank you!

...

> >  	res->sc_bayer_origin_x_bqs_on_shading_table =
> >  		((left_padding_adjusted_bqs + bad_bqs_on_left_before_bs)
> > -		* bs_hor_ratio_out + bs_hor_ratio_in / 2) / bs_hor_ratio_in
> > +		* bds.denominator + bds.numerator / 2) / bds.numerator
> >  		+ bad_bqs_on_left_after_bs;
> > -	/* "+ bs_hor_ratio_in/2": rounding for division by bs_hor_ratio_in */
> > +	/* "+ bds.numerator / 2": rounding for division by bds.numerator */
> >  	res->sc_bayer_origin_y_bqs_on_shading_table =
> > -		(bad_bqs_on_top_before_bs * bs_ver_ratio_out + bs_ver_ratio_in / 2) / bs_ver_ratio_in
> > +		(bad_bqs_on_top_before_bs * bds.denominator + bds.numerator / 2) / bds.numerator
> >  		+ bad_bqs_on_top_after_bs;
> > -	/* "+ bs_ver_ratio_in/2": rounding for division by bs_ver_ratio_in */
> > +	/* "+ bds.numerator / 2": rounding for division by bds.numerator */

While reading this code again I just realized this is open coded
DIV_ROUND_CLOSEST(). But, thinking more, I believe we may rather introduce
the FRACT_DIV_ROUND_CLOSEST() macro in the math.h and take struct *_fract
as a parameter. In any case, it's for the future improvements.

-- 
With Best Regards,
Andy Shevchenko


