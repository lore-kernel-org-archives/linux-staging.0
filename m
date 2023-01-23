Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E17C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 18:39:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305778291"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="305778291"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:39:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750540285"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="750540285"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 10:39:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK1j0-00DsQR-1m;
	Mon, 23 Jan 2023 20:39:22 +0200
Date: Mon, 23 Jan 2023 20:39:22 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 52/57] media: atomisp: ov2722: Fix GPIO1 polarity
Message-ID: <Y87UWmTmxm9xX0c3@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-53-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-53-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:52:00PM +0100, Hans de Goede wrote:
> The comment claims the PWDN pin is active when pulled down in other words,
> it is /power-down so it needs to be driven high to get the sensor
> powered-up (not powered down) and flag is 1 when powering-up the sensor
> so the ! is wrong, drop it.
> 
> This also matches with the schematics which I have which shows GPIO1 also
> enables a 3.3v line to the sensor-module which controls the privacy-LED
> and indeed before this patch the privacy LED was inverted from what it
> should be (and the sensor did not work).

It's unclear if this is logical state or raw one?
Maybe this the root cause of the initial confusion?


-- 
With Best Regards,
Andy Shevchenko


