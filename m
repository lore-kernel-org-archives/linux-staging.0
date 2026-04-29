Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C641C2EB
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487363; cv=none; b=M67bWla0Kiftyvn8cNxJZ2DTSNWHbkrM6PhBn6sbHEfmTNVKDbUejCkbq9wa/H6t62ULB8c3ttYJc3J13Z68gP95yC9n3KFWuCY7bAu5fu7jTBJlcMHmw0THXisbeeOZfkrLw7voDlMfacqACtMXC0YPvvN7uI2tuB650cWvpB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487363; c=relaxed/simple;
	bh=q/KSIHY14e1W4SNTauqTxlUINrIkxcG4qw6EfsqQubI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYsOy7EHTh7qShzkTEh6GNpwwz+vpp8998kPEeKYjAvcHbhJX5ly1EEXZALTMrjQEXW6m79cpdZFyo543I2TXNA7F7Dl50CIoYNYBCk7vy8uq0TEM8pr3N+dJLmcrtaS6lXk8lOtD5WOaECtoaXuahbP201upS1FDHeaSYDUhg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUH9kpkz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUH9kpkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777487362; x=1809023362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q/KSIHY14e1W4SNTauqTxlUINrIkxcG4qw6EfsqQubI=;
  b=YUH9kpkzWfvBRniuEEmtCtXwTwYwUXsTcoPNjsbn5s2SdK+JVYYVpeQj
   nwauFV5cKEmwv9ycLt9i+/ySjFqXaijbbCfrF4THjTpSR3wM9u4Ejf0cA
   DYMHz04nB5TmlNAy+Wmh6xWtPKCj9mB/XUJWgcwiAHMQ9iZL13R3pVgIQ
   muybqiJ7Vo7nQOZjnToaxW1SafREZkV3x42zfaSDRyzZY7Rx4nRyVZL3C
   8ijkb6/MkSg2zD44TT5X9wtUNgcYxfmeJJaDw0XOLPJgvJ/0cHoBuQvWU
   62O1Fq92Sqg1JzdqPx5L942E8yjleWFCDLn1NDLcGPGh4cfOu5709PRmh
   w==;
X-CSE-ConnectionGUID: JcK7UsfCTvSqOEQ9Wkr1Og==
X-CSE-MsgGUID: gwQSlpepRHSTfzQ3UxGrhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82284492"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="82284492"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:29:21 -0700
X-CSE-ConnectionGUID: aH+wj1ljRKijz1f/a3b/jw==
X-CSE-MsgGUID: fLlrym/MQbGtdOVIyPqfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="257925630"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:29:19 -0700
Date: Wed, 29 Apr 2026 21:29:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ia_css_isp_states: fix typo in
 ia_css_isp_states.c
Message-ID: <afJN_SzCzXTejFXR@ashevche-desk.local>
References: <20260429180148.6581-1-mahamaryamjavaid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429180148.6581-1-mahamaryamjavaid@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 29, 2026 at 02:01:48PM -0400, Maha Maryam Javaid wrote:
> Fix spelling mistake: commmit -> commit

NAK.
This has a few problems:
- wrong Subject
- not doing that across the whole driver
- repeating the work that has been already done and reviewed
- the previous work seems in a stale state, needs the review being addressed
  (but I haven't checked that for sure)

Instead of doing this, start from reviewing others' patches and learn from
other reviews before doing your contributions.

-- 
With Best Regards,
Andy Shevchenko


