Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0800C8479
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 17:55:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388456420"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="388456420"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 09:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663755898"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663755898"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 09:55:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK12J-00DrQY-07;
	Mon, 23 Jan 2023 19:55:15 +0200
Date: Mon, 23 Jan 2023 19:55:14 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 22/57] media: atomisp: Add
 atomisp_register_sensor_no_gmin() helper
Message-ID: <Y87KAn/5BO7jIWb4@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-23-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-23-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:30PM +0100, Hans de Goede wrote:
> The DSDT of all Windows BYT / CHT devices which I have seen has proper
> ACPI powermagement for the clk and regulators used by the sensors.
> 
> So there is no need for the whole custom atomisp_gmin custom code to
> disable the ACPI pm and directly poke at the PMIC for this.
> 
> Add new atomisp_register_sensor_no_gmin() + atomisp_unregister_subdev()
> helpers which allow registering a sensor with the atomisp code without
> using any of the atomisp_gmin power-management code.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../atomisp/include/linux/atomisp_platform.h  |  4 ++
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 61 +++++++++++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> index 82973aa0e1eb..539b21d39d3b 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> @@ -211,6 +211,10 @@ struct camera_mipi_info {
>  };
>  
>  const struct atomisp_platform_data *atomisp_get_platform_data(void);
> +int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
> +				    enum atomisp_input_format format,
> +				    enum atomisp_bayer_order bayer_order);
> +void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
>  
>  /* API from old platform_camera.h, new CPUID implementation */
>  #define __IS_SOC(x) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 234088711f29..1e943c423893 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1082,6 +1082,67 @@ static int gmin_csi_cfg(struct v4l2_subdev *sd, int flag)
>  	return 0;
>  }
>  
> +int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
> +				    enum atomisp_input_format format,
> +				    enum atomisp_bayer_order bayer_order)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(subdev);
> +	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	int i, ret, clock_num, port = 0;
> +
> +	if (adev) {
> +		/* Get ACPI _PR0 derived clock to determine the csi_port default */
> +		if (acpi_device_power_manageable(adev)) {
> +			clock_num = atomisp_get_acpi_power(&client->dev);
> +
> +			/* Compare clock to CsiPort 1 pmc-clock used in the CHT/BYT reference designs */
> +			if (IS_ISP2401)
> +				port = clock_num == 4 ? 1 : 0;
> +			else
> +				port = clock_num == 0 ? 1 : 0;
> +		}
> +
> +		port = gmin_get_var_int(&client->dev, false, "CsiPort", port);
> +		lanes = gmin_get_var_int(&client->dev, false, "CsiLanes", lanes);
> +	}
> +
> +	for (i = 0; i < MAX_SUBDEVS; i++)
> +		if (!pdata.subdevs[i].type)
> +			break;
> +
> +	if (i >= MAX_SUBDEVS) {
> +		dev_err(&client->dev, "Error too many subdevs already registered\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = camera_sensor_csi_alloc(subdev, port, lanes, format, bayer_order);
> +	if (ret)
> +		return ret;
> +
> +	pdata.subdevs[i].type = RAW_CAMERA;
> +	pdata.subdevs[i].port = port;
> +	pdata.subdevs[i].subdev = subdev;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(atomisp_register_sensor_no_gmin);
> +
> +void atomisp_unregister_subdev(struct v4l2_subdev *subdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < MAX_SUBDEVS; i++) {
> +		if (pdata.subdevs[i].subdev != subdev)
> +			continue;
> +
> +		camera_sensor_csi_free(subdev);
> +		pdata.subdevs[i].subdev = NULL;
> +		pdata.subdevs[i].type = 0;
> +		pdata.subdevs[i].port = 0;
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(atomisp_unregister_subdev);
> +
>  static struct camera_vcm_control *gmin_get_vcm_ctrl(struct v4l2_subdev *subdev,
>  	char *camera_module)
>  {
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


