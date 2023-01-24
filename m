Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7C10F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 10:42:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353538952"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="353538952"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:42:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="990829864"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="990829864"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2023 02:42:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKGko-00EIP5-0Z;
	Tue, 24 Jan 2023 12:42:14 +0200
Date: Tue, 24 Jan 2023 12:42:13 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 38/57] media: atomisp: ov2680: Fix
 ov2680_enum_frame_interval()
Message-ID: <Y8+2BQVCPGs8nJ0P@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-39-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-39-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:46PM +0100, Hans de Goede wrote:
> Fix and simplify ov2680_enum_frame_interval(), the index is not
> an index into ov2680_res_preview[], so using N_PREVIEW is wrong.
> 
> Instead it is an index indexing the different framerates for
> the resolution specified in fie->width, fie->height.
> 
> Since the ov2680 code only supports a single fixed 30 fps,
> index must always be 0 and we don't need to check the other
> fie input values.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/i2c/atomisp-ov2680.c    | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 09c260ac93bf..75d09c44202c 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -718,19 +718,12 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_state *sd_state,
>  				      struct v4l2_subdev_frame_interval_enum *fie)
>  {
> -	struct v4l2_fract fract;
> -
> -	if (fie->index >= N_RES_PREVIEW ||
> -	    fie->width > ov2680_res_preview[0].width ||
> -	    fie->height > ov2680_res_preview[0].height ||
> -	    fie->which > V4L2_SUBDEV_FORMAT_ACTIVE)
> +	/* Only 1 framerate */
> +	if (fie->index)
>  		return -EINVAL;
>  
> -	fract.numerator = 1;
> -	fract.denominator = OV2680_FPS;
> -
> -	fie->interval = fract;
> -
> +	fie->interval.numerator = 1;
> +	fie->interval.denominator = OV2680_FPS;
>  	return 0;
>  }
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


