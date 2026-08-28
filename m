Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1E3442361
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917083; cv=none; b=aC8hj3rKpGlBefFK5Mq5ogreyWvl+KtIuw4roAMqeNEgp/PetUwqYbGhGdvjdlGSzxWilDYEzGWjHsG0QSrF6BdzYDcyEZxjz7iQwtWy5uz6xrXbeBN4kdHhADSBl5tOTbidBe9+VC/qshls4LOXMGbBYwkGNWYQELBTqKmorVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917083; c=relaxed/simple;
	bh=Z9IHyKtyTnJMPi/IsvCp12vBIlgHHcESJmEHEb458ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtEPw9ic/5zwd5SgeeM1zD2hEC2unaw+D7y6bkyBfCuM3XHBuSqKYn3zHaBfMgwVTQmW9glbdnupnTyONVdMnJXyjylIFCq0DgMtL7KxUZoDZKhV6lWrujH248eAfebNHuBpioEYHd8tDqQL7TZIymlJ9OG0qYHNgw9/wf8PY0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kftuzvnX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kftuzvnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787917069; x=1819453069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z9IHyKtyTnJMPi/IsvCp12vBIlgHHcESJmEHEb458ko=;
  b=kftuzvnXoEQM9MbwTpImLYKuUu0mFoJcQZCmaPjWZ1zjsm1XuafINacx
   33jZqZUYq0a16K4hyoHhmjaRuQ9vfQCPUGfk5qr/PoFmN4tmWS8pOiM+o
   vp9Mw9oCBKzti8iLjiFfynVr4U5WHZKTUytnBSGQO0NgVf36XraXpFVVg
   yL0iNwDgKBXjIHtzRZDsEoGeGs1xmOIZsqoAY6DW4qLwHjflS5+2Pu8/j
   933TvV0AttDrXjrnXuNEODxsFSiJXB1q62IrcV7s0BDGKUjoYBjwZsiF1
   XmfsMgFj95NiVsDNnWQYs18zniTibngiajBD4/lfu68qfcSq7NuD32HPL
   w==;
X-CSE-ConnectionGUID: BxcQUu5zSayoqGjQM/tqcA==
X-CSE-MsgGUID: G/Sgpkf8TKCq7hrhXJzeaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="98758967"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="98758967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:37:45 -0700
X-CSE-ConnectionGUID: 3/eUYj/mRcqo1WddWEUX5g==
X-CSE-MsgGUID: +rsq/3uNQJiwrrp7h0ND2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="264362029"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:37:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BA8F311F817;
	Fri, 28 Aug 2026 14:37:37 +0300 (EEST)
Date: Fri, 28 Aug 2026 14:37:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] media: atomisp: support the Yoga Book OV2740
 link
Message-ID: <apFzAc5XfV9gQpXS@kekkonen.localdomain>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-9-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-9-mauriziocasciano7@gmail.com>

Hi Maurizio,

On Thu, Aug 27, 2026 at 08:17:53PM +0200, Maurizio Casciano wrote:
> The YB1-X91L firmware does not describe the complete camera link. Its
> front OV2740 uses two CSI-2 lanes at a 288 MHz link frequency and sends
> a 1932x1092 BGGR transport frame with 12 pixels of horizontal and
> vertical padding around the 1920x1080 image.
> 
> Allow the AtomISP bridge to provide per-sensor link frequencies and
> padding, add the matching OV2740 mode, and derive ISP2401 D-PHY timing
> from the sensor link-frequency control.
> 
> The register values are hardware configuration facts checked against
> the Lenovo YB1-X91L configuration and physical captures; no proprietary
> driver code or tuning binary is included.
> 
> Tested on a Lenovo Yoga Book YB1-X91L with continuous front-camera raw
> capture.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: Codex:gpt-5.6-sol sparse
> ---
>  drivers/media/i2c/ov2740.c                    | 103 +++++++++++++++++-
>  drivers/media/pci/intel/ipu-bridge.c          |  15 ++-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  17 ++-
>  .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  53 ++++++++-
>  include/media/ipu-bridge.h                    |   2 +
>  6 files changed, 173 insertions(+), 19 deletions(-)

