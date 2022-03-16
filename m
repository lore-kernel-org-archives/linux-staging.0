Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581B28FA
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aPqspxgmbtSUpBfnpuR4sCa2Va5iViG4yPvt7wUetqg=; b=X44G94svF6r/YnM14KLmxLxaYj
	DKfuC2jc1swNDubchesCM0s+hKJ83oiAmUNrnFMTKRI7x8BMkBhVb+Ox0TEf+VhnByt+JmmGxcwps
	yQMqyjT7tMFndQy5pRXIpGLYckKdUPNcduTfhx6mXkTMPMI1Pmkp6AhlwTf5jbIUfex7ND3ba+qOh
	A8JJ+cp+ah8KQNrkv+KD/lTCToG+Y7hCb3ZToDYncZpVr9T59GYT1UW92D97Ig9VPbYjrsvKA5rWb
	KkKZhUSL0HhsPNHZsgcJecaGbCnx/BncN442hBY52HEVIEBmlOYh7Af7RXyqAaZpNX20EkY/lguNG
	LxHanIyA==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUYRE-001ciq-Ir; Wed, 16 Mar 2022 18:32:01 +0000
Message-ID: <55c3002a-7eee-9877-24a4-41f11ef4d1b8@infradead.org>
Date: Wed, 16 Mar 2022 11:31:54 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] staging/vSMP: new driver
Content-Language: en-US
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Cc: SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 3/16/22 11:13, Czerwacki, Eial wrote:
> Introducing the vSMP guest driver which allows interaction with the vSMP control device when
> running a Linux OS atop of the vSMP hypervisor.
> vSMP is a resource aggregation hypervisor from SAP.
> 
> the driver comprises of 3 modules, vsmp which includes all the api needed to interact with the

  The                                                            API

> control driver, vsmp_logs which allows reading logs from the hypervisor and vsmp_common_info which
> allows reading generic information the hypervisor exposes, currently only the version is exposed.
> 
> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>
> ---
>  MAINTAINERS                             |   6 +
>  drivers/staging/Kconfig                 |   2 +
>  drivers/staging/Makefile                |   1 +
>  drivers/staging/vsmp/Kconfig            |  14 +
>  drivers/staging/vsmp/Makefile           |   7 +
>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++
>  drivers/staging/vsmp/api.h              |  61 ++++
>  drivers/staging/vsmp/common/Kconfig     |  11 +
>  drivers/staging/vsmp/common/Makefile    |   7 +
>  drivers/staging/vsmp/common/common.c    |  64 ++++
>  drivers/staging/vsmp/common/common.h    |  27 ++
>  drivers/staging/vsmp/common/version.c   |  85 +++++
>  drivers/staging/vsmp/logs/Kconfig       |  10 +
>  drivers/staging/vsmp/logs/Makefile      |   7 +
>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++
>  drivers/staging/vsmp/registers.h        |  16 +
>  16 files changed, 832 insertions(+)
>  create mode 100644 drivers/staging/vsmp/Kconfig
>  create mode 100644 drivers/staging/vsmp/Makefile
>  create mode 100644 drivers/staging/vsmp/api.c
>  create mode 100644 drivers/staging/vsmp/api.h
>  create mode 100644 drivers/staging/vsmp/common/Kconfig
>  create mode 100644 drivers/staging/vsmp/common/Makefile
>  create mode 100644 drivers/staging/vsmp/common/common.c
>  create mode 100644 drivers/staging/vsmp/common/common.h
>  create mode 100644 drivers/staging/vsmp/common/version.c
>  create mode 100644 drivers/staging/vsmp/logs/Kconfig
>  create mode 100644 drivers/staging/vsmp/logs/Makefile
>  create mode 100644 drivers/staging/vsmp/logs/active_logs.c
>  create mode 100644 drivers/staging/vsmp/registers.h
> 


