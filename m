Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3693BA4F
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 08:59:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="311139943"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="311139943"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 00:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="591697288"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="591697288"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 21 Nov 2022 00:58:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ox2dV-00FBoW-0E;
	Mon, 21 Nov 2022 10:58:41 +0200
Date: Mon, 21 Nov 2022 10:58:40 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 05/20] media: atomisp: Log an error on failing to alloc
 private-mem
Message-ID: <Y3s9wLqlHojRq8jS@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120224101.746199-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Nov 20, 2022 at 11:40:46PM +0100, Hans de Goede wrote:
> I managed to trigger an atomisp_css_start() error by pushing my test
> system towards an OOM situation, this resulted in the following errors:
> 
> atomisp-isp2 0000:00:03.0: alloc pages err...
> atomisp-isp2 0000:00:03.0: hmm_bo_alloc_pages failed.
> atomisp-isp2 0000:00:03.0: stream[0] start error.
> 
> But it is not entirely clear what the root cause of
> the "alloc pages err..." error is. I suspect the root cause is
> alloc_pages_bulk_array() failing. Add a log message to make
> the root cause more clear if this is hit again.

...

> +		dev_err(atomisp_dev, "alloc_pages_bulk_array() failed\n");

I would put it after calling the below function, but I'm not sure about side
effects (if the below can hang or something else).

>  		free_pages_bulk_array(ret, bo->pages);
>  		return -ENOMEM;

-- 
With Best Regards,
Andy Shevchenko


