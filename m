Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E388483
	for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 20:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676060294; x=1707596294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KbKJqm7orm9Pu4lwi4Vn8dxJck8nZzTbye31rXcdld0=;
  b=VQfTr0oCkMsVDxuuqXESProkfAt29SlaJXq+v3BwydBqja+BlROAjU7/
   sluTXLzdbIkxUf32PoMrhmw5Hd3Slv0rHooxiK3mmCuYrWRUjeE3kqcIo
   ZdZrU56LfKu3TvcTSKxhoyMVpqipf5SBsz/D65a0sD9rOpLWDHb15isnb
   u6/epB/aCKyR5+wAkh0g/hF+L+9toeXojKHVpog0qjiUkgymUNlqC2uFH
   mN2VhHUulzKs+ARmSfDQDN7ge9DN+8q7Zg8SCJGF4zruS8pqXE7boi78R
   hmB8INwh77kY9wA7nOOxmWk9nJdeapOtJn73Y6VPrBOqEfLDkfVb3AnJA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310148106"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="310148106"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 12:18:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="645739974"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="645739974"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 12:18:09 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AEFCC1218A3;
	Fri, 10 Feb 2023 22:18:06 +0200 (EET)
Date: Fri, 10 Feb 2023 22:18:06 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+amfuCNZG8mbYXZ@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>
 <Y+Zl4UfRN6sgcaf4@smile.fi.intel.com>
 <Y+ZzL5gWUg79wDX+@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+ZzL5gWUg79wDX+@pendragon.ideasonboard.com>

Hi Laurent, Andy,

On Fri, Feb 10, 2023 at 06:39:11PM +0200, Laurent Pinchart wrote:
> On Fri, Feb 10, 2023 at 05:42:25PM +0200, Andy Shevchenko wrote:
> > On Fri, Feb 10, 2023 at 02:26:31PM +0200, Sakari Ailus wrote:
> > > On Fri, Feb 10, 2023 at 01:45:10PM +0200, Laurent Pinchart wrote:
> > > > Regarding the width-specific versions of the helpers, I really think
> > > > encoding the size in the register macros is the best option. It makes
> > > > life easier for driver authors (only one function to call, no need to
> > > > think about the register width to pick the appropriate function in each
> > > > call) and reviewers (same reason), without any drawback in my opinion.
> > > 
> > > As I noted previously, this works well for drivers that need to access
> > > registers with multiple widths, which indeed applies to the vast majority
> > > of camera sensor drivers, but not to e.g. flash or lens VCM drivers. Fixed
> > > width registers are better served with a width-specific function. But these
> > > can be always added later on.
> > 
> > Again, we can extend regmap to have something like
> > 
> > 	int (*reg_width)(regmap *, offset)
> > 
> > callback added that will tell the regmap bus underneath what size to use.
> > 
> > In the driver one will define the respective method to return these widths.
> 
> I don't think that's worth it, it would make drivers quite complex
> compared to encoding the register width in the register address macros.
> We're dealing with devices that have hundreds of registers of various
> widths interleaved, a big switch/case for every write isn't great.

I'd really prefer the register width information kept as close as possible
to the register address, and most probably the best way is to be part of
the same macro.

-- 
Kind regards,

Sakari Ailus
