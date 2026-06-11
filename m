Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB53859F3
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160729; cv=none; b=BV8LSYX6zF0WG7gqXD1FMgCCKgM2TFGTYKGBgu5tsTkmGlbIK6vKD0w7oNNl1yffF65u0x6foCIR92lqluXFN10aCLa1fLOzjUjPznNNYAeCJQwpHmevl4HX6Z2MrCLrzgSNdtMEOcaiWURaGIQHy8EOcxMxu2H84B9yrLpunM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160729; c=relaxed/simple;
	bh=JyJ9GPwwjL3rQcl6LEEG7sapth2wNwe26hXONOupHAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVTGQx7AbNbzh4ECIoBssXuqynbOhaiS8Xurdd1fUyVEOfsp3wV51WN25/OQYCy1b+gtUFFRbGUi5wD1gBMZrg2W1ej5GtypDTsjA8g1fiZifQRY3OLOCjfrvSbU0Nv0Y6TE26D00cB3c9L6YzbTzhdxen3IvRAv8zSaEbPlRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlWRyYyY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlWRyYyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781160723; x=1812696723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JyJ9GPwwjL3rQcl6LEEG7sapth2wNwe26hXONOupHAo=;
  b=NlWRyYyYCjp8jn8G+1YBg1fjOGsdLYzPkTotEbVpG7Iylmi3X5qTGqUa
   RTtUsSYAJ4kKIaWjqkwmyDhGVDlTep1Ct+wakg+eiRm3Qbz3f2jJ9LB79
   JTSMsnBvmb8zhF5Jtt3JBq/Ymb1R2fMeFdO2pM1HmTs2A3Pxr4XejIp6d
   kCHJeZ62xMvy7TUTCB6PAtAqUBzRHOWn8wxzvpNQARIrJysGXttAp5C53
   d+c9UeIL95QDjGfOl/eleRxHflxH1nP1Rg4kbeoT8GxAKFfHmWBWlEnxR
   YCQa0nbmHhaNC9UNb8MX361u5QccRqctFUB+1fac8b4TQfD/Edw3rK8ff
   g==;
X-CSE-ConnectionGUID: qYEF/W1aSOacrFXZPPgBlQ==
X-CSE-MsgGUID: tx18afCvTWWx12qZRYhfEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92288692"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="92288692"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:52:02 -0700
X-CSE-ConnectionGUID: xWFHxS9fRJ6U04Bq/mjSTw==
X-CSE-MsgGUID: h6TKCF53TXC9oiudIRneUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="245274072"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:52:00 -0700
Date: Thu, 11 Jun 2026 09:51:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: gmin: Use str_on_off() helper
Message-ID: <aipbDeEFbXam1WPN@ashevche-desk.local>
References: <aipI6J4kDWESZgtA@ashevche-desk.local>
 <20260611061417.11747-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611061417.11747-1-mertsftl@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 11, 2026 at 08:14:17AM +0200, Mert Seftali wrote:
> Replace the open-coded "on" : "off" ternary with the standard
> str_on_off() helper from <linux/string_choices.h>. This improves
> readability and reuses the kernel's existing string helper instead of
> duplicating the literals.
> 
> No functional change intended.

First of all, do not chain a new version to the email thread with the old one.
Second, you forgot tag from Kees. Why did you not take it?

-- 
With Best Regards,
Andy Shevchenko


