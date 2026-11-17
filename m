Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909764;
	b=2LrSBbmHDwnVi+4oZefok++Ob9vRvQGYJSU2BH4cv+20fmTpbyAOC0mjFR3oyZ4gMO8G
	 RZ03HSH/oKwU6vhQ2+O+pI35kHpnJRo7rIq/rxme50OJBxy05dEMuIxs2mkbKDp8szRMY
	 6zGxQwJKtusBEobdUdM+vmIO3yh7Xb7WqvIeqQy7c64NXMthyyfKMAhhICuoxoMcIm5b6
	 nAt9GySSoNgUJtTTKj2NZxGDqaOc5rFKfDYWB5vX4p2VT8wA1b4mQ6vANEk3KNjsS6ciu
	 rHu/NHoY/IvrNljKa7hPLXcVudP0N2RWRtBt0WNg4iOKehboH6eZmgheocbh0TihNIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909764;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=voo/pfFj7IZzyUKj8TLUEF9FWCoSw51aP8BAo7SmMdY=;
	b=b7abuXENbcLQnHSEqWrIVwaUpXL9GP3cn0+Z5hU4dZLYxCjaGn0jrTb6AbTNEIM2exE0
	 5ChzmFnU07TkDl2I9Cp9poaNN0nNvILdczGNZkwskmsN27u+eRpOJD3HU3jlR9V/zLAPQ
	 Z7ZyH3aC7QnsC9vyb+APP3yC2Ya4mY9Ozal+8qFSgjr1hBpo5+wghtmMuEI/pV6leQ2MR
	 HyU2B+/3xOmsI7k9ynn/2Q+w9yXMxtwkJa67vgcY0rRKPnNvTpMT9KNJmHzOcrmIOHsh6
	 OItpWuoS48xqpSou3t3zn3R9wQ2YlCaPTEHb1UpEVZRLfdeXlJ4hB+NGWdXWSSDmVkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XoZeYjTn;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD70606A323
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 10:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD70606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XoZeYjTn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794909764; x=1826445764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dldL33c+0pURQn9gbH1fWTdSXkLGwOfDeiQ+Njft9mk=;
  b=XoZeYjTn/6Kni225PUxIEPDUaulwGIQeD7di68rLM3UQWQmDdVWFjpCW
   a/v5vxnEHXMfKQEczgVfRpdebZPzsLZcTk6sLnvSjmEOZV54uyvN486J5
   1GK4jH96P3HaYDoqrJ3M49DN9r3z/JUjSsGveo+eKV9rUa+KHRh5MLZKB
   vbvcg6yPFQF4ns3JAX53trNcAd0jDsk5ilUQnYmLFrzq5pkrQSZizf7Bq
   QJaNSwone+RiuCYoY0y5DLjKArroooa0CJbwj7TXPTTuVrw9mDW+vC39D
   3+heZceNHGza4zwmk4rA8d5CPoVM2m/aF8rEORY+2aI3fGeJdUdb2GIAb
   g==;
X-CSE-ConnectionGUID: Tz5VuweFTna+W+2lxQWKuQ==
X-CSE-MsgGUID: AYhOU1SASOmZEqch8e+XtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3688170"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3688170"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:02:44 -0800
X-CSE-ConnectionGUID: 9UZKk/F6QliTC4oWlTHFCw==
X-CSE-MsgGUID: LQKydkQkRIa9+D56Wu0Rqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9852302"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:02:40 -0800
Date: Tue, 17 Nov 2026 12:02:38 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Don't cycle the PMC clock
 if its rate is correct
Message-ID: <avwmPmzohY3BCwrI@ashevche-desk.local>
References: <20261116173307.14169-1-volodymyrchapman@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116173307.14169-1-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 05:33:06PM +0000, Volodymyr Chapman wrote:
> atomisp_csi2_set_pmc_clk_freq() enables and disables the sensor's PMC
> platform clock to be able to change its rate to 19.2 MHz. ACPI however
> also controls this clock, through the CLKx power resource in the sensor's
> _PR0, and caches the state of that power resource. When ACPI has already
> turned the clock on, the clk_disable_unprepare() turns it off underneath
> ACPI. ACPI keeps considering the clock to be on, so a following power-on
> of the sensor does not run the clock's _ON method and the sensor does
> not respond on I2C.
> 
> On a Lenovo ThinkPad 10 (20C3) with an IMX175 rear sensor this makes the
> sensor's probe fail intermittently, depending on probe ordering:
> 
>   atomisp-isp2 0000:00:03.0: Found supported sensor INTCF1A:00
>   imx175 i2c-INTCF1A:00: Error reading reg 0x0000: -121
>   imx175 i2c-INTCF1A:00: probe with driver imx175 failed with error -121
> 
> The effect of the clock cycle was also reproduced directly: with the
> sensor powered through ACPI, a single clk_prepare_enable() +
> clk_disable_unprepare() of pmc_plt_clk_0 makes it stop responding.
> 
> Only cycle the clock to change its rate when it does not already run at
> 19.2 MHz. The DSDT's CLKx._ON methods on this machine already select the
> 19.2 MHz PLL.
> 
> As a side effect, a clock which the firmware left enabled at 19.2 MHz is
> no longer turned off by atomisp_csi2_set_pmc_clk_freq(). It is turned off
> when ACPI powers down the sensor, e.g. when the sensor driver
> runtime-suspends it.

Besides below paragraphs (that I removed) needs to be in the comment block and
not in the commit message, please coordinate with other folk(s) who are doing
the same

https://lore.kernel.org/b4-sent/20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com/

-- 
With Best Regards,
Andy Shevchenko


