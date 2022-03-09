Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9E48C1
	for <linux-staging@lists.linux.dev>; Wed,  9 Mar 2022 17:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646845365; x=1678381365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OkzOLsVy4bRJDx790ntahgYsXuWH4OdPbeR3N+MAs4w=;
  b=GNXFeBz4mJYBWVVl7d+6LEx8WE7P3EdaGQHOUDiJfVN1rtsOEpMWp7Q3
   xvN68u7B/v6VF1qdhGe9L7bdER6tWRSH0wb3oZ11XSSjRdtiF+mpDhhuM
   ylbGpDFuqnkvySqDhOqamTKhBQ3xg2SgLgVr3Jx9pupUCpAxyOGE7Artz
   86WQFjpznRXGoD3RuP/0PU5kabDj9qiLCvWNcNix3VVC8n2I3zhG5b+SI
   R24/PAyADsuOqG2OfMc2ATAng4+1P98ZHRZP7PslpwCDrSuDkYamQauGs
   rGV7L24AsI9ZE6Gfgob/Tihdz6a6JZqv7Sl4o4bkiBv4hbmnpCOvnnkm1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="253860012"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="253860012"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 08:50:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="644096964"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 08:50:39 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 711152051A;
	Wed,  9 Mar 2022 18:50:37 +0200 (EET)
Date: Wed, 9 Mar 2022 18:50:37 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v2] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
Message-ID: <Yija3YQ55gvCtKdR@paasikivi.fi.intel.com>
References: <20220309063456.102895-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309063456.102895-1-hpa@redhat.com>

Hi Kate,

Thanks for the update.

On Wed, Mar 09, 2022 at 02:34:56PM +0800, Kate Hsuan wrote:
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
> Changes in v2:
> 1. Remove the setting of the first stripe.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css-params.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index d9e3c3785075..5a8c07f34756 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -2556,6 +2556,10 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>  		/* Enable only for rightmost stripe, disable left */
>  		acc->af.stripes[0].grid_cfg.y_start &=
>  			~IPU3_UAPI_GRID_Y_START_EN;
> +		acc->af.stripes[1].grid_cfg.x_start -=
> +			acc->stripe.down_scaled_stripes[1].offset;
> +		acc->af.stripes[1].grid_cfg.x_end -=
> +			acc->stripe.down_scaled_stripes[1].offset;

Could you calculate these the same way as in the case both stripes are
enabled? Some bits in x_start is masked and then x_end is calculated from
width.

>  	} else if (acc->af.config.grid_cfg.x_end <=
>  		   acc->stripe.bds_out_stripes[0].width - min_overlap) {
>  		/* Enable only for leftmost stripe, disable right */

-- 
Regards,

Sakari Ailus
