Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0886A10F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 10:46:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314168539"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="314168539"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="835920488"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="835920488"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2023 02:46:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKGoi-00EIVH-0R;
	Tue, 24 Jan 2023 12:46:16 +0200
Date: Tue, 24 Jan 2023 12:46:15 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 41/57] media: atomisp: ov2680: Fix frame_size list
Message-ID: <Y8+29/sVriYtlUTx@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-42-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-42-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:49PM +0100, Hans de Goede wrote:
> 3 fixes for the framesize list:
> 
> 1. Drop modes < 640x480, these are made by significant cropping,
>    leading to such a small remainig field-of-view that they are
>    not really usable

Wondering if we have an algo to actually scale instead of crop.

> 2. 1616x1082 is presumably intended to be 1600x1080 + 16 pixels
>    padding in both dimensions, but the height is wrong.
>    Change this to 1616x1096.
> 
> 3. The 800x600 mode is missing the 16 pixels padding and
>    720x592 is missing 16 pixels padding in its width and
>    the 720x576 base mode is a mode with non square pixels,
>    while the sensor has square pixels.
>    Replace both with 768x576 + 16 pixels padding -> 784x592

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 432539dd274c..81fd36b09090 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -700,17 +700,13 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
>  {
>  	static const struct v4l2_frmsize_discrete ov2680_frame_sizes[] = {
>  		{ 1616, 1216 },
> -		{ 1616, 1082 },
> +		{ 1616, 1096 },
>  		{ 1616,  916 },
>  		{ 1456, 1096 },
>  		{ 1296,  976 },
>  		{ 1296,  736 },
> -		{  800,  600 },
> -		{  720,  592 },
> +		{  784,  592 },
>  		{  656,  496 },
> -		{  336,  256 },
> -		{  352,  288 },
> -		{  176,  144 },
>  	};
>  	int index = fse->index;
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


