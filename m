Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ADB4477F1
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840808; cv=none; b=InYMG6IDaCCF5mCJLug4WbSdYA8aDKEzgccEQPP9bmtmcpzQmW4VurV0OGnfMdeazOPf0YFFvfjt+FOAit+emPYHOVqovfi7dmwtyFen+QUKjK0UPuNjJxEmsPAx4TgsWNgJGU+8eLuCVnmlv57TSWSg5MrXyGbBvYhZKSB75rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840808; c=relaxed/simple;
	bh=Ru0l4PHF29l4rw7OpPV0iZi7pIsMNwPPPjv9m9TfRP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hO7NJYLIaHcTMJbShia+In+YoXIAjMRBarX2pzYpM8/EwG/SSrSbNZpJT5QEcxTSBxGAPinKKkh6qai0ezATQycRZba74ICgVN8csAkDYWaW7ZzGoWVbjnKFiaSw8zSNNZsjo3fmmpYBMYWjFSKQF9S12KjBLLUSwe51abm/vh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUyppJWo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUyppJWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787840803; x=1819376803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ru0l4PHF29l4rw7OpPV0iZi7pIsMNwPPPjv9m9TfRP8=;
  b=IUyppJWojHQ43RDXNXdhVo1H73cqB2IMux2C51BizIGqaCz/6kJykiAQ
   MwtgrZCsmMN9Rwfm5kFR7yti2qFsZ7jc/Q8QJCBSJxnvv/CR97+qqWz+n
   ia6VslA3mWLG7MzFvq5wONDagrOWY01gqgHJApykuZxpmAuyXG1gUReC3
   lWxqr83qtyxiO4Y52NL5ip0ybm9ouboDmll35iAOv36iC3c9LJj7FYofc
   Bva78ds5/dXuxSUPaUztWu62hgOgpGBii6NRtWfG81kT4xBwAZAMaituq
   9c+JO9y5xKGMe8u3lhoDpUDW2C1zk0nei6NwoCrY41GHzPRjoTg/IoHNY
   g==;
X-CSE-ConnectionGUID: 5G2ts5xnSbKoEZS+a52Onw==
X-CSE-MsgGUID: wLjmiJqTS8mSUC9EiqRRHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105715800"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="105715800"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:26:42 -0700
X-CSE-ConnectionGUID: 0vje0uXgSgy3e1cb8o6J7Q==
X-CSE-MsgGUID: X/IGFMJLQuGDU+4330Sx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="265302616"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:26:39 -0700
Date: Thu, 27 Aug 2026 17:26:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: atomisp: support the Yoga Book OV2740 link
Message-ID: <apBJHHhAPowUs8Kj@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-6-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132256.3343451-6-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 03:22:53PM +0200, Maurizio Casciano wrote:
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

...

>  #define OV2740_LINK_FREQ_360MHZ		360000000ULL
> +#define OV2740_LINK_FREQ_288MHZ		288000000ULL
>  #define OV2740_LINK_FREQ_180MHZ		180000000ULL

At some point would be good to use HZ_PER_MHZ multiplier from units.h.

...

> struct ov2740_mode {

>  	/* Link frequency needed for this resolution */
>  	u32 link_freq_index;
>  
> +	/* Optional common settings applied before the mode-specific settings */
> +	const struct ov2740_reg_list init_reg_list;
> +
>  	/* Sensor register settings for this resolution */
>  	const struct ov2740_reg_list reg_list;
> +
> +	/* Bayer order produced by this mode */
> +	u32 code;

Check with `pahole`.

>  };

...

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

Why do we need this? The sensors are listed in the supported ones in the IPU
bridge code. Also, if required, some data can be altered by using driver_data
field in ACPI ID table.

...

> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h

>  int atomisp_csi2_bridge_init(struct atomisp_device *isp);
>  int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp);
> +bool atomisp_csi2_get_sensor_padding(struct device *dev, u32 *padding_w,
> +				     u32 *padding_h);

Better to split logically.

bool atomisp_csi2_get_sensor_padding(struct device *dev,
				     u32 *padding_w, u32 *padding_h);

>  void atomisp_csi2_configure(struct atomisp_sub_device *asd);

...

> +bool atomisp_csi2_get_sensor_padding(struct device *dev, u32 *padding_w,
> +				     u32 *padding_h)
> +{

Ditto.

> +	struct acpi_device *adev = ACPI_COMPANION(dev);

Split the assignment. The current way is prone to subtle mistakes in the
future.

> +	bool override = false;
> +	char *str_val;
> +	unsigned int val;

Try to use reversed xmas tree order.

> +	*padding_w = pad_w;
> +	*padding_h = pad_h;

	adev = ACPI_COMPANION(dev);

> +	if (!adev)
> +		return false;
> +
> +	str_val = gmin_cfg_get(adev, "CsiPaddingWidth");
> +	if (str_val) {
> +		if (!kstrtouint(str_val, 0, &val) && val <= 64 && !(val & 1)) {
> +			*padding_w = val;
> +			override = true;
> +		} else {
> +			acpi_handle_warn(adev->handle,
> +					 "%s: Invalid CSI padding width %s\n",
> +					 dev_name(dev), str_val);
> +		}
> +		kfree(str_val);
> +	}
> +
> +	str_val = gmin_cfg_get(adev, "CsiPaddingHeight");
> +	if (str_val) {
> +		if (!kstrtouint(str_val, 0, &val) && val <= 64 && !(val & 1)) {
> +			*padding_h = val;
> +			override = true;
> +		} else {
> +			acpi_handle_warn(adev->handle,
> +					 "%s: Invalid CSI padding height %s\n",
> +					 dev_name(dev), str_val);
> +		}
> +		kfree(str_val);
> +	}

This is dup of the code, please create a helper to deduplicate these.
Also, what's wrong with gmin_cfg_get_int()?

> +	return override;
> +}

...

>  {
>  	const struct acpi_device_id *id;
> +	char *link_freq_str;
> +	unsigned long long link_freq;

Reversed xmas tree order.

>  	int ret, clock_num;
>  	bool vcm = false;
>  	int lanes = 1;

...

> +	link_freq_str = gmin_cfg_get(adev, "CsiLinkFreq");
> +	if (link_freq_str) {
> +		ret = kstrtoull(link_freq_str, 0, &link_freq);
> +		kfree(link_freq_str);
> +		if (ret || !link_freq) {
> +			acpi_handle_err(adev->handle,
> +					"%s: Invalid CSI link frequency\n",
> +					dev_name(&adev->dev));
> +			return ret ?: -EINVAL;
> +		}

gmin_cfg_get_int()

> +		sensor->link_freqs[0] = link_freq;
> +		sensor->nr_link_freqs = 1;
> +	}

-- 
With Best Regards,
Andy Shevchenko


