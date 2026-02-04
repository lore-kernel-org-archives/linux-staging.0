Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD13D4124
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200867; cv=none; b=KhPuLkZJqG4qsPLLrt20n732oaROB1anSMz/lwpFGzQd8U9sxEe5v+eQmqwDGAYg1M0eb9brR5giBsbg0aH3uDkLrQ7kMGBqzyz1seO0q/BuSoK9Dz4hbC102TR6KfWSrdkCfD6ruLFFwf0/lI+wNSNcI6Jc+Igm6PsuIwzvTFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200867; c=relaxed/simple;
	bh=XlhXOaOGztmvs8TF36JGKTR3YyjrzZjuG6UBfdf8RGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9ny/l0k7Y9kooCxAsTWtrbIXsmBmIVebSZNrRR+jJtt9eDSHJBYFjoiKli9ZAGY2AgvJ0WjYScxUN3jZevO7KJ1kEM84v1z6dc07eRUJJ8L6aHCvm1Bf8ibLP2fBno5d92oBr7PhVnJzd3y+bh0HQrV79P0Hi75Dl0vaGej9ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGgHHM1E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGgHHM1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770200867; x=1801736867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XlhXOaOGztmvs8TF36JGKTR3YyjrzZjuG6UBfdf8RGk=;
  b=FGgHHM1EDtfCL76/tzHdUWP3tFPwM1PkcarjueeXLx9UkLykiSdzvGTe
   OcPheR1LLHNNZg6VROp1j1JER3DynIrhUQboNGJUcgQvOekqLThum1qXR
   KIULQzZKtVub8v4SvrlyONtdpClwPwqpfDKD36hBBjEISOHHj7PvGT+ay
   mYv45/15jK9RvXc8ipacJOluYdlUnLJT9ewrvIE52levcY+BEjOhYOKDN
   skc7KRYzUbUXQwwWVnJPaeMvxQ1EUMpRFC484uJOsQW+hGZdkDjp32xMc
   Sq5eyKunBBCXCFIq4/Or9PjdXRAfwYUs4/LLQsTi0jlWSAsYc0AJJ7/96
   A==;
X-CSE-ConnectionGUID: tkFridsMSGiM54ADv8C4Ig==
X-CSE-MsgGUID: JckglEXqT0u0xOPRyvKxVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81698171"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="81698171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:27:47 -0800
X-CSE-ConnectionGUID: rLCVA7jTTZ+CvHN/FqEdmw==
X-CSE-MsgGUID: Hsimr3BmRr2O9Ef89/2uaA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:27:44 -0800
Date: Wed, 4 Feb 2026 12:27:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] staging: rtl8723bs: replace rtw_zmalloc() with
 kzalloc()
Message-ID: <aYMfHiBrODTx1vRL@smile.fi.intel.com>
References: <20260204064455.1379342-1-s9430939@naver.com>
 <20260204064455.1379342-4-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204064455.1379342-4-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 03:44:52PM +0900, Minu Jin wrote:
> Replace the wrapper function rtw_zmalloc() with standard kzalloc().
> Use kzalloc() for rtw_malloc() calls that were followed by manual
> zero initialization.
> 
> Additionally, use array_size() and size_add() to prevent potential
> integer overflows during allocation size calculation.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

> static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,

>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
>  	param_len = sizeof(struct ieee_param) + params->key_len;
> -	param = rtw_malloc(param_len);
> +	param = kzalloc(param_len, GFP_KERNEL);
>  	if (!param)
>  		return -1;

Also -ENOMEM?

-- 
With Best Regards,
Andy Shevchenko


