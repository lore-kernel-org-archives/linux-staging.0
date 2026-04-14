Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A13E5EEA
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776169321; cv=none; b=WdlpBFD4dMcF8E/BUGsu6g8KSj+a9ms84PPPrPYK8aJQ99AlaRz57KfNSzOz3L1KO8lGwZm4amBtIQmMycwa+ktgxSeYJDIFP+u0J8iVY58PMfn+TaAgBpTzxebzknqXMD6k0w2sGrzDL3jpgHivtJVsbAd4PjUDrRm2+r5rT6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776169321; c=relaxed/simple;
	bh=zuj8iC/4joKtPm8EqJP0LPBuwhuA9CuDTYZEwSrJLKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDaQJqTT7ZoDRfqGy6dc9WxQTSBg418GZK0EgGL2H4rnDGlrWJscaFi0D56kbACSaZv3NEDT3lCzxFf3sbabd2L3/w/016SdqBcUSUfTy/pArZeDa+dG/bd0pvWfFY1yH2I8qt0dnyk9Z8+MBiO7LXyDanYGMFI5Jt83WFwJSQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5Hs5GIj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5Hs5GIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776169319; x=1807705319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zuj8iC/4joKtPm8EqJP0LPBuwhuA9CuDTYZEwSrJLKg=;
  b=e5Hs5GIjuCg2v7swo9F+A589IDprdCKwoZM3lNiFCMtmivIcrok3mrsl
   RoRR4rbeCsTrXeNFDesVEYS1K3/+Gap4qaGyYF++xzbhx+opzZjKIrt+D
   jr87PBYvzhHxXR27XpyKPc+KmYb70I8MLdzpiU8h8f8Le1Fde0vfzHaua
   GGmcdCpufWwBg8OzJTu4TgqyacQBF7w2Y0oL14YFR0hfx1VX7V+zK6OgE
   BYRGAQURdad9ve9lRAePtWdB3GkkCsQVFjmTqfFwupq0vnXiZEvbumQiH
   hnMMR/RUA0QucQNjpTS4SNR9aNIRvjefrUXjP5YFjclhdU0YmKZOYoJAW
   Q==;
X-CSE-ConnectionGUID: lLfB+e/XRJaZ2eRvcCrynw==
X-CSE-MsgGUID: b2oFIM07Q4m/W8bHwH3gSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77005479"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77005479"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:21:58 -0700
X-CSE-ConnectionGUID: sxUwPCIoRpSwFTaEEO7mgg==
X-CSE-MsgGUID: cIvEUHvqTlC85uMGhELzhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229054767"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:21:56 -0700
Date: Tue, 14 Apr 2026 15:21:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Finkelbaum <regpacy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] staging: rtl8723bs: fix Yoda conditions and == false
 comparisons
Message-ID: <ad4xYmCJGXuLVJWM@ashevche-desk.local>
References: <20260414095833.76480-1-regpacy@gmail.com>
 <20260414095833.76480-7-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095833.76480-7-regpacy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 12:58:30PM +0300, Marc Finkelbaum wrote:
> Replace reversed comparisons with natural-order equivalents:
>   - '0xFF == hw_channel_plan' -> 'hw_channel_plan == 0xFF'
>   - 'false == pHalData->bDisableSWChannelPlan' -> '!pHalData->...'
>   - 'is_supported_24g(...) == false' -> '!is_supported_24g(...)'
> 
> The multi-line if condition around bDisableSWChannelPlan is also
> reformatted to standard kernel one-line style.
> 
> No functional change.

...

> -	if (
> -		(false == pHalData->bDisableSWChannelPlan) &&
> -		rtw_is_channel_plan_valid(sw_channel_plan)
> -	)
> +	if ((!pHalData->bDisableSWChannelPlan) &&

Too many parentheses.

> +	    rtw_is_channel_plan_valid(sw_channel_plan))
>  		chnlPlan = sw_channel_plan;

-- 
With Best Regards,
Andy Shevchenko


