Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A981D437E
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646734753; x=1678270753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xF+r8ZNHE9MnTYvem0p9ys5ZewguArXpAyRAIBUOibg=;
  b=MhmzdsjCCIe8M7rPF3qbE4aJ5+ksNz+Unr3jdMMYPQbWCd14qRYBzPeT
   sgPUmVg2hQNoWkfoxqgpn+il99+WBbA1QDw8qhdPkbv8JI6z+CO3/e5Fy
   Jt7HMI771L8TU67zXmDm6P/f35LMMDDUGyLlQFHYkj9GayeSwBqeO7+dI
   kk5S4a9VHmSQFUZ05RfOd0qadz+4LqyBdmLqEahllyPUjfiqrYFN4L199
   ieAjeiPF/i/zZHhkyqIXblhFegeoZ/9YXVey+I+fUFa43M3ilJ4kFU009
   eWtA1OdEppQTMBpaEdIV3MCLr21AaPDO3zIC/vyZ6mSRsCfstXnxlzt29
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="253478095"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="253478095"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 02:19:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="643608952"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 02:19:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nRWvB-00DIEg-BO;
	Tue, 08 Mar 2022 12:18:25 +0200
Date: Tue, 8 Mar 2022 12:18:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence
 values in fbtft_init_display()
Message-ID: <Yictcf0BCvveVT+V@smile.fi.intel.com>
References: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Helge

Maybe you can pick this up?

On Fri, Mar 04, 2022 at 09:34:14PM +0200, Andy Shevchenko wrote:
> In the fbtft_init_display() the init sequence is printed for
> the debug purposes. Unfortunately the current code doesn't take
> into account that values in the buffer are of the s16 type.
> 
> Consider that and replace the printing code with fbtft_par_dbg_hex()
> call.
> 
> Fixes: b888897014a9 ("staging/fbtft: Remove all strcpy() uses")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 4a35347b3020..b28a059ad3b4 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -1035,10 +1035,9 @@ int fbtft_init_display(struct fbtft_par *par)
>  			for (j = 0; par->init_sequence[i + 1 + j] >= 0; j++)
>  				;
>  
> -			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
> -				      "init: write(0x%02X) %*ph\n",
> -				      par->init_sequence[i], j,
> -				      &par->init_sequence[i + 1]);
> +			fbtft_par_dbg_hex(DEBUG_INIT_DISPLAY, par, par->info->device,
> +					  s16, &par->init_sequence[i + 1], j,
> +					  "init: write(0x%02X)", par->init_sequence[i]);
>  
>  			/* Write */
>  			j = 0;
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


