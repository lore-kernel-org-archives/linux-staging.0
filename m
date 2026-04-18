Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EBA34405C
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 22:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776550089; cv=none; b=I5R95KYB7vA9G/6LWAry62shUp5Zz5v+D2Wl7Jcy3uiqjDiMdNh2cZ7z5RiIWErV3nhZnSXICQWbv+iMInndFSF2OVtAeEhupBFQP3dBkJ7AIDHQykUedLMjHQQKe51CFu39Jnez1bok4F/pAi37/R+ztEjMJMB9wCXZELRrs9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776550089; c=relaxed/simple;
	bh=LHggFu5X6DQj1Y3ffsBiBSLPcKGHD+QJfDL4oUYMn1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOeWXdkdi00ShYaieHQbcPV3Vc1OHjzZeb3hBHMQqg9xpjR4eqXDNZjBFjWJvaOyriq/WCWv6TIhFDf1n+pikRYLatVoCVrkaBluH7JATSNZn2bMX1Mei7s7MkEHhMM3wtbryK6FcZ8F8LlIoUeQP156yA+hbOVqoBiSghW3mzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ax1FZhY8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ax1FZhY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776550089; x=1808086089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LHggFu5X6DQj1Y3ffsBiBSLPcKGHD+QJfDL4oUYMn1A=;
  b=Ax1FZhY8LpA0jUSqIVwWuEo4p1KoFxVylfW9o5jG2YJseerR+NvwhbJl
   wodFRz/R0SpPrO0/QiTuMIpZVZLtz9v5IFGzfy8wfiIF8XmYp8peRD7ua
   0Sg79O0H3AEKxA1pzYAOmo1G0Dp811UoH9XpJWc8iluQjj1ZiNZ7Tat3X
   p1GPWHxMm/PiD8bWXdLsJ5SeVWK4G278ShtwlntML8Fh2O8QxqT8XasFt
   YBH8c+gFY1n2KXMyY4Zu6LO3H/W07aGoP57X0HOwOtZZ+vgPXwD1fHk5C
   RVaRZS8PE6aeSXloQMTO4jpe4zk1ShOp7psoAKo7JtI6XsceJvfOLwwiq
   g==;
X-CSE-ConnectionGUID: QkO1WLkbTZKARJkDtC61gA==
X-CSE-MsgGUID: Scqllv+oRY6+/MiPJo8Z/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77640125"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="77640125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 15:08:08 -0700
X-CSE-ConnectionGUID: GMhyQXDMS9yYtrCgxN600Q==
X-CSE-MsgGUID: JfRdKs5rTxmwT4yrmLhf6A==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.248])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 15:08:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 790C812116F;
	Sun, 19 Apr 2026 01:08:02 +0300 (EEST)
Date: Sun, 19 Apr 2026 01:08:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Abhai Kollara <abhai@protonmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: gc2235: prefer fsleep over
 msleep
Message-ID: <aeQAwiVqppOYy_5h@kekkonen.localdomain>
References: <20260318212645.2014561-1-abhai@protonmail.com>
 <20260418201755.2604188-1-abhai@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418201755.2604188-1-abhai@protonmail.com>

Hi Abhai,

On Sat, Apr 18, 2026 at 08:18:01PM +0000, Abhai Kollara wrote:
> The gc2235 driver uses msleep(5) during power-up. msleep() is often
> imprecise for durations under 20ms. Replace it with fsleep()
> to provide better precision.
> 
> Signed-off-by: Abhai Kollara <abhai@protonmail.com>
> ---
> v3:
>  - Use fsleep() instead of usleep_range() per Sakari Ailus's feedback.

The commit 968d8904c2f86996b0615a08ee4048bccac56758 apparently already does
this in my atomisp branch.

-- 
Kind regards,

Sakari Ailus
