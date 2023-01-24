Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964910F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 11:01:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324945682"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="324945682"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 03:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="786040664"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="786040664"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2023 03:01:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKH3C-00EIr1-2e;
	Tue, 24 Jan 2023 13:01:14 +0200
Date: Tue, 24 Jan 2023 13:01:14 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/57] media: atomisp: Big power-management changes +
 lots of fixes
Message-ID: <Y8+6euqoTP0GtlMN@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:08PM +0100, Hans de Goede wrote:
> Hi All,
> 
> Here is another set of patches resulting from my continued work
> on cleaning up / improving the atomisp driver.
> 
> The main changes here are power-management related, divided
> into 2 sets:
> 
> 1. Move the pm of the core atomisp device to its own custom PM
>    domain. We turn the ISP on/off through the P-Unit and when
>    off the PCI subsystem resume method complains about the PCI
>    config space not being reachable. Changing to a custom PM
>    domain fixes the logs getting filled with PCI subsys errors
>    on every open of a /dev/video# node
> 
> 2. Except for devices shipped with Android as factory image,
>    all the DSDTs I have seen have proper ACPI pm code for
>    the sensors. So we really should be using ACPI pm for this.
> 
>    This series contains a lot of ov2680 patches, including
>    reworking the controls (so that control changes can be
>    delayed to stream on time instead of directly trying to do
>    i2c writes to the turned off sensor). Basically modernizing
>    the ov2680 driver a lot (there are still some atomisp-isms left).
> 
>    And then finally after all the ov2680 cleanups it moves
>    the ov2680 code over to using runtime-pm + ACPI pm,
>    dropping all the direct PMIC + clk poking done by the
>    atomisp_gmin_platform code.
> 
> Besides that this also contains quite a few other fixes / cleanups
> for things which I encountered during the way and it contains the
> start of making the ov2722 driver work. With the changes present
> in that driver I get a working (but very dark) stream. I expect
> that once I add a proper exposure control this will start working

The non-commented patches were reviewed, but I'm not so familiar with the
details of the functionality of the PM parts there. So I left them for others
to review.

-- 
With Best Regards,
Andy Shevchenko


