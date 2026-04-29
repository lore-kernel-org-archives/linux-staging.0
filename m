Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B737E2F8
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487531; cv=none; b=hDQiUYkHEY9ndXDwjZHVzYF0ljO2yDvPuMig9KGee8zUyB0T9S60NBJH7HV2qrfD+1EUtZ1cFUgz0xM4qbKZ+pztoJAT6Uaan/V+07xh/dMopoynD8uwM+YeuFetvtdJqdzWpCnXgq5wLx7sSoSwd0JmFH4oy9mQIFwyaYOyV4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487531; c=relaxed/simple;
	bh=c+A1thOKxvdAL6YmJ5rKv0VqzA7VCXlLHWQonkdgThE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn0fZI63a1h49EFBhwkItiBYRmKz8lTvhYRYAuAWq6Btt1I7/gc2FNUUP62sRVAv3dWc63C/omWACOwEXvGOBOSuZh97rC8wu6EDXs5zHojHG31ISdGKk50asbmA73fKbDPGMEdbQaIihvazADbK2pGnfi7XK7n5mq8cH7s+YQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZHhIxMk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZHhIxMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777487530; x=1809023530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c+A1thOKxvdAL6YmJ5rKv0VqzA7VCXlLHWQonkdgThE=;
  b=nZHhIxMkJOttnp8vXb6tZy2pQC+4n1VO3Oj6mjCqSrS+JuZ21mPOl5QK
   Ch3/DS4zal7l4GxdRHa8EgXGh4qMf2R+xst41NW6uzGVkGKc3EKW9mlLm
   qBdC3D2veJa2r5K4IdIQYCoemLzigdty26fwWyTIiS2Q1BT9oiPoi3VsN
   WelI960DI01ySqz+zjY4qvQbJuQZjY2XT9OCErjWrAG2hf2tMINqQTGpS
   H+UKrxD27Lxf9PpS0bNjqhZoCNq1W8Y0R0bNXCxudD0jVXhJy3w6Sphv5
   8232AqC52KTDlyTVgJI1QTAwCfvYnBkRLt2BOGbLgFUNstjl8k6kRYWXZ
   Q==;
X-CSE-ConnectionGUID: 4dFexk8CQ1qwleEs2wHIng==
X-CSE-MsgGUID: mL/e9NoLSjOYWfodtdl6bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82284861"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="82284861"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:32:09 -0700
X-CSE-ConnectionGUID: dm5qz2DqTvOnH2NTSVu2cA==
X-CSE-MsgGUID: 2WgmJhpGSu+9CG/grlLVbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="257926282"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:32:07 -0700
Date: Wed, 29 Apr 2026 21:32:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ia_css_event_public: fix typo in
 ia_css_event_public.h
Message-ID: <afJOpGcHuvMKeuUI@ashevche-desk.local>
References: <20260429180530.6944-1-mahamaryamjavaid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429180530.6944-1-mahamaryamjavaid@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 29, 2026 at 02:05:30PM -0400, Maha Maryam Javaid wrote:
> Fix spelling mistake: Therefor ==> Therefore

NAK. Again, several reasons...
- the multi-line comment format is wrong and has to be addressed at the same time
- the Subject is wrong
- fixing each case with one patch is utterly unacceptable, this is a huge driver
  in staging, it has tons of issues of the same category (spelling mistakes)

-- 
With Best Regards,
Andy Shevchenko


