Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8652BE621
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 08:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164996; cv=none; b=uZuDjtZAjM9FJuP+mkNJ+fGih51Amovay0AssExakfu7Zx8HzMleV/6KMEfzmhhliPYLlRYTkFNedtvqwbpKyka5XNEH+yZJmDQNX4te/IDOLx+PYi2R7M+dQDqRNay4sR9crgVcLCZpvrIiaZkeGSsoVsswCRxpVbxdriu+r40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164996; c=relaxed/simple;
	bh=Ok2uxm/+RAQD10yVIEOzY444cIER//V8tOb/oha4UDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaKGffCwLmbw2wQ9IjW/zfybB9M+G15v68SgmcBmdNncvwwKxSAU7zqTkClxQ/qR9bL1a/5GGOcMn3NuXuA/eKRwLIEDFm/YVGKIVTs7O1JFBMU9kcC+lpnm3NS4BzodDgFcpuUvZTHQHh/FJnbGVFgKHpsH7K9zJNfmpVvnv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpUE8LHi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpUE8LHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781164995; x=1812700995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ok2uxm/+RAQD10yVIEOzY444cIER//V8tOb/oha4UDY=;
  b=YpUE8LHio3/FNjO/hcPUUTCppKan2xPlurshgWrR0+AOx7ve64A1yLI/
   k1l/ZRraCvS/jwqOWRbmBywGsLC7cw02qkv9SoUtvp/c2ieOUBUabcw5E
   bBvGNBHyOrRgtOSq/fYxHUouob6+n0Gxk8D5p8dfkvS6W//ei1OpQcVi8
   6GRZ9+Sf6tUVZ1ERkZeICeB4YI1116wQtHXFNcjf6Vl4LnCUQqFyUYNYB
   ghrC1AisWNfTCJvEbuW7s8OMQKTJByAERNrVn6XA906MBHjsLTMJFnGD9
   QlPv3hmGPcNRYpNoIh5a3BU8otxMOoaw93UrYntwwe2RmiwvaZ5yC9GBG
   Q==;
X-CSE-ConnectionGUID: 1r2QnbIjT4OKwVsCpn7vbA==
X-CSE-MsgGUID: z61m1vlMQaC7InpaPcwgiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85869173"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85869173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:03:15 -0700
X-CSE-ConnectionGUID: YPsm1ZJRTO28vwiL+pNZiQ==
X-CSE-MsgGUID: 6+WXQ8+JTyCDmFqo5iVVuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="248284111"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:03:12 -0700
Date: Thu, 11 Jun 2026 11:03:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix typo in comment in fb_upd161704.c
Message-ID: <aiprvmR0jK4B1Q68@ashevche-desk.local>
References: <20260611-upd161704-typo-v1-1-2e51387c3b28.ref@yahoo.pl>
 <20260611-upd161704-typo-v1-1-2e51387c3b28@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-upd161704-typo-v1-1-2e51387c3b28@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 11, 2026 at 09:53:40AM +0200, Tomasz Unger wrote:
> Fix spelling mistake found by codespell: "cencter" -> "center".

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


