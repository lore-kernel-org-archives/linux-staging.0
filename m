Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068703F6C32
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787870; cv=none; b=haGFzTAk43Qk9UAjiaxZXoxB5SVatiBoy02esMkxdZcfxL+F/iUb7LtDY6uWad3QvielvHCnw4UbZMCygTXMwJHqphhdvRAacZouRJoKeAPeVwMKxoTOaSbs7/bXQhJoundxbRUBNb3sV0uLv1OGr+ugLVWMDxEoFzvSvZ7yJXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787870; c=relaxed/simple;
	bh=5G42YNLZPeohQgu9fudByHPr0ZKUN6EH4SyC+UD9fzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc5nFHfoQnkJziCVWpdYJnEtgTszwQi6X/DR4wk+Q6HhzpiFoyYT07yNQ5kL5Re1W4Gb8VW/nYHlpXnzJczt7edTJ5OPmbVYDZsEiPgV1CjihPJrrYGPGOvDFmpjRe/YKa75u5hH83q4XV8VJVxGwVrfiMbifZgCGLlUlgPDHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ef4/bgBK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ef4/bgBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781787869; x=1813323869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5G42YNLZPeohQgu9fudByHPr0ZKUN6EH4SyC+UD9fzk=;
  b=Ef4/bgBK7j04kHE4p2c7YE5YOJbKF1FuybdeYm2yVUnMYGxpsyQDNc7J
   WelLAtmZpk1TeUqyH9LN7/hw3QHDTezIkw5afj8/VOOtrtOpxGv0bMR+S
   0Sv+oXAlF11TPyD7FES4OWDkrOh8No4z6K664Po9xIdXO/iF3c7jMxNEH
   1Lu+fWc3AmJr5s3DE1fQV/0DkKOKm4JMJ4MikrJOb/5FbpM+6ibbW1zQ0
   UppxxcviBP/9p0ZZgom900ZIuHuBxSwqEzcZlz34FX25RcAP6Vk8S0x80
   Z2cWN8krQT+BXIkx1moOBCgBzxw58MjJy44FUzk3UPkWGoyWBMJ4izugg
   A==;
X-CSE-ConnectionGUID: 4Xr8xZnbQCimKrYK5qplxA==
X-CSE-MsgGUID: Inw+hs6FRIeI10HDQXwOIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105423150"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="105423150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:04:28 -0700
X-CSE-ConnectionGUID: XvStIDxCSDaUgTZg9FK++w==
X-CSE-MsgGUID: 8RDI9byETdyVim8Cx//3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="252261157"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:04:25 -0700
Date: Thu, 18 Jun 2026 16:04:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: prefer __aligned over
 __attribute__((aligned))
Message-ID: <ajPs1w_hFDrsY43Q@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <ajPqQSudT9mS1e53@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajPqQSudT9mS1e53@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 18, 2026 at 03:53:26PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 18, 2026 at 03:09:51PM +0300, Igor Putko wrote:
> > Replace the GCC-specific __attribute__((aligned(a))) with the standard
> > __aligned(a) macro to match the kernel coding style.
> > 
> > The checkpatch.pl error about complex macro values is a false positive
> > here, as enclosing the macro expansion in parentheses breaks declaration
> > syntax.

...

> > --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
> > +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
> 
> >  #define UINT32_MAX UINT_MAX
> >  #define UCHAR_MAX  (255)
> >  
> > -#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
> > +#define CSS_ALIGN(d, a) d __aligned(a)
> 
> Ah, nice finding! But this header should be killed. It means that rather
> kill the macro altogether and replace all occurrences with the proper
> attribute (see the history of math_support.h as an example).

For the record, I just have checked and in this entire header the only
CSS_ALIGN() is used by the driver, the rest is already a dead code, so the plan
is that:
 - replace CSS_ALIGN() by respective __aligned() in the users
   (be sure necessary headers are included, usually linux/types.h)
 - drop *or* replace (if there are two categories, make two distinct changes)
   the platform_support.h inclusion in the following files

 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
 drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
 drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
 drivers/staging/media/atomisp/pci/ia_css_acc_types.h
 drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
 drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
 drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
 drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
 drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
 drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
 drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
 drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
 drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
 drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
 drivers/staging/media/atomisp/pci/sh_css_firmware.c
 drivers/staging/media/atomisp/pci/sh_css_hrt.c
 drivers/staging/media/atomisp/pci/sh_css_internal.h
 drivers/staging/media/atomisp/pci/sh_css_param_shading.c
 drivers/staging/media/atomisp/pci/sh_css_params.c

 - drop platform_support.h for good

So, I expect three *or* four patches in a series.

-- 
With Best Regards,
Andy Shevchenko


