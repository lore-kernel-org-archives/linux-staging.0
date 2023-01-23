Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091D2FAF
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 14:14:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="306401159"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="306401159"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="661644362"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="661644362"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 23 Jan 2023 06:14:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pJxaQ-00Dlyw-2R;
	Mon, 23 Jan 2023 16:14:14 +0200
Date: Mon, 23 Jan 2023 16:14:14 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 03/57] media: atomisp: Remove atomisp_sw_contex struct
Message-ID: <Y86WNqt/eZi1o271@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:11PM +0100, Hans de Goede wrote:
> Remove the atomisp_sw_contex struct, it has only 1 member: running_freq,
> instead store running_freq directly.
> 
> While at it also change running_freq from an int to an unsigned int,
> all values stored in it are unsigned and it is compared to the also
> unsigned new_freq variable.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c      | 4 ++--
>  drivers/staging/media/atomisp/pci/atomisp_fops.c     | 2 +-
>  drivers/staging/media/atomisp/pci/atomisp_internal.h | 6 +-----
>  3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index d8c7e7367386..5cea1df48b7d 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -280,14 +280,14 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
>  done:
>  	dev_dbg(isp->dev, "DFS target frequency=%d.\n", new_freq);
>  
> -	if ((new_freq == isp->sw_contex.running_freq) && !force)
> +	if ((new_freq == isp->running_freq) && !force)
>  		return 0;
>  
>  	dev_dbg(isp->dev, "Programming DFS frequency to %d\n", new_freq);
>  
>  	ret = write_target_freq_to_hw(isp, new_freq);
>  	if (!ret) {
> -		isp->sw_contex.running_freq = new_freq;
> +		isp->running_freq = new_freq;
>  		trace_ipu_pstate(new_freq, -1);
>  	}
>  	return ret;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index acea7492847d..4643bb0db995 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -681,7 +681,7 @@ static void atomisp_dev_init_struct(struct atomisp_device *isp)
>  	 * For Merrifield, frequency is scalable.
>  	 * After boot-up, the default frequency is 200MHz.
>  	 */
> -	isp->sw_contex.running_freq = ISP_FREQ_200MHZ;
> +	isp->running_freq = ISP_FREQ_200MHZ;
>  }
>  
>  static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> index 653e6d74a966..675007d7d9af 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> @@ -194,10 +194,6 @@ struct atomisp_regs {
>  	u32 csi_access_viol;
>  };
>  
> -struct atomisp_sw_contex {
> -	int running_freq;
> -};
> -
>  #define ATOMISP_DEVICE_STREAMING_DISABLED	0
>  #define ATOMISP_DEVICE_STREAMING_ENABLED	1
>  #define ATOMISP_DEVICE_STREAMING_STOPPING	2
> @@ -242,7 +238,6 @@ struct atomisp_device {
>  	struct v4l2_subdev *motor;
>  
>  	struct atomisp_regs saved_regs;
> -	struct atomisp_sw_contex sw_contex;
>  	struct atomisp_css_env css_env;
>  
>  	/* isp timeout status flag */
> @@ -257,6 +252,7 @@ struct atomisp_device {
>  	unsigned int mipi_frame_size;
>  	const struct atomisp_dfs_config *dfs;
>  	unsigned int hpll_freq;
> +	unsigned int running_freq;
>  
>  	bool css_initialized;
>  };
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


