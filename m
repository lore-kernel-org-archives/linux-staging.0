Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640568479
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 18:13:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390610856"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="390610856"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655112859"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="655112859"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 10:13:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK1Jv-00Drqb-2l;
	Mon, 23 Jan 2023 20:13:27 +0200
Date: Mon, 23 Jan 2023 20:13:27 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 29/57] media: atomisp: ov2680: Use the new
 ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y87ORy9ELdZSiMRf@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-30-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-30-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:37PM +0100, Hans de Goede wrote:
> Use the new ovxxxx_16bit_addr_reg_helpers.h instead of duplicating
> the ovxxxx sensor I2C register access helpers found in many different
> sensor drivers.

...

> -	ret = ov2680_write_reg(client, 1,
> -			       OV2680_GROUP_ACCESS, 0x00);
> +	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0x00);
>  	if (ret) {
>  		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
>  			__func__, OV2680_GROUP_ACCESS);

Wouldn't this be a dup message without any additional value?

Same to many other places.

-- 
With Best Regards,
Andy Shevchenko