Please split this into three (at least):

- ov2740
- IPU bridge
- atomisp
- atomisp bridge

> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 18bb3ac9701f..6083dd28e4ad 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -12,12 +12,14 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/unaligned.h>
> +#include <linux/units.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
>  
> -#define OV2740_LINK_FREQ_360MHZ		360000000ULL
> -#define OV2740_LINK_FREQ_180MHZ		180000000ULL
> +#define OV2740_LINK_FREQ_360MHZ		(360ULL * HZ_PER_MHZ)
> +#define OV2740_LINK_FREQ_288MHZ		(288ULL * HZ_PER_MHZ)
> +#define OV2740_LINK_FREQ_180MHZ		(180ULL * HZ_PER_MHZ)
>  #define OV2740_SCLK			72000000LL
>  #define OV2740_MCLK			19200000

					(19.2 * HZ_PER_MHZ)

?

>  #define OV2740_DATA_LANES		2
> @@ -91,6 +93,7 @@ struct nvm_data {
>  
>  enum {
>  	OV2740_LINK_FREQ_360MHZ_INDEX,
> +	OV2740_LINK_FREQ_288MHZ_INDEX,
>  	OV2740_LINK_FREQ_180MHZ_INDEX,
>  };
>  
> @@ -130,6 +133,12 @@ struct ov2740_mode {
>  	/* Link frequency needed for this resolution */
>  	u32 link_freq_index;
>  
> +	/* Bayer order produced by this mode */
> +	u32 code;
> +
> +	/* Optional common settings applied before the mode-specific settings */
> +	const struct ov2740_reg_list init_reg_list;
> +
>  	/* Sensor register settings for this resolution */
>  	const struct ov2740_reg_list reg_list;
>  };
> @@ -142,6 +151,14 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
>  	{0x0312, 0x11},
>  };
>  
> +static const struct ov2740_reg mipi_data_rate_576mbps[] = {
> +	{0x0302, 0x1e},
> +	{0x0303, 0x00},
> +	{0x030d, 0x1e},
> +	{0x030e, 0x02},
> +	{0x0312, 0x01},
> +};
> +
>  static const struct ov2740_reg mipi_data_rate_360mbps[] = {
>  	{0x0302, 0x4b},
>  	{0x0303, 0x01},
> @@ -458,6 +475,36 @@ static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
>  	{0x4003, 0x40},	/* set Black level to 0x40 */
>  };
>  
> +/*
> + * Lenovo's Yoga Book vendor driver uses the generic initialization settings
> + * above followed by these mode overrides.  Unlike the generic 720 Mbps mode,
> + * this is a 576 Mbps two-lane mode with BGGR output from the optical array.
> + */
> +static const struct ov2740_reg mode_1932x1092_regs_288mhz[] = {
> +	{0x0302, 0x1e},
> +	{0x0303, 0x00},
> +	{0x030d, 0x1e},
> +	{0x030e, 0x02},
> +	{0x0312, 0x01},
> +	{0x3808, 0x07},
> +	{0x3809, 0x8c},
> +	{0x380a, 0x04},
> +	{0x380b, 0x44},
> +	{0x380c, 0x04},
> +	{0x380d, 0x38},
> +	{0x380e, 0x06},
> +	{0x380f, 0xf0},
> +	{0x3810, 0x00},
> +	{0x3811, 0x02},
> +	{0x3812, 0x00},
> +	{0x3813, 0x02},
> +	{0x481f, 0x29},
> +	{0x4820, 0x01},
> +	{0x4837, 0x1b},
> +	{0x5000, 0x7f},
> +	{0x58f4, 0x32},
> +};
> +
>  static const char * const ov2740_test_pattern_menu[] = {
>  	"Disabled",
>  	"Color Bar",
> @@ -468,6 +515,7 @@ static const char * const ov2740_test_pattern_menu[] = {
>  
>  static const s64 link_freq_menu_items[] = {
>  	OV2740_LINK_FREQ_360MHZ,
> +	OV2740_LINK_FREQ_288MHZ,
>  	OV2740_LINK_FREQ_180MHZ,
>  };
>  
> @@ -478,6 +526,12 @@ static const struct ov2740_link_freq_config link_freq_configs[] = {
>  			.regs = mipi_data_rate_720mbps,
>  		}
>  	},
> +	[OV2740_LINK_FREQ_288MHZ_INDEX] = {
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mipi_data_rate_576mbps),
> +			.regs = mipi_data_rate_576mbps,
> +		}
> +	},
>  	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
> @@ -499,6 +553,28 @@ static const struct ov2740_mode supported_modes_360mhz[] = {
>  			.regs = mode_1932x1092_regs_360mhz,
>  		},
>  		.link_freq_index = OV2740_LINK_FREQ_360MHZ_INDEX,
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +	},
> +};
> +
> +static const struct ov2740_mode supported_modes_288mhz[] = {
> +	{
> +		.width = 1932,
> +		.height = 1092,
> +		.hts = 2160,
> +		.vts_min = 1776,
> +		.vts_def = 1776,
> +		.vts_max = 32767,
> +		.init_reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
> +			.regs = mode_1932x1092_regs_360mhz,
> +		},
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_288mhz),
> +			.regs = mode_1932x1092_regs_288mhz,
> +		},
> +		.link_freq_index = OV2740_LINK_FREQ_288MHZ_INDEX,
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,

