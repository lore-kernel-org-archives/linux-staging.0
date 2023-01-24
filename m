Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB08410F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 10:39:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353538614"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="353538614"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="990829328"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="990829328"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2023 02:39:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKGhu-00EIKz-2W;
	Tue, 24 Jan 2023 12:39:14 +0200
Date: Tue, 24 Jan 2023 12:39:14 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 37/57] media: atomisp: ov2680: Drop unused res member
 from struct ov2680_device
Message-ID: <Y8+1UoOHJHsuiW5p@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-38-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-38-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:45PM +0100, Hans de Goede wrote:
> The res member of struct ov2680_device isn't read anywhere anymore,
> drop it.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 5 -----
>  drivers/staging/media/atomisp/i2c/ov2680.h         | 1 -
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index dee6eb3d8c63..09c260ac93bf 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -548,10 +548,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  
>  	/* Restore value of all ctrls */
>  	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
> -	if (ret < 0)
> -		goto err;
> -
> -	dev->res = res;
>  err:
>  	mutex_unlock(&dev->input_lock);
>  	return ret;
> @@ -839,7 +835,6 @@ static int ov2680_probe(struct i2c_client *client)
>  	mutex_init(&dev->input_lock);
>  
>  	dev->client = client;
> -	dev->res = &ov2680_res_preview[0];
>  	v4l2_i2c_subdev_init(&dev->sd, client, &ov2680_ops);
>  
>  	pdata = gmin_camera_platform_data(&dev->sd,
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index 4c1d20f514b2..e9d0c84705fb 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -180,7 +180,6 @@ struct ov2680_device {
>  	struct media_pad pad;
>  	struct mutex input_lock;
>  	struct i2c_client *client;
> -	struct ov2680_resolution *res;
>  	struct camera_sensor_platform_data *platform_data;
>  	bool power_on;
>  	bool is_streaming;
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


