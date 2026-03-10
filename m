Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74828371
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182932; cv=none; b=XLF3iZyM2+SU190eLYp2GRuBhL26x+VwDGDAMq9O6ctrijulk+v1FnAjeNhri+OiS4XzgJd1PXyXR0FP1hUYUls+i35U9tpq7R4tgUPyyspSnYHEaB3OU0PsccYEKW9IjuwLBbFN/KHYJ3iK+Daa7E+RUJjfRaJv0kNtsFxx5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182932; c=relaxed/simple;
	bh=ZuzveDGPZnQkr48Tk949S4ONvwNNBmG1BcdLoq8/Ng4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDmmf0el9ezHy/CTTSUuHIVsfxm56zGyeDXSbs6V0X5qt1xCL3kxKHHpJiUJTnGncvnnRFRe+Lk8VpEr656cNfy2rnZEwYIIgWqlyptGf2NQFloZubKsOvH2c83Yz/GKlJLAhRWfQGI/EvoqPJAtkwGpeSIv6fPFyfXRxKJKP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlPgEndH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlPgEndH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773182930; x=1804718930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZuzveDGPZnQkr48Tk949S4ONvwNNBmG1BcdLoq8/Ng4=;
  b=TlPgEndHIo3Ngxd0Rw5RlFHywEHudeNv8426G06e5aH45Ew0A7lpZBtH
   c1JvWYUjNrCpGsA9IpVjvrY2FoF3zLVakSfKFXTpDfzFAju2G5D10rABc
   RednMeiZDQSH4x2tbQvwsOovOEVLP9yvEKeoyL3nJOAy2zrQHq64z0bUu
   uDCp4jFTYzEi9lVixIaxmPfcWPw7t2cO3/xKXGsyWbb7x6nsA6Fd18hBN
   yWpOzxj9Qqkij3H1P0fVhfQlBKs6714dCkTe0o/mLe6Ct4fWNFC00ydOg
   4adx02F6vp3WImT7ghr3tGdPIw4Wv1eWpZ5OydzojpvzxwqQD77NGybQa
   w==;
X-CSE-ConnectionGUID: 3zF9VKDiTByYceqUydXT8w==
X-CSE-MsgGUID: DZRW0YLVQKqQuqL8tSwQuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74120259"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74120259"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:48:50 -0700
X-CSE-ConnectionGUID: Na6XIS1FQZSgRUieJlzFNw==
X-CSE-MsgGUID: 1kA1q+GSSlq/JzCjVEN3lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="243283007"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:48:47 -0700
Date: Wed, 11 Mar 2026 00:48:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: fix block comment style in
 refcount.c
Message-ID: <abCfzdNBb-qYJpRK@ashevche-desk.local>
References: <20260309215516.6091-1-rayfraytech@gmail.com>
 <20260310203546.8849-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310203546.8849-1-rayfraytech@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 10, 2026 at 09:35:46PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to comply with kernel coding style:
> - Move text from opening '/*' line to a separate continuation line
> - Add leading '*' on continuation lines
> - Move trailing '*/' to a separate line

> - Replace commented-out code with #if 0 ... #endif blocks

This should be done in a separate patch as this is not about comments.

> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

Where is the changelog?

-- 
With Best Regards,
Andy Shevchenko


