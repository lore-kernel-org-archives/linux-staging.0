Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4E30DEB8
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302714; cv=none; b=dzFvOd3REyE/23Zk7sR1S39yI17+afhmab4soWXkO4cGvHTuz9/1yUuj26t2zJHdFYOcc5znkFsaCHvhROltsZzualatAia1jeUWwqqSzuMrNA3T4hI8TwkywwMYEYdHAMgBfuKzwzKJcDIQ4xgzk5VG2tUpqDjZR7/aOtxzNWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302714; c=relaxed/simple;
	bh=oi5lLnnIEO6XUNJojvUhkK9Z723NggAS9ES44szxH/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8KJsmT1H63j9FGg2ES3zHmBWrS1aMR2YZhkJHOIKBrV2Gf3rCDAAYd1s/RYNUhAUhWLhpMfEzfnFYcajgHW82zaEYxitS0upLwP9FIZNVE9WaORl0F51CQxF0RtVbN4GZRHhEwFugpu1qiotbKmX6zslllX1e2Sugrr/VXnSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3G5oLDr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3G5oLDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782302713; x=1813838713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oi5lLnnIEO6XUNJojvUhkK9Z723NggAS9ES44szxH/k=;
  b=W3G5oLDrL5jl4tqntT6RkoCC0d6pW2x6dOjH2XDbII2VzayFuGy6FRv3
   kg5W6DNvGJxhH7ut41LZkXwp9+OQoxgxy0cQNgyLhoWzxWcF/oEtmbWyP
   qiBW9U+ZsJREx/heaVfCRYdSEqjc6kP3isGF1Qm1YmAC2fs1RWt3fI4sT
   mU0tAwChmyjLfLc4y94RaSH8bZBiwHwBQY8yINhLLBuKgh7b1kHl16P4b
   WiDwNIOcnEPqVkGmnqK++Hn63Q+FnrjzFWii51kIg31fHI/Vry6fOD1DS
   RvH87GZ81MNZwnZb+TK3d1B7ZPxAm/20RL26J3e1bXosZlgViaUyxISRJ
   A==;
X-CSE-ConnectionGUID: Xe8dkVJ6QNmQ2coBWGg7Jw==
X-CSE-MsgGUID: 8gUtkYGJSPaYH9OaVCB/BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86742965"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="86742965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:05:13 -0700
X-CSE-ConnectionGUID: 6HS8kThQRQmb5SoOSwPwJg==
X-CSE-MsgGUID: yeQaKMvtSSC+p1iiOcsl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="245719506"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:05:10 -0700
Date: Wed, 24 Jun 2026 15:05:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] staging: media: atomisp: remove dead
 platform_support.h header file
Message-ID: <ajvH9Dcdi1DpFwO0@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
 <20260618151246.6678-4-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618151246.6678-4-igorpetindev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 18, 2026 at 06:12:46PM +0300, Igor Putko wrote:
> Remove the platform_support.h header file completely as it is no longer
> used anywhere in the driver and its contents are obsolete.

Right.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

> -#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))

...assuming this macro will be still alive in the only one header.

-- 
With Best Regards,
Andy Shevchenko