Why is the mbus code different for this mode? Even the size is the same!
Could you use the same cropping and just a different PLL configuration?

>  	},
>  };
>  
> @@ -515,6 +591,7 @@ static const struct ov2740_mode supported_modes_180mhz[] = {
>  			.regs = mode_1932x1092_regs_180mhz,
>  		},
>  		.link_freq_index = OV2740_LINK_FREQ_180MHZ_INDEX,
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>  	},
>  };
>  
> @@ -842,7 +919,7 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
>  {
>  	fmt->width = mode->width;
>  	fmt->height = mode->height;
> -	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->code = mode->code;
>  	fmt->field = V4L2_FIELD_NONE;
>  }
>  
> @@ -966,6 +1043,15 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
>  		return ret;
>  	}
>  
> +	if (ov2740->cur_mode->init_reg_list.num_of_regs) {
> +		reg_list = &ov2740->cur_mode->init_reg_list;
> +		ret = ov2740_write_reg_list(ov2740, reg_list);

No need to do this conditionally, and also the reg_list variable is
redundant.

> +		if (ret) {
> +			dev_err(ov2740->dev, "failed to set common mode registers\n");
> +			return ret;
> +		}
> +	}
> +
>  	reg_list = &ov2740->cur_mode->reg_list;
>  	ret = ov2740_write_reg_list(ov2740, reg_list);
>  	if (ret) {
> @@ -1062,10 +1148,12 @@ static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
>  {
> +	struct ov2740 *ov2740 = to_ov2740(sd);
> +
>  	if (code->index > 0)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	code->code = ov2740->supported_modes[0].code;
>  
>  	return 0;
>  }
> @@ -1080,7 +1168,7 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fse->index >= ov2740->supported_modes_count)
>  		return -EINVAL;
>  
> -	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +	if (fse->code != supported_modes[0].code)
>  		return -EINVAL;
>  
>  	fse->min_width = supported_modes[fse->index].width;
> @@ -1178,6 +1266,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
>  			ov2740->supported_modes_count =
>  				ARRAY_SIZE(supported_modes_360mhz);
>  			break;
> +		case OV2740_LINK_FREQ_288MHZ_INDEX:
> +			ov2740->supported_modes = supported_modes_288mhz;
> +			ov2740->supported_modes_count =
> +				ARRAY_SIZE(supported_modes_288mhz);
> +			break;
>  		case OV2740_LINK_FREQ_180MHZ_INDEX:
>  			ov2740->supported_modes = supported_modes_180mhz;
>  			ov2740->supported_modes_count =
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 47317c423fad..5730a95767a2 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
>  					sensor->prop_names.remote_endpoint,
>  					sensor->local_ref);
>  
> -	if (cfg->nr_link_freqs > 0)
> -		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
> -			sensor->prop_names.link_frequencies,
> -			cfg->link_freqs,
> -			cfg->nr_link_freqs);
> +	if (sensor->nr_link_freqs > 0)
> +		sensor->ep_properties[3] =
> +			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
> +						     sensor->link_freqs,
> +						     sensor->nr_link_freqs);
> +	else if (cfg->nr_link_freqs > 0)
> +		sensor->ep_properties[3] =
> +			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
> +						     cfg->link_freqs,
> +						     cfg->nr_link_freqs);
>  
>  	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
>  					sensor->prop_names.data_lanes,
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> index 95b9113d75e9..035f1addeaae 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
>   */
>  
> +#include <media/v4l2-common.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mediabus.h>
>  #include "atomisp_cmd.h"
> @@ -288,18 +289,19 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
>  	int dat_termen;
>  	int dat_settle;
>  
> -	struct v4l2_control ctrl;
>  	struct atomisp_device *isp = asd->isp;
> +	struct v4l2_subdev *sensor;
> +	s64 link_freq;
>  	int mipi_freq = 0;
>  	enum atomisp_camera_port port;
>  	int n;
>  
>  	port = isp->inputs[asd->input_curr].port;
>  
> -	ctrl.id = V4L2_CID_LINK_FREQ;
> -	if (v4l2_g_ctrl
> -	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
> -		mipi_freq = ctrl.value;
> +	sensor = isp->inputs[asd->input_curr].sensor;
> +	link_freq = v4l2_get_link_freq(&sensor->entity.pads[0], 0, 0);
> +	if (link_freq > 0 && link_freq <= S32_MAX)

Why S32_MAX? Presumably more is too much, but that shouldn't happen anyway.

> +		mipi_freq = link_freq;
>  
>  	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
>  						 TERMEN_DEFAULT);
> @@ -310,6 +312,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
>  	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
>  						 SETTLE_DEFAULT);
>  
> +	dev_dbg(isp->dev,
> +		"CSI port %u link frequency %d Hz, clk timing %d/%d, data timing %d/%d\n",
> +		port, mipi_freq, clk_termen, clk_settle,
> +		dat_termen, dat_settle);
> +
>  	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
>  		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> index ec762f8fb922..9298c31bf11e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> @@ -45,6 +45,8 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
>  					struct v4l2_device *vdev);
>  int atomisp_csi2_bridge_init(struct atomisp_device *isp);
>  int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp);
> +bool atomisp_csi2_get_sensor_padding(struct device *dev,
> +				     struct v4l2_area *padding);
>  
>  void atomisp_csi2_configure(struct atomisp_sub_device *asd);
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 207ab69385b5..502c951cb687 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -15,6 +15,7 @@
>  #include <linux/dmi.h>
>  #include <linux/platform_data/x86/int3472.h>
>  #include <linux/property.h>
> +#include <linux/units.h>
>  
>  #include <media/ipu-bridge.h>
>  #include <media/v4l2-fwnode.h>
> @@ -43,14 +44,16 @@ static const guid_t vcm_dsm_guid =
>  		  0x9f, 0x48, 0xa9, 0xc3, 0xb5, 0xda, 0x78, 0x9f);
>  
>  struct atomisp_sensor_config {
> +	u64 link_freq;
>  	int lanes;
>  	bool vcm;
>  };
>  
> -#define ATOMISP_SENSOR_CONFIG(_HID, _LANES, _VCM)			\
> +#define ATOMISP_SENSOR_CONFIG(_HID, _LANES, _VCM, _LINK_FREQ)	\
>  {									\
>  	.id = _HID,							\
>  	.driver_data = (long)&((const struct atomisp_sensor_config) {	\
> +		.link_freq = _LINK_FREQ,				\
>  		.lanes = _LANES,					\
>  		.vcm = _VCM,						\
>  	})								\
> @@ -77,6 +80,9 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
>  static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
>  	/* The vendor driver and sensor modes use two CSI data lanes. */
>  	{ "OVTI2740:00", "CsiLanes", "2" },
> +	/* Crop the vendor mode's 1932x1092 transport frame to 1920x1080. */
> +	{ "OVTI2740:00", "CsiPaddingWidth", "12" },
> +	{ "OVTI2740:00", "CsiPaddingHeight", "12" },
>  	{}
>  };
>  
> @@ -207,6 +213,40 @@ static int gmin_cfg_get_int(struct acpi_device *adev, const char *key, int defau
>  	return default_val;
>  }
>  
> +static u32 atomisp_csi2_get_padding_value(struct acpi_device *adev,
> +					  const char *key, u32 default_val)
> +{
> +	int val;
> +
> +	val = gmin_cfg_get_int(adev, key, default_val);
> +	if (val >= 0 && val <= 64 && !(val & 1))
> +		return val;
> +
> +	acpi_handle_warn(adev->handle, "%s: Invalid %s=%d\n",
> +			 dev_name(&adev->dev), key, val);
> +	return default_val;
> +}
> +
> +bool atomisp_csi2_get_sensor_padding(struct device *dev,
> +				     struct v4l2_area *padding)
> +{
> +	struct acpi_device *adev;
> +
> +	padding->width = pad_w;
> +	padding->height = pad_h;
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (!adev)
> +		return false;
> +
> +	padding->width = atomisp_csi2_get_padding_value(adev,
> +							"CsiPaddingWidth", pad_w);
> +	padding->height = atomisp_csi2_get_padding_value(adev,
> +							 "CsiPaddingHeight", pad_h);
> +
> +	return padding->width != pad_w || padding->height != pad_h;
> +}
> +
>  static int atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(struct acpi_device *adev)
>  {
>  	/* ACPI_PATH_SEGMENT_LENGTH is guaranteed to be big enough for name + 0 term. */
> @@ -373,9 +413,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
>  	 * the sensor fails to start streaming when instantiating
>  	 * an i2c-client for the VCM, so it is disabled for now.
>  	 */
> -	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
> -	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),	/* OV8858 */
> -	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false),	/* OV2740 */

Please only add the OVTI2740 line once the frequency can be assigned.

> +	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false, 0),	/* OV5693 */
> +	ATOMISP_SENSOR_CONFIG("INT3477", 4, true, 0),	/* OV8858 */
> +	/* OV2740 */
> +	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false, 288 * HZ_PER_MHZ),
>  	{}
>  };
>  
> @@ -394,6 +435,10 @@ static int atomisp_csi2_parse_sensor_fwnode(struct acpi_device *adev,
>  
>  		lanes = cfg->lanes;
>  		vcm = cfg->vcm;
> +		if (cfg->link_freq) {
> +			sensor->link_freqs[0] = cfg->link_freq;
> +			sensor->nr_link_freqs = 1;
> +		}
>  	}
>  
>  	/*
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 16fac765456e..633ef0c4cf59 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -135,6 +135,8 @@ struct ipu_sensor {
>  
>  	u8 link;
>  	u8 lanes;
> +	u8 nr_link_freqs;
> +	u64 link_freqs[MAX_NUM_LINK_FREQS];
>  	u32 mclkspeed;
>  	u32 rotation;
>  	enum v4l2_fwnode_orientation orientation;

-- 
Regards,

Sakari Ailus
