Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B5E1D63D5
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966972; cv=none; b=eeVdDyHiXf+fDuoOV4rKX7D6tdozp++NlAkTrrIIcH2e5MiFqZuZBewtiqmVJVJdkxTNmaoV7CZuIA84SEh83xdi+kPQVGlprmHzivFnoai7VMPi0VSnoxM4Y/6O2ExglQX/Lp8pFbeGl4mpxiLXknrOi5Jbf+J6CA1ZzfFHmQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966972; c=relaxed/simple;
	bh=XFz7GJZI6EnHTM4OFuC+VtVaJ2KZQWBeH0wd1hbKGiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEX4yVVgPdX+g7mdIoGi9Fg0QTWsAq63DkhVNg4mtMtOoYn4hzDllLWYS4pk8X47xrJChfKi2J0S8gfTdnb3DyKUS7riZjVxHbfqXa47TJUk5Wg8Aro8LPnNM4VSpWBJjVDnD6FfJJyplU6Me4d0jri2MGrZJbprOnKbNVpmnJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwWb8IRi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwWb8IRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730966971; x=1762502971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XFz7GJZI6EnHTM4OFuC+VtVaJ2KZQWBeH0wd1hbKGiI=;
  b=bwWb8IRi6Ku8auEPY3N/b2P5slm0iLglP4x1OMoeLP1JfcidJrH9vt0u
   iD88FhxuYkFWXtDV4/WYYoEg1AVGpE6tx8pMmz/KGpJuDTsgyG9XlwH72
   5eQq709ssZ9BogG7eJPNsXMXHW9d9pM/pDLQ6r0jWm+6AsyuP2fws7CcL
   TyY5/Ox/fylZX/CdmuyaKWGIoBcuaNlUBxdLd+aC3KlgK2sAAq2Bc2OZN
   W7aqsFg6mJ5P2A8K6ahug0oe4ndP9I1JG9JNhfxwbYpMfKP+MT3TNkMIP
   mVjXemL2nHuWS0bqMzs7dKZq5ju+koD1KeNLRHDsBmbBnBaj4KBWjuWsx
   g==;
X-CSE-ConnectionGUID: ie16IHzzTQ2lJ8KhDlvBMg==
X-CSE-MsgGUID: E3CDd3TzRTC910opXHZKow==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41350001"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41350001"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:09:31 -0800
X-CSE-ConnectionGUID: MgbSGD6xQAqnEjJidC9FpQ==
X-CSE-MsgGUID: ugGMK3FiQBCfex+Z9wYDzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85160486"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:09:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8xa2-0000000CBGR-37R7;
	Thu, 07 Nov 2024 10:09:26 +0200
Date: Thu, 7 Nov 2024 10:09:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Avoid picking too big sensor resolution
Message-ID: <Zyx1tlwysnNJmcEi@smile.fi.intel.com>
References: <20241106215509.40205-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106215509.40205-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 06, 2024 at 10:55:09PM +0100, Hans de Goede wrote:
> atomisp_try_fmt() is limiting the width of the requested resolution to 1920
> before calling the sensor's try_fmt() method. But it is not limiting
> the height. In case of the old mode-list based t4ka3 driver which has
> a mode list of:
> 
> 736x496
> 896x736
> 1936x1096
> 3280x2464
> 
> This results in 3280x2464 being selected when try_fmt is called
> with a requested resolution of 3280x2464, which is not supported because
> its width > 1920 .
> 
> Fix this by also limiting the height when in preview mode.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	/*
> +	 * The preview pipeline does not support width > 1920. Also limit height
> +	 * to avoid sensor drivers still picking a too wide resolution.
> +	 */
> +	if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
>  		f->width = min_t(u32, f->width, 1920);
> +		f->height = min_t(u32, f->height, 1440);

Perhaps umin() instead of min_t() in both cases?

> +	}

-- 
With Best Regards,
Andy Shevchenko


