Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F873B71CC
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667336; cv=none; b=da4gK/yxEec6dd5RpiQ/ef8hBSJKmAABP1iduRTeWQHes/LYrvZCQnbOq9B9q0GTHKH5Sl33GZXrondi+lZMPYaQaTNgl5M9pkbtaH0ksDe5xaaLDiAj9sYMQ2XjQg3InLWg8R/jqCNisVVdrgaTV67ej4Z43AJRfErXiYAVrSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667336; c=relaxed/simple;
	bh=u+9295C9ecb9Whe1DdoflOUPgK8JQtup6FOqACjo+HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7etkAV23FHaGJ+XZXtVcesZVM7ZQuaNfvu9MIFhzoSKZDmBPc1kV0v8rfp+4MVLAnW5BzmBPJDPyWD/Zys2lJsY1WZqMC31YIgXiHo48IBP+1o6yKfgA3FrnfYEdjpCEqEzOUmkRndPUqPJCnN6KZvW0TNXM5lAH4v37a5KmIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyAWEqsQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyAWEqsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784667335; x=1816203335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u+9295C9ecb9Whe1DdoflOUPgK8JQtup6FOqACjo+HM=;
  b=VyAWEqsQm2r70gqj1ZkSEGJP9prQhAsUpsNcEtYtBk4HHswKQC7sqAIw
   pm2c0xxxHxoiakMkGtjoVaTl7XZ9vV7eRLB812/ealv0naClFqDU9Emma
   q5Y6uKveJ2L2bNmCuNuf+rNpJbwNQJBqwRbP03mNAavXXq4A5UGsKvDmK
   WZFew6ykwlSkjHU7Di9PL+r0Vo2PYssNPj/QOvetD9O2PF0BIkcqpneAl
   pNIvgu32sQI8w+Ni37Cu/Z/l8ov+gvpeuoug2k98NHxFVLdDzeVhYZ5C6
   KilHVssNs/91tmqNO0sdUygpnp6/lY2J3SgzgNmuQFjUWTNSXhD8dwkAl
   g==;
X-CSE-ConnectionGUID: 96ip9n3kQjS5m2KZnZ10kw==
X-CSE-MsgGUID: fzetwdhORFOTF2Sz1izh3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85229536"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85229536"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:55:34 -0700
X-CSE-ConnectionGUID: HsLxCkGzSLasTMnkZ0sobg==
X-CSE-MsgGUID: HfDb9v8HQde4WKuqwE7edw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="261437363"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:55:31 -0700
Date: Tue, 21 Jul 2026 23:55:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 2/2] staging: media: atomisp: Remove dbg_level and
 dbg_func module parameters
Message-ID: <al_cwbjvaAJ1mOC9@ashevche-desk.local>
References: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
 <20260721163533.15888-3-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721163533.15888-3-prajvalchaudhari733@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 21, 2026 at 10:05:32PM +0530, Prajval Chaudhary wrote:
> Remove the 'dbg_level' and 'dbg_func' module parameters to align the
> driver's debug facility with standard Linux kernel APIs (printk/vprintk).
> 
> The internal logic relying on custom debug parameters has been updated
> so that message logging and function tracing no longer depend on exposed
> userspace module parameters.

...

>  /* cross component debug message flag */
> -int dbg_level;
> -module_param(dbg_level, int, 0644);
> -MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");

And what level is the default now? What the difference with the other levels?

>  /* log function switch */
> -int dbg_func = 1;
> -module_param(dbg_func, int, 0644);
> -MODULE_PARM_DESC(dbg_func,
> -		 "log function switch non/printk (default:printk)");

What are the other options?

...

>  /*! \file */
> -

Stray blank line removal.

> +#include <linux/printk.h>

Locate it in the linux/*.h group below. But I agree that at some point this
custom type_support should be moved down.

>  #include <type_support.h>
>  #include <linux/stdarg.h>
>  #include <linux/bits.h>

-- 
With Best Regards,
Andy Shevchenko


