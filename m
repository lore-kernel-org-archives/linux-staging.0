Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC733B970
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 19:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332265; cv=none; b=MO9rGjbgKVEoOkI1tphyGez+GNuYtpKi72v2nSlgDVsKX76/yRKatmsQXwM/0G2w56wgxmghurMIjynLg7T+UKuXNUk2ZbhRtmYQp7kDSkJgUW1Wj/is8qvbNIUbDjy1+AEjLMggnNYcYoRXFhVd75VJ06FlAKCgAboIqPYIZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332265; c=relaxed/simple;
	bh=yfBgPE3Ikn8IHLZtgwOalIe33xYKsAq5gCllthCwPAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx9ydcClkQLWOgWvAhm67kC579yJMkGXILYFemYM7Zx/BrZMByjnxlgypv963s46oMu9PazwhPvBw24dX4tv/rwJ3ToFF3f67DbjctMsdT8VsfwIlhPXVKTAGwAD8lDzY4pEuuNjRaQmV7XhzKf087RHgbcCRxPlxObkx1WkV7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUqOi/w7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUqOi/w7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775332264; x=1806868264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yfBgPE3Ikn8IHLZtgwOalIe33xYKsAq5gCllthCwPAQ=;
  b=cUqOi/w7z/Xe5y1T/dT0wFwJigx9XAroeiI16kNLUIwikTRl6ItjhjEi
   XyIDXzq8Jp8RcMA7YAwahjr9l8+9bzPgOzBi8ryFH+pw1A+UzNcaH71z0
   AUzvwbCPESjhuSEcIDv+Je0x0JfXaaiWxgBbMRveoTZaQsFWgb5T5Fn9J
   RMYH4+JH1PsG3gm1StNOF1H/m5a8+UDs048VWGWIHOCxvVNroplVfbQIO
   5m4qDmiB5aQ4Gt6LRyIFhI7o3E+hst4dnA+IVHNKiapFYU9vYeYoRM4b4
   lyrb0D8FojhyDTLiMa8cfNomwBaixHPxBRoiYtpwHL8CwqXvuz74UBJJP
   w==;
X-CSE-ConnectionGUID: lnFyZYqqRHKiC9IkCUDwCg==
X-CSE-MsgGUID: l8wMsoQGQfmTt9Ze4yHa4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76233482"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="76233482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:51:03 -0700
X-CSE-ConnectionGUID: q5QoGrcISKCO8K9/i1Fehw==
X-CSE-MsgGUID: iZ/K21+SRXOX8Wd39M2ODQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="227460964"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:51:01 -0700
Date: Sat, 4 Apr 2026 22:50:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Daniil Bulgar <bulgardaniil18@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: pci: cleanup and refactor
 tracing functions
Message-ID: <adFro9mJzfSJbbWL@ashevche-desk.local>
References: <20260404121701.47745-1-bulgardaniil18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404121701.47745-1-bulgardaniil18@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Apr 04, 2026 at 02:16:58PM +0200, Daniil Bulgar wrote:
> The current tracing in sh_css.c contains
> ftrace-like enter/leave logs that clutter
> the code and provide little diagnostic value.
> This patch removes these redundant traces and
> updates the remaining useful logs
> to use __func__ for better maintainability.

It's too shorty lines.

...

Do you have output before and after to compare?


-- 
With Best Regards,
Andy Shevchenko


