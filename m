Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1162C324D
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020345; cv=none; b=u/Z41GeLD+i7Ch8SN94++Uutg2hNOSLJx7zBbjE9yVcCyzYj2PSxzIuNOKQDdHAuwA+5GkVH/hYmcdjNAjPuItjpnTJFmLuOUOmPH8XAhugKClzx91tbCnHD3HJ6nd+SJj42q8w17NRfhL+wV77y/vvLBuPTkibcFUeeC7wEAts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020345; c=relaxed/simple;
	bh=RNZU9MA+u1uvVesQ15c807rfA2R4AIWzmvk+3wGWmMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/DAbnFmMqBYdsvk8wvnIdj8wNt/yQOAmnlJdh1XWwSxZ3CGIvsK1JPnSRXpsHHnP+6dC/AaX2pTpUffPGDh60psRWemNpD9ktAd7c3o2rxcYTuo+9PsU2OtGbHurzmZntzeGGgIp7jT6/rqC4uPd36w1zgTLoVNlNejOxoUZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQi6NB6K; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQi6NB6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777020344; x=1808556344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RNZU9MA+u1uvVesQ15c807rfA2R4AIWzmvk+3wGWmMc=;
  b=JQi6NB6KjGfWndKDsOMUuR7GveceoHvpyWyvYBct8imFstWNf4q7Kq8/
   sGRTiiGd6rMCIuIu2UbGo1worTqJa5STkPOQS1qOoNWWVQtW/hNnzfX3K
   dQAeReBWc+70TY9cDPAF1YPnMMUDLRt/nq5ea4FCVpJryQR+SDDotSGlv
   GCHOwLQD6jNO/KbRCTYcMUAD/P1NdPDNCQnlzDSZBt3W87lRXL1zXrWnB
   /EsBhcgqUNJpFaqnhCLDxx41Wi+5xGPRJacCW39GudR/nMNoleEx0ZH6u
   aOy//l1eLNf+P0alMJMlQNHSSyqv10nuRShj5G65RlYdM1CB8V31hq+Vh
   w==;
X-CSE-ConnectionGUID: xlnfxPltSbWZYyjao+U65Q==
X-CSE-MsgGUID: YdGUfRnlQre+8zMqPoYFTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81603988"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81603988"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:45:44 -0700
X-CSE-ConnectionGUID: f+gnyYU7TaSWgSMxlPgOtQ==
X-CSE-MsgGUID: mHqIs8VWRu2L9XD94sby/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="256417140"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:45:40 -0700
Date: Fri, 24 Apr 2026 11:45:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mylena Angelica <mylena.asf@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] media: atomisp: pci: hive_isp_css_common: host: vmem:
 fix line ending with '('
Message-ID: <aestsiuGrr6-AEws@ashevche-desk.local>
References: <20260424010008.325784-1-mylena.asf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424010008.325784-1-mylena.asf@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 23, 2026 at 10:00:08PM -0300, Mylena Angelica wrote:

...

> Hello!! This is is my first patch,I appreciate any feedback, thanks!

Please, start reviewing others' patches for the same driver and read other
reviews and learn from them first.

I'm not going to repeat what I said already several times on a patches like
this over the very same driver (atomisp).

-- 
With Best Regards,
Andy Shevchenko


