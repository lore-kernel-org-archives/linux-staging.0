Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649EE1CFA5
	for <linux-staging@lists.linux.dev>; Sat, 23 Sep 2023 14:34:04 +0000 (UTC)
Received: from [IPV6:2001:818:e7d2:8300:2412:6733:7e63:fb46] (unknown [IPv6:2001:818:e7d2:8300:2412:6733:7e63:fb46])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02C77DE2;
	Sat, 23 Sep 2023 16:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1695479543;
	bh=68LBmqQjIXy9xykOwHtx+7UwRbdJFITND0li2jF81AQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BmTSsfT/vhMMUUMfmO9bGz+Rc48Fg1/JbXoO/+0n5P4DvblZpMD14DptlWejx+5Nl
	 d4+hlTq2CYEajjTMCnLiHpZBrpn6j5LV3Fn92fu58FO3vqRG9H/Is/9BgdQ+WUFefu
	 B3Qy5nBg6GEw31fiFLbgFeFVHJbnhSpZQyZoKrcI=
Message-ID: <dc6d4108-7bb0-ba81-2f6b-0409b848ab0d@ideasonboard.com>
Date: Sat, 23 Sep 2023 20:03:58 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 0/6] staging: vc04_services: vchiq: Register devices
 with a custom bus_type
Content-Language: en-US
To: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry
 <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230923143200.268063-1-umang.jain@ideasonboard.com>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20230923143200.268063-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

On 9/23/23 8:01 PM, Umang Jain wrote:
> The patch series added a new bus type vchiq_bus_type and registers
> child devices in order to move them away from using platform
> device/driver.
>
> Tested on RPi-3-b with media tree master branch.
>
> Patch 1/6 and 2/6 adds explicit DMA mask to bcm2835-camera
> and bcm2835-audio respectively to avoid regression when moving
> to away from platform device/driver model.
>
> Patch 3/6 and 4/6 adds a new bus_type and registers them to vchiq
> interface
>
> Patch 5/6 and 6/6 moves the bcm2835-camera and bcm2835-audio
> to the new bus respectively
>
> Patch 5/5 removes a platform registeration helper which is no
> longer required.

Please ignore the  just above line, forgot to delete while editing the 
cover letter.
>
> Changes in v12:
> - Add initial two patches to set DMA Mask explicitly to avoid regression
> - fixup vchiq_device.c bad squash in v11
> - Rename vchiq_device.[ch] to vchiq_bus.[ch]
> - Fix memory leak if device cannot be registered
> - Make vchiq_bus_type_match() use bool values
> - vchiq_register_child() helper removal folded in 6/6
>    instead of creating extra patch.
>
> Changes in v11:
> - Move setting of DMA mask in child devices (3/5 and 4/5)
> - Fixes "DMA mask not set issue" reported in v10.
>
> Changes in v10:
> - fix dma_attr WARN issue with bcm2835-audio module loading
> - Unregister bus on parent platform device fails to register
> - Reword commit to highlight bcm2835_audio to bcm2835-audio name change
>
> Changes in v9:
> - Fix module autoloading
> - Implement bus_type's probe() callback to load drivers
> - Implement bus_type's uevent() to make sure appropriate drivers are
>    loaded when device are registed from vchiq.
>
> Changes in v8:
> - Drop dual licensing. Instead use GPL-2.0 only for patch 1/5
>
> Changes in v7:
> (5 out of 6 patches from v6 merged)
> - Split the main patch (6/6) as requested.
> - Use struct vchiq_device * instead of struct device * in
>    all bus functions.
> - Drop additional name attribute displayed in sysfs (redundant info)
> - Document vchiq_interface doesn't enumerate device discovery
> - remove EXPORT_SYMBOL_GPL(vchiq_bus_type)
>
> Changes in v6:
> - Split struct device and struct driver wrappers in vchiq_device.[ch]
> - Move vchiq_bus_type definition to vchiq_device.[ch] as well
> - return error on bus_register() failure
> - drop dma_set_mask_and_coherent
> - trivial variable name change
>
> Changes in v5:
> - Fixup missing "staging: " in commits' subject line
> - No code changes from v4
>
> Changes in v4:
> - Introduce patches to drop include directives from Makefile
>
> Changes in v3:
> - Rework entirely to replace platform devices/driver model
>
> -v2:
> https://lore.kernel.org/all/20221222191500.515795-1-umang.jain@ideasonboard.com/
>
> -v1:
> https://lore.kernel.org/all/20221220084404.19280-1-umang.jain@ideasonboard.com/
>
> Umang Jain (6):
>    staging: vc04_services: bcm2835-camera: Explicitly set DMA mask
>    staging: vc04_services: bcm2835-audio: Explicitly set DMA mask
>    staging: vc04_services: vchiq_arm: Add new bus type and device type
>    staging: vc04_services: vchiq_arm: Register vchiq_bus_type
>    staging: bcm2835-camera: Register bcm2835-camera with vchiq_bus_type
>    staging: bcm2835-audio: Register bcm2835-audio with vchiq_bus_type
>
>   drivers/staging/vc04_services/Makefile        |   1 +
>   .../vc04_services/bcm2835-audio/bcm2835.c     |  26 +++--
>   .../bcm2835-camera/bcm2835-camera.c           |  23 ++--
>   .../interface/vchiq_arm/vchiq_arm.c           |  52 ++++-----
>   .../interface/vchiq_arm/vchiq_bus.c           | 100 ++++++++++++++++++
>   .../interface/vchiq_arm/vchiq_bus.h           |  54 ++++++++++
>   6 files changed, 209 insertions(+), 47 deletions(-)
>   create mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
>   create mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.h
>
>
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d

