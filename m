Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E15337690
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637897; cv=none; b=peXYH0QzqraewaoWiVlAqQlFpnABLtGnTOOAwA5p4vdAzbn8xHcUX8CX69azyEwtSFgyoUzUenzCBwgKTVAPiHS6n+vN7gvFxDhwXi3+alGnkqxnv3Vpb51VumchPa8i1ARLMJktLor5ZIE9pocfo/KYr6T5ioGfAxMAsBQBbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637897; c=relaxed/simple;
	bh=5NbkAy6p798PcPbbQD79e53W8VmYm8vCcOlQCkF7IoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieaG6HM7bl1MsmP6UnxuvVm7t7SiASPYYqvF8KMtuVALFCTRyzvtiOPwwu3F/Pq4SiSVXvS0AU/es2p7/EJUpR0rVfZsLLBPQvaabKYiZ/LUAZiL045sTYNhM3aIlHQ3nmwDR7kwfBQ6Tjx4QPJwN+DQrmmmORW+bJfd504gZes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d61/XlfT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d61/XlfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769637897; x=1801173897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5NbkAy6p798PcPbbQD79e53W8VmYm8vCcOlQCkF7IoU=;
  b=d61/XlfTLPzxuITcCUkXAfOXXnVnF3P0bwHs1yMN51c8Nz4GUmmqUwWH
   SukyPsAeSbHtY5MYSlAOD7xbaLHnozDYobj8sz/6qjCbuBXnXF7cd+4Du
   wEOTgO8oBhQPHDKCQMbriwGbE91wtaFVX7CTQHxDX9O0sFbMGZWsIxkUP
   +l8kGHssTDFPp0lwTQV+dTWm6uz4cia4jR+Z7GuuDaPbFgHWPVh6QgaHm
   FCRs0RWee1iFa0dIw0A1Kc72zryHTRMu1ODA54moVmhV+M5ldbyeQNCNr
   kF7162OAko/Neem05QM96UzCaAJtSMOt17bp12cpSraSYq5fztoz2clJD
   Q==;
X-CSE-ConnectionGUID: irnl+DgDQ4635Di1W+3EUw==
X-CSE-MsgGUID: HUv3m1vRRI+iVXw+2yQ69w==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93522124"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="93522124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 14:04:56 -0800
X-CSE-ConnectionGUID: gWzycZR9QpeKlmQn5t7idQ==
X-CSE-MsgGUID: rY6DDMx+S4607Bcw0zc51w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212934026"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 14:04:54 -0800
Date: Thu, 29 Jan 2026 00:04:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, andy@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: Re: [PATCH v3 3/4] staging: rtl8723bs: replace skb allocation
 wrappers and fix build
Message-ID: <aXqIAzZBIx04GTOJ@smile.fi.intel.com>
References: <20260128140954.1065382-1-s9430939@naver.com>
 <20260128140954.1065382-4-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128140954.1065382-4-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 28, 2026 at 11:09:53PM +0900, Minu Jin wrote:
> Replace the wrapper functions rtw_skb_alloc and rtw_skb_copy with
> kernel APIs __dev_alloc_skb and skb_copy.

We refer to the functions as func() (note the parentheses).

...

> Additionally, this patch restores the definitions of _rtw_malloc and
> _rtw_zmalloc that were prematurely removed in previous commits.

Huh?! Don't remove them if driver doesn't compile.

> This ensures that the driver remains buildable, fixing git bisect issues
> until all wrappers are fully migrated and can be safely removed in
> the final cleanup step.

-- 
With Best Regards,
Andy Shevchenko


