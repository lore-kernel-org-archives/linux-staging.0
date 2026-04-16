Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC03235C184
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326825; cv=none; b=bAsxW9FoWk0c1sqZtkugPJgZl3XhMzzKVCYr7UpshtmTHVR3wPsBoH6+CsvXonc1NWtWY9YERHOQ8Du96MOj7IJBsYH2v2e/4ijXVURiHZuEaEMarA+KkuLRt0RUvqCgPhPksb5+/pAv3hNsf3/lzRRdQ+gqg+3ygmUnwG6GMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326825; c=relaxed/simple;
	bh=pezVG2mLXqKfjCCLMLroYv/ECTsZBOaIgobPes3w94c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSLB2cuI1/Sa/phfK6GtT4o5QSqUIbDccD49zqi9gdJpha9bhcamFrNkgcxFT57r3Yhwm58QxVvz4Hn6yvXYOykmNGgQxeZzsMAHH3gDaT7JRDqKqnpmvkRWGwX1x57lucekeeTU0aHgAlO2X+YltOzQomF70z0CMoyxpBhESc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQnvF0+Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQnvF0+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776326824; x=1807862824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pezVG2mLXqKfjCCLMLroYv/ECTsZBOaIgobPes3w94c=;
  b=AQnvF0+QxOpKflmLAEKLFiy6XJZsdJsa4B2cZAM7v+uekmh/udllB7I2
   ggI6HspS0XbTW9JUXZKhEoFb7goaX5MFDsC/LM9n9NCcIjbV3KiEMNpKv
   tOQ9k+erfB+X+ofmqRJylHL+s/68lQnn9H9jLd1yKb81xqtpBTkcEyEVV
   ut9ulS57NHZkrAStnaF0uygoAnRlDoiVLA2BiwDOwvavwkg7yHnWPBRCH
   JVAUB1/09iNfiiczXwZHmRbxIX2ZIbRTl98lLmc/9wzQ0DpIP3U/ou2ae
   cWgw90yF9SFugX+SV5QzAt85oaRey2OFPkyZBCquGaNBpp2jGTXoHECIx
   w==;
X-CSE-ConnectionGUID: ehau2f9pTFCcUYovSH+9nA==
X-CSE-MsgGUID: pWmOdHekSnmquVFF+I6nTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77193967"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77193967"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:07:03 -0700
X-CSE-ConnectionGUID: VKFpzGFlTHW4U/1UJ2h4Tw==
X-CSE-MsgGUID: 1et1Df5GRsW2AgC6uDefPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="229830265"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.173])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:06:59 -0700
Date: Thu, 16 Apr 2026 11:06:56 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix memory leak of
 raw_black_frame
Message-ID: <aeCYoC0le9P0dnkT@ashevche-desk.local>
References: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 16, 2026 at 02:30:58PM +0800, Huihui Huang wrote:
> Our code analyzer reported a memory leak in
> drivers/staging/media/atomisp/pci/atomisp_cmd.c.
> 
> In atomisp_fixed_pattern_table(), raw_black_frame is allocated by
> atomisp_v4l2_framebuffer_to_css_frame(). If sh_css_set_black_frame()
> fails, the function returns -ENOMEM directly without freeing
> raw_black_frame. The allocated memory is only freed on the success
> path.
> 
> My patch adds the missing ia_css_frame_free() call before the error

s/My patch adds/Add/

> return, to free raw_black_frame when sh_css_set_black_frame() fails.

...

>  	if (sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
> -				   raw_black_frame) != 0)
> +				   raw_black_frame) != 0) {
> +		ia_css_frame_free(raw_black_frame);
>  		return -ENOMEM;
> +	}
>  
>  	ia_css_frame_free(raw_black_frame);
>  	return ret;

This is unneeded complication. What you need to do is just replacing if
conditional completely.

	ret = sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
				     raw_black_frame);

-- 
With Best Regards,
Andy Shevchenko


