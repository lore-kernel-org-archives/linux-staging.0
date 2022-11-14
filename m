Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036264C63
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 12:20:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="292353187"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="292353187"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="589347245"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="589347245"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 14 Nov 2022 04:20:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ouYRs-00CA2L-0g;
	Mon, 14 Nov 2022 14:20:24 +0200
Date: Mon, 14 Nov 2022 14:20:23 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 17/17] media: atomisp: gc0310: Power on sensor from
 set_fmt() callback
Message-ID: <Y3Iyh4Fqd81sFxlS@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-18-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-18-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 20, 2022 at 09:55:33PM +0200, Hans de Goede wrote:
> Depending on which order userspace makes various v4l2 calls, the sensor
> might still be powered down when set_fmt is called.
> 
> What should really happen here is delay the writing of the mode-related
> registers till streaming is started, but for now use the same quick fix
> as the atomisp_ov2680 code and call power_up() from set_fmt() in
> combination with keeping track of the power-state to avoid doing the
> power-up sequence twice.

...

> +	/* s_power has not been called yet for std v4l2 clients (camorama) */
> +	power_up(sd);

if camorama is fixed, will this become a problem?

-- 
With Best Regards,
Andy Shevchenko


