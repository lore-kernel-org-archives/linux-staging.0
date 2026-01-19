Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C01026CE32
	for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768808408; cv=none; b=qeurLm51bQcrTqU0e7mYpkeAJqLJou6TAafWO38N153eSMTWXT5rm5w4wvo3VFF5Fvr5nXAAYNCmXOXtD7Z2SRCBSdumUFe4teeX5xaHzPk9aWivSM2rISFvUonfn6W3+v8Bdza5R8q9W6y/S+5Vl3aC7fXYP7Nya3TYZx+35hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768808408; c=relaxed/simple;
	bh=FEF46I4aDVNF7PSwzPPe2285i3zXrTuHK+VlQ38y0yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0kcyVABskS2tb0omU7RgLsUvW8EdruYz4yItFfuWT3nTzb1K4XKTl9wRwQ+rRtxwAAPB2C3vYLIKCxvrGyYKmLHWWUp8dT7OjX3wsttOfQeZOXw/i6c39XIBv4lDHeKR6bBYhowci42CkyqSuIMZlWVUB1Nzj/a3yLWfcMhABc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAb8EDlP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAb8EDlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768808407; x=1800344407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FEF46I4aDVNF7PSwzPPe2285i3zXrTuHK+VlQ38y0yQ=;
  b=OAb8EDlPMcugNhaEJhpwbde9sM42MM9rJ+McH7imVZp/gaFtny8XEiSU
   n8CTb68/UGiq3hIXTXr4RDHy3EfK+3gXU/5QK/aVOZ8wKFjPLy8cVozwF
   QI9uSed9GjWy41CVRRnMYBsh/g5EeeWies00DS8baQe+UNXDa3bj1eiyK
   G7MffVLqeOK9sqXOGgzNJ8kHdbB8GTj8pfdmzV9HjWgWoD5/P5rXdcdgs
   z01SaDIYjJgg6eXMb66eV53uh3J+8fIZKq+iRYeDPRkptY4N27oaMdLCK
   aSO8S/uJsCLME+bgrIe59TQlJ+2j2y+OqQ8WV+kI+zwX3FXuLzdKVQqvn
   A==;
X-CSE-ConnectionGUID: WcpyQRxIRa25nbSQv8XINA==
X-CSE-MsgGUID: YY1UI4QSQU2V5ovV1LZvoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87592119"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="87592119"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 23:40:07 -0800
X-CSE-ConnectionGUID: ckz6wRWATlmv6uEVbo9SXQ==
X-CSE-MsgGUID: CbpLF8SjS8WWBpOdV93D2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="243365109"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.37])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 23:40:04 -0800
Date: Mon, 19 Jan 2026 09:40:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/2] staging: fbtft: Fix build failure when
 CONFIG_FB_DEVICE=n
Message-ID: <aW3f0L_B_UIbaNj_@smile.fi.intel.com>
References: <20260117042931.6088-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117042931.6088-1-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 16, 2026 at 08:29:30PM -0800, Chintan Patel wrote:
> When CONFIG_FB_DEVICE is disabled, struct fb_info does
> not provide a valid dev pointer. Direct dereferences of
> fb_info->dev therefore result in build failures.
> 
> Fix this by avoiding direct accesses to fb_info->dev and
> switching the affected debug logging to framebuffer helpers
> that do not rely on a device pointer.
> 
> This fixes the following build failure reported by the
> kernel test robot.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


