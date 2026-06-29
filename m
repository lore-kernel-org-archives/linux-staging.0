Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55F426D13
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746131; cv=none; b=kHbo4Cm2P4HV6O/Hi8qyfkMJefNWesa7ppxMxMXnFVkHkOOO9inlsiroiauuuGLevqQEPJmR1rGNZMHRoz5m/BfBcPv2lqektsF0/Rbw4bC8smhHN8+vy/LhD24h6wRUs1VgdYokqD5Zc3kc5oA8Av8VPdTaf5Z4rSzJE+RU7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746131; c=relaxed/simple;
	bh=wdzGryGJXKi/hHuPN7L/AmS0QCPPOlS6W1rJcjiYE1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2/nD3FUGN9U1UNMXdyQDGFiHxxuAD9t4cXXsfnam13JZhVMesBvtfO8NexpQiQ394Fz6KIgQVtFHM7OMy1lC3rNV/UHsnjvPxaWZlPu8+X8M5tzeipyYJ3SNwLjhRPFHaBneeVxTDuPGGXfcEy449YVgLhXETmEav+gLD9g+n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNdmlNR8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNdmlNR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782746130; x=1814282130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wdzGryGJXKi/hHuPN7L/AmS0QCPPOlS6W1rJcjiYE1s=;
  b=hNdmlNR8c7b9Kv9TXarLmFD/hmZRR7sjwLVDUiA+s3DaFfXHBVx81oCg
   w+yxRZpv0sQy3RxRAGO+rcc3WqcpoXhDD9IRodx01N7xk3uCT24JnSAk3
   222NHcLDx7ECBBTl3CwMIxkRcPzybOCJbhdIXuyrvy0eK0yxfflXNi88Q
   kBGXZB3vYp/xD6k7LV3vNSs4/au+0zS8OzHHH4+pOn+s6/BMBtMHZ5cD7
   2cSWx23xjvdCOp809cUB2lgeMMIip8L2RzLOrBk8nuJz+rWw85SJKmseq
   cO9L2uWf3q8G1qig7WI+I4bX3FKtHrXL0H8pFWT65DOs6U2lkBXEsLH+9
   Q==;
X-CSE-ConnectionGUID: kaHz3Vx2ReuoHqxVf/9yfA==
X-CSE-MsgGUID: JIe0v5ZnR7C6r+P10tciBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94591444"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94591444"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:14:26 -0700
X-CSE-ConnectionGUID: CaeBuvTsRguVFv1TMfb2nQ==
X-CSE-MsgGUID: R72cGVW/T7KMySNl1UQU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="282055689"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:14:24 -0700
Date: Mon, 29 Jun 2026 18:14:22 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: atomisp: Demote all kernel-doc comments
Message-ID: <akKLzsMmyIrSSxdl@ashevche-desk.local>
References: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
 <20260629-atomisp-kerneldoc-simple-v1-2-8ae282b85c5c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-atomisp-kerneldoc-simple-v1-2-8ae282b85c5c@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 29, 2026 at 11:48:29AM +0000, Ricardo Ribalda wrote:
> Despite the fact that kernel-doc does not emit warning for these
> comments, it is much more consistent if we keep the marker /**
> exclusively for kernel-doc.

I see valid kernel doc in many places, please reconsider touching only
controversial cases.

-- 
With Best Regards,
Andy Shevchenko


