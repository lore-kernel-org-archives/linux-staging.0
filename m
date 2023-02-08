Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400B42560
	for <linux-staging@lists.linux.dev>; Wed,  8 Feb 2023 11:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675855884; x=1707391884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pOSyM70CQLZ5WVuxg2j8VLFtjvsopnsTbJ2uTePKOhE=;
  b=MnNkTVMj67YmzQdJiqLkDc3xTZREy8AK3/vknec6Jy7tuhi9yn+L/xNx
   MTJEFwCoGNOgyLnRVaUZGYCVOi8CflFCeSW/D/NR6Vl86tL4Qhn2BgUdS
   UlJu6GcVuOaAuXe3HVWe2e+Eqkw46N18nioCq1E9mOxxYNuNVKfnP9bar
   9cOxbUVjR+vG7GkZvErRzIYlaa2BNZlXeCFeig+2se1JiEX3CyWRygb5Z
   q9YqJ3Bu9B/GJzNMYNXIw3JQ3DnUqA3X+YhQaDVPKExMLC9XQKMM5M2fH
   FEoN/2GNLPMMTUhDbnRrdUSFvuZ6IUIyDqQBLTsqomzH6vBKRQ/5dN5xf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313413331"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="313413331"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 03:31:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="644830489"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="644830489"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 03:31:20 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 363DB120D20;
	Wed,  8 Feb 2023 13:31:17 +0200 (EET)
Date: Wed, 8 Feb 2023 13:31:17 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+OIBefssxY3bbmK@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-29-hdegoede@redhat.com>

Hi Hans,

On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> 
> as well as various "atomisp" sensor drivers in drivers/staging, *all*
> use register access helpers with the following function prototypes:
> 
> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
>                     unsigned int len, u32 *val);
> 
> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
>                      unsigned int len, u32 val);
> 
> To read/write registers on Omnivision OVxxxx image sensors wich expect
> a 16 bit register address in big-endian format and which have 1-3 byte
> wide registers, in big-endian format (for the higher width registers).
> 
> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> versions of these register access helpers, so that this code duplication
> can be removed.

Ideally we'd have helpers for CCI, of which this is a subset. And on top of
regmap. I don't object adding these either though.

-- 
Kind regards,

Sakari Ailus
