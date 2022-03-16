Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23F338F8
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647449522; x=1678985522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M6xWvkasIs+4Huuwh1wbLinzgQqked41NLVqaR8etdQ=;
  b=WqdHC6+IZo0bW+qlxs3j8rxcI9HapZid24R6z2nLa49doQA8yHWa5doK
   hnyb3M2jFB7rA8s9PFCCzMcJGh30VoDcFOZAcoU1Ccen9gFNgbwwM9D1C
   zlvGgi1rGIrdrEwDlM4GuowC1rRo99VTS7pHm7hQrQpIaJJl7YG0Y8jEl
   2oL2Dodry7TbDqaI573A/w89NvvfYBu3lFiH1vm/7HMAkzeBX/bk9Mhos
   dWQw+paMGVGwXYkUTTIQm0QwGBlKQlEdK591Z3zoj8XpnrPx0Zo25cRLp
   bO+FoMJF6pC3p1sphIqBOTvFDTEZLcMGSEEqAi3nq5Yb7z8P1cV3mksUQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256850413"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="256850413"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 09:52:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="635058087"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 09:52:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nUWro-0010gf-UM;
	Wed, 16 Mar 2022 18:51:20 +0200
Date: Wed, 16 Mar 2022 18:51:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence
 values in fbtft_init_display()
Message-ID: <YjIViC4U3ZwfiXlU@smile.fi.intel.com>
References: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
 <Yi97SaQdudVfKV9W@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yi97SaQdudVfKV9W@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 14, 2022 at 06:28:41PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 04, 2022 at 09:34:14PM +0200, Andy Shevchenko wrote:

...

> Any reason you didn't test build this?

My test build doesn't include the WERROR for this driver, so I missed the
warning. Sorry for that. Now fixed.

> drivers/staging/fbtft/fbtft-core.c: In function ‘fbtft_init_display’:
> drivers/staging/fbtft/fbtft-core.c:1038:48: error: passing argument 3 of ‘fbtft_dbg_hex’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>  1038 |                                           s16, &par->init_sequence[i + 1], j,
>       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/fbtft/fbtft.h:441:50: note: in definition of macro ‘fbtft_par_dbg_hex’
>   441 |                 fbtft_dbg_hex(dev, sizeof(type), buf,\
>       |                                                  ^~~
> drivers/staging/fbtft/fbtft-core.c:52:26: note: expected ‘void *’ but argument is of type ‘const s16 *’ {aka ‘const short int *’}
>    52 |                    void *buf, size_t len, const char *fmt, ...)
>       |                    ~~~~~~^~~
>   LD [M]  drivers/staging/gdm724x/gdmulte.o
> cc1: all warnings being treated as errors

-- 
With Best Regards,
Andy Shevchenko


