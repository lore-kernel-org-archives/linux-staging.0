Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD46D0E
	for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 09:25:08 +0000 (UTC)
IronPort-SDR: SsIixrNOhoe96v9M7SdKPJ4PXpFwGUtDcR3G1MkvVe2shtPP8Beg803J2hAgxvinLRHMFpQ5cl
 0OuZYk1Otq8w==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="202930364"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="202930364"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:25:08 -0700
IronPort-SDR: fvRycI8A6hhTpE4Q/druGLrPzPSqqxIsuoI5iDzyefS3ZUUd7ausiZQMCwjh8+myopl3lO/VoX
 5JmkwZ33tLRQ==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="415238430"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:25:05 -0700
Received: from andy by smile with local (Exim 4.94)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1lmYjm-00FHJC-Lu; Fri, 28 May 2021 12:25:02 +0300
Date: Fri, 28 May 2021 12:25:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/6] i2c: acpi: Export i2c_acpi_find_client_by_adev()
 for users
Message-ID: <YLC27sntR7smPMfd@smile.fi.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
 <YLAAedlB6UaJQh0X@kunai>
 <YLC2k/5hqNNBnN6e@smile.fi.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLC2k/5hqNNBnN6e@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 28, 2021 at 12:23:31PM +0300, Andy Shevchenko wrote:
> On Thu, May 27, 2021 at 10:26:33PM +0200, Wolfram Sang wrote:
> > On Wed, May 26, 2021 at 03:43:17PM +0300, Andy Shevchenko wrote:
> > > There is at least one user that will gain from the
> > > i2c_acpi_find_client_by_adev() being exported.
> > 
> > No objections per se. But as the user is in staging, I want to ask if
> > the use there is really a solution we would also accept outside of
> > staging? Or is it a hack?
> 
> The similar OF API is exported for users, although amount of users and their
> locations are different. The AtomISP driver is not in the best shape, I agree,
> but for now any possible steps to make it better would be good steps in my
> opinion. Later we may see if we can do this piece of code differently (IIRC
> current way is probably the best taking into account legacy platforms support).

Btw, we may move all current exports from I2C ACPI to its own namespace, then
we won't really care if it'e exported or not, only explicit consumers will use
it.

-- 
With Best Regards,
Andy Shevchenko


