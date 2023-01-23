Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5793224
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 17:52:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388455598"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="388455598"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 09:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="835669952"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="835669952"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 23 Jan 2023 09:51:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK0z5-00DrKz-0P;
	Mon, 23 Jan 2023 19:51:55 +0200
Date: Mon, 23 Jan 2023 19:51:54 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 20/57] media: atomisp: Fix regulator registers on BYT
 devices with CRC PMIC
Message-ID: <Y87JOjTFwbZwK/R5@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-21-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-21-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:28PM +0100, Hans de Goede wrote:
> The Crystal Cove PMIC used on some BYT/CHT devices has different revisions
> when paired with Bay Trail (BYT) vs Cherry Trail (CHT) SoCs.
> 
> The current hardcoded values are only valid for CHT devices, change
> the code so that it uses the correct register values on both BYT and CHT.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
One nit-pick below.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 3d41fab661cf..6116d3c62315 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -57,8 +57,10 @@ enum clock_rate {
>  #define LDO_1P8V_OFF	0x58 /* ... bottom bit is "enabled" */
>  
>  /* CRYSTAL COVE PMIC register set */
> -#define CRYSTAL_1P8V_REG	0x57
> -#define CRYSTAL_2P8V_REG	0x5d
> +#define CRYSTAL_BYT_1P8V_REG	0x5d
> +#define CRYSTAL_BYT_2P8V_REG	0x66
> +#define CRYSTAL_CHT_1P8V_REG	0x57
> +#define CRYSTAL_CHT_2P8V_REG	0x5d
>  #define CRYSTAL_ON		0x63
>  #define CRYSTAL_OFF		0x62

I would split to groups like this

#define CRYSTAL_BYT_1P8V_REG	0x5d
#define CRYSTAL_BYT_2P8V_REG	0x66

#define CRYSTAL_CHT_1P8V_REG	0x57
#define CRYSTAL_CHT_2P8V_REG	0x5d

#define CRYSTAL_ON		0x63
#define CRYSTAL_OFF		0x62

> @@ -843,6 +845,7 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
>  	struct gmin_subdev *gs = find_gmin_subdev(subdev);
>  	int ret;
>  	int value;
> +	int reg;
>  
>  	if (!gs || gs->v1p8_on == on)
>  		return 0;
> @@ -898,10 +901,15 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
>  				     LDO10_REG, value, 0xff);
>  		break;
>  	case PMIC_CRYSTALCOVE:
> +		if (IS_ISP2401)
> +			reg = CRYSTAL_CHT_1P8V_REG;
> +		else
> +			reg = CRYSTAL_BYT_1P8V_REG;
> +
>  		value = on ? CRYSTAL_ON : CRYSTAL_OFF;
>  
>  		ret = gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
> -				     CRYSTAL_1P8V_REG, value, 0xff);
> +				     reg, value, 0xff);
>  		break;
>  	default:
>  		dev_err(subdev->dev, "Couldn't set power mode for v1p8\n");
> @@ -918,6 +926,7 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
>  	struct gmin_subdev *gs = find_gmin_subdev(subdev);
>  	int ret;
>  	int value;
> +	int reg;
>  
>  	if (WARN_ON(!gs))
>  		return -ENODEV;
> @@ -974,10 +983,15 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
>  				     LDO9_REG, value, 0xff);
>  		break;
>  	case PMIC_CRYSTALCOVE:
> +		if (IS_ISP2401)
> +			reg = CRYSTAL_CHT_2P8V_REG;
> +		else
> +			reg = CRYSTAL_BYT_2P8V_REG;
> +
>  		value = on ? CRYSTAL_ON : CRYSTAL_OFF;
>  
>  		ret = gmin_i2c_write(subdev->dev, gs->pwm_i2c_addr,
> -				     CRYSTAL_2P8V_REG, value, 0xff);
> +				     reg, value, 0xff);
>  		break;
>  	default:
>  		dev_err(subdev->dev, "Couldn't set power mode for v2p8\n");
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


