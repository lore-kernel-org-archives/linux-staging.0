Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6387E
	for <linux-staging@lists.linux.dev>; Tue,  4 Apr 2023 02:26:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3D9A8B;
	Tue,  4 Apr 2023 04:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1680575161;
	bh=OMymfzD9PYbYSr506YycZWtP867uldEqSGB6T3OD14Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yp0SPziuQoQL/5Tb1Z0fPH26pepQdG5hvGHvr0fJwGFFGUaDncw1c/L8rBCvtLRJS
	 HkHaw31z5Ey87i/AxY9ha6gt5pKQACRSh0Ij6m9wZmiK73ctbZYMaJ4IxNaubmWbbT
	 3RvhvhB3HTagQ1Rp4gD4vY1XMyVKRlMLnN2CsviM=
Date: Tue, 4 Apr 2023 05:26:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 23/24] staging: vc04_services: bcm2835-camera: Convert to
 platform remove callback returning void
Message-ID: <20230404022608.GC16648@pendragon.ideasonboard.com>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-24-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403154014.2564054-24-u.kleine-koenig@pengutronix.de>

Hi Uwe,

Thank you for the patch.

On Mon, Apr 03, 2023 at 05:40:13PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c   | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index 4f81765912ea..346d00df815a 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -1976,7 +1976,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int bcm2835_mmal_remove(struct platform_device *pdev)
> +static void bcm2835_mmal_remove(struct platform_device *pdev)
>  {
>  	int camera;
>  	struct vchiq_mmal_instance *instance = gdev[0]->instance;
> @@ -1986,13 +1986,11 @@ static int bcm2835_mmal_remove(struct platform_device *pdev)
>  		gdev[camera] = NULL;
>  	}
>  	vchiq_mmal_finalise(instance);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver bcm2835_camera_driver = {
>  	.probe		= bcm2835_mmal_probe,
> -	.remove		= bcm2835_mmal_remove,
> +	.remove_new	= bcm2835_mmal_remove,
>  	.driver		= {
>  		.name	= "bcm2835-camera",
>  	},

-- 
Regards,

Laurent Pinchart
