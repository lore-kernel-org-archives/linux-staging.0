Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60FF21ABD7
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302592; cv=none; b=mH0fzmXF4rF5sFJK0Sn7KScoq1rljChKL5Bz6hCq9/2vRydy1Pw8czMyHucQrhfg3U9ITtR+daFV72tg8HW1yL3hn7lyACvtXmTFmz3Xclw0a5XXFBP+fwssHi+ZNvQSTy8izljrp4NQz1JyuFKrAzIj21H/IKonijDglPni4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302592; c=relaxed/simple;
	bh=kh3YKvl+EUhdUT9ihySVJ1L30D+FhW/GdlHQryGZeBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s19Zuj18gFGiz4wE0mtqNe8c9LOp1pld2fr9reQMxgCfdzUbj/z2/NeYqSCvia662ywM0HHjl4lf+U1VLxozjfJ3auibHVBIM3K1aVYMKvuW+OsC1b51y0cKXpvBJ7o5L1emCpKwsE7giRNJMBf8pwSgclLW9amcKB0Kqr3NIAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcWzrDJX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcWzrDJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782302591; x=1813838591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kh3YKvl+EUhdUT9ihySVJ1L30D+FhW/GdlHQryGZeBo=;
  b=YcWzrDJXqMiBos6FzKyQ8SpoM+n9rmjTl8HnsOe6lNgiz8Xd1+z5yf7d
   oUEUNmbcz+u+oEXsubNqXYeuSx3aLonxVvrM9qgeyFr9JcZ90A5FkxSPV
   Von2JoNl+L6w4Qxt0vFNXvPii1/+sph/qR0uDy5hIj5Y8tN35LJaiVx0a
   gRnc4hD9ObAjHgY/OhUHsLpZ1Swp2WgaIVg7PKdAiMuDWLTZUTASXRW7Y
   urbLBN4tUQioMPftcvs1qub96AJgktAYU70dnUa8xfz9VfxQGkiIkZ3KQ
   2WTPccvqNu3m7GZcS5mo3XlFZxDUc5jTbH/MCAPIUD+IxeRE83iTQwVL9
   Q==;
X-CSE-ConnectionGUID: IyGz3FYPSiaGpM1wjxA8Yw==
X-CSE-MsgGUID: uE2FraEeS6O6Jq2Hl7ZL0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83064841"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="83064841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:03:11 -0700
X-CSE-ConnectionGUID: 2bhGsjy3SUmTy/qiz+OPiw==
X-CSE-MsgGUID: zn+zNlnqThSMRW8HyMutnw==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:03:08 -0700
Date: Wed, 24 Jun 2026 15:03:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] staging: media: atomisp: drop unused
 platform_support.h inclusions
Message-ID: <ajvHetrbCwo18_WU@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
 <20260618151246.6678-3-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618151246.6678-3-igorpetindev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 18, 2026 at 06:12:45PM +0300, Igor Putko wrote:
> Drop the unused inclusions of the platform_support.h header file across
> the driver. The header has become obsolete after replacing the custom
> CSS_ALIGN() macro with standard kernel attributes.

But in the above list there are no users even with the platform_support.h in
place, right? I mean that this patch can be, for example, applied first
without any regression. Correct? If so, make it the first in the series, it
helps a lot to understand the changes in the (currently) first patch.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---

Code wise looks very good to me, thanks!

-- 
With Best Regards,
Andy Shevchenko


