Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B844231B130
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131706; cv=none; b=EKS5hhAxLANLJA+PsUw4yAo3Hf3pVdJlbaGQTVCl6/hP+/XjKlthP9SC7QRov0T/yLatSYIrHGeADduKOQ8bJTZuj5TSI8I2fA9ohSPaQVgPYBfo4AN0jSAIO8wErzCYCItZmPvh9AnihdiR/o77A/uyEEGpphz408+KuT2iaRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131706; c=relaxed/simple;
	bh=zeFaz968/FmfVdqUf02Fjjg4IAOYZ0tXQfQ+XejDjJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNHoAnsddPuV7OmqzusQLx56DpQ+yLYq6QUlznnQzNerDThd6vOyj7EkKSS/Zk+Osi43JJEZrBBYHtRdDw7M+M5V6XE96/POVvgcRcaX1hLNJkhQUiB5VeXS7BfQwAyUZPt4vLbL6ZWaenCKcD5SnWzjKnqAhVG5/9Exk4O4M6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYXnkkaq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYXnkkaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770131704; x=1801667704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zeFaz968/FmfVdqUf02Fjjg4IAOYZ0tXQfQ+XejDjJs=;
  b=BYXnkkaqZJNOSVrGU5GNkAlglZB7y4Ti4gDLJnTtohHz5N6GxHzKOOZh
   yr1IfG7yrneTZTYGXTygJzBdplv0bMeCN7ycfOANLXtlREestLIjE+FtJ
   G0vaOMd9EQ79oLn9kEqEZ7aWCvh6UjiUcCuKdmUcB/KQZCxLTmBQuReXN
   oZle8guT9Xe/QGpBhn/adC3tHvWtzkMgxJtnjPawsMFtThTfProZTQsxp
   bVUxeHod0Gf/QZl42cyBiRaxsG8u4dg1UfVdriXd0VJTr8iqGiOvg49Z6
   TKt5XrjzImpOxOuDtCcNT+FebcbCIkaUcUXkNR7PDsK0EDDv5iIzjdAQ7
   A==;
X-CSE-ConnectionGUID: EA5J2OPQR/20HXavjsWPTQ==
X-CSE-MsgGUID: wKMaQ8uYT7K2yR7dVYg4gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73901458"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="73901458"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:15:03 -0800
X-CSE-ConnectionGUID: qq2Zdc+uQ8GTRlysBSp9aw==
X-CSE-MsgGUID: Rm7mDMtcTcmXiZ15hUXU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="240550010"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:15:01 -0800
Date: Tue, 3 Feb 2026 17:14:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, andy@kernel.org,
	linux-staging@lists.linux.dev, straube.linux@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] staging: rtl8723bs: remove unused allocation
 wrapper functions
Message-ID: <aYIQ8iJ5R11IxcA7@smile.fi.intel.com>
References: <20260131193001.303307-1-s9430939@naver.com>
 <20260131193001.303307-5-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131193001.303307-5-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Feb 01, 2026 at 04:30:01AM +0900, Minu Jin wrote:
> All memory allocation call sites have been migrated to kernel
> APIs (kmalloc, kzalloc, and skb functions). Therefore, the custom

kmalloc()
kzalloc()

> wrapper layer is no longer necessary.
> 
> This patch removes all redundant wrapper functions and macros from
> osdep_service.c and include/osdep_service.h, including unused macros
> like rtw_skb_alloc_f.

rtw_skb_alloc_f()

...

> -void *_rtw_zmalloc(u32 sz)
> -{
> -	void *pbuf = kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
> -	if (pbuf)
> -		memset(pbuf, 0, sz);
> -
> -	return pbuf;

This change should remove the _original_ implementation, so no need to have a
churn to first convert this and then remove it.

> -}

-- 
With Best Regards,
Andy Shevchenko


