Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDA7210E
	for <linux-staging@lists.linux.dev>; Mon, 15 Mar 2021 16:08:33 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id v123so16610185vsv.9
        for <linux-staging@lists.linux.dev>; Mon, 15 Mar 2021 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YevggSgmLtDYqUFi5LAbh0zshDLXr4eNglxylCGEYyQ=;
        b=c9gk6G2IY1THK/jaDaB4pWMEIzVd2AwX3UgHENv9kGXDHwusu9N9K8ZX3g+JF7N9VL
         BMCMhMI3SLHH2RVkzDEXihYjbaJL/07/TEErQQeuDU8MgKR339zBeU0te/5gMK0Xf96G
         efLtbH58aaoQkGTxB+s5g8YY1TAJh4rSs8fsRshH5CQV8IG8pmIV9NPmOGcSDEoou17k
         PVy1hA6szMyjwAbaJjoez3zl3ou2vchsvLfyInkcinWkgeNetBGCYXoa/6Stc4YGWm7B
         1injl5nQtqaN2FsBvxH8vIQ16bwATnsprowmUD6Rp0d5HSuljSneBLT1zL+3/mAlxLnx
         k0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YevggSgmLtDYqUFi5LAbh0zshDLXr4eNglxylCGEYyQ=;
        b=JNm2K897k10QJlv/y2TH0BE4XG4oicGTrLBPRwe9yYBljUsXW4lo/kIVLwoYeT+jKw
         cZzwF298U3Ot65MsaA891EhcttujDT/HPWCVO3Y7QQePXJo+Vh6mf+bhQ4BZmmIja7qG
         CNwEvebLoVvqTf+Ld8vnaraUqHpQKQl5nOX0miLrwwmTpWebGDpL29Qp0kE96Ky76+DA
         hTgZZmElsK9hD8zQ8C60nSvgeHiHAkjzHFz+JuTztgXLKMX2QW53NRztnMCxV+P1nO48
         roTrsKD5+6fdn+0nReK3r/stKslCMp2eO4BIQdi0N49c7L7cOu/7BvUf3JNEoXiWSmp2
         n9lg==
X-Gm-Message-State: AOAM533pOvvVJdSNItOatwA+WzchD+7cIeRLPuxNgx/kxso+eCUdzznq
	EZwnXHLwEJzUQmesS1fSQHw4sxgwi0MbNynVNIbKYw==
X-Google-Smtp-Source: ABdhPJxaWW60b/uoGklpINLpGqmIw1/bkl89LfV8Dj75/BrP0u2PM0Q8OGU5mFsSHPGNQesqbcftj+OJegUrpYf1zqE=
X-Received: by 2002:a67:688e:: with SMTP id d136mr5167418vsc.58.1615824510602;
 Mon, 15 Mar 2021 09:08:30 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210315154413.3084149-1-gregkh@linuxfoundation.org>
In-Reply-To: <20210315154413.3084149-1-gregkh@linuxfoundation.org>
From: Rob Springer <rspringer@google.com>
Date: Mon, 15 Mar 2021 09:08:13 -0700
Message-ID: <CALTjKEPOmEGTsgrgyr9BcbJP2UhKM5XBXez01qbJ5S9y7FBOSw@mail.gmail.com>
Subject: Re: [PATCH] staging: gasket: remove it from the kernel
To: gregkh@linuxfoundation.org
Cc: Todd Poynor <toddpoynor@google.com>, Ben Chan <benchan@chromium.org>, 
	Richard Yeh <rcy@google.com>, linux-staging@lists.linux.dev, devel@driverdev.osuosl.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000f9c87b05bd9575f7"

--000000000000f9c87b05bd9575f7
Content-Type: text/plain; charset="UTF-8"

Acked-by: Rob Springer <rspringer@google.com>


On Mon, Mar 15, 2021 at 8:44 AM <gregkh@linuxfoundation.org> wrote:

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> As none of the proposed things that need to be changed in the gasket
> drivers have ever been done, and there has not been any forward progress
> to get this out of staging, it seems totally abandonded so remove the
> code entirely so that people do not spend their time doing tiny cleanups
> for code that will never get out of staging.
>
> If this code is actually being used, it can be reverted simply and then
> cleaned up properly, but as it is abandoned, let's just get rid of it.
>
> Cc: Rob Springer <rspringer@google.com>
> Cc: Todd Poynor <toddpoynor@google.com>
> Cc: Ben Chan <benchan@chromium.org>
> Cc: Richard Yeh <rcy@google.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  MAINTAINERS                                |    8 -
>  drivers/staging/Kconfig                    |    2 -
>  drivers/staging/Makefile                   |    1 -
>  drivers/staging/gasket/Kconfig             |   25 -
>  drivers/staging/gasket/Makefile            |   10 -
>  drivers/staging/gasket/TODO                |   22 -
>  drivers/staging/gasket/apex.h              |   30 -
>  drivers/staging/gasket/apex_driver.c       |  726 --------
>  drivers/staging/gasket/gasket.h            |  122 --
>  drivers/staging/gasket/gasket_constants.h  |   44 -
>  drivers/staging/gasket/gasket_core.c       | 1815 --------------------
>  drivers/staging/gasket/gasket_core.h       |  638 -------
>  drivers/staging/gasket/gasket_interrupt.c  |  515 ------
>  drivers/staging/gasket/gasket_interrupt.h  |   95 -
>  drivers/staging/gasket/gasket_ioctl.c      |  388 -----
>  drivers/staging/gasket/gasket_ioctl.h      |   28 -
>  drivers/staging/gasket/gasket_page_table.c | 1357 ---------------
>  drivers/staging/gasket/gasket_page_table.h |  249 ---
>  drivers/staging/gasket/gasket_sysfs.c      |  398 -----
>  drivers/staging/gasket/gasket_sysfs.h      |  175 --
>  20 files changed, 6648 deletions(-)
>  delete mode 100644 drivers/staging/gasket/Kconfig
>  delete mode 100644 drivers/staging/gasket/Makefile
>  delete mode 100644 drivers/staging/gasket/TODO
>  delete mode 100644 drivers/staging/gasket/apex.h
>  delete mode 100644 drivers/staging/gasket/apex_driver.c
>  delete mode 100644 drivers/staging/gasket/gasket.h
>  delete mode 100644 drivers/staging/gasket/gasket_constants.h
>  delete mode 100644 drivers/staging/gasket/gasket_core.c
>  delete mode 100644 drivers/staging/gasket/gasket_core.h
>  delete mode 100644 drivers/staging/gasket/gasket_interrupt.c
>  delete mode 100644 drivers/staging/gasket/gasket_interrupt.h
>  delete mode 100644 drivers/staging/gasket/gasket_ioctl.c
>  delete mode 100644 drivers/staging/gasket/gasket_ioctl.h
>  delete mode 100644 drivers/staging/gasket/gasket_page_table.c
>  delete mode 100644 drivers/staging/gasket/gasket_page_table.h
>  delete mode 100644 drivers/staging/gasket/gasket_sysfs.c
>  delete mode 100644 drivers/staging/gasket/gasket_sysfs.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa84121c5611..392647241626 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7385,14 +7385,6 @@ F:       Documentation/hwmon/gsc-hwmon.rst
>  F:     drivers/hwmon/gsc-hwmon.c
>  F:     include/linux/platform_data/gsc_hwmon.h
>
> -GASKET DRIVER FRAMEWORK
> -M:     Rob Springer <rspringer@google.com>
> -M:     Todd Poynor <toddpoynor@google.com>
> -M:     Ben Chan <benchan@chromium.org>
> -M:     Richard Yeh <rcy@google.com>
> -S:     Maintained
> -F:     drivers/staging/gasket/
> -
>  GCC PLUGINS
>  M:     Kees Cook <keescook@chromium.org>
>  L:     linux-hardening@vger.kernel.org
> diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
> index b22f73d7bfc4..efddc50c81f9 100644
> --- a/drivers/staging/Kconfig
> +++ b/drivers/staging/Kconfig
> @@ -98,8 +98,6 @@ source "drivers/staging/ralink-gdma/Kconfig"
>
>  source "drivers/staging/mt7621-dts/Kconfig"
>
> -source "drivers/staging/gasket/Kconfig"
> -
>  source "drivers/staging/axis-fifo/Kconfig"
>
>  source "drivers/staging/fieldbus/Kconfig"
> diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
> index 2245059e69c7..e2e95a20081a 100644
> --- a/drivers/staging/Makefile
> +++ b/drivers/staging/Makefile
> @@ -39,7 +39,6 @@ obj-$(CONFIG_PCI_MT7621)      += mt7621-pci/
>  obj-$(CONFIG_SOC_MT7621)       += mt7621-dma/
>  obj-$(CONFIG_DMA_RALINK)       += ralink-gdma/
>  obj-$(CONFIG_SOC_MT7621)       += mt7621-dts/
> -obj-$(CONFIG_STAGING_GASKET_FRAMEWORK) += gasket/
>  obj-$(CONFIG_XIL_AXIS_FIFO)    += axis-fifo/
>  obj-$(CONFIG_FIELDBUS_DEV)     += fieldbus/
>  obj-$(CONFIG_KPC2000)          += kpc2000/
> diff --git a/drivers/staging/gasket/Kconfig
> b/drivers/staging/gasket/Kconfig
> deleted file mode 100644
> index d9bef8ca41ef..000000000000
> --- a/drivers/staging/gasket/Kconfig
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -menu "Gasket devices"
> -
> -config STAGING_GASKET_FRAMEWORK
> -       tristate "Gasket framework"
> -       depends on PCI && (X86_64 || ARM64)
> -       help
> -         This framework supports Gasket-compatible devices, such as Apex.
> -         It is required for any of the following module(s).
> -
> -         To compile this driver as a module, choose M here.  The module
> -         will be called "gasket".
> -
> -config STAGING_APEX_DRIVER
> -       tristate "Apex Driver"
> -       depends on STAGING_GASKET_FRAMEWORK
> -       help
> -         This driver supports the Apex Edge TPU device.  See
> -         https://cloud.google.com/edge-tpu/ for more information.
> -         Say Y if you want to include this driver in the kernel.
> -
> -         To compile this driver as a module, choose M here.  The module
> -         will be called "apex".
> -
> -endmenu
> diff --git a/drivers/staging/gasket/Makefile
> b/drivers/staging/gasket/Makefile
> deleted file mode 100644
> index ce03e256f501..000000000000
> --- a/drivers/staging/gasket/Makefile
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -#  Makefile for Gasket framework and dependent drivers.
> -#
> -
> -obj-$(CONFIG_STAGING_GASKET_FRAMEWORK) += gasket.o
> -obj-$(CONFIG_STAGING_APEX_DRIVER)      += apex.o
> -
> -gasket-objs    := gasket_core.o gasket_ioctl.o gasket_interrupt.o
> gasket_page_table.o gasket_sysfs.o
> -apex-objs      := apex_driver.o
> diff --git a/drivers/staging/gasket/TODO b/drivers/staging/gasket/TODO
> deleted file mode 100644
> index 5b1865f8af2d..000000000000
> --- a/drivers/staging/gasket/TODO
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -This is a list of things that need to be done to get this driver out of
> the
> -staging directory.
> -
> -- Implement the gasket framework's functionality through UIO instead of
> -  introducing a new user-space drivers framework that is quite similar.
> -
> -  UIO provides the necessary bits to implement user-space drivers.
> Meanwhile
> -  the gasket APIs adds some extra conveniences like PCI BAR mapping, and
> -  MSI interrupts. Add these features to the UIO subsystem, then
> re-implement
> -  the Apex driver as a basic UIO driver instead
> (include/linux/uio_driver.h)
> -
> -- Document sysfs files with Documentation/ABI/ entries.
> -
> -- Use misc interface instead of major number for driver version
> description.
> -
> -- Add descriptions of module_param's
> -
> -- apex_get_status() should actually check status.
> -
> -- "drivers" should never be dealing with "raw" sysfs calls or mess around
> with
> -  kobjects at all. The driver core should handle all of this for you
> -  automaically. There should not be a need for raw attribute macros.
> diff --git a/drivers/staging/gasket/apex.h b/drivers/staging/gasket/apex.h
> deleted file mode 100644
> index 3bbceffff5e4..000000000000
> --- a/drivers/staging/gasket/apex.h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Apex kernel-userspace interface definitions.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -#ifndef __APEX_H__
> -#define __APEX_H__
> -
> -#include <linux/ioctl.h>
> -
> -/* Clock Gating ioctl. */
> -struct apex_gate_clock_ioctl {
> -       /* Enter or leave clock gated state. */
> -       u64 enable;
> -
> -       /* If set, enter clock gating state, regardless of custom block's
> -        * internal idle state
> -        */
> -       u64 force_idle;
> -};
> -
> -/* Base number for all Apex-common IOCTLs */
> -#define APEX_IOCTL_BASE 0x7F
> -
> -/* Enable/Disable clock gating. */
> -#define APEX_IOCTL_GATE_CLOCK
>       \
> -       _IOW(APEX_IOCTL_BASE, 0, struct apex_gate_clock_ioctl)
> -
> -#endif /* __APEX_H__ */
> diff --git a/drivers/staging/gasket/apex_driver.c
> b/drivers/staging/gasket/apex_driver.c
> deleted file mode 100644
> index f12f81c8dd2f..000000000000
> --- a/drivers/staging/gasket/apex_driver.c
> +++ /dev/null
> @@ -1,726 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Driver for the Apex chip.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -
> -#include <linux/compiler.h>
> -#include <linux/delay.h>
> -#include <linux/device.h>
> -#include <linux/fs.h>
> -#include <linux/init.h>
> -#include <linux/mm.h>
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/pci.h>
> -#include <linux/printk.h>
> -#include <linux/sched.h>
> -#include <linux/uaccess.h>
> -
> -#include "apex.h"
> -
> -#include "gasket_core.h"
> -#include "gasket_interrupt.h"
> -#include "gasket_page_table.h"
> -#include "gasket_sysfs.h"
> -
> -/* Constants */
> -#define APEX_DEVICE_NAME "Apex"
> -#define APEX_DRIVER_VERSION "1.0"
> -
> -/* CSRs are in BAR 2. */
> -#define APEX_BAR_INDEX 2
> -
> -#define APEX_PCI_VENDOR_ID 0x1ac1
> -#define APEX_PCI_DEVICE_ID 0x089a
> -
> -/* Bar Offsets. */
> -#define APEX_BAR_OFFSET 0
> -#define APEX_CM_OFFSET 0x1000000
> -
> -/* The sizes of each Apex BAR 2. */
> -#define APEX_BAR_BYTES 0x100000
> -#define APEX_CH_MEM_BYTES (PAGE_SIZE * MAX_NUM_COHERENT_PAGES)
> -
> -/* The number of user-mappable memory ranges in BAR2 of a Apex chip. */
> -#define NUM_REGIONS 3
> -
> -/* The number of nodes in a Apex chip. */
> -#define NUM_NODES 1
> -
> -/*
> - * The total number of entries in the page table. Should match the value
> read
> - * from the register APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE_SIZE.
> - */
> -#define APEX_PAGE_TABLE_TOTAL_ENTRIES 8192
> -
> -#define APEX_EXTENDED_SHIFT 63 /* Extended address bit position. */
> -
> -/* Check reset 120 times */
> -#define APEX_RESET_RETRY 120
> -/* Wait 100 ms between checks. Total 12 sec wait maximum. */
> -#define APEX_RESET_DELAY 100
> -
> -/* Enumeration of the supported sysfs entries. */
> -enum sysfs_attribute_type {
> -       ATTR_KERNEL_HIB_PAGE_TABLE_SIZE,
> -       ATTR_KERNEL_HIB_SIMPLE_PAGE_TABLE_SIZE,
> -       ATTR_KERNEL_HIB_NUM_ACTIVE_PAGES,
> -};
> -
> -/*
> - * Register offsets into BAR2 memory.
> - * Only values necessary for driver implementation are defined.
> - */
> -enum apex_bar2_regs {
> -       APEX_BAR2_REG_SCU_BASE = 0x1A300,
> -       APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE_SIZE = 0x46000,
> -       APEX_BAR2_REG_KERNEL_HIB_EXTENDED_TABLE = 0x46008,
> -       APEX_BAR2_REG_KERNEL_HIB_TRANSLATION_ENABLE = 0x46010,
> -       APEX_BAR2_REG_KERNEL_HIB_INSTR_QUEUE_INTVECCTL = 0x46018,
> -       APEX_BAR2_REG_KERNEL_HIB_INPUT_ACTV_QUEUE_INTVECCTL = 0x46020,
> -       APEX_BAR2_REG_KERNEL_HIB_PARAM_QUEUE_INTVECCTL = 0x46028,
> -       APEX_BAR2_REG_KERNEL_HIB_OUTPUT_ACTV_QUEUE_INTVECCTL = 0x46030,
> -       APEX_BAR2_REG_KERNEL_HIB_SC_HOST_INTVECCTL = 0x46038,
> -       APEX_BAR2_REG_KERNEL_HIB_TOP_LEVEL_INTVECCTL = 0x46040,
> -       APEX_BAR2_REG_KERNEL_HIB_FATAL_ERR_INTVECCTL = 0x46048,
> -       APEX_BAR2_REG_KERNEL_HIB_DMA_PAUSE = 0x46050,
> -       APEX_BAR2_REG_KERNEL_HIB_DMA_PAUSE_MASK = 0x46058,
> -       APEX_BAR2_REG_KERNEL_HIB_STATUS_BLOCK_DELAY = 0x46060,
> -       APEX_BAR2_REG_KERNEL_HIB_MSIX_PENDING_BIT_ARRAY0 = 0x46068,
> -       APEX_BAR2_REG_KERNEL_HIB_MSIX_PENDING_BIT_ARRAY1 = 0x46070,
> -       APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE_INIT = 0x46078,
> -       APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE_INIT = 0x46080,
> -       APEX_BAR2_REG_KERNEL_WIRE_INT_PENDING_BIT_ARRAY = 0x48778,
> -       APEX_BAR2_REG_KERNEL_WIRE_INT_MASK_ARRAY = 0x48780,
> -       APEX_BAR2_REG_USER_HIB_DMA_PAUSE = 0x486D8,
> -       APEX_BAR2_REG_USER_HIB_DMA_PAUSED = 0x486E0,
> -       APEX_BAR2_REG_IDLEGENERATOR_IDLEGEN_IDLEREGISTER = 0x4A000,
> -       APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE = 0x50000,
> -
> -       /* Error registers - Used mostly for debug */
> -       APEX_BAR2_REG_USER_HIB_ERROR_STATUS = 0x86f0,
> -       APEX_BAR2_REG_SCALAR_CORE_ERROR_STATUS = 0x41a0,
> -};
> -
> -/* Addresses for packed registers. */
> -#define APEX_BAR2_REG_AXI_QUIESCE (APEX_BAR2_REG_SCU_BASE + 0x2C)
> -#define APEX_BAR2_REG_GCB_CLOCK_GATE (APEX_BAR2_REG_SCU_BASE + 0x14)
> -#define APEX_BAR2_REG_SCU_0 (APEX_BAR2_REG_SCU_BASE + 0xc)
> -#define APEX_BAR2_REG_SCU_1 (APEX_BAR2_REG_SCU_BASE + 0x10)
> -#define APEX_BAR2_REG_SCU_2 (APEX_BAR2_REG_SCU_BASE + 0x14)
> -#define APEX_BAR2_REG_SCU_3 (APEX_BAR2_REG_SCU_BASE + 0x18)
> -#define APEX_BAR2_REG_SCU_4 (APEX_BAR2_REG_SCU_BASE + 0x1c)
> -#define APEX_BAR2_REG_SCU_5 (APEX_BAR2_REG_SCU_BASE + 0x20)
> -
> -#define SCU3_RG_PWR_STATE_OVR_BIT_OFFSET 26
> -#define SCU3_RG_PWR_STATE_OVR_MASK_WIDTH 2
> -#define SCU3_CUR_RST_GCB_BIT_MASK 0x10
> -#define SCU2_RG_RST_GCB_BIT_MASK 0xc
> -
> -/* Configuration for page table. */
> -static struct gasket_page_table_config apex_page_table_configs[NUM_NODES]
> = {
> -       {
> -               .id = 0,
> -               .mode = GASKET_PAGE_TABLE_MODE_NORMAL,
> -               .total_entries = APEX_PAGE_TABLE_TOTAL_ENTRIES,
> -               .base_reg = APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE,
> -               .extended_reg = APEX_BAR2_REG_KERNEL_HIB_EXTENDED_TABLE,
> -               .extended_bit = APEX_EXTENDED_SHIFT,
> -       },
> -};
> -
> -/* The regions in the BAR2 space that can be mapped into user space. */
> -static const struct gasket_mappable_region mappable_regions[NUM_REGIONS]
> = {
> -       { 0x40000, 0x1000 },
> -       { 0x44000, 0x1000 },
> -       { 0x48000, 0x1000 },
> -};
> -
> -/* Gasket device interrupts enums must be dense (i.e., no empty slots). */
> -enum apex_interrupt {
> -       APEX_INTERRUPT_INSTR_QUEUE = 0,
> -       APEX_INTERRUPT_INPUT_ACTV_QUEUE = 1,
> -       APEX_INTERRUPT_PARAM_QUEUE = 2,
> -       APEX_INTERRUPT_OUTPUT_ACTV_QUEUE = 3,
> -       APEX_INTERRUPT_SC_HOST_0 = 4,
> -       APEX_INTERRUPT_SC_HOST_1 = 5,
> -       APEX_INTERRUPT_SC_HOST_2 = 6,
> -       APEX_INTERRUPT_SC_HOST_3 = 7,
> -       APEX_INTERRUPT_TOP_LEVEL_0 = 8,
> -       APEX_INTERRUPT_TOP_LEVEL_1 = 9,
> -       APEX_INTERRUPT_TOP_LEVEL_2 = 10,
> -       APEX_INTERRUPT_TOP_LEVEL_3 = 11,
> -       APEX_INTERRUPT_FATAL_ERR = 12,
> -       APEX_INTERRUPT_COUNT = 13,
> -};
> -
> -/* Interrupt descriptors for Apex */
> -static struct gasket_interrupt_desc apex_interrupts[] = {
> -       {
> -               APEX_INTERRUPT_INSTR_QUEUE,
> -               APEX_BAR2_REG_KERNEL_HIB_INSTR_QUEUE_INTVECCTL,
> -               UNPACKED,
> -       },
> -       {
> -               APEX_INTERRUPT_INPUT_ACTV_QUEUE,
> -               APEX_BAR2_REG_KERNEL_HIB_INPUT_ACTV_QUEUE_INTVECCTL,
> -               UNPACKED
> -       },
> -       {
> -               APEX_INTERRUPT_PARAM_QUEUE,
> -               APEX_BAR2_REG_KERNEL_HIB_PARAM_QUEUE_INTVECCTL,
> -               UNPACKED
> -       },
> -       {
> -               APEX_INTERRUPT_OUTPUT_ACTV_QUEUE,
> -               APEX_BAR2_REG_KERNEL_HIB_OUTPUT_ACTV_QUEUE_INTVECCTL,
> -               UNPACKED
> -       },
> -       {
> -               APEX_INTERRUPT_SC_HOST_0,
> -               APEX_BAR2_REG_KERNEL_HIB_SC_HOST_INTVECCTL,
> -               PACK_0
> -       },
> -       {
> -               APEX_INTERRUPT_SC_HOST_1,
> -               APEX_BAR2_REG_KERNEL_HIB_SC_HOST_INTVECCTL,
> -               PACK_1
> -       },
> -       {
> -               APEX_INTERRUPT_SC_HOST_2,
> -               APEX_BAR2_REG_KERNEL_HIB_SC_HOST_INTVECCTL,
> -               PACK_2
> -       },
> -       {
> -               APEX_INTERRUPT_SC_HOST_3,
> -               APEX_BAR2_REG_KERNEL_HIB_SC_HOST_INTVECCTL,
> -               PACK_3
> -       },
> -       {
> -               APEX_INTERRUPT_TOP_LEVEL_0,
> -               APEX_BAR2_REG_KERNEL_HIB_TOP_LEVEL_INTVECCTL,
> -               PACK_0
> -       },
> -       {
> -               APEX_INTERRUPT_TOP_LEVEL_1,
> -               APEX_BAR2_REG_KERNEL_HIB_TOP_LEVEL_INTVECCTL,
> -               PACK_1
> -       },
> -       {
> -               APEX_INTERRUPT_TOP_LEVEL_2,
> -               APEX_BAR2_REG_KERNEL_HIB_TOP_LEVEL_INTVECCTL,
> -               PACK_2
> -       },
> -       {
> -               APEX_INTERRUPT_TOP_LEVEL_3,
> -               APEX_BAR2_REG_KERNEL_HIB_TOP_LEVEL_INTVECCTL,
> -               PACK_3
> -       },
> -       {
> -               APEX_INTERRUPT_FATAL_ERR,
> -               APEX_BAR2_REG_KERNEL_HIB_FATAL_ERR_INTVECCTL,
> -               UNPACKED
> -       },
> -};
> -
> -/* Allows device to enter power save upon driver close(). */
> -static int allow_power_save = 1;
> -
> -/* Allows SW based clock gating. */
> -static int allow_sw_clock_gating;
> -
> -/* Allows HW based clock gating. */
> -/* Note: this is not mutual exclusive with SW clock gating. */
> -static int allow_hw_clock_gating = 1;
> -
> -/* Act as if only GCB is instantiated. */
> -static int bypass_top_level;
> -
> -module_param(allow_power_save, int, 0644);
> -module_param(allow_sw_clock_gating, int, 0644);
> -module_param(allow_hw_clock_gating, int, 0644);
> -module_param(bypass_top_level, int, 0644);
> -
> -/* Check the device status registers and return device status ALIVE or
> DEAD. */
> -static int apex_get_status(struct gasket_dev *gasket_dev)
> -{
> -       /* TODO: Check device status. */
> -       return GASKET_STATUS_ALIVE;
> -}
> -
> -/* Enter GCB reset state. */
> -static int apex_enter_reset(struct gasket_dev *gasket_dev)
> -{
> -       if (bypass_top_level)
> -               return 0;
> -
> -       /*
> -        * Software reset:
> -        * Enable sleep mode
> -        *  - Software force GCB idle
> -        *    - Enable GCB idle
> -        */
> -       gasket_read_modify_write_64(gasket_dev, APEX_BAR_INDEX,
> -
>  APEX_BAR2_REG_IDLEGENERATOR_IDLEGEN_IDLEREGISTER,
> -                                   0x0, 1, 32);
> -
> -       /*    - Initiate DMA pause */
> -       gasket_dev_write_64(gasket_dev, 1, APEX_BAR_INDEX,
> -                           APEX_BAR2_REG_USER_HIB_DMA_PAUSE);
> -
> -       /*    - Wait for DMA pause complete. */
> -       if (gasket_wait_with_reschedule(gasket_dev, APEX_BAR_INDEX,
> -                                       APEX_BAR2_REG_USER_HIB_DMA_PAUSED,
> 1, 1,
> -                                       APEX_RESET_DELAY,
> APEX_RESET_RETRY)) {
> -               dev_err(gasket_dev->dev,
> -                       "DMAs did not quiesce within timeout (%d ms)\n",
> -                       APEX_RESET_RETRY * APEX_RESET_DELAY);
> -               return -ETIMEDOUT;
> -       }
> -
> -       /*  - Enable GCB reset (0x1 to rg_rst_gcb) */
> -       gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                   APEX_BAR2_REG_SCU_2, 0x1, 2, 2);
> -
> -       /*  - Enable GCB clock Gate (0x1 to rg_gated_gcb) */
> -       gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                   APEX_BAR2_REG_SCU_2, 0x1, 2, 18);
> -
> -       /*  - Enable GCB memory shut down (0x3 to rg_force_ram_sd) */
> -       gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                   APEX_BAR2_REG_SCU_3, 0x3, 2, 14);
> -
> -       /*    - Wait for RAM shutdown. */
> -       if (gasket_wait_with_reschedule(gasket_dev, APEX_BAR_INDEX,
> -                                       APEX_BAR2_REG_SCU_3, BIT(6),
> BIT(6),
> -                                       APEX_RESET_DELAY,
> APEX_RESET_RETRY)) {
> -               dev_err(gasket_dev->dev,
> -                       "RAM did not shut down within timeout (%d ms)\n",
> -                       APEX_RESET_RETRY * APEX_RESET_DELAY);
> -               return -ETIMEDOUT;
> -       }
> -
> -       return 0;
> -}
> -
> -/* Quit GCB reset state. */
> -static int apex_quit_reset(struct gasket_dev *gasket_dev)
> -{
> -       u32 val0, val1;
> -
> -       if (bypass_top_level)
> -               return 0;
> -
> -       /*
> -        * Disable sleep mode:
> -        *  - Disable GCB memory shut down:
> -        *    - b00: Not forced (HW controlled)
> -        *    - b1x: Force disable
> -        */
> -       gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                   APEX_BAR2_REG_SCU_3, 0x0, 2, 14);
> -
> -       /*
> -        *  - Disable software clock gate:
> -        *    - b00: Not forced (HW controlled)
> -        *    - b1x: Force disable
> -        */
> -       gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                   APEX_BAR2_REG_SCU_2, 0x0, 2, 18);
> -
> -       /*
> -        *  - Disable GCB reset (rg_rst_gcb):
> -        *    - b00: Not forced (HW controlled)
> -        *    - b1x: Force disable = Force not Reset
> -        */
> -       gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                   APEX_BAR2_REG_SCU_2, 0x2, 2, 2);
> -
> -       /*    - Wait for RAM enable. */
> -       if (gasket_wait_with_reschedule(gasket_dev, APEX_BAR_INDEX,
> -                                       APEX_BAR2_REG_SCU_3, BIT(6), 0,
> -                                       APEX_RESET_DELAY,
> APEX_RESET_RETRY)) {
> -               dev_err(gasket_dev->dev,
> -                       "RAM did not enable within timeout (%d ms)\n",
> -                       APEX_RESET_RETRY * APEX_RESET_DELAY);
> -               return -ETIMEDOUT;
> -       }
> -
> -       /*    - Wait for Reset complete. */
> -       if (gasket_wait_with_reschedule(gasket_dev, APEX_BAR_INDEX,
> -                                       APEX_BAR2_REG_SCU_3,
> -                                       SCU3_CUR_RST_GCB_BIT_MASK, 0,
> -                                       APEX_RESET_DELAY,
> APEX_RESET_RETRY)) {
> -               dev_err(gasket_dev->dev,
> -                       "GCB did not leave reset within timeout (%d ms)\n",
> -                       APEX_RESET_RETRY * APEX_RESET_DELAY);
> -               return -ETIMEDOUT;
> -       }
> -
> -       if (!allow_hw_clock_gating) {
> -               val0 = gasket_dev_read_32(gasket_dev, APEX_BAR_INDEX,
> -                                         APEX_BAR2_REG_SCU_3);
> -               /* Inactive and Sleep mode are disabled. */
> -               gasket_read_modify_write_32(gasket_dev,
> -                                           APEX_BAR_INDEX,
> -                                           APEX_BAR2_REG_SCU_3, 0x3,
> -
>  SCU3_RG_PWR_STATE_OVR_MASK_WIDTH,
> -
>  SCU3_RG_PWR_STATE_OVR_BIT_OFFSET);
> -               val1 = gasket_dev_read_32(gasket_dev, APEX_BAR_INDEX,
> -                                         APEX_BAR2_REG_SCU_3);
> -               dev_dbg(gasket_dev->dev,
> -                       "Disallow HW clock gating 0x%x -> 0x%x\n", val0,
> val1);
> -       } else {
> -               val0 = gasket_dev_read_32(gasket_dev, APEX_BAR_INDEX,
> -                                         APEX_BAR2_REG_SCU_3);
> -               /* Inactive mode enabled - Sleep mode disabled. */
> -               gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                           APEX_BAR2_REG_SCU_3, 2,
> -
>  SCU3_RG_PWR_STATE_OVR_MASK_WIDTH,
> -
>  SCU3_RG_PWR_STATE_OVR_BIT_OFFSET);
> -               val1 = gasket_dev_read_32(gasket_dev, APEX_BAR_INDEX,
> -                                         APEX_BAR2_REG_SCU_3);
> -               dev_dbg(gasket_dev->dev, "Allow HW clock gating 0x%x ->
> 0x%x\n",
> -                       val0, val1);
> -       }
> -
> -       return 0;
> -}
> -
> -/* Reset the Apex hardware. Called on final close via device_close_cb. */
> -static int apex_device_cleanup(struct gasket_dev *gasket_dev)
> -{
> -       u64 scalar_error;
> -       u64 hib_error;
> -       int ret = 0;
> -
> -       hib_error = gasket_dev_read_64(gasket_dev, APEX_BAR_INDEX,
> -
> APEX_BAR2_REG_USER_HIB_ERROR_STATUS);
> -       scalar_error = gasket_dev_read_64(gasket_dev, APEX_BAR_INDEX,
> -
>  APEX_BAR2_REG_SCALAR_CORE_ERROR_STATUS);
> -
> -       dev_dbg(gasket_dev->dev,
> -               "%s 0x%p hib_error 0x%llx scalar_error 0x%llx\n",
> -               __func__, gasket_dev, hib_error, scalar_error);
> -
> -       if (allow_power_save)
> -               ret = apex_enter_reset(gasket_dev);
> -
> -       return ret;
> -}
> -
> -/* Determine if GCB is in reset state. */
> -static bool is_gcb_in_reset(struct gasket_dev *gasket_dev)
> -{
> -       u32 val = gasket_dev_read_32(gasket_dev, APEX_BAR_INDEX,
> -                                    APEX_BAR2_REG_SCU_3);
> -
> -       /* Masks rg_rst_gcb bit of SCU_CTRL_2 */
> -       return (val & SCU3_CUR_RST_GCB_BIT_MASK);
> -}
> -
> -/* Reset the hardware, then quit reset.  Called on device open. */
> -static int apex_reset(struct gasket_dev *gasket_dev)
> -{
> -       int ret;
> -
> -       if (bypass_top_level)
> -               return 0;
> -
> -       if (!is_gcb_in_reset(gasket_dev)) {
> -               /* We are not in reset - toggle the reset bit so as to
> force
> -                * re-init of custom block
> -                */
> -               dev_dbg(gasket_dev->dev, "%s: toggle reset\n", __func__);
> -
> -               ret = apex_enter_reset(gasket_dev);
> -               if (ret)
> -                       return ret;
> -       }
> -       return apex_quit_reset(gasket_dev);
> -}
> -
> -/*
> - * Check permissions for Apex ioctls.
> - * Returns true if the current user may execute this ioctl, and false
> otherwise.
> - */
> -static bool apex_ioctl_check_permissions(struct file *filp, uint cmd)
> -{
> -       return !!(filp->f_mode & FMODE_WRITE);
> -}
> -
> -/* Gates or un-gates Apex clock. */
> -static long apex_clock_gating(struct gasket_dev *gasket_dev,
> -                             struct apex_gate_clock_ioctl __user *argp)
> -{
> -       struct apex_gate_clock_ioctl ibuf;
> -
> -       if (bypass_top_level || !allow_sw_clock_gating)
> -               return 0;
> -
> -       if (copy_from_user(&ibuf, argp, sizeof(ibuf)))
> -               return -EFAULT;
> -
> -       dev_dbg(gasket_dev->dev, "%s %llu\n", __func__, ibuf.enable);
> -
> -       if (ibuf.enable) {
> -               /* Quiesce AXI, gate GCB clock. */
> -               gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                           APEX_BAR2_REG_AXI_QUIESCE,
> 0x1, 1,
> -                                           16);
> -               gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                           APEX_BAR2_REG_GCB_CLOCK_GATE,
> 0x1,
> -                                           2, 18);
> -       } else {
> -               /* Un-gate GCB clock, un-quiesce AXI. */
> -               gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                           APEX_BAR2_REG_GCB_CLOCK_GATE,
> 0x0,
> -                                           2, 18);
> -               gasket_read_modify_write_32(gasket_dev, APEX_BAR_INDEX,
> -                                           APEX_BAR2_REG_AXI_QUIESCE,
> 0x0, 1,
> -                                           16);
> -       }
> -       return 0;
> -}
> -
> -/* Apex-specific ioctl handler. */
> -static long apex_ioctl(struct file *filp, uint cmd, void __user *argp)
> -{
> -       struct gasket_dev *gasket_dev = filp->private_data;
> -
> -       if (!apex_ioctl_check_permissions(filp, cmd))
> -               return -EPERM;
> -
> -       switch (cmd) {
> -       case APEX_IOCTL_GATE_CLOCK:
> -               return apex_clock_gating(gasket_dev, argp);
> -       default:
> -               return -ENOTTY; /* unknown command */
> -       }
> -}
> -
> -/* Display driver sysfs entries. */
> -static ssize_t sysfs_show(struct device *device, struct device_attribute
> *attr,
> -                         char *buf)
> -{
> -       int ret;
> -       struct gasket_dev *gasket_dev;
> -       struct gasket_sysfs_attribute *gasket_attr;
> -       enum sysfs_attribute_type type;
> -       struct gasket_page_table *gpt;
> -       uint val;
> -
> -       gasket_dev = gasket_sysfs_get_device_data(device);
> -       if (!gasket_dev) {
> -               dev_err(device, "No Apex device sysfs mapping found\n");
> -               return -ENODEV;
> -       }
> -
> -       gasket_attr = gasket_sysfs_get_attr(device, attr);
> -       if (!gasket_attr) {
> -               dev_err(device, "No Apex device sysfs attr data found\n");
> -               gasket_sysfs_put_device_data(device, gasket_dev);
> -               return -ENODEV;
> -       }
> -
> -       type = (enum sysfs_attribute_type)gasket_attr->data.attr_type;
> -       gpt = gasket_dev->page_table[0];
> -       switch (type) {
> -       case ATTR_KERNEL_HIB_PAGE_TABLE_SIZE:
> -               val = gasket_page_table_num_entries(gpt);
> -               break;
> -       case ATTR_KERNEL_HIB_SIMPLE_PAGE_TABLE_SIZE:
> -               val = gasket_page_table_num_simple_entries(gpt);
> -               break;
> -       case ATTR_KERNEL_HIB_NUM_ACTIVE_PAGES:
> -               val = gasket_page_table_num_active_pages(gpt);
> -               break;
> -       default:
> -               dev_dbg(gasket_dev->dev, "Unknown attribute: %s\n",
> -                       attr->attr.name);
> -               ret = 0;
> -               goto exit;
> -       }
> -       ret = scnprintf(buf, PAGE_SIZE, "%u\n", val);
> -exit:
> -       gasket_sysfs_put_attr(device, gasket_attr);
> -       gasket_sysfs_put_device_data(device, gasket_dev);
> -       return ret;
> -}
> -
> -static struct gasket_sysfs_attribute apex_sysfs_attrs[] = {
> -       GASKET_SYSFS_RO(node_0_page_table_entries, sysfs_show,
> -                       ATTR_KERNEL_HIB_PAGE_TABLE_SIZE),
> -       GASKET_SYSFS_RO(node_0_simple_page_table_entries, sysfs_show,
> -                       ATTR_KERNEL_HIB_SIMPLE_PAGE_TABLE_SIZE),
> -       GASKET_SYSFS_RO(node_0_num_mapped_pages, sysfs_show,
> -                       ATTR_KERNEL_HIB_NUM_ACTIVE_PAGES),
> -       GASKET_END_OF_ATTR_ARRAY
> -};
> -
> -/* On device open, perform a core reinit reset. */
> -static int apex_device_open_cb(struct gasket_dev *gasket_dev)
> -{
> -       return gasket_reset_nolock(gasket_dev);
> -}
> -
> -static const struct pci_device_id apex_pci_ids[] = {
> -       { PCI_DEVICE(APEX_PCI_VENDOR_ID, APEX_PCI_DEVICE_ID) }, { 0 }
> -};
> -
> -static int apex_pci_probe(struct pci_dev *pci_dev,
> -                         const struct pci_device_id *id)
> -{
> -       int ret;
> -       ulong page_table_ready, msix_table_ready;
> -       int retries = 0;
> -       struct gasket_dev *gasket_dev;
> -
> -       ret = pci_enable_device(pci_dev);
> -       if (ret) {
> -               dev_err(&pci_dev->dev, "error enabling PCI device\n");
> -               return ret;
> -       }
> -
> -       pci_set_master(pci_dev);
> -
> -       ret = gasket_pci_add_device(pci_dev, &gasket_dev);
> -       if (ret) {
> -               dev_err(&pci_dev->dev, "error adding gasket device\n");
> -               pci_disable_device(pci_dev);
> -               return ret;
> -       }
> -
> -       pci_set_drvdata(pci_dev, gasket_dev);
> -       apex_reset(gasket_dev);
> -
> -       while (retries < APEX_RESET_RETRY) {
> -               page_table_ready =
> -                       gasket_dev_read_64(gasket_dev, APEX_BAR_INDEX,
> -
> APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE_INIT);
> -               msix_table_ready =
> -                       gasket_dev_read_64(gasket_dev, APEX_BAR_INDEX,
> -
> APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE_INIT);
> -               if (page_table_ready && msix_table_ready)
> -                       break;
> -               schedule_timeout(msecs_to_jiffies(APEX_RESET_DELAY));
> -               retries++;
> -       }
> -
> -       if (retries == APEX_RESET_RETRY) {
> -               if (!page_table_ready)
> -                       dev_err(gasket_dev->dev, "Page table init timed
> out\n");
> -               if (!msix_table_ready)
> -                       dev_err(gasket_dev->dev, "MSI-X table init timed
> out\n");
> -               ret = -ETIMEDOUT;
> -               goto remove_device;
> -       }
> -
> -       ret = gasket_sysfs_create_entries(gasket_dev->dev_info.device,
> -                                         apex_sysfs_attrs);
> -       if (ret)
> -               dev_err(&pci_dev->dev, "error creating device sysfs
> entries\n");
> -
> -       ret = gasket_enable_device(gasket_dev);
> -       if (ret) {
> -               dev_err(&pci_dev->dev, "error enabling gasket device\n");
> -               goto remove_device;
> -       }
> -
> -       /* Place device in low power mode until opened */
> -       if (allow_power_save)
> -               apex_enter_reset(gasket_dev);
> -
> -       return 0;
> -
> -remove_device:
> -       gasket_pci_remove_device(pci_dev);
> -       pci_disable_device(pci_dev);
> -       return ret;
> -}
> -
> -static void apex_pci_remove(struct pci_dev *pci_dev)
> -{
> -       struct gasket_dev *gasket_dev = pci_get_drvdata(pci_dev);
> -
> -       gasket_disable_device(gasket_dev);
> -       gasket_pci_remove_device(pci_dev);
> -       pci_disable_device(pci_dev);
> -}
> -
> -static const struct gasket_driver_desc apex_desc = {
> -       .name = "apex",
> -       .driver_version = APEX_DRIVER_VERSION,
> -       .major = 120,
> -       .minor = 0,
> -       .module = THIS_MODULE,
> -       .pci_id_table = apex_pci_ids,
> -
> -       .num_page_tables = NUM_NODES,
> -       .page_table_bar_index = APEX_BAR_INDEX,
> -       .page_table_configs = apex_page_table_configs,
> -       .page_table_extended_bit = APEX_EXTENDED_SHIFT,
> -
> -       .bar_descriptions = {
> -               GASKET_UNUSED_BAR,
> -               GASKET_UNUSED_BAR,
> -               { APEX_BAR_BYTES, (VM_WRITE | VM_READ), APEX_BAR_OFFSET,
> -                       NUM_REGIONS, mappable_regions, PCI_BAR },
> -               GASKET_UNUSED_BAR,
> -               GASKET_UNUSED_BAR,
> -               GASKET_UNUSED_BAR,
> -       },
> -       .coherent_buffer_description = {
> -               APEX_CH_MEM_BYTES,
> -               (VM_WRITE | VM_READ),
> -               APEX_CM_OFFSET,
> -       },
> -       .interrupt_type = PCI_MSIX,
> -       .interrupt_bar_index = APEX_BAR_INDEX,
> -       .num_interrupts = APEX_INTERRUPT_COUNT,
> -       .interrupts = apex_interrupts,
> -       .interrupt_pack_width = 7,
> -
> -       .device_open_cb = apex_device_open_cb,
> -       .device_close_cb = apex_device_cleanup,
> -
> -       .ioctl_handler_cb = apex_ioctl,
> -       .device_status_cb = apex_get_status,
> -       .hardware_revision_cb = NULL,
> -       .device_reset_cb = apex_reset,
> -};
> -
> -static struct pci_driver apex_pci_driver = {
> -       .name = "apex",
> -       .probe = apex_pci_probe,
> -       .remove = apex_pci_remove,
> -       .id_table = apex_pci_ids,
> -};
> -
> -static int __init apex_init(void)
> -{
> -       int ret;
> -
> -       ret = gasket_register_device(&apex_desc);
> -       if (ret)
> -               return ret;
> -       ret = pci_register_driver(&apex_pci_driver);
> -       if (ret)
> -               gasket_unregister_device(&apex_desc);
> -       return ret;
> -}
> -
> -static void apex_exit(void)
> -{
> -       pci_unregister_driver(&apex_pci_driver);
> -       gasket_unregister_device(&apex_desc);
> -}
> -MODULE_DESCRIPTION("Google Apex driver");
> -MODULE_VERSION(APEX_DRIVER_VERSION);
> -MODULE_LICENSE("GPL v2");
> -MODULE_AUTHOR("John Joseph <jnjoseph@google.com>");
> -MODULE_DEVICE_TABLE(pci, apex_pci_ids);
> -module_init(apex_init);
> -module_exit(apex_exit);
> diff --git a/drivers/staging/gasket/gasket.h
> b/drivers/staging/gasket/gasket.h
> deleted file mode 100644
> index a0f065c517a5..000000000000
> --- a/drivers/staging/gasket/gasket.h
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Common Gasket device kernel and user space declarations.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -#ifndef __GASKET_H__
> -#define __GASKET_H__
> -
> -#include <linux/ioctl.h>
> -#include <linux/types.h>
> -
> -/* ioctl structure declarations */
> -
> -/* Ioctl structures are padded to a multiple of 64 bits */
> -/* and padded to put 64 bit values on 64 bit boundaries. */
> -/* Unsigned 64 bit integers are used to hold pointers. */
> -/* This helps compatibility between 32 and 64 bits. */
> -
> -/*
> - * Common structure for ioctls associating an eventfd with a device
> interrupt,
> - * when using the Gasket interrupt module.
> - */
> -struct gasket_interrupt_eventfd {
> -       u64 interrupt;
> -       u64 event_fd;
> -};
> -
> -/*
> - * Common structure for ioctls mapping and unmapping buffers when using
> the
> - * Gasket page_table module.
> - */
> -struct gasket_page_table_ioctl {
> -       u64 page_table_index;
> -       u64 size;
> -       u64 host_address;
> -       u64 device_address;
> -};
> -
> -/*
> - * Common structure for ioctls mapping and unmapping buffers when using
> the
> - * Gasket page_table module.
> - * dma_address: phys addr start of coherent memory, allocated by kernel
> - */
> -struct gasket_coherent_alloc_config_ioctl {
> -       u64 page_table_index;
> -       u64 enable;
> -       u64 size;
> -       u64 dma_address;
> -};
> -
> -/* Base number for all Gasket-common IOCTLs */
> -#define GASKET_IOCTL_BASE 0xDC
> -
> -/* Reset the device. */
> -#define GASKET_IOCTL_RESET _IO(GASKET_IOCTL_BASE, 0)
> -
> -/* Associate the specified [event]fd with the specified interrupt. */
> -#define GASKET_IOCTL_SET_EVENTFD
>      \
> -       _IOW(GASKET_IOCTL_BASE, 1, struct gasket_interrupt_eventfd)
> -
> -/*
> - * Clears any eventfd associated with the specified interrupt. The (ulong)
> - * argument is the interrupt number to clear.
> - */
> -#define GASKET_IOCTL_CLEAR_EVENTFD _IOW(GASKET_IOCTL_BASE, 2, unsigned
> long)
> -
> -/*
> - * [Loopbacks only] Requests that the loopback device send the specified
> - * interrupt to the host. The (ulong) argument is the number of the
> interrupt to
> - * send.
> - */
> -#define GASKET_IOCTL_LOOPBACK_INTERRUPT
>       \
> -       _IOW(GASKET_IOCTL_BASE, 3, unsigned long)
> -
> -/* Queries the kernel for the number of page tables supported by the
> device. */
> -#define GASKET_IOCTL_NUMBER_PAGE_TABLES _IOR(GASKET_IOCTL_BASE, 4, u64)
> -
> -/*
> - * Queries the kernel for the maximum size of the page table.  Only the
> size and
> - * page_table_index fields are used from the struct
> gasket_page_table_ioctl.
> - */
> -#define GASKET_IOCTL_PAGE_TABLE_SIZE
>      \
> -       _IOWR(GASKET_IOCTL_BASE, 5, struct gasket_page_table_ioctl)
> -
> -/*
> - * Queries the kernel for the current simple page table size.  Only the
> size and
> - * page_table_index fields are used from the struct
> gasket_page_table_ioctl.
> - */
> -#define GASKET_IOCTL_SIMPLE_PAGE_TABLE_SIZE
>       \
> -       _IOWR(GASKET_IOCTL_BASE, 6, struct gasket_page_table_ioctl)
> -
> -/*
> - * Tells the kernel to change the split between the number of simple and
> - * extended entries in the given page table. Only the size and
> page_table_index
> - * fields are used from the struct gasket_page_table_ioctl.
> - */
> -#define GASKET_IOCTL_PARTITION_PAGE_TABLE
>       \
> -       _IOW(GASKET_IOCTL_BASE, 7, struct gasket_page_table_ioctl)
> -
> -/*
> - * Tells the kernel to map size bytes at host_address to device_address in
> - * page_table_index page table.
> - */
> -#define GASKET_IOCTL_MAP_BUFFER
>       \
> -       _IOW(GASKET_IOCTL_BASE, 8, struct gasket_page_table_ioctl)
> -
> -/*
> - * Tells the kernel to unmap size bytes at host_address from
> device_address in
> - * page_table_index page table.
> - */
> -#define GASKET_IOCTL_UNMAP_BUFFER
>       \
> -       _IOW(GASKET_IOCTL_BASE, 9, struct gasket_page_table_ioctl)
> -
> -/* Clear the interrupt counts stored for this device. */
> -#define GASKET_IOCTL_CLEAR_INTERRUPT_COUNTS _IO(GASKET_IOCTL_BASE, 10)
> -
> -/* Enable/Disable and configure the coherent allocator. */
> -#define GASKET_IOCTL_CONFIG_COHERENT_ALLOCATOR
>      \
> -       _IOWR(GASKET_IOCTL_BASE, 11, struct
> gasket_coherent_alloc_config_ioctl)
> -
> -#endif /* __GASKET_H__ */
> diff --git a/drivers/staging/gasket/gasket_constants.h
> b/drivers/staging/gasket/gasket_constants.h
> deleted file mode 100644
> index 9ea9c8833f27..000000000000
> --- a/drivers/staging/gasket/gasket_constants.h
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/* Copyright (C) 2018 Google, Inc. */
> -#ifndef __GASKET_CONSTANTS_H__
> -#define __GASKET_CONSTANTS_H__
> -
> -#define GASKET_FRAMEWORK_VERSION "1.1.2"
> -
> -/*
> - * The maximum number of simultaneous device types supported by the
> framework.
> - */
> -#define GASKET_FRAMEWORK_DESC_MAX 2
> -
> -/* The maximum devices per each type. */
> -#define GASKET_DEV_MAX 256
> -
> -/* The number of supported Gasket page tables per device. */
> -#define GASKET_MAX_NUM_PAGE_TABLES 1
> -
> -/* Maximum length of device names (driver name + minor number suffix +
> NULL). */
> -#define GASKET_NAME_MAX 32
> -
> -/* Device status enumeration. */
> -enum gasket_status {
> -       /*
> -        * A device is DEAD if it has not been initialized or has had an
> error.
> -        */
> -       GASKET_STATUS_DEAD = 0,
> -       /*
> -        * A device is LAMED if the hardware is healthy but the kernel was
> -        * unable to enable some functionality (e.g. interrupts).
> -        */
> -       GASKET_STATUS_LAMED,
> -
> -       /* A device is ALIVE if it is ready for operation. */
> -       GASKET_STATUS_ALIVE,
> -
> -       /*
> -        * This status is set when the driver is exiting and waiting for
> all
> -        * handles to be closed.
> -        */
> -       GASKET_STATUS_DRIVER_EXIT,
> -};
> -
> -#endif
> diff --git a/drivers/staging/gasket/gasket_core.c
> b/drivers/staging/gasket/gasket_core.c
> deleted file mode 100644
> index 28dab302183b..000000000000
> --- a/drivers/staging/gasket/gasket_core.c
> +++ /dev/null
> @@ -1,1815 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Gasket generic driver framework. This file contains the implementation
> - * for the Gasket generic driver framework - the functionality that is
> common
> - * across Gasket devices.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
> -#include "gasket_core.h"
> -
> -#include "gasket_interrupt.h"
> -#include "gasket_ioctl.h"
> -#include "gasket_page_table.h"
> -#include "gasket_sysfs.h"
> -
> -#include <linux/capability.h>
> -#include <linux/compiler.h>
> -#include <linux/delay.h>
> -#include <linux/device.h>
> -#include <linux/fs.h>
> -#include <linux/init.h>
> -#include <linux/of.h>
> -#include <linux/pid_namespace.h>
> -#include <linux/printk.h>
> -#include <linux/sched.h>
> -
> -#ifdef GASKET_KERNEL_TRACE_SUPPORT
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/gasket_mmap.h>
> -#else
> -#define trace_gasket_mmap_exit(x)
> -#define trace_gasket_mmap_entry(x, ...)
> -#endif
> -
> -/*
> - * "Private" members of gasket_driver_desc.
> - *
> - * Contains internal per-device type tracking data, i.e., data not
> appropriate
> - * as part of the public interface for the generic framework.
> - */
> -struct gasket_internal_desc {
> -       /* Device-specific-driver-provided configuration information. */
> -       const struct gasket_driver_desc *driver_desc;
> -
> -       /* Protects access to per-driver data (i.e. this structure). */
> -       struct mutex mutex;
> -
> -       /* Kernel-internal device class. */
> -       struct class *class;
> -
> -       /* Instantiated / present devices of this type. */
> -       struct gasket_dev *devs[GASKET_DEV_MAX];
> -};
> -
> -/* do_map_region() needs be able to return more than just true/false. */
> -enum do_map_region_status {
> -       /* The region was successfully mapped. */
> -       DO_MAP_REGION_SUCCESS,
> -
> -       /* Attempted to map region and failed. */
> -       DO_MAP_REGION_FAILURE,
> -
> -       /* The requested region to map was not part of a mappable region.
> */
> -       DO_MAP_REGION_INVALID,
> -};
> -
> -/* Global data definitions. */
> -/* Mutex - only for framework-wide data. Other data should be protected by
> - * finer-grained locks.
> - */
> -static DEFINE_MUTEX(g_mutex);
> -
> -/* List of all registered device descriptions & their supporting data. */
> -static struct gasket_internal_desc g_descs[GASKET_FRAMEWORK_DESC_MAX];
> -
> -/* Mapping of statuses to human-readable strings. Must end with {0,NULL}.
> */
> -static const struct gasket_num_name gasket_status_name_table[] = {
> -       { GASKET_STATUS_DEAD, "DEAD" },
> -       { GASKET_STATUS_ALIVE, "ALIVE" },
> -       { GASKET_STATUS_LAMED, "LAMED" },
> -       { GASKET_STATUS_DRIVER_EXIT, "DRIVER_EXITING" },
> -       { 0, NULL },
> -};
> -
> -/* Enumeration of the automatic Gasket framework sysfs nodes. */
> -enum gasket_sysfs_attribute_type {
> -       ATTR_BAR_OFFSETS,
> -       ATTR_BAR_SIZES,
> -       ATTR_DRIVER_VERSION,
> -       ATTR_FRAMEWORK_VERSION,
> -       ATTR_DEVICE_TYPE,
> -       ATTR_HARDWARE_REVISION,
> -       ATTR_PCI_ADDRESS,
> -       ATTR_STATUS,
> -       ATTR_IS_DEVICE_OWNED,
> -       ATTR_DEVICE_OWNER,
> -       ATTR_WRITE_OPEN_COUNT,
> -       ATTR_RESET_COUNT,
> -       ATTR_USER_MEM_RANGES
> -};
> -
> -/* Perform a standard Gasket callback. */
> -static inline int
> -check_and_invoke_callback(struct gasket_dev *gasket_dev,
> -                         int (*cb_function)(struct gasket_dev *))
> -{
> -       int ret = 0;
> -
> -       if (cb_function) {
> -               mutex_lock(&gasket_dev->mutex);
> -               ret = cb_function(gasket_dev);
> -               mutex_unlock(&gasket_dev->mutex);
> -       }
> -       return ret;
> -}
> -
> -/* Perform a standard Gasket callback without grabbing gasket_dev->mutex.
> */
> -static inline int
> -gasket_check_and_invoke_callback_nolock(struct gasket_dev *gasket_dev,
> -                                       int (*cb_function)(struct
> gasket_dev *))
> -{
> -       int ret = 0;
> -
> -       if (cb_function)
> -               ret = cb_function(gasket_dev);
> -       return ret;
> -}
> -
> -/*
> - * Return nonzero if the gasket_cdev_info is owned by the current thread
> group
> - * ID.
> - */
> -static int gasket_owned_by_current_tgid(struct gasket_cdev_info *info)
> -{
> -       return (info->ownership.is_owned &&
> -               (info->ownership.owner == current->tgid));
> -}
> -
> -/*
> - * Find the next free gasket_internal_dev slot.
> - *
> - * Returns the located slot number on success or a negative number on
> failure.
> - */
> -static int gasket_find_dev_slot(struct gasket_internal_desc
> *internal_desc,
> -                               const char *kobj_name)
> -{
> -       int i;
> -
> -       mutex_lock(&internal_desc->mutex);
> -
> -       /* Search for a previous instance of this device. */
> -       for (i = 0; i < GASKET_DEV_MAX; i++) {
> -               if (internal_desc->devs[i] &&
> -                   strcmp(internal_desc->devs[i]->kobj_name, kobj_name)
> == 0) {
> -                       pr_err("Duplicate device %s\n", kobj_name);
> -                       mutex_unlock(&internal_desc->mutex);
> -                       return -EBUSY;
> -               }
> -       }
> -
> -       /* Find a free device slot. */
> -       for (i = 0; i < GASKET_DEV_MAX; i++) {
> -               if (!internal_desc->devs[i])
> -                       break;
> -       }
> -
> -       if (i == GASKET_DEV_MAX) {
> -               pr_err("Too many registered devices; max %d\n",
> GASKET_DEV_MAX);
> -               mutex_unlock(&internal_desc->mutex);
> -               return -EBUSY;
> -       }
> -
> -       mutex_unlock(&internal_desc->mutex);
> -       return i;
> -}
> -
> -/*
> - * Allocate and initialize a Gasket device structure, add the device to
> the
> - * device list.
> - *
> - * Returns 0 if successful, a negative error code otherwise.
> - */
> -static int gasket_alloc_dev(struct gasket_internal_desc *internal_desc,
> -                           struct device *parent, struct gasket_dev
> **pdev)
> -{
> -       int dev_idx;
> -       const struct gasket_driver_desc *driver_desc =
> -               internal_desc->driver_desc;
> -       struct gasket_dev *gasket_dev;
> -       struct gasket_cdev_info *dev_info;
> -       const char *parent_name = dev_name(parent);
> -
> -       pr_debug("Allocating a Gasket device, parent %s.\n", parent_name);
> -
> -       *pdev = NULL;
> -
> -       dev_idx = gasket_find_dev_slot(internal_desc, parent_name);
> -       if (dev_idx < 0)
> -               return dev_idx;
> -
> -       gasket_dev = *pdev = kzalloc(sizeof(*gasket_dev), GFP_KERNEL);
> -       if (!gasket_dev) {
> -               pr_err("no memory for device, parent %s\n", parent_name);
> -               return -ENOMEM;
> -       }
> -       internal_desc->devs[dev_idx] = gasket_dev;
> -
> -       mutex_init(&gasket_dev->mutex);
> -
> -       gasket_dev->internal_desc = internal_desc;
> -       gasket_dev->dev_idx = dev_idx;
> -       snprintf(gasket_dev->kobj_name, GASKET_NAME_MAX, "%s",
> parent_name);
> -       gasket_dev->dev = get_device(parent);
> -       /* gasket_bar_data is uninitialized. */
> -       gasket_dev->num_page_tables = driver_desc->num_page_tables;
> -       /* max_page_table_size and *page table are uninit'ed */
> -       /* interrupt_data is not initialized. */
> -       /* status is 0, or GASKET_STATUS_DEAD */
> -
> -       dev_info = &gasket_dev->dev_info;
> -       snprintf(dev_info->name, GASKET_NAME_MAX, "%s_%u",
> driver_desc->name,
> -                gasket_dev->dev_idx);
> -       dev_info->devt =
> -               MKDEV(driver_desc->major, driver_desc->minor +
> -                     gasket_dev->dev_idx);
> -       dev_info->device =
> -               device_create(internal_desc->class, parent, dev_info->devt,
> -                             gasket_dev, dev_info->name);
> -
> -       /* cdev has not yet been added; cdev_added is 0 */
> -       dev_info->gasket_dev_ptr = gasket_dev;
> -       /* ownership is all 0, indicating no owner or opens. */
> -
> -       return 0;
> -}
> -
> -/* Free a Gasket device. */
> -static void gasket_free_dev(struct gasket_dev *gasket_dev)
> -{
> -       struct gasket_internal_desc *internal_desc =
> gasket_dev->internal_desc;
> -
> -       mutex_lock(&internal_desc->mutex);
> -       internal_desc->devs[gasket_dev->dev_idx] = NULL;
> -       mutex_unlock(&internal_desc->mutex);
> -       put_device(gasket_dev->dev);
> -       kfree(gasket_dev);
> -}
> -
> -/*
> - * Maps the specified bar into kernel space.
> - *
> - * Returns 0 on success, a negative error code otherwise.
> - * A zero-sized BAR will not be mapped, but is not an error.
> - */
> -static int gasket_map_pci_bar(struct gasket_dev *gasket_dev, int bar_num)
> -{
> -       struct gasket_internal_desc *internal_desc =
> gasket_dev->internal_desc;
> -       const struct gasket_driver_desc *driver_desc =
> -               internal_desc->driver_desc;
> -       ulong desc_bytes = driver_desc->bar_descriptions[bar_num].size;
> -       struct gasket_bar_data *data;
> -       int ret;
> -
> -       if (desc_bytes == 0)
> -               return 0;
> -
> -       if (driver_desc->bar_descriptions[bar_num].type != PCI_BAR) {
> -               /* not PCI: skip this entry */
> -               return 0;
> -       }
> -
> -       data = &gasket_dev->bar_data[bar_num];
> -
> -       /*
> -        * pci_resource_start and pci_resource_len return a
> "resource_size_t",
> -        * which is safely castable to ulong (which itself is the arg to
> -        * request_mem_region).
> -        */
> -       data->phys_base =
> -               (ulong)pci_resource_start(gasket_dev->pci_dev, bar_num);
> -       if (!data->phys_base) {
> -               dev_err(gasket_dev->dev, "Cannot get BAR%u base address\n",
> -                       bar_num);
> -               return -EINVAL;
> -       }
> -
> -       data->length_bytes =
> -               (ulong)pci_resource_len(gasket_dev->pci_dev, bar_num);
> -       if (data->length_bytes < desc_bytes) {
> -               dev_err(gasket_dev->dev,
> -                       "PCI BAR %u space is too small: %lu; expected >=
> %lu\n",
> -                       bar_num, data->length_bytes, desc_bytes);
> -               return -ENOMEM;
> -       }
> -
> -       if (!request_mem_region(data->phys_base, data->length_bytes,
> -                               gasket_dev->dev_info.name)) {
> -               dev_err(gasket_dev->dev,
> -                       "Cannot get BAR %d memory region %p\n",
> -                       bar_num, &gasket_dev->pci_dev->resource[bar_num]);
> -               return -EINVAL;
> -       }
> -
> -       data->virt_base = ioremap(data->phys_base, data->length_bytes);
> -       if (!data->virt_base) {
> -               dev_err(gasket_dev->dev,
> -                       "Cannot remap BAR %d memory region %p\n",
> -                       bar_num, &gasket_dev->pci_dev->resource[bar_num]);
> -               ret = -ENOMEM;
> -               goto fail;
> -       }
> -
> -       dma_set_mask(&gasket_dev->pci_dev->dev, DMA_BIT_MASK(64));
> -       dma_set_coherent_mask(&gasket_dev->pci_dev->dev, DMA_BIT_MASK(64));
> -
> -       return 0;
> -
> -fail:
> -       iounmap(data->virt_base);
> -       release_mem_region(data->phys_base, data->length_bytes);
> -       return ret;
> -}
> -
> -/*
> - * Releases PCI BAR mapping.
> - *
> - * A zero-sized or not-mapped BAR will not be unmapped, but is not an
> error.
> - */
> -static void gasket_unmap_pci_bar(struct gasket_dev *dev, int bar_num)
> -{
> -       ulong base, bytes;
> -       struct gasket_internal_desc *internal_desc = dev->internal_desc;
> -       const struct gasket_driver_desc *driver_desc =
> -               internal_desc->driver_desc;
> -
> -       if (driver_desc->bar_descriptions[bar_num].size == 0 ||
> -           !dev->bar_data[bar_num].virt_base)
> -               return;
> -
> -       if (driver_desc->bar_descriptions[bar_num].type != PCI_BAR)
> -               return;
> -
> -       iounmap(dev->bar_data[bar_num].virt_base);
> -       dev->bar_data[bar_num].virt_base = NULL;
> -
> -       base = pci_resource_start(dev->pci_dev, bar_num);
> -       if (!base) {
> -               dev_err(dev->dev, "cannot get PCI BAR%u base address\n",
> -                       bar_num);
> -               return;
> -       }
> -
> -       bytes = pci_resource_len(dev->pci_dev, bar_num);
> -       release_mem_region(base, bytes);
> -}
> -
> -/*
> - * Setup PCI memory mapping for the specified device.
> - *
> - * Reads the BAR registers and sets up pointers to the device's memory
> mapped
> - * IO space.
> - *
> - * Returns 0 on success and a negative value otherwise.
> - */
> -static int gasket_setup_pci(struct pci_dev *pci_dev,
> -                           struct gasket_dev *gasket_dev)
> -{
> -       int i, mapped_bars, ret;
> -
> -       for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -               ret = gasket_map_pci_bar(gasket_dev, i);
> -               if (ret) {
> -                       mapped_bars = i;
> -                       goto fail;
> -               }
> -       }
> -
> -       return 0;
> -
> -fail:
> -       for (i = 0; i < mapped_bars; i++)
> -               gasket_unmap_pci_bar(gasket_dev, i);
> -
> -       return -ENOMEM;
> -}
> -
> -/* Unmaps memory for the specified device. */
> -static void gasket_cleanup_pci(struct gasket_dev *gasket_dev)
> -{
> -       int i;
> -
> -       for (i = 0; i < PCI_STD_NUM_BARS; i++)
> -               gasket_unmap_pci_bar(gasket_dev, i);
> -}
> -
> -/* Determine the health of the Gasket device. */
> -static int gasket_get_hw_status(struct gasket_dev *gasket_dev)
> -{
> -       int status;
> -       int i;
> -       const struct gasket_driver_desc *driver_desc =
> -               gasket_dev->internal_desc->driver_desc;
> -
> -       status = gasket_check_and_invoke_callback_nolock(gasket_dev,
> -
> driver_desc->device_status_cb);
> -       if (status != GASKET_STATUS_ALIVE) {
> -               dev_dbg(gasket_dev->dev, "Hardware reported status %d.\n",
> -                       status);
> -               return status;
> -       }
> -
> -       status = gasket_interrupt_system_status(gasket_dev);
> -       if (status != GASKET_STATUS_ALIVE) {
> -               dev_dbg(gasket_dev->dev,
> -                       "Interrupt system reported status %d.\n", status);
> -               return status;
> -       }
> -
> -       for (i = 0; i < driver_desc->num_page_tables; ++i) {
> -               status =
> gasket_page_table_system_status(gasket_dev->page_table[i]);
> -               if (status != GASKET_STATUS_ALIVE) {
> -                       dev_dbg(gasket_dev->dev,
> -                               "Page table %d reported status %d.\n",
> -                               i, status);
> -                       return status;
> -               }
> -       }
> -
> -       return GASKET_STATUS_ALIVE;
> -}
> -
> -static ssize_t
> -gasket_write_mappable_regions(char *buf,
> -                             const struct gasket_driver_desc *driver_desc,
> -                             int bar_index)
> -{
> -       int i;
> -       ssize_t written;
> -       ssize_t total_written = 0;
> -       ulong min_addr, max_addr;
> -       struct gasket_bar_desc bar_desc =
> -               driver_desc->bar_descriptions[bar_index];
> -
> -       if (bar_desc.permissions == GASKET_NOMAP)
> -               return 0;
> -       for (i = 0;
> -            i < bar_desc.num_mappable_regions && total_written <
> PAGE_SIZE;
> -            i++) {
> -               min_addr = bar_desc.mappable_regions[i].start -
> -                          driver_desc->legacy_mmap_address_offset;
> -               max_addr = bar_desc.mappable_regions[i].start -
> -                          driver_desc->legacy_mmap_address_offset +
> -                          bar_desc.mappable_regions[i].length_bytes;
> -               written = scnprintf(buf, PAGE_SIZE - total_written,
> -                                   "0x%08lx-0x%08lx\n", min_addr,
> max_addr);
> -               total_written += written;
> -               buf += written;
> -       }
> -       return total_written;
> -}
> -
> -static ssize_t gasket_sysfs_data_show(struct device *device,
> -                                     struct device_attribute *attr, char
> *buf)
> -{
> -       int i, ret = 0;
> -       ssize_t current_written = 0;
> -       const struct gasket_driver_desc *driver_desc;
> -       struct gasket_dev *gasket_dev;
> -       struct gasket_sysfs_attribute *gasket_attr;
> -       const struct gasket_bar_desc *bar_desc;
> -       enum gasket_sysfs_attribute_type sysfs_type;
> -
> -       gasket_dev = gasket_sysfs_get_device_data(device);
> -       if (!gasket_dev) {
> -               dev_err(device, "No sysfs mapping found for device\n");
> -               return 0;
> -       }
> -
> -       gasket_attr = gasket_sysfs_get_attr(device, attr);
> -       if (!gasket_attr) {
> -               dev_err(device, "No sysfs attr found for device\n");
> -               gasket_sysfs_put_device_data(device, gasket_dev);
> -               return 0;
> -       }
> -
> -       driver_desc = gasket_dev->internal_desc->driver_desc;
> -
> -       sysfs_type =
> -               (enum
> gasket_sysfs_attribute_type)gasket_attr->data.attr_type;
> -       switch (sysfs_type) {
> -       case ATTR_BAR_OFFSETS:
> -               for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -                       bar_desc = &driver_desc->bar_descriptions[i];
> -                       if (bar_desc->size == 0)
> -                               continue;
> -                       current_written =
> -                               snprintf(buf, PAGE_SIZE - ret, "%d:
> 0x%lx\n", i,
> -                                        (ulong)bar_desc->base);
> -                       buf += current_written;
> -                       ret += current_written;
> -               }
> -               break;
> -       case ATTR_BAR_SIZES:
> -               for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -                       bar_desc = &driver_desc->bar_descriptions[i];
> -                       if (bar_desc->size == 0)
> -                               continue;
> -                       current_written =
> -                               snprintf(buf, PAGE_SIZE - ret, "%d:
> 0x%lx\n", i,
> -                                        (ulong)bar_desc->size);
> -                       buf += current_written;
> -                       ret += current_written;
> -               }
> -               break;
> -       case ATTR_DRIVER_VERSION:
> -               ret = snprintf(buf, PAGE_SIZE, "%s\n",
> -
> gasket_dev->internal_desc->driver_desc->driver_version);
> -               break;
> -       case ATTR_FRAMEWORK_VERSION:
> -               ret = snprintf(buf, PAGE_SIZE, "%s\n",
> -                              GASKET_FRAMEWORK_VERSION);
> -               break;
> -       case ATTR_DEVICE_TYPE:
> -               ret = snprintf(buf, PAGE_SIZE, "%s\n",
> -
> gasket_dev->internal_desc->driver_desc->name);
> -               break;
> -       case ATTR_HARDWARE_REVISION:
> -               ret = snprintf(buf, PAGE_SIZE, "%d\n",
> -                              gasket_dev->hardware_revision);
> -               break;
> -       case ATTR_PCI_ADDRESS:
> -               ret = snprintf(buf, PAGE_SIZE, "%s\n",
> gasket_dev->kobj_name);
> -               break;
> -       case ATTR_STATUS:
> -               ret = snprintf(buf, PAGE_SIZE, "%s\n",
> -                              gasket_num_name_lookup(gasket_dev->status,
> -
>  gasket_status_name_table));
> -               break;
> -       case ATTR_IS_DEVICE_OWNED:
> -               ret = snprintf(buf, PAGE_SIZE, "%d\n",
> -                              gasket_dev->dev_info.ownership.is_owned);
> -               break;
> -       case ATTR_DEVICE_OWNER:
> -               ret = snprintf(buf, PAGE_SIZE, "%d\n",
> -                              gasket_dev->dev_info.ownership.owner);
> -               break;
> -       case ATTR_WRITE_OPEN_COUNT:
> -               ret = snprintf(buf, PAGE_SIZE, "%d\n",
> -
> gasket_dev->dev_info.ownership.write_open_count);
> -               break;
> -       case ATTR_RESET_COUNT:
> -               ret = snprintf(buf, PAGE_SIZE, "%d\n",
> gasket_dev->reset_count);
> -               break;
> -       case ATTR_USER_MEM_RANGES:
> -               for (i = 0; i < PCI_STD_NUM_BARS; ++i) {
> -                       current_written =
> -                               gasket_write_mappable_regions(buf,
> driver_desc,
> -                                                             i);
> -                       buf += current_written;
> -                       ret += current_written;
> -               }
> -               break;
> -       default:
> -               dev_dbg(gasket_dev->dev, "Unknown attribute: %s\n",
> -                       attr->attr.name);
> -               ret = 0;
> -               break;
> -       }
> -
> -       gasket_sysfs_put_attr(device, gasket_attr);
> -       gasket_sysfs_put_device_data(device, gasket_dev);
> -       return ret;
> -}
> -
> -/* These attributes apply to all Gasket driver instances. */
> -static const struct gasket_sysfs_attribute gasket_sysfs_generic_attrs[] =
> {
> -       GASKET_SYSFS_RO(bar_offsets, gasket_sysfs_data_show,
> ATTR_BAR_OFFSETS),
> -       GASKET_SYSFS_RO(bar_sizes, gasket_sysfs_data_show, ATTR_BAR_SIZES),
> -       GASKET_SYSFS_RO(driver_version, gasket_sysfs_data_show,
> -                       ATTR_DRIVER_VERSION),
> -       GASKET_SYSFS_RO(framework_version, gasket_sysfs_data_show,
> -                       ATTR_FRAMEWORK_VERSION),
> -       GASKET_SYSFS_RO(device_type, gasket_sysfs_data_show,
> ATTR_DEVICE_TYPE),
> -       GASKET_SYSFS_RO(revision, gasket_sysfs_data_show,
> -                       ATTR_HARDWARE_REVISION),
> -       GASKET_SYSFS_RO(pci_address, gasket_sysfs_data_show,
> ATTR_PCI_ADDRESS),
> -       GASKET_SYSFS_RO(status, gasket_sysfs_data_show, ATTR_STATUS),
> -       GASKET_SYSFS_RO(is_device_owned, gasket_sysfs_data_show,
> -                       ATTR_IS_DEVICE_OWNED),
> -       GASKET_SYSFS_RO(device_owner, gasket_sysfs_data_show,
> -                       ATTR_DEVICE_OWNER),
> -       GASKET_SYSFS_RO(write_open_count, gasket_sysfs_data_show,
> -                       ATTR_WRITE_OPEN_COUNT),
> -       GASKET_SYSFS_RO(reset_count, gasket_sysfs_data_show,
> ATTR_RESET_COUNT),
> -       GASKET_SYSFS_RO(user_mem_ranges, gasket_sysfs_data_show,
> -                       ATTR_USER_MEM_RANGES),
> -       GASKET_END_OF_ATTR_ARRAY
> -};
> -
> -/* Add a char device and related info. */
> -static int gasket_add_cdev(struct gasket_cdev_info *dev_info,
> -                          const struct file_operations *file_ops,
> -                          struct module *owner)
> -{
> -       int ret;
> -
> -       cdev_init(&dev_info->cdev, file_ops);
> -       dev_info->cdev.owner = owner;
> -       ret = cdev_add(&dev_info->cdev, dev_info->devt, 1);
> -       if (ret) {
> -               dev_err(dev_info->gasket_dev_ptr->dev,
> -                       "cannot add char device [ret=%d]\n", ret);
> -               return ret;
> -       }
> -       dev_info->cdev_added = 1;
> -
> -       return 0;
> -}
> -
> -/* Disable device operations. */
> -void gasket_disable_device(struct gasket_dev *gasket_dev)
> -{
> -       const struct gasket_driver_desc *driver_desc =
> -               gasket_dev->internal_desc->driver_desc;
> -       int i;
> -
> -       /* Only delete the device if it has been successfully added. */
> -       if (gasket_dev->dev_info.cdev_added)
> -               cdev_del(&gasket_dev->dev_info.cdev);
> -
> -       gasket_dev->status = GASKET_STATUS_DEAD;
> -
> -       gasket_interrupt_cleanup(gasket_dev);
> -
> -       for (i = 0; i < driver_desc->num_page_tables; ++i) {
> -               if (gasket_dev->page_table[i]) {
> -                       gasket_page_table_reset(gasket_dev->page_table[i]);
> -
>  gasket_page_table_cleanup(gasket_dev->page_table[i]);
> -               }
> -       }
> -}
> -EXPORT_SYMBOL(gasket_disable_device);
> -
> -/*
> - * Registered driver descriptor lookup for PCI devices.
> - *
> - * Precondition: Called with g_mutex held (to avoid a race on return).
> - * Returns NULL if no matching device was found.
> - */
> -static struct gasket_internal_desc *
> -lookup_pci_internal_desc(struct pci_dev *pci_dev)
> -{
> -       int i;
> -
> -       __must_hold(&g_mutex);
> -       for (i = 0; i < GASKET_FRAMEWORK_DESC_MAX; i++) {
> -               if (g_descs[i].driver_desc &&
> -                   g_descs[i].driver_desc->pci_id_table &&
> -                   pci_match_id(g_descs[i].driver_desc->pci_id_table,
> pci_dev))
> -                       return &g_descs[i];
> -       }
> -
> -       return NULL;
> -}
> -
> -/*
> - * Verifies that the user has permissions to perform the requested
> mapping and
> - * that the provided descriptor/range is of adequate size to hold the
> range to
> - * be mapped.
> - */
> -static bool gasket_mmap_has_permissions(struct gasket_dev *gasket_dev,
> -                                       struct vm_area_struct *vma,
> -                                       int bar_permissions)
> -{
> -       int requested_permissions;
> -       /* Always allow sysadmin to access. */
> -       if (capable(CAP_SYS_ADMIN))
> -               return true;
> -
> -       /* Never allow non-sysadmins to access to a dead device. */
> -       if (gasket_dev->status != GASKET_STATUS_ALIVE) {
> -               dev_dbg(gasket_dev->dev, "Device is dead.\n");
> -               return false;
> -       }
> -
> -       /* Make sure that no wrong flags are set. */
> -       requested_permissions =
> -               (vma->vm_flags & VM_ACCESS_FLAGS);
> -       if (requested_permissions & ~(bar_permissions)) {
> -               dev_dbg(gasket_dev->dev,
> -                       "Attempting to map a region with requested
> permissions 0x%x, but region has permissions 0x%x.\n",
> -                       requested_permissions, bar_permissions);
> -               return false;
> -       }
> -
> -       /* Do not allow a non-owner to write. */
> -       if ((vma->vm_flags & VM_WRITE) &&
> -           !gasket_owned_by_current_tgid(&gasket_dev->dev_info)) {
> -               dev_dbg(gasket_dev->dev,
> -                       "Attempting to mmap a region for write without
> owning device.\n");
> -               return false;
> -       }
> -
> -       return true;
> -}
> -
> -/*
> - * Verifies that the input address is within the region allocated to
> coherent
> - * buffer.
> - */
> -static bool
> -gasket_is_coherent_region(const struct gasket_driver_desc *driver_desc,
> -                         ulong address)
> -{
> -       struct gasket_coherent_buffer_desc coh_buff_desc =
> -               driver_desc->coherent_buffer_description;
> -
> -       if (coh_buff_desc.permissions != GASKET_NOMAP) {
> -               if ((address >= coh_buff_desc.base) &&
> -                   (address < coh_buff_desc.base + coh_buff_desc.size)) {
> -                       return true;
> -               }
> -       }
> -       return false;
> -}
> -
> -static int gasket_get_bar_index(const struct gasket_dev *gasket_dev,
> -                               ulong phys_addr)
> -{
> -       int i;
> -       const struct gasket_driver_desc *driver_desc;
> -
> -       driver_desc = gasket_dev->internal_desc->driver_desc;
> -       for (i = 0; i < PCI_STD_NUM_BARS; ++i) {
> -               struct gasket_bar_desc bar_desc =
> -                       driver_desc->bar_descriptions[i];
> -
> -               if (bar_desc.permissions != GASKET_NOMAP) {
> -                       if (phys_addr >= bar_desc.base &&
> -                           phys_addr < (bar_desc.base + bar_desc.size)) {
> -                               return i;
> -                       }
> -               }
> -       }
> -       /* If we haven't found the address by now, it is invalid. */
> -       return -EINVAL;
> -}
> -
> -/*
> - * Sets the actual bounds to map, given the device's mappable region.
> - *
> - * Given the device's mappable region, along with the user-requested
> mapping
> - * start offset and length of the user region, determine how much of this
> - * mappable region can be mapped into the user's region (start/end
> offsets),
> - * and the physical offset (phys_offset) into the BAR where the mapping
> should
> - * begin (either the VMA's or region lower bound).
> - *
> - * In other words, this calculates the overlap between the VMA
> - * (bar_offset, requested_length) and the given gasket_mappable_region.
> - *
> - * Returns true if there's anything to map, and false otherwise.
> - */
> -static bool
> -gasket_mm_get_mapping_addrs(const struct gasket_mappable_region *region,
> -                           ulong bar_offset, ulong requested_length,
> -                           struct gasket_mappable_region *mappable_region,
> -                           ulong *virt_offset)
> -{
> -       ulong range_start = region->start;
> -       ulong range_length = region->length_bytes;
> -       ulong range_end = range_start + range_length;
> -
> -       *virt_offset = 0;
> -       if (bar_offset + requested_length < range_start) {
> -               /*
> -                * If the requested region is completely below the range,
> -                * there is nothing to map.
> -                */
> -               return false;
> -       } else if (bar_offset <= range_start) {
> -               /* If the bar offset is below this range's start
> -                * but the requested length continues into it:
> -                * 1) Only map starting from the beginning of this
> -                *      range's phys. offset, so we don't map unmappable
> -                *      memory.
> -                * 2) The length of the virtual memory to not map is the
> -                *      delta between the bar offset and the
> -                *      mappable start (and since the mappable start is
> -                *      bigger, start - req.)
> -                * 3) The map length is the minimum of the mappable
> -                *      requested length (requested_length - virt_offset)
> -                *      and the actual mappable length of the range.
> -                */
> -               mappable_region->start = range_start;
> -               *virt_offset = range_start - bar_offset;
> -               mappable_region->length_bytes =
> -                       min(requested_length - *virt_offset, range_length);
> -               return true;
> -       } else if (bar_offset > range_start &&
> -                  bar_offset < range_end) {
> -               /*
> -                * If the bar offset is within this range:
> -                * 1) Map starting from the bar offset.
> -                * 2) Because there is no forbidden memory between the
> -                *      bar offset and the range start,
> -                *      virt_offset is 0.
> -                * 3) The map length is the minimum of the requested
> -                *      length and the remaining length in the buffer
> -                *      (range_end - bar_offset)
> -                */
> -               mappable_region->start = bar_offset;
> -               *virt_offset = 0;
> -               mappable_region->length_bytes =
> -                       min(requested_length, range_end - bar_offset);
> -               return true;
> -       }
> -
> -       /*
> -        * If the requested [start] offset is above range_end,
> -        * there's nothing to map.
> -        */
> -       return false;
> -}
> -
> -/*
> - * Calculates the offset where the VMA range begins in its containing BAR.
> - * The offset is written into bar_offset on success.
> - * Returns zero on success, anything else on error.
> - */
> -static int gasket_mm_vma_bar_offset(const struct gasket_dev *gasket_dev,
> -                                   const struct vm_area_struct *vma,
> -                                   ulong *bar_offset)
> -{
> -       ulong raw_offset;
> -       int bar_index;
> -       const struct gasket_driver_desc *driver_desc =
> -               gasket_dev->internal_desc->driver_desc;
> -
> -       raw_offset = (vma->vm_pgoff << PAGE_SHIFT) +
> -               driver_desc->legacy_mmap_address_offset;
> -       bar_index = gasket_get_bar_index(gasket_dev, raw_offset);
> -       if (bar_index < 0) {
> -               dev_err(gasket_dev->dev,
> -                       "Unable to find matching bar for address 0x%lx\n",
> -                       raw_offset);
> -               trace_gasket_mmap_exit(bar_index);
> -               return bar_index;
> -       }
> -       *bar_offset =
> -               raw_offset - driver_desc->bar_descriptions[bar_index].base;
> -
> -       return 0;
> -}
> -
> -int gasket_mm_unmap_region(const struct gasket_dev *gasket_dev,
> -                          struct vm_area_struct *vma,
> -                          const struct gasket_mappable_region *map_region)
> -{
> -       ulong bar_offset;
> -       ulong virt_offset;
> -       struct gasket_mappable_region mappable_region;
> -       int ret;
> -
> -       if (map_region->length_bytes == 0)
> -               return 0;
> -
> -       ret = gasket_mm_vma_bar_offset(gasket_dev, vma, &bar_offset);
> -       if (ret)
> -               return ret;
> -
> -       if (!gasket_mm_get_mapping_addrs(map_region, bar_offset,
> -                                        vma->vm_end - vma->vm_start,
> -                                        &mappable_region, &virt_offset))
> -               return 1;
> -
> -       /*
> -        * The length passed to zap_vma_ptes MUST BE A MULTIPLE OF
> -        * PAGE_SIZE! Trust me. I have the scars.
> -        *
> -        * Next multiple of y: ceil_div(x, y) * y
> -        */
> -       zap_vma_ptes(vma, vma->vm_start + virt_offset,
> -                    DIV_ROUND_UP(mappable_region.length_bytes, PAGE_SIZE)
> *
> -                    PAGE_SIZE);
> -       return 0;
> -}
> -EXPORT_SYMBOL(gasket_mm_unmap_region);
> -
> -/* Maps a virtual address + range to a physical offset of a BAR. */
> -static enum do_map_region_status
> -do_map_region(const struct gasket_dev *gasket_dev, struct vm_area_struct
> *vma,
> -             struct gasket_mappable_region *mappable_region)
> -{
> -       /* Maximum size of a single call to io_remap_pfn_range. */
> -       /* I pulled this number out of thin air. */
> -       const ulong max_chunk_size = 64 * 1024 * 1024;
> -       ulong chunk_size, mapped_bytes = 0;
> -
> -       const struct gasket_driver_desc *driver_desc =
> -               gasket_dev->internal_desc->driver_desc;
> -
> -       ulong bar_offset, virt_offset;
> -       struct gasket_mappable_region region_to_map;
> -       ulong phys_offset, map_length;
> -       ulong virt_base, phys_base;
> -       int bar_index, ret;
> -
> -       ret = gasket_mm_vma_bar_offset(gasket_dev, vma, &bar_offset);
> -       if (ret)
> -               return DO_MAP_REGION_INVALID;
> -
> -       if (!gasket_mm_get_mapping_addrs(mappable_region, bar_offset,
> -                                        vma->vm_end - vma->vm_start,
> -                                        &region_to_map, &virt_offset))
> -               return DO_MAP_REGION_INVALID;
> -       phys_offset = region_to_map.start;
> -       map_length = region_to_map.length_bytes;
> -
> -       virt_base = vma->vm_start + virt_offset;
> -       bar_index =
> -               gasket_get_bar_index(gasket_dev,
> -                                    (vma->vm_pgoff << PAGE_SHIFT) +
> -
> driver_desc->legacy_mmap_address_offset);
> -
> -       if (bar_index < 0)
> -               return DO_MAP_REGION_INVALID;
> -
> -       phys_base = gasket_dev->bar_data[bar_index].phys_base +
> phys_offset;
> -       while (mapped_bytes < map_length) {
> -               /*
> -                * io_remap_pfn_range can take a while, so we chunk its
> -                * calls and call cond_resched between each.
> -                */
> -               chunk_size = min(max_chunk_size, map_length -
> mapped_bytes);
> -
> -               cond_resched();
> -               ret = io_remap_pfn_range(vma, virt_base + mapped_bytes,
> -                                        (phys_base + mapped_bytes) >>
> -                                        PAGE_SHIFT, chunk_size,
> -                                        vma->vm_page_prot);
> -               if (ret) {
> -                       dev_err(gasket_dev->dev,
> -                               "Error remapping PFN range.\n");
> -                       goto fail;
> -               }
> -               mapped_bytes += chunk_size;
> -       }
> -
> -       return DO_MAP_REGION_SUCCESS;
> -
> -fail:
> -       /* Unmap the partial chunk we mapped. */
> -       mappable_region->length_bytes = mapped_bytes;
> -       if (gasket_mm_unmap_region(gasket_dev, vma, mappable_region))
> -               dev_err(gasket_dev->dev,
> -                       "Error unmapping partial region 0x%lx (0x%lx
> bytes)\n",
> -                       (ulong)virt_offset,
> -                       (ulong)mapped_bytes);
> -
> -       return DO_MAP_REGION_FAILURE;
> -}
> -
> -/* Map a region of coherent memory. */
> -static int gasket_mmap_coherent(struct gasket_dev *gasket_dev,
> -                               struct vm_area_struct *vma)
> -{
> -       const struct gasket_driver_desc *driver_desc =
> -               gasket_dev->internal_desc->driver_desc;
> -       const ulong requested_length = vma->vm_end - vma->vm_start;
> -       int ret;
> -       ulong permissions;
> -
> -       if (requested_length == 0 || requested_length >
> -           gasket_dev->coherent_buffer.length_bytes) {
> -               trace_gasket_mmap_exit(-EINVAL);
> -               return -EINVAL;
> -       }
> -
> -       permissions = driver_desc->coherent_buffer_description.permissions;
> -       if (!gasket_mmap_has_permissions(gasket_dev, vma, permissions)) {
> -               dev_err(gasket_dev->dev, "Permission checking failed.\n");
> -               trace_gasket_mmap_exit(-EPERM);
> -               return -EPERM;
> -       }
> -
> -       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -
> -       ret = remap_pfn_range(vma, vma->vm_start,
> -                             (gasket_dev->coherent_buffer.phys_base) >>
> -                             PAGE_SHIFT, requested_length,
> vma->vm_page_prot);
> -       if (ret) {
> -               dev_err(gasket_dev->dev, "Error remapping PFN range
> err=%d.\n",
> -                       ret);
> -               trace_gasket_mmap_exit(ret);
> -               return ret;
> -       }
> -
> -       /* Record the user virtual to dma_address mapping that was
> -        * created by the kernel.
> -        */
> -       gasket_set_user_virt(gasket_dev, requested_length,
> -                            gasket_dev->coherent_buffer.phys_base,
> -                            vma->vm_start);
> -       return 0;
> -}
> -
> -/* Map a device's BARs into user space. */
> -static int gasket_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -       int i, ret;
> -       int bar_index;
> -       int has_mapped_anything = 0;
> -       ulong permissions;
> -       ulong raw_offset, vma_size;
> -       bool is_coherent_region;
> -       const struct gasket_driver_desc *driver_desc;
> -       struct gasket_dev *gasket_dev = (struct gasket_dev
> *)filp->private_data;
> -       const struct gasket_bar_desc *bar_desc;
> -       struct gasket_mappable_region *map_regions = NULL;
> -       int num_map_regions = 0;
> -       enum do_map_region_status map_status;
> -
> -       driver_desc = gasket_dev->internal_desc->driver_desc;
> -
> -       if (vma->vm_start & ~PAGE_MASK) {
> -               dev_err(gasket_dev->dev,
> -                       "Base address not page-aligned: 0x%lx\n",
> -                       vma->vm_start);
> -               trace_gasket_mmap_exit(-EINVAL);
> -               return -EINVAL;
> -       }
> -
> -       /* Calculate the offset of this range into physical mem. */
> -       raw_offset = (vma->vm_pgoff << PAGE_SHIFT) +
> -               driver_desc->legacy_mmap_address_offset;
> -       vma_size = vma->vm_end - vma->vm_start;
> -       trace_gasket_mmap_entry(gasket_dev->dev_info.name, raw_offset,
> -                               vma_size);
> -
> -       /*
> -        * Check if the raw offset is within a bar region. If not, check
> if it
> -        * is a coherent region.
> -        */
> -       bar_index = gasket_get_bar_index(gasket_dev, raw_offset);
> -       is_coherent_region = gasket_is_coherent_region(driver_desc,
> raw_offset);
> -       if (bar_index < 0 && !is_coherent_region) {
> -               dev_err(gasket_dev->dev,
> -                       "Unable to find matching bar for address 0x%lx\n",
> -                       raw_offset);
> -               trace_gasket_mmap_exit(bar_index);
> -               return bar_index;
> -       }
> -       if (bar_index > 0 && is_coherent_region) {
> -               dev_err(gasket_dev->dev,
> -                       "double matching bar and coherent buffers for
> address 0x%lx\n",
> -                       raw_offset);
> -               trace_gasket_mmap_exit(bar_index);
> -               return -EINVAL;
> -       }
> -
> -       vma->vm_private_data = gasket_dev;
> -
> -       if (is_coherent_region)
> -               return gasket_mmap_coherent(gasket_dev, vma);
> -
> -       /* Everything in the rest of this function is for normal BAR
> mapping. */
> -
> -       /*
> -        * Subtract the base of the bar from the raw offset to get the
> -        * memory location within the bar to map.
> -        */
> -       bar_desc = &driver_desc->bar_descriptions[bar_index];
> -       permissions = bar_desc->permissions;
> -       if (!gasket_mmap_has_permissions(gasket_dev, vma, permissions)) {
> -               dev_err(gasket_dev->dev, "Permission checking failed.\n");
> -               trace_gasket_mmap_exit(-EPERM);
> -               return -EPERM;
> -       }
> -
> -       if (driver_desc->get_mappable_regions_cb) {
> -               ret = driver_desc->get_mappable_regions_cb(gasket_dev,
> -                                                          bar_index,
> -                                                          &map_regions,
> -
> &num_map_regions);
> -               if (ret)
> -                       return ret;
> -       } else {
> -               if (!gasket_mmap_has_permissions(gasket_dev, vma,
> -                                                bar_desc->permissions)) {
> -                       dev_err(gasket_dev->dev,
> -                               "Permission checking failed.\n");
> -                       trace_gasket_mmap_exit(-EPERM);
> -                       return -EPERM;
> -               }
> -               num_map_regions = bar_desc->num_mappable_regions;
> -               map_regions = kcalloc(num_map_regions,
> -                                     sizeof(*bar_desc->mappable_regions),
> -                                     GFP_KERNEL);
> -               if (map_regions) {
> -                       memcpy(map_regions, bar_desc->mappable_regions,
> -                              num_map_regions *
> -
>  sizeof(*bar_desc->mappable_regions));
> -               }
> -       }
> -
> -       if (!map_regions || num_map_regions == 0) {
> -               dev_err(gasket_dev->dev, "No mappable regions
> returned!\n");
> -               return -EINVAL;
> -       }
> -
> -       /* Marks the VMA's pages as uncacheable. */
> -       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -       for (i = 0; i < num_map_regions; i++) {
> -               map_status = do_map_region(gasket_dev, vma,
> &map_regions[i]);
> -               /* Try the next region if this one was not mappable. */
> -               if (map_status == DO_MAP_REGION_INVALID)
> -                       continue;
> -               if (map_status == DO_MAP_REGION_FAILURE) {
> -                       ret = -ENOMEM;
> -                       goto fail;
> -               }
> -
> -               has_mapped_anything = 1;
> -       }
> -
> -       kfree(map_regions);
> -
> -       /* If we could not map any memory, the request was invalid. */
> -       if (!has_mapped_anything) {
> -               dev_err(gasket_dev->dev,
> -                       "Map request did not contain a valid region.\n");
> -               trace_gasket_mmap_exit(-EINVAL);
> -               return -EINVAL;
> -       }
> -
> -       trace_gasket_mmap_exit(0);
> -       return 0;
> -
> -fail:
> -       /* Need to unmap any mapped ranges. */
> -       num_map_regions = i;
> -       for (i = 0; i < num_map_regions; i++)
> -               if (gasket_mm_unmap_region(gasket_dev, vma,
> -                                          &bar_desc->mappable_regions[i]))
> -                       dev_err(gasket_dev->dev, "Error unmapping range
> %d.\n",
> -                               i);
> -       kfree(map_regions);
> -
> -       return ret;
> -}
> -
> -/*
> - * Open the char device file.
> - *
> - * If the open is for writing, and the device is not owned, this process
> becomes
> - * the owner.  If the open is for writing and the device is already owned
> by
> - * some other process, it is an error.  If this process is the owner,
> increment
> - * the open count.
> - *
> - * Returns 0 if successful, a negative error number otherwise.
> - */
> -static int gasket_open(struct inode *inode, struct file *filp)
> -{
> -       int ret;
> -       struct gasket_dev *gasket_dev;
> -       const struct gasket_driver_desc *driver_desc;
> -       struct gasket_ownership *ownership;
> -       char task_name[TASK_COMM_LEN];
> -       struct gasket_cdev_info *dev_info =
> -           container_of(inode->i_cdev, struct gasket_cdev_info, cdev);
> -       struct pid_namespace *pid_ns = task_active_pid_ns(current);
> -       bool is_root = ns_capable(pid_ns->user_ns, CAP_SYS_ADMIN);
> -
> -       gasket_dev = dev_info->gasket_dev_ptr;
> -       driver_desc = gasket_dev->internal_desc->driver_desc;
> -       ownership = &dev_info->ownership;
> -       get_task_comm(task_name, current);
> -       filp->private_data = gasket_dev;
> -       inode->i_size = 0;
> -
> -       dev_dbg(gasket_dev->dev,
> -               "Attempting to open with tgid %u (%s) (f_mode: 0%03o,
> fmode_write: %d is_root: %u)\n",
> -               current->tgid, task_name, filp->f_mode,
> -               (filp->f_mode & FMODE_WRITE), is_root);
> -
> -       /* Always allow non-writing accesses. */
> -       if (!(filp->f_mode & FMODE_WRITE)) {
> -               dev_dbg(gasket_dev->dev, "Allowing read-only opening.\n");
> -               return 0;
> -       }
> -
> -       mutex_lock(&gasket_dev->mutex);
> -
> -       dev_dbg(gasket_dev->dev,
> -               "Current owner open count (owning tgid %u): %d.\n",
> -               ownership->owner, ownership->write_open_count);
> -
> -       /* Opening a node owned by another TGID is an error (unless root)
> */
> -       if (ownership->is_owned && ownership->owner != current->tgid &&
> -           !is_root) {
> -               dev_err(gasket_dev->dev,
> -                       "Process %u is opening a node held by %u.\n",
> -                       current->tgid, ownership->owner);
> -               mutex_unlock(&gasket_dev->mutex);
> -               return -EPERM;
> -       }
> -
> -       /* If the node is not owned, assign it to the current TGID. */
> -       if (!ownership->is_owned) {
> -               ret = gasket_check_and_invoke_callback_nolock(gasket_dev,
> -
>  driver_desc->device_open_cb);
> -               if (ret) {
> -                       dev_err(gasket_dev->dev,
> -                               "Error in device open cb: %d\n", ret);
> -                       mutex_unlock(&gasket_dev->mutex);
> -                       return ret;
> -               }
> -               ownership->is_owned = 1;
> -               ownership->owner = current->tgid;
> -               dev_dbg(gasket_dev->dev, "Device owner is now tgid %u\n",
> -                       ownership->owner);
> -       }
> -
> -       ownership->write_open_count++;
> -
> -       dev_dbg(gasket_dev->dev, "New open count (owning tgid %u): %d\n",
> -               ownership->owner, ownership->write_open_count);
> -
> -       mutex_unlock(&gasket_dev->mutex);
> -       return 0;
> -}
> -
> -/*
> - * Called on a close of the device file.  If this process is the owner,
> - * decrement the open count.  On last close by the owner, free up buffers
> and
> - * eventfd contexts, and release ownership.
> - *
> - * Returns 0 if successful, a negative error number otherwise.
> - */
> -static int gasket_release(struct inode *inode, struct file *file)
> -{
> -       int i;
> -       struct gasket_dev *gasket_dev;
> -       struct gasket_ownership *ownership;
> -       const struct gasket_driver_desc *driver_desc;
> -       char task_name[TASK_COMM_LEN];
> -       struct gasket_cdev_info *dev_info =
> -               container_of(inode->i_cdev, struct gasket_cdev_info, cdev);
> -       struct pid_namespace *pid_ns = task_active_pid_ns(current);
> -       bool is_root = ns_capable(pid_ns->user_ns, CAP_SYS_ADMIN);
> -
> -       gasket_dev = dev_info->gasket_dev_ptr;
> -       driver_desc = gasket_dev->internal_desc->driver_desc;
> -       ownership = &dev_info->ownership;
> -       get_task_comm(task_name, current);
> -       mutex_lock(&gasket_dev->mutex);
> -
> -       dev_dbg(gasket_dev->dev,
> -               "Releasing device node. Call origin: tgid %u (%s) (f_mode:
> 0%03o, fmode_write: %d, is_root: %u)\n",
> -               current->tgid, task_name, file->f_mode,
> -               (file->f_mode & FMODE_WRITE), is_root);
> -       dev_dbg(gasket_dev->dev, "Current open count (owning tgid %u):
> %d\n",
> -               ownership->owner, ownership->write_open_count);
> -
> -       if (file->f_mode & FMODE_WRITE) {
> -               ownership->write_open_count--;
> -               if (ownership->write_open_count == 0) {
> -                       dev_dbg(gasket_dev->dev, "Device is now free\n");
> -                       ownership->is_owned = 0;
> -                       ownership->owner = 0;
> -
> -                       /* Forces chip reset before we unmap the page
> tables. */
> -                       driver_desc->device_reset_cb(gasket_dev);
> -
> -                       for (i = 0; i < driver_desc->num_page_tables; ++i)
> {
> -
>  gasket_page_table_unmap_all(gasket_dev->page_table[i]);
> -
>  gasket_page_table_garbage_collect(gasket_dev->page_table[i]);
> -
>  gasket_free_coherent_memory_all(gasket_dev, i);
> -                       }
> -
> -                       /* Closes device, enters power save. */
> -                       gasket_check_and_invoke_callback_nolock(gasket_dev,
> -
>  driver_desc->device_close_cb);
> -               }
> -       }
> -
> -       dev_dbg(gasket_dev->dev, "New open count (owning tgid %u): %d\n",
> -               ownership->owner, ownership->write_open_count);
> -       mutex_unlock(&gasket_dev->mutex);
> -       return 0;
> -}
> -
> -/*
> - * Gasket ioctl dispatch function.
> - *
> - * Check if the ioctl is a generic ioctl. If not, pass the ioctl to the
> - * ioctl_handler_cb registered in the driver description.
> - * If the ioctl is a generic ioctl, pass it to gasket_ioctl_handler.
> - */
> -static long gasket_ioctl(struct file *filp, uint cmd, ulong arg)
> -{
> -       struct gasket_dev *gasket_dev;
> -       const struct gasket_driver_desc *driver_desc;
> -       void __user *argp = (void __user *)arg;
> -       char path[256];
> -
> -       gasket_dev = (struct gasket_dev *)filp->private_data;
> -       driver_desc = gasket_dev->internal_desc->driver_desc;
> -       if (!driver_desc) {
> -               dev_dbg(gasket_dev->dev,
> -                       "Unable to find device descriptor for file %s\n",
> -                       d_path(&filp->f_path, path, 256));
> -               return -ENODEV;
> -       }
> -
> -       if (!gasket_is_supported_ioctl(cmd)) {
> -               /*
> -                * The ioctl handler is not a standard Gasket callback,
> since
> -                * it requires different arguments. This means we can't use
> -                * check_and_invoke_callback.
> -                */
> -               if (driver_desc->ioctl_handler_cb)
> -                       return driver_desc->ioctl_handler_cb(filp, cmd,
> argp);
> -
> -               dev_dbg(gasket_dev->dev, "Received unknown ioctl 0x%x\n",
> cmd);
> -               return -EINVAL;
> -       }
> -
> -       return gasket_handle_ioctl(filp, cmd, argp);
> -}
> -
> -/* File operations for all Gasket devices. */
> -static const struct file_operations gasket_file_ops = {
> -       .owner = THIS_MODULE,
> -       .llseek = no_llseek,
> -       .mmap = gasket_mmap,
> -       .open = gasket_open,
> -       .release = gasket_release,
> -       .unlocked_ioctl = gasket_ioctl,
> -};
> -
> -/* Perform final init and marks the device as active. */
> -int gasket_enable_device(struct gasket_dev *gasket_dev)
> -{
> -       int tbl_idx;
> -       int ret;
> -       const struct gasket_driver_desc *driver_desc =
> -               gasket_dev->internal_desc->driver_desc;
> -
> -       ret = gasket_interrupt_init(gasket_dev);
> -       if (ret) {
> -               dev_err(gasket_dev->dev,
> -                       "Critical failure to allocate interrupts: %d\n",
> ret);
> -               gasket_interrupt_cleanup(gasket_dev);
> -               return ret;
> -       }
> -
> -       for (tbl_idx = 0; tbl_idx < driver_desc->num_page_tables;
> tbl_idx++) {
> -               dev_dbg(gasket_dev->dev, "Initializing page table %d.\n",
> -                       tbl_idx);
> -               ret =
> gasket_page_table_init(&gasket_dev->page_table[tbl_idx],
> -
> &gasket_dev->bar_data[driver_desc->page_table_bar_index],
> -
> &driver_desc->page_table_configs[tbl_idx],
> -                                            gasket_dev->dev,
> -                                            gasket_dev->pci_dev);
> -               if (ret) {
> -                       dev_err(gasket_dev->dev,
> -                               "Couldn't init page table %d: %d\n",
> -                               tbl_idx, ret);
> -                       return ret;
> -               }
> -               /*
> -                * Make sure that the page table is clear and set to simple
> -                * addresses.
> -                */
> -               gasket_page_table_reset(gasket_dev->page_table[tbl_idx]);
> -       }
> -
> -       /*
> -        * hardware_revision_cb returns a positive integer (the rev) if
> -        * successful.)
> -        */
> -       ret = check_and_invoke_callback(gasket_dev,
> -                                       driver_desc->hardware_revision_cb);
> -       if (ret < 0) {
> -               dev_err(gasket_dev->dev,
> -                       "Error getting hardware revision: %d\n", ret);
> -               return ret;
> -       }
> -       gasket_dev->hardware_revision = ret;
> -
> -       /* device_status_cb returns a device status, not an error code. */
> -       gasket_dev->status = gasket_get_hw_status(gasket_dev);
> -       if (gasket_dev->status == GASKET_STATUS_DEAD)
> -               dev_err(gasket_dev->dev, "Device reported as
> unhealthy.\n");
> -
> -       ret = gasket_add_cdev(&gasket_dev->dev_info, &gasket_file_ops,
> -                             driver_desc->module);
> -       if (ret)
> -               return ret;
> -
> -       return 0;
> -}
> -EXPORT_SYMBOL(gasket_enable_device);
> -
> -static int __gasket_add_device(struct device *parent_dev,
> -                              struct gasket_internal_desc *internal_desc,
> -                              struct gasket_dev **gasket_devp)
> -{
> -       int ret;
> -       struct gasket_dev *gasket_dev;
> -       const struct gasket_driver_desc *driver_desc =
> -           internal_desc->driver_desc;
> -
> -       ret = gasket_alloc_dev(internal_desc, parent_dev, &gasket_dev);
> -       if (ret)
> -               return ret;
> -       if (IS_ERR(gasket_dev->dev_info.device)) {
> -               dev_err(parent_dev, "Cannot create %s device %s [ret =
> %ld]\n",
> -                       driver_desc->name, gasket_dev->dev_info.name,
> -                       PTR_ERR(gasket_dev->dev_info.device));
> -               ret = -ENODEV;
> -               goto free_gasket_dev;
> -       }
> -
> -       ret = gasket_sysfs_create_mapping(gasket_dev->dev_info.device,
> -                                         gasket_dev);
> -       if (ret)
> -               goto remove_device;
> -
> -       ret = gasket_sysfs_create_entries(gasket_dev->dev_info.device,
> -                                         gasket_sysfs_generic_attrs);
> -       if (ret)
> -               goto remove_sysfs_mapping;
> -
> -       *gasket_devp = gasket_dev;
> -       return 0;
> -
> -remove_sysfs_mapping:
> -       gasket_sysfs_remove_mapping(gasket_dev->dev_info.device);
> -remove_device:
> -       device_destroy(internal_desc->class, gasket_dev->dev_info.devt);
> -free_gasket_dev:
> -       gasket_free_dev(gasket_dev);
> -       return ret;
> -}
> -
> -static void __gasket_remove_device(struct gasket_internal_desc
> *internal_desc,
> -                                  struct gasket_dev *gasket_dev)
> -{
> -       gasket_sysfs_remove_mapping(gasket_dev->dev_info.device);
> -       device_destroy(internal_desc->class, gasket_dev->dev_info.devt);
> -       gasket_free_dev(gasket_dev);
> -}
> -
> -/*
> - * Add PCI gasket device.
> - *
> - * Called by Gasket device probe function.
> - * Allocates device metadata and maps device memory.  The device driver
> must
> - * call gasket_enable_device after driver init is complete to place the
> device
> - * in active use.
> - */
> -int gasket_pci_add_device(struct pci_dev *pci_dev,
> -                         struct gasket_dev **gasket_devp)
> -{
> -       int ret;
> -       struct gasket_internal_desc *internal_desc;
> -       struct gasket_dev *gasket_dev;
> -       struct device *parent;
> -
> -       dev_dbg(&pci_dev->dev, "add PCI gasket device\n");
> -
> -       mutex_lock(&g_mutex);
> -       internal_desc = lookup_pci_internal_desc(pci_dev);
> -       mutex_unlock(&g_mutex);
> -       if (!internal_desc) {
> -               dev_err(&pci_dev->dev,
> -                       "PCI add device called for unknown driver type\n");
> -               return -ENODEV;
> -       }
> -
> -       parent = &pci_dev->dev;
> -       ret = __gasket_add_device(parent, internal_desc, &gasket_dev);
> -       if (ret)
> -               return ret;
> -
> -       gasket_dev->pci_dev = pci_dev;
> -       ret = gasket_setup_pci(pci_dev, gasket_dev);
> -       if (ret)
> -               goto cleanup_pci;
> -
> -       /*
> -        * Once we've created the mapping structures successfully, attempt
> to
> -        * create a symlink to the pci directory of this object.
> -        */
> -       ret = sysfs_create_link(&gasket_dev->dev_info.device->kobj,
> -                               &pci_dev->dev.kobj,
> dev_name(&pci_dev->dev));
> -       if (ret) {
> -               dev_err(gasket_dev->dev,
> -                       "Cannot create sysfs pci link: %d\n", ret);
> -               goto cleanup_pci;
> -       }
> -
> -       *gasket_devp = gasket_dev;
> -       return 0;
> -
> -cleanup_pci:
> -       gasket_cleanup_pci(gasket_dev);
> -       __gasket_remove_device(internal_desc, gasket_dev);
> -       return ret;
> -}
> -EXPORT_SYMBOL(gasket_pci_add_device);
> -
> -/* Remove a PCI gasket device. */
> -void gasket_pci_remove_device(struct pci_dev *pci_dev)
> -{
> -       int i;
> -       struct gasket_internal_desc *internal_desc;
> -       struct gasket_dev *gasket_dev = NULL;
> -       /* Find the device desc. */
> -       mutex_lock(&g_mutex);
> -       internal_desc = lookup_pci_internal_desc(pci_dev);
> -       if (!internal_desc) {
> -               mutex_unlock(&g_mutex);
> -               return;
> -       }
> -       mutex_unlock(&g_mutex);
> -
> -       /* Now find the specific device */
> -       mutex_lock(&internal_desc->mutex);
> -       for (i = 0; i < GASKET_DEV_MAX; i++) {
> -               if (internal_desc->devs[i] &&
> -                   internal_desc->devs[i]->pci_dev == pci_dev) {
> -                       gasket_dev = internal_desc->devs[i];
> -                       break;
> -               }
> -       }
> -       mutex_unlock(&internal_desc->mutex);
> -
> -       if (!gasket_dev)
> -               return;
> -
> -       dev_dbg(gasket_dev->dev, "remove %s PCI gasket device\n",
> -               internal_desc->driver_desc->name);
> -
> -       gasket_cleanup_pci(gasket_dev);
> -       __gasket_remove_device(internal_desc, gasket_dev);
> -}
> -EXPORT_SYMBOL(gasket_pci_remove_device);
> -
> -/**
> - * Lookup a name by number in a num_name table.
> - * @num: Number to lookup.
> - * @table: Array of num_name structures, the table for the lookup.
> - *
> - * Description: Searches for num in the table.  If found, the
> - *             corresponding name is returned; otherwise NULL
> - *             is returned.
> - *
> - *             The table must have a NULL name pointer at the end.
> - */
> -const char *gasket_num_name_lookup(uint num,
> -                                  const struct gasket_num_name *table)
> -{
> -       uint i = 0;
> -
> -       while (table[i].snn_name) {
> -               if (num == table[i].snn_num)
> -                       break;
> -               ++i;
> -       }
> -
> -       return table[i].snn_name;
> -}
> -EXPORT_SYMBOL(gasket_num_name_lookup);
> -
> -int gasket_reset(struct gasket_dev *gasket_dev)
> -{
> -       int ret;
> -
> -       mutex_lock(&gasket_dev->mutex);
> -       ret = gasket_reset_nolock(gasket_dev);
> -       mutex_unlock(&gasket_dev->mutex);
> -       return ret;
> -}
> -EXPORT_SYMBOL(gasket_reset);
> -
> -int gasket_reset_nolock(struct gasket_dev *gasket_dev)
> -{
> -       int ret;
> -       int i;
> -       const struct gasket_driver_desc *driver_desc;
> -
> -       driver_desc = gasket_dev->internal_desc->driver_desc;
> -       if (!driver_desc->device_reset_cb)
> -               return 0;
> -
> -       ret = driver_desc->device_reset_cb(gasket_dev);
> -       if (ret) {
> -               dev_dbg(gasket_dev->dev, "Device reset cb returned %d.\n",
> -                       ret);
> -               return ret;
> -       }
> -
> -       /* Reinitialize the page tables and interrupt framework. */
> -       for (i = 0; i < driver_desc->num_page_tables; ++i)
> -               gasket_page_table_reset(gasket_dev->page_table[i]);
> -
> -       ret = gasket_interrupt_reinit(gasket_dev);
> -       if (ret) {
> -               dev_dbg(gasket_dev->dev, "Unable to reinit interrupts:
> %d.\n",
> -                       ret);
> -               return ret;
> -       }
> -
> -       /* Get current device health. */
> -       gasket_dev->status = gasket_get_hw_status(gasket_dev);
> -       if (gasket_dev->status == GASKET_STATUS_DEAD) {
> -               dev_dbg(gasket_dev->dev, "Device reported as dead.\n");
> -               return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -EXPORT_SYMBOL(gasket_reset_nolock);
> -
> -gasket_ioctl_permissions_cb_t
> -gasket_get_ioctl_permissions_cb(struct gasket_dev *gasket_dev)
> -{
> -       return
> gasket_dev->internal_desc->driver_desc->ioctl_permissions_cb;
> -}
> -EXPORT_SYMBOL(gasket_get_ioctl_permissions_cb);
> -
> -/* Get the driver structure for a given gasket_dev.
> - * @dev: pointer to gasket_dev, implementing the requested driver.
> - */
> -const struct gasket_driver_desc *gasket_get_driver_desc(struct gasket_dev
> *dev)
> -{
> -       return dev->internal_desc->driver_desc;
> -}
> -
> -/* Get the device structure for a given gasket_dev.
> - * @dev: pointer to gasket_dev, implementing the requested driver.
> - */
> -struct device *gasket_get_device(struct gasket_dev *dev)
> -{
> -       return dev->dev;
> -}
> -
> -/**
> - * Asynchronously waits on device.
> - * @gasket_dev: Device struct.
> - * @bar: Bar
> - * @offset: Register offset
> - * @mask: Register mask
> - * @val: Expected value
> - * @max_retries: number of sleep periods
> - * @delay_ms: Timeout in milliseconds
> - *
> - * Description: Busy waits for a specific combination of bits to be set
> on a
> - * Gasket register.
> - **/
> -int gasket_wait_with_reschedule(struct gasket_dev *gasket_dev, int bar,
> -                               u64 offset, u64 mask, u64 val,
> -                               uint max_retries, u64 delay_ms)
> -{
> -       uint retries = 0;
> -       u64 tmp;
> -
> -       while (retries < max_retries) {
> -               tmp = gasket_dev_read_64(gasket_dev, bar, offset);
> -               if ((tmp & mask) == val)
> -                       return 0;
> -               msleep(delay_ms);
> -               retries++;
> -       }
> -       dev_dbg(gasket_dev->dev, "%s timeout: reg %llx timeout (%llu
> ms)\n",
> -               __func__, offset, max_retries * delay_ms);
> -       return -ETIMEDOUT;
> -}
> -EXPORT_SYMBOL(gasket_wait_with_reschedule);
> -
> -/* See gasket_core.h for description. */
> -int gasket_register_device(const struct gasket_driver_desc *driver_desc)
> -{
> -       int i, ret;
> -       int desc_idx = -1;
> -       struct gasket_internal_desc *internal;
> -
> -       pr_debug("Loading %s driver version %s\n", driver_desc->name,
> -                driver_desc->driver_version);
> -       /* Check for duplicates and find a free slot. */
> -       mutex_lock(&g_mutex);
> -
> -       for (i = 0; i < GASKET_FRAMEWORK_DESC_MAX; i++) {
> -               if (g_descs[i].driver_desc == driver_desc) {
> -                       pr_err("%s driver already loaded/registered\n",
> -                              driver_desc->name);
> -                       mutex_unlock(&g_mutex);
> -                       return -EBUSY;
> -               }
> -       }
> -
> -       /* This and the above loop could be combined, but this reads
> easier. */
> -       for (i = 0; i < GASKET_FRAMEWORK_DESC_MAX; i++) {
> -               if (!g_descs[i].driver_desc) {
> -                       g_descs[i].driver_desc = driver_desc;
> -                       desc_idx = i;
> -                       break;
> -               }
> -       }
> -       mutex_unlock(&g_mutex);
> -
> -       if (desc_idx == -1) {
> -               pr_err("too many drivers loaded, max %d\n",
> -                      GASKET_FRAMEWORK_DESC_MAX);
> -               return -EBUSY;
> -       }
> -
> -       internal = &g_descs[desc_idx];
> -       mutex_init(&internal->mutex);
> -       memset(internal->devs, 0, sizeof(struct gasket_dev *) *
> GASKET_DEV_MAX);
> -       internal->class =
> -               class_create(driver_desc->module, driver_desc->name);
> -
> -       if (IS_ERR(internal->class)) {
> -               pr_err("Cannot register %s class [ret=%ld]\n",
> -                      driver_desc->name, PTR_ERR(internal->class));
> -               ret = PTR_ERR(internal->class);
> -               goto unregister_gasket_driver;
> -       }
> -
> -       ret = register_chrdev_region(MKDEV(driver_desc->major,
> -                                          driver_desc->minor),
> GASKET_DEV_MAX,
> -                                    driver_desc->name);
> -       if (ret) {
> -               pr_err("cannot register %s char driver [ret=%d]\n",
> -                      driver_desc->name, ret);
> -               goto destroy_class;
> -       }
> -
> -       return 0;
> -
> -destroy_class:
> -       class_destroy(internal->class);
> -
> -unregister_gasket_driver:
> -       mutex_lock(&g_mutex);
> -       g_descs[desc_idx].driver_desc = NULL;
> -       mutex_unlock(&g_mutex);
> -       return ret;
> -}
> -EXPORT_SYMBOL(gasket_register_device);
> -
> -/* See gasket_core.h for description. */
> -void gasket_unregister_device(const struct gasket_driver_desc
> *driver_desc)
> -{
> -       int i, desc_idx;
> -       struct gasket_internal_desc *internal_desc = NULL;
> -
> -       mutex_lock(&g_mutex);
> -       for (i = 0; i < GASKET_FRAMEWORK_DESC_MAX; i++) {
> -               if (g_descs[i].driver_desc == driver_desc) {
> -                       internal_desc = &g_descs[i];
> -                       desc_idx = i;
> -                       break;
> -               }
> -       }
> -
> -       if (!internal_desc) {
> -               mutex_unlock(&g_mutex);
> -               pr_err("request to unregister unknown desc: %s, %d:%d\n",
> -                      driver_desc->name, driver_desc->major,
> -                      driver_desc->minor);
> -               return;
> -       }
> -
> -       unregister_chrdev_region(MKDEV(driver_desc->major,
> driver_desc->minor),
> -                                GASKET_DEV_MAX);
> -
> -       class_destroy(internal_desc->class);
> -
> -       /* Finally, effectively "remove" the driver. */
> -       g_descs[desc_idx].driver_desc = NULL;
> -       mutex_unlock(&g_mutex);
> -
> -       pr_debug("removed %s driver\n", driver_desc->name);
> -}
> -EXPORT_SYMBOL(gasket_unregister_device);
> -
> -static int __init gasket_init(void)
> -{
> -       int i;
> -
> -       mutex_lock(&g_mutex);
> -       for (i = 0; i < GASKET_FRAMEWORK_DESC_MAX; i++) {
> -               g_descs[i].driver_desc = NULL;
> -               mutex_init(&g_descs[i].mutex);
> -       }
> -
> -       gasket_sysfs_init();
> -
> -       mutex_unlock(&g_mutex);
> -       return 0;
> -}
> -
> -MODULE_DESCRIPTION("Google Gasket driver framework");
> -MODULE_VERSION(GASKET_FRAMEWORK_VERSION);
> -MODULE_LICENSE("GPL v2");
> -MODULE_AUTHOR("Rob Springer <rspringer@google.com>");
> -module_init(gasket_init);
> diff --git a/drivers/staging/gasket/gasket_core.h
> b/drivers/staging/gasket/gasket_core.h
> deleted file mode 100644
> index c417acadb0d5..000000000000
> --- a/drivers/staging/gasket/gasket_core.h
> +++ /dev/null
> @@ -1,638 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Gasket generic driver. Defines the set of data types and functions
> necessary
> - * to define a driver using the Gasket generic driver framework.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -#ifndef __GASKET_CORE_H__
> -#define __GASKET_CORE_H__
> -
> -#include <linux/cdev.h>
> -#include <linux/compiler.h>
> -#include <linux/device.h>
> -#include <linux/init.h>
> -#include <linux/module.h>
> -#include <linux/pci.h>
> -#include <linux/sched.h>
> -#include <linux/slab.h>
> -
> -#include "gasket_constants.h"
> -
> -/**
> - * struct gasket_num_name - Map numbers to names.
> - * @ein_num: Number.
> - * @ein_name: Name associated with the number, a char pointer.
> - *
> - * This structure maps numbers to names. It is used to provide printable
> enum
> - * names, e.g {0, "DEAD"} or {1, "ALIVE"}.
> - */
> -struct gasket_num_name {
> -       uint snn_num;
> -       const char *snn_name;
> -};
> -
> -/*
> - * Register location for packed interrupts.
> - * Each value indicates the location of an interrupt field (in units of
> - * gasket_driver_desc->interrupt_pack_width) within the containing
> register.
> - * In other words, this indicates the shift to use when creating a mask to
> - * extract/set bits within a register for a given interrupt.
> - */
> -enum gasket_interrupt_packing {
> -       PACK_0 = 0,
> -       PACK_1 = 1,
> -       PACK_2 = 2,
> -       PACK_3 = 3,
> -       UNPACKED = 4,
> -};
> -
> -/* Type of the interrupt supported by the device. */
> -enum gasket_interrupt_type {
> -       PCI_MSIX = 0,
> -};
> -
> -/*
> - * Used to describe a Gasket interrupt. Contains an interrupt index, a
> register,
> - * and packing data for that interrupt. The register and packing data
> - * fields are relevant only for PCI_MSIX interrupt type and can be
> - * set to 0 for everything else.
> - */
> -struct gasket_interrupt_desc {
> -       /* Device-wide interrupt index/number. */
> -       int index;
> -       /* The register offset controlling this interrupt. */
> -       u64 reg;
> -       /* The location of this interrupt inside register reg, if packed.
> */
> -       int packing;
> -};
> -
> -/*
> - * This enum is used to identify memory regions being part of the physical
> - * memory that belongs to a device.
> - */
> -enum mappable_area_type {
> -       PCI_BAR = 0, /* Default */
> -       BUS_REGION,  /* For SYSBUS devices, i.e. AXI etc... */
> -       COHERENT_MEMORY
> -};
> -
> -/*
> - * Metadata for each BAR mapping.
> - * This struct is used so as to track PCI memory, I/O space, AXI and
> coherent
> - * memory area... i.e. memory objects which can be referenced in the
> device's
> - * mmap function.
> - */
> -struct gasket_bar_data {
> -       /* Virtual base address. */
> -       u8 __iomem *virt_base;
> -
> -       /* Physical base address. */
> -       ulong phys_base;
> -
> -       /* Length of the mapping. */
> -       ulong length_bytes;
> -
> -       /* Type of mappable area */
> -       enum mappable_area_type type;
> -};
> -
> -/* Maintains device open ownership data. */
> -struct gasket_ownership {
> -       /* 1 if the device is owned, 0 otherwise. */
> -       int is_owned;
> -
> -       /* TGID of the owner. */
> -       pid_t owner;
> -
> -       /* Count of current device opens in write mode. */
> -       int write_open_count;
> -};
> -
> -/* Page table modes of operation. */
> -enum gasket_page_table_mode {
> -       /* The page table is partitionable as normal, all simple by
> default. */
> -       GASKET_PAGE_TABLE_MODE_NORMAL,
> -
> -       /* All entries are always simple. */
> -       GASKET_PAGE_TABLE_MODE_SIMPLE,
> -
> -       /* All entries are always extended. No extended bit is used. */
> -       GASKET_PAGE_TABLE_MODE_EXTENDED,
> -};
> -
> -/* Page table configuration. One per table. */
> -struct gasket_page_table_config {
> -       /* The identifier/index of this page table. */
> -       int id;
> -
> -       /* The operation mode of this page table. */
> -       enum gasket_page_table_mode mode;
> -
> -       /* Total (first-level) entries in this page table. */
> -       ulong total_entries;
> -
> -       /* Base register for the page table. */
> -       int base_reg;
> -
> -       /*
> -        * Register containing the extended page table. This value is
> unused in
> -        * GASKET_PAGE_TABLE_MODE_SIMPLE and
> GASKET_PAGE_TABLE_MODE_EXTENDED
> -        * modes.
> -        */
> -       int extended_reg;
> -
> -       /* The bit index indicating whether a PT entry is extended. */
> -       int extended_bit;
> -};
> -
> -/* Maintains information about a device node. */
> -struct gasket_cdev_info {
> -       /* The internal name of this device. */
> -       char name[GASKET_NAME_MAX];
> -
> -       /* Device number. */
> -       dev_t devt;
> -
> -       /* Kernel-internal device structure. */
> -       struct device *device;
> -
> -       /* Character device for real. */
> -       struct cdev cdev;
> -
> -       /* Flag indicating if cdev_add has been called for the devices. */
> -       int cdev_added;
> -
> -       /* Pointer to the overall gasket_dev struct for this device. */
> -       struct gasket_dev *gasket_dev_ptr;
> -
> -       /* Ownership data for the device in question. */
> -       struct gasket_ownership ownership;
> -};
> -
> -/* Describes the offset and length of mmapable device BAR regions. */
> -struct gasket_mappable_region {
> -       u64 start;
> -       u64 length_bytes;
> -};
> -
> -/* Describe the offset, size, and permissions for a device bar. */
> -struct gasket_bar_desc {
> -       /*
> -        * The size of each PCI BAR range, in bytes. If a value is 0, that
> BAR
> -        * will not be mapped into kernel space at all.
> -        * For devices with 64 bit BARs, only elements 0, 2, and 4 should
> be
> -        * populated, and 1, 3, and 5 should be set to 0.
> -        * For example, for a device mapping 1M in each of the first two
> 64-bit
> -        * BARs, this field would be set as { 0x100000, 0, 0x100000, 0, 0,
> 0 }
> -        * (one number per bar_desc struct.)
> -        */
> -       u64 size;
> -       /* The permissions for this bar. (Should be
> VM_WRITE/VM_READ/VM_EXEC,
> -        * and can be or'd.) If set to GASKET_NOMAP, the bar will
> -        * not be used for mmapping.
> -        */
> -       ulong permissions;
> -       /* The memory address corresponding to the base of this bar, if
> used. */
> -       u64 base;
> -       /* The number of mappable regions in this bar. */
> -       int num_mappable_regions;
> -
> -       /* The mappable subregions of this bar. */
> -       const struct gasket_mappable_region *mappable_regions;
> -
> -       /* Type of mappable area */
> -       enum mappable_area_type type;
> -};
> -
> -/* Describes the offset, size, and permissions for a coherent buffer. */
> -struct gasket_coherent_buffer_desc {
> -       /* The size of the coherent buffer. */
> -       u64 size;
> -
> -       /* The permissions for this bar. (Should be
> VM_WRITE/VM_READ/VM_EXEC,
> -        * and can be or'd.) If set to GASKET_NOMAP, the bar will
> -        * not be used for mmaping.
> -        */
> -       ulong permissions;
> -
> -       /* device side address. */
> -       u64 base;
> -};
> -
> -/* Coherent buffer structure. */
> -struct gasket_coherent_buffer {
> -       /* Virtual base address. */
> -       u8 *virt_base;
> -
> -       /* Physical base address. */
> -       ulong phys_base;
> -
> -       /* Length of the mapping. */
> -       ulong length_bytes;
> -};
> -
> -/* Description of Gasket-specific permissions in the mmap field. */
> -enum gasket_mapping_options { GASKET_NOMAP = 0 };
> -
> -/* This struct represents an undefined bar that should never be mapped. */
> -#define GASKET_UNUSED_BAR
>       \
> -       {
>     \
> -               0, GASKET_NOMAP, 0, 0, NULL, 0
>      \
> -       }
> -
> -/* Internal data for a Gasket device. See gasket_core.c for more
> information. */
> -struct gasket_internal_desc;
> -
> -#define MAX_NUM_COHERENT_PAGES 16
> -
> -/*
> - * Device data for Gasket device instances.
> - *
> - * This structure contains the data required to manage a Gasket device.
> - */
> -struct gasket_dev {
> -       /* Pointer to the internal driver description for this device. */
> -       struct gasket_internal_desc *internal_desc;
> -
> -       /* Device info */
> -       struct device *dev;
> -
> -       /* PCI subsystem metadata. */
> -       struct pci_dev *pci_dev;
> -
> -       /* This device's index into internal_desc->devs. */
> -       int dev_idx;
> -
> -       /* The name of this device, as reported by the kernel. */
> -       char kobj_name[GASKET_NAME_MAX];
> -
> -       /* Virtual address of mapped BAR memory range. */
> -       struct gasket_bar_data bar_data[PCI_STD_NUM_BARS];
> -
> -       /* Coherent buffer. */
> -       struct gasket_coherent_buffer coherent_buffer;
> -
> -       /* Number of page tables for this device. */
> -       int num_page_tables;
> -
> -       /* Address translations. Page tables have a private
> implementation. */
> -       struct gasket_page_table *page_table[GASKET_MAX_NUM_PAGE_TABLES];
> -
> -       /* Interrupt data for this device. */
> -       struct gasket_interrupt_data *interrupt_data;
> -
> -       /* Status for this device - GASKET_STATUS_ALIVE or _DEAD. */
> -       uint status;
> -
> -       /* Number of times this device has been reset. */
> -       uint reset_count;
> -
> -       /* Dev information for the cdev node. */
> -       struct gasket_cdev_info dev_info;
> -
> -       /* Hardware revision value for this device. */
> -       int hardware_revision;
> -
> -       /* Protects access to per-device data (i.e. this structure). */
> -       struct mutex mutex;
> -
> -       /* cdev hash tracking/membership structure, Accel and legacy. */
> -       /* Unused until Accel is upstreamed. */
> -       struct hlist_node hlist_node;
> -       struct hlist_node legacy_hlist_node;
> -};
> -
> -/* Type of the ioctl handler callback. */
> -typedef long (*gasket_ioctl_handler_cb_t)(struct file *file, uint cmd,
> -                                         void __user *argp);
> -/* Type of the ioctl permissions check callback. See below. */
> -typedef int (*gasket_ioctl_permissions_cb_t)(struct file *filp, uint cmd,
> -                                            void __user *argp);
> -
> -/*
> - * Device type descriptor.
> - *
> - * This structure contains device-specific data needed to identify and
> address a
> - * type of device to be administered via the Gasket generic driver.
> - *
> - * Device IDs are per-driver. In other words, two drivers using the Gasket
> - * framework will each have a distinct device 0 (for example).
> - */
> -struct gasket_driver_desc {
> -       /* The name of this device type. */
> -       const char *name;
> -
> -       /* The name of this specific device model. */
> -       const char *chip_model;
> -
> -       /* The version of the chip specified in chip_model. */
> -       const char *chip_version;
> -
> -       /* The version of this driver: "1.0.0", "2.1.3", etc. */
> -       const char *driver_version;
> -
> -       /*
> -        * Non-zero if we should create "legacy" (device and device-class-
> -        * specific) character devices and sysfs nodes.
> -        */
> -       /* Unused until Accel is upstreamed. */
> -       int legacy_support;
> -
> -       /* Major and minor numbers identifying the device. */
> -       int major, minor;
> -
> -       /* Module structure for this driver. */
> -       struct module *module;
> -
> -       /* PCI ID table. */
> -       const struct pci_device_id *pci_id_table;
> -
> -       /* The number of page tables handled by this driver. */
> -       int num_page_tables;
> -
> -       /* The index of the bar containing the page tables. */
> -       int page_table_bar_index;
> -
> -       /* Registers used to control each page table. */
> -       const struct gasket_page_table_config *page_table_configs;
> -
> -       /* The bit index indicating whether a PT entry is extended. */
> -       int page_table_extended_bit;
> -
> -       /*
> -        * Legacy mmap address adjusment for legacy devices only. Should
> be 0
> -        * for any new device.
> -        */
> -       ulong legacy_mmap_address_offset;
> -
> -       /* Set of 6 bar descriptions that describe all PCIe bars.
> -        * Note that BUS/AXI devices (i.e. non PCI devices) use those.
> -        */
> -       struct gasket_bar_desc bar_descriptions[PCI_STD_NUM_BARS];
> -
> -       /*
> -        * Coherent buffer description.
> -        */
> -       struct gasket_coherent_buffer_desc coherent_buffer_description;
> -
> -       /* Interrupt type. (One of gasket_interrupt_type). */
> -       int interrupt_type;
> -
> -       /* Index of the bar containing the interrupt registers to program.
> */
> -       int interrupt_bar_index;
> -
> -       /* Number of interrupts in the gasket_interrupt_desc array */
> -       int num_interrupts;
> -
> -       /* Description of the interrupts for this device. */
> -       const struct gasket_interrupt_desc *interrupts;
> -
> -       /*
> -        * If this device packs multiple interrupt->MSI-X mappings into a
> -        * single register (i.e., "uses packed interrupts"), only a single
> bit
> -        * width is supported for each interrupt mapping
> (unpacked/"full-width"
> -        * interrupts are always supported). This value specifies that
> width. If
> -        * packed interrupts are not used, this value is ignored.
> -        */
> -       int interrupt_pack_width;
> -
> -       /* Driver callback functions - all may be NULL */
> -       /*
> -        * device_open_cb: Callback for when a device node is opened in
> write
> -        * mode.
> -        * @dev: The gasket_dev struct for this driver instance.
> -        *
> -        * This callback should perform device-specific setup that needs to
> -        * occur only once when a device is first opened.
> -        */
> -       int (*device_open_cb)(struct gasket_dev *dev);
> -
> -       /*
> -        * device_release_cb: Callback when a device is closed.
> -        * @gasket_dev: The gasket_dev struct for this driver instance.
> -        *
> -        * This callback is called whenever a device node fd is closed, as
> -        * opposed to device_close_cb, which is called when the _last_
> -        * descriptor for an open file is closed. This call is intended to
> -        * handle any per-user or per-fd cleanup.
> -        */
> -       int (*device_release_cb)(struct gasket_dev *gasket_dev,
> -                                struct file *file);
> -
> -       /*
> -        * device_close_cb: Callback for when a device node is closed for
> the
> -        * last time.
> -        * @dev: The gasket_dev struct for this driver instance.
> -        *
> -        * This callback should perform device-specific cleanup that only
> -        * needs to occur when the last reference to a device node is
> closed.
> -        *
> -        * This call is intended to handle and device-wide cleanup, as
> opposed
> -        * to per-fd cleanup (which should be handled by
> device_release_cb).
> -        */
> -       int (*device_close_cb)(struct gasket_dev *dev);
> -
> -       /*
> -        * get_mappable_regions_cb: Get descriptors of mappable device
> memory.
> -        * @gasket_dev: Pointer to the struct gasket_dev for this device.
> -        * @bar_index: BAR for which to retrieve memory ranges.
> -        * @mappable_regions: Out-pointer to the list of mappable regions
> on the
> -        * device/BAR for this process.
> -        * @num_mappable_regions: Out-pointer for the size of
> mappable_regions.
> -        *
> -        * Called when handling mmap(), this callback is used to determine
> which
> -        * regions of device memory may be mapped by the current process.
> This
> -        * information is then compared to mmap request to determine which
> -        * regions to actually map.
> -        */
> -       int (*get_mappable_regions_cb)(struct gasket_dev *gasket_dev,
> -                                      int bar_index,
> -                                      struct gasket_mappable_region
> **mappable_regions,
> -                                      int *num_mappable_regions);
> -
> -       /*
> -        * ioctl_permissions_cb: Check permissions for generic ioctls.
> -        * @filp: File structure pointer describing this node usage
> session.
> -        * @cmd: ioctl number to handle.
> -        * @arg: ioctl-specific data pointer.
> -        *
> -        * Returns 1 if the ioctl may be executed, 0 otherwise. If this
> callback
> -        * isn't specified a default routine will be used, that only
> allows the
> -        * original device opener (i.e, the "owner") to execute
> state-affecting
> -        * ioctls.
> -        */
> -       gasket_ioctl_permissions_cb_t ioctl_permissions_cb;
> -
> -       /*
> -        * ioctl_handler_cb: Callback to handle device-specific ioctls.
> -        * @filp: File structure pointer describing this node usage
> session.
> -        * @cmd: ioctl number to handle.
> -        * @arg: ioctl-specific data pointer.
> -        *
> -        * Invoked whenever an ioctl is called that the generic Gasket
> -        * framework doesn't support. If no cb is registered, unknown
> ioctls
> -        * return -EINVAL. Should return an error status (either -EINVAL or
> -        * the error result of the ioctl being handled).
> -        */
> -       gasket_ioctl_handler_cb_t ioctl_handler_cb;
> -
> -       /*
> -        * device_status_cb: Callback to determine device health.
> -        * @dev: Pointer to the gasket_dev struct for this device.
> -        *
> -        * Called to determine if the device is healthy or not. Should
> return
> -        * a member of the gasket_status_type enum.
> -        *
> -        */
> -       int (*device_status_cb)(struct gasket_dev *dev);
> -
> -       /*
> -        * hardware_revision_cb: Get the device's hardware revision.
> -        * @dev: Pointer to the gasket_dev struct for this device.
> -        *
> -        * Called to determine the reported rev of the physical hardware.
> -        * Revision should be >0. A negative return value is an error.
> -        */
> -       int (*hardware_revision_cb)(struct gasket_dev *dev);
> -
> -       /*
> -        * device_reset_cb: Reset the hardware in question.
> -        * @dev: Pointer to the gasket_dev structure for this device.
> -        *
> -        * Called by reset ioctls. This function should not
> -        * lock the gasket_dev mutex. It should return 0 on success
> -        * and an error on failure.
> -        */
> -       int (*device_reset_cb)(struct gasket_dev *dev);
> -};
> -
> -/*
> - * Register the specified device type with the framework.
> - * @desc: Populated/initialized device type descriptor.
> - *
> - * This function does _not_ take ownership of desc; the underlying struct
> must
> - * exist until the matching call to gasket_unregister_device.
> - * This function should be called from your driver's module_init function.
> - */
> -int gasket_register_device(const struct gasket_driver_desc *desc);
> -
> -/*
> - * Remove the specified device type from the framework.
> - * @desc: Descriptor for the device type to unregister; it should have
> been
> - *        passed to gasket_register_device in a previous call.
> - *
> - * This function should be called from your driver's module_exit function.
> - */
> -void gasket_unregister_device(const struct gasket_driver_desc *desc);
> -
> -/* Add a PCI gasket device. */
> -int gasket_pci_add_device(struct pci_dev *pci_dev,
> -                         struct gasket_dev **gasket_devp);
> -/* Remove a PCI gasket device. */
> -void gasket_pci_remove_device(struct pci_dev *pci_dev);
> -
> -/* Enable a Gasket device. */
> -int gasket_enable_device(struct gasket_dev *gasket_dev);
> -
> -/* Disable a Gasket device. */
> -void gasket_disable_device(struct gasket_dev *gasket_dev);
> -
> -/*
> - * Reset the Gasket device.
> - * @gasket_dev: Gasket device struct.
> - *
> - * Calls device_reset_cb. Returns 0 on success and an error code
> othewrise.
> - * gasket_reset_nolock will not lock the mutex, gasket_reset will.
> - *
> - */
> -int gasket_reset(struct gasket_dev *gasket_dev);
> -int gasket_reset_nolock(struct gasket_dev *gasket_dev);
> -
> -/*
> - * Memory management functions. These will likely be spun off into their
> own
> - * file in the future.
> - */
> -
> -/* Unmaps the specified mappable region from a VMA. */
> -int gasket_mm_unmap_region(const struct gasket_dev *gasket_dev,
> -                          struct vm_area_struct *vma,
> -                          const struct gasket_mappable_region
> *map_region);
> -
> -/*
> - * Get the ioctl permissions callback.
> - * @gasket_dev: Gasket device structure.
> - */
> -gasket_ioctl_permissions_cb_t
> -gasket_get_ioctl_permissions_cb(struct gasket_dev *gasket_dev);
> -
> -/**
> - * Lookup a name by number in a num_name table.
> - * @num: Number to lookup.
> - * @table: Array of num_name structures, the table for the lookup.
> - *
> - */
> -const char *gasket_num_name_lookup(uint num,
> -                                  const struct gasket_num_name *table);
> -
> -/* Handy inlines */
> -static inline ulong gasket_dev_read_64(struct gasket_dev *gasket_dev, int
> bar,
> -                                      ulong location)
> -{
> -       return
> readq_relaxed(&gasket_dev->bar_data[bar].virt_base[location]);
> -}
> -
> -static inline void gasket_dev_write_64(struct gasket_dev *dev, u64 value,
> -                                      int bar, ulong location)
> -{
> -       writeq_relaxed(value, &dev->bar_data[bar].virt_base[location]);
> -}
> -
> -static inline void gasket_dev_write_32(struct gasket_dev *dev, u32 value,
> -                                      int bar, ulong location)
> -{
> -       writel_relaxed(value, &dev->bar_data[bar].virt_base[location]);
> -}
> -
> -static inline u32 gasket_dev_read_32(struct gasket_dev *dev, int bar,
> -                                    ulong location)
> -{
> -       return readl_relaxed(&dev->bar_data[bar].virt_base[location]);
> -}
> -
> -static inline void gasket_read_modify_write_64(struct gasket_dev *dev,
> int bar,
> -                                              ulong location, u64 value,
> -                                              u64 mask_width, u64
> mask_shift)
> -{
> -       u64 mask, tmp;
> -
> -       tmp = gasket_dev_read_64(dev, bar, location);
> -       mask = ((1ULL << mask_width) - 1) << mask_shift;
> -       tmp = (tmp & ~mask) | (value << mask_shift);
> -       gasket_dev_write_64(dev, tmp, bar, location);
> -}
> -
> -static inline void gasket_read_modify_write_32(struct gasket_dev *dev,
> int bar,
> -                                              ulong location, u32 value,
> -                                              u32 mask_width, u32
> mask_shift)
> -{
> -       u32 mask, tmp;
> -
> -       tmp = gasket_dev_read_32(dev, bar, location);
> -       mask = ((1 << mask_width) - 1) << mask_shift;
> -       tmp = (tmp & ~mask) | (value << mask_shift);
> -       gasket_dev_write_32(dev, tmp, bar, location);
> -}
> -
> -/* Get the Gasket driver structure for a given device. */
> -const struct gasket_driver_desc *gasket_get_driver_desc(struct gasket_dev
> *dev);
> -
> -/* Get the device structure for a given device. */
> -struct device *gasket_get_device(struct gasket_dev *dev);
> -
> -/* Helper function, Asynchronous waits on a given set of bits. */
> -int gasket_wait_with_reschedule(struct gasket_dev *gasket_dev, int bar,
> -                               u64 offset, u64 mask, u64 val,
> -                               uint max_retries, u64 delay_ms);
> -
> -#endif /* __GASKET_CORE_H__ */
> diff --git a/drivers/staging/gasket/gasket_interrupt.c
> b/drivers/staging/gasket/gasket_interrupt.c
> deleted file mode 100644
> index 864342acfd86..000000000000
> --- a/drivers/staging/gasket/gasket_interrupt.c
> +++ /dev/null
> @@ -1,515 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/* Copyright (C) 2018 Google, Inc. */
> -
> -#include "gasket_interrupt.h"
> -
> -#include "gasket_constants.h"
> -#include "gasket_core.h"
> -#include "gasket_sysfs.h"
> -#include <linux/device.h>
> -#include <linux/interrupt.h>
> -#include <linux/printk.h>
> -#ifdef GASKET_KERNEL_TRACE_SUPPORT
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/gasket_interrupt.h>
> -#else
> -#define trace_gasket_interrupt_event(x, ...)
> -#endif
> -/* Retry attempts if the requested number of interrupts aren't available.
> */
> -#define MSIX_RETRY_COUNT 3
> -
> -/* Instance interrupt management data. */
> -struct gasket_interrupt_data {
> -       /* The name associated with this interrupt data. */
> -       const char *name;
> -
> -       /* Interrupt type. See gasket_interrupt_type in gasket_core.h */
> -       int type;
> -
> -       /* The PCI device [if any] associated with the owning device. */
> -       struct pci_dev *pci_dev;
> -
> -       /* Set to 1 if MSI-X has successfully been configred, 0 otherwise.
> */
> -       int msix_configured;
> -
> -       /* The number of interrupts requested by the owning device. */
> -       int num_interrupts;
> -
> -       /* A pointer to the interrupt descriptor struct for this device. */
> -       const struct gasket_interrupt_desc *interrupts;
> -
> -       /* The index of the bar into which interrupts should be mapped. */
> -       int interrupt_bar_index;
> -
> -       /* The width of a single interrupt in a packed interrupt register.
> */
> -       int pack_width;
> -
> -       /*
> -        * Design-wise, these elements should be bundled together, but
> -        * pci_enable_msix's interface requires that they be managed
> -        * individually (requires array of struct msix_entry).
> -        */
> -
> -       /* The number of successfully configured interrupts. */
> -       int num_configured;
> -
> -       /* The MSI-X data for each requested/configured interrupt. */
> -       struct msix_entry *msix_entries;
> -
> -       /* The eventfd "callback" data for each interrupt. */
> -       struct eventfd_ctx **eventfd_ctxs;
> -
> -       /* The number of times each interrupt has been called. */
> -       ulong *interrupt_counts;
> -
> -       /* Linux IRQ number. */
> -       int irq;
> -};
> -
> -/* Structures to display interrupt counts in sysfs. */
> -enum interrupt_sysfs_attribute_type {
> -       ATTR_INTERRUPT_COUNTS,
> -};
> -
> -/* Set up device registers for interrupt handling. */
> -static void gasket_interrupt_setup(struct gasket_dev *gasket_dev)
> -{
> -       int i;
> -       int pack_shift;
> -       ulong mask;
> -       ulong value;
> -       struct gasket_interrupt_data *interrupt_data =
> -               gasket_dev->interrupt_data;
> -
> -       if (!interrupt_data) {
> -               dev_dbg(gasket_dev->dev, "Interrupt data is not
> initialized\n");
> -               return;
> -       }
> -
> -       dev_dbg(gasket_dev->dev, "Running interrupt setup\n");
> -
> -       /* Setup the MSIX table. */
> -
> -       for (i = 0; i < interrupt_data->num_interrupts; i++) {
> -               /*
> -                * If the interrupt is not packed, we can write the index
> into
> -                * the register directly. If not, we need to deal with a
> read-
> -                * modify-write and shift based on the packing index.
> -                */
> -               dev_dbg(gasket_dev->dev,
> -                       "Setting up interrupt index %d with index 0x%llx
> and packing %d\n",
> -                       interrupt_data->interrupts[i].index,
> -                       interrupt_data->interrupts[i].reg,
> -                       interrupt_data->interrupts[i].packing);
> -               if (interrupt_data->interrupts[i].packing == UNPACKED) {
> -                       value = interrupt_data->interrupts[i].index;
> -               } else {
> -                       switch (interrupt_data->interrupts[i].packing) {
> -                       case PACK_0:
> -                               pack_shift = 0;
> -                               break;
> -                       case PACK_1:
> -                               pack_shift = interrupt_data->pack_width;
> -                               break;
> -                       case PACK_2:
> -                               pack_shift = 2 *
> interrupt_data->pack_width;
> -                               break;
> -                       case PACK_3:
> -                               pack_shift = 3 *
> interrupt_data->pack_width;
> -                               break;
> -                       default:
> -                               dev_dbg(gasket_dev->dev,
> -                                       "Found interrupt description with
> unknown enum %d\n",
> -
>  interrupt_data->interrupts[i].packing);
> -                               return;
> -                       }
> -
> -                       mask = ~(0xFFFF << pack_shift);
> -                       value = gasket_dev_read_64(gasket_dev,
> -
> interrupt_data->interrupt_bar_index,
> -
> interrupt_data->interrupts[i].reg);
> -                       value &= mask;
> -                       value |= interrupt_data->interrupts[i].index
> -                                << pack_shift;
> -               }
> -               gasket_dev_write_64(gasket_dev, value,
> -                                   interrupt_data->interrupt_bar_index,
> -                                   interrupt_data->interrupts[i].reg);
> -       }
> -}
> -
> -static void
> -gasket_handle_interrupt(struct gasket_interrupt_data *interrupt_data,
> -                       int interrupt_index)
> -{
> -       struct eventfd_ctx *ctx;
> -
> -       trace_gasket_interrupt_event(interrupt_data->name,
> interrupt_index);
> -       ctx = interrupt_data->eventfd_ctxs[interrupt_index];
> -       if (ctx)
> -               eventfd_signal(ctx, 1);
> -
> -       ++(interrupt_data->interrupt_counts[interrupt_index]);
> -}
> -
> -static irqreturn_t gasket_msix_interrupt_handler(int irq, void *dev_id)
> -{
> -       struct gasket_interrupt_data *interrupt_data = dev_id;
> -       int interrupt = -1;
> -       int i;
> -
> -       /* If this linear lookup is a problem, we can maintain a map/hash.
> */
> -       for (i = 0; i < interrupt_data->num_interrupts; i++) {
> -               if (interrupt_data->msix_entries[i].vector == irq) {
> -                       interrupt = interrupt_data->msix_entries[i].entry;
> -                       break;
> -               }
> -       }
> -       if (interrupt == -1) {
> -               pr_err("Received unknown irq %d\n", irq);
> -               return IRQ_HANDLED;
> -       }
> -       gasket_handle_interrupt(interrupt_data, interrupt);
> -       return IRQ_HANDLED;
> -}
> -
> -static int
> -gasket_interrupt_msix_init(struct gasket_interrupt_data *interrupt_data)
> -{
> -       int ret = 1;
> -       int i;
> -
> -       interrupt_data->msix_entries =
> -               kcalloc(interrupt_data->num_interrupts,
> -                       sizeof(*interrupt_data->msix_entries), GFP_KERNEL);
> -       if (!interrupt_data->msix_entries)
> -               return -ENOMEM;
> -
> -       for (i = 0; i < interrupt_data->num_interrupts; i++) {
> -               interrupt_data->msix_entries[i].entry = i;
> -               interrupt_data->msix_entries[i].vector = 0;
> -               interrupt_data->eventfd_ctxs[i] = NULL;
> -       }
> -
> -       /* Retry MSIX_RETRY_COUNT times if not enough IRQs are available.
> */
> -       for (i = 0; i < MSIX_RETRY_COUNT && ret > 0; i++)
> -               ret = pci_enable_msix_exact(interrupt_data->pci_dev,
> -                                           interrupt_data->msix_entries,
> -
>  interrupt_data->num_interrupts);
> -
> -       if (ret)
> -               return ret > 0 ? -EBUSY : ret;
> -       interrupt_data->msix_configured = 1;
> -
> -       for (i = 0; i < interrupt_data->num_interrupts; i++) {
> -               ret = request_irq(interrupt_data->msix_entries[i].vector,
> -                                 gasket_msix_interrupt_handler, 0,
> -                                 interrupt_data->name, interrupt_data);
> -
> -               if (ret) {
> -                       dev_err(&interrupt_data->pci_dev->dev,
> -                               "Cannot get IRQ for interrupt %d, vector
> %d; "
> -                               "%d\n",
> -                               i, interrupt_data->msix_entries[i].vector,
> ret);
> -                       return ret;
> -               }
> -
> -               interrupt_data->num_configured++;
> -       }
> -
> -       return 0;
> -}
> -
> -/*
> - * On QCM DragonBoard, we exit gasket_interrupt_msix_init() and kernel
> interrupt
> - * setup code with MSIX vectors masked. This is wrong because nothing
> else in
> - * the driver will normally touch the MSIX vectors.
> - *
> - * As a temporary hack, force unmasking there.
> - *
> - * TODO: Figure out why QCM kernel doesn't unmask the MSIX vectors, after
> - * gasket_interrupt_msix_init(), and remove this code.
> - */
> -static void force_msix_interrupt_unmasking(struct gasket_dev *gasket_dev)
> -{
> -       int i;
> -#define MSIX_VECTOR_SIZE 16
> -#define MSIX_MASK_BIT_OFFSET 12
> -#define APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE 0x46800
> -       for (i = 0; i < gasket_dev->interrupt_data->num_configured; i++) {
> -               /* Check if the MSIX vector is unmasked */
> -               ulong location = APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE +
> -                                MSIX_MASK_BIT_OFFSET + i *
> MSIX_VECTOR_SIZE;
> -               u32 mask =
> -                       gasket_dev_read_32(gasket_dev,
> -
> gasket_dev->interrupt_data->interrupt_bar_index,
> -                                          location);
> -               if (!(mask & 1))
> -                       continue;
> -               /* Unmask the msix vector (clear 32 bits) */
> -               gasket_dev_write_32(gasket_dev, 0,
> -
>  gasket_dev->interrupt_data->interrupt_bar_index,
> -                                   location);
> -       }
> -#undef MSIX_VECTOR_SIZE
> -#undef MSIX_MASK_BIT_OFFSET
> -#undef APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE
> -}
> -
> -static ssize_t interrupt_sysfs_show(struct device *device,
> -                                   struct device_attribute *attr, char
> *buf)
> -{
> -       int i, ret;
> -       ssize_t written = 0, total_written = 0;
> -       struct gasket_interrupt_data *interrupt_data;
> -       struct gasket_dev *gasket_dev;
> -       struct gasket_sysfs_attribute *gasket_attr;
> -       enum interrupt_sysfs_attribute_type sysfs_type;
> -
> -       gasket_dev = gasket_sysfs_get_device_data(device);
> -       if (!gasket_dev) {
> -               dev_dbg(device, "No sysfs mapping found for device\n");
> -               return 0;
> -       }
> -
> -       gasket_attr = gasket_sysfs_get_attr(device, attr);
> -       if (!gasket_attr) {
> -               dev_dbg(device, "No sysfs attr data found for device\n");
> -               gasket_sysfs_put_device_data(device, gasket_dev);
> -               return 0;
> -       }
> -
> -       sysfs_type = (enum interrupt_sysfs_attribute_type)
> -               gasket_attr->data.attr_type;
> -       interrupt_data = gasket_dev->interrupt_data;
> -       switch (sysfs_type) {
> -       case ATTR_INTERRUPT_COUNTS:
> -               for (i = 0; i < interrupt_data->num_interrupts; ++i) {
> -                       written =
> -                               scnprintf(buf, PAGE_SIZE - total_written,
> -                                         "0x%02x: %ld\n", i,
> -
>  interrupt_data->interrupt_counts[i]);
> -                       total_written += written;
> -                       buf += written;
> -               }
> -               ret = total_written;
> -               break;
> -       default:
> -               dev_dbg(gasket_dev->dev, "Unknown attribute: %s\n",
> -                       attr->attr.name);
> -               ret = 0;
> -               break;
> -       }
> -
> -       gasket_sysfs_put_attr(device, gasket_attr);
> -       gasket_sysfs_put_device_data(device, gasket_dev);
> -       return ret;
> -}
> -
> -static struct gasket_sysfs_attribute interrupt_sysfs_attrs[] = {
> -       GASKET_SYSFS_RO(interrupt_counts, interrupt_sysfs_show,
> -                       ATTR_INTERRUPT_COUNTS),
> -       GASKET_END_OF_ATTR_ARRAY,
> -};
> -
> -int gasket_interrupt_init(struct gasket_dev *gasket_dev)
> -{
> -       int ret;
> -       struct gasket_interrupt_data *interrupt_data;
> -       const struct gasket_driver_desc *driver_desc =
> -               gasket_get_driver_desc(gasket_dev);
> -
> -       interrupt_data = kzalloc(sizeof(*interrupt_data), GFP_KERNEL);
> -       if (!interrupt_data)
> -               return -ENOMEM;
> -       gasket_dev->interrupt_data = interrupt_data;
> -       interrupt_data->name = driver_desc->name;
> -       interrupt_data->type = driver_desc->interrupt_type;
> -       interrupt_data->pci_dev = gasket_dev->pci_dev;
> -       interrupt_data->num_interrupts = driver_desc->num_interrupts;
> -       interrupt_data->interrupts = driver_desc->interrupts;
> -       interrupt_data->interrupt_bar_index =
> driver_desc->interrupt_bar_index;
> -       interrupt_data->pack_width = driver_desc->interrupt_pack_width;
> -       interrupt_data->num_configured = 0;
> -
> -       interrupt_data->eventfd_ctxs =
> -               kcalloc(driver_desc->num_interrupts,
> -                       sizeof(*interrupt_data->eventfd_ctxs), GFP_KERNEL);
> -       if (!interrupt_data->eventfd_ctxs) {
> -               kfree(interrupt_data);
> -               return -ENOMEM;
> -       }
> -
> -       interrupt_data->interrupt_counts =
> -               kcalloc(driver_desc->num_interrupts,
> -                       sizeof(*interrupt_data->interrupt_counts),
> GFP_KERNEL);
> -       if (!interrupt_data->interrupt_counts) {
> -               kfree(interrupt_data->eventfd_ctxs);
> -               kfree(interrupt_data);
> -               return -ENOMEM;
> -       }
> -
> -       switch (interrupt_data->type) {
> -       case PCI_MSIX:
> -               ret = gasket_interrupt_msix_init(interrupt_data);
> -               if (ret)
> -                       break;
> -               force_msix_interrupt_unmasking(gasket_dev);
> -               break;
> -
> -       default:
> -               ret = -EINVAL;
> -       }
> -
> -       if (ret) {
> -               /* Failing to setup interrupts will cause the device to
> report
> -                * GASKET_STATUS_LAMED. But it is not fatal.
> -                */
> -               dev_warn(gasket_dev->dev,
> -                        "Couldn't initialize interrupts: %d\n", ret);
> -               return 0;
> -       }
> -
> -       gasket_interrupt_setup(gasket_dev);
> -       gasket_sysfs_create_entries(gasket_dev->dev_info.device,
> -                                   interrupt_sysfs_attrs);
> -
> -       return 0;
> -}
> -
> -static void
> -gasket_interrupt_msix_cleanup(struct gasket_interrupt_data
> *interrupt_data)
> -{
> -       int i;
> -
> -       for (i = 0; i < interrupt_data->num_configured; i++)
> -               free_irq(interrupt_data->msix_entries[i].vector,
> -                        interrupt_data);
> -       interrupt_data->num_configured = 0;
> -
> -       if (interrupt_data->msix_configured)
> -               pci_disable_msix(interrupt_data->pci_dev);
> -       interrupt_data->msix_configured = 0;
> -       kfree(interrupt_data->msix_entries);
> -}
> -
> -int gasket_interrupt_reinit(struct gasket_dev *gasket_dev)
> -{
> -       int ret;
> -
> -       if (!gasket_dev->interrupt_data) {
> -               dev_dbg(gasket_dev->dev,
> -                       "Attempted to reinit uninitialized interrupt
> data\n");
> -               return -EINVAL;
> -       }
> -
> -       switch (gasket_dev->interrupt_data->type) {
> -       case PCI_MSIX:
> -               gasket_interrupt_msix_cleanup(gasket_dev->interrupt_data);
> -               ret =
> gasket_interrupt_msix_init(gasket_dev->interrupt_data);
> -               if (ret)
> -                       break;
> -               force_msix_interrupt_unmasking(gasket_dev);
> -               break;
> -
> -       default:
> -               ret = -EINVAL;
> -       }
> -
> -       if (ret) {
> -               /* Failing to setup interrupts will cause the device
> -                * to report GASKET_STATUS_LAMED, but is not fatal.
> -                */
> -               dev_warn(gasket_dev->dev, "Couldn't reinit interrupts:
> %d\n",
> -                        ret);
> -               return 0;
> -       }
> -
> -       gasket_interrupt_setup(gasket_dev);
> -
> -       return 0;
> -}
> -
> -/* See gasket_interrupt.h for description. */
> -int gasket_interrupt_reset_counts(struct gasket_dev *gasket_dev)
> -{
> -       dev_dbg(gasket_dev->dev, "Clearing interrupt counts\n");
> -       memset(gasket_dev->interrupt_data->interrupt_counts, 0,
> -              gasket_dev->interrupt_data->num_interrupts *
> -
>  sizeof(*gasket_dev->interrupt_data->interrupt_counts));
> -       return 0;
> -}
> -
> -/* See gasket_interrupt.h for description. */
> -void gasket_interrupt_cleanup(struct gasket_dev *gasket_dev)
> -{
> -       struct gasket_interrupt_data *interrupt_data =
> -               gasket_dev->interrupt_data;
> -       /*
> -        * It is possible to get an error code from gasket_interrupt_init
> -        * before interrupt_data has been allocated, so check it.
> -        */
> -       if (!interrupt_data)
> -               return;
> -
> -       switch (interrupt_data->type) {
> -       case PCI_MSIX:
> -               gasket_interrupt_msix_cleanup(interrupt_data);
> -               break;
> -
> -       default:
> -               break;
> -       }
> -
> -       kfree(interrupt_data->interrupt_counts);
> -       kfree(interrupt_data->eventfd_ctxs);
> -       kfree(interrupt_data);
> -       gasket_dev->interrupt_data = NULL;
> -}
> -
> -int gasket_interrupt_system_status(struct gasket_dev *gasket_dev)
> -{
> -       if (!gasket_dev->interrupt_data) {
> -               dev_dbg(gasket_dev->dev, "Interrupt data is null\n");
> -               return GASKET_STATUS_DEAD;
> -       }
> -
> -       if (gasket_dev->interrupt_data->num_configured !=
> -               gasket_dev->interrupt_data->num_interrupts) {
> -               dev_dbg(gasket_dev->dev,
> -                       "Not all interrupts were configured\n");
> -               return GASKET_STATUS_LAMED;
> -       }
> -
> -       return GASKET_STATUS_ALIVE;
> -}
> -
> -int gasket_interrupt_set_eventfd(struct gasket_interrupt_data
> *interrupt_data,
> -                                int interrupt, int event_fd)
> -{
> -       struct eventfd_ctx *ctx;
> -
> -       if (interrupt < 0 || interrupt >= interrupt_data->num_interrupts)
> -               return -EINVAL;
> -
> -       ctx = eventfd_ctx_fdget(event_fd);
> -
> -       if (IS_ERR(ctx))
> -               return PTR_ERR(ctx);
> -
> -       interrupt_data->eventfd_ctxs[interrupt] = ctx;
> -       return 0;
> -}
> -
> -int gasket_interrupt_clear_eventfd(struct gasket_interrupt_data
> *interrupt_data,
> -                                  int interrupt)
> -{
> -       if (interrupt < 0 || interrupt >= interrupt_data->num_interrupts)
> -               return -EINVAL;
> -
> -       if (interrupt_data->eventfd_ctxs[interrupt]) {
> -               eventfd_ctx_put(interrupt_data->eventfd_ctxs[interrupt]);
> -               interrupt_data->eventfd_ctxs[interrupt] = NULL;
> -       }
> -       return 0;
> -}
> diff --git a/drivers/staging/gasket/gasket_interrupt.h
> b/drivers/staging/gasket/gasket_interrupt.h
> deleted file mode 100644
> index 85526a1374a1..000000000000
> --- a/drivers/staging/gasket/gasket_interrupt.h
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Gasket common interrupt module. Defines functions for enabling
> - * eventfd-triggered interrupts between a Gasket device and a host
> process.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -#ifndef __GASKET_INTERRUPT_H__
> -#define __GASKET_INTERRUPT_H__
> -
> -#include <linux/eventfd.h>
> -#include <linux/pci.h>
> -
> -#include "gasket_core.h"
> -
> -/* Note that this currently assumes that device interrupts are a dense
> set,
> - * numbered from 0 - (num_interrupts - 1). Should this have to change,
> these
> - * APIs will have to be updated.
> - */
> -
> -/* Opaque type used to hold interrupt subsystem data. */
> -struct gasket_interrupt_data;
> -
> -/*
> - * Initialize the interrupt module.
> - * @gasket_dev: The Gasket device structure for the device to be initted.
> - */
> -int gasket_interrupt_init(struct gasket_dev *gasket_dev);
> -
> -/*
> - * Clean up a device's interrupt structure.
> - * @gasket_dev: The Gasket information structure for this device.
> - *
> - * Cleans up the device's interrupts and deallocates data.
> - */
> -void gasket_interrupt_cleanup(struct gasket_dev *gasket_dev);
> -
> -/*
> - * Clean up and re-initialize the MSI-x subsystem.
> - * @gasket_dev: The Gasket information structure for this device.
> - *
> - * Performs a teardown of the MSI-x subsystem and re-initializes it. Does
> not
> - * free the underlying data structures. Returns 0 on success and an error
> code
> - * on error.
> - */
> -int gasket_interrupt_reinit(struct gasket_dev *gasket_dev);
> -
> -/*
> - * Reset the counts stored in the interrupt subsystem.
> - * @gasket_dev: The Gasket information structure for this device.
> - *
> - * Sets the counts of all interrupts in the subsystem to 0.
> - */
> -int gasket_interrupt_reset_counts(struct gasket_dev *gasket_dev);
> -
> -/*
> - * Associates an eventfd with a device interrupt.
> - * @data: Pointer to device interrupt data.
> - * @interrupt: The device interrupt to configure.
> - * @event_fd: The eventfd to associate with the interrupt.
> - *
> - * Prepares the host to receive notification of device interrupts by
> associating
> - * event_fd with interrupt. Upon receipt of a device interrupt, event_fd
> will be
> - * signaled, after successful configuration.
> - *
> - * Returns 0 on success, a negative error code otherwise.
> - */
> -int gasket_interrupt_set_eventfd(struct gasket_interrupt_data
> *interrupt_data,
> -                                int interrupt, int event_fd);
> -
> -/*
> - * Removes an interrupt-eventfd association.
> - * @data: Pointer to device interrupt data.
> - * @interrupt: The device interrupt to de-associate.
> - *
> - * Removes any eventfd associated with the specified interrupt, if any.
> - */
> -int gasket_interrupt_clear_eventfd(struct gasket_interrupt_data
> *interrupt_data,
> -                                  int interrupt);
> -
> -/*
> - * The below functions exist for backwards compatibility.
> - * No new uses should be written.
> - */
> -/*
> - * Get the health of the interrupt subsystem.
> - * @gasket_dev: The Gasket device struct.
> - *
> - * Returns DEAD if not set up, LAMED if initialization failed, and ALIVE
> - * otherwise.
> - */
> -
> -int gasket_interrupt_system_status(struct gasket_dev *gasket_dev);
> -
> -#endif
> diff --git a/drivers/staging/gasket/gasket_ioctl.c
> b/drivers/staging/gasket/gasket_ioctl.c
> deleted file mode 100644
> index aa65f4fbf860..000000000000
> --- a/drivers/staging/gasket/gasket_ioctl.c
> +++ /dev/null
> @@ -1,388 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/* Copyright (C) 2018 Google, Inc. */
> -#include "gasket.h"
> -#include "gasket_ioctl.h"
> -#include "gasket_constants.h"
> -#include "gasket_core.h"
> -#include "gasket_interrupt.h"
> -#include "gasket_page_table.h"
> -#include <linux/compiler.h>
> -#include <linux/device.h>
> -#include <linux/fs.h>
> -#include <linux/uaccess.h>
> -
> -#ifdef GASKET_KERNEL_TRACE_SUPPORT
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/gasket_ioctl.h>
> -#else
> -#define trace_gasket_ioctl_entry(x, ...)
> -#define trace_gasket_ioctl_exit(x)
> -#define trace_gasket_ioctl_integer_data(x)
> -#define trace_gasket_ioctl_eventfd_data(x, ...)
> -#define trace_gasket_ioctl_page_table_data(x, ...)
> -#define trace_gasket_ioctl_config_coherent_allocator(x, ...)
> -#endif
> -
> -/* Associate an eventfd with an interrupt. */
> -static int gasket_set_event_fd(struct gasket_dev *gasket_dev,
> -                              struct gasket_interrupt_eventfd __user
> *argp)
> -{
> -       struct gasket_interrupt_eventfd die;
> -
> -       if (copy_from_user(&die, argp, sizeof(struct
> gasket_interrupt_eventfd)))
> -               return -EFAULT;
> -
> -       trace_gasket_ioctl_eventfd_data(die.interrupt, die.event_fd);
> -
> -       return gasket_interrupt_set_eventfd(gasket_dev->interrupt_data,
> -                                           die.interrupt, die.event_fd);
> -}
> -
> -/* Read the size of the page table. */
> -static int gasket_read_page_table_size(struct gasket_dev *gasket_dev,
> -                                      struct gasket_page_table_ioctl
> __user *argp)
> -{
> -       int ret = 0;
> -       struct gasket_page_table_ioctl ibuf;
> -       struct gasket_page_table *table;
> -
> -       if (copy_from_user(&ibuf, argp, sizeof(struct
> gasket_page_table_ioctl)))
> -               return -EFAULT;
> -
> -       if (ibuf.page_table_index >= gasket_dev->num_page_tables)
> -               return -EFAULT;
> -
> -       table = gasket_dev->page_table[ibuf.page_table_index];
> -       ibuf.size = gasket_page_table_num_entries(table);
> -
> -       trace_gasket_ioctl_page_table_data(ibuf.page_table_index,
> ibuf.size,
> -                                          ibuf.host_address,
> -                                          ibuf.device_address);
> -
> -       if (copy_to_user(argp, &ibuf, sizeof(ibuf)))
> -               return -EFAULT;
> -
> -       return ret;
> -}
> -
> -/* Read the size of the simple page table. */
> -static int gasket_read_simple_page_table_size(struct gasket_dev
> *gasket_dev,
> -                                             struct
> gasket_page_table_ioctl __user *argp)
> -{
> -       int ret = 0;
> -       struct gasket_page_table_ioctl ibuf;
> -       struct gasket_page_table *table;
> -
> -       if (copy_from_user(&ibuf, argp, sizeof(struct
> gasket_page_table_ioctl)))
> -               return -EFAULT;
> -
> -       if (ibuf.page_table_index >= gasket_dev->num_page_tables)
> -               return -EFAULT;
> -
> -       table = gasket_dev->page_table[ibuf.page_table_index];
> -       ibuf.size = gasket_page_table_num_simple_entries(table);
> -
> -       trace_gasket_ioctl_page_table_data(ibuf.page_table_index,
> ibuf.size,
> -                                          ibuf.host_address,
> -                                          ibuf.device_address);
> -
> -       if (copy_to_user(argp, &ibuf, sizeof(ibuf)))
> -               return -EFAULT;
> -
> -       return ret;
> -}
> -
> -/* Set the boundary between the simple and extended page tables. */
> -static int gasket_partition_page_table(struct gasket_dev *gasket_dev,
> -                                      struct gasket_page_table_ioctl
> __user *argp)
> -{
> -       int ret;
> -       struct gasket_page_table_ioctl ibuf;
> -       uint max_page_table_size;
> -       struct gasket_page_table *table;
> -
> -       if (copy_from_user(&ibuf, argp, sizeof(struct
> gasket_page_table_ioctl)))
> -               return -EFAULT;
> -
> -       trace_gasket_ioctl_page_table_data(ibuf.page_table_index,
> ibuf.size,
> -                                          ibuf.host_address,
> -                                          ibuf.device_address);
> -
> -       if (ibuf.page_table_index >= gasket_dev->num_page_tables)
> -               return -EFAULT;
> -       table = gasket_dev->page_table[ibuf.page_table_index];
> -       max_page_table_size = gasket_page_table_max_size(table);
> -
> -       if (ibuf.size > max_page_table_size) {
> -               dev_dbg(gasket_dev->dev,
> -                       "Partition request 0x%llx too large, max is
> 0x%x\n",
> -                       ibuf.size, max_page_table_size);
> -               return -EINVAL;
> -       }
> -
> -       mutex_lock(&gasket_dev->mutex);
> -
> -       ret = gasket_page_table_partition(table, ibuf.size);
> -       mutex_unlock(&gasket_dev->mutex);
> -
> -       return ret;
> -}
> -
> -/* Map a userspace buffer to a device virtual address. */
> -static int gasket_map_buffers(struct gasket_dev *gasket_dev,
> -                             struct gasket_page_table_ioctl __user *argp)
> -{
> -       struct gasket_page_table_ioctl ibuf;
> -       struct gasket_page_table *table;
> -
> -       if (copy_from_user(&ibuf, argp, sizeof(struct
> gasket_page_table_ioctl)))
> -               return -EFAULT;
> -
> -       trace_gasket_ioctl_page_table_data(ibuf.page_table_index,
> ibuf.size,
> -                                          ibuf.host_address,
> -                                          ibuf.device_address);
> -
> -       if (ibuf.page_table_index >= gasket_dev->num_page_tables)
> -               return -EFAULT;
> -
> -       table = gasket_dev->page_table[ibuf.page_table_index];
> -       if (gasket_page_table_are_addrs_bad(table, ibuf.host_address,
> -                                           ibuf.device_address,
> ibuf.size))
> -               return -EINVAL;
> -
> -       return gasket_page_table_map(table, ibuf.host_address,
> ibuf.device_address,
> -                                    ibuf.size / PAGE_SIZE);
> -}
> -
> -/* Unmap a userspace buffer from a device virtual address. */
> -static int gasket_unmap_buffers(struct gasket_dev *gasket_dev,
> -                               struct gasket_page_table_ioctl __user
> *argp)
> -{
> -       struct gasket_page_table_ioctl ibuf;
> -       struct gasket_page_table *table;
> -
> -       if (copy_from_user(&ibuf, argp, sizeof(struct
> gasket_page_table_ioctl)))
> -               return -EFAULT;
> -
> -       trace_gasket_ioctl_page_table_data(ibuf.page_table_index,
> ibuf.size,
> -                                          ibuf.host_address,
> -                                          ibuf.device_address);
> -
> -       if (ibuf.page_table_index >= gasket_dev->num_page_tables)
> -               return -EFAULT;
> -
> -       table = gasket_dev->page_table[ibuf.page_table_index];
> -       if (gasket_page_table_is_dev_addr_bad(table, ibuf.device_address,
> ibuf.size))
> -               return -EINVAL;
> -
> -       gasket_page_table_unmap(table, ibuf.device_address, ibuf.size /
> PAGE_SIZE);
> -
> -       return 0;
> -}
> -
> -/*
> - * Reserve structures for coherent allocation, and allocate or free the
> - * corresponding memory.
> - */
> -static int gasket_config_coherent_allocator(struct gasket_dev *gasket_dev,
> -                                           struct
> gasket_coherent_alloc_config_ioctl __user *argp)
> -{
> -       int ret;
> -       struct gasket_coherent_alloc_config_ioctl ibuf;
> -
> -       if (copy_from_user(&ibuf, argp,
> -                          sizeof(struct
> gasket_coherent_alloc_config_ioctl)))
> -               return -EFAULT;
> -
> -       trace_gasket_ioctl_config_coherent_allocator(ibuf.enable,
> ibuf.size,
> -                                                    ibuf.dma_address);
> -
> -       if (ibuf.page_table_index >= gasket_dev->num_page_tables)
> -               return -EFAULT;
> -
> -       if (ibuf.size > PAGE_SIZE * MAX_NUM_COHERENT_PAGES)
> -               return -ENOMEM;
> -
> -       if (ibuf.enable == 0) {
> -               ret = gasket_free_coherent_memory(gasket_dev, ibuf.size,
> -                                                 ibuf.dma_address,
> -                                                 ibuf.page_table_index);
> -       } else {
> -               ret = gasket_alloc_coherent_memory(gasket_dev, ibuf.size,
> -                                                  &ibuf.dma_address,
> -                                                  ibuf.page_table_index);
> -       }
> -       if (ret)
> -               return ret;
> -       if (copy_to_user(argp, &ibuf, sizeof(ibuf)))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -/* Check permissions for Gasket ioctls. */
> -static bool gasket_ioctl_check_permissions(struct file *filp, uint cmd)
> -{
> -       bool alive;
> -       bool read, write;
> -       struct gasket_dev *gasket_dev = (struct gasket_dev
> *)filp->private_data;
> -
> -       alive = (gasket_dev->status == GASKET_STATUS_ALIVE);
> -       if (!alive)
> -               dev_dbg(gasket_dev->dev, "%s alive %d status %d\n",
> -                       __func__, alive, gasket_dev->status);
> -
> -       read = !!(filp->f_mode & FMODE_READ);
> -       write = !!(filp->f_mode & FMODE_WRITE);
> -
> -       switch (cmd) {
> -       case GASKET_IOCTL_RESET:
> -       case GASKET_IOCTL_CLEAR_INTERRUPT_COUNTS:
> -               return write;
> -
> -       case GASKET_IOCTL_PAGE_TABLE_SIZE:
> -       case GASKET_IOCTL_SIMPLE_PAGE_TABLE_SIZE:
> -       case GASKET_IOCTL_NUMBER_PAGE_TABLES:
> -               return read;
> -
> -       case GASKET_IOCTL_PARTITION_PAGE_TABLE:
> -       case GASKET_IOCTL_CONFIG_COHERENT_ALLOCATOR:
> -               return alive && write;
> -
> -       case GASKET_IOCTL_MAP_BUFFER:
> -       case GASKET_IOCTL_UNMAP_BUFFER:
> -               return alive && write;
> -
> -       case GASKET_IOCTL_CLEAR_EVENTFD:
> -       case GASKET_IOCTL_SET_EVENTFD:
> -               return alive && write;
> -       }
> -
> -       return false; /* unknown permissions */
> -}
> -
> -/*
> - * standard ioctl dispatch function.
> - * @filp: File structure pointer describing this node usage session.
> - * @cmd: ioctl number to handle.
> - * @argp: ioctl-specific data pointer.
> - *
> - * Standard ioctl dispatcher; forwards operations to individual handlers.
> - */
> -long gasket_handle_ioctl(struct file *filp, uint cmd, void __user *argp)
> -{
> -       struct gasket_dev *gasket_dev;
> -       unsigned long arg = (unsigned long)argp;
> -       gasket_ioctl_permissions_cb_t ioctl_permissions_cb;
> -       int retval;
> -
> -       gasket_dev = (struct gasket_dev *)filp->private_data;
> -       trace_gasket_ioctl_entry(gasket_dev->dev_info.name, cmd);
> -
> -       ioctl_permissions_cb = gasket_get_ioctl_permissions_cb(gasket_dev);
> -       if (ioctl_permissions_cb) {
> -               retval = ioctl_permissions_cb(filp, cmd, argp);
> -               if (retval < 0) {
> -                       trace_gasket_ioctl_exit(retval);
> -                       return retval;
> -               } else if (retval == 0) {
> -                       trace_gasket_ioctl_exit(-EPERM);
> -                       return -EPERM;
> -               }
> -       } else if (!gasket_ioctl_check_permissions(filp, cmd)) {
> -               trace_gasket_ioctl_exit(-EPERM);
> -               dev_dbg(gasket_dev->dev, "ioctl cmd=%x noperm\n", cmd);
> -               return -EPERM;
> -       }
> -
> -       /* Tracing happens in this switch statement for all ioctls with
> -        * an integer argrument, but ioctls with a struct argument
> -        * that needs copying and decoding, that tracing is done within
> -        * the handler call.
> -        */
> -       switch (cmd) {
> -       case GASKET_IOCTL_RESET:
> -               retval = gasket_reset(gasket_dev);
> -               break;
> -       case GASKET_IOCTL_SET_EVENTFD:
> -               retval = gasket_set_event_fd(gasket_dev, argp);
> -               break;
> -       case GASKET_IOCTL_CLEAR_EVENTFD:
> -               trace_gasket_ioctl_integer_data(arg);
> -               retval =
> -
>  gasket_interrupt_clear_eventfd(gasket_dev->interrupt_data,
> -                                                      (int)arg);
> -               break;
> -       case GASKET_IOCTL_PARTITION_PAGE_TABLE:
> -               trace_gasket_ioctl_integer_data(arg);
> -               retval = gasket_partition_page_table(gasket_dev, argp);
> -               break;
> -       case GASKET_IOCTL_NUMBER_PAGE_TABLES:
> -
>  trace_gasket_ioctl_integer_data(gasket_dev->num_page_tables);
> -               if (copy_to_user(argp, &gasket_dev->num_page_tables,
> -                                sizeof(uint64_t)))
> -                       retval = -EFAULT;
> -               else
> -                       retval = 0;
> -               break;
> -       case GASKET_IOCTL_PAGE_TABLE_SIZE:
> -               retval = gasket_read_page_table_size(gasket_dev, argp);
> -               break;
> -       case GASKET_IOCTL_SIMPLE_PAGE_TABLE_SIZE:
> -               retval = gasket_read_simple_page_table_size(gasket_dev,
> argp);
> -               break;
> -       case GASKET_IOCTL_MAP_BUFFER:
> -               retval = gasket_map_buffers(gasket_dev, argp);
> -               break;
> -       case GASKET_IOCTL_CONFIG_COHERENT_ALLOCATOR:
> -               retval = gasket_config_coherent_allocator(gasket_dev,
> argp);
> -               break;
> -       case GASKET_IOCTL_UNMAP_BUFFER:
> -               retval = gasket_unmap_buffers(gasket_dev, argp);
> -               break;
> -       case GASKET_IOCTL_CLEAR_INTERRUPT_COUNTS:
> -               /* Clear interrupt counts doesn't take an arg, so use 0. */
> -               trace_gasket_ioctl_integer_data(0);
> -               retval = gasket_interrupt_reset_counts(gasket_dev);
> -               break;
> -       default:
> -               /* If we don't understand the ioctl, the best we can do is
> trace
> -                * the arg.
> -                */
> -               trace_gasket_ioctl_integer_data(arg);
> -               dev_dbg(gasket_dev->dev,
> -                       "Unknown ioctl cmd=0x%x not caught by
> gasket_is_supported_ioctl\n",
> -                       cmd);
> -               retval = -EINVAL;
> -               break;
> -       }
> -
> -       trace_gasket_ioctl_exit(retval);
> -       return retval;
> -}
> -
> -/*
> - * Determines if an ioctl is part of the standard Gasket framework.
> - * @cmd: The ioctl number to handle.
> - *
> - * Returns 1 if the ioctl is supported and 0 otherwise.
> - */
> -long gasket_is_supported_ioctl(uint cmd)
> -{
> -       switch (cmd) {
> -       case GASKET_IOCTL_RESET:
> -       case GASKET_IOCTL_SET_EVENTFD:
> -       case GASKET_IOCTL_CLEAR_EVENTFD:
> -       case GASKET_IOCTL_PARTITION_PAGE_TABLE:
> -       case GASKET_IOCTL_NUMBER_PAGE_TABLES:
> -       case GASKET_IOCTL_PAGE_TABLE_SIZE:
> -       case GASKET_IOCTL_SIMPLE_PAGE_TABLE_SIZE:
> -       case GASKET_IOCTL_MAP_BUFFER:
> -       case GASKET_IOCTL_UNMAP_BUFFER:
> -       case GASKET_IOCTL_CLEAR_INTERRUPT_COUNTS:
> -       case GASKET_IOCTL_CONFIG_COHERENT_ALLOCATOR:
> -               return 1;
> -       default:
> -               return 0;
> -       }
> -}
> diff --git a/drivers/staging/gasket/gasket_ioctl.h
> b/drivers/staging/gasket/gasket_ioctl.h
> deleted file mode 100644
> index 51f468c77f04..000000000000
> --- a/drivers/staging/gasket/gasket_ioctl.h
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/* Copyright (C) 2018 Google, Inc. */
> -#ifndef __GASKET_IOCTL_H__
> -#define __GASKET_IOCTL_H__
> -
> -#include "gasket_core.h"
> -
> -#include <linux/compiler.h>
> -
> -/*
> - * Handle Gasket common ioctls.
> - * @filp: Pointer to the ioctl's file.
> - * @cmd: Ioctl command.
> - * @arg: Ioctl argument pointer.
> - *
> - * Returns 0 on success and nonzero on failure.
> - */
> -long gasket_handle_ioctl(struct file *filp, uint cmd, void __user *argp);
> -
> -/*
> - * Determines if an ioctl is part of the standard Gasket framework.
> - * @cmd: The ioctl number to handle.
> - *
> - * Returns 1 if the ioctl is supported and 0 otherwise.
> - */
> -long gasket_is_supported_ioctl(uint cmd);
> -
> -#endif
> diff --git a/drivers/staging/gasket/gasket_page_table.c
> b/drivers/staging/gasket/gasket_page_table.c
> deleted file mode 100644
> index 2dbf3d9b8f34..000000000000
> --- a/drivers/staging/gasket/gasket_page_table.c
> +++ /dev/null
> @@ -1,1357 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Implementation of Gasket page table support.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -
> -/*
> - * Implementation of Gasket page table support.
> - *
> - * This file assumes 4kB pages throughout; can be factored out when
> necessary.
> - *
> - * There is a configurable number of page table entries, as well as a
> - * configurable bit index for the extended address flag. Both of these are
> - * specified in gasket_page_table_init through the page_table_config
> parameter.
> - *
> - * The following example assumes:
> - *   page_table_config->total_entries = 8192
> - *   page_table_config->extended_bit = 63
> - *
> - * Address format:
> - * Simple addresses - those whose containing pages are directly placed in
> the
> - * device's address translation registers - are laid out as:
> - * [ 63 - 25: 0 | 24 - 12: page index | 11 - 0: page offset ]
> - * page index:  The index of the containing page in the device's address
> - *              translation registers.
> - * page offset: The index of the address into the containing page.
> - *
> - * Extended address - those whose containing pages are contained in a
> second-
> - * level page table whose address is present in the device's address
> translation
> - * registers - are laid out as:
> - * [ 63: flag | 62 - 34: 0 | 33 - 21: dev/level 0 index |
> - *   20 - 12: host/level 1 index | 11 - 0: page offset ]
> - * flag:        Marker indicating that this is an extended address.
> Always 1.
> - * dev index:   The index of the first-level page in the device's extended
> - *              address translation registers.
> - * host index:  The index of the containing page in the [host-resident]
> second-
> - *              level page table.
> - * page offset: The index of the address into the containing
> [second-level]
> - *              page.
> - */
> -#include "gasket_page_table.h"
> -
> -#include <linux/device.h>
> -#include <linux/file.h>
> -#include <linux/init.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/pagemap.h>
> -#include <linux/vmalloc.h>
> -
> -#include "gasket_constants.h"
> -#include "gasket_core.h"
> -
> -/* Constants & utility macros */
> -/* The number of pages that can be mapped into each second-level page
> table. */
> -#define GASKET_PAGES_PER_SUBTABLE 512
> -
> -/* The starting position of the page index in a simple virtual address. */
> -#define GASKET_SIMPLE_PAGE_SHIFT 12
> -
> -/* Flag indicating that a [device] slot is valid for use. */
> -#define GASKET_VALID_SLOT_FLAG 1
> -
> -/*
> - * The starting position of the level 0 page index (i.e., the entry in the
> - * device's extended address registers) in an extended address.
> - * Also can be thought of as (log2(PAGE_SIZE) + log2(PAGES_PER_SUBTABLE)),
> - * or (12 + 9).
> - */
> -#define GASKET_EXTENDED_LVL0_SHIFT 21
> -
> -/*
> - * Number of first level pages that Gasket chips support. Equivalent to
> - * log2(NUM_LVL0_PAGE_TABLES)
> - *
> - * At a maximum, allowing for a 34 bits address space (or 16GB)
> - *   = GASKET_EXTENDED_LVL0_WIDTH + (log2(PAGE_SIZE) +
> log2(PAGES_PER_SUBTABLE)
> - * or, = 13 + 9 + 12
> - */
> -#define GASKET_EXTENDED_LVL0_WIDTH 13
> -
> -/*
> - * The starting position of the level 1 page index (i.e., the entry in the
> - * host second-level/sub- table) in an extended address.
> - */
> -#define GASKET_EXTENDED_LVL1_SHIFT 12
> -
> -/* Type declarations */
> -/* Valid states for a struct gasket_page_table_entry. */
> -enum pte_status {
> -       PTE_FREE,
> -       PTE_INUSE,
> -};
> -
> -/*
> - * Mapping metadata for a single page.
> - *
> - * In this file, host-side page table entries are referred to as that (or
> PTEs).
> - * Where device vs. host entries are differentiated, device-side or
> -visible
> - * entries are called "slots". A slot may be either an entry in the
> device's
> - * address translation table registers or an entry in a second-level page
> - * table ("subtable").
> - *
> - * The full data in this structure is visible on the host [of course].
> Only
> - * the address contained in dma_addr is communicated to the device; that
> points
> - * to the actual page mapped and described by this structure.
> - */
> -struct gasket_page_table_entry {
> -       /* The status of this entry/slot: free or in use. */
> -       enum pte_status status;
> -
> -       /*
> -        * Index for alignment into host vaddrs.
> -        * When a user specifies a host address for a mapping, that
> address may
> -        * not be page-aligned. Offset is the index into the containing
> page of
> -        * the host address (i.e., host_vaddr & (PAGE_SIZE - 1)).
> -        * This is necessary for translating between user-specified
> addresses
> -        * and page-aligned addresses.
> -        */
> -       int offset;
> -
> -       /* Address of the page in DMA space. */
> -       dma_addr_t dma_addr;
> -
> -       /* Linux page descriptor for the page described by this structure.
> */
> -       struct page *page;
> -
> -       /*
> -        * If this is an extended and first-level entry, sublevel points
> -        * to the second-level entries underneath this entry.
> -        */
> -       struct gasket_page_table_entry *sublevel;
> -};
> -
> -/*
> - * Maintains virtual to physical address mapping for a coherent page that
> is
> - * allocated by this module for a given device.
> - * Note that coherent pages mappings virt mapping cannot be tracked by the
> - * Linux kernel, and coherent pages don't have a struct page associated,
> - * hence Linux kernel cannot perform a get_user_page_xx() on a phys
> address
> - * that was allocated coherent.
> - * This structure trivially implements this mechanism.
> - */
> -struct gasket_coherent_page_entry {
> -       /* Phys address, dma'able by the owner device */
> -       dma_addr_t paddr;
> -
> -       /* Kernel virtual address */
> -       u64 user_virt;
> -
> -       /* User virtual address that was mapped by the mmap kernel
> subsystem */
> -       u64 kernel_virt;
> -
> -       /*
> -        * Whether this page has been mapped into a user land process
> virtual
> -        * space
> -        */
> -       u32 in_use;
> -};
> -
> -/*
> - * [Host-side] page table descriptor.
> - *
> - * This structure tracks the metadata necessary to manage both simple and
> - * extended page tables.
> - */
> -struct gasket_page_table {
> -       /* The config used to create this page table. */
> -       struct gasket_page_table_config config;
> -
> -       /* The number of simple (single-level) entries in the page table.
> */
> -       uint num_simple_entries;
> -
> -       /* The number of extended (two-level) entries in the page table. */
> -       uint num_extended_entries;
> -
> -       /* Array of [host-side] page table entries. */
> -       struct gasket_page_table_entry *entries;
> -
> -       /* Number of actively mapped kernel pages in this table. */
> -       uint num_active_pages;
> -
> -       /* Device register: base of/first slot in the page table. */
> -       u64 __iomem *base_slot;
> -
> -       /* Device register: holds the offset indicating the start of the
> -        * extended address region of the device's address translation
> table.
> -        */
> -       u64 __iomem *extended_offset_reg;
> -
> -       /* Device structure for the underlying device. Only used for
> logging. */
> -       struct device *device;
> -
> -       /* PCI system descriptor for the underlying device. */
> -       struct pci_dev *pci_dev;
> -
> -       /* Location of the extended address bit for this Gasket device. */
> -       u64 extended_flag;
> -
> -       /* Mutex to protect page table internals. */
> -       struct mutex mutex;
> -
> -       /* Number of coherent pages accessible thru by this page table */
> -       int num_coherent_pages;
> -
> -       /*
> -        * List of coherent memory (physical) allocated for a device.
> -        *
> -        * This structure also remembers the user virtual mapping, this is
> -        * hacky, but we need to do this because the kernel doesn't keep
> track
> -        * of the user coherent pages (pfn pages), and virt to coherent
> page
> -        * mapping.
> -        * TODO: use find_vma() APIs to convert host address to vm_area, to
> -        * dma_addr_t instead of storing user virtu address in
> -        * gasket_coherent_page_entry
> -        *
> -        * Note that the user virtual mapping is created by the driver, in
> -        * gasket_mmap function, so user_virt belongs in the driver anyhow.
> -        */
> -       struct gasket_coherent_page_entry *coherent_pages;
> -};
> -
> -/* See gasket_page_table.h for description. */
> -int gasket_page_table_init(struct gasket_page_table **ppg_tbl,
> -                          const struct gasket_bar_data *bar_data,
> -                          const struct gasket_page_table_config
> *page_table_config,
> -                          struct device *device, struct pci_dev *pci_dev)
> -{
> -       ulong bytes;
> -       struct gasket_page_table *pg_tbl;
> -       ulong total_entries = page_table_config->total_entries;
> -
> -       /*
> -        * TODO: Verify config->total_entries against value read from the
> -        * hardware register that contains the page table size.
> -        */
> -       if (total_entries == ULONG_MAX) {
> -               dev_dbg(device,
> -                       "Error reading page table size. Initializing page
> table with size 0\n");
> -               total_entries = 0;
> -       }
> -
> -       dev_dbg(device,
> -               "Attempting to initialize page table of size 0x%lx\n",
> -               total_entries);
> -
> -       dev_dbg(device,
> -               "Table has base reg 0x%x, extended offset reg 0x%x\n",
> -               page_table_config->base_reg,
> -               page_table_config->extended_reg);
> -
> -       *ppg_tbl = kzalloc(sizeof(**ppg_tbl), GFP_KERNEL);
> -       if (!*ppg_tbl) {
> -               dev_dbg(device, "No memory for page table\n");
> -               return -ENOMEM;
> -       }
> -
> -       pg_tbl = *ppg_tbl;
> -       bytes = total_entries * sizeof(struct gasket_page_table_entry);
> -       if (bytes != 0) {
> -               pg_tbl->entries = vzalloc(bytes);
> -               if (!pg_tbl->entries) {
> -                       kfree(pg_tbl);
> -                       *ppg_tbl = NULL;
> -                       return -ENOMEM;
> -               }
> -       }
> -
> -       mutex_init(&pg_tbl->mutex);
> -       memcpy(&pg_tbl->config, page_table_config,
> sizeof(*page_table_config));
> -       if (pg_tbl->config.mode == GASKET_PAGE_TABLE_MODE_NORMAL ||
> -           pg_tbl->config.mode == GASKET_PAGE_TABLE_MODE_SIMPLE) {
> -               pg_tbl->num_simple_entries = total_entries;
> -               pg_tbl->num_extended_entries = 0;
> -               pg_tbl->extended_flag = 1ull <<
> page_table_config->extended_bit;
> -       } else {
> -               pg_tbl->num_simple_entries = 0;
> -               pg_tbl->num_extended_entries = total_entries;
> -               pg_tbl->extended_flag = 0;
> -       }
> -       pg_tbl->num_active_pages = 0;
> -       pg_tbl->base_slot =
> -               (u64 __iomem
> *)&bar_data->virt_base[page_table_config->base_reg];
> -       pg_tbl->extended_offset_reg =
> -               (u64 __iomem
> *)&bar_data->virt_base[page_table_config->extended_reg];
> -       pg_tbl->device = get_device(device);
> -       pg_tbl->pci_dev = pci_dev;
> -
> -       dev_dbg(device, "Page table initialized successfully\n");
> -
> -       return 0;
> -}
> -
> -/*
> - * Check if a range of PTEs is free.
> - * The page table mutex must be held by the caller.
> - */
> -static bool gasket_is_pte_range_free(struct gasket_page_table_entry *ptes,
> -                                    uint num_entries)
> -{
> -       int i;
> -
> -       for (i = 0; i < num_entries; i++) {
> -               if (ptes[i].status != PTE_FREE)
> -                       return false;
> -       }
> -
> -       return true;
> -}
> -
> -/*
> - * Free a second level page [sub]table.
> - * The page table mutex must be held before this call.
> - */
> -static void gasket_free_extended_subtable(struct gasket_page_table
> *pg_tbl,
> -                                         struct gasket_page_table_entry
> *pte,
> -                                         u64 __iomem *slot)
> -{
> -       /* Release the page table from the driver */
> -       pte->status = PTE_FREE;
> -
> -       /* Release the page table from the device */
> -       writeq(0, slot);
> -
> -       if (pte->dma_addr)
> -               dma_unmap_page(pg_tbl->device, pte->dma_addr, PAGE_SIZE,
> -                              DMA_TO_DEVICE);
> -
> -       vfree(pte->sublevel);
> -
> -       if (pte->page)
> -               free_page((ulong)page_address(pte->page));
> -
> -       memset(pte, 0, sizeof(struct gasket_page_table_entry));
> -}
> -
> -/*
> - * Actually perform collection.
> - * The page table mutex must be held by the caller.
> - */
> -static void
> -gasket_page_table_garbage_collect_nolock(struct gasket_page_table *pg_tbl)
> -{
> -       struct gasket_page_table_entry *pte;
> -       u64 __iomem *slot;
> -
> -       /* XXX FIX ME XXX -- more efficient to keep a usage count */
> -       /* rather than scanning the second level page tables */
> -
> -       for (pte = pg_tbl->entries + pg_tbl->num_simple_entries,
> -            slot = pg_tbl->base_slot + pg_tbl->num_simple_entries;
> -            pte < pg_tbl->entries + pg_tbl->config.total_entries;
> -            pte++, slot++) {
> -               if (pte->status == PTE_INUSE) {
> -                       if (gasket_is_pte_range_free(pte->sublevel,
> -
> GASKET_PAGES_PER_SUBTABLE))
> -                               gasket_free_extended_subtable(pg_tbl, pte,
> -                                                             slot);
> -               }
> -       }
> -}
> -
> -/* See gasket_page_table.h for description. */
> -void gasket_page_table_garbage_collect(struct gasket_page_table *pg_tbl)
> -{
> -       mutex_lock(&pg_tbl->mutex);
> -       gasket_page_table_garbage_collect_nolock(pg_tbl);
> -       mutex_unlock(&pg_tbl->mutex);
> -}
> -
> -/* See gasket_page_table.h for description. */
> -void gasket_page_table_cleanup(struct gasket_page_table *pg_tbl)
> -{
> -       /* Deallocate free second-level tables. */
> -       gasket_page_table_garbage_collect(pg_tbl);
> -
> -       /* TODO: Check that all PTEs have been freed? */
> -
> -       vfree(pg_tbl->entries);
> -       pg_tbl->entries = NULL;
> -
> -       put_device(pg_tbl->device);
> -       kfree(pg_tbl);
> -}
> -
> -/* See gasket_page_table.h for description. */
> -int gasket_page_table_partition(struct gasket_page_table *pg_tbl,
> -                               uint num_simple_entries)
> -{
> -       int i, start;
> -
> -       mutex_lock(&pg_tbl->mutex);
> -       if (num_simple_entries > pg_tbl->config.total_entries) {
> -               mutex_unlock(&pg_tbl->mutex);
> -               return -EINVAL;
> -       }
> -
> -       gasket_page_table_garbage_collect_nolock(pg_tbl);
> -
> -       start = min(pg_tbl->num_simple_entries, num_simple_entries);
> -
> -       for (i = start; i < pg_tbl->config.total_entries; i++) {
> -               if (pg_tbl->entries[i].status != PTE_FREE) {
> -                       dev_err(pg_tbl->device, "entry %d is not free\n",
> i);
> -                       mutex_unlock(&pg_tbl->mutex);
> -                       return -EBUSY;
> -               }
> -       }
> -
> -       pg_tbl->num_simple_entries = num_simple_entries;
> -       pg_tbl->num_extended_entries =
> -               pg_tbl->config.total_entries - num_simple_entries;
> -       writeq(num_simple_entries, pg_tbl->extended_offset_reg);
> -
> -       mutex_unlock(&pg_tbl->mutex);
> -       return 0;
> -}
> -EXPORT_SYMBOL(gasket_page_table_partition);
> -
> -/*
> - * Return whether a host buffer was mapped as coherent memory.
> - *
> - * A Gasket page_table currently support one contiguous dma range, mapped
> to one
> - * contiguous virtual memory range. Check if the host_addr is within that
> range.
> - */
> -static int is_coherent(struct gasket_page_table *pg_tbl, ulong host_addr)
> -{
> -       u64 min, max;
> -
> -       /* whether the host address is within user virt range */
> -       if (!pg_tbl->coherent_pages)
> -               return 0;
> -
> -       min = (u64)pg_tbl->coherent_pages[0].user_virt;
> -       max = min + PAGE_SIZE * pg_tbl->num_coherent_pages;
> -
> -       return min <= host_addr && host_addr < max;
> -}
> -
> -/* Safely return a page to the OS. */
> -static bool gasket_release_page(struct page *page)
> -{
> -       if (!page)
> -               return false;
> -
> -       if (!PageReserved(page))
> -               SetPageDirty(page);
> -       unpin_user_page(page);
> -
> -       return true;
> -}
> -
> -/*
> - * Get and map last level page table buffers.
> - *
> - * slots is the location(s) to write device-mapped page address. If this
> is a
> - * simple mapping, these will be address translation registers. If this is
> - * an extended mapping, these will be within a second-level page table
> - * allocated by the host and so must have their __iomem attribute casted
> away.
> - */
> -static int gasket_perform_mapping(struct gasket_page_table *pg_tbl,
> -                                 struct gasket_page_table_entry *ptes,
> -                                 u64 __iomem *slots, ulong host_addr,
> -                                 uint num_pages, int is_simple_mapping)
> -{
> -       int ret;
> -       ulong offset;
> -       struct page *page;
> -       dma_addr_t dma_addr;
> -       ulong page_addr;
> -       int i;
> -
> -       for (i = 0; i < num_pages; i++) {
> -               page_addr = host_addr + i * PAGE_SIZE;
> -               offset = page_addr & (PAGE_SIZE - 1);
> -               if (is_coherent(pg_tbl, host_addr)) {
> -                       u64 off =
> -                               (u64)host_addr -
> -                               (u64)pg_tbl->coherent_pages[0].user_virt;
> -                       ptes[i].page = NULL;
> -                       ptes[i].offset = offset;
> -                       ptes[i].dma_addr = pg_tbl->coherent_pages[0].paddr
> +
> -                                          off + i * PAGE_SIZE;
> -               } else {
> -                       ret = pin_user_pages_fast(page_addr - offset, 1,
> -                                                 FOLL_WRITE, &page);
> -
> -                       if (ret <= 0) {
> -                               dev_err(pg_tbl->device,
> -                                       "pin user pages failed for
> addr=0x%lx, offset=0x%lx [ret=%d]\n",
> -                                       page_addr, offset, ret);
> -                               return ret ? ret : -ENOMEM;
> -                       }
> -                       ++pg_tbl->num_active_pages;
> -
> -                       ptes[i].page = page;
> -                       ptes[i].offset = offset;
> -
> -                       /* Map the page into DMA space. */
> -                       ptes[i].dma_addr =
> -                               dma_map_page(pg_tbl->device, page, 0,
> PAGE_SIZE,
> -                                            DMA_BIDIRECTIONAL);
> -
> -                       if (dma_mapping_error(pg_tbl->device,
> -                                             ptes[i].dma_addr)) {
> -                               if (gasket_release_page(ptes[i].page))
> -                                       --pg_tbl->num_active_pages;
> -
> -                               memset(&ptes[i], 0,
> -                                      sizeof(struct
> gasket_page_table_entry));
> -                               return -EINVAL;
> -                       }
> -               }
> -
> -               /* Make the DMA-space address available to the device. */
> -               dma_addr = (ptes[i].dma_addr + offset) |
> GASKET_VALID_SLOT_FLAG;
> -
> -               if (is_simple_mapping) {
> -                       writeq(dma_addr, &slots[i]);
> -               } else {
> -                       ((u64 __force *)slots)[i] = dma_addr;
> -                       /* Extended page table vectors are in DRAM,
> -                        * and so need to be synced each time they are
> updated.
> -                        */
> -                       dma_map_single(pg_tbl->device,
> -                                      (void *)&((u64 __force *)slots)[i],
> -                                      sizeof(u64), DMA_TO_DEVICE);
> -               }
> -               ptes[i].status = PTE_INUSE;
> -       }
> -       return 0;
> -}
> -
> -/*
> - * Return the index of the page for the address in the simple table.
> - * Does not perform validity checking.
> - */
> -static int gasket_simple_page_idx(struct gasket_page_table *pg_tbl,
> -                                 ulong dev_addr)
> -{
> -       return (dev_addr >> GASKET_SIMPLE_PAGE_SHIFT) &
> -               (pg_tbl->config.total_entries - 1);
> -}
> -
> -/*
> - * Return the level 0 page index for the given address.
> - * Does not perform validity checking.
> - */
> -static ulong gasket_extended_lvl0_page_idx(struct gasket_page_table
> *pg_tbl,
> -                                          ulong dev_addr)
> -{
> -       return (dev_addr >> GASKET_EXTENDED_LVL0_SHIFT) &
> -               (pg_tbl->config.total_entries - 1);
> -}
> -
> -/*
> - * Return the level 1 page index for the given address.
> - * Does not perform validity checking.
> - */
> -static ulong gasket_extended_lvl1_page_idx(struct gasket_page_table
> *pg_tbl,
> -                                          ulong dev_addr)
> -{
> -       return (dev_addr >> GASKET_EXTENDED_LVL1_SHIFT) &
> -              (GASKET_PAGES_PER_SUBTABLE - 1);
> -}
> -
> -/*
> - * Allocate page table entries in a simple table.
> - * The page table mutex must be held by the caller.
> - */
> -static int gasket_alloc_simple_entries(struct gasket_page_table *pg_tbl,
> -                                      ulong dev_addr, uint num_pages)
> -{
> -       if (!gasket_is_pte_range_free(pg_tbl->entries +
> -                                     gasket_simple_page_idx(pg_tbl,
> dev_addr),
> -                                     num_pages))
> -               return -EBUSY;
> -
> -       return 0;
> -}
> -
> -/*
> - * Unmap and release mapped pages.
> - * The page table mutex must be held by the caller.
> - */
> -static void gasket_perform_unmapping(struct gasket_page_table *pg_tbl,
> -                                    struct gasket_page_table_entry *ptes,
> -                                    u64 __iomem *slots, uint num_pages,
> -                                    int is_simple_mapping)
> -{
> -       int i;
> -       /*
> -        * For each page table entry and corresponding entry in the
> device's
> -        * address translation table:
> -        */
> -       for (i = 0; i < num_pages; i++) {
> -               /* release the address from the device, */
> -               if (is_simple_mapping || ptes[i].status == PTE_INUSE) {
> -                       writeq(0, &slots[i]);
> -               } else {
> -                       ((u64 __force *)slots)[i] = 0;
> -                       /* sync above PTE update before updating mappings
> */
> -                       wmb();
> -               }
> -
> -               /* release the address from the driver, */
> -               if (ptes[i].status == PTE_INUSE) {
> -                       if (ptes[i].page && ptes[i].dma_addr) {
> -                               dma_unmap_page(pg_tbl->device,
> ptes[i].dma_addr,
> -                                              PAGE_SIZE,
> DMA_BIDIRECTIONAL);
> -                       }
> -                       if (gasket_release_page(ptes[i].page))
> -                               --pg_tbl->num_active_pages;
> -               }
> -
> -               /* and clear the PTE. */
> -               memset(&ptes[i], 0, sizeof(struct
> gasket_page_table_entry));
> -       }
> -}
> -
> -/*
> - * Unmap and release pages mapped to simple addresses.
> - * The page table mutex must be held by the caller.
> - */
> -static void gasket_unmap_simple_pages(struct gasket_page_table *pg_tbl,
> -                                     ulong dev_addr, uint num_pages)
> -{
> -       uint slot = gasket_simple_page_idx(pg_tbl, dev_addr);
> -
> -       gasket_perform_unmapping(pg_tbl, pg_tbl->entries + slot,
> -                                pg_tbl->base_slot + slot, num_pages, 1);
> -}
> -
> -/*
> - * Unmap and release buffers to extended addresses.
> - * The page table mutex must be held by the caller.
> - */
> -static void gasket_unmap_extended_pages(struct gasket_page_table *pg_tbl,
> -                                       ulong dev_addr, uint num_pages)
> -{
> -       uint slot_idx, remain, len;
> -       struct gasket_page_table_entry *pte;
> -       u64 __iomem *slot_base;
> -
> -       remain = num_pages;
> -       slot_idx = gasket_extended_lvl1_page_idx(pg_tbl, dev_addr);
> -       pte = pg_tbl->entries + pg_tbl->num_simple_entries +
> -             gasket_extended_lvl0_page_idx(pg_tbl, dev_addr);
> -
> -       while (remain > 0) {
> -               /* TODO: Add check to ensure pte remains valid? */
> -               len = min(remain, GASKET_PAGES_PER_SUBTABLE - slot_idx);
> -
> -               if (pte->status == PTE_INUSE) {
> -                       slot_base = (u64 __iomem
> *)(page_address(pte->page) +
> -                                                   pte->offset);
> -                       gasket_perform_unmapping(pg_tbl,
> -                                                pte->sublevel + slot_idx,
> -                                                slot_base + slot_idx,
> len, 0);
> -               }
> -
> -               remain -= len;
> -               slot_idx = 0;
> -               pte++;
> -       }
> -}
> -
> -/* Evaluates to nonzero if the specified virtual address is simple. */
> -static inline bool gasket_addr_is_simple(struct gasket_page_table *pg_tbl,
> -                                        ulong addr)
> -{
> -       return !((addr) & (pg_tbl)->extended_flag);
> -}
> -
> -/*
> - * Convert (simple, page, offset) into a device address.
> - * Examples:
> - * Simple page 0, offset 32:
> - *  Input (1, 0, 32), Output 0x20
> - * Simple page 1000, offset 511:
> - *  Input (1, 1000, 511), Output 0x3E81FF
> - * Extended page 0, offset 32:
> - *  Input (0, 0, 32), Output 0x8000000020
> - * Extended page 1000, offset 511:
> - *  Input (0, 1000, 511), Output 0x8003E81FF
> - */
> -static ulong gasket_components_to_dev_address(struct gasket_page_table
> *pg_tbl,
> -                                             int is_simple, uint
> page_index,
> -                                             uint offset)
> -{
> -       ulong dev_addr = (page_index << GASKET_SIMPLE_PAGE_SHIFT) | offset;
> -
> -       return is_simple ? dev_addr : (pg_tbl->extended_flag | dev_addr);
> -}
> -
> -/*
> - * Validity checking for simple addresses.
> - *
> - * Verify that address translation commutes (from address to/from page +
> offset)
> - * and that the requested page range starts and ends within the set of
> - * currently-partitioned simple pages.
> - */
> -static bool gasket_is_simple_dev_addr_bad(struct gasket_page_table
> *pg_tbl,
> -                                         ulong dev_addr, uint num_pages)
> -{
> -       ulong page_offset = dev_addr & (PAGE_SIZE - 1);
> -       ulong page_index =
> -               (dev_addr / PAGE_SIZE) & (pg_tbl->config.total_entries -
> 1);
> -
> -       if (gasket_components_to_dev_address(pg_tbl, 1, page_index,
> -                                            page_offset) != dev_addr) {
> -               dev_err(pg_tbl->device, "address is invalid, 0x%lX\n",
> -                       dev_addr);
> -               return true;
> -       }
> -
> -       if (page_index >= pg_tbl->num_simple_entries) {
> -               dev_err(pg_tbl->device,
> -                       "starting slot at %lu is too large, max is < %u\n",
> -                       page_index, pg_tbl->num_simple_entries);
> -               return true;
> -       }
> -
> -       if (page_index + num_pages > pg_tbl->num_simple_entries) {
> -               dev_err(pg_tbl->device,
> -                       "ending slot at %lu is too large, max is <= %u\n",
> -                       page_index + num_pages,
> pg_tbl->num_simple_entries);
> -               return true;
> -       }
> -
> -       return false;
> -}
> -
> -/*
> - * Validity checking for extended addresses.
> - *
> - * Verify that address translation commutes (from address to/from page +
> - * offset) and that the requested page range starts and ends within the
> set of
> - * currently-partitioned extended pages.
> - */
> -static bool gasket_is_extended_dev_addr_bad(struct gasket_page_table
> *pg_tbl,
> -                                           ulong dev_addr, uint num_pages)
> -{
> -       /* Starting byte index of dev_addr into the first mapped page */
> -       ulong page_offset = dev_addr & (PAGE_SIZE - 1);
> -       ulong page_global_idx, page_lvl0_idx;
> -       ulong num_lvl0_pages;
> -       ulong addr;
> -
> -       /* check if the device address is out of bound */
> -       addr = dev_addr & ~((pg_tbl)->extended_flag);
> -       if (addr >> (GASKET_EXTENDED_LVL0_WIDTH +
> GASKET_EXTENDED_LVL0_SHIFT)) {
> -               dev_err(pg_tbl->device, "device address out of bounds:
> 0x%lx\n",
> -                       dev_addr);
> -               return true;
> -       }
> -
> -       /* Find the starting sub-page index in the space of all sub-pages.
> */
> -       page_global_idx = (dev_addr / PAGE_SIZE) &
> -               (pg_tbl->config.total_entries * GASKET_PAGES_PER_SUBTABLE
> - 1);
> -
> -       /* Find the starting level 0 index. */
> -       page_lvl0_idx = gasket_extended_lvl0_page_idx(pg_tbl, dev_addr);
> -
> -       /* Get the count of affected level 0 pages. */
> -       num_lvl0_pages = DIV_ROUND_UP(num_pages,
> GASKET_PAGES_PER_SUBTABLE);
> -
> -       if (gasket_components_to_dev_address(pg_tbl, 0, page_global_idx,
> -                                            page_offset) != dev_addr) {
> -               dev_err(pg_tbl->device, "address is invalid: 0x%lx\n",
> -                       dev_addr);
> -               return true;
> -       }
> -
> -       if (page_lvl0_idx >= pg_tbl->num_extended_entries) {
> -               dev_err(pg_tbl->device,
> -                       "starting level 0 slot at %lu is too large, max is
> < %u\n",
> -                       page_lvl0_idx, pg_tbl->num_extended_entries);
> -               return true;
> -       }
> -
> -       if (page_lvl0_idx + num_lvl0_pages > pg_tbl->num_extended_entries)
> {
> -               dev_err(pg_tbl->device,
> -                       "ending level 0 slot at %lu is too large, max is
> <= %u\n",
> -                       page_lvl0_idx + num_lvl0_pages,
> -                       pg_tbl->num_extended_entries);
> -               return true;
> -       }
> -
> -       return false;
> -}
> -
> -/*
> - * Non-locking entry to unmapping routines.
> - * The page table mutex must be held by the caller.
> - */
> -static void gasket_page_table_unmap_nolock(struct gasket_page_table
> *pg_tbl,
> -                                          ulong dev_addr, uint num_pages)
> -{
> -       if (!num_pages)
> -               return;
> -
> -       if (gasket_addr_is_simple(pg_tbl, dev_addr))
> -               gasket_unmap_simple_pages(pg_tbl, dev_addr, num_pages);
> -       else
> -               gasket_unmap_extended_pages(pg_tbl, dev_addr, num_pages);
> -}
> -
> -/*
> - * Allocate and map pages to simple addresses.
> - * If there is an error, no pages are mapped.
> - */
> -static int gasket_map_simple_pages(struct gasket_page_table *pg_tbl,
> -                                  ulong host_addr, ulong dev_addr,
> -                                  uint num_pages)
> -{
> -       int ret;
> -       uint slot_idx = gasket_simple_page_idx(pg_tbl, dev_addr);
> -
> -       ret = gasket_alloc_simple_entries(pg_tbl, dev_addr, num_pages);
> -       if (ret) {
> -               dev_err(pg_tbl->device,
> -                       "page table slots %u (@ 0x%lx) to %u are not
> available\n",
> -                       slot_idx, dev_addr, slot_idx + num_pages - 1);
> -               return ret;
> -       }
> -
> -       ret = gasket_perform_mapping(pg_tbl, pg_tbl->entries + slot_idx,
> -                                    pg_tbl->base_slot + slot_idx,
> host_addr,
> -                                    num_pages, 1);
> -
> -       if (ret) {
> -               gasket_page_table_unmap_nolock(pg_tbl, dev_addr,
> num_pages);
> -               dev_err(pg_tbl->device, "gasket_perform_mapping %d\n",
> ret);
> -       }
> -       return ret;
> -}
> -
> -/*
> - * Allocate a second level page table.
> - * The page table mutex must be held by the caller.
> - */
> -static int gasket_alloc_extended_subtable(struct gasket_page_table
> *pg_tbl,
> -                                         struct gasket_page_table_entry
> *pte,
> -                                         u64 __iomem *slot)
> -{
> -       ulong page_addr, subtable_bytes;
> -       dma_addr_t dma_addr;
> -
> -       /* XXX FIX ME XXX this is inefficient for non-4K page sizes */
> -
> -       /* GFP_DMA flag must be passed to architectures for which
> -        * part of the memory range is not considered DMA'able.
> -        * This seems to be the case for Juno board with 4.5.0 Linaro
> kernel
> -        */
> -       page_addr = get_zeroed_page(GFP_KERNEL | GFP_DMA);
> -       if (!page_addr)
> -               return -ENOMEM;
> -       pte->page = virt_to_page((void *)page_addr);
> -       pte->offset = 0;
> -
> -       subtable_bytes = sizeof(struct gasket_page_table_entry) *
> -               GASKET_PAGES_PER_SUBTABLE;
> -       pte->sublevel = vzalloc(subtable_bytes);
> -       if (!pte->sublevel) {
> -               free_page(page_addr);
> -               memset(pte, 0, sizeof(struct gasket_page_table_entry));
> -               return -ENOMEM;
> -       }
> -
> -       /* Map the page into DMA space. */
> -       pte->dma_addr = dma_map_page(pg_tbl->device, pte->page, 0,
> PAGE_SIZE,
> -                                    DMA_TO_DEVICE);
> -       if (dma_mapping_error(pg_tbl->device, pte->dma_addr)) {
> -               free_page(page_addr);
> -               vfree(pte->sublevel);
> -               memset(pte, 0, sizeof(struct gasket_page_table_entry));
> -               return -ENOMEM;
> -       }
> -
> -       /* make the addresses available to the device */
> -       dma_addr = (pte->dma_addr + pte->offset) | GASKET_VALID_SLOT_FLAG;
> -       writeq(dma_addr, slot);
> -
> -       pte->status = PTE_INUSE;
> -
> -       return 0;
> -}
> -
> -/*
> - * Allocate slots in an extended page table.  Check to see if a range of
> page
> - * table slots are available. If necessary, memory is allocated for
> second level
> - * page tables.
> - *
> - * Note that memory for second level page tables is allocated as needed,
> but
> - * that memory is only freed on the final close        of the device
> file, when the
> - * page tables are repartitioned, or the device is removed.  If there is
> an
> - * error or if the full range of slots is not available, any memory
> - * allocated for second level page tables remains allocated until final
> close,
> - * repartition, or device removal.
> - *
> - * The page table mutex must be held by the caller.
> - */
> -static int gasket_alloc_extended_entries(struct gasket_page_table *pg_tbl,
> -                                        ulong dev_addr, uint num_entries)
> -{
> -       int ret = 0;
> -       uint remain, subtable_slot_idx, len;
> -       struct gasket_page_table_entry *pte;
> -       u64 __iomem *slot;
> -
> -       remain = num_entries;
> -       subtable_slot_idx = gasket_extended_lvl1_page_idx(pg_tbl,
> dev_addr);
> -       pte = pg_tbl->entries + pg_tbl->num_simple_entries +
> -             gasket_extended_lvl0_page_idx(pg_tbl, dev_addr);
> -       slot = pg_tbl->base_slot + pg_tbl->num_simple_entries +
> -              gasket_extended_lvl0_page_idx(pg_tbl, dev_addr);
> -
> -       while (remain > 0) {
> -               len = min(remain,
> -                         GASKET_PAGES_PER_SUBTABLE - subtable_slot_idx);
> -
> -               if (pte->status == PTE_FREE) {
> -                       ret = gasket_alloc_extended_subtable(pg_tbl, pte,
> slot);
> -                       if (ret) {
> -                               dev_err(pg_tbl->device,
> -                                       "no memory for extended addr
> subtable\n");
> -                               return ret;
> -                       }
> -               } else {
> -                       if (!gasket_is_pte_range_free(pte->sublevel +
> -                                                     subtable_slot_idx,
> len))
> -                               return -EBUSY;
> -               }
> -
> -               remain -= len;
> -               subtable_slot_idx = 0;
> -               pte++;
> -               slot++;
> -       }
> -
> -       return 0;
> -}
> -
> -/*
> - * gasket_map_extended_pages - Get and map buffers to extended addresses.
> - * If there is an error, no pages are mapped.
> - */
> -static int gasket_map_extended_pages(struct gasket_page_table *pg_tbl,
> -                                    ulong host_addr, ulong dev_addr,
> -                                    uint num_pages)
> -{
> -       int ret;
> -       ulong dev_addr_end;
> -       uint slot_idx, remain, len;
> -       struct gasket_page_table_entry *pte;
> -       u64 __iomem *slot_base;
> -
> -       ret = gasket_alloc_extended_entries(pg_tbl, dev_addr, num_pages);
> -       if (ret) {
> -               dev_addr_end = dev_addr + (num_pages / PAGE_SIZE) - 1;
> -               dev_err(pg_tbl->device,
> -                       "page table slots (%lu,%lu) (@ 0x%lx) to (%lu,%lu)
> are not available\n",
> -                       gasket_extended_lvl0_page_idx(pg_tbl, dev_addr),
> -                       dev_addr,
> -                       gasket_extended_lvl1_page_idx(pg_tbl, dev_addr),
> -                       gasket_extended_lvl0_page_idx(pg_tbl,
> dev_addr_end),
> -                       gasket_extended_lvl1_page_idx(pg_tbl,
> dev_addr_end));
> -               return ret;
> -       }
> -
> -       remain = num_pages;
> -       slot_idx = gasket_extended_lvl1_page_idx(pg_tbl, dev_addr);
> -       pte = pg_tbl->entries + pg_tbl->num_simple_entries +
> -             gasket_extended_lvl0_page_idx(pg_tbl, dev_addr);
> -
> -       while (remain > 0) {
> -               len = min(remain, GASKET_PAGES_PER_SUBTABLE - slot_idx);
> -
> -               slot_base =
> -                       (u64 __iomem *)(page_address(pte->page) +
> pte->offset);
> -               ret = gasket_perform_mapping(pg_tbl, pte->sublevel +
> slot_idx,
> -                                            slot_base + slot_idx,
> host_addr,
> -                                            len, 0);
> -               if (ret) {
> -                       gasket_page_table_unmap_nolock(pg_tbl, dev_addr,
> -                                                      num_pages);
> -                       return ret;
> -               }
> -
> -               remain -= len;
> -               slot_idx = 0;
> -               pte++;
> -               host_addr += len * PAGE_SIZE;
> -       }
> -
> -       return 0;
> -}
> -
> -/*
> - * See gasket_page_table.h for general description.
> - *
> - * gasket_page_table_map calls either gasket_map_simple_pages() or
> - * gasket_map_extended_pages() to actually perform the mapping.
> - *
> - * The page table mutex is held for the entire operation.
> - */
> -int gasket_page_table_map(struct gasket_page_table *pg_tbl, ulong
> host_addr,
> -                         ulong dev_addr, uint num_pages)
> -{
> -       int ret;
> -
> -       if (!num_pages)
> -               return 0;
> -
> -       mutex_lock(&pg_tbl->mutex);
> -
> -       if (gasket_addr_is_simple(pg_tbl, dev_addr)) {
> -               ret = gasket_map_simple_pages(pg_tbl, host_addr, dev_addr,
> -                                             num_pages);
> -       } else {
> -               ret = gasket_map_extended_pages(pg_tbl, host_addr,
> dev_addr,
> -                                               num_pages);
> -       }
> -
> -       mutex_unlock(&pg_tbl->mutex);
> -       return ret;
> -}
> -EXPORT_SYMBOL(gasket_page_table_map);
> -
> -/*
> - * See gasket_page_table.h for general description.
> - *
> - * gasket_page_table_unmap takes the page table lock and calls either
> - * gasket_unmap_simple_pages() or gasket_unmap_extended_pages() to
> - * actually unmap the pages from device space.
> - *
> - * The page table mutex is held for the entire operation.
> - */
> -void gasket_page_table_unmap(struct gasket_page_table *pg_tbl, ulong
> dev_addr,
> -                            uint num_pages)
> -{
> -       if (!num_pages)
> -               return;
> -
> -       mutex_lock(&pg_tbl->mutex);
> -       gasket_page_table_unmap_nolock(pg_tbl, dev_addr, num_pages);
> -       mutex_unlock(&pg_tbl->mutex);
> -}
> -EXPORT_SYMBOL(gasket_page_table_unmap);
> -
> -static void gasket_page_table_unmap_all_nolock(struct gasket_page_table
> *pg_tbl)
> -{
> -       gasket_unmap_simple_pages(pg_tbl,
> -                                 gasket_components_to_dev_address(pg_tbl,
> 1, 0,
> -                                                                  0),
> -                                 pg_tbl->num_simple_entries);
> -       gasket_unmap_extended_pages(pg_tbl,
> -
>  gasket_components_to_dev_address(pg_tbl, 0,
> -                                                                    0, 0),
> -                                   pg_tbl->num_extended_entries *
> -                                   GASKET_PAGES_PER_SUBTABLE);
> -}
> -
> -/* See gasket_page_table.h for description. */
> -void gasket_page_table_unmap_all(struct gasket_page_table *pg_tbl)
> -{
> -       mutex_lock(&pg_tbl->mutex);
> -       gasket_page_table_unmap_all_nolock(pg_tbl);
> -       mutex_unlock(&pg_tbl->mutex);
> -}
> -EXPORT_SYMBOL(gasket_page_table_unmap_all);
> -
> -/* See gasket_page_table.h for description. */
> -void gasket_page_table_reset(struct gasket_page_table *pg_tbl)
> -{
> -       mutex_lock(&pg_tbl->mutex);
> -       gasket_page_table_unmap_all_nolock(pg_tbl);
> -       writeq(pg_tbl->config.total_entries, pg_tbl->extended_offset_reg);
> -       mutex_unlock(&pg_tbl->mutex);
> -}
> -
> -/* See gasket_page_table.h for description. */
> -int gasket_page_table_lookup_page(struct gasket_page_table *pg_tbl,
> -                                 ulong dev_addr, struct page **ppage,
> -                                 ulong *poffset)
> -{
> -       uint page_num;
> -       struct gasket_page_table_entry *pte;
> -
> -       mutex_lock(&pg_tbl->mutex);
> -       if (gasket_addr_is_simple(pg_tbl, dev_addr)) {
> -               page_num = gasket_simple_page_idx(pg_tbl, dev_addr);
> -               if (page_num >= pg_tbl->num_simple_entries)
> -                       goto fail;
> -
> -               pte = pg_tbl->entries + page_num;
> -               if (pte->status != PTE_INUSE)
> -                       goto fail;
> -       } else {
> -               /* Find the level 0 entry, */
> -               page_num = gasket_extended_lvl0_page_idx(pg_tbl, dev_addr);
> -               if (page_num >= pg_tbl->num_extended_entries)
> -                       goto fail;
> -
> -               pte = pg_tbl->entries + pg_tbl->num_simple_entries +
> page_num;
> -               if (pte->status != PTE_INUSE)
> -                       goto fail;
> -
> -               /* and its contained level 1 entry. */
> -               page_num = gasket_extended_lvl1_page_idx(pg_tbl, dev_addr);
> -               pte = pte->sublevel + page_num;
> -               if (pte->status != PTE_INUSE)
> -                       goto fail;
> -       }
> -
> -       *ppage = pte->page;
> -       *poffset = pte->offset;
> -       mutex_unlock(&pg_tbl->mutex);
> -       return 0;
> -
> -fail:
> -       *ppage = NULL;
> -       *poffset = 0;
> -       mutex_unlock(&pg_tbl->mutex);
> -       return -EINVAL;
> -}
> -
> -/* See gasket_page_table.h for description. */
> -bool gasket_page_table_are_addrs_bad(struct gasket_page_table *pg_tbl,
> -                                    ulong host_addr, ulong dev_addr,
> -                                    ulong bytes)
> -{
> -       if (host_addr & (PAGE_SIZE - 1)) {
> -               dev_err(pg_tbl->device,
> -                       "host mapping address 0x%lx must be page
> aligned\n",
> -                       host_addr);
> -               return true;
> -       }
> -
> -       return gasket_page_table_is_dev_addr_bad(pg_tbl, dev_addr, bytes);
> -}
> -EXPORT_SYMBOL(gasket_page_table_are_addrs_bad);
> -
> -/* See gasket_page_table.h for description. */
> -bool gasket_page_table_is_dev_addr_bad(struct gasket_page_table *pg_tbl,
> -                                      ulong dev_addr, ulong bytes)
> -{
> -       uint num_pages = bytes / PAGE_SIZE;
> -
> -       if (bytes & (PAGE_SIZE - 1)) {
> -               dev_err(pg_tbl->device,
> -                       "mapping size 0x%lX must be page aligned\n",
> bytes);
> -               return true;
> -       }
> -
> -       if (num_pages == 0) {
> -               dev_err(pg_tbl->device,
> -                       "requested mapping is less than one page: %lu /
> %lu\n",
> -                       bytes, PAGE_SIZE);
> -               return true;
> -       }
> -
> -       if (gasket_addr_is_simple(pg_tbl, dev_addr))
> -               return gasket_is_simple_dev_addr_bad(pg_tbl, dev_addr,
> -                                                    num_pages);
> -       return gasket_is_extended_dev_addr_bad(pg_tbl, dev_addr,
> num_pages);
> -}
> -EXPORT_SYMBOL(gasket_page_table_is_dev_addr_bad);
> -
> -/* See gasket_page_table.h for description. */
> -uint gasket_page_table_max_size(struct gasket_page_table *page_table)
> -{
> -       if (!page_table)
> -               return 0;
> -       return page_table->config.total_entries;
> -}
> -EXPORT_SYMBOL(gasket_page_table_max_size);
> -
> -/* See gasket_page_table.h for description. */
> -uint gasket_page_table_num_entries(struct gasket_page_table *pg_tbl)
> -{
> -       if (!pg_tbl)
> -               return 0;
> -       return pg_tbl->num_simple_entries + pg_tbl->num_extended_entries;
> -}
> -EXPORT_SYMBOL(gasket_page_table_num_entries);
> -
> -/* See gasket_page_table.h for description. */
> -uint gasket_page_table_num_simple_entries(struct gasket_page_table
> *pg_tbl)
> -{
> -       if (!pg_tbl)
> -               return 0;
> -       return pg_tbl->num_simple_entries;
> -}
> -EXPORT_SYMBOL(gasket_page_table_num_simple_entries);
> -
> -/* See gasket_page_table.h for description. */
> -uint gasket_page_table_num_active_pages(struct gasket_page_table *pg_tbl)
> -{
> -       if (!pg_tbl)
> -               return 0;
> -       return pg_tbl->num_active_pages;
> -}
> -EXPORT_SYMBOL(gasket_page_table_num_active_pages);
> -
> -/* See gasket_page_table.h */
> -int gasket_page_table_system_status(struct gasket_page_table *page_table)
> -{
> -       if (!page_table)
> -               return GASKET_STATUS_LAMED;
> -
> -       if (gasket_page_table_num_entries(page_table) == 0) {
> -               dev_dbg(page_table->device, "Page table size is 0\n");
> -               return GASKET_STATUS_LAMED;
> -       }
> -
> -       return GASKET_STATUS_ALIVE;
> -}
> -
> -/* Record the host_addr to coherent dma memory mapping. */
> -int gasket_set_user_virt(struct gasket_dev *gasket_dev, u64 size,
> -                        dma_addr_t dma_address, ulong vma)
> -{
> -       int j;
> -       struct gasket_page_table *pg_tbl;
> -
> -       unsigned int num_pages = size / PAGE_SIZE;
> -
> -       /*
> -        * TODO: for future chipset, better handling of the case where
> multiple
> -        * page tables are supported on a given device
> -        */
> -       pg_tbl = gasket_dev->page_table[0];
> -       if (!pg_tbl) {
> -               dev_dbg(gasket_dev->dev, "%s: invalid page table index\n",
> -                       __func__);
> -               return 0;
> -       }
> -       for (j = 0; j < num_pages; j++) {
> -               pg_tbl->coherent_pages[j].user_virt =
> -                       (u64)vma + j * PAGE_SIZE;
> -       }
> -       return 0;
> -}
> -
> -/* Allocate a block of coherent memory. */
> -int gasket_alloc_coherent_memory(struct gasket_dev *gasket_dev, u64 size,
> -                                dma_addr_t *dma_address, u64 index)
> -{
> -       dma_addr_t handle;
> -       void *mem;
> -       int j;
> -       unsigned int num_pages = DIV_ROUND_UP(size, PAGE_SIZE);
> -       const struct gasket_driver_desc *driver_desc =
> -               gasket_get_driver_desc(gasket_dev);
> -
> -       if (!gasket_dev->page_table[index])
> -               return -EFAULT;
> -
> -       if (num_pages == 0)
> -               return -EINVAL;
> -
> -       mem = dma_alloc_coherent(gasket_get_device(gasket_dev),
> -                                num_pages * PAGE_SIZE, &handle,
> GFP_KERNEL);
> -       if (!mem)
> -               goto nomem;
> -
> -       gasket_dev->page_table[index]->num_coherent_pages = num_pages;
> -
> -       /* allocate the physical memory block */
> -       gasket_dev->page_table[index]->coherent_pages =
> -               kcalloc(num_pages,
> -
>  sizeof(*gasket_dev->page_table[index]->coherent_pages),
> -                       GFP_KERNEL);
> -       if (!gasket_dev->page_table[index]->coherent_pages)
> -               goto nomem;
> -
> -       gasket_dev->coherent_buffer.length_bytes =
> -               PAGE_SIZE * (num_pages);
> -       gasket_dev->coherent_buffer.phys_base = handle;
> -       gasket_dev->coherent_buffer.virt_base = mem;
> -
> -       *dma_address = driver_desc->coherent_buffer_description.base;
> -       for (j = 0; j < num_pages; j++) {
> -               gasket_dev->page_table[index]->coherent_pages[j].paddr =
> -                       handle + j * PAGE_SIZE;
> -
>  gasket_dev->page_table[index]->coherent_pages[j].kernel_virt =
> -                       (u64)mem + j * PAGE_SIZE;
> -       }
> -
> -       return 0;
> -
> -nomem:
> -       if (mem) {
> -               dma_free_coherent(gasket_get_device(gasket_dev),
> -                                 num_pages * PAGE_SIZE, mem, handle);
> -               gasket_dev->coherent_buffer.length_bytes = 0;
> -               gasket_dev->coherent_buffer.virt_base = NULL;
> -               gasket_dev->coherent_buffer.phys_base = 0;
> -       }
> -
> -       kfree(gasket_dev->page_table[index]->coherent_pages);
> -       gasket_dev->page_table[index]->coherent_pages = NULL;
> -       gasket_dev->page_table[index]->num_coherent_pages = 0;
> -       return -ENOMEM;
> -}
> -
> -/* Free a block of coherent memory. */
> -int gasket_free_coherent_memory(struct gasket_dev *gasket_dev, u64 size,
> -                               dma_addr_t dma_address, u64 index)
> -{
> -       const struct gasket_driver_desc *driver_desc;
> -
> -       if (!gasket_dev->page_table[index])
> -               return -EFAULT;
> -
> -       driver_desc = gasket_get_driver_desc(gasket_dev);
> -
> -       if (driver_desc->coherent_buffer_description.base != dma_address)
> -               return -EADDRNOTAVAIL;
> -
> -       if (gasket_dev->coherent_buffer.length_bytes) {
> -               dma_free_coherent(gasket_get_device(gasket_dev),
> -                                 gasket_dev->coherent_buffer.length_bytes,
> -                                 gasket_dev->coherent_buffer.virt_base,
> -                                 gasket_dev->coherent_buffer.phys_base);
> -               gasket_dev->coherent_buffer.length_bytes = 0;
> -               gasket_dev->coherent_buffer.virt_base = NULL;
> -               gasket_dev->coherent_buffer.phys_base = 0;
> -       }
> -
> -       kfree(gasket_dev->page_table[index]->coherent_pages);
> -       gasket_dev->page_table[index]->coherent_pages = NULL;
> -       gasket_dev->page_table[index]->num_coherent_pages = 0;
> -
> -       return 0;
> -}
> -
> -/* Release all coherent memory. */
> -void gasket_free_coherent_memory_all(struct gasket_dev *gasket_dev, u64
> index)
> -{
> -       if (!gasket_dev->page_table[index])
> -               return;
> -
> -       if (gasket_dev->coherent_buffer.length_bytes) {
> -               dma_free_coherent(gasket_get_device(gasket_dev),
> -                                 gasket_dev->coherent_buffer.length_bytes,
> -                                 gasket_dev->coherent_buffer.virt_base,
> -                                 gasket_dev->coherent_buffer.phys_base);
> -               gasket_dev->coherent_buffer.length_bytes = 0;
> -               gasket_dev->coherent_buffer.virt_base = NULL;
> -               gasket_dev->coherent_buffer.phys_base = 0;
> -       }
> -}
> diff --git a/drivers/staging/gasket/gasket_page_table.h
> b/drivers/staging/gasket/gasket_page_table.h
> deleted file mode 100644
> index 7b01b73ea3e7..000000000000
> --- a/drivers/staging/gasket/gasket_page_table.h
> +++ /dev/null
> @@ -1,249 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Gasket Page Table functionality. This file describes the address
> - * translation/paging functionality supported by the Gasket driver
> framework.
> - * As much as possible, internal details are hidden to simplify use -
> - * all calls are thread-safe (protected by an internal mutex) except where
> - * indicated otherwise.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -
> -#ifndef __GASKET_PAGE_TABLE_H__
> -#define __GASKET_PAGE_TABLE_H__
> -
> -#include <linux/pci.h>
> -#include <linux/types.h>
> -
> -#include "gasket_constants.h"
> -#include "gasket_core.h"
> -
> -/*
> - * Structure used for managing address translation on a device. All
> details are
> - * internal to the implementation.
> - */
> -struct gasket_page_table;
> -
> -/*
> - * Allocate and init address translation data.
> - * @ppage_table: Pointer to Gasket page table pointer. Set by this call.
> - * @att_base_reg: [Mapped] pointer to the first entry in the device's
> address
> - *                translation table.
> - * @extended_offset_reg: [Mapped] pointer to the device's register
> containing
> - *                       the starting index of the extended translation
> table.
> - * @extended_bit_location: The index of the bit indicating whether an
> address
> - *                         is extended.
> - * @total_entries: The total number of entries in the device's address
> - *                 translation table.
> - * @device: Device structure for the underlying device. Only used for
> logging.
> - * @pci_dev: PCI system descriptor for the underlying device.
> - * whether the driver will supply its own.
> - *
> - * Description: Allocates and initializes data to track address
> translation -
> - * simple and extended page table metadata. Initially, the page table is
> - * partitioned such that all addresses are "simple" (single-level lookup).
> - * gasket_partition_page_table can be called to change this paritioning.
> - *
> - * Returns 0 on success, a negative error code otherwise.
> - */
> -int gasket_page_table_init(struct gasket_page_table **ppg_tbl,
> -                          const struct gasket_bar_data *bar_data,
> -                          const struct gasket_page_table_config
> *page_table_config,
> -                          struct device *device, struct pci_dev *pci_dev);
> -
> -/*
> - * Deallocate and cleanup page table data.
> - * @page_table: Gasket page table pointer.
> - *
> - * Description: The inverse of gasket_init; frees page_table and its
> contained
> - *              elements.
> - *
> - *             Because this call destroys the page table, it cannot be
> - *             thread-safe (mutex-protected)!
> - */
> -void gasket_page_table_cleanup(struct gasket_page_table *page_table);
> -
> -/*
> - * Sets the size of the simple page table.
> - * @page_table: Gasket page table pointer.
> - * @num_simple_entries: Desired size of the simple page table (in
> entries).
> - *
> - * Description: gasket_partition_page_table checks to see if the simple
> page
> - *              size can be changed (i.e., if there are no active extended
> - *              mappings in the new simple size range), and, if so,
> - *              sets the new simple and extended page table sizes.
> - *
> - *              Returns 0 if successful, or non-zero if the page table
> entries
> - *              are not free.
> - */
> -int gasket_page_table_partition(struct gasket_page_table *page_table,
> -                               uint num_simple_entries);
> -
> -/*
> - * Get and map [host] user space pages into device memory.
> - * @page_table: Gasket page table pointer.
> - * @host_addr: Starting host virtual memory address of the pages.
> - * @dev_addr: Starting device address of the pages.
> - * @num_pages: Number of [4kB] pages to map.
> - *
> - * Description: Maps the "num_pages" pages of host memory pointed to by
> - *              host_addr to the address "dev_addr" in device memory.
> - *
> - *              The caller is responsible for checking the addresses
> ranges.
> - *
> - *              Returns 0 if successful or a non-zero error number
> otherwise.
> - *              If there is an error, no pages are mapped.
> - */
> -int gasket_page_table_map(struct gasket_page_table *page_table, ulong
> host_addr,
> -                         ulong dev_addr, uint num_pages);
> -
> -/*
> - * Un-map host pages from device memory.
> - * @page_table: Gasket page table pointer.
> - * @dev_addr: Starting device address of the pages to unmap.
> - * @num_pages: The number of [4kB] pages to unmap.
> - *
> - * Description: The inverse of gasket_map_pages. Unmaps pages from the
> device.
> - */
> -void gasket_page_table_unmap(struct gasket_page_table *page_table,
> -                            ulong dev_addr, uint num_pages);
> -
> -/*
> - * Unmap ALL host pages from device memory.
> - * @page_table: Gasket page table pointer.
> - */
> -void gasket_page_table_unmap_all(struct gasket_page_table *page_table);
> -
> -/*
> - * Unmap all host pages from device memory and reset the table to fully
> simple
> - * addressing.
> - * @page_table: Gasket page table pointer.
> - */
> -void gasket_page_table_reset(struct gasket_page_table *page_table);
> -
> -/*
> - * Reclaims unused page table memory.
> - * @page_table: Gasket page table pointer.
> - *
> - * Description: Examines the page table and frees any currently-unused
> - *              allocations. Called internally on gasket_cleanup().
> - */
> -void gasket_page_table_garbage_collect(struct gasket_page_table
> *page_table);
> -
> -/*
> - * Retrieve the backing page for a device address.
> - * @page_table: Gasket page table pointer.
> - * @dev_addr: Gasket device address.
> - * @ppage: Pointer to a page pointer for the returned page.
> - * @poffset: Pointer to an unsigned long for the returned offset.
> - *
> - * Description: Interprets the address and looks up the corresponding page
> - *              in the page table and the offset in that page.  (We need
> an
> - *              offset because the host page may be larger than the
> Gasket chip
> - *              page it contains.)
> - *
> - *              Returns 0 if successful, -1 for an error.  The page
> pointer
> - *              and offset are returned through the pointers, if
> successful.
> - */
> -int gasket_page_table_lookup_page(struct gasket_page_table *page_table,
> -                                 ulong dev_addr, struct page **page,
> -                                 ulong *poffset);
> -
> -/*
> - * Checks validity for input addrs and size.
> - * @page_table: Gasket page table pointer.
> - * @host_addr: Host address to check.
> - * @dev_addr: Gasket device address.
> - * @bytes: Size of the range to check (in bytes).
> - *
> - * Description: This call performs a number of checks to verify that the
> ranges
> - * specified by both addresses and the size are valid for mapping pages
> into
> - * device memory.
> - *
> - * Returns true if the mapping is bad, false otherwise.
> - */
> -bool gasket_page_table_are_addrs_bad(struct gasket_page_table *page_table,
> -                                    ulong host_addr, ulong dev_addr,
> -                                    ulong bytes);
> -
> -/*
> - * Checks validity for input dev addr and size.
> - * @page_table: Gasket page table pointer.
> - * @dev_addr: Gasket device address.
> - * @bytes: Size of the range to check (in bytes).
> - *
> - * Description: This call performs a number of checks to verify that the
> range
> - * specified by the device address and the size is valid for mapping
> pages into
> - * device memory.
> - *
> - * Returns true if the address is bad, false otherwise.
> - */
> -bool gasket_page_table_is_dev_addr_bad(struct gasket_page_table
> *page_table,
> -                                      ulong dev_addr, ulong bytes);
> -
> -/*
> - * Gets maximum size for the given page table.
> - * @page_table: Gasket page table pointer.
> - */
> -uint gasket_page_table_max_size(struct gasket_page_table *page_table);
> -
> -/*
> - * Gets the total number of entries in the arg.
> - * @page_table: Gasket page table pointer.
> - */
> -uint gasket_page_table_num_entries(struct gasket_page_table *page_table);
> -
> -/*
> - * Gets the number of simple entries.
> - * @page_table: Gasket page table pointer.
> - */
> -uint gasket_page_table_num_simple_entries(struct gasket_page_table
> *page_table);
> -
> -/*
> - * Gets the number of actively pinned pages.
> - * @page_table: Gasket page table pointer.
> - */
> -uint gasket_page_table_num_active_pages(struct gasket_page_table
> *page_table);
> -
> -/*
> - * Get status of page table managed by @page_table.
> - * @page_table: Gasket page table pointer.
> - */
> -int gasket_page_table_system_status(struct gasket_page_table *page_table);
> -
> -/*
> - * Allocate a block of coherent memory.
> - * @gasket_dev: Gasket Device.
> - * @size: Size of the memory block.
> - * @dma_address: Dma address allocated by the kernel.
> - * @index: Index of the gasket_page_table within this Gasket device
> - *
> - * Description: Allocate a contiguous coherent memory block, DMA'ble
> - * by this device.
> - */
> -int gasket_alloc_coherent_memory(struct gasket_dev *gasket_dev, uint64_t
> size,
> -                                dma_addr_t *dma_address, uint64_t index);
> -/* Release a block of contiguous coherent memory, in use by a device. */
> -int gasket_free_coherent_memory(struct gasket_dev *gasket_dev, uint64_t
> size,
> -                               dma_addr_t dma_address, uint64_t index);
> -
> -/* Release all coherent memory. */
> -void gasket_free_coherent_memory_all(struct gasket_dev *gasket_dev,
> -                                    uint64_t index);
> -
> -/*
> - * Records the host_addr to coherent dma memory mapping.
> - * @gasket_dev: Gasket Device.
> - * @size: Size of the virtual address range to map.
> - * @dma_address: Dma address within the coherent memory range.
> - * @vma: Virtual address we wish to map to coherent memory.
> - *
> - * Description: For each page in the virtual address range, record the
> - * coherent page mapping.
> - *
> - * Does not perform validity checking.
> - */
> -int gasket_set_user_virt(struct gasket_dev *gasket_dev, uint64_t size,
> -                        dma_addr_t dma_address, ulong vma);
> -
> -#endif  /* __GASKET_PAGE_TABLE_H__ */
> diff --git a/drivers/staging/gasket/gasket_sysfs.c
> b/drivers/staging/gasket/gasket_sysfs.c
> deleted file mode 100644
> index c5658fdf4d28..000000000000
> --- a/drivers/staging/gasket/gasket_sysfs.c
> +++ /dev/null
> @@ -1,398 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/* Copyright (C) 2018 Google, Inc. */
> -#include "gasket_sysfs.h"
> -
> -#include "gasket_core.h"
> -
> -#include <linux/device.h>
> -#include <linux/printk.h>
> -
> -/*
> - * Pair of kernel device and user-specified pointer. Used in lookups in
> sysfs
> - * "show" functions to return user data.
> - */
> -
> -struct gasket_sysfs_mapping {
> -       /*
> -        * The device bound to this mapping. If this is NULL, then this
> mapping
> -        * is free.
> -        */
> -       struct device *device;
> -
> -       /* The Gasket descriptor for this device. */
> -       struct gasket_dev *gasket_dev;
> -
> -       /* This device's set of sysfs attributes/nodes. */
> -       struct gasket_sysfs_attribute *attributes;
> -
> -       /* The number of live elements in "attributes". */
> -       int attribute_count;
> -
> -       /* Protects structure from simultaneous access. */
> -       struct mutex mutex;
> -
> -       /* Tracks active users of this mapping. */
> -       struct kref refcount;
> -};
> -
> -/*
> - * Data needed to manage users of this sysfs utility.
> - * Currently has a fixed size; if space is a concern, this can be
> dynamically
> - * allocated.
> - */
> -/*
> - * 'Global' (file-scoped) list of mappings between devices and gasket_data
> - * pointers. This removes the requirement to have a gasket_sysfs_data
> - * handle in all files.
> - */
> -static struct gasket_sysfs_mapping
> dev_mappings[GASKET_SYSFS_NUM_MAPPINGS];
> -
> -/* Callback when a mapping's refcount goes to zero. */
> -static void release_entry(struct kref *ref)
> -{
> -       /* All work is done after the return from kref_put. */
> -}
> -
> -/* Look up mapping information for the given device. */
> -static struct gasket_sysfs_mapping *get_mapping(struct device *device)
> -{
> -       int i;
> -
> -       for (i = 0; i < GASKET_SYSFS_NUM_MAPPINGS; i++) {
> -               mutex_lock(&dev_mappings[i].mutex);
> -               if (dev_mappings[i].device == device) {
> -                       kref_get(&dev_mappings[i].refcount);
> -                       mutex_unlock(&dev_mappings[i].mutex);
> -                       return &dev_mappings[i];
> -               }
> -               mutex_unlock(&dev_mappings[i].mutex);
> -       }
> -
> -       dev_dbg(device, "%s: Mapping to device %s not found\n",
> -               __func__, device->kobj.name);
> -       return NULL;
> -}
> -
> -/* Put a reference to a mapping. */
> -static void put_mapping(struct gasket_sysfs_mapping *mapping)
> -{
> -       int i;
> -       int num_files_to_remove = 0;
> -       struct device_attribute *files_to_remove;
> -       struct device *device;
> -
> -       if (!mapping) {
> -               pr_debug("%s: Mapping should not be NULL\n", __func__);
> -               return;
> -       }
> -
> -       mutex_lock(&mapping->mutex);
> -       if (kref_put(&mapping->refcount, release_entry)) {
> -               dev_dbg(mapping->device, "Removing Gasket sysfs
> mapping\n");
> -               /*
> -                * We can't remove the sysfs nodes in the kref callback,
> since
> -                * device_remove_file() blocks until the node is free.
> -                * Readers/writers of sysfs nodes, though, will be blocked
> on
> -                * the mapping mutex, resulting in deadlock. To fix this,
> the
> -                * sysfs nodes are removed outside the lock.
> -                */
> -               device = mapping->device;
> -               num_files_to_remove = mapping->attribute_count;
> -               files_to_remove = kcalloc(num_files_to_remove,
> -                                         sizeof(*files_to_remove),
> -                                         GFP_KERNEL);
> -               if (files_to_remove)
> -                       for (i = 0; i < num_files_to_remove; i++)
> -                               files_to_remove[i] =
> -                                   mapping->attributes[i].attr;
> -               else
> -                       num_files_to_remove = 0;
> -
> -               kfree(mapping->attributes);
> -               mapping->attributes = NULL;
> -               mapping->attribute_count = 0;
> -               put_device(mapping->device);
> -               mapping->device = NULL;
> -               mapping->gasket_dev = NULL;
> -       }
> -       mutex_unlock(&mapping->mutex);
> -
> -       if (num_files_to_remove != 0) {
> -               for (i = 0; i < num_files_to_remove; ++i)
> -                       device_remove_file(device, &files_to_remove[i]);
> -               kfree(files_to_remove);
> -       }
> -}
> -
> -/*
> - * Put a reference to a mapping N times.
> - *
> - * In higher-level resource acquire/release function pairs, the release
> function
> - * will need to release a mapping 2x - once for the refcount taken in the
> - * release function itself, and once for the count taken in the acquire
> call.
> - */
> -static void put_mapping_n(struct gasket_sysfs_mapping *mapping, int times)
> -{
> -       int i;
> -
> -       for (i = 0; i < times; i++)
> -               put_mapping(mapping);
> -}
> -
> -void gasket_sysfs_init(void)
> -{
> -       int i;
> -
> -       for (i = 0; i < GASKET_SYSFS_NUM_MAPPINGS; i++) {
> -               dev_mappings[i].device = NULL;
> -               mutex_init(&dev_mappings[i].mutex);
> -       }
> -}
> -
> -int gasket_sysfs_create_mapping(struct device *device,
> -                               struct gasket_dev *gasket_dev)
> -{
> -       struct gasket_sysfs_mapping *mapping;
> -       int map_idx = -1;
> -
> -       /*
> -        * We need a function-level mutex to protect against the same
> device
> -        * being added [multiple times] simultaneously.
> -        */
> -       static DEFINE_MUTEX(function_mutex);
> -
> -       mutex_lock(&function_mutex);
> -       dev_dbg(device, "Creating sysfs entries for device\n");
> -
> -       /* Check that the device we're adding hasn't already been added. */
> -       mapping = get_mapping(device);
> -       if (mapping) {
> -               dev_err(device,
> -                       "Attempting to re-initialize sysfs mapping for
> device\n");
> -               put_mapping(mapping);
> -               mutex_unlock(&function_mutex);
> -               return -EBUSY;
> -       }
> -
> -       /* Find the first empty entry in the array. */
> -       for (map_idx = 0; map_idx < GASKET_SYSFS_NUM_MAPPINGS; ++map_idx) {
> -               mutex_lock(&dev_mappings[map_idx].mutex);
> -               if (!dev_mappings[map_idx].device)
> -                       /* Break with the mutex held! */
> -                       break;
> -               mutex_unlock(&dev_mappings[map_idx].mutex);
> -       }
> -
> -       if (map_idx == GASKET_SYSFS_NUM_MAPPINGS) {
> -               dev_err(device, "All mappings have been exhausted\n");
> -               mutex_unlock(&function_mutex);
> -               return -ENOMEM;
> -       }
> -
> -       dev_dbg(device, "Creating sysfs mapping for device %s\n",
> -               device->kobj.name);
> -
> -       mapping = &dev_mappings[map_idx];
> -       mapping->attributes = kcalloc(GASKET_SYSFS_MAX_NODES,
> -                                     sizeof(*mapping->attributes),
> -                                     GFP_KERNEL);
> -       if (!mapping->attributes) {
> -               dev_dbg(device, "Unable to allocate sysfs attribute
> array\n");
> -               mutex_unlock(&mapping->mutex);
> -               mutex_unlock(&function_mutex);
> -               return -ENOMEM;
> -       }
> -
> -       kref_init(&mapping->refcount);
> -       mapping->device = get_device(device);
> -       mapping->gasket_dev = gasket_dev;
> -       mapping->attribute_count = 0;
> -       mutex_unlock(&mapping->mutex);
> -       mutex_unlock(&function_mutex);
> -
> -       /* Don't decrement the refcount here! One open count keeps it
> alive! */
> -       return 0;
> -}
> -
> -int gasket_sysfs_create_entries(struct device *device,
> -                               const struct gasket_sysfs_attribute *attrs)
> -{
> -       int i;
> -       int ret;
> -       struct gasket_sysfs_mapping *mapping = get_mapping(device);
> -
> -       if (!mapping) {
> -               dev_dbg(device,
> -                       "Creating entries for device without first
> initializing mapping\n");
> -               return -EINVAL;
> -       }
> -
> -       mutex_lock(&mapping->mutex);
> -       for (i = 0; attrs[i].attr.attr.name; i++) {
> -               if (mapping->attribute_count == GASKET_SYSFS_MAX_NODES) {
> -                       dev_err(device,
> -                               "Maximum number of sysfs nodes reached for
> device\n");
> -                       mutex_unlock(&mapping->mutex);
> -                       put_mapping(mapping);
> -                       return -ENOMEM;
> -               }
> -
> -               ret = device_create_file(device, &attrs[i].attr);
> -               if (ret) {
> -                       dev_dbg(device, "Unable to create device
> entries\n");
> -                       mutex_unlock(&mapping->mutex);
> -                       put_mapping(mapping);
> -                       return ret;
> -               }
> -
> -               mapping->attributes[mapping->attribute_count] = attrs[i];
> -               ++mapping->attribute_count;
> -       }
> -
> -       mutex_unlock(&mapping->mutex);
> -       put_mapping(mapping);
> -       return 0;
> -}
> -EXPORT_SYMBOL(gasket_sysfs_create_entries);
> -
> -void gasket_sysfs_remove_mapping(struct device *device)
> -{
> -       struct gasket_sysfs_mapping *mapping = get_mapping(device);
> -
> -       if (!mapping) {
> -               dev_err(device,
> -                       "Attempted to remove non-existent sysfs mapping to
> device\n");
> -               return;
> -       }
> -
> -       put_mapping_n(mapping, 2);
> -}
> -
> -struct gasket_dev *gasket_sysfs_get_device_data(struct device *device)
> -{
> -       struct gasket_sysfs_mapping *mapping = get_mapping(device);
> -
> -       if (!mapping) {
> -               dev_err(device, "device not registered\n");
> -               return NULL;
> -       }
> -
> -       return mapping->gasket_dev;
> -}
> -EXPORT_SYMBOL(gasket_sysfs_get_device_data);
> -
> -void gasket_sysfs_put_device_data(struct device *device, struct
> gasket_dev *dev)
> -{
> -       struct gasket_sysfs_mapping *mapping = get_mapping(device);
> -
> -       if (!mapping)
> -               return;
> -
> -       /* See comment of put_mapping_n() for why the '2' is necessary. */
> -       put_mapping_n(mapping, 2);
> -}
> -EXPORT_SYMBOL(gasket_sysfs_put_device_data);
> -
> -struct gasket_sysfs_attribute *
> -gasket_sysfs_get_attr(struct device *device, struct device_attribute
> *attr)
> -{
> -       int i;
> -       int num_attrs;
> -       struct gasket_sysfs_mapping *mapping = get_mapping(device);
> -       struct gasket_sysfs_attribute *attrs = NULL;
> -
> -       if (!mapping)
> -               return NULL;
> -
> -       attrs = mapping->attributes;
> -       num_attrs = mapping->attribute_count;
> -       for (i = 0; i < num_attrs; ++i) {
> -               if (!strcmp(attrs[i].attr.attr.name, attr->attr.name))
> -                       return &attrs[i];
> -       }
> -
> -       dev_err(device, "Unable to find match for device_attribute %s\n",
> -               attr->attr.name);
> -       return NULL;
> -}
> -EXPORT_SYMBOL(gasket_sysfs_get_attr);
> -
> -void gasket_sysfs_put_attr(struct device *device,
> -                          struct gasket_sysfs_attribute *attr)
> -{
> -       int i;
> -       int num_attrs;
> -       struct gasket_sysfs_mapping *mapping = get_mapping(device);
> -       struct gasket_sysfs_attribute *attrs = NULL;
> -
> -       if (!mapping)
> -               return;
> -
> -       attrs = mapping->attributes;
> -       num_attrs = mapping->attribute_count;
> -       for (i = 0; i < num_attrs; ++i) {
> -               if (&attrs[i] == attr) {
> -                       put_mapping_n(mapping, 2);
> -                       return;
> -               }
> -       }
> -
> -       dev_err(device, "Unable to put unknown attribute: %s\n",
> -               attr->attr.attr.name);
> -       put_mapping(mapping);
> -}
> -EXPORT_SYMBOL(gasket_sysfs_put_attr);
> -
> -ssize_t gasket_sysfs_register_store(struct device *device,
> -                                   struct device_attribute *attr,
> -                                   const char *buf, size_t count)
> -{
> -       ulong parsed_value = 0;
> -       struct gasket_sysfs_mapping *mapping;
> -       struct gasket_dev *gasket_dev;
> -       struct gasket_sysfs_attribute *gasket_attr;
> -
> -       if (count < 3 || buf[0] != '0' || buf[1] != 'x') {
> -               dev_err(device,
> -                       "sysfs register write format: \"0x<hex
> value>\"\n");
> -               return -EINVAL;
> -       }
> -
> -       if (kstrtoul(buf, 16, &parsed_value) != 0) {
> -               dev_err(device,
> -                       "Unable to parse input as 64-bit hex value: %s\n",
> buf);
> -               return -EINVAL;
> -       }
> -
> -       mapping = get_mapping(device);
> -       if (!mapping) {
> -               dev_err(device, "Device driver may have been removed\n");
> -               return 0;
> -       }
> -
> -       gasket_dev = mapping->gasket_dev;
> -       if (!gasket_dev) {
> -               dev_err(device, "Device driver may have been removed\n");
> -               put_mapping(mapping);
> -               return 0;
> -       }
> -
> -       gasket_attr = gasket_sysfs_get_attr(device, attr);
> -       if (!gasket_attr) {
> -               put_mapping(mapping);
> -               return count;
> -       }
> -
> -       gasket_dev_write_64(gasket_dev, parsed_value,
> -                           gasket_attr->data.bar_address.bar,
> -                           gasket_attr->data.bar_address.offset);
> -
> -       if (gasket_attr->write_callback)
> -               gasket_attr->write_callback(gasket_dev, gasket_attr,
> -                                           parsed_value);
> -
> -       gasket_sysfs_put_attr(device, gasket_attr);
> -       put_mapping(mapping);
> -       return count;
> -}
> -EXPORT_SYMBOL(gasket_sysfs_register_store);
> diff --git a/drivers/staging/gasket/gasket_sysfs.h
> b/drivers/staging/gasket/gasket_sysfs.h
> deleted file mode 100644
> index d5e167dfbe76..000000000000
> --- a/drivers/staging/gasket/gasket_sysfs.h
> +++ /dev/null
> @@ -1,175 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Set of common sysfs utilities.
> - *
> - * Copyright (C) 2018 Google, Inc.
> - */
> -
> -/* The functions described here are a set of utilities to allow each file
> in the
> - * Gasket driver framework to manage their own set of sysfs entries,
> instead of
> - * centralizing all that work in one file.
> - *
> - * The goal of these utilities is to allow for sysfs entries to be easily
> - * created without causing a proliferation of sysfs "show" functions. This
> - * requires O(N) string lookups during show function execution, but as
> reading
> - * sysfs entries is rarely performance-critical, this is likely
> acceptible.
> - */
> -#ifndef __GASKET_SYSFS_H__
> -#define __GASKET_SYSFS_H__
> -
> -#include "gasket_constants.h"
> -#include "gasket_core.h"
> -#include <linux/device.h>
> -#include <linux/stringify.h>
> -#include <linux/sysfs.h>
> -
> -/* The maximum number of mappings/devices a driver needs to support. */
> -#define GASKET_SYSFS_NUM_MAPPINGS (GASKET_FRAMEWORK_DESC_MAX *
> GASKET_DEV_MAX)
> -
> -/* The maximum number of sysfs nodes in a directory.
> - */
> -#define GASKET_SYSFS_MAX_NODES 196
> -
> -/*
> - * Terminator struct for a gasket_sysfs_attr array. Must be at the end of
> - * all gasket_sysfs_attribute arrays.
> - */
> -#define GASKET_END_OF_ATTR_ARRAY
>      \
> -       {
>     \
> -               .attr = __ATTR_NULL,                            \
> -               .data.attr_type = 0,                            \
> -       }
> -
> -/*
> - * Pairing of sysfs attribute and user data.
> - * Used in lookups in sysfs "show" functions to return attribute metadata.
> - */
> -struct gasket_sysfs_attribute {
> -       /* The underlying sysfs device attribute associated with this
> data. */
> -       struct device_attribute attr;
> -
> -       /* User-specified data to associate with the attribute. */
> -       union {
> -               struct bar_address_ {
> -                       ulong bar;
> -                       ulong offset;
> -               } bar_address;
> -               uint attr_type;
> -       } data;
> -
> -       /*
> -        * Function pointer to a callback to be invoked when this
> attribute is
> -        * written (if so configured). The arguments are to the Gasket
> device
> -        * pointer, the enclosing gasket_attr structure, and the value
> written.
> -        * The callback should perform any logging necessary, as errors
> cannot
> -        * be returned from the callback.
> -        */
> -       void (*write_callback)(struct gasket_dev *dev,
> -                              struct gasket_sysfs_attribute *attr,
> -                              ulong value);
> -};
> -
> -#define GASKET_SYSFS_RO(_name, _show_function, _attr_type)
>      \
> -       {
>     \
> -               .attr = __ATTR(_name, 0444, _show_function, NULL),
>   \
> -               .data.attr_type = _attr_type
>      \
> -       }
> -
> -/* Initializes the Gasket sysfs subsystem.
> - *
> - * Description: Performs one-time initialization. Must be called before
> usage
> - * at [Gasket] module load time.
> - */
> -void gasket_sysfs_init(void);
> -
> -/*
> - * Create an entry in mapping_data between a device and a Gasket device.
> - * @device: Device struct to map to.
> - * @gasket_dev: The dev struct associated with the driver controlling
> @device.
> - *
> - * Description: This function maps a gasket_dev* to a device*. This
> mapping can
> - * be used in sysfs_show functions to get a handle to the gasket_dev
> struct
> - * controlling the device node.
> - *
> - * If this function is not called before gasket_sysfs_create_entries, a
> warning
> - * will be logged.
> - */
> -int gasket_sysfs_create_mapping(struct device *device,
> -                               struct gasket_dev *gasket_dev);
> -
> -/*
> - * Creates bulk entries in sysfs.
> - * @device: Kernel device structure.
> - * @attrs: List of attributes/sysfs entries to create.
> - *
> - * Description: Creates each sysfs entry described in "attrs". Can be
> called
> - * multiple times for a given @device. If the gasket_dev specified in
> - * gasket_sysfs_create_mapping had a legacy device, the entries will be
> created
> - * for it, as well.
> - */
> -int gasket_sysfs_create_entries(struct device *device,
> -                               const struct gasket_sysfs_attribute
> *attrs);
> -
> -/*
> - * Removes a device mapping from the global table.
> - * @device: Device to unmap.
> - *
> - * Description: Removes the device->Gasket device mapping from the
> internal
> - * table.
> - */
> -void gasket_sysfs_remove_mapping(struct device *device);
> -
> -/*
> - * User data lookup based on kernel device structure.
> - * @device: Kernel device structure.
> - *
> - * Description: Returns the user data associated with "device" in a prior
> call
> - * to gasket_sysfs_create_entries. Returns NULL if no mapping can be
> found.
> - * Upon success, this call take a reference to internal sysfs data that
> must be
> - * released with gasket_sysfs_put_device_data. While this reference is
> held, the
> - * underlying device sysfs information/structure will remain valid/will
> not be
> - * deleted.
> - */
> -struct gasket_dev *gasket_sysfs_get_device_data(struct device *device);
> -
> -/*
> - * Releases a references to internal data.
> - * @device: Kernel device structure.
> - * @dev: Gasket device descriptor (returned by
> gasket_sysfs_get_device_data).
> - */
> -void gasket_sysfs_put_device_data(struct device *device,
> -                                 struct gasket_dev *gasket_dev);
> -
> -/*
> - * Gasket-specific attribute lookup.
> - * @device: Kernel device structure.
> - * @attr: Device attribute to look up.
> - *
> - * Returns the Gasket sysfs attribute associated with the kernel device
> - * attribute and device structure itself. Upon success, this call will
> take a
> - * reference to internal sysfs data that must be released with a call to
> - * gasket_sysfs_put_attr. While this reference is held, the underlying
> device
> - * sysfs information/structure will remain valid/will not be deleted.
> - */
> -struct gasket_sysfs_attribute *
> -gasket_sysfs_get_attr(struct device *device, struct device_attribute
> *attr);
> -
> -/*
> - * Releases a references to internal data.
> - * @device: Kernel device structure.
> - * @attr: Gasket sysfs attribute descriptor (returned by
> - *        gasket_sysfs_get_attr).
> - */
> -void gasket_sysfs_put_attr(struct device *device,
> -                          struct gasket_sysfs_attribute *attr);
> -
> -/*
> - * Write to a register sysfs node.
> - * @buf: NULL-terminated data being written.
> - * @count: number of bytes in the "buf" argument.
> - */
> -ssize_t gasket_sysfs_register_store(struct device *device,
> -                                   struct device_attribute *attr,
> -                                   const char *buf, size_t count);
> -
> -#endif /* __GASKET_SYSFS_H__ */
> --
> 2.30.2
>
>

--000000000000f9c87b05bd9575f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-serif">=
Acked-by: Rob Springer &lt;<a href=3D"mailto:rspringer@google.com">rspringe=
r@google.com</a>&gt;</span><br></div><div class=3D"gmail_default" style=3D"=
font-family:arial,helvetica,sans-serif"><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 15, 2021 at 8=
:44 AM &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfoundati=
on.org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt;<br>
<br>
As none of the proposed things that need to be changed in the gasket<br>
drivers have ever been done, and there has not been any forward progress<br=
>
to get this out of staging, it seems totally abandonded so remove the<br>
code entirely so that people do not spend their time doing tiny cleanups<br=
>
for code that will never get out of staging.<br>
<br>
If this code is actually being used, it can be reverted simply and then<br>
cleaned up properly, but as it is abandoned, let&#39;s just get rid of it.<=
br>
<br>
Cc: Rob Springer &lt;<a href=3D"mailto:rspringer@google.com" target=3D"_bla=
nk">rspringer@google.com</a>&gt;<br>
Cc: Todd Poynor &lt;<a href=3D"mailto:toddpoynor@google.com" target=3D"_bla=
nk">toddpoynor@google.com</a>&gt;<br>
Cc: Ben Chan &lt;<a href=3D"mailto:benchan@chromium.org" target=3D"_blank">=
benchan@chromium.org</a>&gt;<br>
Cc: Richard Yeh &lt;<a href=3D"mailto:rcy@google.com" target=3D"_blank">rcy=
@google.com</a>&gt;<br>
Signed-off-by: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfoundat=
ion.org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 -<=
br>
=C2=A0drivers/staging/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 -<br>
=C2=A0drivers/staging/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 -<br>
=C2=A0drivers/staging/gasket/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A025 -<br>
=C2=A0drivers/staging/gasket/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A010 -<br>
=C2=A0drivers/staging/gasket/TODO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A022 -<br>
=C2=A0drivers/staging/gasket/apex.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A030 -<br>
=C2=A0drivers/staging/gasket/apex_driver.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 726 --------<br>
=C2=A0drivers/staging/gasket/gasket.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 122 --<br>
=C2=A0drivers/staging/gasket/gasket_constants.h=C2=A0 |=C2=A0 =C2=A044 -<br=
>
=C2=A0drivers/staging/gasket/gasket_core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1815=
 --------------------<br>
=C2=A0drivers/staging/gasket/gasket_core.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 638 -------<br>
=C2=A0drivers/staging/gasket/gasket_interrupt.c=C2=A0 |=C2=A0 515 ------<br=
>
=C2=A0drivers/staging/gasket/gasket_interrupt.h=C2=A0 |=C2=A0 =C2=A095 -<br=
>
=C2=A0drivers/staging/gasket/gasket_ioctl.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 388=
 -----<br>
=C2=A0drivers/staging/gasket/gasket_ioctl.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A028 -<br>
=C2=A0drivers/staging/gasket/gasket_page_table.c | 1357 ---------------<br>
=C2=A0drivers/staging/gasket/gasket_page_table.h |=C2=A0 249 ---<br>
=C2=A0drivers/staging/gasket/gasket_sysfs.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 398=
 -----<br>
=C2=A0drivers/staging/gasket/gasket_sysfs.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 175=
 --<br>
=C2=A020 files changed, 6648 deletions(-)<br>
=C2=A0delete mode 100644 drivers/staging/gasket/Kconfig<br>
=C2=A0delete mode 100644 drivers/staging/gasket/Makefile<br>
=C2=A0delete mode 100644 drivers/staging/gasket/TODO<br>
=C2=A0delete mode 100644 drivers/staging/gasket/apex.h<br>
=C2=A0delete mode 100644 drivers/staging/gasket/apex_driver.c<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket.h<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_constants.h<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_core.c<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_core.h<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_interrupt.c<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_interrupt.h<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_ioctl.c<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_ioctl.h<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_page_table.c<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_page_table.h<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_sysfs.c<br>
=C2=A0delete mode 100644 drivers/staging/gasket/gasket_sysfs.h<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index aa84121c5611..392647241626 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -7385,14 +7385,6 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0Documentation/hwmon/gsc=
-hwmon.rst<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0drivers/hwmon/gsc-hwmon.c<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0include/linux/platform_data/gsc_hwmon.h<br>
<br>
-GASKET DRIVER FRAMEWORK<br>
-M:=C2=A0 =C2=A0 =C2=A0Rob Springer &lt;<a href=3D"mailto:rspringer@google.=
com" target=3D"_blank">rspringer@google.com</a>&gt;<br>
-M:=C2=A0 =C2=A0 =C2=A0Todd Poynor &lt;<a href=3D"mailto:toddpoynor@google.=
com" target=3D"_blank">toddpoynor@google.com</a>&gt;<br>
-M:=C2=A0 =C2=A0 =C2=A0Ben Chan &lt;<a href=3D"mailto:benchan@chromium.org"=
 target=3D"_blank">benchan@chromium.org</a>&gt;<br>
-M:=C2=A0 =C2=A0 =C2=A0Richard Yeh &lt;<a href=3D"mailto:rcy@google.com" ta=
rget=3D"_blank">rcy@google.com</a>&gt;<br>
-S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
-F:=C2=A0 =C2=A0 =C2=A0drivers/staging/gasket/<br>
-<br>
=C2=A0GCC PLUGINS<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Kees Cook &lt;<a href=3D"mailto:keescook@chromi=
um.org" target=3D"_blank">keescook@chromium.org</a>&gt;<br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-hardening@vger.kernel.o=
rg" target=3D"_blank">linux-hardening@vger.kernel.org</a><br>
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig<br>
index b22f73d7bfc4..efddc50c81f9 100644<br>
--- a/drivers/staging/Kconfig<br>
+++ b/drivers/staging/Kconfig<br>
@@ -98,8 +98,6 @@ source &quot;drivers/staging/ralink-gdma/Kconfig&quot;<br=
>
<br>
=C2=A0source &quot;drivers/staging/mt7621-dts/Kconfig&quot;<br>
<br>
-source &quot;drivers/staging/gasket/Kconfig&quot;<br>
-<br>
=C2=A0source &quot;drivers/staging/axis-fifo/Kconfig&quot;<br>
<br>
=C2=A0source &quot;drivers/staging/fieldbus/Kconfig&quot;<br>
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile<br>
index 2245059e69c7..e2e95a20081a 100644<br>
--- a/drivers/staging/Makefile<br>
+++ b/drivers/staging/Makefile<br>
@@ -39,7 +39,6 @@ obj-$(CONFIG_PCI_MT7621)=C2=A0 =C2=A0 =C2=A0 +=3D mt7621-=
pci/<br>
=C2=A0obj-$(CONFIG_SOC_MT7621)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D mt7621-dma/<b=
r>
=C2=A0obj-$(CONFIG_DMA_RALINK)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D ralink-gdma/<=
br>
=C2=A0obj-$(CONFIG_SOC_MT7621)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D mt7621-dts/<b=
r>
-obj-$(CONFIG_STAGING_GASKET_FRAMEWORK) +=3D gasket/<br>
=C2=A0obj-$(CONFIG_XIL_AXIS_FIFO)=C2=A0 =C2=A0 +=3D axis-fifo/<br>
=C2=A0obj-$(CONFIG_FIELDBUS_DEV)=C2=A0 =C2=A0 =C2=A0+=3D fieldbus/<br>
=C2=A0obj-$(CONFIG_KPC2000)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D kpc2000/=
<br>
diff --git a/drivers/staging/gasket/Kconfig b/drivers/staging/gasket/Kconfi=
g<br>
deleted file mode 100644<br>
index d9bef8ca41ef..000000000000<br>
--- a/drivers/staging/gasket/Kconfig<br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-# SPDX-License-Identifier: GPL-2.0<br>
-menu &quot;Gasket devices&quot;<br>
-<br>
-config STAGING_GASKET_FRAMEWORK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Gasket framework&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on PCI &amp;&amp; (X86_64 || ARM64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This framework supports Gasket-compatibl=
e devices, such as Apex.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It is required for any of the following =
module(s).<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To compile this driver as a module, choo=
se M here.=C2=A0 The module<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called &quot;gasket&quot;.<br>
-<br>
-config STAGING_APEX_DRIVER<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Apex Driver&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on STAGING_GASKET_FRAMEWORK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver supports the Apex Edge TPU d=
evice.=C2=A0 See<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://cloud.google.com/edge=
-tpu/" rel=3D"noreferrer" target=3D"_blank">https://cloud.google.com/edge-t=
pu/</a> for more information.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y if you want to include this driver=
 in the kernel.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To compile this driver as a module, choo=
se M here.=C2=A0 The module<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called &quot;apex&quot;.<br>
-<br>
-endmenu<br>
diff --git a/drivers/staging/gasket/Makefile b/drivers/staging/gasket/Makef=
ile<br>
deleted file mode 100644<br>
index ce03e256f501..000000000000<br>
--- a/drivers/staging/gasket/Makefile<br>
+++ /dev/null<br>
@@ -1,10 +0,0 @@<br>
-# SPDX-License-Identifier: GPL-2.0<br>
-#<br>
-#=C2=A0 Makefile for Gasket framework and dependent drivers.<br>
-#<br>
-<br>
-obj-$(CONFIG_STAGING_GASKET_FRAMEWORK) +=3D gasket.o<br>
-obj-$(CONFIG_STAGING_APEX_DRIVER)=C2=A0 =C2=A0 =C2=A0 +=3D apex.o<br>
-<br>
-gasket-objs=C2=A0 =C2=A0 :=3D gasket_core.o gasket_ioctl.o gasket_interrup=
t.o gasket_page_table.o gasket_sysfs.o<br>
-apex-objs=C2=A0 =C2=A0 =C2=A0 :=3D apex_driver.o<br>
diff --git a/drivers/staging/gasket/TODO b/drivers/staging/gasket/TODO<br>
deleted file mode 100644<br>
index 5b1865f8af2d..000000000000<br>
--- a/drivers/staging/gasket/TODO<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-This is a list of things that need to be done to get this driver out of th=
e<br>
-staging directory.<br>
-<br>
-- Implement the gasket framework&#39;s functionality through UIO instead o=
f<br>
-=C2=A0 introducing a new user-space drivers framework that is quite simila=
r.<br>
-<br>
-=C2=A0 UIO provides the necessary bits to implement user-space drivers. Me=
anwhile<br>
-=C2=A0 the gasket APIs adds some extra conveniences like PCI BAR mapping, =
and<br>
-=C2=A0 MSI interrupts. Add these features to the UIO subsystem, then re-im=
plement<br>
-=C2=A0 the Apex driver as a basic UIO driver instead (include/linux/uio_dr=
iver.h)<br>
-<br>
-- Document sysfs files with Documentation/ABI/ entries.<br>
-<br>
-- Use misc interface instead of major number for driver version descriptio=
n.<br>
-<br>
-- Add descriptions of module_param&#39;s<br>
-<br>
-- apex_get_status() should actually check status.<br>
-<br>
-- &quot;drivers&quot; should never be dealing with &quot;raw&quot; sysfs c=
alls or mess around with<br>
-=C2=A0 kobjects at all. The driver core should handle all of this for you<=
br>
-=C2=A0 automaically. There should not be a need for raw attribute macros.<=
br>
diff --git a/drivers/staging/gasket/apex.h b/drivers/staging/gasket/apex.h<=
br>
deleted file mode 100644<br>
index 3bbceffff5e4..000000000000<br>
--- a/drivers/staging/gasket/apex.h<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-/* SPDX-License-Identifier: GPL-2.0 */<br>
-/*<br>
- * Apex kernel-userspace interface definitions.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-#ifndef __APEX_H__<br>
-#define __APEX_H__<br>
-<br>
-#include &lt;linux/ioctl.h&gt;<br>
-<br>
-/* Clock Gating ioctl. */<br>
-struct apex_gate_clock_ioctl {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enter or leave clock gated state. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 enable;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If set, enter clock gating state, regardless=
 of custom block&#39;s<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * internal idle state<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 force_idle;<br>
-};<br>
-<br>
-/* Base number for all Apex-common IOCTLs */<br>
-#define APEX_IOCTL_BASE 0x7F<br>
-<br>
-/* Enable/Disable clock gating. */<br>
-#define APEX_IOCTL_GATE_CLOCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(APEX_IOCTL_BASE, 0, struct apex_gate_clock=
_ioctl)<br>
-<br>
-#endif /* __APEX_H__ */<br>
diff --git a/drivers/staging/gasket/apex_driver.c b/drivers/staging/gasket/=
apex_driver.c<br>
deleted file mode 100644<br>
index f12f81c8dd2f..000000000000<br>
--- a/drivers/staging/gasket/apex_driver.c<br>
+++ /dev/null<br>
@@ -1,726 +0,0 @@<br>
-// SPDX-License-Identifier: GPL-2.0<br>
-/*<br>
- * Driver for the Apex chip.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-<br>
-#include &lt;linux/compiler.h&gt;<br>
-#include &lt;linux/delay.h&gt;<br>
-#include &lt;linux/device.h&gt;<br>
-#include &lt;linux/fs.h&gt;<br>
-#include &lt;linux/init.h&gt;<br>
-#include &lt;linux/mm.h&gt;<br>
-#include &lt;linux/module.h&gt;<br>
-#include &lt;linux/moduleparam.h&gt;<br>
-#include &lt;linux/pci.h&gt;<br>
-#include &lt;linux/printk.h&gt;<br>
-#include &lt;linux/sched.h&gt;<br>
-#include &lt;linux/uaccess.h&gt;<br>
-<br>
-#include &quot;apex.h&quot;<br>
-<br>
-#include &quot;gasket_core.h&quot;<br>
-#include &quot;gasket_interrupt.h&quot;<br>
-#include &quot;gasket_page_table.h&quot;<br>
-#include &quot;gasket_sysfs.h&quot;<br>
-<br>
-/* Constants */<br>
-#define APEX_DEVICE_NAME &quot;Apex&quot;<br>
-#define APEX_DRIVER_VERSION &quot;1.0&quot;<br>
-<br>
-/* CSRs are in BAR 2. */<br>
-#define APEX_BAR_INDEX 2<br>
-<br>
-#define APEX_PCI_VENDOR_ID 0x1ac1<br>
-#define APEX_PCI_DEVICE_ID 0x089a<br>
-<br>
-/* Bar Offsets. */<br>
-#define APEX_BAR_OFFSET 0<br>
-#define APEX_CM_OFFSET 0x1000000<br>
-<br>
-/* The sizes of each Apex BAR 2. */<br>
-#define APEX_BAR_BYTES 0x100000<br>
-#define APEX_CH_MEM_BYTES (PAGE_SIZE * MAX_NUM_COHERENT_PAGES)<br>
-<br>
-/* The number of user-mappable memory ranges in BAR2 of a Apex chip. */<br=
>
-#define NUM_REGIONS 3<br>
-<br>
-/* The number of nodes in a Apex chip. */<br>
-#define NUM_NODES 1<br>
-<br>
-/*<br>
- * The total number of entries in the page table. Should match the value r=
ead<br>
- * from the register APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE_SIZE.<br>
- */<br>
-#define APEX_PAGE_TABLE_TOTAL_ENTRIES 8192<br>
-<br>
-#define APEX_EXTENDED_SHIFT 63 /* Extended address bit position. */<br>
-<br>
-/* Check reset 120 times */<br>
-#define APEX_RESET_RETRY 120<br>
-/* Wait 100 ms between checks. Total 12 sec wait maximum. */<br>
-#define APEX_RESET_DELAY 100<br>
-<br>
-/* Enumeration of the supported sysfs entries. */<br>
-enum sysfs_attribute_type {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_KERNEL_HIB_PAGE_TABLE_SIZE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_KERNEL_HIB_SIMPLE_PAGE_TABLE_SIZE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_KERNEL_HIB_NUM_ACTIVE_PAGES,<br>
-};<br>
-<br>
-/*<br>
- * Register offsets into BAR2 memory.<br>
- * Only values necessary for driver implementation are defined.<br>
- */<br>
-enum apex_bar2_regs {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_SCU_BASE =3D 0x1A300,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE_SIZE =3D 0x=
46000,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_EXTENDED_TABLE =3D 0x4=
6008,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_TRANSLATION_ENABLE =3D=
 0x46010,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_INSTR_QUEUE_INTVECCTL =
=3D 0x46018,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_INPUT_ACTV_QUEUE_INTVE=
CCTL =3D 0x46020,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_PARAM_QUEUE_INTVECCTL =
=3D 0x46028,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_OUTPUT_ACTV_QUEUE_INTV=
ECCTL =3D 0x46030,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_SC_HOST_INTVECCTL =3D =
0x46038,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_TOP_LEVEL_INTVECCTL =
=3D 0x46040,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_FATAL_ERR_INTVECCTL =
=3D 0x46048,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_DMA_PAUSE =3D 0x46050,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_DMA_PAUSE_MASK =3D 0x4=
6058,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_STATUS_BLOCK_DELAY =3D=
 0x46060,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_MSIX_PENDING_BIT_ARRAY=
0 =3D 0x46068,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_MSIX_PENDING_BIT_ARRAY=
1 =3D 0x46070,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE_INIT =3D 0x=
46078,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE_INIT =3D 0x=
46080,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_WIRE_INT_PENDING_BIT_ARRAY=
 =3D 0x48778,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_WIRE_INT_MASK_ARRAY =3D 0x=
48780,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_USER_HIB_DMA_PAUSE =3D 0x486D8,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_USER_HIB_DMA_PAUSED =3D 0x486E0,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_IDLEGENERATOR_IDLEGEN_IDLEREGISTE=
R =3D 0x4A000,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE =3D 0x50000=
,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Error registers - Used mostly for debug */<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_USER_HIB_ERROR_STATUS =3D 0x86f0,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_SCALAR_CORE_ERROR_STATUS =3D 0x41=
a0,<br>
-};<br>
-<br>
-/* Addresses for packed registers. */<br>
-#define APEX_BAR2_REG_AXI_QUIESCE (APEX_BAR2_REG_SCU_BASE + 0x2C)<br>
-#define APEX_BAR2_REG_GCB_CLOCK_GATE (APEX_BAR2_REG_SCU_BASE + 0x14)<br>
-#define APEX_BAR2_REG_SCU_0 (APEX_BAR2_REG_SCU_BASE + 0xc)<br>
-#define APEX_BAR2_REG_SCU_1 (APEX_BAR2_REG_SCU_BASE + 0x10)<br>
-#define APEX_BAR2_REG_SCU_2 (APEX_BAR2_REG_SCU_BASE + 0x14)<br>
-#define APEX_BAR2_REG_SCU_3 (APEX_BAR2_REG_SCU_BASE + 0x18)<br>
-#define APEX_BAR2_REG_SCU_4 (APEX_BAR2_REG_SCU_BASE + 0x1c)<br>
-#define APEX_BAR2_REG_SCU_5 (APEX_BAR2_REG_SCU_BASE + 0x20)<br>
-<br>
-#define SCU3_RG_PWR_STATE_OVR_BIT_OFFSET 26<br>
-#define SCU3_RG_PWR_STATE_OVR_MASK_WIDTH 2<br>
-#define SCU3_CUR_RST_GCB_BIT_MASK 0x10<br>
-#define SCU2_RG_RST_GCB_BIT_MASK 0xc<br>
-<br>
-/* Configuration for page table. */<br>
-static struct gasket_page_table_config apex_page_table_configs[NUM_NODES] =
=3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.id =3D 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D GASKET_PA=
GE_TABLE_MODE_NORMAL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.total_entries =3D =
APEX_PAGE_TABLE_TOTAL_ENTRIES,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.base_reg =3D APEX_=
BAR2_REG_KERNEL_HIB_PAGE_TABLE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.extended_reg =3D A=
PEX_BAR2_REG_KERNEL_HIB_EXTENDED_TABLE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.extended_bit =3D A=
PEX_EXTENDED_SHIFT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-};<br>
-<br>
-/* The regions in the BAR2 space that can be mapped into user space. */<br=
>
-static const struct gasket_mappable_region mappable_regions[NUM_REGIONS] =
=3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x40000, 0x1000 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x44000, 0x1000 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x48000, 0x1000 },<br>
-};<br>
-<br>
-/* Gasket device interrupts enums must be dense (i.e., no empty slots). */=
<br>
-enum apex_interrupt {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_INSTR_QUEUE =3D 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_INPUT_ACTV_QUEUE =3D 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_PARAM_QUEUE =3D 2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_OUTPUT_ACTV_QUEUE =3D 3,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_SC_HOST_0 =3D 4,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_SC_HOST_1 =3D 5,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_SC_HOST_2 =3D 6,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_SC_HOST_3 =3D 7,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_TOP_LEVEL_0 =3D 8,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_TOP_LEVEL_1 =3D 9,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_TOP_LEVEL_2 =3D 10,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_TOP_LEVEL_3 =3D 11,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_FATAL_ERR =3D 12,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_COUNT =3D 13,<br>
-};<br>
-<br>
-/* Interrupt descriptors for Apex */<br>
-static struct gasket_interrupt_desc apex_interrupts[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_INST=
R_QUEUE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_INSTR_QUEUE_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNPACKED,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_INPU=
T_ACTV_QUEUE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_INPUT_ACTV_QUEUE_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNPACKED<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_PARA=
M_QUEUE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_PARAM_QUEUE_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNPACKED<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_OUTP=
UT_ACTV_QUEUE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_OUTPUT_ACTV_QUEUE_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNPACKED<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_SC_H=
OST_0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_SC_HOST_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_SC_H=
OST_1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_SC_HOST_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_SC_H=
OST_2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_SC_HOST_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_SC_H=
OST_3,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_SC_HOST_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_3<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_TOP_=
LEVEL_0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_TOP_LEVEL_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_TOP_=
LEVEL_1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_TOP_LEVEL_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_TOP_=
LEVEL_2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_TOP_LEVEL_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_TOP_=
LEVEL_3,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_TOP_LEVEL_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_3<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_INTERRUPT_FATA=
L_ERR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_KERNE=
L_HIB_FATAL_ERR_INTVECCTL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNPACKED<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-};<br>
-<br>
-/* Allows device to enter power save upon driver close(). */<br>
-static int allow_power_save =3D 1;<br>
-<br>
-/* Allows SW based clock gating. */<br>
-static int allow_sw_clock_gating;<br>
-<br>
-/* Allows HW based clock gating. */<br>
-/* Note: this is not mutual exclusive with SW clock gating. */<br>
-static int allow_hw_clock_gating =3D 1;<br>
-<br>
-/* Act as if only GCB is instantiated. */<br>
-static int bypass_top_level;<br>
-<br>
-module_param(allow_power_save, int, 0644);<br>
-module_param(allow_sw_clock_gating, int, 0644);<br>
-module_param(allow_hw_clock_gating, int, 0644);<br>
-module_param(bypass_top_level, int, 0644);<br>
-<br>
-/* Check the device status registers and return device status ALIVE or DEA=
D. */<br>
-static int apex_get_status(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: Check device status. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return GASKET_STATUS_ALIVE;<br>
-}<br>
-<br>
-/* Enter GCB reset state. */<br>
-static int apex_enter_reset(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bypass_top_level)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Software reset:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Enable sleep mode<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 - Software force GCB idle<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 - Enable GCB idle<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_write_64(gasket_dev, APEX_BA=
R_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_IDLEGENER=
ATOR_IDLEGEN_IDLEREGISTER,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0, 1, 32);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 - Initiate DMA pause */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev_write_64(gasket_dev, 1, APEX_BAR_IND=
EX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_USER_HIB_DMA_PAUSE);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 - Wait for DMA pause complete. =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_wait_with_reschedule(gasket_dev, APE=
X_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2=
_REG_USER_HIB_DMA_PAUSED, 1, 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_RESE=
T_DELAY, APEX_RESET_RETRY)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;DMAs did not quiesce within timeout (%d ms)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0APEX_RESET_RETRY * APEX_RESET_DELAY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 - Enable GCB reset (0x1 to rg_rst_gcb)=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_write_32(gasket_dev, APEX_BA=
R_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_SCU_2, 0x=
1, 2, 2);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 - Enable GCB clock Gate (0x1 to rg_gat=
ed_gcb) */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_write_32(gasket_dev, APEX_BA=
R_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_SCU_2, 0x=
1, 2, 18);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 - Enable GCB memory shut down (0x3 to =
rg_force_ram_sd) */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_write_32(gasket_dev, APEX_BA=
R_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_SCU_3, 0x=
3, 2, 14);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 - Wait for RAM shutdown. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_wait_with_reschedule(gasket_dev, APE=
X_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2=
_REG_SCU_3, BIT(6), BIT(6),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_RESE=
T_DELAY, APEX_RESET_RETRY)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;RAM did not shut down within timeout (%d ms)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0APEX_RESET_RETRY * APEX_RESET_DELAY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Quit GCB reset state. */<br>
-static int apex_quit_reset(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val0, val1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bypass_top_level)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Disable sleep mode:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 - Disable GCB memory shut down:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 - b00: Not forced (HW controlle=
d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 - b1x: Force disable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_write_32(gasket_dev, APEX_BA=
R_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_SCU_3, 0x=
0, 2, 14);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 - Disable software clock gate:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 - b00: Not forced (HW controlle=
d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 - b1x: Force disable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_write_32(gasket_dev, APEX_BA=
R_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_SCU_2, 0x=
0, 2, 18);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 - Disable GCB reset (rg_rst_gcb):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 - b00: Not forced (HW controlle=
d)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 - b1x: Force disable =3D Force =
not Reset<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_write_32(gasket_dev, APEX_BA=
R_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2_REG_SCU_2, 0x=
2, 2, 2);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 - Wait for RAM enable. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_wait_with_reschedule(gasket_dev, APE=
X_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2=
_REG_SCU_3, BIT(6), 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_RESE=
T_DELAY, APEX_RESET_RETRY)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;RAM did not enable within timeout (%d ms)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0APEX_RESET_RETRY * APEX_RESET_DELAY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 - Wait for Reset complete. */<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_wait_with_reschedule(gasket_dev, APE=
X_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_BAR2=
_REG_SCU_3,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCU3_CUR_=
RST_GCB_BIT_MASK, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_RESE=
T_DELAY, APEX_RESET_RETRY)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;GCB did not leave reset within timeout (%d ms)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0APEX_RESET_RETRY * APEX_RESET_DELAY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!allow_hw_clock_gating) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val0 =3D gasket_dev=
_read_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AP=
EX_BAR2_REG_SCU_3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Inactive and Sle=
ep mode are disabled. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_=
write_32(gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0APEX_BAR2_REG_SCU_3, 0x3,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SCU3_RG_PWR_STATE_OVR_MASK_WIDTH,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SCU3_RG_PWR_STATE_OVR_BIT_OFFSET);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val1 =3D gasket_dev=
_read_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AP=
EX_BAR2_REG_SCU_3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Disallow HW clock gating 0x%x -&gt; 0x%x\n&quot;, val0, val=
1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val0 =3D gasket_dev=
_read_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AP=
EX_BAR2_REG_SCU_3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Inactive mode en=
abled - Sleep mode disabled. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_=
write_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0APEX_BAR2_REG_SCU_3, 2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SCU3_RG_PWR_STATE_OVR_MASK_WIDTH,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SCU3_RG_PWR_STATE_OVR_BIT_OFFSET);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val1 =3D gasket_dev=
_read_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AP=
EX_BAR2_REG_SCU_3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Allow HW clock gating 0x%x -&gt; 0x%x\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0val0, val1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Reset the Apex hardware. Called on final close via device_close_cb. */<=
br>
-static int apex_device_cleanup(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 scalar_error;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 hib_error;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hib_error =3D gasket_dev_read_64(gasket_dev, AP=
EX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APEX_BAR2_REG_U=
SER_HIB_ERROR_STATUS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0scalar_error =3D gasket_dev_read_64(gasket_dev,=
 APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AP=
EX_BAR2_REG_SCALAR_CORE_ERROR_STATUS);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s 0x%p hib_e=
rror 0x%llx scalar_error 0x%llx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, gasket_de=
v, hib_error, scalar_error);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (allow_power_save)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D apex_enter_=
reset(gasket_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/* Determine if GCB is in reset state. */<br>
-static bool is_gcb_in_reset(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D gasket_dev_read_32(gasket_dev, APEX=
_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APEX_BAR2_REG_SCU_3);<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Masks rg_rst_gcb bit of SCU_CTRL_2 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (val &amp; SCU3_CUR_RST_GCB_BIT_MASK);<b=
r>
-}<br>
-<br>
-/* Reset the hardware, then quit reset.=C2=A0 Called on device open. */<br=
>
-static int apex_reset(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bypass_top_level)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!is_gcb_in_reset(gasket_dev)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We are not in re=
set - toggle the reset bit so as to force<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * re-init of custo=
m block<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;%s: toggle reset\n&quot;, __func__);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D apex_enter_=
reset(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return apex_quit_reset(gasket_dev);<br>
-}<br>
-<br>
-/*<br>
- * Check permissions for Apex ioctls.<br>
- * Returns true if the current user may execute this ioctl, and false othe=
rwise.<br>
- */<br>
-static bool apex_ioctl_check_permissions(struct file *filp, uint cmd)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return !!(filp-&gt;f_mode &amp; FMODE_WRITE);<b=
r>
-}<br>
-<br>
-/* Gates or un-gates Apex clock. */<br>
-static long apex_clock_gating(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct apex_gate_clock_ioctl __user *argp)<b=
r>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct apex_gate_clock_ioctl ibuf;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bypass_top_level || !allow_sw_clock_gating)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;ibuf, argp, sizeof(ibuf=
)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;%s %llu\n&quo=
t;, __func__, ibuf.enable);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.enable) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Quiesce AXI, gat=
e GCB clock. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_=
write_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0APEX_BAR2_REG_AXI_QUIESCE, 0x1, 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A016);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_=
write_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0APEX_BAR2_REG_GCB_CLOCK_GATE, 0x1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, 18);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Un-gate GCB cloc=
k, un-quiesce AXI. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_=
write_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0APEX_BAR2_REG_GCB_CLOCK_GATE, 0x0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, 18);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_read_modify_=
write_32(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0APEX_BAR2_REG_AXI_QUIESCE, 0x0, 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A016);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Apex-specific ioctl handler. */<br>
-static long apex_ioctl(struct file *filp, uint cmd, void __user *argp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev =3D filp-&gt;priv=
ate_data;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!apex_ioctl_check_permissions(filp, cmd))<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPERM;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cmd) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case APEX_IOCTL_GATE_CLOCK:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return apex_clock_g=
ating(gasket_dev, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTTY; /* =
unknown command */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-<br>
-/* Display driver sysfs entries. */<br>
-static ssize_t sysfs_show(struct device *device, struct device_attribute *=
attr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char *buf)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_attribute *gasket_attr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum sysfs_attribute_type type;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *gpt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint val;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D gasket_sysfs_get_device_data(dev=
ice);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &qu=
ot;No Apex device sysfs mapping found\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_attr =3D gasket_sysfs_get_attr(device, a=
ttr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_attr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &qu=
ot;No Apex device sysfs attr data found\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_de=
vice_data(device, gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D (enum sysfs_attribute_type)gasket_attr=
-&gt;data.attr_type;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gpt =3D gasket_dev-&gt;page_table[0];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (type) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_KERNEL_HIB_PAGE_TABLE_SIZE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D gasket_page=
_table_num_entries(gpt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_KERNEL_HIB_SIMPLE_PAGE_TABLE_SIZE:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D gasket_page=
_table_num_simple_entries(gpt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_KERNEL_HIB_NUM_ACTIVE_PAGES:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D gasket_page=
_table_num_active_pages(gpt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Unknown attribute: %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0attr-&gt;<a href=3D"http://attr.name" rel=3D"noreferrer" target=
=3D"_blank">attr.name</a>);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D scnprintf(buf, PAGE_SIZE, &quot;%u\n&qu=
ot;, val);<br>
-exit:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_attr(device, gasket_attr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_device_data(device, gasket_dev=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-static struct gasket_sysfs_attribute apex_sysfs_attrs[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(node_0_page_table_entries, sysf=
s_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_KERNEL_HIB_PAGE_TABLE_SIZE),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(node_0_simple_page_table_entrie=
s, sysfs_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_KERNEL_HIB_SIMPLE_PAGE_TABLE_SIZE),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(node_0_num_mapped_pages, sysfs_=
show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_KERNEL_HIB_NUM_ACTIVE_PAGES),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_END_OF_ATTR_ARRAY<br>
-};<br>
-<br>
-/* On device open, perform a core reinit reset. */<br>
-static int apex_device_open_cb(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_reset_nolock(gasket_dev);<br>
-}<br>
-<br>
-static const struct pci_device_id apex_pci_ids[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ PCI_DEVICE(APEX_PCI_VENDOR_ID, APEX_PCI_DEVIC=
E_ID) }, { 0 }<br>
-};<br>
-<br>
-static int apex_pci_probe(struct pci_dev *pci_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const struct pci_device_id *id)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong page_table_ready, msix_table_ready;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int retries =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pci_enable_device(pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pci_de=
v-&gt;dev, &quot;error enabling PCI device\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_set_master(pci_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_pci_add_device(pci_dev, &amp;gas=
ket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pci_de=
v-&gt;dev, &quot;error adding gasket device\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_disable_device(=
pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_set_drvdata(pci_dev, gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0apex_reset(gasket_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (retries &lt; APEX_RESET_RETRY) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_table_ready =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_dev_read_64(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A=
PEX_BAR2_REG_KERNEL_HIB_PAGE_TABLE_INIT);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msix_table_ready =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_dev_read_64(gasket_dev, APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A=
PEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE_INIT);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (page_table_read=
y &amp;&amp; msix_table_ready)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0schedule_timeout(ms=
ecs_to_jiffies(APEX_RESET_DELAY));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retries++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (retries =3D=3D APEX_RESET_RETRY) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!page_table_rea=
dy)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(gasket_dev-&gt;dev, &quot;Page table init timed out\n&quo=
t;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!msix_table_rea=
dy)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(gasket_dev-&gt;dev, &quot;MSI-X table init timed out\n&qu=
ot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ETIMEDOUT;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto remove_device;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_sysfs_create_entries(gasket_dev-=
&gt;dev_info.device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ap=
ex_sysfs_attrs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pci_de=
v-&gt;dev, &quot;error creating device sysfs entries\n&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_enable_device(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pci_de=
v-&gt;dev, &quot;error enabling gasket device\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto remove_device;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Place device in low power mode until opened =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (allow_power_save)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0apex_enter_reset(ga=
sket_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-remove_device:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_pci_remove_device(pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_disable_device(pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-static void apex_pci_remove(struct pci_dev *pci_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev =3D pci_get_drvda=
ta(pci_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_disable_device(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_pci_remove_device(pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_disable_device(pci_dev);<br>
-}<br>
-<br>
-static const struct gasket_driver_desc apex_desc =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;apex&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_version =3D APEX_DRIVER_VERSION,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.major =3D 120,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.minor =3D 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.module =3D THIS_MODULE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.pci_id_table =3D apex_pci_ids,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_page_tables =3D NUM_NODES,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.page_table_bar_index =3D APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.page_table_configs =3D apex_page_table_configs=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.page_table_extended_bit =3D APEX_EXTENDED_SHIF=
T,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.bar_descriptions =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_UNUSED_BAR,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_UNUSED_BAR,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ APEX_BAR_BYTES, (=
VM_WRITE | VM_READ), APEX_BAR_OFFSET,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NUM_REGIONS, mappable_regions, PCI_BAR },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_UNUSED_BAR,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_UNUSED_BAR,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_UNUSED_BAR,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.coherent_buffer_description =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_CH_MEM_BYTES,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(VM_WRITE | VM_READ=
),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APEX_CM_OFFSET,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.interrupt_type =3D PCI_MSIX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.interrupt_bar_index =3D APEX_BAR_INDEX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_interrupts =3D APEX_INTERRUPT_COUNT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.interrupts =3D apex_interrupts,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.interrupt_pack_width =3D 7,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.device_open_cb =3D apex_device_open_cb,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.device_close_cb =3D apex_device_cleanup,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.ioctl_handler_cb =3D apex_ioctl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.device_status_cb =3D apex_get_status,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.hardware_revision_cb =3D NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.device_reset_cb =3D apex_reset,<br>
-};<br>
-<br>
-static struct pci_driver apex_pci_driver =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;apex&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D apex_pci_probe,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D apex_pci_remove,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.id_table =3D apex_pci_ids,<br>
-};<br>
-<br>
-static int __init apex_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_register_device(&amp;apex_desc);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pci_register_driver(&amp;apex_pci_drive=
r);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_unregister_d=
evice(&amp;apex_desc);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-static void apex_exit(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_unregister_driver(&amp;apex_pci_driver);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_unregister_device(&amp;apex_desc);<br>
-}<br>
-MODULE_DESCRIPTION(&quot;Google Apex driver&quot;);<br>
-MODULE_VERSION(APEX_DRIVER_VERSION);<br>
-MODULE_LICENSE(&quot;GPL v2&quot;);<br>
-MODULE_AUTHOR(&quot;John Joseph &lt;<a href=3D"mailto:jnjoseph@google.com"=
 target=3D"_blank">jnjoseph@google.com</a>&gt;&quot;);<br>
-MODULE_DEVICE_TABLE(pci, apex_pci_ids);<br>
-module_init(apex_init);<br>
-module_exit(apex_exit);<br>
diff --git a/drivers/staging/gasket/gasket.h b/drivers/staging/gasket/gaske=
t.h<br>
deleted file mode 100644<br>
index a0f065c517a5..000000000000<br>
--- a/drivers/staging/gasket/gasket.h<br>
+++ /dev/null<br>
@@ -1,122 +0,0 @@<br>
-/* SPDX-License-Identifier: GPL-2.0 */<br>
-/*<br>
- * Common Gasket device kernel and user space declarations.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-#ifndef __GASKET_H__<br>
-#define __GASKET_H__<br>
-<br>
-#include &lt;linux/ioctl.h&gt;<br>
-#include &lt;linux/types.h&gt;<br>
-<br>
-/* ioctl structure declarations */<br>
-<br>
-/* Ioctl structures are padded to a multiple of 64 bits */<br>
-/* and padded to put 64 bit values on 64 bit boundaries. */<br>
-/* Unsigned 64 bit integers are used to hold pointers. */<br>
-/* This helps compatibility between 32 and 64 bits. */<br>
-<br>
-/*<br>
- * Common structure for ioctls associating an eventfd with a device interr=
upt,<br>
- * when using the Gasket interrupt module.<br>
- */<br>
-struct gasket_interrupt_eventfd {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 interrupt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 event_fd;<br>
-};<br>
-<br>
-/*<br>
- * Common structure for ioctls mapping and unmapping buffers when using th=
e<br>
- * Gasket page_table module.<br>
- */<br>
-struct gasket_page_table_ioctl {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 page_table_index;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 host_address;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 device_address;<br>
-};<br>
-<br>
-/*<br>
- * Common structure for ioctls mapping and unmapping buffers when using th=
e<br>
- * Gasket page_table module.<br>
- * dma_address: phys addr start of coherent memory, allocated by kernel<br=
>
- */<br>
-struct gasket_coherent_alloc_config_ioctl {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 page_table_index;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 enable;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 dma_address;<br>
-};<br>
-<br>
-/* Base number for all Gasket-common IOCTLs */<br>
-#define GASKET_IOCTL_BASE 0xDC<br>
-<br>
-/* Reset the device. */<br>
-#define GASKET_IOCTL_RESET _IO(GASKET_IOCTL_BASE, 0)<br>
-<br>
-/* Associate the specified [event]fd with the specified interrupt. */<br>
-#define GASKET_IOCTL_SET_EVENTFD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(GASKET_IOCTL_BASE, 1, struct gasket_interr=
upt_eventfd)<br>
-<br>
-/*<br>
- * Clears any eventfd associated with the specified interrupt. The (ulong)=
<br>
- * argument is the interrupt number to clear.<br>
- */<br>
-#define GASKET_IOCTL_CLEAR_EVENTFD _IOW(GASKET_IOCTL_BASE, 2, unsigned lon=
g)<br>
-<br>
-/*<br>
- * [Loopbacks only] Requests that the loopback device send the specified<b=
r>
- * interrupt to the host. The (ulong) argument is the number of the interr=
upt to<br>
- * send.<br>
- */<br>
-#define GASKET_IOCTL_LOOPBACK_INTERRUPT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(GASKET_IOCTL_BASE, 3, unsigned long)<br>
-<br>
-/* Queries the kernel for the number of page tables supported by the devic=
e. */<br>
-#define GASKET_IOCTL_NUMBER_PAGE_TABLES _IOR(GASKET_IOCTL_BASE, 4, u64)<br=
>
-<br>
-/*<br>
- * Queries the kernel for the maximum size of the page table.=C2=A0 Only t=
he size and<br>
- * page_table_index fields are used from the struct gasket_page_table_ioct=
l.<br>
- */<br>
-#define GASKET_IOCTL_PAGE_TABLE_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOWR(GASKET_IOCTL_BASE, 5, struct gasket_page_=
table_ioctl)<br>
-<br>
-/*<br>
- * Queries the kernel for the current simple page table size.=C2=A0 Only t=
he size and<br>
- * page_table_index fields are used from the struct gasket_page_table_ioct=
l.<br>
- */<br>
-#define GASKET_IOCTL_SIMPLE_PAGE_TABLE_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOWR(GASKET_IOCTL_BASE, 6, struct gasket_page_=
table_ioctl)<br>
-<br>
-/*<br>
- * Tells the kernel to change the split between the number of simple and<b=
r>
- * extended entries in the given page table. Only the size and page_table_=
index<br>
- * fields are used from the struct gasket_page_table_ioctl.<br>
- */<br>
-#define GASKET_IOCTL_PARTITION_PAGE_TABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(GASKET_IOCTL_BASE, 7, struct gasket_page_t=
able_ioctl)<br>
-<br>
-/*<br>
- * Tells the kernel to map size bytes at host_address to device_address in=
<br>
- * page_table_index page table.<br>
- */<br>
-#define GASKET_IOCTL_MAP_BUFFER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(GASKET_IOCTL_BASE, 8, struct gasket_page_t=
able_ioctl)<br>
-<br>
-/*<br>
- * Tells the kernel to unmap size bytes at host_address from device_addres=
s in<br>
- * page_table_index page table.<br>
- */<br>
-#define GASKET_IOCTL_UNMAP_BUFFER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(GASKET_IOCTL_BASE, 9, struct gasket_page_t=
able_ioctl)<br>
-<br>
-/* Clear the interrupt counts stored for this device. */<br>
-#define GASKET_IOCTL_CLEAR_INTERRUPT_COUNTS _IO(GASKET_IOCTL_BASE, 10)<br>
-<br>
-/* Enable/Disable and configure the coherent allocator. */<br>
-#define GASKET_IOCTL_CONFIG_COHERENT_ALLOCATOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOWR(GASKET_IOCTL_BASE, 11, struct gasket_cohe=
rent_alloc_config_ioctl)<br>
-<br>
-#endif /* __GASKET_H__ */<br>
diff --git a/drivers/staging/gasket/gasket_constants.h b/drivers/staging/ga=
sket/gasket_constants.h<br>
deleted file mode 100644<br>
index 9ea9c8833f27..000000000000<br>
--- a/drivers/staging/gasket/gasket_constants.h<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-/* SPDX-License-Identifier: GPL-2.0 */<br>
-/* Copyright (C) 2018 Google, Inc. */<br>
-#ifndef __GASKET_CONSTANTS_H__<br>
-#define __GASKET_CONSTANTS_H__<br>
-<br>
-#define GASKET_FRAMEWORK_VERSION &quot;1.1.2&quot;<br>
-<br>
-/*<br>
- * The maximum number of simultaneous device types supported by the framew=
ork.<br>
- */<br>
-#define GASKET_FRAMEWORK_DESC_MAX 2<br>
-<br>
-/* The maximum devices per each type. */<br>
-#define GASKET_DEV_MAX 256<br>
-<br>
-/* The number of supported Gasket page tables per device. */<br>
-#define GASKET_MAX_NUM_PAGE_TABLES 1<br>
-<br>
-/* Maximum length of device names (driver name + minor number suffix + NUL=
L). */<br>
-#define GASKET_NAME_MAX 32<br>
-<br>
-/* Device status enumeration. */<br>
-enum gasket_status {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * A device is DEAD if it has not been initiali=
zed or has had an error.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_STATUS_DEAD =3D 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * A device is LAMED if the hardware is healthy=
 but the kernel was<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * unable to enable some functionality (e.g. in=
terrupts).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_STATUS_LAMED,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* A device is ALIVE if it is ready for operati=
on. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_STATUS_ALIVE,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This status is set when the driver is exitin=
g and waiting for all<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * handles to be closed.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_STATUS_DRIVER_EXIT,<br>
-};<br>
-<br>
-#endif<br>
diff --git a/drivers/staging/gasket/gasket_core.c b/drivers/staging/gasket/=
gasket_core.c<br>
deleted file mode 100644<br>
index 28dab302183b..000000000000<br>
--- a/drivers/staging/gasket/gasket_core.c<br>
+++ /dev/null<br>
@@ -1,1815 +0,0 @@<br>
-// SPDX-License-Identifier: GPL-2.0<br>
-/*<br>
- * Gasket generic driver framework. This file contains the implementation<=
br>
- * for the Gasket generic driver framework - the functionality that is com=
mon<br>
- * across Gasket devices.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-<br>
-#define pr_fmt(fmt) KBUILD_MODNAME &quot;: &quot; fmt<br>
-<br>
-#include &quot;gasket_core.h&quot;<br>
-<br>
-#include &quot;gasket_interrupt.h&quot;<br>
-#include &quot;gasket_ioctl.h&quot;<br>
-#include &quot;gasket_page_table.h&quot;<br>
-#include &quot;gasket_sysfs.h&quot;<br>
-<br>
-#include &lt;linux/capability.h&gt;<br>
-#include &lt;linux/compiler.h&gt;<br>
-#include &lt;linux/delay.h&gt;<br>
-#include &lt;linux/device.h&gt;<br>
-#include &lt;linux/fs.h&gt;<br>
-#include &lt;linux/init.h&gt;<br>
-#include &lt;linux/of.h&gt;<br>
-#include &lt;linux/pid_namespace.h&gt;<br>
-#include &lt;linux/printk.h&gt;<br>
-#include &lt;linux/sched.h&gt;<br>
-<br>
-#ifdef GASKET_KERNEL_TRACE_SUPPORT<br>
-#define CREATE_TRACE_POINTS<br>
-#include &lt;trace/events/gasket_mmap.h&gt;<br>
-#else<br>
-#define trace_gasket_mmap_exit(x)<br>
-#define trace_gasket_mmap_entry(x, ...)<br>
-#endif<br>
-<br>
-/*<br>
- * &quot;Private&quot; members of gasket_driver_desc.<br>
- *<br>
- * Contains internal per-device type tracking data, i.e., data not appropr=
iate<br>
- * as part of the public interface for the generic framework.<br>
- */<br>
-struct gasket_internal_desc {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Device-specific-driver-provided configuratio=
n information. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Protects access to per-driver data (i.e. thi=
s structure). */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex mutex;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Kernel-internal device class. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct class *class;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Instantiated / present devices of this type.=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *devs[GASKET_DEV_MAX];<br>
-};<br>
-<br>
-/* do_map_region() needs be able to return more than just true/false. */<b=
r>
-enum do_map_region_status {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The region was successfully mapped. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DO_MAP_REGION_SUCCESS,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Attempted to map region and failed. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DO_MAP_REGION_FAILURE,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The requested region to map was not part of =
a mappable region. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DO_MAP_REGION_INVALID,<br>
-};<br>
-<br>
-/* Global data definitions. */<br>
-/* Mutex - only for framework-wide data. Other data should be protected by=
<br>
- * finer-grained locks.<br>
- */<br>
-static DEFINE_MUTEX(g_mutex);<br>
-<br>
-/* List of all registered device descriptions &amp; their supporting data.=
 */<br>
-static struct gasket_internal_desc g_descs[GASKET_FRAMEWORK_DESC_MAX];<br>
-<br>
-/* Mapping of statuses to human-readable strings. Must end with {0,NULL}. =
*/<br>
-static const struct gasket_num_name gasket_status_name_table[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ GASKET_STATUS_DEAD, &quot;DEAD&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ GASKET_STATUS_ALIVE, &quot;ALIVE&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ GASKET_STATUS_LAMED, &quot;LAMED&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ GASKET_STATUS_DRIVER_EXIT, &quot;DRIVER_EXITI=
NG&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0, NULL },<br>
-};<br>
-<br>
-/* Enumeration of the automatic Gasket framework sysfs nodes. */<br>
-enum gasket_sysfs_attribute_type {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_BAR_OFFSETS,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_BAR_SIZES,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_DRIVER_VERSION,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_FRAMEWORK_VERSION,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_DEVICE_TYPE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_HARDWARE_REVISION,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_PCI_ADDRESS,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_STATUS,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_IS_DEVICE_OWNED,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_DEVICE_OWNER,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_WRITE_OPEN_COUNT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_RESET_COUNT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_USER_MEM_RANGES<br>
-};<br>
-<br>
-/* Perform a standard Gasket callback. */<br>
-static inline int<br>
-check_and_invoke_callback(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0int (*cb_function)(struct gasket_dev *))<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cb_function) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;gas=
ket_dev-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D cb_function=
(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g=
asket_dev-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/* Perform a standard Gasket callback without grabbing gasket_dev-&gt;mute=
x. */<br>
-static inline int<br>
-gasket_check_and_invoke_callback_nolock(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int (*cb_=
function)(struct gasket_dev *))<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cb_function)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D cb_function=
(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/*<br>
- * Return nonzero if the gasket_cdev_info is owned by the current thread g=
roup<br>
- * ID.<br>
- */<br>
-static int gasket_owned_by_current_tgid(struct gasket_cdev_info *info)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (info-&gt;ownership.is_owned &amp;&amp;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(info-&gt;ownership=
.owner =3D=3D current-&gt;tgid));<br>
-}<br>
-<br>
-/*<br>
- * Find the next free gasket_internal_dev slot.<br>
- *<br>
- * Returns the located slot number on success or a negative number on fail=
ure.<br>
- */<br>
-static int gasket_find_dev_slot(struct gasket_internal_desc *internal_desc=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *kobj_name)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;internal_desc-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Search for a previous instance of this devic=
e. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_DEV_MAX; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (internal_desc-&=
gt;devs[i] &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcm=
p(internal_desc-&gt;devs[i]-&gt;kobj_name, kobj_name) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_err(&quot;Duplicate device %s\n&quot;, kobj_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;internal_desc-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EBUSY;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find a free device slot. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_DEV_MAX; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!internal_desc-=
&gt;devs[i])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D GASKET_DEV_MAX) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Too ma=
ny registered devices; max %d\n&quot;, GASKET_DEV_MAX);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;i=
nternal_desc-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;internal_desc-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return i;<br>
-}<br>
-<br>
-/*<br>
- * Allocate and initialize a Gasket device structure, add the device to th=
e<br>
- * device list.<br>
- *<br>
- * Returns 0 if successful, a negative error code otherwise.<br>
- */<br>
-static int gasket_alloc_dev(struct gasket_internal_desc *internal_desc,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct device *parent, struct gasket_dev **pdev)<br=
>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int dev_idx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc-&gt;d=
river_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_cdev_info *dev_info;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name =3D dev_name(parent);<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;Allocating a Gasket device, pare=
nt %s.\n&quot;, parent_name);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*pdev =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_idx =3D gasket_find_dev_slot(internal_desc,=
 parent_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dev_idx &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev_idx;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D *pdev =3D kzalloc(sizeof(*gasket=
_dev), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;no mem=
ory for device, parent %s\n&quot;, parent_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc-&gt;devs[dev_idx] =3D gasket_dev;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;gasket_dev-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;internal_desc =3D internal_desc;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;dev_idx =3D dev_idx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(gasket_dev-&gt;kobj_name, GASKET_NAME_=
MAX, &quot;%s&quot;, parent_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;dev =3D get_device(parent);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* gasket_bar_data is uninitialized. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;num_page_tables =3D driver_desc-=
&gt;num_page_tables;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* max_page_table_size and *page table are unin=
it&#39;ed */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* interrupt_data is not initialized. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* status is 0, or GASKET_STATUS_DEAD */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info =3D &amp;gasket_dev-&gt;dev_info;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dev_info-&gt;name, GASKET_NAME_MAX, &q=
uot;%s_%u&quot;, driver_desc-&gt;name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;dev=
_idx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info-&gt;devt =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MKDEV(driver_desc-&=
gt;major, driver_desc-&gt;minor +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0gasket_dev-&gt;dev_idx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info-&gt;device =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_create(inter=
nal_desc-&gt;class, parent, dev_info-&gt;devt,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev, dev_info-&gt;name);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* cdev has not yet been added; cdev_added is 0=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info-&gt;gasket_dev_ptr =3D gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ownership is all 0, indicating no owner or o=
pens. */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Free a Gasket device. */<br>
-static void gasket_free_dev(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_internal_desc *internal_desc =3D =
gasket_dev-&gt;internal_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;internal_desc-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc-&gt;devs[gasket_dev-&gt;dev_idx] =
=3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;internal_desc-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0put_device(gasket_dev-&gt;dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(gasket_dev);<br>
-}<br>
-<br>
-/*<br>
- * Maps the specified bar into kernel space.<br>
- *<br>
- * Returns 0 on success, a negative error code otherwise.<br>
- * A zero-sized BAR will not be mapped, but is not an error.<br>
- */<br>
-static int gasket_map_pci_bar(struct gasket_dev *gasket_dev, int bar_num)<=
br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_internal_desc *internal_desc =3D =
gasket_dev-&gt;internal_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc-&gt;d=
river_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong desc_bytes =3D driver_desc-&gt;bar_descri=
ptions[bar_num].size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_bar_data *data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_bytes =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver_desc-&gt;bar_descriptions[bar_num].t=
ype !=3D PCI_BAR) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* not PCI: skip th=
is entry */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D &amp;gasket_dev-&gt;bar_data[bar_num];=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * pci_resource_start and pci_resource_len retu=
rn a &quot;resource_size_t&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * which is safely castable to ulong (which its=
elf is the arg to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * request_mem_region).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;phys_base =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ulong)pci_resource=
_start(gasket_dev-&gt;pci_dev, bar_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data-&gt;phys_base) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev, &quot;Cannot get BAR%u base address\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bar_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;length_bytes =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ulong)pci_resource=
_len(gasket_dev-&gt;pci_dev, bar_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;length_bytes &lt; desc_bytes) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;PCI BAR %u space is too small: %lu; expected &gt;=3D %lu\n&=
quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bar_num, data-&gt;length_bytes, desc_bytes);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!request_mem_region(data-&gt;phys_base, dat=
a-&gt;length_bytes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;<a href=3D"http://dev_=
info.name" rel=3D"noreferrer" target=3D"_blank">dev_info.name</a>)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Cannot get BAR %d memory region %p\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bar_num, &amp;gasket_dev-&gt;pci_dev-&gt;resource[bar_num]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;virt_base =3D ioremap(data-&gt;phys_ba=
se, data-&gt;length_bytes);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data-&gt;virt_base) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Cannot remap BAR %d memory region %p\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bar_num, &amp;gasket_dev-&gt;pci_dev-&gt;resource[bar_num]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_set_mask(&amp;gasket_dev-&gt;pci_dev-&gt;de=
v, DMA_BIT_MASK(64));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_set_coherent_mask(&amp;gasket_dev-&gt;pci_d=
ev-&gt;dev, DMA_BIT_MASK(64));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(data-&gt;virt_base);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0release_mem_region(data-&gt;phys_base, data-&gt=
;length_bytes);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/*<br>
- * Releases PCI BAR mapping.<br>
- *<br>
- * A zero-sized or not-mapped BAR will not be unmapped, but is not an erro=
r.<br>
- */<br>
-static void gasket_unmap_pci_bar(struct gasket_dev *dev, int bar_num)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong base, bytes;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_internal_desc *internal_desc =3D =
dev-&gt;internal_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc-&gt;d=
river_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver_desc-&gt;bar_descriptions[bar_num].s=
ize =3D=3D 0 ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!dev-&gt;bar_data[bar_num].virt_b=
ase)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver_desc-&gt;bar_descriptions[bar_num].t=
ype !=3D PCI_BAR)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(dev-&gt;bar_data[bar_num].virt_base);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;bar_data[bar_num].virt_base =3D NULL;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D pci_resource_start(dev-&gt;pci_dev, ba=
r_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!base) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev-&gt;dev=
, &quot;cannot get PCI BAR%u base address\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bar_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bytes =3D pci_resource_len(dev-&gt;pci_dev, bar=
_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0release_mem_region(base, bytes);<br>
-}<br>
-<br>
-/*<br>
- * Setup PCI memory mapping for the specified device.<br>
- *<br>
- * Reads the BAR registers and sets up pointers to the device&#39;s memory=
 mapped<br>
- * IO space.<br>
- *<br>
- * Returns 0 on success and a negative value otherwise.<br>
- */<br>
-static int gasket_setup_pci(struct pci_dev *pci_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, mapped_bars, ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; PCI_STD_NUM_BARS; i++) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_map_=
pci_bar(gasket_dev, i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mapped_bars =3D i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; mapped_bars; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_unmap_pci_ba=
r(gasket_dev, i);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-}<br>
-<br>
-/* Unmaps memory for the specified device. */<br>
-static void gasket_cleanup_pci(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; PCI_STD_NUM_BARS; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_unmap_pci_ba=
r(gasket_dev, i);<br>
-}<br>
-<br>
-/* Determine the health of the Gasket device. */<br>
-static int gasket_get_hw_status(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rnal_desc-&gt;driver_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D gasket_check_and_invoke_callback_nol=
ock(gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver_desc-&gt;device_sta=
tus_cb);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status !=3D GASKET_STATUS_ALIVE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Hardware reported status %d.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0status);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D gasket_interrupt_system_status(gaske=
t_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status !=3D GASKET_STATUS_ALIVE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Interrupt system reported status %d.\n&quot;, status);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; driver_desc-&gt;num_page_t=
ables; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D gasket_p=
age_table_system_status(gasket_dev-&gt;page_table[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (status !=3D GAS=
KET_STATUS_ALIVE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Page table %d reported status %=
d.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, status);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return GASKET_STATUS_ALIVE;<br>
-}<br>
-<br>
-static ssize_t<br>
-gasket_write_mappable_regions(char *buf,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int bar_index)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t total_written =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong min_addr, max_addr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_bar_desc bar_desc =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc-&gt;bar=
_descriptions[bar_index];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bar_desc.permissions =3D=3D GASKET_NOMAP)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i &lt; bar_desc.num_mappable_reg=
ions &amp;&amp; total_written &lt; PAGE_SIZE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_addr =3D bar_de=
sc.mappable_regions[i].start -<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 driver_desc-&gt;legacy_mmap_address_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_addr =3D bar_de=
sc.mappable_regions[i].start -<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 driver_desc-&gt;legacy_mmap_address_offset +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bar_desc.mappable_regions[i].length_bytes;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0written =3D scnprin=
tf(buf, PAGE_SIZE - total_written,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;0x%08lx-0x%08lx\n=
&quot;, min_addr, max_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total_written +=3D =
written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf +=3D written;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return total_written;<br>
-}<br>
-<br>
-static ssize_t gasket_sysfs_data_show(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_at=
tribute *attr, char *buf)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t current_written =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_attribute *gasket_attr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_bar_desc *bar_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum gasket_sysfs_attribute_type sysfs_type;<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D gasket_sysfs_get_device_data(dev=
ice);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &qu=
ot;No sysfs mapping found for device\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_attr =3D gasket_sysfs_get_attr(device, a=
ttr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_attr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &qu=
ot;No sysfs attr found for device\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_de=
vice_data(device, gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc =3D gasket_dev-&gt;internal_desc-&g=
t;driver_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_type =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(enum gasket_sysfs_=
attribute_type)gasket_attr-&gt;data.attr_type;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (sysfs_type) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_BAR_OFFSETS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; PCI_STD_NUM_BARS; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bar_desc =3D &amp;driver_desc-&gt;bar_descriptions[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (bar_desc-&gt;size =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0current_written =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(buf, PAGE_SIZE - ret, &quot;=
%d: 0x%lx\n&quot;, i,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ulong)b=
ar_desc-&gt;base);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf +=3D current_written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret +=3D current_written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_BAR_SIZES:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; PCI_STD_NUM_BARS; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bar_desc =3D &amp;driver_desc-&gt;bar_descriptions[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (bar_desc-&gt;size =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0current_written =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(buf, PAGE_SIZE - ret, &quot;=
%d: 0x%lx\n&quot;, i,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ulong)b=
ar_desc-&gt;size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf +=3D current_written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret +=3D current_written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_DRIVER_VERSION:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;internal_desc-&gt;driver_des=
c-&gt;driver_version);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_FRAMEWORK_VERSION:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GASKET_FRAMEWORK_VERSION);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_DEVICE_TYPE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;internal_desc-&gt;driver_des=
c-&gt;name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_HARDWARE_REVISION:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;hardware_revision);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_PCI_ADDRESS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%s\n&quot;, gasket_dev-&gt;kobj_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_STATUS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_num_name_lookup(gasket_dev-&gt;statu=
s,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_status_name_table));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_IS_DEVICE_OWNED:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;dev_info.ownership.is_owned)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_DEVICE_OWNER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;dev_info.ownership.owner);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_WRITE_OPEN_COUNT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;dev_info.ownership.write_ope=
n_count);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_RESET_COUNT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snprintf(bu=
f, PAGE_SIZE, &quot;%d\n&quot;, gasket_dev-&gt;reset_count);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_USER_MEM_RANGES:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; PCI_STD_NUM_BARS; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0current_written =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_write_mappable_regions(buf, dr=
iver_desc,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf +=3D current_written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret +=3D current_written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Unknown attribute: %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0attr-&gt;<a href=3D"http://attr.name" rel=3D"noreferrer" target=
=3D"_blank">attr.name</a>);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_attr(device, gasket_attr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_device_data(device, gasket_dev=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/* These attributes apply to all Gasket driver instances. */<br>
-static const struct gasket_sysfs_attribute gasket_sysfs_generic_attrs[] =
=3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(bar_offsets, gasket_sysfs_data_=
show, ATTR_BAR_OFFSETS),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(bar_sizes, gasket_sysfs_data_sh=
ow, ATTR_BAR_SIZES),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(driver_version, gasket_sysfs_da=
ta_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_DRIVER_VERSION),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(framework_version, gasket_sysfs=
_data_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_FRAMEWORK_VERSION),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(device_type, gasket_sysfs_data_=
show, ATTR_DEVICE_TYPE),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(revision, gasket_sysfs_data_sho=
w,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_HARDWARE_REVISION),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(pci_address, gasket_sysfs_data_=
show, ATTR_PCI_ADDRESS),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(status, gasket_sysfs_data_show,=
 ATTR_STATUS),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(is_device_owned, gasket_sysfs_d=
ata_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_IS_DEVICE_OWNED),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(device_owner, gasket_sysfs_data=
_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_DEVICE_OWNER),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(write_open_count, gasket_sysfs_=
data_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_WRITE_OPEN_COUNT),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(reset_count, gasket_sysfs_data_=
show, ATTR_RESET_COUNT),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(user_mem_ranges, gasket_sysfs_d=
ata_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_USER_MEM_RANGES),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_END_OF_ATTR_ARRAY<br>
-};<br>
-<br>
-/* Add a char device and related info. */<br>
-static int gasket_add_cdev(struct gasket_cdev_info *dev_info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct file_operations *file_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct module *owner)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cdev_init(&amp;dev_info-&gt;cdev, file_ops);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info-&gt;cdev.owner =3D owner;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D cdev_add(&amp;dev_info-&gt;cdev, dev_in=
fo-&gt;devt, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev_info-&g=
t;gasket_dev_ptr-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;cannot add char device [ret=3D%d]\n&quot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info-&gt;cdev_added =3D 1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Disable device operations. */<br>
-void gasket_disable_device(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rnal_desc-&gt;driver_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Only delete the device if it has been succes=
sfully added. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_dev-&gt;dev_info.cdev_added)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdev_del(&amp;gaske=
t_dev-&gt;dev_info.cdev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;status =3D GASKET_STATUS_DEAD;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_interrupt_cleanup(gasket_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; driver_desc-&gt;num_page_t=
ables; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_dev-&gt;=
page_table[i]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_page_table_reset(gasket_dev-&gt;page_table[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_page_table_cleanup(gasket_dev-&gt;page_table[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-EXPORT_SYMBOL(gasket_disable_device);<br>
-<br>
-/*<br>
- * Registered driver descriptor lookup for PCI devices.<br>
- *<br>
- * Precondition: Called with g_mutex held (to avoid a race on return).<br>
- * Returns NULL if no matching device was found.<br>
- */<br>
-static struct gasket_internal_desc *<br>
-lookup_pci_internal_desc(struct pci_dev *pci_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__must_hold(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_FRAMEWORK_DESC_MAX;=
 i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (g_descs[i].driv=
er_desc &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_des=
cs[i].driver_desc-&gt;pci_id_table &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_m=
atch_id(g_descs[i].driver_desc-&gt;pci_id_table, pci_dev))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return &amp;g_descs[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-}<br>
-<br>
-/*<br>
- * Verifies that the user has permissions to perform the requested mapping=
 and<br>
- * that the provided descriptor/range is of adequate size to hold the rang=
e to<br>
- * be mapped.<br>
- */<br>
-static bool gasket_mmap_has_permissions(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vm=
_area_struct *vma,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int bar_p=
ermissions)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int requested_permissions;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Always allow sysadmin to access. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (capable(CAP_SYS_ADMIN))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Never allow non-sysadmins to access to a dea=
d device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_dev-&gt;status !=3D GASKET_STATUS_AL=
IVE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Device is dead.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make sure that no wrong flags are set. */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0requested_permissions =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(vma-&gt;vm_flags &=
amp; VM_ACCESS_FLAGS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (requested_permissions &amp; ~(bar_permissio=
ns)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Attempting to map a region with requested permissions 0x%x,=
 but region has permissions 0x%x.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0requested_permissions, bar_permissions);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Do not allow a non-owner to write. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((vma-&gt;vm_flags &amp; VM_WRITE) &amp;&amp=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!gasket_owned_by_current_tgid(&am=
p;gasket_dev-&gt;dev_info)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Attempting to mmap a region for write without owning device=
.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-}<br>
-<br>
-/*<br>
- * Verifies that the input address is within the region allocated to coher=
ent<br>
- * buffer.<br>
- */<br>
-static bool<br>
-gasket_is_coherent_region(const struct gasket_driver_desc *driver_desc,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ulong address)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_coherent_buffer_desc coh_buff_des=
c =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc-&gt;coh=
erent_buffer_description;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (coh_buff_desc.permissions !=3D GASKET_NOMAP=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((address &gt;=
=3D coh_buff_desc.base) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr=
ess &lt; coh_buff_desc.base + coh_buff_desc.size)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-}<br>
-<br>
-static int gasket_get_bar_index(const struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong phys_addr)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc =3D gasket_dev-&gt;internal_desc-&g=
t;driver_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; PCI_STD_NUM_BARS; ++i) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_bar_d=
esc bar_desc =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0driver_desc-&gt;bar_descriptions[i];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bar_desc.permis=
sions !=3D GASKET_NOMAP) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (phys_addr &gt;=3D bar_desc.base &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0phys_addr &lt; (bar_desc.base + bar_desc.size)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we haven&#39;t found the address by now, =
it is invalid. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-}<br>
-<br>
-/*<br>
- * Sets the actual bounds to map, given the device&#39;s mappable region.<=
br>
- *<br>
- * Given the device&#39;s mappable region, along with the user-requested m=
apping<br>
- * start offset and length of the user region, determine how much of this<=
br>
- * mappable region can be mapped into the user&#39;s region (start/end off=
sets),<br>
- * and the physical offset (phys_offset) into the BAR where the mapping sh=
ould<br>
- * begin (either the VMA&#39;s or region lower bound).<br>
- *<br>
- * In other words, this calculates the overlap between the VMA<br>
- * (bar_offset, requested_length) and the given gasket_mappable_region.<br=
>
- *<br>
- * Returns true if there&#39;s anything to map, and false otherwise.<br>
- */<br>
-static bool<br>
-gasket_mm_get_mapping_addrs(const struct gasket_mappable_region *region,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ulong bar_offset, ulong requested_length,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_mappable_region *mappable_region,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ulong *virt_offset)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong range_start =3D region-&gt;start;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong range_length =3D region-&gt;length_bytes;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong range_end =3D range_start + range_length;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*virt_offset =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bar_offset + requested_length &lt; range_st=
art) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the requested=
 region is completely below the range,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * there is nothing=
 to map.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (bar_offset &lt;=3D range_start) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the bar offse=
t is below this range&#39;s start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * but the requeste=
d length continues into it:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1) Only map star=
ting from the beginning of this<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 range&#39;s phys. offset, so we don&#39;t map unmappable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 memory.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 2) The length of=
 the virtual memory to not map is the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 delta between the bar offset and the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 mappable start (and since the mappable start is<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 bigger, start - req.)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 3) The map lengt=
h is the minimum of the mappable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 requested length (requested_length - virt_offset)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 and the actual mappable length of the range.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mappable_region-&gt=
;start =3D range_start;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*virt_offset =3D ra=
nge_start - bar_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mappable_region-&gt=
;length_bytes =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0min(requested_length - *virt_offset, range_length);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (bar_offset &gt; range_start &amp;&am=
p;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bar_offset =
&lt; range_end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the bar offse=
t is within this range:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1) Map starting =
from the bar offset.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 2) Because there=
 is no forbidden memory between the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 bar offset and the range start,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 virt_offset is 0.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 3) The map lengt=
h is the minimum of the requested<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 length and the remaining length in the buffer<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=
=A0 (range_end - bar_offset)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mappable_region-&gt=
;start =3D bar_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*virt_offset =3D 0;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mappable_region-&gt=
;length_bytes =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0min(requested_length, range_end - bar_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the requested [start] offset is above ran=
ge_end,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * there&#39;s nothing to map.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-}<br>
-<br>
-/*<br>
- * Calculates the offset where the VMA range begins in its containing BAR.=
<br>
- * The offset is written into bar_offset on success.<br>
- * Returns zero on success, anything else on error.<br>
- */<br>
-static int gasket_mm_vma_bar_offset(const struct gasket_dev *gasket_dev,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct vm_area_st=
ruct *vma,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong *bar_offset)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong raw_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int bar_index;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rnal_desc-&gt;driver_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0raw_offset =3D (vma-&gt;vm_pgoff &lt;&lt; PAGE_=
SHIFT) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc-&gt;leg=
acy_mmap_address_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bar_index =3D gasket_get_bar_index(gasket_dev, =
raw_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bar_index &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Unable to find matching bar for address 0x%lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0raw_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(bar_index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bar_index;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*bar_offset =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raw_offset - driver=
_desc-&gt;bar_descriptions[bar_index].base;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-int gasket_mm_unmap_region(const struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct vm_area_struct *vma,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct gasket_mappable_region *map_region)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong bar_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong virt_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_mappable_region mappable_region;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (map_region-&gt;length_bytes =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_mm_vma_bar_offset(gasket_dev, vm=
a, &amp;bar_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_mm_get_mapping_addrs(map_region, ba=
r_offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vma-&gt;=
vm_end - vma-&gt;vm_start,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;map=
pable_region, &amp;virt_offset))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The length passed to zap_vma_ptes MUST BE A =
MULTIPLE OF<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * PAGE_SIZE! Trust me. I have the scars.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Next multiple of y: ceil_div(x, y) * y<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0zap_vma_ptes(vma, vma-&gt;vm_start + virt_offse=
t,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIV_=
ROUND_UP(mappable_region.length_bytes, PAGE_SIZE) *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE=
_SIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-EXPORT_SYMBOL(gasket_mm_unmap_region);<br>
-<br>
-/* Maps a virtual address + range to a physical offset of a BAR. */<br>
-static enum do_map_region_status<br>
-do_map_region(const struct gasket_dev *gasket_dev, struct vm_area_struct *=
vma,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_mappable_reg=
ion *mappable_region)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Maximum size of a single call to io_remap_pf=
n_range. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* I pulled this number out of thin air. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const ulong max_chunk_size =3D 64 * 1024 * 1024=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong chunk_size, mapped_bytes =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rnal_desc-&gt;driver_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong bar_offset, virt_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_mappable_region region_to_map;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong phys_offset, map_length;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong virt_base, phys_base;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int bar_index, ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_mm_vma_bar_offset(gasket_dev, vm=
a, &amp;bar_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DO_MAP_REGIO=
N_INVALID;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_mm_get_mapping_addrs(mappable_regio=
n, bar_offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vma-&gt;=
vm_end - vma-&gt;vm_start,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;reg=
ion_to_map, &amp;virt_offset))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DO_MAP_REGIO=
N_INVALID;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0phys_offset =3D region_to_map.start;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0map_length =3D region_to_map.length_bytes;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0virt_base =3D vma-&gt;vm_start + virt_offset;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bar_index =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_get_bar_inde=
x(gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (vma-&gt;vm_pgoff &lt;=
&lt; PAGE_SHIFT) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver_desc-&gt;legacy=
_mmap_address_offset);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bar_index &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DO_MAP_REGIO=
N_INVALID;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0phys_base =3D gasket_dev-&gt;bar_data[bar_index=
].phys_base + phys_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (mapped_bytes &lt; map_length) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * io_remap_pfn_ran=
ge can take a while, so we chunk its<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * calls and call c=
ond_resched between each.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunk_size =3D min(=
max_chunk_size, map_length - mapped_bytes);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cond_resched();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D io_remap_pf=
n_range(vma, virt_base + mapped_bytes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (phys_ba=
se + mapped_bytes) &gt;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_SHI=
FT, chunk_size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vma-&gt;=
vm_page_prot);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Error remapping PFN range.\n&qu=
ot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapped_bytes +=3D c=
hunk_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return DO_MAP_REGION_SUCCESS;<br>
-<br>
-fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unmap the partial chunk we mapped. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mappable_region-&gt;length_bytes =3D mapped_byt=
es;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_mm_unmap_region(gasket_dev, vma, map=
pable_region))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Error unmapping partial region 0x%lx (0x%lx bytes)\n&quot;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ulong)virt_offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ulong)mapped_bytes);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return DO_MAP_REGION_FAILURE;<br>
-}<br>
-<br>
-/* Map a region of coherent memory. */<br>
-static int gasket_mmap_coherent(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vm_area_struct *vma)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rnal_desc-&gt;driver_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const ulong requested_length =3D vma-&gt;vm_end=
 - vma-&gt;vm_start;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong permissions;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (requested_length =3D=3D 0 || requested_leng=
th &gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer.le=
ngth_bytes) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(-EINVAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0permissions =3D driver_desc-&gt;coherent_buffer=
_description.permissions;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_mmap_has_permissions(gasket_dev, vm=
a, permissions)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev, &quot;Permission checking failed.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(-EPERM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPERM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vma-&gt;vm_page_prot =3D pgprot_noncached(vma-&=
gt;vm_page_prot);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D remap_pfn_range(vma, vma-&gt;vm_start,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(gasket_dev-&gt;coherent_buffer.phys_base) &=
gt;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_SHIFT, requested_length, vma-&gt;vm_pag=
e_prot);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev, &quot;Error remapping PFN range err=3D%d.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Record the user virtual to dma_address mappi=
ng that was<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * created by the kernel.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_set_user_virt(gasket_dev, requested_leng=
th,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;coherent_buffer.phys_base,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 vma-&gt;vm_start);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Map a device&#39;s BARs into user space. */<br>
-static int gasket_mmap(struct file *filp, struct vm_area_struct *vma)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int bar_index;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int has_mapped_anything =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong permissions;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong raw_offset, vma_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_coherent_region;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev =3D (struct gaske=
t_dev *)filp-&gt;private_data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_bar_desc *bar_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_mappable_region *map_regions =3D =
NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_map_regions =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum do_map_region_status map_status;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc =3D gasket_dev-&gt;internal_desc-&g=
t;driver_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vma-&gt;vm_start &amp; ~PAGE_MASK) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Base address not page-aligned: 0x%lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vma-&gt;vm_start);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(-EINVAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Calculate the offset of this range into phys=
ical mem. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0raw_offset =3D (vma-&gt;vm_pgoff &lt;&lt; PAGE_=
SHIFT) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc-&gt;leg=
acy_mmap_address_offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vma_size =3D vma-&gt;vm_end - vma-&gt;vm_start;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_entry(gasket_dev-&gt;<a href=
=3D"http://dev_info.name" rel=3D"noreferrer" target=3D"_blank">dev_info.nam=
e</a>, raw_offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vma_size);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Check if the raw offset is within a bar regi=
on. If not, check if it<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is a coherent region.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bar_index =3D gasket_get_bar_index(gasket_dev, =
raw_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0is_coherent_region =3D gasket_is_coherent_regio=
n(driver_desc, raw_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bar_index &lt; 0 &amp;&amp; !is_coherent_re=
gion) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Unable to find matching bar for address 0x%lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0raw_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(bar_index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bar_index;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bar_index &gt; 0 &amp;&amp; is_coherent_reg=
ion) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;double matching bar and coherent buffers for address 0x%lx\=
n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0raw_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(bar_index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vma-&gt;vm_private_data =3D gasket_dev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_coherent_region)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_mmap_=
coherent(gasket_dev, vma);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Everything in the rest of this function is f=
or normal BAR mapping. */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Subtract the base of the bar from the raw of=
fset to get the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * memory location within the bar to map.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bar_desc =3D &amp;driver_desc-&gt;bar_descripti=
ons[bar_index];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0permissions =3D bar_desc-&gt;permissions;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_mmap_has_permissions(gasket_dev, vm=
a, permissions)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev, &quot;Permission checking failed.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(-EPERM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPERM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver_desc-&gt;get_mappable_regions_cb) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D driver_desc=
-&gt;get_mappable_regions_cb(gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bar_index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;map_regions,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;num_map_region=
s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_mmap_ha=
s_permissions(gasket_dev, vma,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 bar_desc-&gt;permissions)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Permission checking failed.\n&q=
uot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0trace_gasket_mmap_exit(-EPERM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EPERM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_map_regions =3D=
 bar_desc-&gt;num_mappable_regions;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map_regions =3D kca=
lloc(num_map_regions,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*bar_desc=
-&gt;mappable_regions),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (map_regions) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0memcpy(map_regions, bar_desc-&gt;mappable_regions,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_map_regions *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*b=
ar_desc-&gt;mappable_regions));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!map_regions || num_map_regions =3D=3D 0) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev, &quot;No mappable regions returned!\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Marks the VMA&#39;s pages as uncacheable. */=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vma-&gt;vm_page_prot =3D pgprot_noncached(vma-&=
gt;vm_page_prot);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_map_regions; i++) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map_status =3D do_m=
ap_region(gasket_dev, vma, &amp;map_regions[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try the next reg=
ion if this one was not mappable. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (map_status =3D=
=3D DO_MAP_REGION_INVALID)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (map_status =3D=
=3D DO_MAP_REGION_FAILURE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_mapped_anything=
 =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(map_regions);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we could not map any memory, the request =
was invalid. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!has_mapped_anything) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Map request did not contain a valid region.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_e=
xit(-EINVAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_mmap_exit(0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Need to unmap any mapped ranges. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0num_map_regions =3D i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_map_regions; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_mm_unmap=
_region(gasket_dev, vma,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;bar_desc-&gt;mappable_regions[i]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(gasket_dev-&gt;dev, &quot;Error unmapping range %d.\n&quo=
t;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(map_regions);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/*<br>
- * Open the char device file.<br>
- *<br>
- * If the open is for writing, and the device is not owned, this process b=
ecomes<br>
- * the owner.=C2=A0 If the open is for writing and the device is already o=
wned by<br>
- * some other process, it is an error.=C2=A0 If this process is the owner,=
 increment<br>
- * the open count.<br>
- *<br>
- * Returns 0 if successful, a negative error number otherwise.<br>
- */<br>
-static int gasket_open(struct inode *inode, struct file *filp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_ownership *ownership;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char task_name[TASK_COMM_LEN];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_cdev_info *dev_info =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(inode-&gt;i_cdev, st=
ruct gasket_cdev_info, cdev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pid_namespace *pid_ns =3D task_active_pi=
d_ns(current);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_root =3D ns_capable(pid_ns-&gt;user_ns,=
 CAP_SYS_ADMIN);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D dev_info-&gt;gasket_dev_ptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc =3D gasket_dev-&gt;internal_desc-&g=
t;driver_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ownership =3D &amp;dev_info-&gt;ownership;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0get_task_comm(task_name, current);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0filp-&gt;private_data =3D gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0inode-&gt;i_size =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Attempting to=
 open with tgid %u (%s) (f_mode: 0%03o, fmode_write: %d is_root: %u)\n&quot=
;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current-&gt;tgid, t=
ask_name, filp-&gt;f_mode,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(filp-&gt;f_mode &a=
mp; FMODE_WRITE), is_root);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Always allow non-writing accesses. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(filp-&gt;f_mode &amp; FMODE_WRITE)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Allowing read-only opening.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;gasket_dev-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Current owner=
 open count (owning tgid %u): %d.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ownership-&gt;owner=
, ownership-&gt;write_open_count);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Opening a node owned by another TGID is an e=
rror (unless root) */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ownership-&gt;is_owned &amp;&amp; ownership=
-&gt;owner !=3D current-&gt;tgid &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!is_root) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Process %u is opening a node held by %u.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0current-&gt;tgid, ownership-&gt;owner);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g=
asket_dev-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPERM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the node is not owned, assign it to the c=
urrent TGID. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ownership-&gt;is_owned) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_chec=
k_and_invoke_callback_nolock(gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver=
_desc-&gt;device_open_cb);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Error in device open cb: %d\n&q=
uot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;gasket_dev-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ownership-&gt;is_ow=
ned =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ownership-&gt;owner=
 =3D current-&gt;tgid;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Device owner is now tgid %u\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ownership-&gt;owner);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ownership-&gt;write_open_count++;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;New open coun=
t (owning tgid %u): %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ownership-&gt;owner=
, ownership-&gt;write_open_count);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;gasket_dev-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * Called on a close of the device file.=C2=A0 If this process is the owne=
r,<br>
- * decrement the open count.=C2=A0 On last close by the owner, free up buf=
fers and<br>
- * eventfd contexts, and release ownership.<br>
- *<br>
- * Returns 0 if successful, a negative error number otherwise.<br>
- */<br>
-static int gasket_release(struct inode *inode, struct file *file)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_ownership *ownership;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char task_name[TASK_COMM_LEN];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_cdev_info *dev_info =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(inode-=
&gt;i_cdev, struct gasket_cdev_info, cdev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pid_namespace *pid_ns =3D task_active_pi=
d_ns(current);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_root =3D ns_capable(pid_ns-&gt;user_ns,=
 CAP_SYS_ADMIN);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D dev_info-&gt;gasket_dev_ptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc =3D gasket_dev-&gt;internal_desc-&g=
t;driver_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ownership =3D &amp;dev_info-&gt;ownership;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0get_task_comm(task_name, current);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;gasket_dev-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Releasing dev=
ice node. Call origin: tgid %u (%s) (f_mode: 0%03o, fmode_write: %d, is_roo=
t: %u)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current-&gt;tgid, t=
ask_name, file-&gt;f_mode,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(file-&gt;f_mode &a=
mp; FMODE_WRITE), is_root);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;Current open =
count (owning tgid %u): %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ownership-&gt;owner=
, ownership-&gt;write_open_count);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (file-&gt;f_mode &amp; FMODE_WRITE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ownership-&gt;write=
_open_count--;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ownership-&gt;w=
rite_open_count =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;Device is now free\n&quot;);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ownership-&gt;is_owned =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ownership-&gt;owner =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Forces chip reset before we unmap the page tables. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0driver_desc-&gt;device_reset_cb(gasket_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for (i =3D 0; i &lt; driver_desc-&gt;num_page_tables; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_unmap_all(gasket_de=
v-&gt;page_table[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_garbage_collect(gas=
ket_dev-&gt;page_table[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_free_coherent_memory_all(gaske=
t_dev, i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Closes device, enters power save. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_check_and_invoke_callback_nolock(gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0driver_desc-&gt;device_close_cb);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;New open coun=
t (owning tgid %u): %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ownership-&gt;owner=
, ownership-&gt;write_open_count);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;gasket_dev-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * Gasket ioctl dispatch function.<br>
- *<br>
- * Check if the ioctl is a generic ioctl. If not, pass the ioctl to the<br=
>
- * ioctl_handler_cb registered in the driver description.<br>
- * If the ioctl is a generic ioctl, pass it to gasket_ioctl_handler.<br>
- */<br>
-static long gasket_ioctl(struct file *filp, uint cmd, ulong arg)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void __user *argp =3D (void __user *)arg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char path[256];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D (struct gasket_dev *)filp-&gt;pr=
ivate_data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc =3D gasket_dev-&gt;internal_desc-&g=
t;driver_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!driver_desc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Unable to find device descriptor for file %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0d_path(&amp;filp-&gt;f_path, path, 256));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_is_supported_ioctl(cmd)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The ioctl handle=
r is not a standard Gasket callback, since<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * it requires diff=
erent arguments. This means we can&#39;t use<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * check_and_invoke=
_callback.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver_desc-&gt=
;ioctl_handler_cb)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return driver_desc-&gt;ioctl_handler_cb(filp, cmd, argp);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Received unknown ioctl 0x%x\n&quot;, cmd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_handle_ioctl(filp, cmd, argp);<br=
>
-}<br>
-<br>
-/* File operations for all Gasket devices. */<br>
-static const struct file_operations gasket_file_ops =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MODULE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.llseek =3D no_llseek,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.mmap =3D gasket_mmap,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D gasket_open,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.release =3D gasket_release,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.unlocked_ioctl =3D gasket_ioctl,<br>
-};<br>
-<br>
-/* Perform final init and marks the device as active. */<br>
-int gasket_enable_device(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int tbl_idx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rnal_desc-&gt;driver_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_interrupt_init(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Critical failure to allocate interrupts: %d\n&quot;, ret);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_interrupt_cl=
eanup(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (tbl_idx =3D 0; tbl_idx &lt; driver_desc-&g=
t;num_page_tables; tbl_idx++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Initializing page table %d.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tbl_idx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_page=
_table_init(&amp;gasket_dev-&gt;page_table[tbl_idx],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;gasket_dev-&gt;bar_data[driver_desc-&gt;page_table_bar_index],<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;driver_desc-&gt;page_table_configs[tbl_idx],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gasket_dev-&gt;pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Couldn&#39;t init page table %d=
: %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tbl_idx, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Make sure that t=
he page table is clear and set to simple<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * addresses.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_r=
eset(gasket_dev-&gt;page_table[tbl_idx]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * hardware_revision_cb returns a positive inte=
ger (the rev) if<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * successful.)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D check_and_invoke_callback(gasket_dev,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver_de=
sc-&gt;hardware_revision_cb);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Error getting hardware revision: %d\n&quot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;hardware_revision =3D ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* device_status_cb returns a device status, no=
t an error code. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;status =3D gasket_get_hw_status(=
gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_dev-&gt;status =3D=3D GASKET_STATUS_=
DEAD)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev, &quot;Device reported as unhealthy.\n&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_add_cdev(&amp;gasket_dev-&gt;dev=
_info, &amp;gasket_file_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc-&gt;module);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-EXPORT_SYMBOL(gasket_enable_device);<br>
-<br>
-static int __gasket_add_device(struct device *parent_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_internal_desc *internal_desc,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_dev **gasket_devp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc-&gt;driver_desc;<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_alloc_dev(internal_desc, parent_=
dev, &amp;gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(gasket_dev-&gt;dev_info.device)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(parent_dev,=
 &quot;Cannot create %s device %s [ret =3D %ld]\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0driver_desc-&gt;name, gasket_dev-&gt;<a href=3D"http://dev_info.n=
ame" rel=3D"noreferrer" target=3D"_blank">dev_info.name</a>,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0PTR_ERR(gasket_dev-&gt;dev_info.device));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENODEV;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free_gasket_de=
v;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_sysfs_create_mapping(gasket_dev-=
&gt;dev_info.device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ga=
sket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto remove_device;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_sysfs_create_entries(gasket_dev-=
&gt;dev_info.device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ga=
sket_sysfs_generic_attrs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto remove_sysfs_m=
apping;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*gasket_devp =3D gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-remove_sysfs_mapping:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_remove_mapping(gasket_dev-&gt;dev_=
info.device);<br>
-remove_device:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0device_destroy(internal_desc-&gt;class, gasket_=
dev-&gt;dev_info.devt);<br>
-free_gasket_dev:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_free_dev(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-static void __gasket_remove_device(struct gasket_internal_desc *internal_d=
esc,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_dev *gasket_dev=
)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_remove_mapping(gasket_dev-&gt;dev_=
info.device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0device_destroy(internal_desc-&gt;class, gasket_=
dev-&gt;dev_info.devt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_free_dev(gasket_dev);<br>
-}<br>
-<br>
-/*<br>
- * Add PCI gasket device.<br>
- *<br>
- * Called by Gasket device probe function.<br>
- * Allocates device metadata and maps device memory.=C2=A0 The device driv=
er must<br>
- * call gasket_enable_device after driver init is complete to place the de=
vice<br>
- * in active use.<br>
- */<br>
-int gasket_pci_add_device(struct pci_dev *pci_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct gasket_dev **gasket_devp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_internal_desc *internal_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *parent;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;pci_dev-&gt;dev, &quot;add PCI gas=
ket device\n&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc =3D lookup_pci_internal_desc(pci_=
dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!internal_desc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pci_de=
v-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;PCI add device called for unknown driver type\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0parent =3D &amp;pci_dev-&gt;dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D __gasket_add_device(parent, internal_de=
sc, &amp;gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;pci_dev =3D pci_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_setup_pci(pci_dev, gasket_dev);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup_pci;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Once we&#39;ve created the mapping structure=
s successfully, attempt to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * create a symlink to the pci directory of thi=
s object.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sysfs_create_link(&amp;gasket_dev-&gt;d=
ev_info.device-&gt;kobj,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pci_dev-&gt;dev.kobj, dev_name(&=
amp;pci_dev-&gt;dev));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Cannot create sysfs pci link: %d\n&quot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup_pci;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*gasket_devp =3D gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-cleanup_pci:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_cleanup_pci(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__gasket_remove_device(internal_desc, gasket_de=
v);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-EXPORT_SYMBOL(gasket_pci_add_device);<br>
-<br>
-/* Remove a PCI gasket device. */<br>
-void gasket_pci_remove_device(struct pci_dev *pci_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_internal_desc *internal_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find the device desc. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc =3D lookup_pci_internal_desc(pci_=
dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!internal_desc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g=
_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g_mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Now find the specific device */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;internal_desc-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_DEV_MAX; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (internal_desc-&=
gt;devs[i] &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inter=
nal_desc-&gt;devs[i]-&gt;pci_dev =3D=3D pci_dev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_dev =3D internal_desc-&gt;devs[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;internal_desc-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;remove %s PCI=
 gasket device\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0internal_desc-&gt;d=
river_desc-&gt;name);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_cleanup_pci(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__gasket_remove_device(internal_desc, gasket_de=
v);<br>
-}<br>
-EXPORT_SYMBOL(gasket_pci_remove_device);<br>
-<br>
-/**<br>
- * Lookup a name by number in a num_name table.<br>
- * @num: Number to lookup.<br>
- * @table: Array of num_name structures, the table for the lookup.<br>
- *<br>
- * Description: Searches for num in the table.=C2=A0 If found, the<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0corresponding name is re=
turned; otherwise NULL<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is returned.<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The table must have a NU=
LL name pointer at the end.<br>
- */<br>
-const char *gasket_num_name_lookup(uint num,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct gasket_num_name =
*table)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint i =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (table[i].snn_name) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (num =3D=3D tabl=
e[i].snn_num)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return table[i].snn_name;<br>
-}<br>
-EXPORT_SYMBOL(gasket_num_name_lookup);<br>
-<br>
-int gasket_reset(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;gasket_dev-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_reset_nolock(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;gasket_dev-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-EXPORT_SYMBOL(gasket_reset);<br>
-<br>
-int gasket_reset_nolock(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc =3D gasket_dev-&gt;internal_desc-&g=
t;driver_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!driver_desc-&gt;device_reset_cb)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D driver_desc-&gt;device_reset_cb(gasket_=
dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Device reset cb returned %d.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reinitialize the page tables and interrupt f=
ramework. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; driver_desc-&gt;num_page_t=
ables; ++i)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_r=
eset(gasket_dev-&gt;page_table[i]);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_interrupt_reinit(gasket_dev);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Unable to reinit interrupts: %d.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get current device health. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;status =3D gasket_get_hw_status(=
gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_dev-&gt;status =3D=3D GASKET_STATUS_=
DEAD) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Device reported as dead.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-EXPORT_SYMBOL(gasket_reset_nolock);<br>
-<br>
-gasket_ioctl_permissions_cb_t<br>
-gasket_get_ioctl_permissions_cb(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_dev-&gt;internal_desc-&gt;driver_=
desc-&gt;ioctl_permissions_cb;<br>
-}<br>
-EXPORT_SYMBOL(gasket_get_ioctl_permissions_cb);<br>
-<br>
-/* Get the driver structure for a given gasket_dev.<br>
- * @dev: pointer to gasket_dev, implementing the requested driver.<br>
- */<br>
-const struct gasket_driver_desc *gasket_get_driver_desc(struct gasket_dev =
*dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;internal_desc-&gt;driver_desc;<b=
r>
-}<br>
-<br>
-/* Get the device structure for a given gasket_dev.<br>
- * @dev: pointer to gasket_dev, implementing the requested driver.<br>
- */<br>
-struct device *gasket_get_device(struct gasket_dev *dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev-&gt;dev;<br>
-}<br>
-<br>
-/**<br>
- * Asynchronously waits on device.<br>
- * @gasket_dev: Device struct.<br>
- * @bar: Bar<br>
- * @offset: Register offset<br>
- * @mask: Register mask<br>
- * @val: Expected value<br>
- * @max_retries: number of sleep periods<br>
- * @delay_ms: Timeout in milliseconds<br>
- *<br>
- * Description: Busy waits for a specific combination of bits to be set on=
 a<br>
- * Gasket register.<br>
- **/<br>
-int gasket_wait_with_reschedule(struct gasket_dev *gasket_dev, int bar,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offset, u64 mask, u64 val,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint max_retries, u64 delay_ms)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint retries =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 tmp;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (retries &lt; max_retries) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D gasket_dev_=
read_64(gasket_dev, bar, offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((tmp &amp; mask=
) =3D=3D val)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(delay_ms);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retries++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;%s timeout: r=
eg %llx timeout (%llu ms)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, offset, m=
ax_retries * delay_ms);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br>
-}<br>
-EXPORT_SYMBOL(gasket_wait_with_reschedule);<br>
-<br>
-/* See gasket_core.h for description. */<br>
-int gasket_register_device(const struct gasket_driver_desc *driver_desc)<b=
r>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int desc_idx =3D -1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_internal_desc *internal;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;Loading %s driver version %s\n&q=
uot;, driver_desc-&gt;name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver_desc-&gt;dr=
iver_version);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check for duplicates and find a free slot. *=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;g_mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_FRAMEWORK_DESC_MAX;=
 i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (g_descs[i].driv=
er_desc =3D=3D driver_desc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_err(&quot;%s driver already loaded/registered\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver_desc-&gt;name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EBUSY;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This and the above loop could be combined, b=
ut this reads easier. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_FRAMEWORK_DESC_MAX;=
 i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!g_descs[i].dri=
ver_desc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_descs[i].driver_desc =3D driver_desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0desc_idx =3D i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g_mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_idx =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;too ma=
ny drivers loaded, max %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GASKET_FRAMEWORK_DESC_MAX);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0internal =3D &amp;g_descs[desc_idx];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;internal-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(internal-&gt;devs, 0, sizeof(struct gask=
et_dev *) * GASKET_DEV_MAX);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0internal-&gt;class =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0class_create(driver=
_desc-&gt;module, driver_desc-&gt;name);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(internal-&gt;class)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Cannot=
 register %s class [ret=3D%ld]\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 driver_desc-&gt;name, PTR_ERR(internal-&gt;class));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(int=
ernal-&gt;class);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unregister_gas=
ket_driver;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D register_chrdev_region(MKDEV(driver_des=
c-&gt;major,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
river_desc-&gt;minor), GASKET_DEV_MAX,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver_desc-&gt;name);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;cannot=
 register %s char driver [ret=3D%d]\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 driver_desc-&gt;name, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto destroy_class;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-destroy_class:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0class_destroy(internal-&gt;class);<br>
-<br>
-unregister_gasket_driver:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0g_descs[desc_idx].driver_desc =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-EXPORT_SYMBOL(gasket_register_device);<br>
-<br>
-/* See gasket_core.h for description. */<br>
-void gasket_unregister_device(const struct gasket_driver_desc *driver_desc=
)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, desc_idx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_internal_desc *internal_desc =3D =
NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_FRAMEWORK_DESC_MAX;=
 i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (g_descs[i].driv=
er_desc =3D=3D driver_desc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0internal_desc =3D &amp;g_descs[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0desc_idx =3D i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!internal_desc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g=
_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;reques=
t to unregister unknown desc: %s, %d:%d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 driver_desc-&gt;name, driver_desc-&gt;major,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 driver_desc-&gt;minor);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_chrdev_region(MKDEV(driver_desc-&gt;=
major, driver_desc-&gt;minor),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GASKET_DEV_MAX);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0class_destroy(internal_desc-&gt;class);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Finally, effectively &quot;remove&quot; the =
driver. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0g_descs[desc_idx].driver_desc =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g_mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;removed %s driver\n&quot;, drive=
r_desc-&gt;name);<br>
-}<br>
-EXPORT_SYMBOL(gasket_unregister_device);<br>
-<br>
-static int __init gasket_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_FRAMEWORK_DESC_MAX;=
 i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_descs[i].driver_d=
esc =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;g_d=
escs[i].mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_init();<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;g_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-MODULE_DESCRIPTION(&quot;Google Gasket driver framework&quot;);<br>
-MODULE_VERSION(GASKET_FRAMEWORK_VERSION);<br>
-MODULE_LICENSE(&quot;GPL v2&quot;);<br>
-MODULE_AUTHOR(&quot;Rob Springer &lt;<a href=3D"mailto:rspringer@google.co=
m" target=3D"_blank">rspringer@google.com</a>&gt;&quot;);<br>
-module_init(gasket_init);<br>
diff --git a/drivers/staging/gasket/gasket_core.h b/drivers/staging/gasket/=
gasket_core.h<br>
deleted file mode 100644<br>
index c417acadb0d5..000000000000<br>
--- a/drivers/staging/gasket/gasket_core.h<br>
+++ /dev/null<br>
@@ -1,638 +0,0 @@<br>
-/* SPDX-License-Identifier: GPL-2.0 */<br>
-/*<br>
- * Gasket generic driver. Defines the set of data types and functions nece=
ssary<br>
- * to define a driver using the Gasket generic driver framework.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-#ifndef __GASKET_CORE_H__<br>
-#define __GASKET_CORE_H__<br>
-<br>
-#include &lt;linux/cdev.h&gt;<br>
-#include &lt;linux/compiler.h&gt;<br>
-#include &lt;linux/device.h&gt;<br>
-#include &lt;linux/init.h&gt;<br>
-#include &lt;linux/module.h&gt;<br>
-#include &lt;linux/pci.h&gt;<br>
-#include &lt;linux/sched.h&gt;<br>
-#include &lt;linux/slab.h&gt;<br>
-<br>
-#include &quot;gasket_constants.h&quot;<br>
-<br>
-/**<br>
- * struct gasket_num_name - Map numbers to names.<br>
- * @ein_num: Number.<br>
- * @ein_name: Name associated with the number, a char pointer.<br>
- *<br>
- * This structure maps numbers to names. It is used to provide printable e=
num<br>
- * names, e.g {0, &quot;DEAD&quot;} or {1, &quot;ALIVE&quot;}.<br>
- */<br>
-struct gasket_num_name {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint snn_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *snn_name;<br>
-};<br>
-<br>
-/*<br>
- * Register location for packed interrupts.<br>
- * Each value indicates the location of an interrupt field (in units of<br=
>
- * gasket_driver_desc-&gt;interrupt_pack_width) within the containing regi=
ster.<br>
- * In other words, this indicates the shift to use when creating a mask to=
<br>
- * extract/set bits within a register for a given interrupt.<br>
- */<br>
-enum gasket_interrupt_packing {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_0 =3D 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_1 =3D 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_2 =3D 2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PACK_3 =3D 3,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0UNPACKED =3D 4,<br>
-};<br>
-<br>
-/* Type of the interrupt supported by the device. */<br>
-enum gasket_interrupt_type {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_MSIX =3D 0,<br>
-};<br>
-<br>
-/*<br>
- * Used to describe a Gasket interrupt. Contains an interrupt index, a reg=
ister,<br>
- * and packing data for that interrupt. The register and packing data<br>
- * fields are relevant only for PCI_MSIX interrupt type and can be<br>
- * set to 0 for everything else.<br>
- */<br>
-struct gasket_interrupt_desc {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Device-wide interrupt index/number. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int index;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The register offset controlling this interru=
pt. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 reg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The location of this interrupt inside regist=
er reg, if packed. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int packing;<br>
-};<br>
-<br>
-/*<br>
- * This enum is used to identify memory regions being part of the physical=
<br>
- * memory that belongs to a device.<br>
- */<br>
-enum mappable_area_type {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_BAR =3D 0, /* Default */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0BUS_REGION,=C2=A0 /* For SYSBUS devices, i.e. A=
XI etc... */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0COHERENT_MEMORY<br>
-};<br>
-<br>
-/*<br>
- * Metadata for each BAR mapping.<br>
- * This struct is used so as to track PCI memory, I/O space, AXI and coher=
ent<br>
- * memory area... i.e. memory objects which can be referenced in the devic=
e&#39;s<br>
- * mmap function.<br>
- */<br>
-struct gasket_bar_data {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Virtual base address. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 __iomem *virt_base;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Physical base address. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong phys_base;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Length of the mapping. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong length_bytes;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Type of mappable area */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum mappable_area_type type;<br>
-};<br>
-<br>
-/* Maintains device open ownership data. */<br>
-struct gasket_ownership {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1 if the device is owned, 0 otherwise. */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int is_owned;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TGID of the owner. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t owner;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Count of current device opens in write mode.=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int write_open_count;<br>
-};<br>
-<br>
-/* Page table modes of operation. */<br>
-enum gasket_page_table_mode {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The page table is partitionable as normal, a=
ll simple by default. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_PAGE_TABLE_MODE_NORMAL,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* All entries are always simple. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_PAGE_TABLE_MODE_SIMPLE,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* All entries are always extended. No extended=
 bit is used. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_PAGE_TABLE_MODE_EXTENDED,<br>
-};<br>
-<br>
-/* Page table configuration. One per table. */<br>
-struct gasket_page_table_config {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The identifier/index of this page table. */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int id;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The operation mode of this page table. */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum gasket_page_table_mode mode;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Total (first-level) entries in this page tab=
le. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong total_entries;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Base register for the page table. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int base_reg;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Register containing the extended page table.=
 This value is unused in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * GASKET_PAGE_TABLE_MODE_SIMPLE and GASKET_PAG=
E_TABLE_MODE_EXTENDED<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * modes.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int extended_reg;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The bit index indicating whether a PT entry =
is extended. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int extended_bit;<br>
-};<br>
-<br>
-/* Maintains information about a device node. */<br>
-struct gasket_cdev_info {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The internal name of this device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char name[GASKET_NAME_MAX];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Device number. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_t devt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Kernel-internal device structure. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *device;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Character device for real. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cdev cdev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Flag indicating if cdev_add has been called =
for the devices. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int cdev_added;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pointer to the overall gasket_dev struct for=
 this device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev_ptr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ownership data for the device in question. *=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_ownership ownership;<br>
-};<br>
-<br>
-/* Describes the offset and length of mmapable device BAR regions. */<br>
-struct gasket_mappable_region {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 start;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 length_bytes;<br>
-};<br>
-<br>
-/* Describe the offset, size, and permissions for a device bar. */<br>
-struct gasket_bar_desc {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The size of each PCI BAR range, in bytes. If=
 a value is 0, that BAR<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * will not be mapped into kernel space at all.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For devices with 64 bit BARs, only elements =
0, 2, and 4 should be<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * populated, and 1, 3, and 5 should be set to =
0.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For example, for a device mapping 1M in each=
 of the first two 64-bit<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * BARs, this field would be set as { 0x100000,=
 0, 0x100000, 0, 0, 0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * (one number per bar_desc struct.)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The permissions for this bar. (Should be VM_=
WRITE/VM_READ/VM_EXEC,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and can be or&#39;d.) If set to GASKET_NOMAP=
, the bar will<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * not be used for mmapping.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong permissions;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The memory address corresponding to the base=
 of this bar, if used. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 base;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The number of mappable regions in this bar. =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_mappable_regions;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The mappable subregions of this bar. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_mappable_region *mappable_r=
egions;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Type of mappable area */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum mappable_area_type type;<br>
-};<br>
-<br>
-/* Describes the offset, size, and permissions for a coherent buffer. */<b=
r>
-struct gasket_coherent_buffer_desc {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The size of the coherent buffer. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 size;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The permissions for this bar. (Should be VM_=
WRITE/VM_READ/VM_EXEC,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and can be or&#39;d.) If set to GASKET_NOMAP=
, the bar will<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * not be used for mmaping.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong permissions;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* device side address. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 base;<br>
-};<br>
-<br>
-/* Coherent buffer structure. */<br>
-struct gasket_coherent_buffer {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Virtual base address. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *virt_base;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Physical base address. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong phys_base;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Length of the mapping. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong length_bytes;<br>
-};<br>
-<br>
-/* Description of Gasket-specific permissions in the mmap field. */<br>
-enum gasket_mapping_options { GASKET_NOMAP =3D 0 };<br>
-<br>
-/* This struct represents an undefined bar that should never be mapped. */=
<br>
-#define GASKET_UNUSED_BAR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, GASKET_NOMAP, 0,=
 0, NULL, 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-/* Internal data for a Gasket device. See gasket_core.c for more informati=
on. */<br>
-struct gasket_internal_desc;<br>
-<br>
-#define MAX_NUM_COHERENT_PAGES 16<br>
-<br>
-/*<br>
- * Device data for Gasket device instances.<br>
- *<br>
- * This structure contains the data required to manage a Gasket device.<br=
>
- */<br>
-struct gasket_dev {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pointer to the internal driver description f=
or this device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_internal_desc *internal_desc;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Device info */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PCI subsystem metadata. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_dev *pci_dev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This device&#39;s index into internal_desc-&=
gt;devs. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int dev_idx;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The name of this device, as reported by the =
kernel. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char kobj_name[GASKET_NAME_MAX];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Virtual address of mapped BAR memory range. =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_bar_data bar_data[PCI_STD_NUM_BAR=
S];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Coherent buffer. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_coherent_buffer coherent_buffer;<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Number of page tables for this device. */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_page_tables;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Address translations. Page tables have a pri=
vate implementation. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *page_table[GASKET_MAX=
_NUM_PAGE_TABLES];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt data for this device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_interrupt_data *interrupt_data;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Status for this device - GASKET_STATUS_ALIVE=
 or _DEAD. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint status;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Number of times this device has been reset. =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint reset_count;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Dev information for the cdev node. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_cdev_info dev_info;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Hardware revision value for this device. */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int hardware_revision;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Protects access to per-device data (i.e. thi=
s structure). */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex mutex;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* cdev hash tracking/membership structure, Acc=
el and legacy. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unused until Accel is upstreamed. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hlist_node hlist_node;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hlist_node legacy_hlist_node;<br>
-};<br>
-<br>
-/* Type of the ioctl handler callback. */<br>
-typedef long (*gasket_ioctl_handler_cb_t)(struct file *file, uint cmd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vo=
id __user *argp);<br>
-/* Type of the ioctl permissions check callback. See below. */<br>
-typedef int (*gasket_ioctl_permissions_cb_t)(struct file *filp, uint cmd,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 void __user *argp);<br>
-<br>
-/*<br>
- * Device type descriptor.<br>
- *<br>
- * This structure contains device-specific data needed to identify and add=
ress a<br>
- * type of device to be administered via the Gasket generic driver.<br>
- *<br>
- * Device IDs are per-driver. In other words, two drivers using the Gasket=
<br>
- * framework will each have a distinct device 0 (for example).<br>
- */<br>
-struct gasket_driver_desc {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The name of this device type. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The name of this specific device model. */<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *chip_model;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The version of the chip specified in chip_mo=
del. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *chip_version;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The version of this driver: &quot;1.0.0&quot=
;, &quot;2.1.3&quot;, etc. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *driver_version;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Non-zero if we should create &quot;legacy&qu=
ot; (device and device-class-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * specific) character devices and sysfs nodes.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unused until Accel is upstreamed. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int legacy_support;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Major and minor numbers identifying the devi=
ce. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int major, minor;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Module structure for this driver. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct module *module;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PCI ID table. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct pci_device_id *pci_id_table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The number of page tables handled by this dr=
iver. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_page_tables;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The index of the bar containing the page tab=
les. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int page_table_bar_index;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Registers used to control each page table. *=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_page_table_config *page_tab=
le_configs;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The bit index indicating whether a PT entry =
is extended. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int page_table_extended_bit;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Legacy mmap address adjusment for legacy dev=
ices only. Should be 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * for any new device.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong legacy_mmap_address_offset;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set of 6 bar descriptions that describe all =
PCIe bars.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Note that BUS/AXI devices (i.e. non PCI devi=
ces) use those.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_bar_desc bar_descriptions[PCI_STD=
_NUM_BARS];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Coherent buffer description.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_coherent_buffer_desc coherent_buf=
fer_description;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt type. (One of gasket_interrupt_typ=
e). */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int interrupt_type;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Index of the bar containing the interrupt re=
gisters to program. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int interrupt_bar_index;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Number of interrupts in the gasket_interrupt=
_desc array */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_interrupts;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Description of the interrupts for this devic=
e. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_interrupt_desc *interrupts;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this device packs multiple interrupt-&gt;=
MSI-X mappings into a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * single register (i.e., &quot;uses packed int=
errupts&quot;), only a single bit<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * width is supported for each interrupt mappin=
g (unpacked/&quot;full-width&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * interrupts are always supported). This value=
 specifies that width. If<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * packed interrupts are not used, this value i=
s ignored.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int interrupt_pack_width;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Driver callback functions - all may be NULL =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * device_open_cb: Callback for when a device n=
ode is opened in write<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * mode.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @dev: The gasket_dev struct for this driver =
instance.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This callback should perform device-specific=
 setup that needs to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * occur only once when a device is first opene=
d.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*device_open_cb)(struct gasket_dev *dev);<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * device_release_cb: Callback when a device is=
 closed.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @gasket_dev: The gasket_dev struct for this =
driver instance.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This callback is called whenever a device no=
de fd is closed, as<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * opposed to device_close_cb, which is called =
when the _last_<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * descriptor for an open file is closed. This =
call is intended to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * handle any per-user or per-fd cleanup.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*device_release_cb)(struct gasket_dev *gas=
ket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct file *file);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * device_close_cb: Callback for when a device =
node is closed for the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * last time.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @dev: The gasket_dev struct for this driver =
instance.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This callback should perform device-specific=
 cleanup that only<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * needs to occur when the last reference to a =
device node is closed.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This call is intended to handle and device-w=
ide cleanup, as opposed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to per-fd cleanup (which should be handled b=
y device_release_cb).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*device_close_cb)(struct gasket_dev *dev);=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * get_mappable_regions_cb: Get descriptors of =
mappable device memory.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @gasket_dev: Pointer to the struct gasket_de=
v for this device.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @bar_index: BAR for which to retrieve memory=
 ranges.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @mappable_regions: Out-pointer to the list o=
f mappable regions on the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * device/BAR for this process.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @num_mappable_regions: Out-pointer for the s=
ize of mappable_regions.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Called when handling mmap(), this callback i=
s used to determine which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * regions of device memory may be mapped by th=
e current process. This<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * information is then compared to mmap request=
 to determine which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * regions to actually map.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*get_mappable_regions_cb)(struct gasket_de=
v *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int bar_index,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_m=
appable_region **mappable_regions,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int *num_mappab=
le_regions);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * ioctl_permissions_cb: Check permissions for =
generic ioctls.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @filp: File structure pointer describing thi=
s node usage session.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @cmd: ioctl number to handle.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @arg: ioctl-specific data pointer.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Returns 1 if the ioctl may be executed, 0 ot=
herwise. If this callback<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * isn&#39;t specified a default routine will b=
e used, that only allows the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * original device opener (i.e, the &quot;owner=
&quot;) to execute state-affecting<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * ioctls.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_ioctl_permissions_cb_t ioctl_permissions=
_cb;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * ioctl_handler_cb: Callback to handle device-=
specific ioctls.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @filp: File structure pointer describing thi=
s node usage session.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @cmd: ioctl number to handle.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @arg: ioctl-specific data pointer.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Invoked whenever an ioctl is called that the=
 generic Gasket<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * framework doesn&#39;t support. If no cb is r=
egistered, unknown ioctls<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * return -EINVAL. Should return an error statu=
s (either -EINVAL or<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the error result of the ioctl being handled)=
.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_ioctl_handler_cb_t ioctl_handler_cb;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * device_status_cb: Callback to determine devi=
ce health.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @dev: Pointer to the gasket_dev struct for t=
his device.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Called to determine if the device is healthy=
 or not. Should return<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * a member of the gasket_status_type enum.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*device_status_cb)(struct gasket_dev *dev)=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * hardware_revision_cb: Get the device&#39;s h=
ardware revision.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @dev: Pointer to the gasket_dev struct for t=
his device.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Called to determine the reported rev of the =
physical hardware.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Revision should be &gt;0. A negative return =
value is an error.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*hardware_revision_cb)(struct gasket_dev *=
dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * device_reset_cb: Reset the hardware in quest=
ion.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @dev: Pointer to the gasket_dev structure fo=
r this device.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Called by reset ioctls. This function should=
 not<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * lock the gasket_dev mutex. It should return =
0 on success<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and an error on failure.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*device_reset_cb)(struct gasket_dev *dev);=
<br>
-};<br>
-<br>
-/*<br>
- * Register the specified device type with the framework.<br>
- * @desc: Populated/initialized device type descriptor.<br>
- *<br>
- * This function does _not_ take ownership of desc; the underlying struct =
must<br>
- * exist until the matching call to gasket_unregister_device.<br>
- * This function should be called from your driver&#39;s module_init funct=
ion.<br>
- */<br>
-int gasket_register_device(const struct gasket_driver_desc *desc);<br>
-<br>
-/*<br>
- * Remove the specified device type from the framework.<br>
- * @desc: Descriptor for the device type to unregister; it should have bee=
n<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 passed to gasket_register_device in a previo=
us call.<br>
- *<br>
- * This function should be called from your driver&#39;s module_exit funct=
ion.<br>
- */<br>
-void gasket_unregister_device(const struct gasket_driver_desc *desc);<br>
-<br>
-/* Add a PCI gasket device. */<br>
-int gasket_pci_add_device(struct pci_dev *pci_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct gasket_dev **gasket_devp);<br>
-/* Remove a PCI gasket device. */<br>
-void gasket_pci_remove_device(struct pci_dev *pci_dev);<br>
-<br>
-/* Enable a Gasket device. */<br>
-int gasket_enable_device(struct gasket_dev *gasket_dev);<br>
-<br>
-/* Disable a Gasket device. */<br>
-void gasket_disable_device(struct gasket_dev *gasket_dev);<br>
-<br>
-/*<br>
- * Reset the Gasket device.<br>
- * @gasket_dev: Gasket device struct.<br>
- *<br>
- * Calls device_reset_cb. Returns 0 on success and an error code othewrise=
.<br>
- * gasket_reset_nolock will not lock the mutex, gasket_reset will.<br>
- *<br>
- */<br>
-int gasket_reset(struct gasket_dev *gasket_dev);<br>
-int gasket_reset_nolock(struct gasket_dev *gasket_dev);<br>
-<br>
-/*<br>
- * Memory management functions. These will likely be spun off into their o=
wn<br>
- * file in the future.<br>
- */<br>
-<br>
-/* Unmaps the specified mappable region from a VMA. */<br>
-int gasket_mm_unmap_region(const struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct vm_area_struct *vma,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct gasket_mappable_region *map_region);<br>
-<br>
-/*<br>
- * Get the ioctl permissions callback.<br>
- * @gasket_dev: Gasket device structure.<br>
- */<br>
-gasket_ioctl_permissions_cb_t<br>
-gasket_get_ioctl_permissions_cb(struct gasket_dev *gasket_dev);<br>
-<br>
-/**<br>
- * Lookup a name by number in a num_name table.<br>
- * @num: Number to lookup.<br>
- * @table: Array of num_name structures, the table for the lookup.<br>
- *<br>
- */<br>
-const char *gasket_num_name_lookup(uint num,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct gasket_num_name =
*table);<br>
-<br>
-/* Handy inlines */<br>
-static inline ulong gasket_dev_read_64(struct gasket_dev *gasket_dev, int =
bar,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong location)=
<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return readq_relaxed(&amp;gasket_dev-&gt;bar_da=
ta[bar].virt_base[location]);<br>
-}<br>
-<br>
-static inline void gasket_dev_write_64(struct gasket_dev *dev, u64 value,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int bar, ulong =
location)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writeq_relaxed(value, &amp;dev-&gt;bar_data[bar=
].virt_base[location]);<br>
-}<br>
-<br>
-static inline void gasket_dev_write_32(struct gasket_dev *dev, u32 value,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int bar, ulong =
location)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(value, &amp;dev-&gt;bar_data[bar=
].virt_base[location]);<br>
-}<br>
-<br>
-static inline u32 gasket_dev_read_32(struct gasket_dev *dev, int bar,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong location)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return readl_relaxed(&amp;dev-&gt;bar_data[bar]=
.virt_base[location]);<br>
-}<br>
-<br>
-static inline void gasket_read_modify_write_64(struct gasket_dev *dev, int=
 bar,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ulong location, u64 value,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 u64 mask_width, u64 mask_shift)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 mask, tmp;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D gasket_dev_read_64(dev, bar, location);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D ((1ULL &lt;&lt; mask_width) - 1) &lt;&=
lt; mask_shift;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D (tmp &amp; ~mask) | (value &lt;&lt; mas=
k_shift);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev_write_64(dev, tmp, bar, location);<b=
r>
-}<br>
-<br>
-static inline void gasket_read_modify_write_32(struct gasket_dev *dev, int=
 bar,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ulong location, u32 value,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 u32 mask_width, u32 mask_shift)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask, tmp;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D gasket_dev_read_32(dev, bar, location);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D ((1 &lt;&lt; mask_width) - 1) &lt;&lt;=
 mask_shift;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D (tmp &amp; ~mask) | (value &lt;&lt; mas=
k_shift);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev_write_32(dev, tmp, bar, location);<b=
r>
-}<br>
-<br>
-/* Get the Gasket driver structure for a given device. */<br>
-const struct gasket_driver_desc *gasket_get_driver_desc(struct gasket_dev =
*dev);<br>
-<br>
-/* Get the device structure for a given device. */<br>
-struct device *gasket_get_device(struct gasket_dev *dev);<br>
-<br>
-/* Helper function, Asynchronous waits on a given set of bits. */<br>
-int gasket_wait_with_reschedule(struct gasket_dev *gasket_dev, int bar,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offset, u64 mask, u64 val,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint max_retries, u64 delay_ms);<br>
-<br>
-#endif /* __GASKET_CORE_H__ */<br>
diff --git a/drivers/staging/gasket/gasket_interrupt.c b/drivers/staging/ga=
sket/gasket_interrupt.c<br>
deleted file mode 100644<br>
index 864342acfd86..000000000000<br>
--- a/drivers/staging/gasket/gasket_interrupt.c<br>
+++ /dev/null<br>
@@ -1,515 +0,0 @@<br>
-// SPDX-License-Identifier: GPL-2.0<br>
-/* Copyright (C) 2018 Google, Inc. */<br>
-<br>
-#include &quot;gasket_interrupt.h&quot;<br>
-<br>
-#include &quot;gasket_constants.h&quot;<br>
-#include &quot;gasket_core.h&quot;<br>
-#include &quot;gasket_sysfs.h&quot;<br>
-#include &lt;linux/device.h&gt;<br>
-#include &lt;linux/interrupt.h&gt;<br>
-#include &lt;linux/printk.h&gt;<br>
-#ifdef GASKET_KERNEL_TRACE_SUPPORT<br>
-#define CREATE_TRACE_POINTS<br>
-#include &lt;trace/events/gasket_interrupt.h&gt;<br>
-#else<br>
-#define trace_gasket_interrupt_event(x, ...)<br>
-#endif<br>
-/* Retry attempts if the requested number of interrupts aren&#39;t availab=
le. */<br>
-#define MSIX_RETRY_COUNT 3<br>
-<br>
-/* Instance interrupt management data. */<br>
-struct gasket_interrupt_data {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The name associated with this interrupt data=
. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt type. See gasket_interrupt_type in=
 gasket_core.h */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int type;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The PCI device [if any] associated with the =
owning device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_dev *pci_dev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set to 1 if MSI-X has successfully been conf=
igred, 0 otherwise. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int msix_configured;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The number of interrupts requested by the ow=
ning device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_interrupts;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* A pointer to the interrupt descriptor struct=
 for this device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_interrupt_desc *interrupts;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The index of the bar into which interrupts s=
hould be mapped. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int interrupt_bar_index;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The width of a single interrupt in a packed =
interrupt register. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int pack_width;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Design-wise, these elements should be bundle=
d together, but<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * pci_enable_msix&#39;s interface requires tha=
t they be managed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * individually (requires array of struct msix_=
entry).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The number of successfully configured interr=
upts. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_configured;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The MSI-X data for each requested/configured=
 interrupt. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msix_entry *msix_entries;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The eventfd &quot;callback&quot; data for ea=
ch interrupt. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct eventfd_ctx **eventfd_ctxs;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The number of times each interrupt has been =
called. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong *interrupt_counts;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux IRQ number. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
-};<br>
-<br>
-/* Structures to display interrupt counts in sysfs. */<br>
-enum interrupt_sysfs_attribute_type {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ATTR_INTERRUPT_COUNTS,<br>
-};<br>
-<br>
-/* Set up device registers for interrupt handling. */<br>
-static void gasket_interrupt_setup(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int pack_shift;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong mask;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong value;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_interrupt_data *interrupt_data =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rrupt_data;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!interrupt_data) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Interrupt data is not initialized\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;Running inter=
rupt setup\n&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Setup the MSIX table. */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; interrupt_data-&gt;num_int=
errupts; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the interrupt=
 is not packed, we can write the index into<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the register dir=
ectly. If not, we need to deal with a read-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * modify-write and=
 shift based on the packing index.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Setting up interrupt index %d with index 0x%llx and packing=
 %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupt_data-&gt;interrupts[i].index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupt_data-&gt;interrupts[i].reg,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupt_data-&gt;interrupts[i].packing);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (interrupt_data-=
&gt;interrupts[i].packing =3D=3D UNPACKED) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value =3D interrupt_data-&gt;interrupts[i].index;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0switch (interrupt_data-&gt;interrupts[i].packing) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0case PACK_0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pack_shift =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0case PACK_1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pack_shift =3D interrupt_data-&gt;pac=
k_width;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0case PACK_2:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pack_shift =3D 2 * interrupt_data-&gt=
;pack_width;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0case PACK_3:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pack_shift =3D 3 * interrupt_data-&gt=
;pack_width;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Fou=
nd interrupt description with unknown enum %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt=
_data-&gt;interrupts[i].packing);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mask =3D ~(0xFFFF &lt;&lt; pack_shift);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value =3D gasket_dev_read_64(gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt_data-&gt;interrupt_bar_index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt_data-&gt;interrupts[i].reg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value &amp;=3D mask;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value |=3D interrupt_data-&gt;interrupts[i].index<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; pack_shift;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev_write_64=
(gasket_dev, value,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;inte=
rrupt_bar_index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;inte=
rrupts[i].reg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-<br>
-static void<br>
-gasket_handle_interrupt(struct gasket_interrupt_data *interrupt_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int interrupt_index)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct eventfd_ctx *ctx;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_interrupt_event(interrupt_data-&gt=
;name, interrupt_index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D interrupt_data-&gt;eventfd_ctxs[interru=
pt_index];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eventfd_signal(ctx,=
 1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0++(interrupt_data-&gt;interrupt_counts[interrup=
t_index]);<br>
-}<br>
-<br>
-static irqreturn_t gasket_msix_interrupt_handler(int irq, void *dev_id)<br=
>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_interrupt_data *interrupt_data =
=3D dev_id;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int interrupt =3D -1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If this linear lookup is a problem, we can m=
aintain a map/hash. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; interrupt_data-&gt;num_int=
errupts; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (interrupt_data-=
&gt;msix_entries[i].vector =3D=3D irq) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupt =3D interrupt_data-&gt;msix_entries[i].entry;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (interrupt =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Receiv=
ed unknown irq %d\n&quot;, irq);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_handle_interrupt(interrupt_data, interru=
pt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
-}<br>
-<br>
-static int<br>
-gasket_interrupt_msix_init(struct gasket_interrupt_data *interrupt_data)<b=
r>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;msix_entries =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kcalloc(interrupt_d=
ata-&gt;num_interrupts,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sizeof(*interrupt_data-&gt;msix_entries), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!interrupt_data-&gt;msix_entries)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; interrupt_data-&gt;num_int=
errupts; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;=
msix_entries[i].entry =3D i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;=
msix_entries[i].vector =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;=
eventfd_ctxs[i] =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Retry MSIX_RETRY_COUNT times if not enough I=
RQs are available. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; MSIX_RETRY_COUNT &amp;&amp=
; ret &gt; 0; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pci_enable_=
msix_exact(interrupt_data-&gt;pci_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0interrupt_data-&gt;msix_entries,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0interrupt_data-&gt;num_interrupts);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret &gt; 0 ?=
 -EBUSY : ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;msix_configured =3D 1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; interrupt_data-&gt;num_int=
errupts; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D request_irq=
(interrupt_data-&gt;msix_entries[i].vector,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_msix_interrupt_handler,=
 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;name, inter=
rupt_data);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(&amp;interrupt_data-&gt;pci_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Cannot get IRQ for interrupt %d=
, vector %d; &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, interrupt_data-&gt;msix_entries[i]=
.vector, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;=
num_configured++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * On QCM DragonBoard, we exit gasket_interrupt_msix_init() and kernel int=
errupt<br>
- * setup code with MSIX vectors masked. This is wrong because nothing else=
 in<br>
- * the driver will normally touch the MSIX vectors.<br>
- *<br>
- * As a temporary hack, force unmasking there.<br>
- *<br>
- * TODO: Figure out why QCM kernel doesn&#39;t unmask the MSIX vectors, af=
ter<br>
- * gasket_interrupt_msix_init(), and remove this code.<br>
- */<br>
-static void force_msix_interrupt_unmasking(struct gasket_dev *gasket_dev)<=
br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-#define MSIX_VECTOR_SIZE 16<br>
-#define MSIX_MASK_BIT_OFFSET 12<br>
-#define APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE 0x46800<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; gasket_dev-&gt;interrupt_d=
ata-&gt;num_configured; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check if the MSI=
X vector is unmasked */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong location =3D =
APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MSIX_MASK_BIT_OFFSET + i * MSIX_VECT=
OR_SIZE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_dev_read_32(gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
asket_dev-&gt;interrupt_data-&gt;interrupt_bar_index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l=
ocation);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(mask &amp; 1)=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unmask the msix =
vector (clear 32 bits) */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev_write_32=
(gasket_dev, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;interrup=
t_data-&gt;interrupt_bar_index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0location);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-#undef MSIX_VECTOR_SIZE<br>
-#undef MSIX_MASK_BIT_OFFSET<br>
-#undef APEX_BAR2_REG_KERNEL_HIB_MSIX_TABLE<br>
-}<br>
-<br>
-static ssize_t interrupt_sysfs_show(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute=
 *attr, char *buf)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t written =3D 0, total_written =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_interrupt_data *interrupt_data;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_attribute *gasket_attr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum interrupt_sysfs_attribute_type sysfs_type;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D gasket_sysfs_get_device_data(dev=
ice);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device, &qu=
ot;No sysfs mapping found for device\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_attr =3D gasket_sysfs_get_attr(device, a=
ttr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_attr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device, &qu=
ot;No sysfs attr data found for device\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_de=
vice_data(device, gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_type =3D (enum interrupt_sysfs_attribute_=
type)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_attr-&gt;dat=
a.attr_type;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data =3D gasket_dev-&gt;interrupt_dat=
a;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (sysfs_type) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ATTR_INTERRUPT_COUNTS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; interrupt_data-&gt;num_interrupts; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0written =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scnprintf(buf, PAGE_SIZE - total_writ=
ten,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;0x%02x: %ld\n&quot;, i,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
terrupt_data-&gt;interrupt_counts[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0total_written +=3D written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf +=3D written;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D total_writt=
en;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Unknown attribute: %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0attr-&gt;<a href=3D"http://attr.name" rel=3D"noreferrer" target=
=3D"_blank">attr.name</a>);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_attr(device, gasket_attr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_device_data(device, gasket_dev=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-static struct gasket_sysfs_attribute interrupt_sysfs_attrs[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_SYSFS_RO(interrupt_counts, interrupt_sys=
fs_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ATTR_INTERRUPT_COUNTS),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_END_OF_ATTR_ARRAY,<br>
-};<br>
-<br>
-int gasket_interrupt_init(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_interrupt_data *interrupt_data;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_get_driver_d=
esc(gasket_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data =3D kzalloc(sizeof(*interrupt_da=
ta), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!interrupt_data)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;interrupt_data =3D interrupt_dat=
a;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;name =3D driver_desc-&gt;nam=
e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;type =3D driver_desc-&gt;int=
errupt_type;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;pci_dev =3D gasket_dev-&gt;p=
ci_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;num_interrupts =3D driver_de=
sc-&gt;num_interrupts;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;interrupts =3D driver_desc-&=
gt;interrupts;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;interrupt_bar_index =3D driv=
er_desc-&gt;interrupt_bar_index;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;pack_width =3D driver_desc-&=
gt;interrupt_pack_width;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;num_configured =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;eventfd_ctxs =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kcalloc(driver_desc=
-&gt;num_interrupts,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sizeof(*interrupt_data-&gt;eventfd_ctxs), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!interrupt_data-&gt;eventfd_ctxs) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(interrupt_dat=
a);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;interrupt_counts =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kcalloc(driver_desc=
-&gt;num_interrupts,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sizeof(*interrupt_data-&gt;interrupt_counts), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!interrupt_data-&gt;interrupt_counts) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(interrupt_dat=
a-&gt;eventfd_ctxs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(interrupt_dat=
a);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (interrupt_data-&gt;type) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case PCI_MSIX:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_inte=
rrupt_msix_init(interrupt_data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0force_msix_interrup=
t_unmasking(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Failing to setup=
 interrupts will cause the device to report<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * GASKET_STATUS_LA=
MED. But it is not fatal.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(gasket_dev=
-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Couldn&#39;t initialize interrupts: %d\n&quot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_interrupt_setup(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_create_entries(gasket_dev-&gt;dev_=
info.device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_sysfs_attrs);=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-static void<br>
-gasket_interrupt_msix_cleanup(struct gasket_interrupt_data *interrupt_data=
)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; interrupt_data-&gt;num_con=
figured; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_irq(interrupt_=
data-&gt;msix_entries[i].vector,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 interrupt_data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;num_configured =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (interrupt_data-&gt;msix_configured)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_disable_msix(in=
terrupt_data-&gt;pci_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;msix_configured =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(interrupt_data-&gt;msix_entries);<br>
-}<br>
-<br>
-int gasket_interrupt_reinit(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev-&gt;interrupt_data) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Attempted to reinit uninitialized interrupt data\n&quot;);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (gasket_dev-&gt;interrupt_data-&gt;type)=
 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case PCI_MSIX:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_interrupt_ms=
ix_cleanup(gasket_dev-&gt;interrupt_data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_inte=
rrupt_msix_init(gasket_dev-&gt;interrupt_data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0force_msix_interrup=
t_unmasking(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Failing to setup=
 interrupts will cause the device<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to report GASKET=
_STATUS_LAMED, but is not fatal.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(gasket_dev=
-&gt;dev, &quot;Couldn&#39;t reinit interrupts: %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_interrupt_setup(gasket_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* See gasket_interrupt.h for description. */<br>
-int gasket_interrupt_reset_counts(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-&gt;dev, &quot;Clearing inte=
rrupt counts\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(gasket_dev-&gt;interrupt_data-&gt;interr=
upt_counts, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_dev-&gt;interrupt_=
data-&gt;num_interrupts *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sizeof(*gasket_dev-&gt;interrupt_data-&gt;interrupt_counts));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* See gasket_interrupt.h for description. */<br>
-void gasket_interrupt_cleanup(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_interrupt_data *interrupt_data =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rrupt_data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * It is possible to get an error code from gas=
ket_interrupt_init<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * before interrupt_data has been allocated, so=
 check it.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!interrupt_data)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (interrupt_data-&gt;type) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case PCI_MSIX:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_interrupt_ms=
ix_cleanup(interrupt_data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(interrupt_data-&gt;interrupt_counts);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(interrupt_data-&gt;eventfd_ctxs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(interrupt_data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;interrupt_data =3D NULL;<br>
-}<br>
-<br>
-int gasket_interrupt_system_status(struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev-&gt;interrupt_data) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;Interrupt data is null\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GASKET_STATU=
S_DEAD;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_dev-&gt;interrupt_data-&gt;num_confi=
gured !=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;inte=
rrupt_data-&gt;num_interrupts) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Not all interrupts were configured\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GASKET_STATU=
S_LAMED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return GASKET_STATUS_ALIVE;<br>
-}<br>
-<br>
-int gasket_interrupt_set_eventfd(struct gasket_interrupt_data *interrupt_d=
ata,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int interrupt, int event_fd)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct eventfd_ctx *ctx;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (interrupt &lt; 0 || interrupt &gt;=3D inter=
rupt_data-&gt;num_interrupts)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx =3D eventfd_ctx_fdget(event_fd);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(ctx))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ctx)=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;eventfd_ctxs[interrupt] =3D =
ctx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-int gasket_interrupt_clear_eventfd(struct gasket_interrupt_data *interrupt=
_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int interrupt)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (interrupt &lt; 0 || interrupt &gt;=3D inter=
rupt_data-&gt;num_interrupts)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (interrupt_data-&gt;eventfd_ctxs[interrupt])=
 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eventfd_ctx_put(int=
errupt_data-&gt;eventfd_ctxs[interrupt]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt_data-&gt;=
eventfd_ctxs[interrupt] =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
diff --git a/drivers/staging/gasket/gasket_interrupt.h b/drivers/staging/ga=
sket/gasket_interrupt.h<br>
deleted file mode 100644<br>
index 85526a1374a1..000000000000<br>
--- a/drivers/staging/gasket/gasket_interrupt.h<br>
+++ /dev/null<br>
@@ -1,95 +0,0 @@<br>
-/* SPDX-License-Identifier: GPL-2.0 */<br>
-/*<br>
- * Gasket common interrupt module. Defines functions for enabling<br>
- * eventfd-triggered interrupts between a Gasket device and a host process=
.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-#ifndef __GASKET_INTERRUPT_H__<br>
-#define __GASKET_INTERRUPT_H__<br>
-<br>
-#include &lt;linux/eventfd.h&gt;<br>
-#include &lt;linux/pci.h&gt;<br>
-<br>
-#include &quot;gasket_core.h&quot;<br>
-<br>
-/* Note that this currently assumes that device interrupts are a dense set=
,<br>
- * numbered from 0 - (num_interrupts - 1). Should this have to change, the=
se<br>
- * APIs will have to be updated.<br>
- */<br>
-<br>
-/* Opaque type used to hold interrupt subsystem data. */<br>
-struct gasket_interrupt_data;<br>
-<br>
-/*<br>
- * Initialize the interrupt module.<br>
- * @gasket_dev: The Gasket device structure for the device to be initted.<=
br>
- */<br>
-int gasket_interrupt_init(struct gasket_dev *gasket_dev);<br>
-<br>
-/*<br>
- * Clean up a device&#39;s interrupt structure.<br>
- * @gasket_dev: The Gasket information structure for this device.<br>
- *<br>
- * Cleans up the device&#39;s interrupts and deallocates data.<br>
- */<br>
-void gasket_interrupt_cleanup(struct gasket_dev *gasket_dev);<br>
-<br>
-/*<br>
- * Clean up and re-initialize the MSI-x subsystem.<br>
- * @gasket_dev: The Gasket information structure for this device.<br>
- *<br>
- * Performs a teardown of the MSI-x subsystem and re-initializes it. Does =
not<br>
- * free the underlying data structures. Returns 0 on success and an error =
code<br>
- * on error.<br>
- */<br>
-int gasket_interrupt_reinit(struct gasket_dev *gasket_dev);<br>
-<br>
-/*<br>
- * Reset the counts stored in the interrupt subsystem.<br>
- * @gasket_dev: The Gasket information structure for this device.<br>
- *<br>
- * Sets the counts of all interrupts in the subsystem to 0.<br>
- */<br>
-int gasket_interrupt_reset_counts(struct gasket_dev *gasket_dev);<br>
-<br>
-/*<br>
- * Associates an eventfd with a device interrupt.<br>
- * @data: Pointer to device interrupt data.<br>
- * @interrupt: The device interrupt to configure.<br>
- * @event_fd: The eventfd to associate with the interrupt.<br>
- *<br>
- * Prepares the host to receive notification of device interrupts by assoc=
iating<br>
- * event_fd with interrupt. Upon receipt of a device interrupt, event_fd w=
ill be<br>
- * signaled, after successful configuration.<br>
- *<br>
- * Returns 0 on success, a negative error code otherwise.<br>
- */<br>
-int gasket_interrupt_set_eventfd(struct gasket_interrupt_data *interrupt_d=
ata,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int interrupt, int event_fd);<br>
-<br>
-/*<br>
- * Removes an interrupt-eventfd association.<br>
- * @data: Pointer to device interrupt data.<br>
- * @interrupt: The device interrupt to de-associate.<br>
- *<br>
- * Removes any eventfd associated with the specified interrupt, if any.<br=
>
- */<br>
-int gasket_interrupt_clear_eventfd(struct gasket_interrupt_data *interrupt=
_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int interrupt);<br>
-<br>
-/*<br>
- * The below functions exist for backwards compatibility.<br>
- * No new uses should be written.<br>
- */<br>
-/*<br>
- * Get the health of the interrupt subsystem.<br>
- * @gasket_dev: The Gasket device struct.<br>
- *<br>
- * Returns DEAD if not set up, LAMED if initialization failed, and ALIVE<b=
r>
- * otherwise.<br>
- */<br>
-<br>
-int gasket_interrupt_system_status(struct gasket_dev *gasket_dev);<br>
-<br>
-#endif<br>
diff --git a/drivers/staging/gasket/gasket_ioctl.c b/drivers/staging/gasket=
/gasket_ioctl.c<br>
deleted file mode 100644<br>
index aa65f4fbf860..000000000000<br>
--- a/drivers/staging/gasket/gasket_ioctl.c<br>
+++ /dev/null<br>
@@ -1,388 +0,0 @@<br>
-// SPDX-License-Identifier: GPL-2.0<br>
-/* Copyright (C) 2018 Google, Inc. */<br>
-#include &quot;gasket.h&quot;<br>
-#include &quot;gasket_ioctl.h&quot;<br>
-#include &quot;gasket_constants.h&quot;<br>
-#include &quot;gasket_core.h&quot;<br>
-#include &quot;gasket_interrupt.h&quot;<br>
-#include &quot;gasket_page_table.h&quot;<br>
-#include &lt;linux/compiler.h&gt;<br>
-#include &lt;linux/device.h&gt;<br>
-#include &lt;linux/fs.h&gt;<br>
-#include &lt;linux/uaccess.h&gt;<br>
-<br>
-#ifdef GASKET_KERNEL_TRACE_SUPPORT<br>
-#define CREATE_TRACE_POINTS<br>
-#include &lt;trace/events/gasket_ioctl.h&gt;<br>
-#else<br>
-#define trace_gasket_ioctl_entry(x, ...)<br>
-#define trace_gasket_ioctl_exit(x)<br>
-#define trace_gasket_ioctl_integer_data(x)<br>
-#define trace_gasket_ioctl_eventfd_data(x, ...)<br>
-#define trace_gasket_ioctl_page_table_data(x, ...)<br>
-#define trace_gasket_ioctl_config_coherent_allocator(x, ...)<br>
-#endif<br>
-<br>
-/* Associate an eventfd with an interrupt. */<br>
-static int gasket_set_event_fd(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_interrupt_eventfd __user *arg=
p)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_interrupt_eventfd die;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;die, argp, sizeof(struc=
t gasket_interrupt_eventfd)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_eventfd_data(die.interrupt, =
die.event_fd);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_interrupt_set_eventfd(gasket_dev-=
&gt;interrupt_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0die.interrupt, die.event_fd);<br>
-}<br>
-<br>
-/* Read the size of the page table. */<br>
-static int gasket_read_page_table_size(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_p=
age_table_ioctl __user *argp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_ioctl ibuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;ibuf, argp, sizeof(stru=
ct gasket_page_table_ioctl)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.page_table_index &gt;=3D gasket_dev-&g=
t;num_page_tables)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0table =3D gasket_dev-&gt;page_table[ibuf.page_t=
able_index];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ibuf.size =3D gasket_page_table_num_entries(tab=
le);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_page_table_data(ibuf.page_ta=
ble_index, ibuf.size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.host_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.device_address);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(argp, &amp;ibuf, sizeof(ibuf))=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/* Read the size of the simple page table. */<br>
-static int gasket_read_simple_page_table_size(struct gasket_dev *gasket_de=
v,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct gasket_page_table_ioctl __user *argp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_ioctl ibuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;ibuf, argp, sizeof(stru=
ct gasket_page_table_ioctl)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.page_table_index &gt;=3D gasket_dev-&g=
t;num_page_tables)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0table =3D gasket_dev-&gt;page_table[ibuf.page_t=
able_index];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ibuf.size =3D gasket_page_table_num_simple_entr=
ies(table);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_page_table_data(ibuf.page_ta=
ble_index, ibuf.size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.host_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.device_address);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(argp, &amp;ibuf, sizeof(ibuf))=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/* Set the boundary between the simple and extended page tables. */<br>
-static int gasket_partition_page_table(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_p=
age_table_ioctl __user *argp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_ioctl ibuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint max_page_table_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;ibuf, argp, sizeof(stru=
ct gasket_page_table_ioctl)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_page_table_data(ibuf.page_ta=
ble_index, ibuf.size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.host_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.device_address);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.page_table_index &gt;=3D gasket_dev-&g=
t;num_page_tables)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0table =3D gasket_dev-&gt;page_table[ibuf.page_t=
able_index];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0max_page_table_size =3D gasket_page_table_max_s=
ize(table);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.size &gt; max_page_table_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Partition request 0x%llx too large, max is 0x%x\n&quot;,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ibuf.size, max_page_table_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;gasket_dev-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_page_table_partition(table, ibuf=
.size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;gasket_dev-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/* Map a userspace buffer to a device virtual address. */<br>
-static int gasket_map_buffers(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_ioctl __user *argp)=
<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_ioctl ibuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;ibuf, argp, sizeof(stru=
ct gasket_page_table_ioctl)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_page_table_data(ibuf.page_ta=
ble_index, ibuf.size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.host_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.device_address);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.page_table_index &gt;=3D gasket_dev-&g=
t;num_page_tables)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0table =3D gasket_dev-&gt;page_table[ibuf.page_t=
able_index];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_page_table_are_addrs_bad(table, ibuf=
.host_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ibuf.device_address, ibuf.size))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_page_table_map(table, ibuf.host_a=
ddress, ibuf.device_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibuf.size / PAGE_SIZE)=
;<br>
-}<br>
-<br>
-/* Unmap a userspace buffer from a device virtual address. */<br>
-static int gasket_unmap_buffers(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_ioctl __user=
 *argp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_ioctl ibuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *table;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;ibuf, argp, sizeof(stru=
ct gasket_page_table_ioctl)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_page_table_data(ibuf.page_ta=
ble_index, ibuf.size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.host_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
buf.device_address);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.page_table_index &gt;=3D gasket_dev-&g=
t;num_page_tables)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0table =3D gasket_dev-&gt;page_table[ibuf.page_t=
able_index];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_page_table_is_dev_addr_bad(table, ib=
uf.device_address, ibuf.size))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_unmap(table, ibuf.device_addr=
ess, ibuf.size / PAGE_SIZE);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * Reserve structures for coherent allocation, and allocate or free the<br=
>
- * corresponding memory.<br>
- */<br>
-static int gasket_config_coherent_allocator(struct gasket_dev *gasket_dev,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct gasket_coherent_alloc_config_ioctl __user *argp)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_coherent_alloc_config_ioctl ibuf;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;ibuf, argp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sizeof(struct gasket_coherent_alloc_config_ioctl)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_config_coherent_allocator(ib=
uf.enable, ibuf.size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibuf.dma_address);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.page_table_index &gt;=3D gasket_dev-&g=
t;num_page_tables)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.size &gt; PAGE_SIZE * MAX_NUM_COHERENT=
_PAGES)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ibuf.enable =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_free=
_coherent_memory(gasket_dev, ibuf.size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ibuf.dma_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ibuf.page_table_index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_allo=
c_coherent_memory(gasket_dev, ibuf.size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ibuf.dma_address,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibuf.page_table_index);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(argp, &amp;ibuf, sizeof(ibuf))=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Check permissions for Gasket ioctls. */<br>
-static bool gasket_ioctl_check_permissions(struct file *filp, uint cmd)<br=
>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool alive;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool read, write;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev =3D (struct gaske=
t_dev *)filp-&gt;private_data;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0alive =3D (gasket_dev-&gt;status =3D=3D GASKET_=
STATUS_ALIVE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!alive)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;%s alive %d status %d\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__func__, alive, gasket_dev-&gt;status);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0read =3D !!(filp-&gt;f_mode &amp; FMODE_READ);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0write =3D !!(filp-&gt;f_mode &amp; FMODE_WRITE)=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cmd) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_RESET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CLEAR_INTERRUPT_COUNTS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return write;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_PAGE_TABLE_SIZE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_SIMPLE_PAGE_TABLE_SIZE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_NUMBER_PAGE_TABLES:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return read;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_PARTITION_PAGE_TABLE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CONFIG_COHERENT_ALLOCATOR:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return alive &amp;&=
amp; write;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_MAP_BUFFER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_UNMAP_BUFFER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return alive &amp;&=
amp; write;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CLEAR_EVENTFD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_SET_EVENTFD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return alive &amp;&=
amp; write;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return false; /* unknown permissions */<br>
-}<br>
-<br>
-/*<br>
- * standard ioctl dispatch function.<br>
- * @filp: File structure pointer describing this node usage session.<br>
- * @cmd: ioctl number to handle.<br>
- * @argp: ioctl-specific data pointer.<br>
- *<br>
- * Standard ioctl dispatcher; forwards operations to individual handlers.<=
br>
- */<br>
-long gasket_handle_ioctl(struct file *filp, uint cmd, void __user *argp)<b=
r>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long arg =3D (unsigned long)argp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_ioctl_permissions_cb_t ioctl_permissions=
_cb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int retval;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D (struct gasket_dev *)filp-&gt;pr=
ivate_data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_entry(gasket_dev-&gt;<a href=
=3D"http://dev_info.name" rel=3D"noreferrer" target=3D"_blank">dev_info.nam=
e</a>, cmd);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl_permissions_cb =3D gasket_get_ioctl_permi=
ssions_cb(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ioctl_permissions_cb) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D ioctl_pe=
rmissions_cb(filp, cmd, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval &lt; 0) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0trace_gasket_ioctl_exit(retval);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return retval;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (retval =
=3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0trace_gasket_ioctl_exit(-EPERM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EPERM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!gasket_ioctl_check_permissions(filp=
, cmd)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_=
exit(-EPERM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;ioctl cmd=3D%x noperm\n&quot;, cmd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPERM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Tracing happens in this switch statement for=
 all ioctls with<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * an integer argrument, but ioctls with a stru=
ct argument<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * that needs copying and decoding, that tracin=
g is done within<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the handler call.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cmd) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_RESET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_r=
eset(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_SET_EVENTFD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_s=
et_event_fd(gasket_dev, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CLEAR_EVENTFD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_=
integer_data(arg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_interrupt_clear_eventfd(gasket_dev-&gt;interrupt_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)arg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_PARTITION_PAGE_TABLE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_=
integer_data(arg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_p=
artition_page_table(gasket_dev, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_NUMBER_PAGE_TABLES:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_=
integer_data(gasket_dev-&gt;num_page_tables);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(ar=
gp, &amp;gasket_dev-&gt;num_page_tables,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(uint64_t)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0retval =3D -EFAULT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0retval =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_PAGE_TABLE_SIZE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_r=
ead_page_table_size(gasket_dev, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_SIMPLE_PAGE_TABLE_SIZE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_r=
ead_simple_page_table_size(gasket_dev, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_MAP_BUFFER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_m=
ap_buffers(gasket_dev, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CONFIG_COHERENT_ALLOCATOR:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_c=
onfig_coherent_allocator(gasket_dev, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_UNMAP_BUFFER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_u=
nmap_buffers(gasket_dev, argp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CLEAR_INTERRUPT_COUNTS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear interrupt =
counts doesn&#39;t take an arg, so use 0. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_=
integer_data(0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D gasket_i=
nterrupt_reset_counts(gasket_dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we don&#39;t =
understand the ioctl, the best we can do is trace<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the arg.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_=
integer_data(arg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Unknown ioctl cmd=3D0x%x not caught by gasket_is_supported_=
ioctl\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cmd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D -EINVAL;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gasket_ioctl_exit(retval);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;<br>
-}<br>
-<br>
-/*<br>
- * Determines if an ioctl is part of the standard Gasket framework.<br>
- * @cmd: The ioctl number to handle.<br>
- *<br>
- * Returns 1 if the ioctl is supported and 0 otherwise.<br>
- */<br>
-long gasket_is_supported_ioctl(uint cmd)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cmd) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_RESET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_SET_EVENTFD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CLEAR_EVENTFD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_PARTITION_PAGE_TABLE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_NUMBER_PAGE_TABLES:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_PAGE_TABLE_SIZE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_SIMPLE_PAGE_TABLE_SIZE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_MAP_BUFFER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_UNMAP_BUFFER:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CLEAR_INTERRUPT_COUNTS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GASKET_IOCTL_CONFIG_COHERENT_ALLOCATOR:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
diff --git a/drivers/staging/gasket/gasket_ioctl.h b/drivers/staging/gasket=
/gasket_ioctl.h<br>
deleted file mode 100644<br>
index 51f468c77f04..000000000000<br>
--- a/drivers/staging/gasket/gasket_ioctl.h<br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-/* SPDX-License-Identifier: GPL-2.0 */<br>
-/* Copyright (C) 2018 Google, Inc. */<br>
-#ifndef __GASKET_IOCTL_H__<br>
-#define __GASKET_IOCTL_H__<br>
-<br>
-#include &quot;gasket_core.h&quot;<br>
-<br>
-#include &lt;linux/compiler.h&gt;<br>
-<br>
-/*<br>
- * Handle Gasket common ioctls.<br>
- * @filp: Pointer to the ioctl&#39;s file.<br>
- * @cmd: Ioctl command.<br>
- * @arg: Ioctl argument pointer.<br>
- *<br>
- * Returns 0 on success and nonzero on failure.<br>
- */<br>
-long gasket_handle_ioctl(struct file *filp, uint cmd, void __user *argp);<=
br>
-<br>
-/*<br>
- * Determines if an ioctl is part of the standard Gasket framework.<br>
- * @cmd: The ioctl number to handle.<br>
- *<br>
- * Returns 1 if the ioctl is supported and 0 otherwise.<br>
- */<br>
-long gasket_is_supported_ioctl(uint cmd);<br>
-<br>
-#endif<br>
diff --git a/drivers/staging/gasket/gasket_page_table.c b/drivers/staging/g=
asket/gasket_page_table.c<br>
deleted file mode 100644<br>
index 2dbf3d9b8f34..000000000000<br>
--- a/drivers/staging/gasket/gasket_page_table.c<br>
+++ /dev/null<br>
@@ -1,1357 +0,0 @@<br>
-// SPDX-License-Identifier: GPL-2.0<br>
-/*<br>
- * Implementation of Gasket page table support.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-<br>
-/*<br>
- * Implementation of Gasket page table support.<br>
- *<br>
- * This file assumes 4kB pages throughout; can be factored out when necess=
ary.<br>
- *<br>
- * There is a configurable number of page table entries, as well as a<br>
- * configurable bit index for the extended address flag. Both of these are=
<br>
- * specified in gasket_page_table_init through the page_table_config param=
eter.<br>
- *<br>
- * The following example assumes:<br>
- *=C2=A0 =C2=A0page_table_config-&gt;total_entries =3D 8192<br>
- *=C2=A0 =C2=A0page_table_config-&gt;extended_bit =3D 63<br>
- *<br>
- * Address format:<br>
- * Simple addresses - those whose containing pages are directly placed in =
the<br>
- * device&#39;s address translation registers - are laid out as:<br>
- * [ 63 - 25: 0 | 24 - 12: page index | 11 - 0: page offset ]<br>
- * page index:=C2=A0 The index of the containing page in the device&#39;s =
address<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 translation registers.<=
br>
- * page offset: The index of the address into the containing page.<br>
- *<br>
- * Extended address - those whose containing pages are contained in a seco=
nd-<br>
- * level page table whose address is present in the device&#39;s address t=
ranslation<br>
- * registers - are laid out as:<br>
- * [ 63: flag | 62 - 34: 0 | 33 - 21: dev/level 0 index |<br>
- *=C2=A0 =C2=A020 - 12: host/level 1 index | 11 - 0: page offset ]<br>
- * flag:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Marker indicating that this is an exte=
nded address. Always 1.<br>
- * dev index:=C2=A0 =C2=A0The index of the first-level page in the device&=
#39;s extended<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 address translation reg=
isters.<br>
- * host index:=C2=A0 The index of the containing page in the [host-residen=
t] second-<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 level page table.<br>
- * page offset: The index of the address into the containing [second-level=
]<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page.<br>
- */<br>
-#include &quot;gasket_page_table.h&quot;<br>
-<br>
-#include &lt;linux/device.h&gt;<br>
-#include &lt;linux/file.h&gt;<br>
-#include &lt;linux/init.h&gt;<br>
-#include &lt;linux/kernel.h&gt;<br>
-#include &lt;linux/module.h&gt;<br>
-#include &lt;linux/moduleparam.h&gt;<br>
-#include &lt;linux/pagemap.h&gt;<br>
-#include &lt;linux/vmalloc.h&gt;<br>
-<br>
-#include &quot;gasket_constants.h&quot;<br>
-#include &quot;gasket_core.h&quot;<br>
-<br>
-/* Constants &amp; utility macros */<br>
-/* The number of pages that can be mapped into each second-level page tabl=
e. */<br>
-#define GASKET_PAGES_PER_SUBTABLE 512<br>
-<br>
-/* The starting position of the page index in a simple virtual address. */=
<br>
-#define GASKET_SIMPLE_PAGE_SHIFT 12<br>
-<br>
-/* Flag indicating that a [device] slot is valid for use. */<br>
-#define GASKET_VALID_SLOT_FLAG 1<br>
-<br>
-/*<br>
- * The starting position of the level 0 page index (i.e., the entry in the=
<br>
- * device&#39;s extended address registers) in an extended address.<br>
- * Also can be thought of as (log2(PAGE_SIZE) + log2(PAGES_PER_SUBTABLE)),=
<br>
- * or (12 + 9).<br>
- */<br>
-#define GASKET_EXTENDED_LVL0_SHIFT 21<br>
-<br>
-/*<br>
- * Number of first level pages that Gasket chips support. Equivalent to<br=
>
- * log2(NUM_LVL0_PAGE_TABLES)<br>
- *<br>
- * At a maximum, allowing for a 34 bits address space (or 16GB)<br>
- *=C2=A0 =C2=A0=3D GASKET_EXTENDED_LVL0_WIDTH + (log2(PAGE_SIZE) + log2(PA=
GES_PER_SUBTABLE)<br>
- * or, =3D 13 + 9 + 12<br>
- */<br>
-#define GASKET_EXTENDED_LVL0_WIDTH 13<br>
-<br>
-/*<br>
- * The starting position of the level 1 page index (i.e., the entry in the=
<br>
- * host second-level/sub- table) in an extended address.<br>
- */<br>
-#define GASKET_EXTENDED_LVL1_SHIFT 12<br>
-<br>
-/* Type declarations */<br>
-/* Valid states for a struct gasket_page_table_entry. */<br>
-enum pte_status {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PTE_FREE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PTE_INUSE,<br>
-};<br>
-<br>
-/*<br>
- * Mapping metadata for a single page.<br>
- *<br>
- * In this file, host-side page table entries are referred to as that (or =
PTEs).<br>
- * Where device vs. host entries are differentiated, device-side or -visib=
le<br>
- * entries are called &quot;slots&quot;. A slot may be either an entry in =
the device&#39;s<br>
- * address translation table registers or an entry in a second-level page<=
br>
- * table (&quot;subtable&quot;).<br>
- *<br>
- * The full data in this structure is visible on the host [of course]. Onl=
y<br>
- * the address contained in dma_addr is communicated to the device; that p=
oints<br>
- * to the actual page mapped and described by this structure.<br>
- */<br>
-struct gasket_page_table_entry {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The status of this entry/slot: free or in us=
e. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum pte_status status;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Index for alignment into host vaddrs.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * When a user specifies a host address for a m=
apping, that address may<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * not be page-aligned. Offset is the index int=
o the containing page of<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the host address (i.e., host_vaddr &amp; (PA=
GE_SIZE - 1)).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This is necessary for translating between us=
er-specified addresses<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and page-aligned addresses.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int offset;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Address of the page in DMA space. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_addr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Linux page descriptor for the page described=
 by this structure. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct page *page;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this is an extended and first-level entry=
, sublevel points<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to the second-level entries underneath this =
entry.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_entry *sublevel;<br>
-};<br>
-<br>
-/*<br>
- * Maintains virtual to physical address mapping for a coherent page that =
is<br>
- * allocated by this module for a given device.<br>
- * Note that coherent pages mappings virt mapping cannot be tracked by the=
<br>
- * Linux kernel, and coherent pages don&#39;t have a struct page associate=
d,<br>
- * hence Linux kernel cannot perform a get_user_page_xx() on a phys addres=
s<br>
- * that was allocated coherent.<br>
- * This structure trivially implements this mechanism.<br>
- */<br>
-struct gasket_coherent_page_entry {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Phys address, dma&#39;able by the owner devi=
ce */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t paddr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Kernel virtual address */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 user_virt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* User virtual address that was mapped by the =
mmap kernel subsystem */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 kernel_virt;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Whether this page has been mapped into a use=
r land process virtual<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * space<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 in_use;<br>
-};<br>
-<br>
-/*<br>
- * [Host-side] page table descriptor.<br>
- *<br>
- * This structure tracks the metadata necessary to manage both simple and<=
br>
- * extended page tables.<br>
- */<br>
-struct gasket_page_table {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The config used to create this page table. *=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_config config;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The number of simple (single-level) entries =
in the page table. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint num_simple_entries;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The number of extended (two-level) entries i=
n the page table. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint num_extended_entries;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Array of [host-side] page table entries. */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_entry *entries;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Number of actively mapped kernel pages in th=
is table. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint num_active_pages;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Device register: base of/first slot in the p=
age table. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 __iomem *base_slot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Device register: holds the offset indicating=
 the start of the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * extended address region of the device&#39;s =
address translation table.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 __iomem *extended_offset_reg;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Device structure for the underlying device. =
Only used for logging. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *device;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PCI system descriptor for the underlying dev=
ice. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_dev *pci_dev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Location of the extended address bit for thi=
s Gasket device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 extended_flag;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Mutex to protect page table internals. */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex mutex;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Number of coherent pages accessible thru by =
this page table */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_coherent_pages;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * List of coherent memory (physical) allocated=
 for a device.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This structure also remembers the user virtu=
al mapping, this is<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * hacky, but we need to do this because the ke=
rnel doesn&#39;t keep track<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * of the user coherent pages (pfn pages), and =
virt to coherent page<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * mapping.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * TODO: use find_vma() APIs to convert host ad=
dress to vm_area, to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * dma_addr_t instead of storing user virtu add=
ress in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * gasket_coherent_page_entry<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Note that the user virtual mapping is create=
d by the driver, in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * gasket_mmap function, so user_virt belongs i=
n the driver anyhow.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_coherent_page_entry *coherent_pag=
es;<br>
-};<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-int gasket_page_table_init(struct gasket_page_table **ppg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct gasket_bar_data *bar_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct gasket_page_table_config *page_table_config,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct device *device, struct pci_dev *pci_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong bytes;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *pg_tbl;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong total_entries =3D page_table_config-&gt;t=
otal_entries;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * TODO: Verify config-&gt;total_entries agains=
t value read from the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * hardware register that contains the page tab=
le size.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (total_entries =3D=3D ULONG_MAX) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Error reading page table size. Initializing page table with=
 size 0\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total_entries =3D 0=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Attempting to=
 initialize page table of size 0x%lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total_entries);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Table has bas=
e reg 0x%x, extended offset reg 0x%x\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_table_config-&=
gt;base_reg,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_table_config-&=
gt;extended_reg);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*ppg_tbl =3D kzalloc(sizeof(**ppg_tbl), GFP_KER=
NEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*ppg_tbl) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device, &qu=
ot;No memory for page table\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl =3D *ppg_tbl;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bytes =3D total_entries * sizeof(struct gasket_=
page_table_entry);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bytes !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;entries =
=3D vzalloc(bytes);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pg_tbl-&gt;ent=
ries) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfree(pg_tbl);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*ppg_tbl =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;pg_tbl-&gt;config, page_table_confi=
g, sizeof(*page_table_config));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pg_tbl-&gt;config.mode =3D=3D GASKET_PAGE_T=
ABLE_MODE_NORMAL ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;config.mode =3D=3D GAS=
KET_PAGE_TABLE_MODE_SIMPLE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_simp=
le_entries =3D total_entries;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_exte=
nded_entries =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;extended=
_flag =3D 1ull &lt;&lt; page_table_config-&gt;extended_bit;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_simp=
le_entries =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_exte=
nded_entries =3D total_entries;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;extended=
_flag =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_active_pages =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;base_slot =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(u64 __iomem *)&amp=
;bar_data-&gt;virt_base[page_table_config-&gt;base_reg];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;extended_offset_reg =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(u64 __iomem *)&amp=
;bar_data-&gt;virt_base[page_table_config-&gt;extended_reg];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;device =3D get_device(device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;pci_dev =3D pci_dev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device, &quot;Page table initialized su=
ccessfully\n&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * Check if a range of PTEs is free.<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static bool gasket_is_pte_range_free(struct gasket_page_table_entry *ptes,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint num_entries)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_entries; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptes[i].status =
!=3D PTE_FREE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-}<br>
-<br>
-/*<br>
- * Free a second level page [sub]table.<br>
- * The page table mutex must be held before this call.<br>
- */<br>
-static void gasket_free_extended_subtable(struct gasket_page_table *pg_tbl=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct gasket_page_table_entry *pte,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u6=
4 __iomem *slot)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Release the page table from the driver */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte-&gt;status =3D PTE_FREE;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Release the page table from the device */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writeq(0, slot);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte-&gt;dma_addr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_unmap_page(pg_t=
bl-&gt;device, pte-&gt;dma_addr, PAGE_SIZE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_TO_DEVICE);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vfree(pte-&gt;sublevel);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte-&gt;page)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_page((ulong)pa=
ge_address(pte-&gt;page));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(pte, 0, sizeof(struct gasket_page_table_=
entry));<br>
-}<br>
-<br>
-/*<br>
- * Actually perform collection.<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static void<br>
-gasket_page_table_garbage_collect_nolock(struct gasket_page_table *pg_tbl)=
<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_entry *pte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 __iomem *slot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX FIX ME XXX -- more efficient to keep a u=
sage count */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* rather than scanning the second level page t=
ables */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (pte =3D pg_tbl-&gt;entries + pg_tbl-&gt;nu=
m_simple_entries,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slot =3D pg_tbl-&gt;base_slot + =
pg_tbl-&gt;num_simple_entries;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pte &lt; pg_tbl-&gt;entries + pg=
_tbl-&gt;config.total_entries;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pte++, slot++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte-&gt;status =
=3D=3D PTE_INUSE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (gasket_is_pte_range_free(pte-&gt;sublevel,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GASKET_PAGES_PER_SUBTABLE))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_free_extended_subtable(pg_tbl,=
 pte,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slot);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-void gasket_page_table_garbage_collect(struct gasket_page_table *pg_tbl)<b=
r>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_garbage_collect_nolock(pg_tbl=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-}<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-void gasket_page_table_cleanup(struct gasket_page_table *pg_tbl)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Deallocate free second-level tables. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_garbage_collect(pg_tbl);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: Check that all PTEs have been freed? *=
/<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vfree(pg_tbl-&gt;entries);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;entries =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0put_device(pg_tbl-&gt;device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(pg_tbl);<br>
-}<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-int gasket_page_table_partition(struct gasket_page_table *pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint num_simple_entries)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, start;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_simple_entries &gt; pg_tbl-&gt;config.t=
otal_entries) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;p=
g_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_garbage_collect_nolock(pg_tbl=
);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D min(pg_tbl-&gt;num_simple_entries, nu=
m_simple_entries);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D start; i &lt; pg_tbl-&gt;config.tota=
l_entries; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pg_tbl-&gt;entr=
ies[i].status !=3D PTE_FREE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(pg_tbl-&gt;device, &quot;entry %d is not free\n&quot;, i)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EBUSY;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_simple_entries =3D num_simple_en=
tries;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_extended_entries =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;config.t=
otal_entries - num_simple_entries;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writeq(num_simple_entries, pg_tbl-&gt;extended_=
offset_reg);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_partition);<br>
-<br>
-/*<br>
- * Return whether a host buffer was mapped as coherent memory.<br>
- *<br>
- * A Gasket page_table currently support one contiguous dma range, mapped =
to one<br>
- * contiguous virtual memory range. Check if the host_addr is within that =
range.<br>
- */<br>
-static int is_coherent(struct gasket_page_table *pg_tbl, ulong host_addr)<=
br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 min, max;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* whether the host address is within user virt=
 range */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pg_tbl-&gt;coherent_pages)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0min =3D (u64)pg_tbl-&gt;coherent_pages[0].user_=
virt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0max =3D min + PAGE_SIZE * pg_tbl-&gt;num_cohere=
nt_pages;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return min &lt;=3D host_addr &amp;&amp; host_ad=
dr &lt; max;<br>
-}<br>
-<br>
-/* Safely return a page to the OS. */<br>
-static bool gasket_release_page(struct page *page)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!page)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!PageReserved(page))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SetPageDirty(page);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unpin_user_page(page);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-}<br>
-<br>
-/*<br>
- * Get and map last level page table buffers.<br>
- *<br>
- * slots is the location(s) to write device-mapped page address. If this i=
s a<br>
- * simple mapping, these will be address translation registers. If this is=
<br>
- * an extended mapping, these will be within a second-level page table<br>
- * allocated by the host and so must have their __iomem attribute casted a=
way.<br>
- */<br>
-static int gasket_perform_mapping(struct gasket_page_table *pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_entry=
 *ptes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 __iomem *slots, ulong host=
_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint num_pages, int is_simple_=
mapping)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct page *page;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_addr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong page_addr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_pages; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_addr =3D host_=
addr + i * PAGE_SIZE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D page_add=
r &amp; (PAGE_SIZE - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_coherent(pg_=
tbl, host_addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u64 off =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(u64)host_addr -<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(u64)pg_tbl-&gt;coherent_pages[0].use=
r_virt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes[i].page =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes[i].offset =3D offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes[i].dma_addr =3D pg_tbl-&gt;coherent_pages[0].paddr +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o=
ff + i * PAGE_SIZE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D pin_user_pages_fast(page_addr - offset, 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0FOLL_WRITE, &amp;page);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret &lt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pin=
 user pages failed for addr=3D0x%lx, offset=3D0x%lx [ret=3D%d]\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_addr=
, offset, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret ? ret : -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0++pg_tbl-&gt;num_active_pages;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes[i].page =3D page;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes[i].offset =3D offset;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Map the page into DMA space. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ptes[i].dma_addr =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_map_page(pg_tbl-&gt;device, page,=
 0, PAGE_SIZE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 DMA_BIDIRECTIONAL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (dma_mapping_error(pg_tbl-&gt;device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ptes[i].dma_addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_release_page(ptes[i].page)=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pg_tbl-=
&gt;num_active_pages;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;ptes[i], 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct g=
asket_page_table_entry));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make the DMA-spa=
ce address available to the device. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr =3D (ptes[=
i].dma_addr + offset) | GASKET_VALID_SLOT_FLAG;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_simple_mappi=
ng) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0writeq(dma_addr, &amp;slots[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0((u64 __force *)slots)[i] =3D dma_addr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Extended page table vectors are in DRAM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * and so need to be synced each time they are updated.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dma_map_single(pg_tbl-&gt;device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void *)&amp;((=
u64 __force *)slots)[i],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(u64), DM=
A_TO_DEVICE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptes[i].status =3D =
PTE_INUSE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * Return the index of the page for the address in the simple table.<br>
- * Does not perform validity checking.<br>
- */<br>
-static int gasket_simple_page_idx(struct gasket_page_table *pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong dev_addr)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (dev_addr &gt;&gt; GASKET_SIMPLE_PAGE_SH=
IFT) &amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pg_tbl-&gt;config.=
total_entries - 1);<br>
-}<br>
-<br>
-/*<br>
- * Return the level 0 page index for the given address.<br>
- * Does not perform validity checking.<br>
- */<br>
-static ulong gasket_extended_lvl0_page_idx(struct gasket_page_table *pg_tb=
l,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
long dev_addr)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (dev_addr &gt;&gt; GASKET_EXTENDED_LVL0_=
SHIFT) &amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pg_tbl-&gt;config.=
total_entries - 1);<br>
-}<br>
-<br>
-/*<br>
- * Return the level 1 page index for the given address.<br>
- * Does not perform validity checking.<br>
- */<br>
-static ulong gasket_extended_lvl1_page_idx(struct gasket_page_table *pg_tb=
l,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
long dev_addr)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (dev_addr &gt;&gt; GASKET_EXTENDED_LVL1_=
SHIFT) &amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (GASKET_PAGES_PER_SUBTABL=
E - 1);<br>
-}<br>
-<br>
-/*<br>
- * Allocate page table entries in a simple table.<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static int gasket_alloc_simple_entries(struct gasket_page_table *pg_tbl,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong dev_addr,=
 uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_is_pte_range_free(pg_tbl-&gt;entrie=
s +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_simple_pa=
ge_idx(pg_tbl, dev_addr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_pages))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * Unmap and release mapped pages.<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static void gasket_perform_unmapping(struct gasket_page_table *pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_page_tab=
le_entry *ptes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 __iomem *slots, ui=
nt num_pages,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int is_simple_mapping)=
<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For each page table entry and corresponding =
entry in the device&#39;s<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * address translation table:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_pages; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* release the addr=
ess from the device, */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_simple_mappi=
ng || ptes[i].status =3D=3D PTE_INUSE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0writeq(0, &amp;slots[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0((u64 __force *)slots)[i] =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* sync above PTE update before updating mappings */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0wmb();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* release the addr=
ess from the driver, */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptes[i].status =
=3D=3D PTE_INUSE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ptes[i].page &amp;&amp; ptes[i].dma_addr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_unmap_page(pg_tbl-&gt;device, pte=
s[i].dma_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (gasket_release_page(ptes[i].page))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pg_tbl-&gt;num_active_pages;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* and clear the PT=
E. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;ptes[i]=
, 0, sizeof(struct gasket_page_table_entry));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-<br>
-/*<br>
- * Unmap and release pages mapped to simple addresses.<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static void gasket_unmap_simple_pages(struct gasket_page_table *pg_tbl,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong dev_addr, =
uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint slot =3D gasket_simple_page_idx(pg_tbl, de=
v_addr);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_perform_unmapping(pg_tbl, pg_tbl-&gt;ent=
ries + slot,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pg_tbl-&gt;base_slot + slot, num_pag=
es, 1);<br>
-}<br>
-<br>
-/*<br>
- * Unmap and release buffers to extended addresses.<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static void gasket_unmap_extended_pages(struct gasket_page_table *pg_tbl,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong dev=
_addr, uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint slot_idx, remain, len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_entry *pte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 __iomem *slot_base;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0remain =3D num_pages;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0slot_idx =3D gasket_extended_lvl1_page_idx(pg_t=
bl, dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte =3D pg_tbl-&gt;entries + pg_tbl-&gt;num_sim=
ple_entries +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_extended_lvl0_page_=
idx(pg_tbl, dev_addr);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (remain &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: Add check =
to ensure pte remains valid? */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D min(remain,=
 GASKET_PAGES_PER_SUBTABLE - slot_idx);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte-&gt;status =
=3D=3D PTE_INUSE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0slot_base =3D (u64 __iomem *)(page_address(pte-&gt;page) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte-&gt;offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_perform_unmapping(pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 pte-&gt;sublevel + slot_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 slot_base + slot_idx, len, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remain -=3D len;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slot_idx =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-<br>
-/* Evaluates to nonzero if the specified virtual address is simple. */<br>
-static inline bool gasket_addr_is_simple(struct gasket_page_table *pg_tbl,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong ad=
dr)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return !((addr) &amp; (pg_tbl)-&gt;extended_fla=
g);<br>
-}<br>
-<br>
-/*<br>
- * Convert (simple, page, offset) into a device address.<br>
- * Examples:<br>
- * Simple page 0, offset 32:<br>
- *=C2=A0 Input (1, 0, 32), Output 0x20<br>
- * Simple page 1000, offset 511:<br>
- *=C2=A0 Input (1, 1000, 511), Output 0x3E81FF<br>
- * Extended page 0, offset 32:<br>
- *=C2=A0 Input (0, 0, 32), Output 0x8000000020<br>
- * Extended page 1000, offset 511:<br>
- *=C2=A0 Input (0, 1000, 511), Output 0x8003E81FF<br>
- */<br>
-static ulong gasket_components_to_dev_address(struct gasket_page_table *pg=
_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int is_simple, uint page_index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint offset)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong dev_addr =3D (page_index &lt;&lt; GASKET_=
SIMPLE_PAGE_SHIFT) | offset;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return is_simple ? dev_addr : (pg_tbl-&gt;exten=
ded_flag | dev_addr);<br>
-}<br>
-<br>
-/*<br>
- * Validity checking for simple addresses.<br>
- *<br>
- * Verify that address translation commutes (from address to/from page + o=
ffset)<br>
- * and that the requested page range starts and ends within the set of<br>
- * currently-partitioned simple pages.<br>
- */<br>
-static bool gasket_is_simple_dev_addr_bad(struct gasket_page_table *pg_tbl=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ul=
ong dev_addr, uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong page_offset =3D dev_addr &amp; (PAGE_SIZE=
 - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong page_index =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(dev_addr / PAGE_SI=
ZE) &amp; (pg_tbl-&gt;config.total_entries - 1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_components_to_dev_address(pg_tbl, 1,=
 page_index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 page_offset) !=3D dev_addr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device, &quot;address is invalid, 0x%lX\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (page_index &gt;=3D pg_tbl-&gt;num_simple_en=
tries) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;starting slot at %lu is too large, max is &lt; %u\n&quot;,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0page_index, pg_tbl-&gt;num_simple_entries);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (page_index + num_pages &gt; pg_tbl-&gt;num_=
simple_entries) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;ending slot at %lu is too large, max is &lt;=3D %u\n&quot;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0page_index + num_pages, pg_tbl-&gt;num_simple_entries);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-}<br>
-<br>
-/*<br>
- * Validity checking for extended addresses.<br>
- *<br>
- * Verify that address translation commutes (from address to/from page +<b=
r>
- * offset) and that the requested page range starts and ends within the se=
t of<br>
- * currently-partitioned extended pages.<br>
- */<br>
-static bool gasket_is_extended_dev_addr_bad(struct gasket_page_table *pg_t=
bl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ulong dev_addr, uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Starting byte index of dev_addr into the fir=
st mapped page */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong page_offset =3D dev_addr &amp; (PAGE_SIZE=
 - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong page_global_idx, page_lvl0_idx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong num_lvl0_pages;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong addr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* check if the device address is out of bound =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D dev_addr &amp; ~((pg_tbl)-&gt;extended=
_flag);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr &gt;&gt; (GASKET_EXTENDED_LVL0_WIDTH +=
 GASKET_EXTENDED_LVL0_SHIFT)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device, &quot;device address out of bounds: 0x%lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find the starting sub-page index in the spac=
e of all sub-pages. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0page_global_idx =3D (dev_addr / PAGE_SIZE) &amp=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pg_tbl-&gt;config.=
total_entries * GASKET_PAGES_PER_SUBTABLE - 1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find the starting level 0 index. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0page_lvl0_idx =3D gasket_extended_lvl0_page_idx=
(pg_tbl, dev_addr);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get the count of affected level 0 pages. */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0num_lvl0_pages =3D DIV_ROUND_UP(num_pages, GASK=
ET_PAGES_PER_SUBTABLE);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_components_to_dev_address(pg_tbl, 0,=
 page_global_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 page_offset) !=3D dev_addr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device, &quot;address is invalid: 0x%lx\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (page_lvl0_idx &gt;=3D pg_tbl-&gt;num_extend=
ed_entries) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;starting level 0 slot at %lu is too large, max is &lt; %u\n=
&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0page_lvl0_idx, pg_tbl-&gt;num_extended_entries);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (page_lvl0_idx + num_lvl0_pages &gt; pg_tbl-=
&gt;num_extended_entries) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;ending level 0 slot at %lu is too large, max is &lt;=3D %u\=
n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0page_lvl0_idx + num_lvl0_pages,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pg_tbl-&gt;num_extended_entries);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-}<br>
-<br>
-/*<br>
- * Non-locking entry to unmapping routines.<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static void gasket_page_table_unmap_nolock(struct gasket_page_table *pg_tb=
l,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
long dev_addr, uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!num_pages)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_addr_is_simple(pg_tbl, dev_addr))<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_unmap_simple=
_pages(pg_tbl, dev_addr, num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_unmap_extend=
ed_pages(pg_tbl, dev_addr, num_pages);<br>
-}<br>
-<br>
-/*<br>
- * Allocate and map pages to simple addresses.<br>
- * If there is an error, no pages are mapped.<br>
- */<br>
-static int gasket_map_simple_pages(struct gasket_page_table *pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong host_addr, ulong dev_ad=
dr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint slot_idx =3D gasket_simple_page_idx(pg_tbl=
, dev_addr);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_alloc_simple_entries(pg_tbl, dev=
_addr, num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;page table slots %u (@ 0x%lx) to %u are not available\n&quo=
t;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0slot_idx, dev_addr, slot_idx + num_pages - 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_perform_mapping(pg_tbl, pg_tbl-&=
gt;entries + slot_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pg_tbl-&gt;base_slot +=
 slot_idx, host_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_pages, 1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_u=
nmap_nolock(pg_tbl, dev_addr, num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device, &quot;gasket_perform_mapping %d\n&quot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-<br>
-/*<br>
- * Allocate a second level page table.<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static int gasket_alloc_extended_subtable(struct gasket_page_table *pg_tbl=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct gasket_page_table_entry *pte,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u6=
4 __iomem *slot)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong page_addr, subtable_bytes;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_addr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX FIX ME XXX this is inefficient for non-4=
K page sizes */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* GFP_DMA flag must be passed to architectures=
 for which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * part of the memory range is not considered D=
MA&#39;able.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This seems to be the case for Juno board wit=
h 4.5.0 Linaro kernel<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0page_addr =3D get_zeroed_page(GFP_KERNEL | GFP_=
DMA);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!page_addr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte-&gt;page =3D virt_to_page((void *)page_addr=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte-&gt;offset =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0subtable_bytes =3D sizeof(struct gasket_page_ta=
ble_entry) *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_PAGES_PER_SU=
BTABLE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte-&gt;sublevel =3D vzalloc(subtable_bytes);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pte-&gt;sublevel) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_page(page_addr=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(pte, 0, size=
of(struct gasket_page_table_entry));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Map the page into DMA space. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte-&gt;dma_addr =3D dma_map_page(pg_tbl-&gt;de=
vice, pte-&gt;page, 0, PAGE_SIZE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_TO_DEVICE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dma_mapping_error(pg_tbl-&gt;device, pte-&g=
t;dma_addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_page(page_addr=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfree(pte-&gt;suble=
vel);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(pte, 0, size=
of(struct gasket_page_table_entry));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* make the addresses available to the device *=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr =3D (pte-&gt;dma_addr + pte-&gt;offset=
) | GASKET_VALID_SLOT_FLAG;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writeq(dma_addr, slot);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte-&gt;status =3D PTE_INUSE;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * Allocate slots in an extended page table.=C2=A0 Check to see if a range=
 of page<br>
- * table slots are available. If necessary, memory is allocated for second=
 level<br>
- * page tables.<br>
- *<br>
- * Note that memory for second level page tables is allocated as needed, b=
ut<br>
- * that memory is only freed on the final close=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 of the device file, when the<br>
- * page tables are repartitioned, or the device is removed.=C2=A0 If there=
 is an<br>
- * error or if the full range of slots is not available, any memory<br>
- * allocated for second level page tables remains allocated until final cl=
ose,<br>
- * repartition, or device removal.<br>
- *<br>
- * The page table mutex must be held by the caller.<br>
- */<br>
-static int gasket_alloc_extended_entries(struct gasket_page_table *pg_tbl,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong de=
v_addr, uint num_entries)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint remain, subtable_slot_idx, len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_entry *pte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 __iomem *slot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0remain =3D num_entries;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0subtable_slot_idx =3D gasket_extended_lvl1_page=
_idx(pg_tbl, dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte =3D pg_tbl-&gt;entries + pg_tbl-&gt;num_sim=
ple_entries +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_extended_lvl0_page_=
idx(pg_tbl, dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0slot =3D pg_tbl-&gt;base_slot + pg_tbl-&gt;num_=
simple_entries +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_extended_lvl0_page=
_idx(pg_tbl, dev_addr);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (remain &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D min(remain,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GASKET_PAGES_PER_SUBTABLE - subtable_slot_idx);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte-&gt;status =
=3D=3D PTE_FREE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D gasket_alloc_extended_subtable(pg_tbl, pte, slot);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;no =
memory for extended addr subtable\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!gasket_is_pte_range_free(pte-&gt;sublevel +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subtable_slot_idx, len))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remain -=3D len;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subtable_slot_idx =
=3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slot++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * gasket_map_extended_pages - Get and map buffers to extended addresses.<=
br>
- * If there is an error, no pages are mapped.<br>
- */<br>
-static int gasket_map_extended_pages(struct gasket_page_table *pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong host_addr, ulong=
 dev_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong dev_addr_end;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint slot_idx, remain, len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_entry *pte;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 __iomem *slot_base;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_alloc_extended_entries(pg_tbl, d=
ev_addr, num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_addr_end =3D de=
v_addr + (num_pages / PAGE_SIZE) - 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;page table slots (%lu,%lu) (@ 0x%lx) to (%lu,%lu) are not a=
vailable\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_extended_lvl0_page_idx(pg_tbl, dev_addr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_extended_lvl1_page_idx(pg_tbl, dev_addr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_extended_lvl0_page_idx(pg_tbl, dev_addr_end),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_extended_lvl1_page_idx(pg_tbl, dev_addr_end));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0remain =3D num_pages;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0slot_idx =3D gasket_extended_lvl1_page_idx(pg_t=
bl, dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pte =3D pg_tbl-&gt;entries + pg_tbl-&gt;num_sim=
ple_entries +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_extended_lvl0_page_=
idx(pg_tbl, dev_addr);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (remain &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D min(remain,=
 GASKET_PAGES_PER_SUBTABLE - slot_idx);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slot_base =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(u64 __iomem *)(page_address(pte-&gt;page) + pte-&gt;offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_perf=
orm_mapping(pg_tbl, pte-&gt;sublevel + slot_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 slot_base + slot_idx, host_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 len, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gasket_page_table_unmap_nolock(pg_tbl, dev_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remain -=3D len;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slot_idx =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_addr +=3D len =
* PAGE_SIZE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/*<br>
- * See gasket_page_table.h for general description.<br>
- *<br>
- * gasket_page_table_map calls either gasket_map_simple_pages() or<br>
- * gasket_map_extended_pages() to actually perform the mapping.<br>
- *<br>
- * The page table mutex is held for the entire operation.<br>
- */<br>
-int gasket_page_table_map(struct gasket_page_table *pg_tbl, ulong host_add=
r,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ulong dev_addr, uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!num_pages)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;pg_tbl-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_addr_is_simple(pg_tbl, dev_addr)) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_map_=
simple_pages(pg_tbl, host_addr, dev_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gasket_map_=
extended_pages(pg_tbl, host_addr, dev_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_map);<br>
-<br>
-/*<br>
- * See gasket_page_table.h for general description.<br>
- *<br>
- * gasket_page_table_unmap takes the page table lock and calls either<br>
- * gasket_unmap_simple_pages() or gasket_unmap_extended_pages() to<br>
- * actually unmap the pages from device space.<br>
- *<br>
- * The page table mutex is held for the entire operation.<br>
- */<br>
-void gasket_page_table_unmap(struct gasket_page_table *pg_tbl, ulong dev_a=
ddr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uint num_pages)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!num_pages)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_unmap_nolock(pg_tbl, dev_addr=
, num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_unmap);<br>
-<br>
-static void gasket_page_table_unmap_all_nolock(struct gasket_page_table *p=
g_tbl)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_unmap_simple_pages(pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_components_to_dev_addre=
ss(pg_tbl, 1, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_simple_entries)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_unmap_extended_pages(pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_components_to_de=
v_address(pg_tbl, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0, 0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;num_extended=
_entries *<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GASKET_PAGES_PER_SUBTAB=
LE);<br>
-}<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-void gasket_page_table_unmap_all(struct gasket_page_table *pg_tbl)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_unmap_all_nolock(pg_tbl);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_unmap_all);<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-void gasket_page_table_reset(struct gasket_page_table *pg_tbl)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_page_table_unmap_all_nolock(pg_tbl);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writeq(pg_tbl-&gt;config.total_entries, pg_tbl-=
&gt;extended_offset_reg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-}<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-int gasket_page_table_lookup_page(struct gasket_page_table *pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong dev_addr, struct page **=
ppage,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong *poffset)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint page_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table_entry *pte;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_addr_is_simple(pg_tbl, dev_addr)) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_num =3D gasket=
_simple_page_idx(pg_tbl, dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (page_num &gt;=
=3D pg_tbl-&gt;num_simple_entries)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte =3D pg_tbl-&gt;=
entries + page_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte-&gt;status =
!=3D PTE_INUSE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find the level 0=
 entry, */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_num =3D gasket=
_extended_lvl0_page_idx(pg_tbl, dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (page_num &gt;=
=3D pg_tbl-&gt;num_extended_entries)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte =3D pg_tbl-&gt;=
entries + pg_tbl-&gt;num_simple_entries + page_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte-&gt;status =
!=3D PTE_INUSE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* and its containe=
d level 1 entry. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_num =3D gasket=
_extended_lvl1_page_idx(pg_tbl, dev_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte =3D pte-&gt;sub=
level + page_num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pte-&gt;status =
!=3D PTE_INUSE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*ppage =3D pte-&gt;page;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*poffset =3D pte-&gt;offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-fail:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*ppage =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*poffset =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pg_tbl-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-}<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-bool gasket_page_table_are_addrs_bad(struct gasket_page_table *pg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong host_addr, ulong=
 dev_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong bytes)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (host_addr &amp; (PAGE_SIZE - 1)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;host mapping address 0x%lx must be page aligned\n&quot;,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0host_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_page_table_is_dev_addr_bad(pg_tbl=
, dev_addr, bytes);<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_are_addrs_bad);<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-bool gasket_page_table_is_dev_addr_bad(struct gasket_page_table *pg_tbl,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong dev_addr,=
 ulong bytes)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint num_pages =3D bytes / PAGE_SIZE;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bytes &amp; (PAGE_SIZE - 1)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;mapping size 0x%lX must be page aligned\n&quot;, bytes);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_pages =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pg_tbl-&gt;=
device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;requested mapping is less than one page: %lu / %lu\n&quot;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bytes, PAGE_SIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_addr_is_simple(pg_tbl, dev_addr))<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_is_si=
mple_dev_addr_bad(pg_tbl, dev_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return gasket_is_extended_dev_addr_bad(pg_tbl, =
dev_addr, num_pages);<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_is_dev_addr_bad);<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-uint gasket_page_table_max_size(struct gasket_page_table *page_table)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!page_table)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return page_table-&gt;config.total_entries;<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_max_size);<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-uint gasket_page_table_num_entries(struct gasket_page_table *pg_tbl)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pg_tbl)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return pg_tbl-&gt;num_simple_entries + pg_tbl-&=
gt;num_extended_entries;<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_num_entries);<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-uint gasket_page_table_num_simple_entries(struct gasket_page_table *pg_tbl=
)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pg_tbl)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return pg_tbl-&gt;num_simple_entries;<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_num_simple_entries);<br>
-<br>
-/* See gasket_page_table.h for description. */<br>
-uint gasket_page_table_num_active_pages(struct gasket_page_table *pg_tbl)<=
br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pg_tbl)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return pg_tbl-&gt;num_active_pages;<br>
-}<br>
-EXPORT_SYMBOL(gasket_page_table_num_active_pages);<br>
-<br>
-/* See gasket_page_table.h */<br>
-int gasket_page_table_system_status(struct gasket_page_table *page_table)<=
br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!page_table)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GASKET_STATU=
S_LAMED;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_page_table_num_entries(page_table) =
=3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(page_table-=
&gt;device, &quot;Page table size is 0\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return GASKET_STATU=
S_LAMED;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return GASKET_STATUS_ALIVE;<br>
-}<br>
-<br>
-/* Record the host_addr to coherent dma memory mapping. */<br>
-int gasket_set_user_virt(struct gasket_dev *gasket_dev, u64 size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dma_addr_t dma_address, ulong vma)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int j;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_page_table *pg_tbl;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int num_pages =3D size / PAGE_SIZE;<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * TODO: for future chipset, better handling of=
 the case where multiple<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * page tables are supported on a given device<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl =3D gasket_dev-&gt;page_table[0];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pg_tbl) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(gasket_dev-=
&gt;dev, &quot;%s: invalid page table index\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__func__);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; num_pages; j++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pg_tbl-&gt;coherent=
_pages[j].user_virt =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(u64)vma + j * PAGE_SIZE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Allocate a block of coherent memory. */<br>
-int gasket_alloc_coherent_memory(struct gasket_dev *gasket_dev, u64 size,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_addr_t *dma_address, u64 index)<=
br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t handle;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void *mem;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int j;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int num_pages =3D DIV_ROUND_UP(size, P=
AGE_SIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc =
=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_get_driver_d=
esc(gasket_dev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev-&gt;page_table[index])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_pages =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mem =3D dma_alloc_coherent(gasket_get_device(ga=
sket_dev),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_pages * PAGE_SIZE, &amp;handle, =
GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mem)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto nomem;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;page_table[index]-&gt;num_cohere=
nt_pages =3D num_pages;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* allocate the physical memory block */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;page_table[index]-&gt;coherent_p=
ages =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kcalloc(num_pages,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sizeof(*gasket_dev-&gt;page_table[index]-&gt;coherent_pages),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev-&gt;page_table[index]-&gt;coher=
ent_pages)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto nomem;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer.length_bytes =3D=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_SIZE * (num_pa=
ges);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer.phys_base =3D ha=
ndle;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer.virt_base =3D me=
m;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*dma_address =3D driver_desc-&gt;coherent_buffe=
r_description.base;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; num_pages; j++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;page=
_table[index]-&gt;coherent_pages[j].paddr =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0handle + j * PAGE_SIZE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;page=
_table[index]-&gt;coherent_pages[j].kernel_virt =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(u64)mem + j * PAGE_SIZE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-nomem:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mem) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_free_coherent(g=
asket_get_device(gasket_dev),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_pages * PAGE_SIZE, mem, ha=
ndle);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.length_bytes =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.virt_base =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.phys_base =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(gasket_dev-&gt;page_table[index]-&gt;cohe=
rent_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;page_table[index]-&gt;coherent_p=
ages =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;page_table[index]-&gt;num_cohere=
nt_pages =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-}<br>
-<br>
-/* Free a block of coherent memory. */<br>
-int gasket_free_coherent_memory(struct gasket_dev *gasket_dev, u64 size,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_address, u64 index)<br=
>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_driver_desc *driver_desc;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev-&gt;page_table[index])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0driver_desc =3D gasket_get_driver_desc(gasket_d=
ev);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver_desc-&gt;coherent_buffer_description=
.base !=3D dma_address)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EADDRNOTAVA=
IL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_dev-&gt;coherent_buffer.length_bytes=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_free_coherent(g=
asket_get_device(gasket_dev),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer=
.length_bytes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer=
.virt_base,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer=
.phys_base);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.length_bytes =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.virt_base =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.phys_base =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(gasket_dev-&gt;page_table[index]-&gt;cohe=
rent_pages);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;page_table[index]-&gt;coherent_p=
ages =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;page_table[index]-&gt;num_cohere=
nt_pages =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-/* Release all coherent memory. */<br>
-void gasket_free_coherent_memory_all(struct gasket_dev *gasket_dev, u64 in=
dex)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev-&gt;page_table[index])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_dev-&gt;coherent_buffer.length_bytes=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_free_coherent(g=
asket_get_device(gasket_dev),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer=
.length_bytes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer=
.virt_base,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;coherent_buffer=
.phys_base);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.length_bytes =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.virt_base =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev-&gt;cohe=
rent_buffer.phys_base =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
diff --git a/drivers/staging/gasket/gasket_page_table.h b/drivers/staging/g=
asket/gasket_page_table.h<br>
deleted file mode 100644<br>
index 7b01b73ea3e7..000000000000<br>
--- a/drivers/staging/gasket/gasket_page_table.h<br>
+++ /dev/null<br>
@@ -1,249 +0,0 @@<br>
-/* SPDX-License-Identifier: GPL-2.0 */<br>
-/*<br>
- * Gasket Page Table functionality. This file describes the address<br>
- * translation/paging functionality supported by the Gasket driver framewo=
rk.<br>
- * As much as possible, internal details are hidden to simplify use -<br>
- * all calls are thread-safe (protected by an internal mutex) except where=
<br>
- * indicated otherwise.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-<br>
-#ifndef __GASKET_PAGE_TABLE_H__<br>
-#define __GASKET_PAGE_TABLE_H__<br>
-<br>
-#include &lt;linux/pci.h&gt;<br>
-#include &lt;linux/types.h&gt;<br>
-<br>
-#include &quot;gasket_constants.h&quot;<br>
-#include &quot;gasket_core.h&quot;<br>
-<br>
-/*<br>
- * Structure used for managing address translation on a device. All detail=
s are<br>
- * internal to the implementation.<br>
- */<br>
-struct gasket_page_table;<br>
-<br>
-/*<br>
- * Allocate and init address translation data.<br>
- * @ppage_table: Pointer to Gasket page table pointer. Set by this call.<b=
r>
- * @att_base_reg: [Mapped] pointer to the first entry in the device&#39;s =
address<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 translation tabl=
e.<br>
- * @extended_offset_reg: [Mapped] pointer to the device&#39;s register con=
taining<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0the starting index of the extended translation table.<br>
- * @extended_bit_location: The index of the bit indicating whether an addr=
ess<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0is extended.<br>
- * @total_entries: The total number of entries in the device&#39;s address=
<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0translatio=
n table.<br>
- * @device: Device structure for the underlying device. Only used for logg=
ing.<br>
- * @pci_dev: PCI system descriptor for the underlying device.<br>
- * whether the driver will supply its own.<br>
- *<br>
- * Description: Allocates and initializes data to track address translatio=
n -<br>
- * simple and extended page table metadata. Initially, the page table is<b=
r>
- * partitioned such that all addresses are &quot;simple&quot; (single-leve=
l lookup).<br>
- * gasket_partition_page_table can be called to change this paritioning.<b=
r>
- *<br>
- * Returns 0 on success, a negative error code otherwise.<br>
- */<br>
-int gasket_page_table_init(struct gasket_page_table **ppg_tbl,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct gasket_bar_data *bar_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct gasket_page_table_config *page_table_config,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct device *device, struct pci_dev *pci_dev);<br>
-<br>
-/*<br>
- * Deallocate and cleanup page table data.<br>
- * @page_table: Gasket page table pointer.<br>
- *<br>
- * Description: The inverse of gasket_init; frees page_table and its conta=
ined<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elements.<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Because this call destro=
ys the page table, it cannot be<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thread-safe (mutex-prote=
cted)!<br>
- */<br>
-void gasket_page_table_cleanup(struct gasket_page_table *page_table);<br>
-<br>
-/*<br>
- * Sets the size of the simple page table.<br>
- * @page_table: Gasket page table pointer.<br>
- * @num_simple_entries: Desired size of the simple page table (in entries)=
.<br>
- *<br>
- * Description: gasket_partition_page_table checks to see if the simple pa=
ge<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size can be changed (i.=
e., if there are no active extended<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings in the new sim=
ple size range), and, if so,<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sets the new simple and=
 extended page table sizes.<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Returns 0 if successful=
, or non-zero if the page table entries<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 are not free.<br>
- */<br>
-int gasket_page_table_partition(struct gasket_page_table *page_table,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint num_simple_entries);<br>
-<br>
-/*<br>
- * Get and map [host] user space pages into device memory.<br>
- * @page_table: Gasket page table pointer.<br>
- * @host_addr: Starting host virtual memory address of the pages.<br>
- * @dev_addr: Starting device address of the pages.<br>
- * @num_pages: Number of [4kB] pages to map.<br>
- *<br>
- * Description: Maps the &quot;num_pages&quot; pages of host memory pointe=
d to by<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_addr to the addres=
s &quot;dev_addr&quot; in device memory.<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The caller is responsib=
le for checking the addresses ranges.<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Returns 0 if successful=
 or a non-zero error number otherwise.<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If there is an error, n=
o pages are mapped.<br>
- */<br>
-int gasket_page_table_map(struct gasket_page_table *page_table, ulong host=
_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ulong dev_addr, uint num_pages);<br>
-<br>
-/*<br>
- * Un-map host pages from device memory.<br>
- * @page_table: Gasket page table pointer.<br>
- * @dev_addr: Starting device address of the pages to unmap.<br>
- * @num_pages: The number of [4kB] pages to unmap.<br>
- *<br>
- * Description: The inverse of gasket_map_pages. Unmaps pages from the dev=
ice.<br>
- */<br>
-void gasket_page_table_unmap(struct gasket_page_table *page_table,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ulong dev_addr, uint num_pages);<br>
-<br>
-/*<br>
- * Unmap ALL host pages from device memory.<br>
- * @page_table: Gasket page table pointer.<br>
- */<br>
-void gasket_page_table_unmap_all(struct gasket_page_table *page_table);<br=
>
-<br>
-/*<br>
- * Unmap all host pages from device memory and reset the table to fully si=
mple<br>
- * addressing.<br>
- * @page_table: Gasket page table pointer.<br>
- */<br>
-void gasket_page_table_reset(struct gasket_page_table *page_table);<br>
-<br>
-/*<br>
- * Reclaims unused page table memory.<br>
- * @page_table: Gasket page table pointer.<br>
- *<br>
- * Description: Examines the page table and frees any currently-unused<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allocations. Called int=
ernally on gasket_cleanup().<br>
- */<br>
-void gasket_page_table_garbage_collect(struct gasket_page_table *page_tabl=
e);<br>
-<br>
-/*<br>
- * Retrieve the backing page for a device address.<br>
- * @page_table: Gasket page table pointer.<br>
- * @dev_addr: Gasket device address.<br>
- * @ppage: Pointer to a page pointer for the returned page.<br>
- * @poffset: Pointer to an unsigned long for the returned offset.<br>
- *<br>
- * Description: Interprets the address and looks up the corresponding page=
<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in the page table and t=
he offset in that page.=C2=A0 (We need an<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset because the host=
 page may be larger than the Gasket chip<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page it contains.)<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Returns 0 if successful=
, -1 for an error.=C2=A0 The page pointer<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and offset are returned=
 through the pointers, if successful.<br>
- */<br>
-int gasket_page_table_lookup_page(struct gasket_page_table *page_table,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong dev_addr, struct page **=
page,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ulong *poffset);<br>
-<br>
-/*<br>
- * Checks validity for input addrs and size.<br>
- * @page_table: Gasket page table pointer.<br>
- * @host_addr: Host address to check.<br>
- * @dev_addr: Gasket device address.<br>
- * @bytes: Size of the range to check (in bytes).<br>
- *<br>
- * Description: This call performs a number of checks to verify that the r=
anges<br>
- * specified by both addresses and the size are valid for mapping pages in=
to<br>
- * device memory.<br>
- *<br>
- * Returns true if the mapping is bad, false otherwise.<br>
- */<br>
-bool gasket_page_table_are_addrs_bad(struct gasket_page_table *page_table,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong host_addr, ulong=
 dev_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong bytes);<br>
-<br>
-/*<br>
- * Checks validity for input dev addr and size.<br>
- * @page_table: Gasket page table pointer.<br>
- * @dev_addr: Gasket device address.<br>
- * @bytes: Size of the range to check (in bytes).<br>
- *<br>
- * Description: This call performs a number of checks to verify that the r=
ange<br>
- * specified by the device address and the size is valid for mapping pages=
 into<br>
- * device memory.<br>
- *<br>
- * Returns true if the address is bad, false otherwise.<br>
- */<br>
-bool gasket_page_table_is_dev_addr_bad(struct gasket_page_table *page_tabl=
e,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong dev_addr,=
 ulong bytes);<br>
-<br>
-/*<br>
- * Gets maximum size for the given page table.<br>
- * @page_table: Gasket page table pointer.<br>
- */<br>
-uint gasket_page_table_max_size(struct gasket_page_table *page_table);<br>
-<br>
-/*<br>
- * Gets the total number of entries in the arg.<br>
- * @page_table: Gasket page table pointer.<br>
- */<br>
-uint gasket_page_table_num_entries(struct gasket_page_table *page_table);<=
br>
-<br>
-/*<br>
- * Gets the number of simple entries.<br>
- * @page_table: Gasket page table pointer.<br>
- */<br>
-uint gasket_page_table_num_simple_entries(struct gasket_page_table *page_t=
able);<br>
-<br>
-/*<br>
- * Gets the number of actively pinned pages.<br>
- * @page_table: Gasket page table pointer.<br>
- */<br>
-uint gasket_page_table_num_active_pages(struct gasket_page_table *page_tab=
le);<br>
-<br>
-/*<br>
- * Get status of page table managed by @page_table.<br>
- * @page_table: Gasket page table pointer.<br>
- */<br>
-int gasket_page_table_system_status(struct gasket_page_table *page_table);=
<br>
-<br>
-/*<br>
- * Allocate a block of coherent memory.<br>
- * @gasket_dev: Gasket Device.<br>
- * @size: Size of the memory block.<br>
- * @dma_address: Dma address allocated by the kernel.<br>
- * @index: Index of the gasket_page_table within this Gasket device<br>
- *<br>
- * Description: Allocate a contiguous coherent memory block, DMA&#39;ble<b=
r>
- * by this device.<br>
- */<br>
-int gasket_alloc_coherent_memory(struct gasket_dev *gasket_dev, uint64_t s=
ize,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_addr_t *dma_address, uint64_t in=
dex);<br>
-/* Release a block of contiguous coherent memory, in use by a device. */<b=
r>
-int gasket_free_coherent_memory(struct gasket_dev *gasket_dev, uint64_t si=
ze,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_address, uint64_t inde=
x);<br>
-<br>
-/* Release all coherent memory. */<br>
-void gasket_free_coherent_memory_all(struct gasket_dev *gasket_dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t index);<br>
-<br>
-/*<br>
- * Records the host_addr to coherent dma memory mapping.<br>
- * @gasket_dev: Gasket Device.<br>
- * @size: Size of the virtual address range to map.<br>
- * @dma_address: Dma address within the coherent memory range.<br>
- * @vma: Virtual address we wish to map to coherent memory.<br>
- *<br>
- * Description: For each page in the virtual address range, record the<br>
- * coherent page mapping.<br>
- *<br>
- * Does not perform validity checking.<br>
- */<br>
-int gasket_set_user_virt(struct gasket_dev *gasket_dev, uint64_t size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dma_addr_t dma_address, ulong vma);<br>
-<br>
-#endif=C2=A0 /* __GASKET_PAGE_TABLE_H__ */<br>
diff --git a/drivers/staging/gasket/gasket_sysfs.c b/drivers/staging/gasket=
/gasket_sysfs.c<br>
deleted file mode 100644<br>
index c5658fdf4d28..000000000000<br>
--- a/drivers/staging/gasket/gasket_sysfs.c<br>
+++ /dev/null<br>
@@ -1,398 +0,0 @@<br>
-// SPDX-License-Identifier: GPL-2.0<br>
-/* Copyright (C) 2018 Google, Inc. */<br>
-#include &quot;gasket_sysfs.h&quot;<br>
-<br>
-#include &quot;gasket_core.h&quot;<br>
-<br>
-#include &lt;linux/device.h&gt;<br>
-#include &lt;linux/printk.h&gt;<br>
-<br>
-/*<br>
- * Pair of kernel device and user-specified pointer. Used in lookups in sy=
sfs<br>
- * &quot;show&quot; functions to return user data.<br>
- */<br>
-<br>
-struct gasket_sysfs_mapping {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The device bound to this mapping. If this is=
 NULL, then this mapping<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is free.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *device;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The Gasket descriptor for this device. */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This device&#39;s set of sysfs attributes/no=
des. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_attribute *attributes;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The number of live elements in &quot;attribu=
tes&quot;. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int attribute_count;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Protects structure from simultaneous access.=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex mutex;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Tracks active users of this mapping. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct kref refcount;<br>
-};<br>
-<br>
-/*<br>
- * Data needed to manage users of this sysfs utility.<br>
- * Currently has a fixed size; if space is a concern, this can be dynamica=
lly<br>
- * allocated.<br>
- */<br>
-/*<br>
- * &#39;Global&#39; (file-scoped) list of mappings between devices and gas=
ket_data<br>
- * pointers. This removes the requirement to have a gasket_sysfs_data<br>
- * handle in all files.<br>
- */<br>
-static struct gasket_sysfs_mapping dev_mappings[GASKET_SYSFS_NUM_MAPPINGS]=
;<br>
-<br>
-/* Callback when a mapping&#39;s refcount goes to zero. */<br>
-static void release_entry(struct kref *ref)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* All work is done after the return from kref_=
put. */<br>
-}<br>
-<br>
-/* Look up mapping information for the given device. */<br>
-static struct gasket_sysfs_mapping *get_mapping(struct device *device)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_SYSFS_NUM_MAPPINGS;=
 i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;dev=
_mappings[i].mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dev_mappings[i]=
.device =3D=3D device) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kref_get(&amp;dev_mappings[i].refcount);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;dev_mappings[i].mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return &amp;dev_mappings[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;d=
ev_mappings[i].mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device, &quot;%s: Mapping to device %s =
not found\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, device-&g=
t;<a href=3D"http://kobj.name" rel=3D"noreferrer" target=3D"_blank">kobj.na=
me</a>);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-}<br>
-<br>
-/* Put a reference to a mapping. */<br>
-static void put_mapping(struct gasket_sysfs_mapping *mapping)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_files_to_remove =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *files_to_remove;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *device;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s: =
Mapping should not be NULL\n&quot;, __func__);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;mapping-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kref_put(&amp;mapping-&gt;refcount, release=
_entry)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(mapping-&gt=
;device, &quot;Removing Gasket sysfs mapping\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We can&#39;t rem=
ove the sysfs nodes in the kref callback, since<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * device_remove_fi=
le() blocks until the node is free.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Readers/writers =
of sysfs nodes, though, will be blocked on<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the mapping mute=
x, resulting in deadlock. To fix this, the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * sysfs nodes are =
removed outside the lock.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device =3D mapping-=
&gt;device;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_files_to_remove=
 =3D mapping-&gt;attribute_count;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files_to_remove =3D=
 kcalloc(num_files_to_remove,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si=
zeof(*files_to_remove),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GF=
P_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (files_to_remove=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for (i =3D 0; i &lt; num_files_to_remove; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files_to_remove[i] =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;attributes[=
i].attr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0num_files_to_remove =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(mapping-&gt;a=
ttributes);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;attribu=
tes =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;attribu=
te_count =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_device(mapping-=
&gt;device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;device =
=3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;gasket_=
dev =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mapping-&gt;mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_files_to_remove !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; num_files_to_remove; ++i)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0device_remove_file(device, &amp;files_to_remove[i]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(files_to_remo=
ve);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-<br>
-/*<br>
- * Put a reference to a mapping N times.<br>
- *<br>
- * In higher-level resource acquire/release function pairs, the release fu=
nction<br>
- * will need to release a mapping 2x - once for the refcount taken in the<=
br>
- * release function itself, and once for the count taken in the acquire ca=
ll.<br>
- */<br>
-static void put_mapping_n(struct gasket_sysfs_mapping *mapping, int times)=
<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; times; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping(mapping=
);<br>
-}<br>
-<br>
-void gasket_sysfs_init(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; GASKET_SYSFS_NUM_MAPPINGS;=
 i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_mappings[i].dev=
ice =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;dev=
_mappings[i].mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
-<br>
-int gasket_sysfs_create_mapping(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_mapping *mapping;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int map_idx =3D -1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * We need a function-level mutex to protect ag=
ainst the same device<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * being added [multiple times] simultaneously.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0static DEFINE_MUTEX(function_mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;function_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device, &quot;Creating sysfs entries fo=
r device\n&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that the device we&#39;re adding hasn&=
#39;t already been added. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping =3D get_mapping(device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mapping) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Attempting to re-initialize sysfs mapping for device\n&quot=
;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping(mapping=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;f=
unction_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find the first empty entry in the array. */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (map_idx =3D 0; map_idx &lt; GASKET_SYSFS_N=
UM_MAPPINGS; ++map_idx) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;dev=
_mappings[map_idx].mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dev_mappings[m=
ap_idx].device)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Break with the mutex held! */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;d=
ev_mappings[map_idx].mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (map_idx =3D=3D GASKET_SYSFS_NUM_MAPPINGS) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &qu=
ot;All mappings have been exhausted\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;f=
unction_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device, &quot;Creating sysfs mapping fo=
r device %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device-&gt;<a href=
=3D"http://kobj.name" rel=3D"noreferrer" target=3D"_blank">kobj.name</a>);<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping =3D &amp;dev_mappings[map_idx];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;attributes =3D kcalloc(GASKET_SYSFS=
_MAX_NODES,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*mapping-=
&gt;attributes),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping-&gt;attributes) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device, &qu=
ot;Unable to allocate sysfs attribute array\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;m=
apping-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;f=
unction_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kref_init(&amp;mapping-&gt;refcount);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;device =3D get_device(device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;gasket_dev =3D gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;attribute_count =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mapping-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;function_mutex);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t decrement the refcount here! One o=
pen count keeps it alive! */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-<br>
-int gasket_sysfs_create_entries(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_sysfs_attribute *=
attrs)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_mapping *mapping =3D get_ma=
pping(device);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Creating entries for device without first initializing mapp=
ing\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;mapping-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; attrs[i].<a href=3D"http://attr.a=
ttr.name" rel=3D"noreferrer" target=3D"_blank">attr.attr.name</a>; i++) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mapping-&gt;att=
ribute_count =3D=3D GASKET_SYSFS_MAX_NODES) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Maximum number of sysfs nodes r=
eached for device\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;mapping-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0put_mapping(mapping);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D device_crea=
te_file(device, &amp;attrs[i].attr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_dbg(device, &quot;Unable to create device entries\n&quot;);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;mapping-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0put_mapping(mapping);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;attribu=
tes[mapping-&gt;attribute_count] =3D attrs[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++mapping-&gt;attri=
bute_count;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mapping-&gt;mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping(mapping);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-}<br>
-EXPORT_SYMBOL(gasket_sysfs_create_entries);<br>
-<br>
-void gasket_sysfs_remove_mapping(struct device *device)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_mapping *mapping =3D get_ma=
pping(device);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Attempted to remove non-existent sysfs mapping to device\n&=
quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping_n(mapping, 2);<br>
-}<br>
-<br>
-struct gasket_dev *gasket_sysfs_get_device_data(struct device *device)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_mapping *mapping =3D get_ma=
pping(device);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &qu=
ot;device not registered\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return mapping-&gt;gasket_dev;<br>
-}<br>
-EXPORT_SYMBOL(gasket_sysfs_get_device_data);<br>
-<br>
-void gasket_sysfs_put_device_data(struct device *device, struct gasket_dev=
 *dev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_mapping *mapping =3D get_ma=
pping(device);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* See comment of put_mapping_n() for why the &=
#39;2&#39; is necessary. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping_n(mapping, 2);<br>
-}<br>
-EXPORT_SYMBOL(gasket_sysfs_put_device_data);<br>
-<br>
-struct gasket_sysfs_attribute *<br>
-gasket_sysfs_get_attr(struct device *device, struct device_attribute *attr=
)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_attrs;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_mapping *mapping =3D get_ma=
pping(device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_attribute *attrs =3D NULL;<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0attrs =3D mapping-&gt;attributes;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0num_attrs =3D mapping-&gt;attribute_count;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_attrs; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(attrs[i=
].<a href=3D"http://attr.attr.name" rel=3D"noreferrer" target=3D"_blank">at=
tr.attr.name</a>, attr-&gt;<a href=3D"http://attr.name" rel=3D"noreferrer" =
target=3D"_blank">attr.name</a>))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return &amp;attrs[i];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &quot;Unable to find match for =
device_attribute %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr-&gt;<a href=3D=
"http://attr.name" rel=3D"noreferrer" target=3D"_blank">attr.name</a>);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-}<br>
-EXPORT_SYMBOL(gasket_sysfs_get_attr);<br>
-<br>
-void gasket_sysfs_put_attr(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct gasket_sysfs_attribute *attr)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int num_attrs;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_mapping *mapping =3D get_ma=
pping(device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_attribute *attrs =3D NULL;<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0attrs =3D mapping-&gt;attributes;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0num_attrs =3D mapping-&gt;attribute_count;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_attrs; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (&amp;attrs[i] =
=3D=3D attr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0put_mapping_n(mapping, 2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &quot;Unable to put unknown att=
ribute: %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attr-&gt;<a href=3D=
"http://attr.attr.name" rel=3D"noreferrer" target=3D"_blank">attr.attr.name=
</a>);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping(mapping);<br>
-}<br>
-EXPORT_SYMBOL(gasket_sysfs_put_attr);<br>
-<br>
-ssize_t gasket_sysfs_register_store(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute=
 *attr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t=
 count)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ulong parsed_value =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_mapping *mapping;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_sysfs_attribute *gasket_attr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &lt; 3 || buf[0] !=3D &#39;0&#39; || =
buf[1] !=3D &#39;x&#39;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;sysfs register write format: \&quot;0x&lt;hex value&gt;\&qu=
ot;\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kstrtoul(buf, 16, &amp;parsed_value) !=3D 0=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Unable to parse input as 64-bit hex value: %s\n&quot;, buf)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping =3D get_mapping(device);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mapping) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &qu=
ot;Device driver may have been removed\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev =3D mapping-&gt;gasket_dev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_dev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(device, &qu=
ot;Device driver may have been removed\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping(mapping=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_attr =3D gasket_sysfs_get_attr(device, a=
ttr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gasket_attr) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping(mapping=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_dev_write_64(gasket_dev, parsed_value,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gasket_attr-&gt;data.bar_address.bar,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gasket_attr-&gt;data.bar_address.offset);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gasket_attr-&gt;write_callback)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_attr-&gt;wri=
te_callback(gasket_dev, gasket_attr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0parsed_value);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gasket_sysfs_put_attr(device, gasket_attr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0put_mapping(mapping);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
-}<br>
-EXPORT_SYMBOL(gasket_sysfs_register_store);<br>
diff --git a/drivers/staging/gasket/gasket_sysfs.h b/drivers/staging/gasket=
/gasket_sysfs.h<br>
deleted file mode 100644<br>
index d5e167dfbe76..000000000000<br>
--- a/drivers/staging/gasket/gasket_sysfs.h<br>
+++ /dev/null<br>
@@ -1,175 +0,0 @@<br>
-/* SPDX-License-Identifier: GPL-2.0 */<br>
-/*<br>
- * Set of common sysfs utilities.<br>
- *<br>
- * Copyright (C) 2018 Google, Inc.<br>
- */<br>
-<br>
-/* The functions described here are a set of utilities to allow each file =
in the<br>
- * Gasket driver framework to manage their own set of sysfs entries, inste=
ad of<br>
- * centralizing all that work in one file.<br>
- *<br>
- * The goal of these utilities is to allow for sysfs entries to be easily<=
br>
- * created without causing a proliferation of sysfs &quot;show&quot; funct=
ions. This<br>
- * requires O(N) string lookups during show function execution, but as rea=
ding<br>
- * sysfs entries is rarely performance-critical, this is likely acceptible=
.<br>
- */<br>
-#ifndef __GASKET_SYSFS_H__<br>
-#define __GASKET_SYSFS_H__<br>
-<br>
-#include &quot;gasket_constants.h&quot;<br>
-#include &quot;gasket_core.h&quot;<br>
-#include &lt;linux/device.h&gt;<br>
-#include &lt;linux/stringify.h&gt;<br>
-#include &lt;linux/sysfs.h&gt;<br>
-<br>
-/* The maximum number of mappings/devices a driver needs to support. */<br=
>
-#define GASKET_SYSFS_NUM_MAPPINGS (GASKET_FRAMEWORK_DESC_MAX * GASKET_DEV_=
MAX)<br>
-<br>
-/* The maximum number of sysfs nodes in a directory.<br>
- */<br>
-#define GASKET_SYSFS_MAX_NODES 196<br>
-<br>
-/*<br>
- * Terminator struct for a gasket_sysfs_attr array. Must be at the end of<=
br>
- * all gasket_sysfs_attribute arrays.<br>
- */<br>
-#define GASKET_END_OF_ATTR_ARRAY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.attr =3D __ATTR_NU=
LL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data.attr_type =3D=
 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-/*<br>
- * Pairing of sysfs attribute and user data.<br>
- * Used in lookups in sysfs &quot;show&quot; functions to return attribute=
 metadata.<br>
- */<br>
-struct gasket_sysfs_attribute {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The underlying sysfs device attribute associ=
ated with this data. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute attr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* User-specified data to associate with the at=
tribute. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0union {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bar_address_=
 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ulong bar;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ulong offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} bar_address;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint attr_type;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} data;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Function pointer to a callback to be invoked=
 when this attribute is<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * written (if so configured). The arguments ar=
e to the Gasket device<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * pointer, the enclosing gasket_attr structure=
, and the value written.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The callback should perform any logging nece=
ssary, as errors cannot<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * be returned from the callback.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*write_callback)(struct gasket_dev *dev,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gasket_sysfs_attribute *attr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong value);<br>
-};<br>
-<br>
-#define GASKET_SYSFS_RO(_name, _show_function, _attr_type)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.attr =3D __ATTR(_n=
ame, 0444, _show_function, NULL),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data.attr_type =3D=
 _attr_type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-/* Initializes the Gasket sysfs subsystem.<br>
- *<br>
- * Description: Performs one-time initialization. Must be called before us=
age<br>
- * at [Gasket] module load time.<br>
- */<br>
-void gasket_sysfs_init(void);<br>
-<br>
-/*<br>
- * Create an entry in mapping_data between a device and a Gasket device.<b=
r>
- * @device: Device struct to map to.<br>
- * @gasket_dev: The dev struct associated with the driver controlling @dev=
ice.<br>
- *<br>
- * Description: This function maps a gasket_dev* to a device*. This mappin=
g can<br>
- * be used in sysfs_show functions to get a handle to the gasket_dev struc=
t<br>
- * controlling the device node.<br>
- *<br>
- * If this function is not called before gasket_sysfs_create_entries, a wa=
rning<br>
- * will be logged.<br>
- */<br>
-int gasket_sysfs_create_mapping(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev);<br>
-<br>
-/*<br>
- * Creates bulk entries in sysfs.<br>
- * @device: Kernel device structure.<br>
- * @attrs: List of attributes/sysfs entries to create.<br>
- *<br>
- * Description: Creates each sysfs entry described in &quot;attrs&quot;. C=
an be called<br>
- * multiple times for a given @device. If the gasket_dev specified in<br>
- * gasket_sysfs_create_mapping had a legacy device, the entries will be cr=
eated<br>
- * for it, as well.<br>
- */<br>
-int gasket_sysfs_create_entries(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gasket_sysfs_attribute *=
attrs);<br>
-<br>
-/*<br>
- * Removes a device mapping from the global table.<br>
- * @device: Device to unmap.<br>
- *<br>
- * Description: Removes the device-&gt;Gasket device mapping from the inte=
rnal<br>
- * table.<br>
- */<br>
-void gasket_sysfs_remove_mapping(struct device *device);<br>
-<br>
-/*<br>
- * User data lookup based on kernel device structure.<br>
- * @device: Kernel device structure.<br>
- *<br>
- * Description: Returns the user data associated with &quot;device&quot; i=
n a prior call<br>
- * to gasket_sysfs_create_entries. Returns NULL if no mapping can be found=
.<br>
- * Upon success, this call take a reference to internal sysfs data that mu=
st be<br>
- * released with gasket_sysfs_put_device_data. While this reference is hel=
d, the<br>
- * underlying device sysfs information/structure will remain valid/will no=
t be<br>
- * deleted.<br>
- */<br>
-struct gasket_dev *gasket_sysfs_get_device_data(struct device *device);<br=
>
-<br>
-/*<br>
- * Releases a references to internal data.<br>
- * @device: Kernel device structure.<br>
- * @dev: Gasket device descriptor (returned by gasket_sysfs_get_device_dat=
a).<br>
- */<br>
-void gasket_sysfs_put_device_data(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gasket_dev *gasket_dev)=
;<br>
-<br>
-/*<br>
- * Gasket-specific attribute lookup.<br>
- * @device: Kernel device structure.<br>
- * @attr: Device attribute to look up.<br>
- *<br>
- * Returns the Gasket sysfs attribute associated with the kernel device<br=
>
- * attribute and device structure itself. Upon success, this call will tak=
e a<br>
- * reference to internal sysfs data that must be released with a call to<b=
r>
- * gasket_sysfs_put_attr. While this reference is held, the underlying dev=
ice<br>
- * sysfs information/structure will remain valid/will not be deleted.<br>
- */<br>
-struct gasket_sysfs_attribute *<br>
-gasket_sysfs_get_attr(struct device *device, struct device_attribute *attr=
);<br>
-<br>
-/*<br>
- * Releases a references to internal data.<br>
- * @device: Kernel device structure.<br>
- * @attr: Gasket sysfs attribute descriptor (returned by<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 gasket_sysfs_get_attr).<br>
- */<br>
-void gasket_sysfs_put_attr(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct gasket_sysfs_attribute *attr);<br>
-<br>
-/*<br>
- * Write to a register sysfs node.<br>
- * @buf: NULL-terminated data being written.<br>
- * @count: number of bytes in the &quot;buf&quot; argument.<br>
- */<br>
-ssize_t gasket_sysfs_register_store(struct device *device,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute=
 *attr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t=
 count);<br>
-<br>
-#endif /* __GASKET_SYSFS_H__ */<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000f9c87b05bd9575f7--
