Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6C7DA66
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 20:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123976; cv=none; b=fvOaA1wQSSgpyFLxGbA4u46vwoEU3aEJtrDl+dKPy45MLBocBuPFu3CNdzUPZd2a+VDgIjEJ+JARUz8ET6eeYO9A7t0kGo1ReWFDoo8V3RJzt4jvPPAezdGHNS9+PU0nXECSy2xbzFb/5u2oQHxUEl59hvvrdcruc1bI18N9SYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123976; c=relaxed/simple;
	bh=oPEJZpwVqBSX3j71zc0fEfXb8ctzDXsrDHMrCppU+yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1WsFJP6TIlrvKfJU/P7xIkWaZ8y3HLWQ8LOhYtCmK3ec/xgfVl4CoGH3knuKv8aKcyGhZG0YYGH+6ZQgna7muZaSaPOEaTkNhZfdOdWZfjFLScO6G0wEIVAfp4ppavgIPV1lxzFjbw8DRp2P4vV1E2NTjPws3SqFn9l+EqpUXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlYx6Zkr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlYx6Zkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781123975; x=1812659975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oPEJZpwVqBSX3j71zc0fEfXb8ctzDXsrDHMrCppU+yo=;
  b=PlYx6Zkrc8I1GYxcMrOre41LeRLbb/t7vkFVylBEuWabBnAm5ofKHfis
   MWMw/ecsB4LmLUpoSRVcmPj4aXULzbvLPgA3fzcfzUliONoaypGmYcBqC
   WLEQ6W8nLd4AHseDRQqwalULlCOR2w9sCIrTEJiZJwEz51Qy3B9uUyZJe
   RDz6+YVXj3m597MV6KFnFmOIZAas34dZeOup1fhL90tZUqoPF91PrMFpe
   E7KTyIMfpeWPPtFqZuGDivJ0SJvrb5cM+oqa3+XhaL8oShyEHZjIgVLXl
   x9pmyxLH3/99tGT+22Iw63L75qL4rQ/LZBJVKYFL7+GW+9g/LQXsobv0r
   A==;
X-CSE-ConnectionGUID: HBWTt3puRKKur7qvh9B8Qw==
X-CSE-MsgGUID: nsaUIH9oR4uQLj5/tZYHlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92603731"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92603731"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 13:39:35 -0700
X-CSE-ConnectionGUID: A3VjucgAQhemk7axLk91jA==
X-CSE-MsgGUID: DD8cJ/EuQzGhO3svJl4kSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="269959753"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 13:39:32 -0700
Date: Wed, 10 Jun 2026 23:39:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikoloz Bakuradze <nbakuradze28@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>, Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: core: avoid NULL pointer
 dereference in c2h_wk_callback
Message-ID: <ainLgvlx8PEGDA62@ashevche-desk.local>
References: <20260610164755.49626-1-nbakuradze28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610164755.49626-1-nbakuradze28@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 10, 2026 at 08:47:54PM +0400, Nikoloz Bakuradze wrote:
> kmalloc(16, GFP_ATOMIC) in c2h_wk_callback() could in theory return2
> NULL, which would then be dereferenced in rtw_hal_c2h_valid().
> 
> A 16-byte allocation effectively cannot fail in practice, but add an
> else continue; to the guard so the failure path exits the iteration
> cleanly to make the code more robust.

OK.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


