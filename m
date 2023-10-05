Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6336E7F
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FBfUn83j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A15C4166B;
	Thu,  5 Oct 2023 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696493052;
	bh=bhrFsDpbzXSbshflQPJ73aE6VYGi2Pa16fWZ0LDK9cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBfUn83j17Q26OciLdhKLUQDfdTu7vc998nDCD56wiDoRzUXMkv7OgqEmf2h6uVbW
	 DZ7dxiWo1Dsgxjfn7ToPkm9PDfnS9FYaDtTJ8SNRri2Ox+RxFkgQqy/IM98hqfJjWT
	 KPWljbuB0/iLQSGu1vHCUENWxzuJEnAuVmbZqI2M=
Date: Thu, 5 Oct 2023 10:04:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v12 5/6] staging: bcm2835-camera: Register bcm2835-camera
 with vchiq_bus_type
Message-ID: <2023100542-gluten-rally-5a96@gregkh>
References: <20230923143200.268063-1-umang.jain@ideasonboard.com>
 <20230923143200.268063-6-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923143200.268063-6-umang.jain@ideasonboard.com>

On Sat, Sep 23, 2023 at 08:01:59PM +0530, Umang Jain wrote:
> Register the bcm2835-camera with the vchiq_bus_type instead of using
> platform driver/device.
> 
> Since we moved away bcm2835-camera from platform driver/device,
> we have to set the DMA mask explicitly. Set the DMA mask at probe
> time.
> 
> Also the VCHIQ firmware doesn't support device enumeration, hence
> one has to maintain a list of devices to be registered in the interface.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../bcm2835-camera/bcm2835-camera.c           | 21 ++++++++++---------
>  .../interface/vchiq_arm/vchiq_arm.c           | 11 +++++++---
>  2 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index fcad5118f3e8..c873eace1437 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -11,6 +11,7 @@
>   *          Luke Diamand @ Broadcom
>   */
>  
> +#include <linux/dma-mapping.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -24,8 +25,8 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-common.h>
>  #include <linux/delay.h>
> -#include <linux/platform_device.h>
>  
> +#include "../interface/vchiq_arm/vchiq_bus.h"
>  #include "../vchiq-mmal/mmal-common.h"
>  #include "../vchiq-mmal/mmal-encodings.h"
>  #include "../vchiq-mmal/mmal-vchiq.h"
> @@ -1841,7 +1842,7 @@ static struct v4l2_format default_v4l2_format = {
>  	.fmt.pix.sizeimage = 1024 * 768,
>  };
>  
> -static int bcm2835_mmal_probe(struct platform_device *pdev)
> +static int bcm2835_mmal_probe(struct vchiq_device *device)
>  {
>  	int ret;
>  	struct bcm2835_mmal_dev *dev;
> @@ -1852,9 +1853,9 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>  	unsigned int resolutions[MAX_BCM2835_CAMERAS][2];
>  	int i;
>  
> -	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	ret = dma_set_mask_and_coherent(&device->dev, DMA_BIT_MASK(32));
>  	if (ret) {
> -		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
> +		dev_err(&device->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -1902,7 +1903,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>  						       &camera_instance);
>  		ret = v4l2_device_register(NULL, &dev->v4l2_dev);
>  		if (ret) {
> -			dev_err(&pdev->dev, "%s: could not register V4L2 device: %d\n",
> +			dev_err(&device->dev, "%s: could not register V4L2 device: %d\n",
>  				__func__, ret);
>  			goto free_dev;
>  		}
> @@ -1982,7 +1983,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static void bcm2835_mmal_remove(struct platform_device *pdev)
> +static void bcm2835_mmal_remove(struct vchiq_device *device)
>  {
>  	int camera;
>  	struct vchiq_mmal_instance *instance = gdev[0]->instance;
> @@ -1994,17 +1995,17 @@ static void bcm2835_mmal_remove(struct platform_device *pdev)
>  	vchiq_mmal_finalise(instance);
>  }
>  
> -static struct platform_driver bcm2835_camera_driver = {
> +static struct vchiq_driver bcm2835_camera_driver = {
>  	.probe		= bcm2835_mmal_probe,
> -	.remove_new	= bcm2835_mmal_remove,
> +	.remove		= bcm2835_mmal_remove,
>  	.driver		= {
>  		.name	= "bcm2835-camera",
>  	},
>  };
>  
> -module_platform_driver(bcm2835_camera_driver)
> +module_vchiq_driver(bcm2835_camera_driver)
>  
>  MODULE_DESCRIPTION("Broadcom 2835 MMAL video capture");
>  MODULE_AUTHOR("Vincent Sanders");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:bcm2835-camera");
> +MODULE_ALIAS("bcm2835-camera");

Now that you are on your own bus, why do you need the MODULE_ALIAS()
line at all?

thanks,

greg k-h
