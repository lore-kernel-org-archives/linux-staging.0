Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E2D372B2F
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698582; cv=none; b=bFPWmWYYQbo1jjZR/Vi0CLIpH+qVWXQ6Ef3ITGrvTj2g36Jq224ZMyKZgsOTap29sR/VKHkR2xYp+zJX0WRgOguI40inZLZIxgjdgBO8w2/PXcEqBMJw04haWgv+9vUniZz1zQZAIwLrM7ASWgw43BLLwJgDA8nJNdm2Uud9WC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698582; c=relaxed/simple;
	bh=rw76qL6L945evGUO8vbdDxjDjSV3PdnBtZDJY0ap8Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0/EuMiii0R8EJQs0HPyRDJAAYt6+yCFeyvz8SBk+jp5c83ymjB35bmUpzUYcX5MJiq4pzNMs43fN4Rj5MYQUiNkwZQT50ChtdA9anWw+L7cTGs5Zsj9GRQTuRmtCwQ/TQ75+X9HzIMJKX+cy/D/aqr778E93UjCzcGuwAzG0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtZHoXYF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtZHoXYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772698582; x=1804234582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rw76qL6L945evGUO8vbdDxjDjSV3PdnBtZDJY0ap8Rk=;
  b=QtZHoXYFW35w/6tPDeqMPm/UDqMLbBr3T4F7tzIcp9kT0ZZ1YuSZfVHW
   rpkAhEuIRtub18/NLBDsL6f63ApozHpPn+d0OgRllmytk3q5Rq+cTYUQv
   h163+Z5yIvqWc0v8Qi4YcaMamx30Tigjzh6g1gjYJcS3JzUn7jepo33Be
   7kLSc1rx2Ise3Uc6GqUfNhND9N64oqR1jbGU6whSypXH800V2dIicDMJl
   5asDbHjaFPgOUMtLXmTs//mVTxRlhFZ8ddX8Ll1P3vS/EcaAUa0Loit8k
   TMlxg6ZE0UmjIxg3tGYBtR3O3sO0WEURUEIUw+6tDQ94FKp/kx6S3pCxK
   Q==;
X-CSE-ConnectionGUID: yUe5d6k6QACnrZtnZqdfqw==
X-CSE-MsgGUID: 0vCN5U7ZRXWc4gKBWMbLXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73692541"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73692541"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:16:21 -0800
X-CSE-ConnectionGUID: zEhTmYNIQM2x2Y/QtP29Wg==
X-CSE-MsgGUID: IIEZ4/MPRXq5xAUryvtyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="223282398"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:16:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AE42A120CA3;
	Thu, 05 Mar 2026 10:16:48 +0200 (EET)
Date: Thu, 5 Mar 2026 10:16:48 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bogdan Sandu <bogdanelsandu2011@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH v2 2/4] media: ipu3: use tabs
Message-ID: <aak78ByijKCWk-Uj@kekkonen.localdomain>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
 <20260202175033.8640-3-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202175033.8640-3-bogdanelsandu2011@gmail.com>

On Mon, Feb 02, 2026 at 07:50:31PM +0200, Bogdan Sandu wrote:
> Use tabs instead of spaces.
> 
> Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> index 145501e90..e990eb5b3 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.c
> +++ b/drivers/staging/media/ipu3/ipu3-css.c
> @@ -1034,8 +1034,8 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
>  			       3 * cfg_dvs->num_horizontal_blocks / 2 *
>  			       cfg_dvs->num_vertical_blocks) ||
>  	    imgu_css_pool_init(imgu, &css_pipe->pool.obgrid,
> -			       imgu_css_fw_obgrid_size(
> -			       &css->fwp->binary_header[css_pipe->bindex])))
> +			       imgu_css_fw_obgrid_size
> +			       (&css->fwp->binary_header[css_pipe->bindex])))

This doesn't seem to be a major improvement.

>  		goto out_of_memory;
>  
>  	for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++)

-- 
Sakari Ailus
