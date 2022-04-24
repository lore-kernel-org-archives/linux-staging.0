Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE073201
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 13:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E021AC385A7;
	Sun, 24 Apr 2022 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650807633;
	bh=NJHwsmdod2sEs6NV0oCllmI57q/kiPU7WmbXQmvuAzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gz5LDvCtUpl/CgpkWSOvP09uwwGfzBKkYjPyaf3K2Wz7yPmVNSNwy3/7asl9D7BcE
	 JcxxBJ2ZVY5ZXkOj74iHtisVAeB+EArVQA2CVN47F3bz2sYVKn+pSTRCZ/GRofU8Db
	 zx1xuav2bB+0RnBYfTkgJssB77hNI2vKME2RKZ5o=
Date: Sun, 24 Apr 2022 15:40:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC V2] drivers/virt/vSMP: new driver
Message-ID: <YmVTTvQBSd5nzN3k@kroah.com>
References: <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Sun, Apr 24, 2022 at 11:44:33AM +0000, Czerwacki, Eial wrote:
> Introducing the vSMP guest driver which allows interaction with the vSMP control device when
> running a Linux OS atop of the vSMP hypervisor.
> vSMP is a resource aggregation hypervisor from SAP.

Please properly wrap your lines at 72 columns like git asks you to.

> 
> the driver comprises of 3 modules, vsmp which includes all the api needed to interact with the
> control driver, vsmp_logs which allows reading logs from the hypervisor and vsmp_common_info which
> allows reading generic information the hypervisor exposes, currently only the version is exposed.


Should this be one patch per module?

> 
> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>
> 
> v1 -> v2:
> 	- fix multiple rejects pointed out by Greg KH
> 	- fix multiple rejects pointed out by Dan Carpenter
> 	- fix multiple rejects pointed out by Randy Dunlap

You you didn't cc: any of us?

> ---
>  .../ABI/stable/sysfs-driver-vsmp_common_info  |   5 +
>  .../ABI/stable/sysfs-driver-vsmp_logs         |   5 +
>  drivers/virt/vsmp/Kconfig                     |  14 +
>  drivers/virt/vsmp/Makefile                    |   7 +
>  drivers/virt/vsmp/api.c                       | 416 ++++++++++++++++++
>  drivers/virt/vsmp/api.h                       |  61 +++
>  drivers/virt/vsmp/common/Kconfig              |  11 +
>  drivers/virt/vsmp/common/Makefile             |   7 +
>  drivers/virt/vsmp/common/common.c             |  66 +++
>  drivers/virt/vsmp/common/common.h             |  27 ++
>  drivers/virt/vsmp/common/version.c            | 117 +++++
>  drivers/virt/vsmp/logs/Kconfig                |  10 +
>  drivers/virt/vsmp/logs/Makefile               |   7 +
>  drivers/virt/vsmp/logs/active_logs.c          | 121 +++++
>  drivers/virt/vsmp/registers.h                 |  16 +

linux-staging@ is not the proper list for this to go to.  Please run
scripts/get_maintainer.pl on your patch and resend it.

