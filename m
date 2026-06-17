Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112B3B7751
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689228; cv=none; b=awazaKAK2r+lm4zWX02SfxSi8lw+Gm4XTjm2AC9vjs+4cYgdzmY04f2Qa/AEBDRRcj4qHA5yBdjVPEjGXdTLLzoGq9BkJ4eNpV8TBnawEUZac5Ps1sfH5DY+4q4KPEDyCEyYmVS+sSt/5MMxarAPBP12TniiyZSLcqsYY9BWqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689228; c=relaxed/simple;
	bh=j+ldJkw8refaL1OUAouw/yOdplUz8ecb4jKayH2Uqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIuBK9lOTp/AF3W0hxbcJOzHLhVF3iCRZOfpcNSrb5lk7O/ObFlFr5CZejNoEGZ5bkgJ2FoLGF8bbRvSrFkgbnejQgD+QW6whskM8bsawMmJM3l7nqjM3xBKZiDmGJvCVwSuUlNlrTmFqwFNrDKyJ8ghXUy6kBSOoGhT9J3Fi4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXuSyCVw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXuSyCVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781689227; x=1813225227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j+ldJkw8refaL1OUAouw/yOdplUz8ecb4jKayH2Uqck=;
  b=KXuSyCVwV++GgFzDyGwWelat8/LssG+ybC0fW3qSQmXhWK103KPdum5Y
   d3MY6aIiXlZ/WuvgB7BIrdyi94Y6WPjMpTBA7SkQRgGB99S15DxwEaDfk
   LbLrCKUsTNWP5nAyL0WsDFBMnB9lb/TSOFyTyCddHd8hz7j78V9LfJXdw
   tX71hh5lPkTgahIx/OPxt9grkj1ep7uS0PE8yWAhRGQ7Rb6Wa+DvFmkjI
   /v78Gt172n/JCQWLG1jIWpfbtOWVPDzdl9JVHUPTheRJte+JcPkqWim6H
   pP976V7D64CP0FsQJJPYuof9iHXcfDO/UrNnZzNXaSnvdCifSIZLi0tRB
   g==;
X-CSE-ConnectionGUID: XbXYGkzmSMqwZljAysJRjA==
X-CSE-MsgGUID: t5mIgUhkTFW6m5df0iltAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82533999"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82533999"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:40:26 -0700
X-CSE-ConnectionGUID: InnwzJJjQhK8nW1aZAQbZw==
X-CSE-MsgGUID: eWvv0gDSSLCHsC5E79HWhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="252322044"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:40:24 -0700
Date: Wed, 17 Jun 2026 12:40:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: andy@kernel.org, error27@gmail.com, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: Re: [PATCH v3 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ajJrhE3cjwKPom5a@ashevche-desk.local>
References: <20260616134319.3969928-1-dawei.feng@seu.edu.cn>
 <20260616134319.3969928-2-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616134319.3969928-2-dawei.feng@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 16, 2026 at 09:43:18PM +0800, Dawei Feng wrote:
> atomisp_initialize_modules() creates CSI2 and ISP subdev media entities
> before atomisp_pci_probe() registers them. Its counterpart,
> atomisp_uninitialize_modules(), only releases part of that module-owned
> state and leaves some media entity cleanup to the entity unregister path.
> 
> That ownership split is incomplete for probe error paths. If
> atomisp_pci_probe() fails after module initialization but before all
> entities are registered, the unwind path cannot rely on unregister
> helpers to release media entity state whose lifetime started in module
> initialization. The CSI2 and ISP subdev media entities can therefore be
> left allocated.
> 
> Refactor the cleanup boundary so module cleanup releases media entities
> created by module initialization, while unregister helpers only undo
> registered V4L2 and media device state. Move CSI2 and ISP subdev media
> entity cleanup into atomisp_mipi_csi2_cleanup() and the new
> atomisp_subdev_cleanup(), and run media_device_cleanup() after module
> cleanup in the probe unwind and remove paths.
> 
> If atomisp_mipi_csi2_init() itself fails, it has already unwound its
> partial setup, so return the error directly. Only the later
> atomisp_subdev_init() failure path needs to clean up CSI2 from the
> caller.

...

>  void atomisp_mipi_csi2_cleanup(struct atomisp_device *isp)
>  {
> +	unsigned int i;
> +
> +	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)

In case you need a new version

	for (unsigned int i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)

> +		media_entity_cleanup(&isp->csi2_port[i].subdev.entity);
>  }

Or maybe Sakari can tweak this whilst applying.

-- 
With Best Regards,
Andy Shevchenko


