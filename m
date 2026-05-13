Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955A38C2A7
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671261; cv=none; b=P9nBuH4QB5ohSALgoDBls78iajOupimMPaLQpGZE6qhIjcb64g1gCh4UVPPJ2Jdw26CLlylBhpXNsCqyPWx8MsL6C+E+VR7KGO67CM5ZoaWUS/6tgd7GckssASlvqqllbn+Ufvw0l6RjRk6mBmC0aKe0CZGhEp31JEkZBw0RWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671261; c=relaxed/simple;
	bh=RMf224aGS8kgpESCuu7nWZWiymlOYglglpqKbgl1/qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxCowIoJ4muNhMPuAwjYfn51BvzwjGMv6/NNMtkGsI2sK0IRuiuaLi/oCqs8W/I2y5gxRBLi+AW4uJZRoGAqh/E6rNTUsk5Up50JsAj7L0ABd+ObjmvO+aWfk70UPPmjAzVqLU66YfJB/j4cmldm3XrZb0/fM6kZtJaUy1W2DTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elW+2wDy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elW+2wDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778671260; x=1810207260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMf224aGS8kgpESCuu7nWZWiymlOYglglpqKbgl1/qo=;
  b=elW+2wDyB0Kx1OAS7RR/k5x5PwAjr/JQ85UMrMQUgAux9dTKgIjvUIDo
   IFGz0N7AsuPXbWwYEdcoeH0ypGUlWL367vYmBxcxdzyTu40uoaYFqPubw
   8QCk+CPI3zIZzM2pcTEADGMW+e8kwfQa+h1ml4bq8c/NzGPnuNPO4dpsA
   +T3Uumo+Svv8XZnpm9ChzFZDFpDczDVqobuVMH25vK/L9wuYnrJwFoXGb
   ylAggZIyFERSE0jf53DC2kS0HeAhD+IqbwKZNrCoJZpTNjhlptACiJ36A
   A5Zdl6i+kAafKuvKTMesRkrzasTuKCOrQqi4NCv/Omk5Y9i3J4lbKoN/f
   A==;
X-CSE-ConnectionGUID: n+s6N/WBQh+0yJtF5KYVYg==
X-CSE-MsgGUID: 4iNtq4PjR9udShDkTSTYZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="105054942"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="105054942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 04:21:00 -0700
X-CSE-ConnectionGUID: RXrHUKZJQduxBpdBCHCIkg==
X-CSE-MsgGUID: bSphGoUtS4WKYwu/r7hlIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238162685"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 04:20:57 -0700
Date: Wed, 13 May 2026 14:20:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: gregkh@linuxfoundation.org, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] staging: fbtft: convert sysfs attributes to use
 ATTRIBUTE_GROUPS
Message-ID: <agRelnE-crnLDuvc@ashevche-desk.local>
References: <20260513064257.1238-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513064257.1238-1-shawharshit116@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 13, 2026 at 06:42:57AM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() calls with the correct
> ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
> driver structure so the driver core automatically adds and removes
> the sysfs attributes when a device is bound or unbound.

...

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

I need to withdraw this tag. Please, compile the code before sending.

You may not use ATTRIBUTE_GROUPS() in conjunction with extern.

-- 
With Best Regards,
Andy Shevchenko


