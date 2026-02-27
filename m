Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F741ADC97
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184696; cv=none; b=Naqdz0d5ss/jeILNm9fFznMb5Uh3mchJ3K+zEwPdBgRr8Wl/waySbeygg2I7hbh252RkIRc5Zg0Bu14UrnT1z3DC2pNEtHhA15ack3OS2duHhslylGsRunJ1t4NC2srHe5r2C1+5ItleLG8Bkvz02z1g/+47/piyCOnVz40llDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184696; c=relaxed/simple;
	bh=YPcUfmZ2wPQ8/UQp1q6pQBmAGzOq+nyGoi+OFcHYE9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wf5twccrYqacezygjOXyAnOAPTPTc6m+cbWA0KPz+V0omuaA0jf2o/PV1bpd7oUyAH7PO2apE4uGp4dVAcP12dVayW43mr8Oalf682WKhboBIoPHaG8mEGYKrcZy0HEsJKTYWnVgZfO9aapMjSVITavlJzTTwUToScaQoGzc1/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBUu4YuS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBUu4YuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772184695; x=1803720695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YPcUfmZ2wPQ8/UQp1q6pQBmAGzOq+nyGoi+OFcHYE9g=;
  b=YBUu4YuSPJloCz+x3MumapGeCe5PSo+tIy9+NUSVA9q67wxOw+Om9scm
   O4nkv5RFYnL1J2wq9ezAPnquXOQUKZos5Zg6FoVdhXOi2+VG1xXdLURxV
   7tmIFOFxkww82xSG3dqopyC/LpQei/FAThkuOyayTpokHdv1Qgz39oBvT
   /b145TzaOlfzqxt6dXBELrzxJwatnY30o9b+CzdczO/6UhumIZ2eA4R+A
   DdQj/dt4GHRU+qnc9a0ALumuY3bPQbk65Jw/EgI6D8rKbTa+UHzd+B+S1
   9kcF8hLEmMk8zWi653Uq7+4TMtB5rhKuY34U3rBMIfxLehsOFNlzgRuRm
   g==;
X-CSE-ConnectionGUID: re8rw+t/QdKNCWkpcXeOLg==
X-CSE-MsgGUID: j3HBSvNDQFKySprDAxfb0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77130166"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="77130166"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:31:34 -0800
X-CSE-ConnectionGUID: ZIWaM+YaQm6uTTsDeJWUgA==
X-CSE-MsgGUID: PZVPFl6GSCuV8/zz8p19FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214719986"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.65])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:31:31 -0800
Date: Fri, 27 Feb 2026 11:31:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private
 IOCTLSs but S_PARAMETERS
Message-ID: <aaFkcS1fMVLxGB87@smile.fi.intel.com>
References: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 27, 2026 at 11:23:27AM +0200, Sakari Ailus wrote:
> Disallow all private IOCTLs except ATOMISP_IOC_S_PARAMETERS. These aren't
> quite as safe as one could assume of IOCTL handlers; disable them for now.
> Instead of removing the code, simply check the IOCTL matches with
> S_PARAMETERS and bail out otherwise, in order to ease backporting.

> In particular, ATOMISP_IOC_S_ISP_FPN_TABLE is disabled by this patch.

Why not removing the code?
It's still and will be in the Git index, it won't disappear.

-- 
With Best Regards,
Andy Shevchenko


