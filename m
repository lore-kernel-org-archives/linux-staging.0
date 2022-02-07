Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4322F28
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644237134; x=1675773134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vhBTmSn8UkwEjJUl4ynGb5kIz8nOXSvEwd6JGQ6YNy8=;
  b=nQj5f4zU2qvuH87V/k29DlrxBW4MIBjgMTiJupWdzuvYyBr81db0gBiO
   YxRqCYZB8qL+HMGVDo07ZxrKBL687WNGLEA3m49QXR01TgOLjg3UOWp0f
   XpgxK8bh69V+KE+CfiHmGVnHIEmXukTTr77Cm+j28xtrZ5Zuc+h4NpINq
   0px+PjLVFKWZDovuIH4lQhvLbus+EKLcw+hQQbsA78jEtnYZWuSaSSEg1
   KiygOQFVgICLdEYn4Q464TVSgZMg78sMlhHUBczzphQ14cM/iBRTJsR8Z
   gcbsY4chaSl5eZAqTOIL8Oe+kIaYcJa8w4NPvkXpPUVTX1ERMEBUaN/YC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="335108462"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="335108462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 04:32:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="621535538"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 04:32:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nH3Al-001tq2-Md;
	Mon, 07 Feb 2022 14:31:11 +0200
Date: Mon, 7 Feb 2022 14:31:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Cc: gregkh@linuxfoundation.org, joe@perches.com, kitakar@gmail.com,
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com, dan.carpenter@oracle.com
Subject: Re: [PATCH] staging: media: atomisp: Use GENMASK instead of manual
 masking
Message-ID: <YgERD7JdlqdaNHuA@smile.fi.intel.com>
References: <20220206185830.39360-1-mosescb.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206185830.39360-1-mosescb.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Feb 06, 2022 at 07:58:30PM +0100, Moses Christopher Bollavarapu wrote:
> There is a GENMASK macro available in linux/bits.h, for masking.
> 
> Example: GENMASK(3, 0) = 0b00001111 (same as (1 << 4) - 1)

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index 1173be0e72b0..a345fa1d7de9 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -40,6 +40,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/pm_runtime.h>

> +#include <linux/bits.h>

Probably this can be still ordered.

>  /* Assume max number of ACC stages */
>  #define MAX_ACC_STAGES	20
> @@ -1913,11 +1914,11 @@ void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
>  			    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_config;
>  		s_config->mode = IA_CSS_INPUT_MODE_TPG;
>  		s_config->source.tpg.mode = IA_CSS_TPG_MODE_CHECKERBOARD;
> -		s_config->source.tpg.x_mask = (1 << 4) - 1;
> +		s_config->source.tpg.x_mask = GENMASK(3, 0);
>  		s_config->source.tpg.x_delta = -2;
> -		s_config->source.tpg.y_mask = (1 << 4) - 1;
> +		s_config->source.tpg.y_mask = GENMASK(3, 0);
>  		s_config->source.tpg.y_delta = 3;
> -		s_config->source.tpg.xy_mask = (1 << 8) - 1;
> +		s_config->source.tpg.xy_mask = GENMASK(7, 0);
>  		return;
>  	}
>  
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


