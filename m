Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712088479
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 18:15:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328197733"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="328197733"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725166245"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="725166245"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 10:15:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK1Ll-00Drt9-0g;
	Mon, 23 Jan 2023 20:15:21 +0200
Date: Mon, 23 Jan 2023 20:15:20 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y87OuHf8iZwUY9FK@smile.fi.intel.com>
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
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

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

While reviewing the following patch, I realize that we actually don't need
these long names.

int ov_read_reg(struct ovxxxx_dev *sensor, u16 reg, unsigned int len, u32 *val);

int ov_write_reg(struct ovxxxx_dev *sensor, u16 reg, unsigned int len, u32 val);

will work fine and fit one line (80 limit).

-- 
With Best Regards,
Andy Shevchenko


