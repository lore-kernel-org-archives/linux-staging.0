Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8239E10798
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 23:07:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD79188F;
	Tue, 22 Nov 2022 00:07:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1669072039;
	bh=sbEIXdMpmY1oTe55o+FSsZLPrYLr+FsHdEDQECa5wfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vrLr0tsRblY1ISuYN5mNXXYSS1/ISPVEdQrWDRQS5dW9Bonn7xJvX/0w613sWZ9kQ
	 O+niTIteloFGGNXWqqQt16B7fz3sNi2z8jlT3xchNUI5m5LwxAp3RLRIDpYPif3N3K
	 SKOE3m5MLAzUsV1gA8feeMUISPDj2YucG/jnZu+w=
Date: Tue, 22 Nov 2022 01:07:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 02/14] staging: vchiq_arm: Register vcsm-cma as a
 platform driver
Message-ID: <Y3wElxCCVxTq53QD@pendragon.ideasonboard.com>
References: <20221121214722.22563-1-umang.jain@ideasonboard.com>
 <20221121214722.22563-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121214722.22563-3-umang.jain@ideasonboard.com>

Hi Umang and Dave,

Thank you for the patch.

On Tue, Nov 22, 2022 at 03:17:10AM +0530, Umang Jain wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Following the same pattern as bcm2835-camera and bcm2835-audio,
> register the vcsm-cma driver as a platform driver.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index dc33490ba7fb..642fdbc0d654 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -67,6 +67,7 @@ struct vchiq_state g_state;
>  
>  static struct platform_device *bcm2835_camera;
>  static struct platform_device *bcm2835_audio;
> +static struct platform_device *vcsm_cma;
>  
>  struct vchiq_drvdata {
>  	const unsigned int cache_line_size;
> @@ -1832,6 +1833,7 @@ static int vchiq_probe(struct platform_device *pdev)
>  		goto error_exit;
>  	}
>  
> +	vcsm_cma = vchiq_register_child(pdev, "vcsm-cma");
>  	bcm2835_camera = vchiq_register_child(pdev, "bcm2835-camera");
>  	bcm2835_audio = vchiq_register_child(pdev, "bcm2835_audio");
>  
> @@ -1847,6 +1849,7 @@ static int vchiq_remove(struct platform_device *pdev)
>  {
>  	platform_device_unregister(bcm2835_audio);
>  	platform_device_unregister(bcm2835_camera);
> +	platform_device_unregister(vcsm_cma);
>  	vchiq_debugfs_deinit();
>  	vchiq_deregister_chrdev();
>  

-- 
Regards,

Laurent Pinchart
