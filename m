Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ADD4C60
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 12:00:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="309577401"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="309577401"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="707288213"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="707288213"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2022 04:00:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ouY8v-00C9bt-0x;
	Mon, 14 Nov 2022 14:00:49 +0200
Date: Mon, 14 Nov 2022 14:00:49 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 09/17] media: atomisp: Add ia_css_frame_get_info()
 helper
Message-ID: <Y3It8afev5+8vjpo@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-10-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-10-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 20, 2022 at 09:55:25PM +0200, Hans de Goede wrote:
> Several places rely on the [frame_]info member being the first member of
> struct ia_css_frame, so that &frame->info will yield NULL when frame is
> NULL (some places already explicitly check for a NULL frame pointer but
> not nearly all).
> 
> For videobuf2 support the vb2_v4l2_buffer struct needs to be embedded
> in the frame struct and it needs to be the first member. Breaking the
> assumption that &frame->info will yield NULL when frame is NULL.
> 
> Add a ia_css_frame_get_info() helper to return either the ia_css_frame_info
> struct embedded in the frame, or NULL when the frame pointer is NULL and
> use this in places where a ia_css_frame_info ptr or NULL is expected.
> 
> To make sure that we catch all uses of the info field this patch also
> renames the info field to frame_info.
> 
> This is a preparation patch for converting the driver to videobuf2.

...

> +	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
>  	const unsigned int ddr_bits_per_element = sizeof(short) * 8;

Side note: BITS_PER_TYPE().

...

> +	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
>  	const unsigned int ddr_bits_per_element = sizeof(short) * 8;

Ditto.

>  	const unsigned int ddr_elems_per_word = ceil_div(HIVE_ISP_DDR_WORD_BITS,
>  						ddr_bits_per_element);

-- 
With Best Regards,
Andy Shevchenko


