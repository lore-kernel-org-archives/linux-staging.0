Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFF829B2
	for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 15:35:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="314089900"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="314089900"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="731743405"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="731743405"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 10 Feb 2023 07:35:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pQVRH-0056b7-0h;
	Fri, 10 Feb 2023 17:35:51 +0200
Date: Fri, 10 Feb 2023 17:35:50 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+ZkVlzV7qY0K4gS@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain>
 <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
 <Y+YlELz9C61HQE0x@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+YlELz9C61HQE0x@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 10, 2023 at 01:05:52PM +0200, Laurent Pinchart wrote:
> On Fri, Feb 10, 2023 at 12:53:43PM +0200, Andy Shevchenko wrote:
> > On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
> > > On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
> > > > On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
> > > > > On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:

...

> > > > > I took a look at this some time ago, too, and current regmap API is a poor
> > > > > fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
> > > > > on top of regmap is a better approach indeed.
> > > > 
> > > > I'm confused, is regmap a poor fit, or a better approach ?
> > > 
> > > I'm proposing having something on top of regmap, but not changing regmap
> > > itself.
> > 
> > I don't understand why we can't change regmap? regmap has a facility called
> > regmap bus which we can provide specifically for these types of devices. What's
> > wrong to see it done?
> 
> How would that work ?

If I'm not mistaken, you may introduce something like regmal CCI and then

	regmap_init_cci();


	regmap_read()/regmap_write()
	regmap_update_bits()
	regmap_bulk_*()

at your service without changing a bit in the drivers (they will use plain
regmap APIs instead of custom ones).

-- 
With Best Regards,
Andy Shevchenko


