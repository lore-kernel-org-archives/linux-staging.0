Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD407C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 18:48:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412346896"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="412346896"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:48:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="611722464"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="611722464"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 23 Jan 2023 10:48:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK1rk-00Dsd0-2O;
	Mon, 23 Jan 2023 20:48:24 +0200
Date: Mon, 23 Jan 2023 20:48:24 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 34/57] media: atomisp: ov2680: Fix window settings and
 enable window for all resolutions
Message-ID: <Y87WePgM9k6jUpd0@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-35-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-35-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:42PM +0100, Hans de Goede wrote:
> By default the ov2680 automatically sets the window to match the outputsize
> and automatically adjusts it to keep the bayer pattern stable when enabling
> hflip/vflip.
> 
> This does not work for the 1616x1216 mode because there is no room to
> adjust the window there. To make flipping work in the 1616 wide modes the
> register lists for those modes set bit 0 of 0x5708 (manual_win_en) to 1 and
> ov2680_set_bayer_order() updates the bayer-order on the pad to match.
> 
> But ov2680_set_bayer_order() is always called, so when enabling flipping
> on modes with a width of less then 1616 now results in the wrong bayer
> order being reported on the pad since the sensor is auto-adjusting
> the window in this case.
> 
> Specify the correct (== output-size) window-size in all resolutions
> register-list and always set the manual_win_en bit, so that the bayer order
> is changed on hflip/vflip enable on all resolutions.

...

> +	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11

While at it, perhaps replace // with proper /* comment  */?
Same to the rest of the similar cases.

-- 
With Best Regards,
Andy Shevchenko


