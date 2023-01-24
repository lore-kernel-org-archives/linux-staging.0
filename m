Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A7D10F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 10:43:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323961369"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="323961369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694291106"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="694291106"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2023 02:43:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKGm2-00EIQz-0e;
	Tue, 24 Jan 2023 12:43:30 +0200
Date: Tue, 24 Jan 2023 12:43:29 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 39/57] media: atomisp: ov2680: Drop
 v4l2_find_nearest_size() call from set_fmt()
Message-ID: <Y8+2Uc246MDX8g5l@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-40-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-40-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:47PM +0100, Hans de Goede wrote:
> Since we now calculate timings baded on the desired width and height,
> any width and height are valid as long as they don't exceed the sensor's
> dimensions.
> 
> Drop the v4l2_find_nearest_size() call and instead clamp the requested
> width and height.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 75d09c44202c..3d5e18fb45ee 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -512,7 +512,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	struct ov2680_device *dev = to_ov2680_sensor(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *fmt;
> -	struct ov2680_resolution *res;
> +	unsigned int width, height;
>  	int ret = 0;
>  
>  	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
> @@ -520,14 +520,11 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  		(format->which == V4L2_SUBDEV_FORMAT_TRY) ? "try" : "set",
>  		format->pad, fmt);
>  
> -	res = v4l2_find_nearest_size(ov2680_res_preview, ARRAY_SIZE(ov2680_res_preview),
> -				     width, height,
> -				     format->format.width, format->format.height);
> -	if (!res)
> -		res = &ov2680_res_preview[N_RES_PREVIEW - 1];
> +	width = min_t(unsigned int, ALIGN(format->format.width, 2), OV2680_NATIVE_WIDTH);
> +	height = min_t(unsigned int, ALIGN(format->format.height, 2), OV2680_NATIVE_HEIGHT);
>  
>  	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
> -	ov2680_fill_format(dev, fmt, res->width, res->height);
> +	ov2680_fill_format(dev, fmt, width, height);
>  
>  	format->format = *fmt;
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


