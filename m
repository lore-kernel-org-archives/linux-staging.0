Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BE4B1E5C
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699742; cv=none; b=FGkxfU9q8YzIs3LTz8bSCb3RBUoW4jChCEX1kNKrOB2n3qveNXCQEd8avnGSxRzvsFArmi9/sZD4o3tLcx7WrXlYC0deKwIvIAwWkRh0srYhxQVNhX2WjrKTVH4r+raITXWkDsar6xMzCIgh6Ri6Uoa0mncsZ7Zs0VaMTvDap/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699742; c=relaxed/simple;
	bh=tLVZ7l0uzlnYz3RGAPEntPGU7KyqpAXPp/cok9Dqxok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfFKvbb41+DJGMRU22yma0r7fyIJXII7++g/x2cbiwSkKjzdyh/sHwYX9DXBx/K+NRgtz/K7DuT/7Pz/snx5H7RpuLxji7eYyIczeRO4Cd3FYvsRtBtCBxE8+Z4g4Pm+FyfZo+G5x0xp5uNSk8dsjqj1mxl5VKyjWQUNUzIPOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kku5pFtZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kku5pFtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746699739; x=1778235739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLVZ7l0uzlnYz3RGAPEntPGU7KyqpAXPp/cok9Dqxok=;
  b=kku5pFtZ7/UIiHUHm9BEMtQL7InJjkB5cqTcrbPrXPlQSCDXFWs3wFld
   PpfTJASp95m0CP0PU1hOyqftHy03qFMnaStp1HPoyeZ8R9fMeANGcop85
   OPfSBq7RoqiOuViyjNgzkE2AhIDeKv9CkEcw9omaG3kxlXt6Zswqx8NtG
   iuWphFvDGjZN6tMNZC9BnL1gUAbRpHtETym4KOoavHq6p8h5c4vT/B3nB
   C+hnndiKW7fpVOgq7ePE9M/jo2FpsAIObZAhQ9djqXexqLgYb1p+bIeJE
   5RqF2mW57wY0dU0QW7JWbhUAPQxvD7jK/Q27ypapnkJDn6SFFpoD+/O+f
   w==;
X-CSE-ConnectionGUID: HaKUZOjfT7qzvUiYvK0GPA==
X-CSE-MsgGUID: 5CsKfNltR/GFcM4WqLbDyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47576643"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="47576643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:22:18 -0700
X-CSE-ConnectionGUID: tT1P/t+xR+GrU1Vj4sRAmA==
X-CSE-MsgGUID: AnhrPIMAQPiNBYVfY/5qZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="137238321"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.168])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:22:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 21B7011F90E;
	Thu,  8 May 2025 13:22:14 +0300 (EEST)
Date: Thu, 8 May 2025 10:22:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
Message-ID: <aByF1gMxTi6FAAQO@kekkonen.localdomain>
References: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>

On Wed, May 07, 2025 at 08:47:31PM +0200, Hans de Goede wrote:
> Hi All,
> 
> This patch series does some small refactoring of the int3472 code to allow
> re-using the sensor GPIO mapping code in the atomisp driver and then the
> final patch in the series moves the atomisp driver over.
> 
> About merging this, maybe the int3472 patches can be merged in time for
> the 6.16 merge window and then the atomisp patch can be merged after
> 6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
> 5 patches will be necessary.

Thanks, Hans!

For the first five:

Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Feel free to add to the last patch (i haven't looked at the details, but
the approach seems good):

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
