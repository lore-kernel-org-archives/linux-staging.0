Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E113D607
	for <linux-staging@lists.linux.dev>; Wed, 10 Apr 2024 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756132; cv=none; b=m+a3fvS5WWXlgQHqxRzOo9+WnibfF78MwH2/1Jc7+8dAjQXibHVjlYvlyPzo7B1kN6CTumMfSpxeWCQbSj3XpkzvY9i3C54qWnIFC/iJt63MuEkIljKaRl6hyIwjVjs03gWbCswLIRP3T3sSPb+ldPaMpCtoRboJw3aH1OQPUgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756132; c=relaxed/simple;
	bh=OfCHBzNqhxOboXDegyegyyxVY/r98YaMcMQUhRg/Yuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrdQP7Ok/mba1nxTjDso/I0yooh/ES+VTsCxVsH6SCdrhLffLGHqYSQC9quVcNVqX1FeNgeLXBHOfwNJYArjgV1uULHJQMvQwRA23IZTgokEZi+jBiZdOU6ow18q35mt0FrHTeooFML7LJMJ5c9Q0d5JR5KYyJ+6cq3PyqPO8B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPtbDBe/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPtbDBe/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712756130; x=1744292130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OfCHBzNqhxOboXDegyegyyxVY/r98YaMcMQUhRg/Yuc=;
  b=IPtbDBe/UTsn86yDkgNPJkWWspxOl7qsVHSFh2IT3kotpgKQT4ibQFy7
   dPl7NWjU0k1QuDRx+EhKik8E/PzZhONKcWz5lct4RXEQiantMvT479zFs
   ifuIJJ6SrvC3EPlfGfXV+kLzk5YK8z82MGf801uru1PwQCpOCr6ka/zqY
   63C2jfkfVsnAaGdvsRDVQZj6B7UE21a2RuU3P5blaV5ZD+NnQAyIa964T
   xk9z1/XMvfp6LuXASoRyuSbLfxpXAA5qrzn96oT4wuwm5P1zNIrwjW+B9
   BrV3UUF+R2fROiekC0YK2Rw8miwU2FNvMdKJiLxLBsce4fRO/yOtn6kRq
   A==;
X-CSE-ConnectionGUID: z3whVf5KT5mS1HS+y6ML1Q==
X-CSE-MsgGUID: KC+l5DYTRmq4fXX1ZZ0TOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7990864"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7990864"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 06:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915433250"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="915433250"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 06:35:28 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ruY6n-000000034xQ-2BIQ;
	Wed, 10 Apr 2024 16:35:25 +0300
Date: Wed, 10 Apr 2024 16:35:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/2] media: atomisp: Replace open-coded
 i2c_find_device_by_fwnode()
Message-ID: <ZhaVnYtFoTaFOKD-@smile.fi.intel.com>
References: <20240326202813.1425431-1-andriy.shevchenko@linux.intel.com>
 <20240326202813.1425431-3-andriy.shevchenko@linux.intel.com>
 <c9741df0-6c12-4ff5-90b4-5a13f0bd9b51@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9741df0-6c12-4ff5-90b4-5a13f0bd9b51@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 10, 2024 at 12:35:29PM +0200, Hans de Goede wrote:
> On 3/26/24 9:27 PM, Andy Shevchenko wrote:

...

> I'm going to merge this variant into my media-atomisp branch
> instead of the orignal.

Thanks!

This explains why changelog made the commit message.
Was it done deliberately?

-- 
With Best Regards,
Andy Shevchenko


