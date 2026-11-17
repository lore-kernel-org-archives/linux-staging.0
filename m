Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910093;
	b=MpLgMJ44FUd3BBzY3OFkf5LaUF19jZf0DXdr5xt5M94Nyxk1llJJhqFe46371ie2R22j
	 QftCCnc2YzUWp4x85zCn+KYxMm7P99knUBjmE8gohnGCbt7ZuC1vGM9TEKFF8zCqJZIlJ
	 hN6b1YQ0SdGVxGUoM+YGXegM2jyFmLX8YoCZ4dgow3x9ItSfDpDZZ7Av2uidG1zFhxwW+
	 uYqCSkkE9XcoPx/jdX/HGQSq0EXdS1V6Pszq1tf9e/KHcG63rcLwgQOA+8Ht6ujfaOpys
	 lHItRYzfzIB1Z7o+ty8XqjGEHQGP6lGjTgc3cDD+52RPrz1fBFdCbEnpaq5QAREYjAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910093;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=n6ajatYmOjWImHBsuzo6XCIkw6RvPsZsqcCHLOf8RlA=;
	b=U8oSSW9wOYISsGC4RAt6u13t+tNv+jpvTKfWRZQws6DcKrH9PyBoNZ/T7DM1E13tHzLD
	 4Cyut/09Jt0TVaNZUZnED/4FY+8226rziiDHD0CDjEC1bRDkxFEhwQyIYAINCiC0bjdNX
	 h1FarQslo4rmIVuyVOndWkKa7UXXS4ZTOA4wdBMpJxCFw9Uly5GmfwmIK6Ce2f7U2X8HJ
	 TvKzS9RrgKI6TA0uiemaQbl4StXO8XMKKpX0uhgNufTt9j5HDkF1cFFT16PB8707HoUYS
	 8KIlqdACYstAuxenKwoq89MDFGvteHWnSc+uxUxOG8u8+MlQUAYDtIwcw1lnbRTfRfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P1+Bdr8O;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C4606A32A
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 10:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36C4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P1+Bdr8O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794910092; x=1826446092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/a4PlKQAky6q8IgEusZzZbEm3n2XPSpsv48cMmoWKC0=;
  b=P1+Bdr8OEBGDC6bi537f9qqKS5TqM3Uj3oJ9ZrUeELcBq5//2wfDeRUR
   K9JV8505vkPV9ZkjCCR3wZG71y6xg7PUnrPaNJXuhLnAr04ZKemzjCR8T
   OwER0ETtppAlawWzC9hJkzGBDkpNoZx+h7UbiZ7jvPbIzs3nRXfCSanRt
   n5pjenmejSYqt1tui33x15Zj4ypNdxXRmFfjCg0K9+GfkeDDTTkSRfiED
   2C6d+ExBidCRu9GRsU+qMQZlPDPCOOON/+jUSkN8vG1TmFAuaoqVNj9hm
   /ZECmbqYu+HV2PTiSAzUbOZPXVz+LLzgT++xO2XDmHTFJrnxxgD1s18Ir
   w==;
X-CSE-ConnectionGUID: sq8y0nq8R52GW6NpmMfBcA==
X-CSE-MsgGUID: FA1k4KNoRUmZmXDN0v+IBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3588949"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3588949"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:08:12 -0800
X-CSE-ConnectionGUID: bHuUCRMcSeyIfI8yIGwuwQ==
X-CSE-MsgGUID: d/3wGVTOTHGSRjiY7cGe8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9696595"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:08:10 -0800
Date: Tue, 17 Nov 2026 12:08:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Add Sony IMX175 sensor driver (Lenovo
 ThinkPad 10 rear camera)
Message-ID: <avwnh1o6rFzayxkj@ashevche-desk.local>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
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
In-Reply-To: <20261116175151.20150-1-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 05:51:48PM +0000, Volodymyr Chapman wrote:
> This series adds support for the Sony IMX175 8 Mpixel raw sensor, the
> rear camera of the Lenovo ThinkPad 10 (20C1/20C3, Bay Trail), using the
> atomisp driver through its v4l2-async csi2-bridge path:
> 
> 1. a new standard sensor driver, drivers/media/i2c/imx175.c;
> 2. the INTCF1A ACPI HID in ipu-bridge;
> 3. a 4-lane sensor config entry for INTCF1A in the atomisp csi2-bridge.
> 
> Notes for testing on this machine:
> 
> - The firmware exposes the ISP in "ACPI mode" by default (subdevice of
>   the IGD), which atomisp does not support. The hidden BIOS setup option
>   "ISP PCI Device Selection" (Setup variable offset 0x235, value 2 =
>   "ISP PCI Device as B0D3F0") must be set for the ISP to appear as PCI
>   device 00:03.0.
> - The IMX175 probe fails intermittently at boot (-EREMOTEIO) without
>   "media: atomisp: csi2-bridge: Don't cycle the PMC clock if its rate is
>   correct", sent separately [1]. With it, the probe succeeded on 10 out
>   of 10 boots in my testing; without it on 8 out of 10.
> - The OV2722 front camera of the same machine needs "media: atomisp:
>   ov2722: Report SGRBG10 consistently as media bus code", also sent
>   separately [2], but is not otherwise related to this series.
> 
> [1] https://lore.kernel.org/linux-media/20261116173307.14169-1-volodymyrchapman@gmail.com/
> [2] https://lore.kernel.org/linux-media/20261116173143.13584-1-volodymyrchapman@gmail.com/

> Not supported: the voice coil motor (the firmware does not name its
> type) and the LM3554 flash.

Why not flash? It's in the kernel provided by drivers/leds/leds-lm355x.c

> No DT binding is added, as the sensor is only known to be used on ACPI
> systems; one can be added when a DT user appears.
> 
> This series was developed with the help of an AI coding assistant
> (Claude), which wrote most of the driver code and commit messages based
> on Intel's register tables, existing sensor drivers and my testing on
> the hardware. I have reviewed the series and tested it as described
> above.

-- 
With Best Regards,
Andy Shevchenko


