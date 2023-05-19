Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBBA7F3
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 07:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684481527; x=1716017527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MxfzHP1Or4QpjMycJ2Hc0O1YWboJ3/Dhj1hz8mps+IA=;
  b=Yd2IKsLuhqMFO/QlTjQv2h7MDMm0MYreuci4EuTi2qe6ltrgf2LPNmY+
   7s0PUiT720b7zCrgGadlGAkFoh04Z6C0YG4jnk10N65Ae0j9bEhMVGOBq
   hOvwoctu/V5A3nK7BazPhhROXCY3enqRyP1PwCPwNdnM4Wud/eDJTTTew
   XG9VX8iKA/Dqn+aVROrRgO2yAYM/50iR5VPHO+tC2Y8iM3buRlxVDb53U
   TOSMSiGnO2OZNiyuozRMjGcGoWSJYtyN4gRzduDh/5C6EkIcivbL+c9TQ
   oEOqoK1vzL1eKE47rKbWswbcq6BkJMO28OjuFrDbak9m9vHlgqM0KxRW5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="332669039"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="332669039"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 00:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="814627422"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="814627422"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 00:32:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B23D3120279;
	Fri, 19 May 2023 10:31:59 +0300 (EEST)
Date: Fri, 19 May 2023 07:31:59 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios()
 helper function
Message-ID: <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518153214.194976-2-hdegoede@redhat.com>

Hi Hans,

On Thu, May 18, 2023 at 05:32:06PM +0200, Hans de Goede wrote:
> On x86/ACPI platforms the GPIO resources do not provide information
> about which GPIO resource maps to which connection-id. So e.g.
> gpiod_get(devg, "reset") does not work.
> 
> On devices with an Intel IPU3 or newer ISP there is a special ACPI
> INT3472 device describing the GPIOs and instantiating of the i2c_client
> for a sensor is deferred until the INT3472 driver has been bound based
> on the sensor ACPI device having a _DEP on the INT3472 ACPI device.
> 
> This allows the INT3472 driver to add the necessary GPIO lookups
> without needing any special ACPI handling in the sensor driver.
> 
> Unfortunately this does not work on devices with an atomisp2 ISP,
> there the _DSM describing the GPIOs is part of the sensor ACPI device
> itself, rather then being part of a separate ACPI device.
> 
> IOW there is no separate firmware-node to which we can bind to register
> the GPIO lookups (and also no way to defer creating the sensor i2c_client).
> 
> This unfortunately means that all sensor drivers which may be used on
> BYT or CHT hw need some code to deal with ACPI integration.
> 
> This patch adds a new v4l2_acpi_parse_sensor_gpios() helper function
> for this, which does all the necessary work. This minimizes the
> (unavoidable) change to sensor drivers for ACPI integration to just
> adding a single line calling this void function to probe().

I'd rather avoid making changes to sensor drivers due to this hack. At the
very least it must be labelled so: this has no more to do with ACPI
standard than that this information happens to be located in an ACPI table.

Although if the number of those drivers would be small, this could be just
undesirable but still somehow acceptable. And I wouldn't expect new sensors
to be paired with the IPU2 anymore. How many drivers there would be
roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.

Isn't it possible to create a device for this purpose and use software
nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
have to initialise this via other route than driver probe.

-- 
Kind regards,

Sakari Ailus