>  15 files changed, 890 insertions(+)
>  create mode 100644 Documentation/ABI/stable/sysfs-driver-vsmp_common_info
>  create mode 100644 Documentation/ABI/stable/sysfs-driver-vsmp_logs
>  create mode 100644 drivers/virt/vsmp/Kconfig
>  create mode 100644 drivers/virt/vsmp/Makefile
>  create mode 100644 drivers/virt/vsmp/api.c
>  create mode 100644 drivers/virt/vsmp/api.h
>  create mode 100644 drivers/virt/vsmp/common/Kconfig
>  create mode 100644 drivers/virt/vsmp/common/Makefile
>  create mode 100644 drivers/virt/vsmp/common/common.c
>  create mode 100644 drivers/virt/vsmp/common/common.h
>  create mode 100644 drivers/virt/vsmp/common/version.c
>  create mode 100644 drivers/virt/vsmp/logs/Kconfig
>  create mode 100644 drivers/virt/vsmp/logs/Makefile
>  create mode 100644 drivers/virt/vsmp/logs/active_logs.c
>  create mode 100644 drivers/virt/vsmp/registers.h
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-vsmp_common_info b/Documentation/ABI/stable/sysfs-driver-vsmp_common_info
> new file mode 100644
> index 000000000000..a8a6afe417f3
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-driver-vsmp_common_info
> @@ -0,0 +1,5 @@
> +What:           /sys/hypervisor/vsmp/version
> +Date:           Apr 2022
> +Contact:        Eial Czerwacki <eial.czerwacki@sap.com>
> +		linux-vsmp@sap.com
> +Description:    Shows the full version of the vSMP hypervisor
> diff --git a/Documentation/ABI/stable/sysfs-driver-vsmp_logs b/Documentation/ABI/stable/sysfs-driver-vsmp_logs
> new file mode 100644
> index 000000000000..a863898f5356
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-driver-vsmp_logs
> @@ -0,0 +1,5 @@
> +What:           /sys/hypervisor/vsmp/logs

All of the vsmp/ sysfs api files should be in the same file, no need to
spread them around.

> +Date:           Apr 2022
> +Contact:        Eial Czerwacki <eial.czerwacki@sap.com>
> +		linux-vsmp@sap.com

Why a mix of tabs and spaces?  Please just use tabs.

> +Description:    Dumps the logs of the current session from the vSMP hypervisor
> diff --git a/drivers/virt/vsmp/Kconfig b/drivers/virt/vsmp/Kconfig
> new file mode 100644
> index 000000000000..e75879435769
> --- /dev/null
> +++ b/drivers/virt/vsmp/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig VSMP
> +	tristate "vSMP Guest Support"
> +	depends on SYS_HYPERVISOR && X86_64 && PCI
> +	help
> +	  Support for vSMP Guest Driver.
> +
> +	  This driver allows information gathering of data from the vSMP hypervisor when
> +	  running on top of a vSMP-based hypervisor.
> +
> +	  If unsure, say no.
> +
> +source "drivers/virt/vsmp/common/Kconfig"
> +source "drivers/virt/vsmp/logs/Kconfig"
> diff --git a/drivers/virt/vsmp/Makefile b/drivers/virt/vsmp/Makefile
> new file mode 100644
> index 000000000000..88625cd3707d
> --- /dev/null
> +++ b/drivers/virt/vsmp/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for vSMP Guest drivers.
> +#
> +
> +obj-$(CONFIG_VSMP)	+= vsmp.o common/ logs/
> +vsmp-y			:= api.o
> diff --git a/drivers/virt/vsmp/api.c b/drivers/virt/vsmp/api.c
> new file mode 100644
> index 000000000000..57c345eaaa0c
> --- /dev/null
> +++ b/drivers/virt/vsmp/api.c
> @@ -0,0 +1,416 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP api
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/pci_regs.h>
> +#include <linux/pci.h>
> +#include <linux/kobject.h>
> +#include <linux/kernel.h>
> +
> +#include <asm/io.h>
> +
> +#include "api.h"
> +
> +#define DEVICE_NAME "vsmp"

KBUILD_MODNAME?

> +#define DRIVER_LICENSE "GPL v2"
> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"
> +#define DRIVER_DESC "vSMP api driver"
> +#define DRIVER_VERSION "0.1"

In-kernel drivers do not need a version, please remove.

