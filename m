Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B5395261
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130341; cv=none; b=M1pCYZq18kuIrIEzHAVgDOtpoUh+4cO/orG3VBFgZ+vhAAfCVTjz3i5L5uDODP1RepkF7/Y4mxobtHK+ziGM41iHLc1+wxHeGYPUZ1873UwtYA64sFIYZhpgwFGB0kiw4CKchZmrxbM5lRrnZbMuJl1hmF3msQ/A2Nlwu1cr3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130341; c=relaxed/simple;
	bh=GSrSaXTkpEqjOmZ34QkfnmEFIc8JwQoRB/N4qkimh2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B25/+sVvpDZPx6y1mVUNfD7FyQSORBlEgILWBThT/yqmEYqLoAafXN9tO2kr8xEjfPXiye7q7CnoWgu/J1986kRWwlX0s1FbVTig5/nPvJg7/YFQ+qTSHkGEE7Fu/QMsjIq92XjCR5SwPF9g76Uaf8+flsd6oFdZw/cqvw00yvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OF4yhPtq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF4yhPtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770130339; x=1801666339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GSrSaXTkpEqjOmZ34QkfnmEFIc8JwQoRB/N4qkimh2M=;
  b=OF4yhPtq4WsV38XpDMLPkaWvo7TlldvvN6FmcdSLEA4kpRvP57C2tO18
   To4vcCbCcZRGpNUdY/DBNfV137Kw7tQ1FV0HXIskx0SPQQMiacBZ7qLyJ
   75TcJFLinft/lOtL2v5uoZHgPhaay7Tvsa5Ym2TV4qfIkgQFYRXN2OxF+
   mSn1ZRTQG2pOP9hpk8mmVJS62+OK+W4ZECgP2LMxj0LwD+Fh6flmN/Ll3
   sMT0fgTmT1qvKJe+8LH3i2yb+jUo/tnTVwxN9NBkO0tJbHFKYOwmTkyiP
   f/RcRuNGnmclLph9jmyA90j4vEKmOBLXko8Lduey3/q0RyNCW41FuTyu0
   g==;
X-CSE-ConnectionGUID: emE09C/mQKS9RF2ZmXUj5Q==
X-CSE-MsgGUID: fbiE3q24QSOvfXqrPUdFQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82727785"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82727785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 06:52:19 -0800
X-CSE-ConnectionGUID: whCo4U58T1CX6b/OfGlazA==
X-CSE-MsgGUID: dJFyqTKmQrayK6w+HR9kTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209658546"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 06:52:16 -0800
Date: Tue, 3 Feb 2026 16:52:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, andy@kernel.org,
	linux-staging@lists.linux.dev, straube.linux@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] staging: rtl8723bs: replace rtw_malloc() with
 kmalloc()
Message-ID: <aYILnssCFT8ZPIvp@smile.fi.intel.com>
References: <20260131193001.303307-1-s9430939@naver.com>
 <20260131193001.303307-2-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131193001.303307-2-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Feb 01, 2026 at 04:29:58AM +0900, Minu Jin wrote:
> Remove wrapper function _rtw_malloc() and macro rtw_malloc().
> Replace all rtw_malloc with kmalloc.

rtw_malloc()
kmalloc()

> All call sites are reviewed to select GFP_KERNEL or GFP_ATOMIC.
> 
> 1. GFP_KERNEL:
>    Used in paths that are executed in process context and are allowed to sleep.
> 
>    - Driver initialization and probe paths.
>    - Workqueue callbacks and cfg80211 configuration callbacks.
> 
> 2. GFP_ATOMIC:
>     Used in paths that must not sleep because they operate in atomic contexts.
> 
>    - Interrupt handlers and SoftIRQ contexts.
>    - Functions called while holding spinlocks.
>    - Low-level I/O operations (SDIO) (eg, sdio_read32())

> Replace kmalloc()/memcpy() with kmemdup() where possible.

This one probably better to have in a separate change (obviously before
this one).

> Replace sizeof(struct val) with sizeof(*ptr).
> Remove blank line after kmalloc().

...

> -	if (remainder_ielen > 0) {
> -		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
> -		if (pbackup_remainder_ie && premainder_ie)
> -			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
> +	if (remainder_ielen > 0 && premainder_ie) {
> +		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
>  	}

No {} and it will be better to check pointer followed up with length check:

	if (premainder_ie && remainder_ielen)
		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);


...

> -	if (remainder_ielen > 0) {
> -		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
> -		if (pbackup_remainder_ie)
> -			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
> +	if (remainder_ielen > 0 && premainder_ie) {
> +		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
>  	}

Ditto.

...

So, the above two should go before this patch.

...

> -		tmpbuf = rtw_malloc(n);
> +		tmpbuf = kmalloc(n, GFP_ATOMIC);
>  		if (!tmpbuf)
>  			return -1;

Side note, these '-1':s probably should be converted to '-ENOMEM':s.

...

> -			pmlmepriv->wps_probe_req_ie = rtw_malloc(wps_ielen);
> +			pmlmepriv->wps_probe_req_ie = kmemdup(wps_ie, wps_ielen, GFP_KERNEL);
>  			if (!pmlmepriv->wps_probe_req_ie)
>  				return -EINVAL;
>  
> -			memcpy(pmlmepriv->wps_probe_req_ie, wps_ie, wps_ielen);
>  			pmlmepriv->wps_probe_req_ie_len = wps_ielen;
>  		}

Move this to the 'kmemdup()' conversion patch (as mentioned above).


...

>  void *_rtw_zmalloc(u32 sz)
>  {
> -	void *pbuf = _rtw_malloc(sz);
> -
> +	void *pbuf = kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);

No, this has to be

	void *pbuf;

	pbuf = kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);

>  	if (pbuf)
>  		memset(pbuf, 0, sz);

So, why this simply can't be moved to kzalloc()?

...

>  	/* duplicate src */
> -	dup = rtw_malloc(src_len);
> +	dup = kmalloc(src_len, GFP_ATOMIC);
>  	if (dup) {
>  		dup_len = src_len;
>  		memcpy(dup, src, dup_len);

Obviously this is candidate for kmemdup().

...

>  	struct rtw_cbuf *cbuf;
>  
> -	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
> -
> +	cbuf = kmalloc(struct_size(cbuf, bufs, size), GFP_ATOMIC);
>  	if (cbuf) {

>  		cbuf->write = 0;
>  		cbuf->read = 0;

Maybe you want kzalloc() to begin with?

-- 
With Best Regards,
Andy Shevchenko


