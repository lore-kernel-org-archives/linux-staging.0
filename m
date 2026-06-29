Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B950B3DCD8B
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745946; cv=none; b=exCTCfBRsmJNgg9zYEftNOED92nzsW0j3aXVd9bRN+e9bXX+txQSypw09ZqcuNHc7GyfzjLVNRn9eolEZM15ng7XT6QDzJiyCLrT7SrviJkicPOXeDLRJYl/GTBsIN7VGyksN64TVeel1sw30z+Vym2JmjYI5cYVSm2GQGqrjRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745946; c=relaxed/simple;
	bh=s0LduPkBHrB8/uCMsIDByziFpDHzfQMiG0Lrk+XuWzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6Z0nNafA/WMB3r3rtuO2ROsHQRHW8WWTanvKS6o2E7B9Mdr6b9EgzfBAUKpacz6ZfxjAEzfAXwSFljmJBRdGuUF3wcXpXsj78gv+D0diiVBn+sGEhmnyB22WaZ8WsAIABHn6qR6PEi6Na8y0ZFA6T0LWqMTqKeiQ/6fj7gdFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jF8OeHg6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jF8OeHg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782745945; x=1814281945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s0LduPkBHrB8/uCMsIDByziFpDHzfQMiG0Lrk+XuWzo=;
  b=jF8OeHg6dYaG+eHcYXSMtgn+XPqcJMKy1VsC5aSlX+IWBypOgqjKOcto
   3vDdpcxDbL3wKbBYMmydHy+lA/i2raXdlyFkC0E0mWDMPgkeL39jre5xM
   IeCump6Uslo5cs10r2V+v7CfKU3IOHv7lqQ5ggP+JsWv9Vzv6/dRR9mv6
   FW6j0N3AH3yT3kdU9o+0aJHICoZQ3l65JpJncyvMZ4p6bf3LlOItD/9Ah
   3kNqOohyqP34l1VzDNwNNBTcisy0Jy6x4Er2h5BuvC5ilMoI4tGNpqhIP
   Eb0ljvzau6wVmJg3/84qE3kejPuhz3xL8xvtpMK8K/XdLjSKIKW94O5Yf
   w==;
X-CSE-ConnectionGUID: fCxfdEivS4yFK534+Ebgxw==
X-CSE-MsgGUID: VdEr1Af7StmG000DSKqY4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83637329"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83637329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:12:25 -0700
X-CSE-ConnectionGUID: YgE0NmjQS4ObXpy1kaj+Sw==
X-CSE-MsgGUID: m/CHLSzITTaCxwxWQvfSWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="255928492"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:12:23 -0700
Date: Mon, 29 Jun 2026 18:12:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] media: atomisp: Demote all broken kernel-doc comments
Message-ID: <akKLVFOSV9fdg6Wq@ashevche-desk.local>
References: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
 <20260629-atomisp-kerneldoc-simple-v1-1-8ae282b85c5c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-atomisp-kerneldoc-simple-v1-1-8ae282b85c5c@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 29, 2026 at 11:48:28AM +0000, Ricardo Ribalda wrote:
> The atomisp code has been very heavily annotated in doxygen format.
> 
> Unfortunately, both doxygen and kernel-doc use the same mark for signify
> the beginning of a comment (/**).
> 
> As a result of this, kernel-doc gets confused when it parses atomisp and
> throws tons of warnings, which made us completely disable atomisp
> kernel-doc checks in Media-CI.
> 
> Demote all the broken comments so we can have 100% coverage.
> 
> Future patches can convert the doxygen annotations to kernel-doc if this
> is deemed useful.

I haven't checked carefully, but assuming this is just mechanical change of
/** to /* I am fine with it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


