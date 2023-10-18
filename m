Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D963588E
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ptXqlN5y"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAD0E5AA;
	Wed, 18 Oct 2023 14:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697632934;
	bh=E8xmvWGnV2lLRkEznHcs8rfnSSlzFrPMlF1rhf7ju6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ptXqlN5y+tKSGnr9pESprs48pV+FbLMNKlVlF9lf9l3uh7VDoJYCoUKpWx+u5iGY/
	 Gs3pU7fSwBMfM29qqHBBGtXvsALj7WhA5+0xnmJ1qw2w6hrPQWpe/B1Zp41oqymnbK
	 oVQ/3CQpkLSqe8VLC271yxtPOy7bVzTDkxE2WENM=
Date: Wed, 18 Oct 2023 15:42:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 3/3] staging: vc04_services: bcm2835-camera: Drop
 MODULE_ALIAS
Message-ID: <20231018124229.GI11118@pendragon.ideasonboard.com>
References: <20231018054214.824296-1-umang.jain@ideasonboard.com>
 <20231018054214.824296-4-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231018054214.824296-4-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Wed, Oct 18, 2023 at 11:12:14AM +0530, Umang Jain wrote:
> Drop MODULE_ALIAS in favour of MODULE_DEVICE_TABLE as the module
> alias should be picked from there.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index c873eace1437..44901aab637b 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -1995,9 +1995,16 @@ static void bcm2835_mmal_remove(struct vchiq_device *device)
>  	vchiq_mmal_finalise(instance);
>  }
>  
> +static const struct vchiq_bus_device_id id_table[] = {
> +	{ .name = "bcm2835-camera" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(vchiq_bus, id_table);

With the "_bus" suffix dropped (see review of 1/3),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  static struct vchiq_driver bcm2835_camera_driver = {
>  	.probe		= bcm2835_mmal_probe,
>  	.remove		= bcm2835_mmal_remove,
> +	.id_table	= id_table,
>  	.driver		= {
>  		.name	= "bcm2835-camera",
>  	},
> @@ -2008,4 +2015,3 @@ module_vchiq_driver(bcm2835_camera_driver)
>  MODULE_DESCRIPTION("Broadcom 2835 MMAL video capture");
>  MODULE_AUTHOR("Vincent Sanders");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("bcm2835-camera");

-- 
Regards,

Laurent Pinchart
