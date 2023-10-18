Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8C663BD;
	Wed, 18 Oct 2023 03:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjtOKsvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697600300; x=1729136300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L2XI+NRTEILxjtpiFc792xwJDDhVanL35F3Cd6yts6U=;
  b=jjtOKsvkHDtWn1ynjq/14tfElth4Lyn96H6yaahtdgAyrrGGjZwrtYPj
   dSRUT+nJaP4QwJrtaS2qTqL8qtBoeT2V+aSZr/yXOL24Cs7NbnU+YwZlY
   Tpjw7OvcwUCog0L4WtsH9ox6EgcYdHmsuC5RI6YHXFVkEiKqdCDzUAcVv
   66+iVjeCQg0XJ/tOovqnvo3/HhsRp/aILkhI+HVa5bV+CDFM6jgVbUvXF
   HSh4+wkvj0DMawEXpqrP/6J+36S+GJSm2iYmn2xtd4rEBJvYhkZzuJ+Bb
   fncRycnZF0wQx5dxyE/cO1RhWCtjkLudj11/4dt0yVHDGVPtIZrzhQ08K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388792709"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="388792709"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 20:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="4175430"
Received: from kchua1-mobl1.gar.corp.intel.com (HELO intel.com) ([10.215.248.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 20:37:09 -0700
Date: Wed, 18 Oct 2023 05:38:07 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: kenechukwu maduechesi <maduechesik@gmail.com>
Cc: outreachy@lists.linux.dev, shreeya.patel23498@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace delay function.
Message-ID: <ZS9THxlJhHfv4gU9@ashyti-mobl2.lan>
References: <20231018004300.GA3189@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018004300.GA3189@ubuntu>

Hi Kenechukwu,

On Tue, Oct 17, 2023 at 06:03:05PM -0700, kenechukwu maduechesi wrote:
> Replace udelay() with usleep_range() for more precise delay handling.

The reason is not the precise handling, quite the opposite.

> Reported by checkpatch:
> 
> CHECK: usleep_range is preferred over udelay

Can you tell why?[*]

> Signed-off-by: kenechukwu maduechesi <maduechesik@gmail.com>
> ---
>  drivers/staging/rts5208/sd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
> index 74c4f476b3a4..059f99b0a727 100644
> --- a/drivers/staging/rts5208/sd.c
> +++ b/drivers/staging/rts5208/sd.c
> @@ -865,7 +865,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
>  						     PHASE_CHANGE);
>  			if (retval)
>  				return retval;
> -			udelay(50);
> +			usleep_range(50);

What is the range you will be sleeping, now?

Andi

[*] Documentation/timers/timers-howto.rst
