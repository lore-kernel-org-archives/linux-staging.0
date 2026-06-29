Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A923B2FF1
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744808; cv=none; b=gQzwsc25+FnS8lpcx+GElu/vBSc/e/nS4FdpTmbjkmXIDHbG6RUfuISJJv9HztkvTuAN+kdFeEm6JHX2BW09ugdkA4i50z4MPTm4eRbaTj5UjegFTUpmF19nQFMb+bzBNTPyFoC090+ni3XdRQ9xKtyNLRop8/bBvdPsKodnSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744808; c=relaxed/simple;
	bh=QAASA7vVoa8vgutUpkxXK1xcnbnmSWAfDbZBZURSbII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrZhosFduPo+xW1qvk/5fWUOJ2RdwzP9tmKWU0LULhYBu+XTkZRG9tB7dbeWBP8Uodu/N32MVVCWpjBJdnAaOAdMZP4VTPIz5Hla1HBAiWYZzRD+HWO8XNeN9LhpBdGxpVCfa+Dbpbf5M03jqeEbz7LTBJzcqYHy2B0ouStDbeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYwp3oSb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYwp3oSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744807; x=1814280807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QAASA7vVoa8vgutUpkxXK1xcnbnmSWAfDbZBZURSbII=;
  b=XYwp3oSbX6DRTIxYb7FAeEq/rkj61irvcxKn/FrusKd/+IQJ3N6qcOYH
   ypT7xw27Ly3Fcur/sIZYpZeHKBMTDBtW0mXqLCGeTJFzgXO6ql6lNdf6t
   2dGwHaYuEI5rZwoX3KXUl2Bo8ZUZ1MbY5NGFufrWXMJo5fSkWYfjiiHqT
   iC+tc2/BZwTw0Dy1NKgU7aq1Wyo9p8i2NjCOaJMDsZa8uqE47+B8QgiPC
   Jxi9wl5MVm7F7+ZjRZeF9bAfU5TCFHpqTUAK/u+NCjU2yTSO4xlOGXdBq
   mL3nvCWjE7vyQRHOkI+baDl6poZ+ZsyGx0swwGrhLfaMDnG21/K5lu+QU
   w==;
X-CSE-ConnectionGUID: SmTCpebiTMyUP0KmnV5Fbg==
X-CSE-MsgGUID: PcgvIBglSreTFjUa3M1F7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106229754"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106229754"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:53:27 -0700
X-CSE-ConnectionGUID: OIC/MQN+QTG6WUsFabEpEw==
X-CSE-MsgGUID: brbamaLqTdaCoPYw+y8KCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250286574"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:53:25 -0700
Date: Mon, 29 Jun 2026 17:53:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: hansg@kernel.org, andy@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, error27@gmail.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: reject frame dimensions that overflow
 the size calculation
Message-ID: <akKGzfWUgBxnmQ0t@ashevche-desk.local>
References: <20260627110355.27167-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627110355.27167-1-doruk@0sec.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jun 27, 2026 at 01:03:55PM +0200, Doruk Tan Ozturk wrote:
> ia_css_frame_allocate() computes frame->data_bytes (a u32) in the
> frame_init_*_planes() helpers as width/padded_width * height *
> bytes-per-pixel * plane-count, using plain unsigned arithmetic with no
> overflow check, and then hands the result to hmm_alloc().

Translate this from programmer's mess to plain English.

> A large
> width/height pair wraps the u32, so hmm_alloc() returns an undersized

Same, u32 --> 32-bit value

> buffer that a subsequent copy can overflow.
> 
> Reject up front, in ia_css_frame_allocate() (which already returns
> -EINVAL for bad arguments), any dimensions whose worst-case byte count
> cannot be represented in the u32 data_bytes field. The factor 16

Same here, 32-bit field (no need to even mention data_bytes, it gives just
a noise to the reader).

> conservatively bounds the largest per-pixel multiplier across all
> supported formats (up to 6 planes, or 3x RGB planes with up to 4 bytes
> per element).
> 
> The most directly user-influenced caller,
> atomisp_v4l2_framebuffer_to_css_frame() (S_ISP_FPN_TABLE), is currently
> gated off by 2b7eb2c5dc72 ("staging: media: atomisp: Disallow all
> private IOCTLs"), and other callers pass driver-derived dimensions, so
> this is defense-in-depth on the shared allocator rather than a live
> userspace overflow.

> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> Found by static analysis; not yet runtime-reproduced (Intel atomisp
> hardware required).

This paragraph is not anymore required and considered a noise in the commit
message. Comment block is perfectly fine for this...

> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Assisted-by: 0sec:claude-opus-4.8
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---

...somewhere here.

>  drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 6 ++++++
>  1 file changed, 6 insertions(+)

...

>  	if (!frame || width == 0 || height == 0)
>  		return -EINVAL;
>  
> +	if (check_mul_overflow(max(width, padded_width), height, &bytes) ||
> +	    check_mul_overflow(bytes, 16u, &bytes))

What does 'u' give us here?

> +		return -EINVAL;
> +
>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>  			    "ia_css_frame_allocate() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
>  			    width, height, format, padded_width, raw_bit_depth);

Shouldn't we dtrace still the error cases? Wouldn't be helpful in debugging?

-- 
With Best Regards,
Andy Shevchenko


