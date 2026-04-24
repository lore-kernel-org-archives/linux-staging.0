Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14564C6C
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020867; cv=none; b=iWkYhcRsaKq9GoHE9wfuUD8QLk8cefAoUv0A9OV5vw6bvXodT8FGV3aLlEqf0lDWsA/P1sKoG8PnfnXuHQXNJJBNofwnOxGaT9l9gkfpGPX470nsYnZ0XXW7E+wHuKM3AC9ITix7cUmgejlMogzdxCksk40NdvGneZ/dSQOnzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020867; c=relaxed/simple;
	bh=1Qvg63gqx8J3FYmo7Q4o671furr8Ydz6DasPJFmsXls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVs6G0uNggx2SAnObvus0wL0d3nf/rGcuu/3l3yANI8edjBCgFK3GYznW8/v2IdO5qfbrmbNIov9yYDzQNUqgKFWXGMIm+NLWiluUC5/4j5ACG+fWjkoQEloH2pXuDihKSKt2rmcKaRbRnevz8Dj+eeGG4nCgsoZmLIekYmnBQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xgc8ub41; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xgc8ub41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777020866; x=1808556866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Qvg63gqx8J3FYmo7Q4o671furr8Ydz6DasPJFmsXls=;
  b=Xgc8ub41fugghJToCx/3hhU8EUcHp2TwKu8rs/cTXaVWGhCuzVyZCk39
   5Ywe6TlUzIEdEpDRZy0vbZno3C6D9dpkNeR3dmP1ShKcWwUVRyjxKf28Q
   R0kj8/XFCMubzvtz/JK0QWd5woJKs/BAGoPzVe9qTmMW46CgO9eWibnhf
   xcIX8YsOQTSpqSE7dsx9HPqgvZxaQyj/ENfkfRJklwU58FG1mHMGX2Ll4
   Os3Y67Mfx1S5vN+vwwtwNoWNZ7KbzhJxRvN3e8Wojd/4rwju8K87fQvMf
   Xq0mQKLsJ+vYU+1kpPbLdyQi8eh7MvMeyOlLSxcBojntku9e9HsBVoKtt
   A==;
X-CSE-ConnectionGUID: UrFVihn1Qtmon+iV9AzEZQ==
X-CSE-MsgGUID: wyi6ZYCmS8af3Vv0zyZlBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78113937"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="78113937"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:54:26 -0700
X-CSE-ConnectionGUID: a17V6VOdSlaNozpdPC/6oQ==
X-CSE-MsgGUID: FJDqTa0FRAGrwXD4xmGj3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="237952893"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:54:23 -0700
Date: Fri, 24 Apr 2026 11:54:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Gabriel Sanches <gabriel@gsr.dev>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, mchehab@kernel.org, hansg@kernel.org,
	andy@kernel.org, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] media: atomisp: Use negation to check for NULL
Message-ID: <aesvvPPq35g2yHR0@ashevche-desk.local>
References: <20260423181443.46566-1-gabriel@gsr.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423181443.46566-1-gabriel@gsr.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 23, 2026 at 03:14:36PM -0300, Gabriel Sanches wrote:

...

> Hey, this is my first patch ever. I would appreciate any
> feedback. Thanks!

Please, start reviewing others' patches for the same driver and read other
reviews and learn from them first.

I'm not going to repeat what I said already several times on a patches like
this over the very same driver (atomisp).

-- 
With Best Regards,
Andy Shevchenko


