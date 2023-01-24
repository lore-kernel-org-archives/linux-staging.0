Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EBA10F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 10:48:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328357326"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="328357326"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907440171"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="907440171"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2023 02:48:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKGqP-00EIXr-2M;
	Tue, 24 Jan 2023 12:48:01 +0200
Date: Tue, 24 Jan 2023 12:48:01 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 43/57] media: atomisp: ov2680: Drop MAX_FMTS define
Message-ID: <Y8+3YQMmMwPDS/Q0@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-44-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-44-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:51PM +0100, Hans de Goede wrote:
> The ov2680 only supports a single format, there is no need to
> use a define for this.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

(One nit-pick below)

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 2 +-
>  drivers/staging/media/atomisp/i2c/ov2680.h         | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 81fd36b09090..994b6fe40069 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -687,7 +687,7 @@ static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->index >= MAX_FMTS)
> +	if (code->index)

Perhaps a comment above?

	/* We support only a single format */

>  		return -EINVAL;
>  
>  	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index 189d1b2b7584..5aa46f669715 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -46,8 +46,6 @@
>  
>  #define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
>  
> -#define MAX_FMTS		1
> -
>  #define OV2680_INTEGRATION_TIME_MARGIN	8
>  #define OV2680_ID	0x2680
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


