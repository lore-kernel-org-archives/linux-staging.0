Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634634E3EED
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556773; cv=none; b=lq6iZgyDzMJc5/EBs52lIVWYZFhw7RV7SqfLQi4hNHi1OouY/dyr3MPTGhiLPZoy84162uV9CPIc3G6NvqCPsXzuK/AodBHhSnhmkFC9UcQ57Z4wQWpt7wyjBQMVrk2vGWTnZz2LJgBj/nlMoomteiGX5l7LnSTVLRIXFGQDyYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556773; c=relaxed/simple;
	bh=HzRpDUemKObzUrc8XbP7CS1ebBC8gLFixWIizYLS1YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niJ14M3nxeyFxfwvQErhM+IVHEII/N8tdyDYQ/aBbiBAIoN3aAn4LfZ1alWmoruAteJES/jitEebB8xqtrgvuCpWkDGFfO/l56AfMXWhl1yXEU8oJPX9SqgU/aG1LP1FZ61msP+E5WL6bNtUZun0yPyCEEzxoZYOt9dpFtVriYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBGNo2pW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBGNo2pW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789556768; x=1821092768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HzRpDUemKObzUrc8XbP7CS1ebBC8gLFixWIizYLS1YQ=;
  b=CBGNo2pWq/wg8Fyu4Jpx56kfBzXQoq8Iw5gA3CfIj+psLdg+nvhwHX2Y
   2pb/BEgFSpPhdKaggwMEi0weycwCqVf93terl0KdJtS4/SNOIKcW0vGUJ
   IEeo9k3F1HxVwEyak+FzNZkB2WtrcES1VMuhdq5/goHcBU56c47DsXl5R
   M9m+mjlq1crPwbYS5IIblwL4NpR7JKQECJg3lRa1OJdaiNHQcw3dUlw8I
   CVsgc5Tn1cvRxULe86YLwtmO8pWB9V4TQeRpfWG+8Xyz4UHs20lwTjL5T
   Swj5AZ65UJwgjRxwbxv+SNgq/fnMwD8e1Y0IsAaEYI9daI0P9fRrlZFFf
   g==;
X-CSE-ConnectionGUID: O1WxN7qiSdC9tUL91xnyVw==
X-CSE-MsgGUID: fGSrkjhRTfeYf3+22M9CWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100255069"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100255069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:06:04 -0700
X-CSE-ConnectionGUID: hL6MRQfjT8WMVh/W/Yapgw==
X-CSE-MsgGUID: 74I0UvttTXCxG+cNXNYKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272832452"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:06:03 -0700
Date: Wed, 16 Sep 2026 14:06:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Omer PALA <palaomer100@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with
 usleep_range
Message-ID: <aqp4GA1q6cLKivZo@ashevche-desk.local>
References: <20260916093928.52057-1-palaomer100@gmail.com>
 <87ecet5xos.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecet5xos.fsf@yellow.woof>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 11:53:55AM +0200, Nam Cao wrote:
> Omer PALA <palaomer100@gmail.com> writes:

...

> Btw, I am curious why we have these udelay(). Can we remove them?

Once again remind people that FBTFT works for both busses: SPI and parallel,
the latter one is usually GPIO-based and quite slow (I have one of the panel in
this mode, it gives me ~2-3fps at best on a 10y.o. x86_64 embedded device).

Maybe that's the reason? In any case, I think the datasheet on the panel should
answer the question.

-- 
With Best Regards,
Andy Shevchenko


