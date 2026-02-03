Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB72D5C86
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131586; cv=none; b=i8S0mIFuN/273M08yG47Vi2N5ZKLpIbiHO2Hjc2eG9Kd6RxNbWsFzPWdDZgfXapA6nCvJy106fAzyrnPGU2Tc+fsFk1UVso9+uBlnvOb+kSGs2bNeUJvJbLjzPxo1oEmm0lGskJuO7+TLgjtPkd2v7ZAd31OWkVqFoP59wc0de8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131586; c=relaxed/simple;
	bh=HOKMLsdX584L+Wglt3Jbnci6DbiexPI5I5LJfaNMfcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKav8njFQKueB3xujAt0eo0CwMwqLXymZ47I+qtFLe6pOmyjsTNUBaGJydxmvNqSTjEi+fXelirRK2v5ZlynlGYq2F5hwsmiXIlXC4PvoAKKhDXTZcEEYTGmZYQN7Ihy1Eyxir72VEh98GPGxtaMLgi3IrRwMZR1Nfh4MCEhd4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex7wN01D; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex7wN01D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770131585; x=1801667585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HOKMLsdX584L+Wglt3Jbnci6DbiexPI5I5LJfaNMfcQ=;
  b=Ex7wN01DWoLdIzuXI/CieWvCb7HDsljcZBR2S90rOOi5/lVGETW6XPOA
   5KVag/pXHu21in6BK7QlQYIczkNEttGYIhiwVnFrGB5IGGZFMIuiIN2dA
   4hsBK0IuHvG4DTlQxcVrjLaJWwVZ1rsEdGgJAWzRlsE8d5YGuVCZ+whec
   HNKxxoGGHGnJ/1eaK1T55yxX4HOdmimMRGzwMtkUz0M/P/0I5xzAIr2jQ
   3bG9r6H1OHH80nsgomEdRPylmQ7T+f/v6iTQbeCoMfVfgCkvISnYr1Rcx
   Veqvmr+qL8/ZUoY2jauCLbaXsWxaS6102OUniJ/3Dnyw3St68VXjZqBN4
   w==;
X-CSE-ConnectionGUID: ByMGKDs7Q8e2YwHhPA36vw==
X-CSE-MsgGUID: 3u7Qph3NTryyRQpoX0SXxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82733362"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82733362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:13:05 -0800
X-CSE-ConnectionGUID: JptO5VuAR12JmkKVg3Jhaw==
X-CSE-MsgGUID: GHdOp9DxSgCc3neY9ohP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="247473443"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:13:02 -0800
Date: Tue, 3 Feb 2026 17:13:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, andy@kernel.org,
	linux-staging@lists.linux.dev, straube.linux@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] staging: rtl8723bs: replace skb allocation, copy
 wrappers
Message-ID: <aYIQfJratRz-H5N6@smile.fi.intel.com>
References: <20260131193001.303307-1-s9430939@naver.com>
 <20260131193001.303307-4-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131193001.303307-4-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Feb 01, 2026 at 04:30:00AM +0900, Minu Jin wrote:
> Replace the wrapper functions rtw_skb_alloc() and rtw_skb_copy() with
> kernel APIs __dev_alloc_skb() and skb_copy().
> 
> I used GFP_ATOMIC for the network data paths  because these
> functions are called in contexts where the driver cannot sleep.

...

> -			precvbuf->pskb = rtw_skb_alloc(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ);
> +			precvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);

>  

Drop this blank line for the consistency's sake (other cases use no blank line style).

>  			if (precvbuf->pskb) {
>  				precvbuf->pskb->dev = padapter->pnetdev;

...

> -		newskb = rtw_skb_copy(skb);
> +		newskb = skb_copy(skb, GFP_ATOMIC);
>  

Ditto.

>  		if (newskb) {
>  			memcpy(newskb->data, psta->hwaddr, 6);

-- 
With Best Regards,
Andy Shevchenko


