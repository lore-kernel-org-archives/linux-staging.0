Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E6C3DA7C5
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200984; cv=none; b=gmX7PvOHjfWH1hMa5hBrXKomzoJhSrJ4KuOKxF7RlPjCJaJtAX/ZYrK0c56DyBCyABCPnr7CERSNburzvAHhUtg4ZfxAv4+/qeopy9ZiQPTBH6UkO4b/kMvFxJ541RMsfxAvG7GgGmnJedIYiHOkPL0vGQLnJF099ort+PoW1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200984; c=relaxed/simple;
	bh=3AIXekkeoMp+NlaUOKZI4vgR0w5WKZqfcjJa03ijN/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLxDc6r2Mrkbggbc0L3yFaotDmqpPIKHHHpsxTB4AGkgPg6jA+pOJUHmMhfJNBSuuqwsf6x7FTcAyItM1R07R0liw/zLNtxlLnH7AWs3i7IFPCTIwudva7ELm1KKyHLDJZGBWL8x02H/KXtyWI8jDXCSB6yHKKjcGSQZ67T1OGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=me+ZGJXc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="me+ZGJXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770200984; x=1801736984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3AIXekkeoMp+NlaUOKZI4vgR0w5WKZqfcjJa03ijN/4=;
  b=me+ZGJXcyQZw84xtQXrRWVd/eActGJ55yyhmiKSZR6UJIq0pyNJNGC1z
   FJrsJ88vBuPeGXMG7k68U+185RhvxNoFFNSWDhdRQBQ7SxIWmz1gZvi2n
   M3ukbHS15joE2exJ1VtPopf5qHbAhA7SmERJ0lnrbqbkzjmLJyghXW1ba
   2f+nuKK6z/oREjubmKxMvVxoXZE4vTY1RKcGuSF8lujvuf4RuTHkHaUtV
   1hOeXIB6myP6qG8bLXQnr054IWWF6g1lwNjDfN7SZVIakGKEAXBjHZIkN
   Yggmp/voPF/hJMq963QBcnzxtlhA44PS0U+lKMxyCMrNs5wLeQSDeFJmP
   g==;
X-CSE-ConnectionGUID: qhTXipZXTDmfbch3IE3P8w==
X-CSE-MsgGUID: Xbijxz05RtyG8NC7dXoT2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71469044"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71469044"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:29:43 -0800
X-CSE-ConnectionGUID: 5khDKBzFTuaUIYRdVhtcrA==
X-CSE-MsgGUID: QEQJEKtXRxW9oJ3b1cO2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210178716"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:29:42 -0800
Date: Wed, 4 Feb 2026 12:29:39 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] staging: rtl8723bs: remove unused allocation
 wrapper functions
Message-ID: <aYMfk_zpqPDeWszL@smile.fi.intel.com>
References: <20260204064455.1379342-1-s9430939@naver.com>
 <20260204064455.1379342-6-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204064455.1379342-6-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 03:44:54PM +0900, Minu Jin wrote:
> Remove the custom memory allocation wrapper functions and macros from
> osdep_service.c and osdep_service.h as they are no longer used.

Good job!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


