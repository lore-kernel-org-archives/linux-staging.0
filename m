Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A127470
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 21:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978282; cv=none; b=AhYWnUJb/0LnFAPOSR6UJuU2NuVw512iIkG0lG6EsQ6I/w8xWvZesbhhggG9MJnHAcJBqHbcqpQqSN0udd5V5afZ3aYjXD4+UOxZ35//BDWBUGQq2b4DWRlHgqOnz9eA8SuoIJ5IgtCy9nPtCqe3Rh5U2sY29SjsoUDLnnkfMwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978282; c=relaxed/simple;
	bh=jaKzKyt6SRXWq4CcK47RKdPToKtw6RuCE7nYx5/rsZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5qsrRm5CnBniJkGDE2HQEmHUTGBAm004cMaBa9GPHzKaZLxCk4ry++UwKfDe5Mi8GmBT90e6gCBH6pARJCHPTmALHjFxXVExn1keE3eYsvciQXeNhyEwHRQXXSDshTLoBkld/Noln83HEkt+Au5bg6bPWsVF99tVKsAW9q8viQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLp9srzv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLp9srzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776978281; x=1808514281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jaKzKyt6SRXWq4CcK47RKdPToKtw6RuCE7nYx5/rsZQ=;
  b=BLp9srzvtjnk2/AjEsyTiNaWUiqcPpg+4r+5rT12K83rWCr0HRtqmDHG
   VtA/rf4MW2z4lfbRcN+/5yb0KlqLelcovSEmPZNcmhH8+2RMZ/enYjlYC
   KeBg0FyYD6jHyk7WkcYvXfgQnG/MuE7f3RVNAU37G1ASfaVsFcHVknDi0
   c+Sq0SkZL2PMguQKREHz/Q45VxgUmcaqyirNS551ywNPI6Yfy7of8Iewy
   Sw8UouCKqEA1vC8i4a+S6qhUQ07k5UF8ZwHJ5rxoyoEeN7A6qgW6KGdE4
   xiN0cVI47wFaYDeCE5SXaScwBNnZFggbVNDBFnD1sCl8WWvKQXxzmLqxl
   Q==;
X-CSE-ConnectionGUID: NSroB+zwREGxoYmSLh4U/g==
X-CSE-MsgGUID: 6HMQrTmOTOS6OtRmJv7vnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77868658"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="77868658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:04:40 -0700
X-CSE-ConnectionGUID: D28YbYwdR9Cb7TzLnyStNA==
X-CSE-MsgGUID: ANd5gV++T4+zyAhzXwqq1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="234545627"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 14:04:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2BA8411F94F;
	Fri, 24 Apr 2026 00:04:38 +0300 (EEST)
Date: Fri, 24 Apr 2026 00:04:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Johts <johatanrlima@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, regkh@linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: media: atomisp: pci: runtime: debug: src:
 remove curly braces for single line if
Message-ID: <aeqJZljd2ACrsIcb@kekkonen.localdomain>
References: <20260423184543.109954-1-johatanrlima@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423184543.109954-1-johatanrlima@gmail.com>

Hi Johts,

On Thu, Apr 23, 2026 at 03:45:40PM -0300, Johts wrote:
> Fix checkpath error "WARNING: braces {} are not necessary for single statement blocks" in sh_css_params.c:1931
> 
> Signed-off-by: Johts <johatanrlima@gmail.com>

We need a more specific name here.

> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index fcebace11daf..31426001864e 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -1928,10 +1928,8 @@ sh_css_set_per_frame_isp_config_on_pipe(
>  	params = stream->per_frame_isp_params_configs;
>  
>  	/* update new ISP params object with the new config */
> -	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe)) {
> -		err1 = -EINVAL;
> -	}
> -
> +	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe))	err1 = -EINVAL;

Please run checkpatch.pl on this.

> +	
>  	err2 = sh_css_init_isp_params_from_config(stream->pipes[0], params, config, pipe);
>  
>  	if (per_frame_config_created) {

-- 
Regards,

Sakari Ailus
