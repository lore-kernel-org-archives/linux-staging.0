Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1124F38E11E
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 08:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326910; cv=none; b=HpAqTdIu7Aey3NweYHzwcLEBvJqB0jmTtXT3G6cP7INYy8RTquVGuLOmd5gfhmE73L1IGCS0G9AK2TaHIP9tJNuYAIqIR1akKrGheTY2UvzSlb7MGXBda+QYnJuTKixyG3OTf00vaoIWQYHSbBYUU2pE/tj453eMIYq1sZwgLds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326910; c=relaxed/simple;
	bh=keGN/xak6/MrOTvkHrBIhbrMUPisZA6Ph+/eke6TMQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaEZiYAVykhNiwTmBMpTrXEFyR9a6nudi08W6BYxgSEQRBU3qtEkVQeLmgL35CW9lRIy+VgkV9jimsSOBbKZEgbL6Gt0ed6qmnnui1FiOPx/w0KMxQ4jjB+sOWxYh/1zypzWmyxIysgYl8Bh7gHVpLPUujBOaDhYIC/sZSmQoQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGH8ybmZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGH8ybmZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776326909; x=1807862909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=keGN/xak6/MrOTvkHrBIhbrMUPisZA6Ph+/eke6TMQ0=;
  b=GGH8ybmZve3y5+DtIU0mGiPca8WKmlWxBQ6koO94zQB4tdWq5lcvx4b1
   eS9uzTZWxiTuc4EfQtogye1C261s+LQ9zKImFQSY7DzPPVy7pHv6+ttua
   08+2OVgsOel/lKinNyTHUW1KwDbAo7v9zgLAJM1WTK9uN6S6BMoR9tCq1
   dXDBt7dufHdhSwy0FhOLvGyTvCviHn6UASn4Wt7iFmpo6pzIpd0iiRhzB
   3kTcG5BkH+JgWnHXH3swok4yCAeY5tiyI6WiEDjU8y1jd/3wI7pL6GoxF
   AMnJK18X9ttcAIZWYHtk8l/Th4ODg8CPFLU9Ks9WXbur3Shy2PnqeLKe3
   Q==;
X-CSE-ConnectionGUID: RIp6YJjUSfSdLIRsiuSBdA==
X-CSE-MsgGUID: J/W3YLIoSLGY7Eqt305HRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77226683"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77226683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:08:29 -0700
X-CSE-ConnectionGUID: QfdDD5mOQSuzrx2K0XUvdw==
X-CSE-MsgGUID: NpVYhoTLQ1yEwLkIfuhjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="225946841"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.173])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:08:26 -0700
Date: Thu, 16 Apr 2026 11:08:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix memory leak of dvs2_coeff
Message-ID: <aeCY-B8BQS7whIwP@ashevche-desk.local>
References: <20260416064152.2482461-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416064152.2482461-1-hhhuang@smu.edu.sg>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 16, 2026 at 02:41:52PM +0800, Huihui Huang wrote:
> Our code analyzer reported a memory leak in
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.
> 
> In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
> ia_css_dvs2_coefficients_allocate() and stored in
> asd->params.css_param.dvs2_coeff. If the subsequent
> ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
> returns -ENOMEM without freeing the previously allocated dvs2_coeff.

> My patch adds the missing ia_css_dvs2_coefficients_free() call and
> sets the pointer to NULL before returning on the error path.

Please, read Submitting Patches (find "imperative mood" there).

...

The code looks okay, though.

-- 
With Best Regards,
Andy Shevchenko


