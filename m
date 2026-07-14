Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A3D3FF1B9
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 09:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021396; cv=none; b=FOI+v2hCXU8RlHQo4PEQZULJWvMQEG/KFt//H7BRHnk8GHx9kTMaPVIsSMGMe8DcjEMutW/nwVSLZVZmGTWapcWvgZZwiSA9ePK79FO2ClIVDbp8N7E5DBBcWzoI9OWLQTkGG3BVlrvj5hZqZtpV0oW3bYPTGs0h6VO7GkXyfAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021396; c=relaxed/simple;
	bh=3tA7eaonEL2u/nkvbWwsehfpAPI9Aj9l6zIdfaCdW1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuFFiI7GD1dGKs/LYFcqUkEUaGPaujv1jEQPrOk3Q0qRrMvePvwpNRE1RtP9oHmVk8BYSwbdolZPvmmy6bvA9w/j3612hRn+DWt2nlWlf9hRMA1zZJNgp4hTg51DV2xXzgk0igV1a9AeTtUNxBeUMmFmMu24SkAL2Q6yvk4uhTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEB8PSVP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEB8PSVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784021391; x=1815557391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3tA7eaonEL2u/nkvbWwsehfpAPI9Aj9l6zIdfaCdW1Y=;
  b=iEB8PSVPYzY3/8BXe9Zld7aKLD01sQf/pF5BY7ehcaiCTy0ZKeZahMT+
   iGjgE1kiFv9nAIdjFXhk3LUtYKzty01A8UZwXA4S0X8uLfdv9mYXdszgm
   SqJCmTqfX3R9Yt6vUQd982d9EuQ56nALVzR+fEiUndlTHtlU8GMk+0sMl
   pU5Znq7o7IAa5lLPhiVq2sd+8U2yR/N9NWTWV5xqZkd9lG2RquLyB9Lui
   VcmKgbe76M55xKofkBPMTdbLQ1yHwbSTQbZjZ0mHN2W1vvWf3cCiZeo7R
   cagKr1bsgTKr1J8Ipn4NKQ53EDQao55Jc+iNcnBBsGfXx4/QbrXGpjhJ9
   w==;
X-CSE-ConnectionGUID: fltAMvC+QPuGCCsYOIODpw==
X-CSE-MsgGUID: wqSRCs7nRmqLCnsiRxWrzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84661002"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84661002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:29:48 -0700
X-CSE-ConnectionGUID: 1d3o9itwQreWmLNL0ySRzQ==
X-CSE-MsgGUID: AAmz5DgoQFGVN7zs5Q013Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="280231815"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:29:45 -0700
Date: Tue, 14 Jul 2026 12:29:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "A. Kalimov" <erqeon@gmail.com>
Cc: error27@gmail.com, gregkh@linuxfoundation.org, hansg@kernel.org,
	andy@kernel.org, mchehab@kernel.org, sakari.ailus@intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: media: atomisp: cleanups and style fixes
Message-ID: <alYBhyCJHFeFOQs_@ashevche-desk.local>
References: <20260712115925.79047-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712115925.79047-1-erqeon@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jul 12, 2026 at 03:59:23PM +0400, A. Kalimov wrote:
> This series fixes a checkpatch warning regarding indentation and removes an
> unnecessary return statement in atomisp_cmd.c.
> 
> Changes in v3:
> - Added missing commit descriptions to pass Media CI checks and address Dan Carpenter's feedback.

Have you browsed the mailing list archives for the last ~6 months?
I believe there were contributions like this that were more comprehensive.
Please, double check that you update all the cases.

-- 
With Best Regards,
Andy Shevchenko


