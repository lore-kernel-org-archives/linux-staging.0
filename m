Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40360271456
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 07:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566042; cv=none; b=ZtE6ZSZKwplJpk0RZrUZLu0n0ePvr6m+dwX00tGK7y32jCznb+Iy4F2GngErVLaDjRcRWjr9eRU9StYJxpr9Zq88zgkMyPPHlB3EuB0BTSe4eHMCiDMgBwN7E/u/50eDgJnLWKUJw511QCoo6ZK69liIPsyQJqzBQhQ6Nu26Mkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566042; c=relaxed/simple;
	bh=H4m5oSC1nR2AarBZa1hl5JXW8yLzj74JwgaA7Evvw0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lE/O3asXzdaLGYSswut9RWlzdr39IoENyg0yCbnTxYeaaU2DuLA2rZFUVHCkLMOrtCHx62QLag162gVN+GktblpBk4wHmBOA0U/MipjpZnpL7N4cESX8H5pELsZEbpu1KHCKZh1oSYlag2+GKQd+94ZS7zDY1UPA34m+flbztDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgVvjAdH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgVvjAdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752566039; x=1784102039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H4m5oSC1nR2AarBZa1hl5JXW8yLzj74JwgaA7Evvw0I=;
  b=IgVvjAdHZMzme6XULwOz/IfDmLZ0g7B+HbHt302MAStWfZRBlcMYAdwX
   LSG2qG+MTXA4dpB0f8W6JU6WffBqR89fVH8MxGyR7VtkMAx5mY9eNe1WB
   ElBSrIcwQIbtmozk0FCxmDIcLY/bi6sNYfKii7yxqCE9JPV44UIS4fQQR
   5ZHb2xc/ezv/R5HMz5YuubHH3jKcpGwoWCHu5WtT3zRm7TLDHbCW5OZ/e
   RCoEYhhmXp577wAG44UY8wOf0YQZNK51O9qRaD9eEDhoEllSC6DAS5Cku
   hUw1o/hb20J5bEfdp8xUTCV1hwSTdwIya1rWQaTL43d+d9HVTGlio6+YA
   w==;
X-CSE-ConnectionGUID: /t0w9HxQTEexUOqwskR3XQ==
X-CSE-MsgGUID: LSMVFwJPTuOvxOf/dP+2JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58582312"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="58582312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:53:58 -0700
X-CSE-ConnectionGUID: yDNdncTuSLWNm6oACd43GA==
X-CSE-MsgGUID: BIMPCaf0SzSxiLLpr+0Slg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157247490"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:53:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubaU4-0000000FaZK-0oqx;
	Tue, 15 Jul 2025 10:53:52 +0300
Date: Tue, 15 Jul 2025 10:53:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
Message-ID: <aHYJD4aJDOxZJmQT@smile.fi.intel.com>
References: <20250714153409.46085-1-martin@weidenauer.cc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714153409.46085-1-martin@weidenauer.cc>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 14, 2025 at 05:34:09PM +0200, Martin Weidenauer wrote:
> Fix checkpatch error "ERROR: that open brace { should be on the previous line"
> in ia_css_dvs.host.c:277.

...


> Hi, I hope this should fix the indentation problems.

Missed versioning and changelog, but otherwise okay.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


