Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1033F0768
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522122; cv=none; b=YpBqwotjfRgUgWXHJkYl7oYgghF8CeQDZBO5r1tJm7cehNJP1OEz6M4/eioo98ArlDa8ZHnQD3T1b1TMsyL5fzVzPslm6RSgoTsrMa00vgPcgtFlOkmqVdXKI349ccGtxZZtKwX/0tz3rsyMpknrXw5Gb+X7pXmaCb9N8+7pShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522122; c=relaxed/simple;
	bh=boew1voR+RqWMQHqDlRsgrsLVOMNSPD7NOVr/aN+gc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFrJrkS7i2NaP/kZ6DJEJR6SNROp1vQCC2C+AJfuEmUi4Zztif5wjKwgM0TMWfggT+O7iaWX/YwHfsQqEb4pGIpOLX1OIhKE03s1ADBEWJ/IouNpqTXArbBTZRJmXALwj8szdmOLDuFVsiE3n0UPGSqQ8LM0+P428P3x8owrEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGbWLMrH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGbWLMrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774522120; x=1806058120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=boew1voR+RqWMQHqDlRsgrsLVOMNSPD7NOVr/aN+gc0=;
  b=UGbWLMrHsyPVFRouxR1l+u0AdXis/38AYykGo+p1W/l/jkXtR+NyEQM+
   mkgW57dzozHHx5uZjM4d9W4INbfYssLtIbRZYZ71uU4bsuekXkM52ME8q
   N9ZGMlmuXgLBf50/psjnsRB1i7YrkT2BdH9tpkiyM2tibgeg656DNI1DA
   J/tUsnb/3bYoZWSbKCAEMS72z6EVy0a3xUQEXxw/hUp3Qh1zvkebJn3YT
   LmV4Ls+TpGJYeIvdisgJwmHYpdTBOevTOz6vwhDJenWYb+iR1cQkpsz7m
   peTL5FrUIzkXNL8W9PdLRc3LiuYqmxf0SVBFG8UJajjRaqqf1DQssO+lH
   g==;
X-CSE-ConnectionGUID: KXHd2htfRsqfAWjXK7bCLw==
X-CSE-MsgGUID: MnLD5rbbQl+wVK6tzix9Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74757872"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="74757872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:48:39 -0700
X-CSE-ConnectionGUID: UjqT+Ni/QdayjTDTrIpQPQ==
X-CSE-MsgGUID: zG5nmWpQTuqbysC++8PH6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225227272"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:48:37 -0700
Date: Thu, 26 Mar 2026 12:48:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v4] staging: media: atomisp: pci: fix split GP_TIMER_BASE
 declaration
Message-ID: <acUPAphWdppMoFBw@ashevche-desk.local>
References: <acPQOplQWD_-saf9@ashevche-desk.local>
 <20260325132434.55775-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325132434.55775-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 25, 2026 at 06:54:34PM +0530, Anushka Badhe wrote:
> Merge declaration of const GP_TIMER_BASE split across 2 lines to improve
> readability.

Nice, but this constant is only used in one file, id est gp_timer.c.
Just move it there with the (fixed style of the) comment to there
and drop the mentioning in the rest of the files. With this being done,
the patch gains real value.

-- 
With Best Regards,
Andy Shevchenko


