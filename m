Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F9F34164B
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 22:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637756; cv=none; b=f9r4Sy/bW2HBwx/nyQ1P/IvtPwaWCzmVEhoD5H81hMVgCDXdudihkvfa8CcTBD8wkcI0Xxe5XeRkPNgLtM9zRezhEPWcg8spIeVsKr665vrQ3wcWfYbhBKX2bLvLukbknoLBpHH/t352RcbqR67JyWR1sBFi1HL3lxtvJi4Vo3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637756; c=relaxed/simple;
	bh=otfYkLrBrkSwldBhRRywD89Nwzi2JaOF/TwkKVbKkOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgTcP3RXfFyFS67LootKO1absQ0JTuXQPb5mHMFHRd21JMqu5ZTgMOKVc7gJg/c6XPgDmowVOzJYui0c/81rMrHIYtZyfxsyNPPnCfniyXiye12scOp5fMr1rQS/Sf/FYunKYPqPpqxR7Sd1leJNijZAVRzlmw8p4XM+ggK+ieA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gerETzUQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gerETzUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769637755; x=1801173755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=otfYkLrBrkSwldBhRRywD89Nwzi2JaOF/TwkKVbKkOA=;
  b=gerETzUQpAoBegx3HdGfa9h2AHoDVZMsWJv18yOS+Yz1WphTWRDMz3jZ
   Sua+tzY8AiSfqNIy2UUC9IPO2o/nKN40F0UwDKM6vhe/9UuzfCMnpNvEo
   5vSA6pHm/FpcbWKdGhtXdqF5ng8ik/m+q0MfKTJpYTUVP8wl6R0t3wXfD
   lpcy0TNBSynR5KrizMR+QUn4UGM8npNozvKqc9IqXqsPutPIxJUAaYZTc
   DvqOqMNyg0g+lUwUpxA5i5hGS2gQu1WQmyLQsELfNP4V6DaigF6Yyyl9b
   jZg7ftBG+j+jkILYPW0TVBBxeBmF6w5LHK3i9DAsI53OszgJhQ80ig8Or
   w==;
X-CSE-ConnectionGUID: dDgB+yy8RV+y3w+jil7hLw==
X-CSE-MsgGUID: wclvn+oKRWifapezviw+JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81179856"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81179856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 14:02:27 -0800
X-CSE-ConnectionGUID: K4WPu5BDQKCA1SDabel9Cg==
X-CSE-MsgGUID: I9zQmsQRTXaiI1TAiel13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208749786"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 14:02:25 -0800
Date: Thu, 29 Jan 2026 00:02:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, andy@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: Re: [PATCH v3 2/4] staging: rtl8723bs: replace rtw_zmalloc with
 kzalloc
Message-ID: <aXqHbhkXPiZVpqcS@smile.fi.intel.com>
References: <20260128140954.1065382-1-s9430939@naver.com>
 <20260128140954.1065382-3-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128140954.1065382-3-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 28, 2026 at 11:09:52PM +0900, Minu Jin wrote:
> replaces the wrapper function rtw_zmalloc with kzalloc.
> 
> I reviewed all the call sites to determine the appropriate GFP flags:
> - GFP_KERNEL: Used for initialization and configuration paths.
>   init/probe, config/setup
> 
> - GFP_ATOMIC: Used for critical real-time paths.
>   including interrupts, timer handler, region where spinlocks are held

Below I suggest more changes, but probably they needs to be done as separate
patches. It depends on Greg's preferences.

The change itself LGTM.

...

> -	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
> +	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);

Since you are touching this line it might be worth to check and convert to use
sizeof(*) instead (but it needs to be done with a carefulness.

>  	if (!ph2c) {
>  		res = _FAIL;
>  		goto exit;
>  	}
>  

...

> -	pcmdpriv->cmd_allocated_buf = rtw_zmalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ);
> +	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ, GFP_ATOMIC);

>  

You can drop this blank line at the same time, we usually don't split
allocations and checks.

>  	if (!pcmdpriv->cmd_allocated_buf)
>  		return -ENOMEM;
>  
>  	pcmdpriv->cmd_buf = PTR_ALIGN(pcmdpriv->cmd_allocated_buf, CMDBUFF_ALIGN_SZ);
>  
> -	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
> +	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_ATOMIC);
>  

Ditto.

>  	if (!pcmdpriv->rsp_allocated_buf) {
>  		kfree(pcmdpriv->cmd_allocated_buf);

...

> -				passoc_req = rtw_zmalloc(psta->assoc_req_len);
> +				passoc_req = kzalloc(psta->assoc_req_len, GFP_ATOMIC);

>  				if (passoc_req) {
>  					assoc_req_len = psta->assoc_req_len;
>  					memcpy(passoc_req, psta->passoc_req, assoc_req_len);

This  might be a candidate to kmemdup(), but double check it (it looks like
_len:s maybe different.

...

> -	spt_band = rtw_zmalloc(sizeof(struct ieee80211_supported_band) +
> +	spt_band = kzalloc(sizeof(struct ieee80211_supported_band) +
>  			       sizeof(struct ieee80211_channel) * n_channels +
> -			       sizeof(struct ieee80211_rate) * n_bitrates);
> +			       sizeof(struct ieee80211_rate) * n_bitrates, GFP_KERNEL);

This needs a bit of array_size(), struct_size() conversion.

-- 
With Best Regards,
Andy Shevchenko


