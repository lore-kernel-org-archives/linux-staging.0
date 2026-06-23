Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848C3D1718
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212317; cv=none; b=fvhizecxcWU5oe3BsduYa1SGaSEVDEsAbHiMPiackq69uC3wxcoxG3EgiNVmTiK0HP1QNXY552f0WkypMYV5esM+njNQyWtw2V78dnhKjbmbiVjITyYJcWEiUoz0GKlZ/quZYyQeAKMl31tr2yGH0wD2NXKMRDWiFsS5gEpVu0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212317; c=relaxed/simple;
	bh=n/5t19g0g60eehGqfVR0OCwmQhk2y+XHzB08Wx8J4fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUKPS69B2W2TQA0TG0AgUnybQPICs9aXyLy03f0Rvar08a4RX3TQsOV6tLItD0K9ylsl7TnhnOz0i51Ir8SsnsK6qwT/5ZHbInHI6+JSQn2Z1cWwhE3JyNBOcQvTPwrFFi/LGUCBLhPOScvJUzjZVXUytIw1h+G8ZON3t0z3FOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O75t0OCy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O75t0OCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782212316; x=1813748316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/5t19g0g60eehGqfVR0OCwmQhk2y+XHzB08Wx8J4fA=;
  b=O75t0OCybMywgPu7enYQSb7p8lVYtEhN+SGFAOnMft/0jQJfzqR9LWWd
   xlmfWjKaLIG7oneP8+z9n0cSCjcQGEVBZphCKIL3dPEPeUq7pNYG7sjr9
   c16ZPPXglwJDDRjbNNnBYTW9Ezj0mMPVtzexq5M3y8GqBnOobZ2K6qLHn
   g9sAKrKxDeYEKHDtWa2cIKq1j8a+CHfnKGRKmaCkkgRp7d8h6QBbWhVyU
   np6raQrRWD5NwlJxjkB09fZSYllTBvfEsd1m269EnVRUnGUoCfaaOHAXV
   r4BQ8IlVabgzhw9A3VE7oOeTdthVwLi9z3qZM2J709GXKUUomzrAg85zo
   g==;
X-CSE-ConnectionGUID: gpJOC36RRLO+a1/SCxF6Iw==
X-CSE-MsgGUID: vsysHnD+TvWmCz9aUrBn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82838596"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82838596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:58:36 -0700
X-CSE-ConnectionGUID: Kh3soITZTlG4OMMVBsSHUQ==
X-CSE-MsgGUID: rLVE95zOR7+YUwKiLO5PQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253367199"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:58:33 -0700
Date: Tue, 23 Jun 2026 13:58:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mohammad Abbasi <mail@mohammad-abbasi.me>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mohammad Abbasi <mohammad.v184@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: constify pmic_name array
Message-ID: <ajpm1mtTGtTeR1jx@ashevche-desk.local>
References: <20260619111907.242382-1-mail@mohammad-abbasi.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619111907.242382-1-mail@mohammad-abbasi.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 19, 2026 at 02:49:07PM +0330, Mohammad Abbasi wrote:
> Fix the following checkpatch warning:
> 
> WARNING: static const char * array should probably be static const char * const

Missing blank line here.

> Signed-off-by: Mohammad Abbasi <mohammad.v184@gmail.com>

-- 
With Best Regards,
Andy Shevchenko


