Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE863C942D
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134241; cv=none; b=iOTSPbV6Adlxzy+uXA/ffynb06orPKDOP28yWdj4UN2IZQXFhz78SAJvjlVIJe61mHUdH+u7es5aibF7TrPffgC8okYLxxdJcq/JLU2Ma2JwoKHOXdAFmc3pyqs5XHl8WZ5/aBvwDdtVQgJ8+TdQm+7OQVU4TxVyCAXL5aqZ7IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134241; c=relaxed/simple;
	bh=tibweY+B+N0uBAl5xfAd8SBcdQVS7DQKA8+tBS5xoJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHCM32KAWWqTXq/tfZTGvDLgndbQV/hBNwSeHg67v4NVl44+vw06htT1ghnkjWGrbbQ0PagSIw3NKm8ceCheK41IQ7Hi1xeHQsEhPhznIMJ+OntXRe/2gGDUsY7r/H/9WzK4rizbMaPTP1ol4VJz4oMB+TruPGBU84P8Gmef9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nn8RcMLE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nn8RcMLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775134237; x=1806670237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tibweY+B+N0uBAl5xfAd8SBcdQVS7DQKA8+tBS5xoJ8=;
  b=nn8RcMLEOJGKVuuRtRVK2diDImlPN1J8YuyeBqfZHYM3k6f6cig+ow0c
   YfJPncQ5Fl9L3xjo44kC2hE3Xd8boHRLyeBkqmCu2NZqAee5+EsZrCvPq
   99Sd646Fux/ny/X0PSqKLAdW18CKQZNhtogPcE+a1R+ZnBk7EdQwFWxcQ
   ym6LqNVZ0125mgHkZm06ek+b8qLTm+ISxgUQWfaU8MN0mXe+57iLrXl8N
   7yI+FvcDJdy9q3gRN8P01GmQ9zFNh96+dOhKqwWz7libYnZx2ItRjB4nu
   zj/VpGvyPfcmcbCzib5naWAsymev7t/O3wJdpPza0aJnO6WsDrh2eeaND
   w==;
X-CSE-ConnectionGUID: ResglF8qSBmq6HRryTzH4g==
X-CSE-MsgGUID: i7+XWVtwSgu/slB7tojFpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93583313"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93583313"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:50:35 -0700
X-CSE-ConnectionGUID: EopDx8fCRSuOx9SYA0eYMw==
X-CSE-MsgGUID: uzWCp2R4Sy2dgHHmcs4yUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226837152"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 05:50:32 -0700
Date: Thu, 2 Apr 2026 15:50:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	grondon@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix alignment in function signature
Message-ID: <ac5mFkf5RIEg410Q@ashevche-desk.local>
References: <20260402091827.2163-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402091827.2163-1-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 02, 2026 at 09:18:27AM +0000, Joshua Crofts wrote:
> Fix alignment checks in function signatures

First of all, missing period at the end.
Second, why? Does it fix anything?
Third, is this the only issue with the driver of a kind?

-- 
With Best Regards,
Andy Shevchenko


