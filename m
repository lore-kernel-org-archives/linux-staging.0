Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1E3224
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 17:41:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353369143"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="353369143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 09:41:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="785750090"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="785750090"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 23 Jan 2023 09:41:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK0oY-00Dr6x-1X;
	Mon, 23 Jan 2023 19:41:02 +0200
Date: Mon, 23 Jan 2023 19:41:02 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 16/57] media: atomisp: Remove unnecessary memset(foo, 0,
 sizeof(foo)) calls
Message-ID: <Y87GrtbFaVJYs95e@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-17-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-17-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:24PM +0100, Hans de Goede wrote:
> The memory for all of struct atomisp_video_pipe is kzalloc()-ed in
> atomisp_subdev_init() so there is no need to memset parts of
> struct atomisp_video_pipe to 0.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_subdev.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> index c32db4ffb778..eb8f319fca5c 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -1054,11 +1054,6 @@ static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
>  	INIT_LIST_HEAD(&pipe->activeq);
>  	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
>  	INIT_LIST_HEAD(&pipe->per_frame_params);
> -	memset(pipe->frame_request_config_id,
> -	       0, VIDEO_MAX_FRAME * sizeof(unsigned int));
> -	memset(pipe->frame_params,
> -	       0, VIDEO_MAX_FRAME *
> -	       sizeof(struct atomisp_css_params_with_list *));
>  
>  	return 0;
>  }
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


