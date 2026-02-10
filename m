Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1B33F390
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716627; cv=none; b=oKaVMP3yBXYP9v/rpCIXXwhmX81NcXVdtTgQ0FwB6uIBGuncTJiBlfW28AvhopTZDvWIjS1U7yyz7bJiCAqNlEhjVezI8FVxVhlW7DEyDyJxpVY84Z3OwEmGGTnqITeL/qpJ2u6dDfBKoEwH8R6U/WfK8izSnwZeviCYV16elEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716627; c=relaxed/simple;
	bh=VNlCnlDm3LalWAYPVIDP8Zo+8N2RwvMxFWoqr6j/8cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGxpzoaiBcrSl9ZsRmHNy0XYqPy9sDmTiST0Nkm1L5e1gH1CEwDkwpvqPndMa21mzAiEMz6mZpYg73dlg27NsHyZnmASQakp4Q1rkV1E0iPAJdwdNkTfbe7kqNUwGgKxEvKO+WLez0RkAt779CL7JFopeuHuAbP/kjqenuzGdcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu/g0M2E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu/g0M2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770716625; x=1802252625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNlCnlDm3LalWAYPVIDP8Zo+8N2RwvMxFWoqr6j/8cA=;
  b=Tu/g0M2Es7pfYH8gT80eK6K5Z4wzeRsQ/IPUOvYO9CSY9FutgiJl8Cdk
   Z/39tDH9KvB8j+81eCv/WlDYmsshTpB+MHcor68lWjtlB1dYOB1hpK4b0
   MDwrpjroMe40CCoyU8jP04uodlT81vYC76fiOCdGck+lGKYlfM/zSYLIP
   gf47GZyujKQF59JbFdMANnOJzXEpfBZApt24iKD85WxQ2AjOsQHxdpNri
   yyejY2P6qHG33KKtSsGYxLgpSOZgKhygkUEGr61wSmVxl8nuQgx44mG5Y
   pf9UxNyiQV5Gv7b/FgNFUTh8mFEn78xi+hxv5sNiRHmB31h04BZjsz+I6
   g==;
X-CSE-ConnectionGUID: EWDhhDhiQYmMn50rMjT0AA==
X-CSE-MsgGUID: uxtjSGjbTFGLzxfS3iIrrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82478717"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82478717"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:43:29 -0800
X-CSE-ConnectionGUID: hcf8+xKPSwuy2e1Tdni8qw==
X-CSE-MsgGUID: vQo+IOGYTAOx0nfHGuJUlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216839734"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:43:27 -0800
Date: Tue, 10 Feb 2026 11:43:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ethan Lam <ethanlxkernel@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org, hverkuil@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: fix block comment style
Message-ID: <aYr9vMzvyBn83A0U@smile.fi.intel.com>
References: <20260210092312.29322-1-ethanlxkernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210092312.29322-1-ethanlxkernel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Feb 10, 2026 at 05:23:11PM +0800, Ethan Lam wrote:
> Fixed all block comment style warnings by checkpatch.pl.

...

>  /*
>   * DFS progress is shown as follows:
>   * 1. Target frequency is calculated according to FPS/Resolution/ISP running
> - *    mode.
> + * mode.
>   * 2. Ratio is calculated using formula: 2 * HPLL / target frequency - 1
> - *    with proper rounding.
> + * with proper rounding.
>   * 3. Set ratio to ISPFREQ40, 1 to FREQVALID and ISPFREQGUAR40
> - *    to 200MHz in ISPSSPM1.
> + * to 200MHz in ISPSSPM1.
>   * 4. Wait for FREQVALID to be cleared by P-Unit.
>   * 5. Wait for field ISPFREQSTAT40 in ISPSSPM1 turn to ratio set in 3.
>   */

Please, use your common sense. The above is false-positive.

...

>  	 * The standard CSS2.0 API tells the following calling sequence of
>  	 * dequeue ready buffers:
>  	 * while (ia_css_dequeue_psys_event(...)) {
> -	 *	switch (event.type) {
> -	 *	...
> -	 *	ia_css_pipe_dequeue_buffer()
> -	 *	}
> +	 * switch (event.type) {
> +	 * ...
> +	 * ia_css_pipe_dequeue_buffer()
> +	 * }
>  	 * }

No way, really.

...

You need to read the code and change wisely. NAK for this version.
(I'm even not going to read the rest.)

-- 
With Best Regards,
Andy Shevchenko


