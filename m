Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB984C64
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 16:01:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334033111"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334033111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 08:00:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="649235173"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="649235173"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 08:00:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pUV4V-00A1jr-1W;
	Tue, 21 Feb 2023 18:00:51 +0200
Date: Tue, 21 Feb 2023 18:00:51 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 04/10] media: atomisp: Remove crop_needs_override from
 atomisp_set_fmt()
Message-ID: <Y/Tqs3hEYzeZ9Om4@smile.fi.intel.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221145906.8113-5-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 21, 2023 at 03:59:00PM +0100, Hans de Goede wrote:
> Remove the crop_needs_override local helper variable from
> atomisp_set_fmt(), as it always is true now.

...

> +			sink_crop.width = DIV_NEAREST_STEP(
> +					      sink_crop.height *
> +					      f->fmt.pix.width,
> +					      f->fmt.pix.height,
> +					      ATOM_ISP_STEP_WIDTH);

Not sure how long this code stays, I would indent it as

			sink_crop.width =
				DIV_NEAREST_STEP(sink_crop.height *
						 f->fmt.pix.width,
						 f->fmt.pix.height,
						 ATOM_ISP_STEP_WIDTH);

...

> +			sink_crop.height = DIV_NEAREST_STEP(
> +					       sink_crop.width *
> +					       f->fmt.pix.height,
> +					       f->fmt.pix.width,
> +					       ATOM_ISP_STEP_HEIGHT);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


