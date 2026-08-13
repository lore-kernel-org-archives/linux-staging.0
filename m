Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348F7451988
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614288; cv=none; b=HpDFbKpZcaA7kqSBWGOaSDiWSXoelrrzcswtuWfgPjsqap+cZxW1kkMVIv1sJdEj25qI6Ut/e5QXjOB1p/krkUfK6bAloZaE9TCDyWCOL6PlZnkpSPJNxO/9vMeZ1wF51lHVNuxyrlljZJHnkvhdy4apHjH1eSW5rNP/CPobXHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614288; c=relaxed/simple;
	bh=rvY7e9bR8LvFPSgPMw4iRngEmcMGm8uqxFiy9fDTdzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=equjV1BypJqIq1UXs5qGePxBQZsBF6LuJHFQgY3PqUkvuzsqE0H4Y0wAiDsCa7+oj4+9Df1Fq1dno4aWwxCvSHkrhuhy+c4DuYHQ0KPDNlpIi7bjUQue42hxnwqAZkf6a2Sw28rPHF/LrOn0tk8+YQ4a/DJZjVe/z0GwgGrbqbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awllfWYx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awllfWYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786614286; x=1818150286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rvY7e9bR8LvFPSgPMw4iRngEmcMGm8uqxFiy9fDTdzk=;
  b=awllfWYxGvpZkyQTHkLew56abRnjputGyZ2mUhGOdxm0GKDnK8B3FlEH
   rO9lhT0JgWCmwmzhBnjZpUbP9RvMUDKu7SkXBx1PXb2KCVrW1ehqJJO8C
   QUptVpYf91y8Ua14ydmNfDHWQx1y2FvPTXaKI8kysh7vk90aDLi5chN7n
   WFE9a/hcv28fslzgUiIES+FQItPbMhtI4U4EhRUaSX61CmQRr+S4v72ib
   i9p0xv14o8If3ZcnfIfTV8KDMkmDzx0jr0U2Sma17NWG7vR4W76lfMD7T
   pkdaLpzfecd1Mg+lKI+Cs2WMQzQSVZVCo+XXmuY4EOVnDCI/9yYL7e59F
   A==;
X-CSE-ConnectionGUID: HQd3fnyfQ6SdVT9p6DkSvg==
X-CSE-MsgGUID: zXxOZbFKSG+RF5JNuBWXaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97772243"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="97772243"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:44:46 -0700
X-CSE-ConnectionGUID: 2E6NsyLQRkaFuLHZaXtJLg==
X-CSE-MsgGUID: PwK0xQQKS065M0ygD4rBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="288683501"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.250])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:44:43 -0700
Date: Thu, 13 Aug 2026 12:44:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rishab Madhugiri <rishab.madhugiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Use ARRAY_SIZE macro
Message-ID: <an2SCK1slBHQNNB-@ashevche-desk.local>
References: <an1vaFk4UrhQPkSu@stanley.mountain>
 <20260813075529.153217-1-rishab.madhugiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813075529.153217-1-rishab.madhugiri@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 13, 2026 at 07:55:29AM +0000, Rishab Madhugiri wrote:
> Clean up loop bound calculation by replacing sizeof(bds_factors) /
> sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
> to improve readability and maintainability.

> v2: Move loop increment to the same line as the for statement as requested.

This should go...

> Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
> ---

...under here, so it won't be included into Git history.

...

> -	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
> -	     i++) {
> +	for (i = 0; i < ARRAY_SIZE(bds_factors); i++) {

While at it, also consider

	for (unsigned int i = 0; i < ARRAY_SIZE(bds_factors); i++) {

and dropping the above definition since i is not used outside of the loop.

-- 
With Best Regards,
Andy Shevchenko