> diff --git a/drivers/staging/vsmp/Kconfig b/drivers/staging/vsmp/Kconfig
> new file mode 100644
> index 000000000000..c57cfcb55033
> --- /dev/null
> +++ b/drivers/staging/vsmp/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig VSMP
> +	tristate "vSMP Guest Support"
> +	depends on SYS_HYPERVISOR && X86_64 && PCI
> +	help
> +	  Support for vSMP Guest Driver.
> +
> +	  this drivers allows information gathering of data from the vSMP hypervisor when

	  This driver

> +	  running ontop of a vSMP based VM.

	          on top of a vSMP-based VM.

> +
> +	  If unsure, say no.
> +
> +source "drivers/staging/vsmp/common/Kconfig"
> +source "drivers/staging/vsmp/logs/Kconfig"



> diff --git a/drivers/staging/vsmp/api.c b/drivers/staging/vsmp/api.c
> new file mode 100644
> index 000000000000..b0d4b5a990d4
> --- /dev/null
> +++ b/drivers/staging/vsmp/api.c
> @@ -0,0 +1,402 @@
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
> +#define DRIVER_LICENSE "GPL"
> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"
> +#define DRIVER_DESC "vSMP api driver"
> +#define DRIVER_VERSION "0.1"
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
> +static unsigned int vsmp_bus = 0;
> +static unsigned short vsmp_dev = 0x1f;
> +static unsigned char vsmp_func = 0;

No need to init globals to 0.

> +static bool vsmp_bdf_static = false;
> +static char *vsmp_ctrl_pci_addr = "";
> +module_param(vsmp_ctrl_pci_addr, charp, 0660);
> +
> +/* defines */
> +// copied from arch/x86/pci/direct.c
> +#define PCI_CONF1_ADDRESS(bus, devfn, reg) \
> +	   (0x80000000 | ((reg & 0xF00) << 16) | (bus << 16) \
> +	   | (devfn << 8) | (reg & 0xFC))
> +
> +/* global vars */
> +void __iomem *cfg_addr = NULL;
> +static struct kobject *vsmp_sysfs_kobj;
> +static struct pci_dev *vsmp_dev_obj = NULL;

ditto.

> +
> +static const struct pci_device_id pci_tbl[] = {
> +	{ PCI_VDEVICE(SCALEMP, PCI_DEVICE_ID_SAP_FLX_VSMP_CTL), 0, },
> +	{ 0, },			/* terminate list */
> +};
> +
> +static struct {
> +	uint64_t start;
> +	uint64_t len;
> +} mapped_bars[VSMP_CTL_MAX_PCI_BARS] = { 0 };
> +
> +/* internal functions */
> +
> +/**
> + * parses the pci address of a given address where the vSMP
> + * pci device is found
> + */

In the kernel source tree, "/**" means "This is the beginning of a
kernel-doc comment," but this (above) is not in kernel-doc format,
so either use "/*" to begin the comment or use kernel-doc notation.

(Repeat in several other places...)

