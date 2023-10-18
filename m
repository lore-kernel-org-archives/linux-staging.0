Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92902443C
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 05:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vlv6iVJl"
Received: from [192.168.1.110] (unknown [103.251.226.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47259741;
	Wed, 18 Oct 2023 07:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697605940;
	bh=wsmtERZwIFOBVXxcFTwMkwcV7zq3XaigmBQeJgWbczg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vlv6iVJl+raNcZQj0rJx5CoPDgveppdyKIWckqyXxLecNgF5szVmLirOBh0Lx5J1E
	 ciq85RFQWpl5PC1LpSENtzYBt80Epwm+E3odmDHA4CU9el/tuXXn5slyx0yDERaVV8
	 Yvix/wIAO/Yz/bcDqjlu9kYCfOhrr65Z8gAaFeTw=
Message-ID: <c1a71689-3541-f07b-c390-06f176d9ab5a@ideasonboard.com>
Date: Wed, 18 Oct 2023 10:42:18 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] staging: vc04_services: bcm2835-camera: Drop
 MODULE_ALIAS
To: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20231017200511.678223-1-umang.jain@ideasonboard.com>
 <20231017200511.678223-4-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20231017200511.678223-4-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/18/23 1:35 AM, Umang Jain wrote:
> Drop MODULE_ALIAS in favour of MODULE_DEVICE_TABLE as the module
> alias should be picked from there.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index c873eace1437..3c18376003ff 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -1995,9 +1995,15 @@ static void bcm2835_mmal_remove(struct vchiq_device *device)
>   	vchiq_mmal_finalise(instance);
>   }
>   
> +static const struct vchiq_bus_device_id id_table[] = {
> +	{ .name = "bcm2835-camera" }

This should be terminated with a NULL entry, sending v2 shortly.
> +};
> +MODULE_DEVICE_TABLE(vchiq_bus, id_table);
> +
>   static struct vchiq_driver bcm2835_camera_driver = {
>   	.probe		= bcm2835_mmal_probe,
>   	.remove		= bcm2835_mmal_remove,
> +	.id_table	= id_table,
>   	.driver		= {
>   		.name	= "bcm2835-camera",
>   	},
> @@ -2008,4 +2014,3 @@ module_vchiq_driver(bcm2835_camera_driver)
>   MODULE_DESCRIPTION("Broadcom 2835 MMAL video capture");
>   MODULE_AUTHOR("Vincent Sanders");
>   MODULE_LICENSE("GPL");
> -MODULE_ALIAS("bcm2835-camera");

