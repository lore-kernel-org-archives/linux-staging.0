Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E9D7A
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646298582; x=1677834582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OnJVXfIxBJCa2zbcrSYYMyJc+X5r5JG+8hWCDRkOLX0=;
  b=NwFyQ3IhRQYwhIS0aP6Bzu/F0ZUHgwAlfXBUoYLuyR+0OL+E4ZaJSH6i
   aMwg/PcGRHZbJg+73MFs3SYOznbgSgkQxEzyLw3HnPtGRgrLnD69iXnlF
   46IRPobWfBSMRrNlq225n/IaniWNJraLvT1TtFV65NIqvkurXSc6HsZAz
   cLcYgu7OYCMx+15RBffqwo4OxTVz84mU2EwINa8MxPUqQuQ6YWPez6Wmc
   NKk8qUcXGJ2Veq3SsRLsUV5smt7tfb/+HGJmH0iAx7YODPBH0HXA9h/G6
   dWT3/1kduBBaUs+PA/oprNpJCI6cQ6rPaKfd09qk5RXoETPJAWUMmaqdX
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253552505"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253552505"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 01:09:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535747413"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 01:09:39 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 3B1C320090;
	Thu,  3 Mar 2022 11:09:37 +0200 (EET)
Date: Thu, 3 Mar 2022 11:09:37 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 1/1] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
Message-ID: <YiCF0Ze+mPxYQ2NP@paasikivi.fi.intel.com>
References: <20220223090648.41989-1-hpa@redhat.com>
 <20220223090648.41989-2-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223090648.41989-2-hpa@redhat.com>

Hi Kate,

Thank you for the patch.

On Wed, Feb 23, 2022 at 05:06:48PM +0800, Kate Hsuan wrote:
> For the AF configuration, if the rightmost stripe is used, the AF scene
> will be at the incorrect location of the sensor.
> 
> The AF coordinate may be set to the right part of the sensor. This
> configuration would lead to x_start being greater than the
> down_scaled_stripes offset and the leftmost stripe would be disabled
> and only the rightmost stripe is used to control the AF coordinate. If
> the x_start doesn't perform any adjustments, the AF coordinate will be
> at the wrong place of the sensor since down_scaled_stripes offset
> would be the new zero of the coordinate system.
> 
> In this patch, if only the rightmost stripe is used, x_start should
> minus down_scaled_stripes offset to maintain its correctness of AF
> scene coordinate.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css-params.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index d9e3c3785075..efe4de8ef205 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -2556,6 +2556,14 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>  		/* Enable only for rightmost stripe, disable left */
>  		acc->af.stripes[0].grid_cfg.y_start &=
>  			~IPU3_UAPI_GRID_Y_START_EN;
> +		acc->af.stripes[0].grid_cfg.x_start -=
> +			acc->stripe.down_scaled_stripes[1].offset;
> +		acc->af.stripes[0].grid_cfg.x_end -=
> +			acc->stripe.down_scaled_stripes[1].offset;
> +		acc->af.stripes[1].grid_cfg.x_start -=
> +			acc->stripe.down_scaled_stripes[1].offset;
> +		acc->af.stripes[1].grid_cfg.x_end -=
> +			acc->stripe.down_scaled_stripes[1].offset;

The grid x/y ends are calculated from the width when both grids are enabled
and I think it should work the same way here. There's also masking of the
bits that aren't in use.

The first stripe isn't enabled so changing values there has no effect as
far as I can tell.

Looking at the code a little, it seems all awb_fr, ae and af seem to suffer
from the same issue. Let's still iron out the fix for af first before
considering those.

>  	} else if (acc->af.config.grid_cfg.x_end <=
>  		   acc->stripe.bds_out_stripes[0].width - min_overlap) {
>  		/* Enable only for leftmost stripe, disable right */
> @@ -2563,7 +2571,6 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>  			~IPU3_UAPI_GRID_Y_START_EN;
>  	} else {
>  		/* Enable for both stripes */
> -
>  		acc->af.stripes[0].grid_cfg.width =
>  			(acc->stripe.bds_out_stripes[0].width - min_overlap -
>  			 acc->af.config.grid_cfg.x_start + 1) >>

-- 
Kind regards,

Sakari Ailus
