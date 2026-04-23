Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF634D4E0
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978191; cv=none; b=b18vfK6RRJ9K0e5HEYsWdaWRkcEH4qxT9t+17ihK5j9s5jfwLNsQn70F9b1z+WaSja/e99BGSYaW76k12xSTGBhMGMHLbySVK4l6j73FI8sZzyeCzdBUwR3WEjdvf9wvi3XAqDzOoeSmIbAqxzsKSuLqiXlcHOqGEmwsulOqrjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978191; c=relaxed/simple;
	bh=DY1NbkJDfw9U/E1y/idJIY7LJAjWfjXelCBBvOdNBBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br+xooGElgUwRvA0/Sg/EHPEtpmR7BzT+/NlUIvaYsD7ZYrHtvgtdFBl463WXOykEdy/I5YgJgunJQyWEKkqRLtEdE9I0n/DeW2OemsXY4aiSg3GvNBJTFy8ip/LMGWT3UNYg4jIXNRUuVzTt2PBDYcJBR9xKEyPueJG5doaOT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzqIe/VO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzqIe/VO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776978189; x=1808514189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DY1NbkJDfw9U/E1y/idJIY7LJAjWfjXelCBBvOdNBBE=;
  b=BzqIe/VObPZgfJnuoZBI8R7JcTVLJ3w6vzDhtRM44e9W8ANIY4rM9KdM
   CCPvsjAleKJ1uPBT6uqGY7UCdGvub4YrV355+wx/Ne3n0dzCDvidP5/ui
   s2jNflYyuQ5R9YBcbSVnOBsjEcocHIwy1YJyRenGKT6rsV7TKKjC8R8Qc
   A/6rrnO7i4xZiDAWznCVvqlj2n+XOCAnY3Mt2A3o9WJr6rQhi35+i9aaG
   u0k7Pf3JYuqGlWIqFUZIkEk316DshmYvd1mzl9QYMpWgfOpplUGLgLEKC
   KsQXDcIOfEK4zIyGH1tm9kIhgzUVDgR+2q1isBt3ymfTRY7ru4nTCzqdO
   w==;
X-CSE-ConnectionGUID: qennqV57Qj6HEbiGVvPAgw==
X-CSE-MsgGUID: BptdzIR+QWGEjhA5h2g/UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="103421581"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="103421581"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:03:08 -0700
X-CSE-ConnectionGUID: uXD8O9eEQd2Zp2R3cTDaVA==
X-CSE-MsgGUID: xX0dbOafTwWQK0FRdCgPqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="226231614"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:03:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 130DD11F94F;
	Fri, 24 Apr 2026 00:03:06 +0300 (EEST)
Date: Fri, 24 Apr 2026 00:03:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nick Spooner <nicholas.spooner@seagate.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: Use str_on_off() to fix
 Coccinelle warning
Message-ID: <aeqJCcK8q17oVYae@kekkonen.localdomain>
References: <20260423194727.3200344-1-nicholas.spooner@seagate.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423194727.3200344-1-nicholas.spooner@seagate.com>

Hi Nick,

On Thu, Apr 23, 2026 at 01:47:27PM -0600, Nick Spooner wrote:
> Fixes the following Coccinelle warning reported by string_choices.cocci:
> 
> 	opportunity for str_on_off(on)
> 
> Signed-off-by: Nick Spooner <nicholas.spooner@seagate.com>
> ---
> Changes in v2:
>   - Include "media" in the subject line.

If there's only such a change that you'd do right after submitting a patch,
please wait some time for other review comments first.

> 
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 4026e98c5845..322eca4a3755 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -13,6 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>  #include "../../include/linux/atomisp_platform.h"
>  #include "../../include/linux/atomisp_gmin_platform.h"
>  
> @@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
>  		return 0;
>  
>  	dev_dbg(subdev->dev, "Setting power state to %s\n",
> -		on ? "on" : "off");
> +		str_on_off(on));

This fits on the previous line.

>  
>  	if (on)
>  		ret = acpi_device_set_power(adev,
> @@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
>  		gs->clock_on = on;
>  	else
>  		dev_err(subdev->dev, "Couldn't set power state to %s\n",
> -			on ? "on" : "off");
> +			str_on_off(on));
>  
>  	return ret;
>  }

-- 
Regards,

Sakari Ailus
