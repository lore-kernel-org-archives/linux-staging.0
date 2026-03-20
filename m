Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE327FD51
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992549; cv=none; b=epc66PuWNGL/n31rM5B+Wf6ClzXt8CzgADX4NQzdljxX5II1ezQaPgDGiQntpOPBYhP+Cd6PFDZSUu39KVCN3r6IElL8XmO5/UcfrXq57ZqR7BOGPYDna6+l88/uYEp5U94sYU86keNasVW2nnudK7H09QWcyiwxDVwRaX4ssQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992549; c=relaxed/simple;
	bh=4Pxqfpjn5zGdSL6K0KgkacLxLkNVzfJQ/0yQVaY/TSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uquwo7PRZr/jOYw6MoLYa0bW4vOpaW81OQqDFupKLCB9+875R7QzQS01BSdKeypRu3cjsBa0uTIofJb+Q7XuOVQg5HM+D9dsuxF/iNCBRS7WLGbMu1gRQUb7TaajJp/X5S0Hlo4vgkHwx7kVqMD4fzoxJ76J5NpXVdTIT10nxcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuS85+YH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuS85+YH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773992547; x=1805528547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Pxqfpjn5zGdSL6K0KgkacLxLkNVzfJQ/0yQVaY/TSA=;
  b=BuS85+YHGObnmod6pr1K9CpRpJFYxIrNl0WPnvM9U9Zkh+6JZoaONBoN
   AiDBZLyHTQpFhtCnoyey6nFZpkYFN2Hy3Rjfufi2qTRgfgBEYb2GmRrQL
   yOQKvSG3JNQJ1HyqJOPoVJEWT9Tv5Xr+Cbt7JUSmxJVmb+/Ianw35uzcW
   wuHnYnW/cYbEEQ1O1yQlMltnkTLmwi/Dvw9zES8RmkpRcBTzyww8sgBDc
   NVPjM6RBbDYiZNux1m4tgrkYu9zFrQhLgWUPOvl+YhIP61Plv6kghY2/W
   XZmXAXCWNsLDg12h6knI9afWCAWRfhQKw/gm8ilumLnb9mLdPGTqJyGSA
   g==;
X-CSE-ConnectionGUID: g6BqC/ypQmKddDocWI5eOA==
X-CSE-MsgGUID: DmtE08CJTUCsFsXjR9h0OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78932787"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78932787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 00:42:27 -0700
X-CSE-ConnectionGUID: tb3HZiXiTJSj6HewDaUVCA==
X-CSE-MsgGUID: WcbMArauRu25u36GR0Hutw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227687860"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 00:42:25 -0700
Date: Fri, 20 Mar 2026 09:42:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: AyushMukkanwar <ayushmukkanwar@gmail.com>
Cc: gregkh@linuxfoundation.org, s9430939@naver.com, architanant5@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace msleep with usleep_range
Message-ID: <abz6Xkhlgx_uWrE-@ashevche-desk.local>
References: <20260319195437.53068-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319195437.53068-1-ayushmukkanwar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 20, 2026 at 01:24:37AM +0530, AyushMukkanwar wrote:
> The checkpatch.pl script flagged a warning regarding the use of
> msleep() for less than 20ms. msleep() relies on jiffies and can
> be inaccurate for short durations, leading to inefficient delays.
> 
> Replace msleep(10) with usleep_range(10000, 12000) to allow for
> timer coalescing. This gives the kernel scheduler a 2ms window
> to group wakeups, improving overall system power efficiency
> while maintaining the required 10ms minimum delay.

The new API is fsleep().

-- 
With Best Regards,
Andy Shevchenko


