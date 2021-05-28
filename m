Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7029CA
	for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 09:34:36 +0000 (UTC)
IronPort-SDR: T0T3vq4G4W6iLaXRqmmfl4UfIbd0n5ecWSVYMAesqeD2Zt0QifkelUnw8HzdQqtMBXt2xWucJf
 tmTu8DJ5YZXg==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="201039091"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="201039091"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:34:32 -0700
IronPort-SDR: uB+8xYzoqucfKoRlgcPZPfMoWDR0sWUKEK/wrZ/nqFlwTj+F6xJJ7fiV6iEKowckLbTzfDkcjQ
 zs+Dt78+3+Dw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="443938483"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:34:29 -0700
Received: from andy by smile with local (Exim 4.94)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1lmYss-00FHPQ-JM; Fri, 28 May 2021 12:34:26 +0300
Date: Fri, 28 May 2021 12:34:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wolfram Sang <wsa@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 1/6] i2c: acpi: Export i2c_acpi_find_client_by_adev()
 for users
Message-ID: <YLC5IstyPFQA6mBp@smile.fi.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
 <YLAAedlB6UaJQh0X@kunai>
 <YLC3HzCUhEYmfckj@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLC3HzCUhEYmfckj@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 28, 2021 at 11:25:51AM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 27, 2021 at 10:26:33PM +0200, Wolfram Sang wrote:
> > On Wed, May 26, 2021 at 03:43:17PM +0300, Andy Shevchenko wrote:
> > > There is at least one user that will gain from the
> > > i2c_acpi_find_client_by_adev() being exported.
> > 
> > No objections per se. But as the user is in staging, I want to ask if
> > the use there is really a solution we would also accept outside of
> > staging? Or is it a hack?
> 
> staging drivers should be self-contained, do not accept code in the core
> kernel that only is used by staging drivers.
> 
> So I would not recommend this be accepted at this point in time.

Fair enough.

> Andy, work to get the driver out of staging first before doing stuff
> like this.

Okay, I'll drop first one and patches related to it in the v2.
It should bring us closer to the mentioned point.

Thanks for clarification!

-- 
With Best Regards,
Andy Shevchenko


