Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D552F175A80
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 05:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156104; cv=none; b=bW0maMEKDIdZNYmLptPSSzAi5jJddGiEh0kbc+5DN8xdVo5GB5agsq8XMnP2L/65VpZZcvpz2v2B9U5sIppOEsGNUMp/3IY0ZiU7OaU5oO31o1DpZzmISjmyY0Alw61nLL17Z9M2bfFs3hPn9B883G2h6afbsdMzXmD1zWoXIJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156104; c=relaxed/simple;
	bh=enLo2LxBXG7SCp0mi4x5Y9nFoxfVVaRZ6ltmEJZMwqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3yEUzfBTE/jrhLKy9JA5CbCGdC9TEyKDdUxNPgQA4eLCv5GfJGrCfVK5JbpkgQXysfevqBniPqHvzG9vOQwdYil+BVbZ2hnEXD+SNRTTgJNgcw/rp6gGyEhU8biLQrglSaJxJHYJlFW5GgTLEySm/qdpRb7K8OCJ4RJxDf+G0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdA/ps2a; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdA/ps2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781156103; x=1812692103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=enLo2LxBXG7SCp0mi4x5Y9nFoxfVVaRZ6ltmEJZMwqg=;
  b=NdA/ps2ani7MzKaPmsPmUkGet6gphDFyTCFq0/78ygqYyOePLjxbaFEq
   +7NhFnAV5Ks4SLhqaaJpzva+8vBwkvaBc6rn/49nGFG1ZxzKO8ts8d5Nv
   Cpd+9BJtJAI3S8zDbwS6PZSz0UDcXhsI77ueSz1k07djdfEp/cCZfPSQa
   3lAPSgGdxCBbM3NlLJYDPcWTvn5whhEDnvCTewL9AANhcOA1bYExZxqOj
   OJSRwgKwzjDrbN/knNm78TEmEK0DB2AAv9CjMmtmSUjH+PeK2umF/IZCf
   yfd5wZlZZTSzXknP2Rwyq6r/Xk2zCncRtYI9Si9D4QnMuX9gmtgxhuP+6
   A==;
X-CSE-ConnectionGUID: uaSZWBvJRFmS/35Nd3WOmg==
X-CSE-MsgGUID: XYVfw0nTT7apEqdJFc0vsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99385827"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="99385827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 22:35:02 -0700
X-CSE-ConnectionGUID: cZaITnTdSfGt3wujyN8Bng==
X-CSE-MsgGUID: 4DkVQr/ZTtKPtgM7ywc3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242232880"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 22:35:00 -0700
Date: Thu, 11 Jun 2026 08:34:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: gmin: Use str_on_off() helper
Message-ID: <aipI6J4kDWESZgtA@ashevche-desk.local>
References: <20260610182348.217892-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610182348.217892-1-mertsftl@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 10, 2026 at 08:23:48PM +0200, Mert Seftali wrote:
> Replace the open-coded "on" : "off" ternary with the standard
> str_on_off() helper from <linux/string_choices.h>. This improves
> readability and reuses the kernel's existing string helper instead of
> duplicating the literals.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
but see a couple of nit-picks below.

...

>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>

While at it, perhaps add a blank line here.

>  #include "../../include/linux/atomisp_platform.h"
>  #include "../../include/linux/atomisp_gmin_platform.h"

...

>  	dev_dbg(subdev->dev, "Setting power state to %s\n",
> -		on ? "on" : "off");
> +		str_on_off(on));

Now this goes to be perfectly one line.

-- 
With Best Regards,
Andy Shevchenko


