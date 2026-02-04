Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB1939E6C5
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200484; cv=none; b=RwRMYf68ICpKw3s6cdxIYXkBK04FVSWYlTTBeRzc2zVELKQuoSJ+OGGMsNg0BQsA97fXl3efze4uh2zCqfL29sBfnFXo8KV2avNMCfqZZWYVDclFeCQHWEo6ZnUoQRg8+KqpCoSAqm29pmSyT90+3HmDzTNx0rBSXJgLCVJ4SAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200484; c=relaxed/simple;
	bh=174+gRT+1ExW7VFwojuZhmUr8Knycr+SPKlu0J/ctCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSQS879oTAyjBMMX/MvduBB1EaAzsD0S4AYWR+pmAIzfkieWnXr0vcAxTNIKz4Ytt/xr6glk55LgGXutdfhsFd7ogfZ/mJWTAI4im35YtFF++hRyU5urLJPlTJX0pNfo8FW27G8YJ3xP6w+DBzH+E0dPy3x6nQOQptQRmNmXuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cm+XoCQW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cm+XoCQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770200484; x=1801736484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=174+gRT+1ExW7VFwojuZhmUr8Knycr+SPKlu0J/ctCs=;
  b=Cm+XoCQWpRz7n7b1PXgFv3Z9kPRqcYa8z1yBhS/CGeJpNOCZZ7FoRBil
   sqRMgZPXNOpbcM9yLIBPTlTZIIlXHcY6vIR14fllVVCBLsgscSGuUGmlm
   mOdGz4HKG0IjT9MmTtRju1P+eXDXiEHlzL3r+1XRG+dEJ56omy1tNABB3
   L5kF1IjqJwiupbKotp6zPkiqYuA2RkEudV+QxSP7x8Sb35vxoN0Dp0030
   aGfsOei5rDGrYzcpiMTG5CxQIVaEnh2eoQ6aJstUBlaKZc+X19qVn7rGM
   Rwcf+nnv1B+9QFM7onikq9RcuF/pQ1NWTHtq9PzI+JjcF9H0TWCHyyquD
   A==;
X-CSE-ConnectionGUID: OJZC7bglS0anjx0tCEJApQ==
X-CSE-MsgGUID: u4tN5sOgSem5gi2mlQtFxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71468554"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71468554"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:21:23 -0800
X-CSE-ConnectionGUID: zfdogq/cReW5mJCqpsV13Q==
X-CSE-MsgGUID: 4XxKJFenTUObJzYhRotknA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210177519"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:21:21 -0800
Date: Wed, 4 Feb 2026 12:21:18 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] staging: rtl8723bs: replace rtw_malloc() with
 kmalloc()
Message-ID: <aYMdngzU2ux595lm@smile.fi.intel.com>
References: <20260204064455.1379342-1-s9430939@naver.com>
 <20260204064455.1379342-3-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204064455.1379342-3-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 03:44:51PM +0900, Minu Jin wrote:
> Replace the wrapper function rtw_malloc() with standard kmalloc().
> Call sites were reviewed to use appropriate GFP flags (GFP_KERNEL or
> GFP_ATOMIC) based on the execution context.
> 
> Also, convert error return codes from -1 to -ENOMEM where appropriate.

On the first glance LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


