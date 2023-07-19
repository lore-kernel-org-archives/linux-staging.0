Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A241FB5F
	for <linux-staging@lists.linux.dev>; Wed, 19 Jul 2023 17:52:07 +0000 (UTC)
Received: from [192.168.1.141] ([37.4.248.68]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQy0N-1qbOZE21MF-00O1y2; Wed, 19 Jul 2023 19:51:51 +0200
Message-ID: <f1d46c8c-2dfd-4fe7-6005-fc7b97f5cafb@i2se.com>
Date: Wed, 19 Jul 2023 19:51:50 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 1/5] staging: vc04_services: vchiq_arm: Add new bus
 type and device type
Content-Language: en-US
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, f.fainelli@gmail.com, athierry@redhat.com,
 error27@gmail.com, dave.stevenson@raspberrypi.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com
References: <20230719164427.1383646-1-umang.jain@ideasonboard.com>
 <20230719164427.1383646-2-umang.jain@ideasonboard.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230719164427.1383646-2-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8VJip2zrPWfOrkss/26VVuw/ZEQ+jciPFDMSIIifivfwfYruXyv
 MMZanM2hs9O1N/y2K98q/zamtKAScB5ijAGqLi7J++xqTwI6HANrxDKz15jNb01OxWDhA08
 NW5yOgtMJ8KhXEvZHFPvGwi20ar0uzlUnUXPqLGcOxC0fFU9Ovj2giyiTCCR46caPLRPqrv
 tAZcpzAu0+wkS5XX1XU8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Ts+dlRndBc=;raHDiIKHlI5VPlm/BkgwXZHR7gV
 7BOS9bdminFrQf8N1RziAmmuddOhiMUtOyu9HfCDoQvLywARSBp39kmF+Fay3qZgYkkgrOuHM
 POSWTN8wWDAL7nKttWwk49lLvKFY+eufwU8KqwZcNJCYQdnqyaCIg0drcYMINpMzLrNPTZ18q
 kGRzDAXDlNdLwDcWHpxhwgjR7b9Mw/BVoi+3RrJ5oeuzBrMWXs01HA8K5Z97UTZcAMoEJiaOg
 uxiGA6vqBUVL1qrweBEh+US4sPm1UpFgEzCTF+Jkt3FSFRkN7tx0R2V0u/UQ24v1+V2bZPjvS
 i4I7roxi1MfppjWcIy482FNQCw3OhdEeOU4g052O29cymg7IwFlYU669tgOthiEhTuInkMIas
 R9/XoRy4jbOq2XOc/u+Vodb/2puwL4TaM9XyZGijjOWVgnmOh8mTLhuEfc/noiJUnEcEIUH7O
 8hR//5O9Ig5OzXZey2PXStd/NYg2LQltHBAYBV2ngXss67tc99Z5B08L32qaF3+wgqHsjqQkQ
 1Cons6fob92Xjg4L0U/4tuvM0cy4FzJpqrEoVwYyNFG8yH4FEwDgUjA5seCTLXHkMI5PJ4YGX
 NltsUpMWy5HR/Hw/+6Y9Rwc8IMSyTWOGQZkNCtGq0q32pWI/T0haHbAPDbIeZgEAHjVh01RpF
 AcKdxzyK3/ehK0i0uFnC80ItBZjfXswUaH00DzFA3w==

Hi Umang,

