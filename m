Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7393B635F
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617151; cv=none; b=qiIbK8JWCDXgCYqwCKsRe5h4gMYwpmfQYyEkXoE6SgHfvzeiIetKr0V4C//VAgaOv3/Vlfc89E0eVbhUgObuKXiNPnGc0BIk6sG+RxZ/voLat8mzIQP4iuASxrJkKpM/uJ23KdCT8MthvDSXfyAjZ6SNT9ea9WD7HCkM9t3c5gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617151; c=relaxed/simple;
	bh=WabSzN2OJI7SP3rF8kuX5j51Gq3XYbmHZzbtnDoaGtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSP3H3xPAcOpaqCev+n63rGLIRNq26khW30KhiUsgKJpFWuuqyI3BqGAczGz1QjXp3d4gnjpSId+PqcWHYHdXFFdfMiQ1tO6sg9Jcf0IsPUbIVGx5VJHrrj76sZ6RnVOSYPFhBWROgBRzIp8vsihVlMbpGunhXRjSkmZH81XDP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzEtQasK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzEtQasK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778617150; x=1810153150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WabSzN2OJI7SP3rF8kuX5j51Gq3XYbmHZzbtnDoaGtk=;
  b=gzEtQasKZTwq5lmUBGaEZgIWb0YNGPqAomnxXC2Xb9p41og9b820burg
   +d151ANNwkEawpt78BVmTl6de287LRXJDHMk7TbsOwh7GDjYvU9CvaQRO
   SHwEPnfkEvNATM7yuqUNBIp+WrPdLku9kOXW1llRc20okJRFvPD4sHszE
   2WclNI646RvOOaKbMVe4BVOQHdgn7BngCh+4KsPrMgWFuUfvJmYClu/d8
   Ux1KTHUj2sY2nEQyxaqx87/PCLrKiTlDWhtza7A6AFdu9BoB6OgFT/7tf
   5g6qSrShx2AJ3KV3R2GlOgCKEgTKM7pXJtpBrD9KeE293ltxGkxFpeQ/T
   g==;
X-CSE-ConnectionGUID: JXh20xygQjm+fjBxFBxXPA==
X-CSE-MsgGUID: cmpyQPaGSgCK8BV/EY7rVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90117966"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="90117966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:19:10 -0700
X-CSE-ConnectionGUID: khr4R7qWQL2V2wutmeBfmQ==
X-CSE-MsgGUID: CruIzuRdQDCvSxgmqq7jMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="235205627"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:19:08 -0700
Date: Tue, 12 May 2026 23:19:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: gregkh@linuxfoundation.org, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: convert sysfs attributes to use
 ATTRIBUTE_GROUPS
Message-ID: <agOLObiXCu18f0JH@ashevche-desk.local>
References: <20260512200104.19002-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512200104.19002-1-shawharshit116@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 12, 2026 at 08:01:04PM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() calls with the correct
> ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
> driver structure so the driver core automatically adds and removes
> the sysfs attributes when a device is bound or unbound.

You ignored my tag (why?!) and what about Sashiko review? Did it pass?

-- 
With Best Regards,
Andy Shevchenko


