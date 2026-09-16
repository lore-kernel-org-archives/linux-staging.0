Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8AB38F253
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571888; cv=none; b=eVPQgOfdKqgA19b+Ufw6JZuCx/bkUwDQmO/XHGnQ32Vf90zFhyH80q/1gDzm2TISQw9JKz+evtlggn68U/My7NMxCzJl1WZLEF55cURUOu7/f3utrpa4i66zP+/RH10keDk3z2s3+bQoL6RgUBTfyHYXPrvXNH+XzFaU03Q3wZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571888; c=relaxed/simple;
	bh=VNhfwe1YQNfXfL4xlEP5bFJpLb9Qtlo/4pyZP6bIrus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gerxX6C5quLuE5Ajjj9W8n+rJSjra+A3r5b9+bFqAAQCKNjnO3DK8F33Rc89psHyLeGM6Sc9UGrgyCHPCsdWL4OY/+OLwkwvGphRrQ+CffEGfH7MO3jljreUjRROo7WuLhFLsBBKTdg+tAwO9qc2KeRqc9XZNgN9i6NOR9TrPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COnZZ33b; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COnZZ33b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789571885; x=1821107885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VNhfwe1YQNfXfL4xlEP5bFJpLb9Qtlo/4pyZP6bIrus=;
  b=COnZZ33bIOEmrKxtLcdrmCecpSEws3bLsCvxVQllX+yAKA3w3qJKOT62
   kZRsCj9mxDxPG8Q/aUHfNf+o8xiokSE/VhhRdU1G3GBHfnU0m8CyhnTcK
   oYjwfXazQ5eLfraYFDrNLd1uSmbmRaL/PZhqOMRjO5PbVLOyzCyfJCjRK
   kUOZQVGNw5KvYqxgTMcX4V3MBJGh/4zQmJqdcyHjyUlITCQr0otzgCeY2
   aQOGyLB9tTDmNw7HX8eeYM+qVcDqLkStoYrB1f+bQBg3OEn0wEfwsn269
   Sbw1khPVeQ1IenjuG3/+wKrSPL23eNyroUrX8tkpta5kzvFAtVikn9XrK
   w==;
X-CSE-ConnectionGUID: p+zDCpRoRieKGXTVCz+vOw==
X-CSE-MsgGUID: SWljf4UNQN6zvbrG1DAx6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112719133"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112719133"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:17:48 -0700
X-CSE-ConnectionGUID: UjFCmABbSWSbvLBWnu+Ucw==
X-CSE-MsgGUID: xzBrnVp1SNiA+cWrRKRxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270736684"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:17:46 -0700
Date: Wed, 16 Sep 2026 18:17:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?=D6mer?= PALA <palaomer100@gmail.com>
Cc: Nam Cao <namcao@linutronix.de>, andy@kernel.org,
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with
 usleep_range
Message-ID: <aqqzFxRfbxf14uld@ashevche-desk.local>
References: <20260916093928.52057-1-palaomer100@gmail.com>
 <87ecet5xos.fsf@yellow.woof>
 <aqp4GA1q6cLKivZo@ashevche-desk.local>
 <CAKhZXnr0GdUrEu9vyMAWRCWyQzPM7cWQ6LRDa8fX0hnMkTN0RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhZXnr0GdUrEu9vyMAWRCWyQzPM7cWQ6LRDa8fX0hnMkTN0RQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 03:08:06PM +0300, Ömer PALA wrote:
> On Wed, Sep 16, 2026 at 12:39:28PM +0300, Andy Shevchenko wrote:

...

> Second, do you understand the difference on what
> code is doing before and after your change?
> I understand that udelay() provides deterministic, busy-wait timing required for
> hardware register initialization, whereas usleep_range() introduces scheduler
> overhead and non-deterministic delays.
> Out of technical curiosity regarding the driver IC: theoretically, if we knew
> the exact window between the hardware lock/stabilization
> time (min) and the internal state-machine timeout (max) from the datasheet,
> would a range like usleep_range(min, max) be acceptable,
> or does scheduler wake-up latency make it too risky for
> timing-critical init sequences without hardware validation?
> I will drop this patch series.

It's not only about timings, longer sleeps most likely are fine, the main
problem is atomicity.

...

Note, your reply is malformed. Choose proper tools to communicate in
the Linux kernel mailing lists.

-- 
With Best Regards,
Andy Shevchenko