Am 19.07.23 um 18:44 schrieb Umang Jain:
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
>   drivers/staging/vc04_services/Makefile        |   1 +
>   .../interface/vchiq_arm/vchiq_device.c        | 102 ++++++++++++++++++
>   .../interface/vchiq_arm/vchiq_device.h        |  54 ++++++++++
>   3 files changed, 157 insertions(+)
>   create mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c
>   create mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.h
> 
> diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
> index 44794bdf6173..2d071e55e175 100644
> --- a/drivers/staging/vc04_services/Makefile
> +++ b/drivers/staging/vc04_services/Makefile
> @@ -5,6 +5,7 @@ vchiq-objs := \
>      interface/vchiq_arm/vchiq_core.o  \
>      interface/vchiq_arm/vchiq_arm.o \
>      interface/vchiq_arm/vchiq_debugfs.o \
> +   interface/vchiq_arm/vchiq_device.o \
>      interface/vchiq_arm/vchiq_connected.o \
>   
>   ifdef CONFIG_VCHIQ_CDEV
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c
> new file mode 100644
> index 000000000000..d7dfe4173579
> --- /dev/null
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.c
> @@ -0,0 +1,102 @@
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
> +static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
> +{
> +	if (dev->bus == &vchiq_bus_type &&
> +	    strcmp(dev_name(dev), drv->name) == 0)
> +		return 1;
> +
> +	return 0;
> +}
> +
> +static int vchiq_bus_uevent(const struct device *dev, struct kobj_uevent_env *env)
> +{
> +	const struct vchiq_device *device = container_of_const(dev, struct vchiq_device, dev);
> +
> +	return add_uevent_var(env, "MODALIAS=%s", dev_name(&device->dev));
> +}
> +
> +static int vchiq_bus_probe(struct device *dev)
> +{
> +	struct vchiq_device *device = to_vchiq_device(dev);
> +	struct vchiq_driver *driver = to_vchiq_driver(dev->driver);
> +	int ret;
> +
> +	ret = driver->probe(device);
> +	if (ret == 0)
> +		return 0;
> +
> +	return ret;

Why not returning the result of probe directly?

> +}
> +
> +struct bus_type vchiq_bus_type = {
> +	.name   = "vchiq-bus",
> +	.match  = vchiq_bus_type_match,
> +	.uevent = vchiq_bus_uevent,
> +	.probe  = vchiq_bus_probe,
> +};
> +
> +static void vchiq_device_release(struct device *dev)
> +{
> +	struct vchiq_device *device = to_vchiq_device(dev);
> +
> +	kfree(device);
> +}
> +
> +struct vchiq_device *
> +vchiq_device_register(struct device *parent, const char *name)
> +{
> +	struct vchiq_device *device;
> +	int ret;
> +
> +	device = kzalloc(sizeof(*device), GFP_KERNEL);
> +	if (!device) {
> +		dev_err(parent, "Cannot register %s: Insufficient memory\n",
> +			name);
> +		return NULL;
> +	}
> +
> +	device->dev.init_name = name;
> +	device->dev.parent = parent;
> +	device->dev.bus = &vchiq_bus_type;
> +	device->dev.release = vchiq_device_release;

Not sure, but maybe a good place to set the DMA mask?

> +
> +	ret = device_register(&device->dev);
> +	if (ret) {
> +		dev_err(parent, "Cannot register %s: %d\n", name, ret);
> +		put_device(&device->dev);
> +		return NULL;
> +	}
> +
> +	return device;
> +}
> +
> +void vchiq_device_unregister(struct vchiq_device *vchiq_dev)
> +{
> +	device_unregister(&vchiq_dev->dev);
> +}
> +
> +int vchiq_driver_register(struct vchiq_driver *vchiq_drv)
> +{
> +	vchiq_drv->driver.bus = &vchiq_bus_type;
> +
> +	return driver_register(&vchiq_drv->driver);
> +}
> +EXPORT_SYMBOL_GPL(vchiq_driver_register);
> +
> +void vchiq_driver_unregister(struct vchiq_driver *vchiq_drv)
> +{
> +	driver_unregister(&vchiq_drv->driver);
> +}
> +EXPORT_SYMBOL_GPL(vchiq_driver_unregister);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.h
> new file mode 100644
> index 000000000000..7eaaf9a91cda
> --- /dev/null
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_device.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023 Ideas On Board Oy
> + */
> +
> +#ifndef _VCHIQ_DEVICE_H
> +#define _VCHIQ_DEVICE_H
> +
> +#include <linux/device.h>
> +
> +struct vchiq_device {
> +	struct device dev;
> +};
> +
> +struct vchiq_driver {
> +	int		(*probe)(struct vchiq_device *device);
> +	void		(*remove)(struct vchiq_device *device);
> +	int		(*resume)(struct vchiq_device *device);
> +	int		(*suspend)(struct vchiq_device *device,
> +				   pm_message_t state);
> +	struct device_driver driver;
> +};
> +
> +static inline struct vchiq_device *to_vchiq_device(struct device *d)
> +{
> +	return container_of(d, struct vchiq_device, dev);
> +}
> +
> +static inline struct vchiq_driver *to_vchiq_driver(struct device_driver *d)
> +{
> +	return container_of(d, struct vchiq_driver, driver);
> +}
> +
> +extern struct bus_type vchiq_bus_type;
> +
> +struct vchiq_device *
> +vchiq_device_register(struct device *parent, const char *name);
> +void vchiq_device_unregister(struct vchiq_device *dev);
> +
> +int vchiq_driver_register(struct vchiq_driver *vchiq_drv);
> +void vchiq_driver_unregister(struct vchiq_driver *vchiq_drv);
> +
> +/**
> + * module_vchiq_driver() - Helper macro for registering a vchiq driver
> + * @__vchiq_driver: vchiq driver struct
> + *
> + * Helper macro for vchiq drivers which do not do anything special in
> + * module init/exit. This eliminates a lot of boilerplate. Each module may only
> + * use this macro once, and calling it replaces module_init() and module_exit()
> + */
> +#define module_vchiq_driver(__vchiq_driver) \
> +	module_driver(__vchiq_driver, vchiq_driver_register, vchiq_driver_unregister)
> +
> +#endif /* _VCHIQ_DEVICE_H */
