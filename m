Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1099A368291
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038527; cv=none; b=dYymYz30/NrXu/Mzf4M2L1OelunU6DKxGHJ7ajxIGhnECiFPsX+sIGUvJuGrsfvggDDal4WYSlJHAtPZ1zCZQkbjVeEGOzBCmS/JYRlEradsqyBlLbhk1WDRKq1vSzjuicjfRK1MEgg5WZVKQ5LBCUk/g86x8VYDKAJRnPvLgeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038527; c=relaxed/simple;
	bh=yOKUfqD8fMzM5vmvmgfp/dsTNsjzChCwnQ6PwErTygs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNEM4DKt+ffx2909l1jiqfYm6EO77fKhFiE3IvQRpjk/fuwgk0GLmH82xk3QqvCoQnCOBGOqbuk0D1dhkvwYchqPDpsTqAqS6kC7NLF13S79/aCxPknpYBNO8gkfWe7pEWKKVWJBuNb6Yhcik6RHITvGrYUi7vqx0iSekAyMVy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQt8fC8E; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQt8fC8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038520; x=1822574520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yOKUfqD8fMzM5vmvmgfp/dsTNsjzChCwnQ6PwErTygs=;
  b=DQt8fC8EakOOTYmpDpU7PZkF7Cfpze1DzwreynvUYNWZmPaSyfVsOUue
   lB4uEu2TrKkkByVKdTRSfAG4lfR4n546nllqZuo1PJPJ4K1HydjrWvSER
   jbqD9CF4Pz2P6xN+QVyj+E0nm5z4e+2yJWwe587dJkrEhBLv46da7FlJj
   l2VR/3thC5Uyf1Tfz3lw/3hOkyQTFcH5Msugk3CESjhCUqyxChhRNFWOB
   kLGnptE6E05S5rixokQ0WzV1XKNusI4mHEfQxYtmFB5jgELt+0GvcCZtU
   3FQ6tpEGLYYrx6yRUJCnSHIYOzKJzR3jSr7skJF9cX0rtBfRiDjTIePiR
   Q==;
X-CSE-ConnectionGUID: KTZchE9yRM2CcLxBM9K2jw==
X-CSE-MsgGUID: P07LO1D1R1WB6AuliMLtnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="109264891"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="109264891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:41:52 -0700
X-CSE-ConnectionGUID: aZXXqkZ4T964Eaj6owk8pQ==
X-CSE-MsgGUID: PC0TJEtGTS2vaZwoM4C8DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="279708153"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.78])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:41:49 -0700
Date: Sat, 3 Oct 2026 17:41:47 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: mauriziocasciano7@gmail.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 09/15] media: intel: ipu-bridge: select OV2740
 frequency by IPU ID
Message-ID: <asEUKzHkGq_NsucC@ashevche-desk.local>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
 <20261002-submission-media-yogabook-v10-b4-final-v10-9-817ec765b257@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-9-817ec765b257@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 02, 2026 at 10:57:47AM +0200, Maurizio Casciano via B4 Relay wrote:

> The OV2740 connected to the Cherry Trail AtomISP uses a 288 MHz link,
> while the generic OVTI2740 configuration uses 360 MHz.
> 
> Use the bridge's existing PCI-device matching mechanism to add a
> Cherry Trail-specific OVTI2740 entry before the generic fallback. This
> keeps the platform distinction in the bridge and avoids adding a second
> per-sensor link-frequency override path.

...

> +#define PCI_DEVICE_ID_INTEL_ATOMISP_CHT	0x22b8

I hope my 20261002094813.856439-1-andriy.shevchenko@linux.intel.com
will land in media tree before yours.

-- 
With Best Regards,
Andy Shevchenko