> +
> +#define PCI_DEVICE_ID_SAP_FLX_VSMP_CTL 0x1011
> +#define VSMP_CTL_MAX_PCI_BARS 2
> +
> +/* modules info */
> +MODULE_LICENSE(DRIVER_LICENSE);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_VERSION(DRIVER_VERSION);
> +
> +static unsigned int vsmp_bus;
> +static unsigned short vsmp_dev = 0x1f;
> +static unsigned char vsmp_func;
> +static bool vsmp_bdf_static = false;
> +static char *vsmp_ctrl_pci_addr = "";
> +module_param(vsmp_ctrl_pci_addr, charp, 0660);
> +
> +/* defines */
> +// copied from arch/x86/pci/direct.c
> +#define PCI_CONF1_ADDRESS(bus, devfn, reg) (0x80000000 | ((reg & 0xF00) << 16) | (bus << 16) \
> +	   | (devfn << 8) | (reg & 0xFC))

You should never need this type of thing, why not use the normal pci
apis?

> +
> +/* global vars */
> +void __iomem *cfg_addr;

Horrible global symbol name :(

> +static struct kobject *vsmp_sysfs_kobj;
> +static struct pci_dev *vsmp_dev_obj;

static variables are not global :)

And you should not need this, again, use the proper PCI api insted.

> +
> +static const struct pci_device_id vsmp_pci_tbl[] = {
> +	{ PCI_VDEVICE(SCALEMP, PCI_DEVICE_ID_SAP_FLX_VSMP_CTL), 0, },
> +	{ 0, },			/* terminate list */
> +};
> +
> +static struct {
> +	uint64_t start;
> +	uint64_t len;

u64 is the proper kernel type, uint* is for userspace code.

> +} mapped_bars[VSMP_CTL_MAX_PCI_BARS] = { 0 };
> +
> +/* internal functions */
> +
> +/*
> + * parses the pci address of a given address where the vSMP
> + * pci device is found
> + */
> +static void parse_vsmp_ctrl_pci_addr(void)
> +{
> +	unsigned int bus;
> +	unsigned short dev;
> +	unsigned char func;
> +
> +	if (!strlen(vsmp_ctrl_pci_addr))

Do not use global data for anything, that's a huge hint that your driver
is incorrectly written.

> +		return;

No error reporting?


> +
> +	if (sscanf(vsmp_ctrl_pci_addr, "%04x:%02hx.%1hhx", &bus, &dev, &func) < 3)
> +		return;
> +
> +	vsmp_bus = bus;
> +	vsmp_dev = dev;
> +	vsmp_func = func;
> +	vsmp_bdf_static = true;
> +}
> +
> +/*
> + * queries as specific device in order to determine if it is a vSMP PCI device
> + */
> +static void query_pci_bus_for_vsmp_directly(void)
> +					    

Always run checkpatch on your patches before sending them out.

> +{
> +	unsigned int devfn = PCI_DEVFN(vsmp_dev, vsmp_func);
> +	printk(KERN_INFO
> +	       "vSMP pci controller not found in devices tree, trying directly at %x:%x.%x...\n",
> +	       vsmp_bus, vsmp_dev, vsmp_func);

Drivers use dev_* calls, not "raw" printk().  Please fix.

And when drivers work properly, they are totally quiet.

> +
> +	outl(PCI_CONF1_ADDRESS(vsmp_bus, devfn, PCI_BASE_ADDRESS_0), 0xcf8);
> +	mapped_bars[0].start = inl(0xcfc);
> +
> +	// define a knwon value which might be enough and backwars compataible
> +	mapped_bars[0].len = 0x100000;

Again, drop the global variables.

> +}
> +
> +/*
> + * scan all the devices on the system in order to locate the
> + * vSMP PCI device for a given dev end func is provided
> + */
> +static void scan_pci_devs_list_for_static_vsmp(unsigned int static_devfn)
> +{
> +	struct pci_dev *pdev = NULL;
> +
> +	for_each_pci_dev(pdev) {

No, this is not allowed, please just bind to the pci device that you
control.  Your probe() function will be called when it is present.  If
it is not present, your code will never be loaded or called at all.
It's been this way for a very long time, you should never scan the pci
bus (hint, this way of doing it is also broken, it will not work
properly even if you wanted to do it.)

Again, please move this code to be a proper pci driver and all will be
good and much much simpler.

greg k-h
