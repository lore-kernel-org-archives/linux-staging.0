Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAB3596E3
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020960; cv=none; b=qBCZx21kezbx49wRSA8rk6tcPM6nwA6GK3MunVN02Yzk+ZelqmtH5ye/BckiU33vVQfbmPx4Vb+CLKHvHnPr796e45r7HsHM3UnqYqt44M/72YyXLdNdie5jZuFCoIS4gUKO5AtF47KaR0Zz0yDjxlqYApI6joYnx2zVMSkPBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020960; c=relaxed/simple;
	bh=2wvdD0zm2wk4todAzcvDJprt+3qOH3R4mx++pspQyxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTwwXkzlESu23bS5nwL9RK9nH36H7Oy6YHmTsRbom7HkXwauIvmov8lcj/gHUz5V46d86b66Z+Nk3yOT5ffLdwrTSeDJ8ROQ7IuF0xi13Tv5c22FhGOjPUQZZAnwTcu/E3qmx4fY4Eu3eD/LFEy3UrV5hUzJWBmn1bho9fXzJ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6/P6Ceg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6/P6Ceg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777020959; x=1808556959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2wvdD0zm2wk4todAzcvDJprt+3qOH3R4mx++pspQyxA=;
  b=W6/P6CegDa9baB+Z4/Tl1VpNCbMbBfdYPe+4E/Xd0ruOPRqu+tkoS0GB
   onPTHYhitgpxSKaIL9YTYEdsP1QdfSgmqdKV8oOW095jVX/NEaKZnr0i/
   OT6HDvS1h1cX9QDVgX/BGrS6kiaUc/XY5Kvs0spT4ZprP7mXKk2ZEfOtR
   m0qE52M2He63YlR6XX51/S3P+lWJdM3F4RoH7mF+7bl7YKTTTNjgl8x29
   qJvVTBxj033P4PdDLo2Lp4lk9koFQVKXhY0rdAJh42gq808yT9BkWvC90
   XQpr1B9HcuAgHNiu+0/tpUIZj4q4okBtGt8MbgvQPc7+yhL1s93rD8cjB
   A==;
X-CSE-ConnectionGUID: VquH+CE5TKy5Em7Jh/3nFA==
X-CSE-MsgGUID: xwQ2PsT0SO+Ezoity9GLRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81604942"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81604942"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:55:59 -0700
X-CSE-ConnectionGUID: ZywFuEM3SRWG9RtMCsPm2g==
X-CSE-MsgGUID: 4KEozX4lSBypQIyHY32csA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="256420292"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:55:55 -0700
Date: Fri, 24 Apr 2026 11:55:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Everton Colombo <e.rcolombo2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] media: atomisp: Remove unnecessary function return
Message-ID: <aeswGWHvGTOxmu7a@ashevche-desk.local>
References: <20260423183814.84729-1-e.rcolombo2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423183814.84729-1-e.rcolombo2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 23, 2026 at 03:38:14PM -0300, Everton Colombo wrote:

> ---
> Hey, this is my first patch! Any feedback would be appreciated!

Please, start reviewing others' patches for the same driver and read other
reviews and learn from them first.

I'm not going to repeat what I said already several times on a patches like
this over the very same driver (atomisp).

-- 
With Best Regards,
Andy Shevchenko


