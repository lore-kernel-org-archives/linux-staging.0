Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A023C9891
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 08:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521871; cv=none; b=ZznKfB6epTQJxtTq75pYyOqT/JBuhL9790IVlqjzdIMZZpEJeXwc86iDs3LKGodoeO7JpnbwgbNa+G7/FkegKD8W0qMJcYuSZMzI1y9lVlSrvpAJsiBixgLk0/LBPrhPap1Je2SH17v4eY5eSAQsy1OyuWcNgG2+JKZKEWwm7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521871; c=relaxed/simple;
	bh=krLH8L19wWvVoqVRA6Mf2L2KkdCBHWemGqJJF+7zQJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKrr1Ay/n/TU41wlnlXtpb0B377dtuBvDzAMnlvuaBOuJPEt7aoPUSIrRmBibqt/xINDv89kxihpiNoDF7slKiaSeSuf1uZp69frQ5Tl3sV5Bv85hF5qcZd0adqIuAwW/RWeHEhtLrVnSF5aHMWKbCX8RrzZTwKoZdwyKjkYz2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLt3eu70; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLt3eu70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786521870; x=1818057870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=krLH8L19wWvVoqVRA6Mf2L2KkdCBHWemGqJJF+7zQJ0=;
  b=ZLt3eu707mOEVBsf9VC+vJJfDkq30NFCA2BIHwETLSSr+yAR8qKgEO4s
   1kGdREm0wPWSTGb3vY58QOvLBPJvRaueN/u/N39N1eVCTl7oJu8c7rIWl
   kywvp8ZUvZX16tCKFXdZXrb6InDsB8YriJdaqx33623sSj3RH136paOPI
   SeRd9PHyDeH34ev10D61B5LNXtPidKUGdp3nekM47WA4BlYz5ZxefetNC
   Ci0q50cyxQIQjILVlYEiSv54YRIMjXorMVsKROhj6OzPjqxiJuWNUo5fX
   qLbQYoSRvRT8DlGeNsM0i5xMJ8QID+LLyvObQgMly/1NZLJlEfZKog88P
   w==;
X-CSE-ConnectionGUID: cJOFEUjIRXKsr1C3Zg/h2g==
X-CSE-MsgGUID: zKtL7lFjQDy2AROfcdTZKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109855013"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="109855013"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:04:29 -0700
X-CSE-ConnectionGUID: 1vSCpUihR3OqXTM+Gdhqyw==
X-CSE-MsgGUID: +bv26d5yTeKILWq141a3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="288309165"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:04:26 -0700
Date: Wed, 12 Aug 2026 11:04:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: remove unused functions from
 ia_css_debug
Message-ID: <anwpCCLEZXLBMVfG@ashevche-desk.local>
References: <20260726-atomisp-remove-ia_css_debug-v1-1-1a2fe651438b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726-atomisp-remove-ia_css_debug-v1-1-1a2fe651438b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jul 26, 2026 at 09:43:55PM +0300, Nikolay Kulikov wrote:
> These functions are declared and defined but never called; remove them.

Yeah, looks like a stub which might be used with an additional (hard) coding
done. Since it will stay in Git history anyway, fine to remove in my opinion,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


