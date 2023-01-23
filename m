Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F467C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 18:33:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412343008"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="412343008"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:33:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750539737"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="750539737"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 10:33:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK1dV-00DsIS-1w;
	Mon, 23 Jan 2023 20:33:41 +0200
Date: Mon, 23 Jan 2023 20:33:41 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 30/57] media: atomisp: ov2680: Rework flip ctrls
Message-ID: <Y87TBfAO51Jnk+6l@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-31-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-31-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:38PM +0100, Hans de Goede wrote:
> Rework the flip ctrls to be more like those of mainline (non staging)
> drivers.
> 
> This is modelled after the main ov2680 and ov5693 drivers. This also
> introduces __ov2680_get_pad_format() to make the ov2680 code more compliant
> with the mainline v4l2-subdev APIs.
> 
> Note the OV2680_FLIP_REG and OV2680_MIRROR_REG defines are renamed to
> OV2680_REG_FORMAT1 and OV2680_REG_FORMAT2 to match the datasheet.

...

> +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> +{
> +	return &container_of(ctrl->handler, struct ov2680_device,
> +			     ctrls.handler)->sd;

I would unroll this for better readability.


	struct ov2680_device *ovd =
		container_of(ctrl->handler, struct ov2680_device, ctrls.handler);

	return &ovd->sd;

> +}

-- 
With Best Regards,
Andy Shevchenko


