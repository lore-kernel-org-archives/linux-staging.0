Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B13EA2C;
	Mon, 14 Feb 2022 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644856865; x=1676392865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7HBTbIry5i2v3ofkv2rXvDfAR5tIt7kfIF4pEaiDFA4=;
  b=C2TYMrNtID0qmnEMfGT5Ljda1SWWBlHe0ulgdsapWlv9b03fLAtLAACz
   grlvHeo34DfmO5ON5FV85rYlwpCNRXDpjr7jRl67Q5Sc9e1+EoRFqeeQj
   nqpOwHATAIUZuTA8OMx9neih7ieD4BARdRL/15lCuSEnEr96/kQi9WALY
   bA9SEfKOa7ScTdJPnKyf6MBV60/f8PziQ1nY2ITGh4PW5q6GN8fSNy5aD
   XKiM55Qp0CWOKOr+ZV6UC+cnTJuuxc+UMhY7ZQzvk4vqjBK3TZeTiFkGm
   m7G6RDChCalBPBUCGmKr7nD1MPviQksBsaN0h0gwLeSuYBKdAg0RuDwzs
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="247721099"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="247721099"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 08:41:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="587266599"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 08:40:58 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 962A1201DB;
	Mon, 14 Feb 2022 18:40:56 +0200 (EET)
Date: Mon, 14 Feb 2022 18:40:56 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 27/66] media: sun6i-csi: Add media ops with link
 notify callback
Message-ID: <YgqGGJJ0oVQgRoNy@paasikivi.fi.intel.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
 <20220205185429.2278860-28-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220205185429.2278860-28-paul.kocialkowski@bootlin.com>

Hi Paul,

Thanks for the update.

On Sat, Feb 05, 2022 at 07:53:50PM +0100, Paul Kocialkowski wrote:
> In order to keep the power use count fields balanced when link changes
> happen between v4l2_pipeline_pm_get/set calls (in open/close),
> the link_notify media operation callback needs to be registered.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index 6f04f86504bf..c8fe31cc38b5 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -23,6 +23,7 @@
>  #include <linux/sched.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> +#include <media/v4l2-mc.h>
>  
>  #include "sun6i_csi.h"
>  #include "sun6i_csi_reg.h"
> @@ -574,6 +575,12 @@ void sun6i_csi_set_stream(struct sun6i_csi_device *csi_dev, bool enable)
>  			   CSI_CAP_CH0_VCAP_ON);
>  }
>  
> +/* Media */
> +
> +static const struct media_device_ops sun6i_csi_media_ops = {
> +	.link_notify = v4l2_pipeline_link_notify,

Do you really need this?

Drivers should instead rely on runtime PM nowadays.

<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#power-management>

> +};
> +
>  /* V4L2 */
>  
>  static int sun6i_csi_link_entity(struct sun6i_csi_device *csi_dev,
> @@ -683,6 +690,7 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
>  	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
>  		 "platform:%s", dev_name(dev));
>  	media_dev->hw_revision = 0;
> +	media_dev->ops = &sun6i_csi_media_ops;
>  	media_dev->dev = dev;
>  
>  	media_device_init(media_dev);

-- 
Kind regards,

Sakari Ailus
