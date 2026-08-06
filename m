Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235A6499F19
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786057222; cv=none; b=sa+neKSblkKbZ2VpGO43patwEttcEVFNwAG2XZtCy1fc8z9K0JarXTae3+h/DgW7ARWPlz19nIrlk7UEM1YHPaJ7+RN9aGDuWU/Z2QVPQuSpx9vWB+CJLY2lhw27THuqENWP5VymbexN5YoLPoVbfxK0KfJhU+oLhg9QT5o5/w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786057222; c=relaxed/simple;
	bh=dDlzRo6CxVbvh28v23ur/CGkpRLHYQzZO7Md49OtOUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mb3CYvUfkg3gF7kU2+YfN+S67ztZ1KTtO7esIcC+bHVTVOwerM4pbuVSLU10rKFkKd5TkgZY679+lLuvbp1vNtPzViJM9/NUCnLys5QYVBMXXLj4rBm198uHWflS329M0sE2CkZLjnj+vg/GUWc442CKuFOHFPtynyh+QovEz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoQZ0s9e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoQZ0s9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786057221; x=1817593221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dDlzRo6CxVbvh28v23ur/CGkpRLHYQzZO7Md49OtOUU=;
  b=LoQZ0s9ejVCtqS+rL2k2qDsqIZFs84vPtF4ydWinhhFuTo9k8WjPNpde
   vAtexhbVBkGtZuc9yElT1VNtRGjPE7CCe3Xz5dEQ+hFVsOmKtWtsEXvG+
   cMYnCMRPdSI+tWGFSqCqvRaE9Vmtjj6A0RHv357ekACgG1kWqazQ54ZOW
   dHjlU9tqit/ZMkDXE3X9z+Z3kfMqkRhJVVxNtOHY9VDQU0Bg2NysdtTbA
   rdAkgFAxEFX5KK6Fad7+uT7yBavxBtRKYt5QCBiKo3HAwdwKb3iRjhdq3
   mUTZE3M3G6rzN/fU7sn6sLlNMBHpofna0GGpQS02i6M80SiyilaFx3Ecn
   Q==;
X-CSE-ConnectionGUID: jJ4Mz8KvT5+DSYxXRSPC1A==
X-CSE-MsgGUID: rdEVBALZStyjWIT1p5NiVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90341517"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="90341517"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:00:20 -0700
X-CSE-ConnectionGUID: hh10+Jd+QFCyNfmrEy5owA==
X-CSE-MsgGUID: OxnH2PR7St+HOtqJ3lGQjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="258375859"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:00:17 -0700
Date: Fri, 7 Aug 2026 02:00:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: JavierLeventan <javierleventan@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, mchehab@kernel.org, hansg@kernel.org,
	andy@kernel.org, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] media: atomisp: replace spaces with tabs
Message-ID: <anUR_4b4nVP-dmFU@ashevche-desk.local>
References: <20260723152133.56400-1-javierleventan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723152133.56400-1-javierleventan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 23, 2026 at 12:21:30PM -0300, JavierLeventan wrote:
> Fix checkpath error "WARNING: please, no spaces at the start of a line"
> in ia_css_fpn.host.c
> 
> Signed-off-by: JavierLeventan <javierleventan@gmail.com>
> ---
> 
> Hey, this is my first patch. I appreciate any feedback, thanks!

Right.
Please, read lore.kernel.org linux-media@ archives against this driver to
understand why this patch is no-go.

Also, if you are in a group that is mentored, tell to the mentors to stop
looking into this driver by a newbie. This driver has much more urgent tasks
to do and it's not trivial, it also requires a real HW to be at hand to test.

-- 
With Best Regards,
Andy Shevchenko


