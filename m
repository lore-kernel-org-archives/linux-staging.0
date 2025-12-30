Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416892DA765
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094444; cv=none; b=XnLEID7rEtDjJNfbxMZqdFZEDMkazaAdb+Nq3XIdByF6ViOmo41sqBYo56B7pdVtNjF+u6bmuic/wGwG1XrM4HnXTugQ5EbgXSAX+5e5gmcPIRZlbnr7Us0zWCMOVYqInJCxjVLBPhMPKoYGt1NLbGrT3mT1yrl/tunusDqf8iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094444; c=relaxed/simple;
	bh=Cbe+8bPo4xtiKIpnJiQxtHfRAryAeLaAaMe/2CqZYlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5DuVaef/Lk3sErnIAjuXEq5DdK4+zGzdJNHS8o52gyNuj3fcoyxOKGnT9BeyzjmHnc3yRRPde+4n6vSUM2/9Q2GtDfpE30+Nu8reUtc8H5UTn9PJaJ9sRlam9xiqCK0+/f+uVnIUOFWE+IySg2IyUPXj87deZSAn4g946Vdh44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzW4zhEj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzW4zhEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767094443; x=1798630443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cbe+8bPo4xtiKIpnJiQxtHfRAryAeLaAaMe/2CqZYlc=;
  b=gzW4zhEjpNwZjid790An151luhxGZnZqAuUYOsLqjCbzcIqNbamxfOBS
   733NoH9PQ+HSAfLnJ/u/zoyF1LDjhxcLPZUxn8+C6LTPVlazbi+BN7ZiY
   HiWI4ENQZVZHkAaNiFUD5IlOXeHtEzh4MEQma03nKvAEHQq2niSvp8v+f
   1SS12/CBlXEqDqr0IEDXcT1AfgnHiuj87wLEVjZ0P6Jt8gjgyLcL5p8fM
   snLM/NT1VNBTkg2SkWWWE8vyYa/lN5MeH+xa+s61j1PpHa8qj628qC6lJ
   9MygK+FWvSFa4YN9xMQecTeAk1ov+D84AACmjWiublot1+ZoD0Sn/jS7i
   w==;
X-CSE-ConnectionGUID: zrR8BfNnRwyw7jAdZj7iRg==
X-CSE-MsgGUID: sD51ohdoRRCGuYpXNDpweg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80134434"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="80134434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:34:03 -0800
X-CSE-ConnectionGUID: ygyrfsbRQA+ybPTCbdlPSg==
X-CSE-MsgGUID: GL0VmTBwQJexoBqoyHeidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="205676780"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.103])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:34:00 -0800
Date: Tue, 30 Dec 2025 13:33:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Message-ID: <aVO4pslXIvnc00J3@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 09:28:18PM -0800, Chintan Patel wrote:
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
> remove hard FB_DEVICE dependencies.
> 
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.

> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
> Changes in v3:
> - Use PTR_IF() to conditionally include overlay_sysfs_group in 
>   overlay_sysfs_groups
> - Decouple variable definition and assignment in fbtft_sysfs_init/exit

Any particular reasons you ignored my tag from v2?

-- 
With Best Regards,
Andy Shevchenko


