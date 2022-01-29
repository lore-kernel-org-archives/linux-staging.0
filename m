Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE12CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643474168; x=1675010168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NeN+U8iKMJdDOcMiYQHwhsKC4blyvRV8SKBOfqOcU+4=;
  b=H6bllxLAWP0aAQmoz+RDm1XwPzXlUpCfuvEqc6QVX9bzHxAGik4mV5ta
   /c5usLHrco9ghEs/ZMno8zSKPufkX2ElOLpABAHjMJcsEloN/2KbYMO81
   SQH00yhSC2tU3wQ591XJWxuvdHowPIvKJNMYAvkC1vsQDtXgP8QPCoTuB
   gsx4n7h1FgHifahaaTwDjabnmw7LrU7Pi4oZXZ2B+woIEgH1WHo5cPsaB
   HTbM0l8bZ5wKcb3gvXrCTk7YyjZfkxJHm7juZ+H/Bo6RBRASW6CBG8lLB
   6yvfiHAzB/TbknDs9sE3zWmYB1HmiYO6J1GoN5BtsCvb5hX9RONqJYje0
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="246120998"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="246120998"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 08:36:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="496431763"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 08:36:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nDqgm-00FxsL-CB;
	Sat, 29 Jan 2022 18:35:00 +0200
Date: Sat, 29 Jan 2022 18:35:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tsuchiya Yuto <kitakar@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Use BIT macro instead of left
 shifting
Message-ID: <YfVstOJ38OTtd43n@smile.fi.intel.com>
References: <20220129113821.324180-1-mosescb.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129113821.324180-1-mosescb.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Jan 29, 2022 at 12:38:04PM +0100, Moses Christopher Bollavarapu wrote:

It's a bit too many people in Cc list (I dropped more than a half in this reply).
I would suggest to use my script [1] or look into it for a hint how to reduce it.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

> There is a BIT(nr) macro available in Linux Kernel,
> which does the same thing.

In some cases it might fix a (theoretical) UB issue.

> Example: BIT(7) = (1UL << 7)

...

> +		s_config->source.tpg.x_mask = BIT(4) - 1;

> +		s_config->source.tpg.y_mask = BIT(4) - 1;

> +		s_config->source.tpg.xy_mask = BIT(8) - 1;

For masks you may use GENMASK().

...

> -		irq = irq & 1 << INTR_IIR;
> +		irq = irq & BIT(INTR_IIR);

It may be:

	irq &= BIT(...);

...

> -	irq = irq & 1 << INTR_IIR;
> +	irq = irq & BIT(INTR_IIR);

Ditto.

...

> -		virt += (1 << PAGE_SHIFT);
> +		virt += BIT(PAGE_SHIFT);

This is weird. Shouldn't be as simple as

	virt += PAGE_SIZE;

?

...

>  enum ia_css_sp_sleep_mode {
>  	SP_DISABLE_SLEEP_MODE = 0,
> -	SP_SLEEP_AFTER_FRAME = 1 << 0,
> -	SP_SLEEP_AFTER_IRQ = 1 << 1
> +	SP_SLEEP_AFTER_FRAME  = BIT(0),

> +	SP_SLEEP_AFTER_IRQ    = BIT(1)

While at it, add a comma here.

>  };

...

> +	IA_CSS_DEBUG_DUMP_ALL = BIT(14)  /** Dump all device parameters */

Ditto.

...

On top of this don't forget to add

	#include <linux/bits.h>

to the modified header files.

-- 
With Best Regards,
Andy Shevchenko


