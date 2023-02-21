Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87754C64
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 15:58:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334032009"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334032009"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 07:58:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="702060365"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="702060365"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2023 07:57:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pUV1g-00A1fq-22;
	Tue, 21 Feb 2023 17:57:56 +0200
Date: Tue, 21 Feb 2023 17:57:56 +0200
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
Subject: Re: [PATCH 02/10] media: atomisp: Remove continuous mode support
Message-ID: <Y/TqBBdU7dbYPIsW@smile.fi.intel.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221145906.8113-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 21, 2023 at 03:58:58PM +0100, Hans de Goede wrote:
> Continues mode is a special mode where 2 /dev/video devices can be active
> at the same time. Either the video-preview + video nodes or the
> viewfinder (for still capture) + capture nodes.
> 
> For the video-preview + video-recording case modern userspace will
> use a single stream multiplexed by pipewire.
> 
> The still-capture case is extra special only starting the preview
> stream and then relying on a custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG
> ioctl to set things up followed by a second stream on to capture
> the amount of configured still pictures. While running the sensor
> at full resolution all the time. This case too is better handled
> with dma-buf + GPU downscaling for the view-finder rather then all this
> custom special code. Besises this the ioctl expects a bunch of special
> non error checked conditions to be met otherwise things will crash/hang.
> 
> The continues mode also involves a special cases all over the code
> getting in the way of further cleanups and simplifying the code to
> using just 1 /dev/video# node. So lets remove it and the
> related custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG ioctl.

...

> +	ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
> +				     f->fmt.pix.pixelformat, padding_w,

At least one parameter can be moved to the previous line.

> +				     padding_h, dvs_env_w, dvs_env_h);
> +	if (ret) {
> +		dev_warn(isp->dev,
> +			 "Set format to sensor failed with %d\n", ret);
> +		return -EINVAL;

...

>  	case ATOMISP_RUN_MODE_PREVIEW:
> -		if (!asd->continuous_mode->val) {
> -			if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
> -				return true;
> +		if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
> +			return true;
>  
> -			return false;
> -		}
> -		fallthrough;
> +		return false;

		return pipe_id == IA_CSS_PIPE_ID_PREVIEW;

...

>  	case ATOMISP_RUN_MODE_VIDEO:
> -		if (!asd->continuous_mode->val) {
> -			if (pipe_id == IA_CSS_PIPE_ID_VIDEO ||
> -			    pipe_id == IA_CSS_PIPE_ID_YUVPP)
> -				return true;
> -			else
> -				return false;
> -		}
> -		fallthrough;
> +		if (pipe_id == IA_CSS_PIPE_ID_VIDEO || pipe_id == IA_CSS_PIPE_ID_YUVPP)
> +			return true;
> +
> +		return false;

Similar.

-- 
With Best Regards,
Andy Shevchenko


