Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB6369973
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799023; cv=none; b=heUXGiIrBDoDwINChPehwQ+FpcBSTBkGDsbCYSOL/IADi1aWSos26dgToMea5Kq6/YqkGxkcsGYYDAsKZQvMtH9abASdqYUaAbH2T97H96snlfPenLtt902jMQDvz/C8sfbCAMbq9roZ+GiFMw/RjxK9EToXgk6yTGUs2yEkCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799023; c=relaxed/simple;
	bh=I2Zaa2iNkRHyunAJME9kRaq92t0pbT4Z0Uzi0j1sD6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNlcHy5UVuxujgnXEkG+TfgsPihY30sPSh/FoUqur/1UxfFGg0XYGLB66TJyvb3CdZlizfvcF4l70C0BDToI/0phXMUV0ds6LaOnnzneOO8z4IKaD9K17z8Y4ZSbxDFd0WBeQUeE0o29WoR1iYjBbOn5KNinWvfq+V3owq4Do3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/l3QeYU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/l3QeYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767799022; x=1799335022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I2Zaa2iNkRHyunAJME9kRaq92t0pbT4Z0Uzi0j1sD6Q=;
  b=i/l3QeYUTg+FBUhHDNV0u/mCiFZov8w8IRwIJ+po9UBwb5nPt1jVo0j+
   T/t2rzaTNjWdN0WiFbLjKKcWbuVe6O3BLOZigpVPeSmrX9uIWjA/EANlD
   6O8wnTdZvKhEuX4ILlx4J8hHcLepX5rDrW4NvSI8/XNppMTKAuL0jY14U
   EZoAkH/TtItUxLqyWdCrMvC7aVQBBMrPLsssIbxCgCtCMzxr5xR4VTZch
   AfQuc0H9HE/LRleH2oIiV9Ou06OAnofukgXn5nFpzNxkR3MdSTo+XLv94
   235FndlqJ8Le8P+4EQYCl9ZUMOTVwk/aehQTJj6UPIN/oYqLlP4lSwkzO
   g==;
X-CSE-ConnectionGUID: ghDopN41RquXUqbxdnpZxw==
X-CSE-MsgGUID: xdpnKUCCT8CIgXifddNmPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69220235"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="69220235"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 07:17:01 -0800
X-CSE-ConnectionGUID: GvHOTgggQweSSjr8NaJn2Q==
X-CSE-MsgGUID: W3I1JoekQ0KpoF1sJeEycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="234095069"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.168])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 07:16:58 -0800
Date: Wed, 7 Jan 2026 17:16:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v4 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Message-ID: <aV546KdXG8KotqKj@smile.fi.intel.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-3-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107044258.528624-3-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 06, 2026 at 08:42:55PM -0800, Chintan Patel wrote:
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
> 
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


