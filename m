Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C208BD51C
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 18:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CC6C433D2;
	Tue, 17 Jan 2023 18:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673979677;
	bh=7aRxXGEphfT5LNMRbYhiA6ttlYV7jeRaPdDuQxYBe1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZ8uKQWBVJtfGdGphoRSRsp6ZpplVL6v+28Np9lbvLZtyzxyz0n7qzYQnZK3WbcuI
	 Vm1VmRRmopnaQxqO/owyQnXLDMrQooltH+R4vGrvJDuusEwvV1ozameHVdtIGcMVdT
	 qO7tPHaWpZPOTN33zIcKWKGhQUJG6cJ4stD8t0OY=
Date: Tue, 17 Jan 2023 19:21:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] staging: vc04_services: vchiq: Register devices with
 a custom bus_type
Message-ID: <Y8bnGrsxQD6/eYu3@kroah.com>
References: <20230111090029.250884-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111090029.250884-1-umang.jain@ideasonboard.com>

On Wed, Jan 11, 2023 at 02:30:29PM +0530, Umang Jain wrote:
> The devices that the vchiq interface registers(bcm2835-audio,
> bcm2835-camera) are implemented and exposed by the VC04 firmware.
> The device tree describes the VC04 itself with the resources
> required to communicate with it through a mailbox interface. However,
> the vchiq interface registers these devices as platform devices. This
> also means the specific drivers for these devices are also getting
> registered as platform drivers. This is not correct and a blatant
> abuse of platform device/driver.
> 
> Replace the platform device/driver model with a standard device driver
> model. A custom bus_type, vchiq_bus_type, is created in the vchiq
> interface which matches the devices to their specific device drivers
> thereby, establishing driver binding. A struct vchiq_device wraps the
> struct device for each device being registered on the bus by the vchiq
> interface.
> 
> Each device registered will expose a 'name' read-only device attribute
> in sysfs (/sys/bus/vchiq-bus/devices). New devices and drivers can be
> added by registering on vchiq_bus_type and adding a corresponding
> device name entry in the static list of devices, vchiq_devices. There
> is currently no way to enumerate the VCHIQ devices that are available
> from the firmware.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
> Changes in v3:
> - Rework entirely to replace platform devices/driver model
> 
> -v2:
> https://lore.kernel.org/all/20221222191500.515795-1-umang.jain@ideasonboard.com/
> 
> -v1:
> https://lore.kernel.org/all/20221220084404.19280-1-umang.jain@ideasonboard.com/
> 
> - Developed on top of:
> [PATCH v3 0/7] staging: vc04_services: Remove custom return values
> 
> ---
>  .../vc04_services/bcm2835-audio/Makefile      |   5 +-
>  .../vc04_services/bcm2835-audio/bcm2835.c     |  19 ++-
>  .../vc04_services/bcm2835-camera/Makefile     |   2 +
>  .../bcm2835-camera/bcm2835-camera.c           |  17 ++-
>  .../interface/vchiq_arm/vchiq_arm.c           | 121 +++++++++++++++---
>  .../interface/vchiq_arm/vchiq_arm.h           |   1 +
>  6 files changed, 123 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/Makefile b/drivers/staging/vc04_services/bcm2835-audio/Makefile
> index d59fe4dde615..4801467be58a 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/Makefile
> +++ b/drivers/staging/vc04_services/bcm2835-audio/Makefile
> @@ -2,4 +2,7 @@
>  obj-$(CONFIG_SND_BCM2835)	+= snd-bcm2835.o
>  snd-bcm2835-objs		:= bcm2835.o bcm2835-ctl.o bcm2835-pcm.o bcm2835-vchiq.o
>  
> -ccflags-y += -I $(srctree)/$(src)/../include -D__VCCOREVER__=0x04000000
> +ccflags-y += \
> +	-I $(srctree)/$(src)/../include \
> +	-I $(srctree)/$(src)/../interface/vchiq_arm \

Please never add new -I entries, as that can break the build when you
only want to build a subdirectory.  Just use the "../" in the .c files
instead.

While you are not responsible for the original one here, please never
add a new one.

And, you can work to get rid of the current addition as well, that
should be done sooner rather than later anyway.

thanks,

greg k-h
