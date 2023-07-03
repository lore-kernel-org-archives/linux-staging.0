Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4520DF9C6
	for <linux-staging@lists.linux.dev>; Mon,  3 Jul 2023 13:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C280C433C8;
	Mon,  3 Jul 2023 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688390952;
	bh=RepaxfoshajN3K+86IX/ZsnlByloWQVwfP5afn9bAIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a01/bBaTvRO7151qPYjGovg7X61pYNS8WuLngBl/R/ygEsWml/MFCD8ti68mDbRfR
	 /gqr12qZAVTOQnBot19XMqUwR5iE6Rg75i6WTree65eTIT6H43SHHWztQYTEMxsU4u
	 2pWe7hivCrxhExrQAW0S3fMWl+1MWjjGjSrym8g4=
Date: Mon, 3 Jul 2023 15:28:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stefan.wahren@i2se.com,
	f.fainelli@gmail.com, athierry@redhat.com, error27@gmail.com,
	dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v8 1/5] staging: vc04_services: vchiq_arm: Add new bus
 type and device type
Message-ID: <2023070302-gallon-unison-2b9c@gregkh>
References: <20230627201628.207483-1-umang.jain@ideasonboard.com>
 <20230627201628.207483-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627201628.207483-2-umang.jain@ideasonboard.com>

On Tue, Jun 27, 2023 at 10:16:24PM +0200, Umang Jain wrote:
> The devices that the vchiq interface registers (bcm2835-audio,
> bcm2835-camera) are implemented and exposed by the VC04 firmware.
> The device tree describes the VC04 itself with the resources required
> to communicate with it through a mailbox interface. However, the
> vchiq interface registers these devices as platform devices. This
> also means the specific drivers for these devices are getting
> registered as platform drivers. This is not correct and a blatant
> abuse of platform device/driver.
> 
> Add a new bus type, vchiq_bus_type and device type (struct vchiq_device)
> which will be used to migrate child devices that the vchiq interfaces
> creates/registers from the platform device/driver.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/Makefile        |  1 +
>  .../interface/vchiq_arm/vchiq_device.c        | 78 +++++++++++++++++++
>  .../interface/vchiq_arm/vchiq_device.h        | 43 ++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c
>  create mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.h
> 
> diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
> index 44794bdf6173..2d071e55e175 100644
> --- a/drivers/staging/vc04_services/Makefile
> +++ b/drivers/staging/vc04_services/Makefile
> @@ -5,6 +5,7 @@ vchiq-objs := \
>     interface/vchiq_arm/vchiq_core.o  \
>     interface/vchiq_arm/vchiq_arm.o \
>     interface/vchiq_arm/vchiq_debugfs.o \
> +   interface/vchiq_arm/vchiq_device.o \
>     interface/vchiq_arm/vchiq_connected.o \
>  
>  ifdef CONFIG_VCHIQ_CDEV
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c
> new file mode 100644
> index 000000000000..dff312e9735c
> --- /dev/null
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * vchiq_device.c - VCHIQ generic device and bus-type
> + *
> + * Copyright (c) 2023 Ideas On Board Oy
> + */
> +
> +#include <linux/device/bus.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +
> +#include "vchiq_device.h"
> +
> +static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv);
> +
> +struct bus_type vchiq_bus_type = {
> +	.name   = "vchiq-bus",
> +	.match  = vchiq_bus_type_match,
> +};
> +
> +static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
> +{
> +	if (dev->bus == &vchiq_bus_type &&
> +	    strcmp(dev_name(dev), drv->name) == 0)
> +		return 1;
> +	return 0;
> +}
> +
> +static void vchiq_device_release(struct device *dev)
> +{
> +	struct vchiq_device *device;
> +
> +	device = container_of(dev, struct vchiq_device, dev);
> +	kfree(device);
> +}
> +
> +int vchiq_device_register(struct device *parent, const char *name)
> +{
> +	struct vchiq_device *device = NULL;

No need to set this to NULL.

> +	int ret;
> +
> +	device = kzalloc(sizeof(*device), GFP_KERNEL);
> +	if (!device)
> +		return -ENOMEM;
> +
> +	device->dev.init_name = name;
> +	device->dev.parent = parent;
> +	device->dev.bus = &vchiq_bus_type;
> +	device->dev.release = vchiq_device_release;
> +
> +	ret = device_register(&device->dev);
> +	if (ret) {
> +		put_device(&device->dev);
> +		return -EINVAL;

Why not return the error given to you?

> +	}
> +
> +	return 0;

You create a new device, shouldn't you return it?  How is it going to be
looked up again?

> +}
> +
> +int vchiq_device_unregister(struct device *dev, void *data)

You should be passing in a sruct vchiq_device *device here, right?

And why the void pointer you do nothing with?


> +{
> +	device_unregister(dev);
> +	return 0;
> +}

No need to export this?

thanks,

greg k-h
