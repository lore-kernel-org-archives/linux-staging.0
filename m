Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017C23839B1
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778583528; cv=none; b=mnVNlhn49rbsHiRe5nC9EOqLPeT7WxD9BgxfEDpFms7ZTFY4e/diXe0OdeQzXNVXIaBLlTrh9ZBSDkcUslAzE3QeePTtQvYR7Z8/kzHhclT48pvoSpORgF/2Efu7ZUgCsBUdd/ZEhC/87YqEF+hnmI/YsWEaR/KV1xUkSWEsp6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778583528; c=relaxed/simple;
	bh=hitToUL3oLaAJjR33bcRreUkZrjch7BQjgewsamg+qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUaO4xUzqA4H5/skAcOCaGnvAhvSH68zcU0ThtGteQljtT6d0jal1T0HtypUiHLdfPeIFZ7FFRnGWW9Tetz4wJaTNh3ncRAKiVE1Zye/3Bk8/hSWyEjCpF7J7bIlsVS1R1+PKF2PTWNF/mPvr+wtBAfqnmnEfE8xUcDBvCmJk6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOaFhiWZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOaFhiWZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778583527; x=1810119527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hitToUL3oLaAJjR33bcRreUkZrjch7BQjgewsamg+qQ=;
  b=hOaFhiWZeNBK5FdasjFqNjdBjA9BL556cJXpI8Ak2wXxcPATJwMgmPtI
   5zPxEBW3uNfolsylHjD5qodAZhoj9oCku2WI1r6/L67l9G6S1HitMdiQo
   Q8eTP+j7TJKrgC8/e86ACRR+i8vdRpmmPVRRAz8tr7vibaD8HA7CxhRoM
   m3ruOhvhcRy9ktaXaPHMwRrRmZqjcCaohlIOOcQe/sAAypmR5wIHkNoRZ
   jXm9PgCTdlA9BeXNLORb1vG9E7mzDTa0ZCBGJS+8p2srId0Mg/m+8brxm
   PEGmqmaAM/y4FyFtfsJ2j6LAEpFOeQXnhbnGWEesMFuQllGUtixI9rLNT
   A==;
X-CSE-ConnectionGUID: WDqMtTgSTnuTQQWUnHkpyw==
X-CSE-MsgGUID: GzZ9b4XES1qXdMOxTFgb0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83103878"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83103878"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 03:58:47 -0700
X-CSE-ConnectionGUID: vXcVdzhrQ6OfBrneXwzjJw==
X-CSE-MsgGUID: mHWH5NtSRxK0GrjpAjzi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="235069871"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 03:58:44 -0700
Date: Tue, 12 May 2026 13:58:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: deller@gmx.de, gregkh@linuxfoundation.org, chintanlike@gmail.com,
	tzimmermann@suse.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: convert sysfs attributes to use
 attribute_group
Message-ID: <agMH4iSB1-30ucu3@ashevche-desk.local>
References: <20260512092817.1941-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512092817.1941-1-shawharshit116@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 12, 2026 at 09:28:17AM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() and device_remove_file() calls
> with the correct attribute_group API using sysfs_create_group() and
> sysfs_remove_group(). This is the proper way to register sysfs
> attributes in kernel drivers.

...

> +static DEVICE_ATTR(gamma, 0644, show_gamma_curve, store_gamma_curve);
> +static DEVICE_ATTR(debug, 0644, show_debug, store_debug);

Move each of them closer to the used callbacks. Also there is DEVICE_ATTR_RW()
macro.

...

> +static struct attribute *fbtft_attrs[] = {
> +	&dev_attr_debug.attr,
> +	NULL,

Don't put trailing commas in terminator entries.

> +};

...

> +static struct attribute *fbtft_gamma_attrs[] = {
> +	&dev_attr_gamma.attr,
> +	NULL,

Ditto.

> +};

...

Also these definitions should be moved closer to the related initialisers.

-- 
With Best Regards,
Andy Shevchenko


