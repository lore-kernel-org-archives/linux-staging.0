Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE37E7
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 10:37:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324942477"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="324942477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692552649"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="692552649"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 02:37:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKGgT-00EIIN-0B;
	Tue, 24 Jan 2023 12:37:45 +0200
Date: Tue, 24 Jan 2023 12:37:44 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 35/57] media: atomisp: ov2680: Make setting the modes
 algorithm based
Message-ID: <Y8+0+OQaaTZXNek+@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-36-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-36-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:43PM +0100, Hans de Goede wrote:
> Instead of using a long fixed register settings list for each resolution,
> calculate the register settings based on the requested width + height.
> 
> This will allow future enhancements like adding hblank and vblank controls
> and adding selection support.

...

> +	ret = ovxxxx_write_reg16(client, OV2680_HORIZONTAL_START_H, sensor->mode.h_start);
> +	if (ret)
> +		return ret;
> +
> +	ret = ovxxxx_write_reg16(client, OV2680_VERTICAL_START_H, sensor->mode.v_start);
> +	if (ret)
> +		return ret;

Wondering if those registers are always being accessed as 16-bit. In such case
I would consider to drop _L definitions along with _H suffixes.

-- 
With Best Regards,
Andy Shevchenko