> +static void parse_vsmp_ctrl_pci_addr(void)
> +{
> +	if (strlen(vsmp_ctrl_pci_addr)) {
> +		unsigned int bus;
> +		unsigned short dev;
> +		unsigned char func;
> +
> +		if (sscanf(vsmp_ctrl_pci_addr, "%04x:%02hx.%1hhx", &bus, &dev,
> +			   &func) == 3) {
> +			vsmp_bus = bus;
> +			vsmp_dev = dev;
> +			vsmp_func = func;
> +			vsmp_bdf_static = true;
> +		}
> +	}
> +}
> +
> +/**
> + * queries as specfic device in order to determine if it is a vSMP pci device

                 specific                                             PCI

> + */
> +static void query_pci_bus_for_vsmp_directly(unsigned int default_bus,
> +					    unsigned int devfn)
> +{
> +	printk(KERN_INFO
> +	       "vSMP pci controller not found in devices tree, trying directly at %x:%x.%x...\n",
> +	       vsmp_bus, vsmp_dev, vsmp_func);
> +
> +	outl(PCI_CONF1_ADDRESS(vsmp_bus, devfn, PCI_BASE_ADDRESS_0), 0xcf8);
> +	mapped_bars[0].start = inl(0xcfc);
> +}
> +
> +/**
> + * scan all the devices on the system in order to locate the
> + * vSMP pic device for a given dev end func is provided

           PCI
I guess.

> + */
> +static void scan_pci_devs_list_for_vsmp(unsigned int devfn)
> +{
> +	int found, i;
> +	struct pci_dev *pdev = NULL;
> +	const struct pci_device_id *ent;
> +
> +	for_each_pci_dev(pdev) {
> +		if (devfn != -1) {
> +			if ((pdev->bus->number == vsmp_bus) &&
> +			    (devfn == pdev->devfn)) {
> +				found = 1;
> +				break;
> +			}
> +		} else {
> +			ent = pci_match_id(pci_tbl, pdev);
> +			if (ent) {
> +				found = 1;
> +				vsmp_bus = pdev->bus->number;
> +				vsmp_dev = PCI_SLOT(pdev->devfn);
> +				vsmp_func = PCI_FUNC(pdev->devfn);
> +				break;
> +			}
> +		}
> +	}
> +
> +	for (i = 0; (i < ARRAY_SIZE(mapped_bars)) && found; i++) {
> +		mapped_bars[i].start = pci_resource_start(pdev, i);
> +		mapped_bars[i].len = pci_resource_len(pdev, i);
> +	}
> +	vsmp_dev_obj = pdev;
> +}
> +
> +/**
> + * open the cfg address space of the vSDP device
> + */
> +static int open_cfg_addr(void)
> +{
> +	unsigned int devfn = (vsmp_bdf_static) ? PCI_DEVFN(vsmp_dev, vsmp_func)
> +						: -1;
> +
> +	scan_pci_devs_list_for_vsmp(devfn);
> +	if (!mapped_bars[0].start)
> +		query_pci_bus_for_vsmp_directly(0, devfn);
> +
> +	if (!mapped_bars[0].len) {
> +		printk(KERN_INFO "vSMP pci controller not found, exiting.\n");
> +		return -1;
> +	}
> +
> +	printk(KERN_INFO "mapping bar 0: [0x%llx,0x%llx]\n",
> +	       mapped_bars[0].start, mapped_bars[0].start + mapped_bars[0].len);
> +	cfg_addr = ioremap(mapped_bars[0].start, mapped_bars[0].len);
> +
> +	if (!cfg_addr) {
> +		printk(KERN_ERR
> +		       "failed to map vSMP pci controller at %x:%x.%x, exiting.\n",
> +		       vsmp_bus, vsmp_dev, vsmp_func);
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +/* exported functions */
> +
> +/**
> + * read a value from a specfic register in the vSMP's device config space

                          specific

> + */
> +unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size_type type)
> +{
> +	unsigned long ret_val;
> +
> +	switch (type) {
> +	case VSMP_CTL_REG_SIZE_8BIT:
> +		ret_val = readb(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_16BIT:
> +		ret_val = readw(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_32BIT:
> +		ret_val = readl(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_64BIT:
> +		ret_val = readq(cfg_addr + reg);
> +		break;
> +
> +	default:
> +		printk(KERN_ERR "unsupported reg size type %d.\n", type);
> +		ret_val = (unsigned long)(-1);
> +	}
> +
> +	dev_dbg(&vsmp_dev_obj->dev, "%s: read 0x%lx from reg 0x%x of %d bits\n",
> +		__func__, ret_val, reg, (type + 1) * 8);
> +	return ret_val;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_read_reg_from_cfg);
> +
> +/**
> + * write a value to a specfic register in the vSMP's device config space

                         specific

> + */
> +void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,
> +			   enum reg_size_type type)
> +{
> +	switch (type) {
> +	case VSMP_CTL_REG_SIZE_8BIT:
> +		writeb((unsigned char)value, cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_16BIT:
> +		writew((unsigned short)value, cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_32BIT:
> +		writel((unsigned int)value, cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_64BIT:
> +		writeq(value, cfg_addr + reg);
> +		break;
> +
> +	default:
> +		printk(KERN_ERR "unsupported reg size type %d.\n", type);
> +	}
> +
> +	dev_dbg(&vsmp_dev_obj->dev, "%s: wrote 0x%x to reg 0x%x of %u bits\n",
> +		__func__, reg, reg, (type + 1) * 8);
> +}
> +EXPORT_SYMBOL_GPL(vsmp_write_reg_to_cfg);
> +
> +/**
> + * reag a buffer from a specific offset in a specific bar, maxed to a predefined len size-wise from the vSMP device

      read

> + */
> +unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int offset,
> +				     char *out, unsigned int len,
> +				     bool halt_on_null)
> +{
> +	unsigned char __iomem *buff;
> +
> +	BUG_ON(!mapped_bars[bar].start);
> +	BUG_ON(ARRAY_SIZE(mapped_bars) <= bar);
> +	BUG_ON((offset + len) > mapped_bars[bar].len);
> +
> +	buff = ioremap(mapped_bars[bar].start + offset, len);
> +	if (!buff)
> +		return -ENOMEM;
> +
> +	if (halt_on_null) {
> +		int i;
> +		unsigned char c;
> +
> +		for (i = 0; i < len; i++) {
> +			c = ioread8(&buff[i]);
> +			if (!c)
> +				break;
> +			out[i] = c;
> +		}
> +	} else
> +		memcpy_fromio(out, buff, len);
> +
> +	iounmap(buff);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_read_buff_from_bar);
> +
> +/**
> + * register the vSMP sysfs object for user space interaction
> + */
> +int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr)
> +{
> +	int error = -1;
> +
> +	if (vsmp_sysfs_kobj && bin_attr) {
> +		if ((error = sysfs_create_bin_file(vsmp_sysfs_kobj, bin_attr)))
> +			printk(KERN_CRIT "%s returned error %d\n", __func__,
> +			       error);
> +	}
> +
> +	return error;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_register_sysfs_group);
> +
> +/**
> + * deergister the vSMP sysfs object for user space interaction

      deregister
or    unregister

> + */
> +void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr)
> +{
> +	if (vsmp_sysfs_kobj && bin_attr)
> +		sysfs_remove_bin_file(vsmp_sysfs_kobj, bin_attr);
> +}
> +EXPORT_SYMBOL_GPL(vsmp_deregister_sysfs_group);
> +
> +/**
> + * generic function to read from the bar
> + */
> +ssize_t vsmp_generic_buff_read(struct fw_ops *op, unsigned bar, unsigned reg,
> +			       char *buf, loff_t off, size_t count)
> +{
> +	ssize_t ret_val = 0;
> +
> +	if (op->buff_offset >= op->hwi_block_size) {	// preform H/W op

	                              is that              perform
?

> +		vsmp_reset_op(op);
> +
> +		if ((ret_val = vsmp_read_buff_from_bar(bar, reg, op->buff,
> +						       op->hwi_block_size, false))) {
> +			printk(KERN_ERR "%s operation failed\n",
> +			       (op->action == FW_READ) ? "read" : "write");
> +		}
> +		op->buff_offset = 0;
> +	}
> +
> +	if (!ret_val) {
> +		ret_val = memory_read_from_buffer(buf, count, &op->buff_offset,
> +						  op->buff, op->hwi_block_size);
> +	}
> +
> +	return ret_val;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_generic_buff_read);
> +
> +void vsmp_reset_op(struct fw_ops *op)
> +{
> +	memset(op->buff, 0, op->hwi_block_size);
> +	op->buff_offset = op->hwi_block_size;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_reset_op);
> +
> +int vsmp_init_op(struct fw_ops *op, ssize_t max_size,
> +		  enum vsmp_fw_action action)
> +{
> +	op->hwi_block_size = max_size;
> +	op->action = action;
> +	op->buff_offset = op->hwi_block_size;
> +
> +	if (!(op->buff = kzalloc(op->hwi_block_size, GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	vsmp_reset_op(op);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_init_op);
> +
> +void vsmp_release_op(struct fw_ops *op)
> +{
> +	BUG_ON(!op->buff);
> +	kfree(op->buff);
> +	memset(op, 0, sizeof(*op));
> +}
> +EXPORT_SYMBOL_GPL(vsmp_release_op);
> +
> +bool vsmp_op_buffer_depleted(struct fw_ops *op)
> +{
> +	return op->buff_offset >= op->hwi_block_size;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_op_buffer_depleted);
> +
> +/* module functions */
> +
> +/**
> + * init the module
> + */
> +static int __init vsmp_api_init(void)
> +{
> +	int ret_val;
> +
> +	parse_vsmp_ctrl_pci_addr();
> +
> +	if (!(ret_val = open_cfg_addr())) {
> +		printk(KERN_INFO "%s [%02x:%02x.%x] up and running\n",
> +		       DRIVER_DESC, vsmp_bus, vsmp_dev, vsmp_func);
> +
> +		if (!(vsmp_sysfs_kobj = kobject_create_and_add("vsmp",
> +								hypervisor_kobj))) {
> +			printk(KERN_ERR
> +			       "failed to create sysfs entry for vSMP pci controller at %x:%x.%x, exiting.\n",
> +			       vsmp_bus, vsmp_dev, vsmp_func);
> +			ret_val = -1;
> +		}
> +	}
> +
> +	return ret_val;
> +}
> +
> +/**
> + * cleanup after the module upon exit
> + */
> +static void __exit vsmp_api_exit(void)
> +{
> +	if (cfg_addr)
> +		iounmap(cfg_addr);
> +
> +	if (vsmp_sysfs_kobj)
> +		kobject_put(vsmp_sysfs_kobj);
> +}
> +
> +module_init(vsmp_api_init);
> +module_exit(vsmp_api_exit);


> diff --git a/drivers/staging/vsmp/common/Kconfig b/drivers/staging/vsmp/common/Kconfig
> new file mode 100644
> index 000000000000..fe0cfeaca1bb
> --- /dev/null
> +++ b/drivers/staging/vsmp/common/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VSMP_COMMON
> +	tristate "vSMP Guest driver common Support"
> +	depends on VSMP
> +	help
> +	  select this feature in order to be able to retrive generic data from the vSMP

	  Select                                     retreive

> +	  VM.
> +	  currently old version is supported.

	  Currently only

> +	  the data can be found under /sys/hypervisor/vsmp

	  The

> +
> +	  If unsure, say N.


> diff --git a/drivers/staging/vsmp/common/common.c b/drivers/staging/vsmp/common/common.c
> new file mode 100644
> index 000000000000..31e6551f2b7f
> --- /dev/null
> +++ b/drivers/staging/vsmp/common/common.c
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP common
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/pci_regs.h>
> +#include <linux/pci.h>
> +#include <linux/kobject.h>
> +#include <linux/kernel.h>
> +
> +#include <asm/io.h>
> +
> +#include "../api.h"
> +#include "common.h"
> +
> +#define DRIVER_LICENSE "GPL"
> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"
> +#define DRIVER_DESC "vSMP common info driver"
> +#define DRIVER_VERSION "0.1"
> +
> +/* modules info */
> +MODULE_LICENSE(DRIVER_LICENSE);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_VERSION(DRIVER_VERSION);
> +
> +static struct sysfs_entry_cbs cbs_arr[] = {
> +	create_entry(version),
> +};
> +
> +/* module functions */
> +
> +/**

/*

(in multiple places)

> + * init the common module
> + */
> +static int __init vsmp_common_info_init(void)
> +{
> +	int ret_val = 0, i;
> +
> +	for (i = 0; (i < ARRAY_SIZE(cbs_arr) && !ret_val); i++) {
> +		if ((ret_val = cbs_arr[i].reg_cb()))
> +			printk(KERN_ERR "failed to init sysfs (%d), exiting.\n",
> +			       ret_val);
> +	}
> +
> +	return -1 * ret_val;
> +}
> +
> +/**
> + * cleanup after the module
> + */
> +static void __exit vsmp_common_info_exit(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(cbs_arr); i++)
> +		cbs_arr[i].dereg_cb();
> +}
> +
> +module_init(vsmp_common_info_init);
> +module_exit(vsmp_common_info_exit);


> diff --git a/drivers/staging/vsmp/common/version.c b/drivers/staging/vsmp/common/version.c
> new file mode 100644
> index 000000000000..35b5a7785e9a
> --- /dev/null
> +++ b/drivers/staging/vsmp/common/version.c
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP version
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/kobject.h>
> +
> +#include "../api.h"
> +#include "../registers.h"
> +
> +#define VERSION_MAX_LEN (1 << 19)

Wow, that's a lot of version info.  What is in it?

> +
> +static struct fw_ops op;
> +
> +static ssize_t version_read(struct file *filp, struct kobject *kobj,
> +			    struct bin_attribute *bin_attr,
> +			    char *buf, loff_t off, size_t count)
> +{
> +	ssize_t ret_val = vsmp_generic_buff_read(&op, 0,
> +						 vsmp_read_reg32_from_cfg(VSMP_VERSION_REG),
> +						 buf, off, count);
> +
> +	if ((ret_val != -ENOMEM) && ((ret_val != -EINVAL)))
> +	    buf[ret_val++] = '\n';
> +
> +	return ret_val;
> +}
> +
> +struct bin_attribute version_raw_attr = __BIN_ATTR(version, FILE_PREM, version_read, NULL, VERSION_MAX_LEN);
> +
> +/**
> + * retrive str in order to determine the proper length.

      retreive

> + * this is the best way to maintain backwards compatibility with all
> + * vSMP versions.
> + */
> +static int get_version_len(void)
> +{
> +	unsigned reg;
> +	char *version_str = kzalloc(VERSION_MAX_LEN, GFP_ATOMIC | __GFP_NOWARN);
> +
> +	if (!version_str)
> +		return -1;
> +
> +	reg = vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);
> +	memset(version_str, 0, VERSION_MAX_LEN);
> +
> +	if (vsmp_read_buff_from_bar(0, reg, version_str, VERSION_MAX_LEN, true)) {
> +		printk(KERN_ERR "failed to read buffer from bar\n");
> +		return -1;
> +	}
> +
> +	version_raw_attr.size = strlen(version_str);
> +	kfree(version_str);
> +
> +	return 0;
> +}
> +
> +/**
> + * register the version sysfs entry
> + */
> +int sysfs_register_version_cb(void)
> +{
> +	if (get_version_len()) {
> +		printk(KERN_ERR "failed to init vSMP version module\n");
> +		return -1;
> +	}
> +
> +	if (!vsmp_init_op(&op, version_raw_attr.size, FW_READ)) {
> +		printk(KERN_ERR "failed to init vSMP version op\n");
> +		return -1;
> +	}
> +
> +	return vsmp_register_sysfs_group(&version_raw_attr);
> +}
> +
> +/**
> + * deregister the version sysfs entry
> + */
> +void sysfs_deregister_version_cb(void)
> +{
> +	vsmp_deregister_sysfs_group(&version_raw_attr);
> +	vsmp_release_op(&op);
> +}
> diff --git a/drivers/staging/vsmp/logs/Kconfig b/drivers/staging/vsmp/logs/Kconfig
> new file mode 100644
> index 000000000000..d41491472bab
> --- /dev/null
> +++ b/drivers/staging/vsmp/logs/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VSMP_LOGS
> +	tristate "vSMP Guest driver logs Support"
> +	depends on VSMP
> +	help
> +	  select this feature in order to be able to retrive logs from the vSMP

	  Select                                     retreive

> +	  VM.
> +	  the data can be found under /sys/hypervisor/logs

	  The

> +
> +	  If unsure, say N.


> diff --git a/drivers/staging/vsmp/logs/active_logs.c b/drivers/staging/vsmp/logs/active_logs.c
> new file mode 100644
> index 000000000000..91492c72cc6f
> --- /dev/null
> +++ b/drivers/staging/vsmp/logs/active_logs.c
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * vSMP logs
> + * Copyright (C) 2022 SAP.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/pci_regs.h>
> +#include <linux/pci.h>
> +#include <linux/kobject.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +
> +#include <asm/io.h>
> +
> +#include "../api.h"
> +#include "../registers.h"
> +
> +#define DRIVER_LICENSE "GPL"
> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"
> +#define DRIVER_DESC "vSMP logs driver"
> +#define DRIVER_VERSION "0.1"
> +
> +#define LOGS_MASK (1 << 0)
> +
> +/* modules info */
> +MODULE_LICENSE(DRIVER_LICENSE);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_VERSION(DRIVER_VERSION);
> +
> +static struct fw_ops op;
> +static unsigned log_start;
> +DEFINE_MUTEX(log_mutex);
> +
> +/* module functions */
> +static ssize_t log_read(struct file *filp, struct kobject *kobj,
> +			struct bin_attribute *bin_attr,
> +			char *buf, loff_t off, size_t count)
> +{
> +	ssize_t ret_val = 0;
> +
> +	if (!op.in_progress) {
> +		if ((ret_val = mutex_lock_interruptible(&log_mutex))) {
> +			printk(KERN_ERR
> +			       "error in atemmpt to lock mutex (%lx)\n",
> +			       ret_val);
> +			return ret_val;
> +		}
> +
> +		vsmp_write_reg16_to_cfg(VSMP_LOGS_CTRL_REG,
> +					vsmp_read_reg16_from_cfg
> +					(VSMP_LOGS_CTRL_REG) | LOGS_MASK);
> +		op.in_progress = true;
> +		vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG, 0);
> +	}
> +
> +	if (vsmp_op_buffer_depleted(&op)) {
> +		if (!(vsmp_read_reg16_from_cfg(VSMP_LOGS_CTRL_REG) & LOGS_MASK)) {
> +			vsmp_reset_op(&op);
> +			op.in_progress = 0;
> +			mutex_unlock(&log_mutex);
> +			return ret_val;
> +		}
> +	}
> +
> +	ret_val = vsmp_generic_buff_read(&op, 1, log_start, buf, off, count);
> +	if (!ret_val || (ret_val == -ENOMEM) || (ret_val == -EINVAL)) {
> +		printk(KERN_ERR "error reading from buffer\n");
> +		mutex_unlock(&log_mutex);
> +		return 0;
> +	}
> +
> +	if (vsmp_op_buffer_depleted(&op)) {
> +		vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG,
> +					~0LL & ~(1LL << 0));
> +	}
> +
> +	return count;
> +}
> +
> +static struct bin_attribute log_raw_attr = __BIN_ATTR(log, FILE_PREM, log_read, NULL, 0);
> +
> +/**

/*

(in multiple places)

> + * init the log module
> + */
> +static int __init vsmp_logs_init(void)
> +{
> +	if (!vsmp_init_op(&op, vsmp_read_reg32_from_cfg(VSMP_LOGS_LEN_REG),
> +							 FW_READ)) {
> +		printk(KERN_ERR "failed to init vSMP log op\n");
> +		return -1;
> +	}
> +
> +	log_start = vsmp_read_reg32_from_cfg(VSMP_LOGS_START_REG);
> +	mutex_init(&log_mutex);
> +
> +	return vsmp_register_sysfs_group(&log_raw_attr);
> +}
> +
> +/**
> + * cleanup after the module
> + */
> +static void __exit vsmp_logs_exit(void)
> +{
> +	vsmp_deregister_sysfs_group(&log_raw_attr);
> +	vsmp_release_op(&op);
> +}
> +
> +module_init(vsmp_logs_init);
> +module_exit(vsmp_logs_exit);


-- 
~Randy
