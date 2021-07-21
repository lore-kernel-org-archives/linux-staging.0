Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C8F70
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 16:28:41 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u3so1215911plf.5
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oceMWhTM8pobryjzYykKcZBCBssTqtoQ2RDgOWPDaSM=;
        b=frQWdy6smOC4tSb8cgSKRfasM4BbzBm+CUpryiWZHxreVCh4LjOqnqk/OmBAiwygUy
         yADpoaAT5ZiXE5Bp/ekyYhT9pAh49FSsmAAoeWyviZGGlxXIOhIv7izEkJZttVsM2pA2
         BrWKePglp2+HHFoYfYpR5AXXJ82/YGaFHSZmf/zZFod+Ll+56zNuCJWr1rQbyEO/GuD8
         ZhSRbFXpfP792V7Y2f2jv8xydy2ksrimhs8iJEd6Oz8meLlqli8kYj0udk2HndpQCrlD
         enSkSNvnXEd/HqQVV8gYSM1+yoWyLUzxJ46vdamFZ4n+xoBRqq9LQzPYw1BlCtA+2yli
         15jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oceMWhTM8pobryjzYykKcZBCBssTqtoQ2RDgOWPDaSM=;
        b=bj9OKM5lArF+CUk8hkR71DwD2DrybBsWNC99epbWB1PklS2+zhxLpe8z86FcNZ5iVO
         Ta8qrSyszYoOmzZOw3Tp+kv877zo5OjUjUXYCrWyfGUGEmzo05ZIhRXX4o0Km9kgFd5/
         upDmB12ovbe+te1esaqEiDFdhy5M5knPITtSck3vm3DBhUGdKwMl/VVclsHLw1Sl3uV1
         6CEgztVE4S+FsWSvm0aDFr/MOUhdvEN2u4t6eSJCuujZXRcb6qpKpKzYl290KJ+rEwpk
         KHFRzXPL13sFENGKXwEhMDoOSWzmgzFLUNLTwIH71evAwhhC97FofJfcQKA+vcFqSHUt
         u/yA==
X-Gm-Message-State: AOAM533hGRzmPbopuGh3+P/SryMgtLGJQ4iMypkYhIimxlwHpevjiFK1
	WDqz6JbqP6kvUuMOnpa8YaE=
X-Google-Smtp-Source: ABdhPJyx1/9u66mEIQ7tlhhwr7cvM3LxmaRRWwYlE7BhD3irRBHX0V0gqBqJI+qOdPWc07O/FYW1tQ==
X-Received: by 2002:a17:90a:9b03:: with SMTP id f3mr34535008pjp.184.1626884920747;
        Wed, 21 Jul 2021 09:28:40 -0700 (PDT)
Received: from ojas ([122.161.48.33])
        by smtp.gmail.com with ESMTPSA id l11sm23057834pjw.45.2021.07.21.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 09:28:40 -0700 (PDT)
Date: Wed, 21 Jul 2021 21:58:25 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, nsaenz@kernel.org,
	arnd@arndb.de, dan.carpenter@oracle.com, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] staging: vchiq: Combine vchiq platform code into
 single file
Message-ID: <20210721162825.GA188355@ojas>
References: <cover.1625401927.git.ojaswin98@gmail.com>
 <b2e9eaee3e6d8f278a3277aaa284c5ca8b76d756.1625401928.git.ojaswin98@gmail.com>
 <b1b867c1-476c-8a5d-721b-ac19854efcbc@i2se.com>
 <20210711112821.GA5049@ojas>
 <YPfZW0k563kuuHnx@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPfZW0k563kuuHnx@kroah.com>

On Wed, Jul 21, 2021 at 10:22:51AM +0200, Greg KH wrote:
> On Sun, Jul 11, 2021 at 04:58:21PM +0530, Ojaswin Mujoo wrote:
> > On Sun, Jul 11, 2021 at 12:49:35PM +0200, Stefan Wahren wrote:
> > > Am 04.07.21 um 17:59 schrieb Ojaswin Mujoo:
> > > > Combine the vchiq platform initialization code into a single file by
> > > > merging vchiq_2835_arm.c into vchiq_arm.c
> > > >
> > > > Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> > > > ---
> > > >  drivers/staging/vc04_services/Makefile        |   1 -
> > > >  .../interface/vchiq_arm/vchiq_2835_arm.c      | 564 ------------------
> > > >  .../interface/vchiq_arm/vchiq_arm.c           | 549 +++++++++++++++++
> > > >  3 files changed, 549 insertions(+), 565 deletions(-)
> > > >  delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> > > >
> > > > diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
> > > > index 0a04338fc962..1fd191e2e2a5 100644
> > > > --- a/drivers/staging/vc04_services/Makefile
> > > > +++ b/drivers/staging/vc04_services/Makefile
> > > > @@ -4,7 +4,6 @@ obj-$(CONFIG_BCM2835_VCHIQ)	+= vchiq.o
> > > >  vchiq-objs := \
> > > >     interface/vchiq_arm/vchiq_core.o  \
> > > >     interface/vchiq_arm/vchiq_arm.o \
> > > > -   interface/vchiq_arm/vchiq_2835_arm.o \
> > > >     interface/vchiq_arm/vchiq_debugfs.o \
> > > >     interface/vchiq_arm/vchiq_connected.o \
> > > >  
> > > ...
> > > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > index 0f2de571eba7..9057d01ffd48 100644
> > > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > @@ -25,15 +25,32 @@
> > > >  #include <linux/rcupdate.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/slab.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/uaccess.h>
> > > >  #include <soc/bcm2835/raspberrypi-firmware.h>
> > > >  
> > > >  #include "vchiq_core.h"
> > > >  #include "vchiq_ioctl.h"
> > > >  #include "vchiq_arm.h"
> > > >  #include "vchiq_debugfs.h"
> > > > +#include "vchiq_connected.h"
> > > > +#include "vchiq_pagelist.h"
> > > >  
> > > >  #define DEVICE_NAME "vchiq"
> > > >  
> > > > +#define TOTAL_SLOTS (VCHIQ_SLOT_ZERO_SLOTS + 2 * 32)
> > > > +
> > > > +#define MAX_FRAGMENTS (VCHIQ_NUM_CURRENT_BULKS * 2)
> > > > +
> > > > +#define VCHIQ_PLATFORM_FRAGMENTS_OFFSET_IDX 0
> > > > +#define VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX  1
> > > > +
> > > > +#define BELL0	0x00
> > > > +#define BELL2	0x08
> > > > +
> > > > +#define ARM_DS_ACTIVE	BIT(2)
> > > > +
> > > >  /* Override the default prefix, which would be vchiq_arm (from the filename) */
> > > >  #undef MODULE_PARAM_PREFIX
> > > >  #define MODULE_PARAM_PREFIX DEVICE_NAME "."
> > > > @@ -59,10 +76,542 @@ static struct vchiq_drvdata bcm2836_drvdata = {
> > > >  	.cache_line_size = 64,
> > > >  };
> > > >  
> > > > +struct vchiq_2835_state {
> > > > +	int inited;
> > > > +	struct vchiq_arm_state arm_state;
> > > > +};
> > > > +
> > > > +struct vchiq_pagelist_info {
> > > > +	struct pagelist *pagelist;
> > > > +	size_t pagelist_buffer_size;
> > > > +	dma_addr_t dma_addr;
> > > > +	enum dma_data_direction dma_dir;
> > > > +	unsigned int num_pages;
> > > > +	unsigned int pages_need_release;
> > > > +	struct page **pages;
> > > > +	struct scatterlist *scatterlist;
> > > > +	unsigned int scatterlist_mapped;
> > > > +};
> > > > +
> > > > +static void __iomem *g_regs;
> > > > +/* This value is the size of the L2 cache lines as understood by the
> > > > + * VPU firmware, which determines the required alignment of the
> > > > + * offsets/sizes in pagelists.
> > > > + *
> > > > + * Modern VPU firmware looks for a DT "cache-line-size" property in
> > > > + * the VCHIQ node and will overwrite it with the actual L2 cache size,
> > > > + * which the kernel must then respect.  That property was rejected
> > > > + * upstream, so we have to use the VPU firmware's compatibility value
> > > > + * of 32.
> > > > + */
> > > > +static unsigned int g_cache_line_size = 32;
> > > > +static unsigned int g_fragments_size;
> > > > +static char *g_fragments_base;
> > > > +static char *g_free_fragments;
> > > > +static struct semaphore g_free_fragments_sema;
> > > > +static struct device *g_dev;
> > > > +
> > > > +static DEFINE_SEMAPHORE(g_free_fragments_mutex);
> > > > +
> > > > +static irqreturn_t
> > > > +vchiq_doorbell_irq(int irq, void *dev_id);
> > > > +
> > > > +static struct vchiq_pagelist_info *
> > > > +create_pagelist(char *buf, char __user *ubuf, size_t count, unsigned short type);
> > > > +
> > > > +static void
> > > > +free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
> > > > +	      int actual);
> > > 
> > > please no forward declarations of these 3 functions. Put them into the
> > > right order instead ...
> > > 
> > > Since this patch is independent from the other ones from the series,
> > > maybe Greg can merg the rest of the series.
> > > 
> > > 
> > > 
> > 
> > Hello Stefan,
> > 
> > Thanks for the review. As for the forward declerations, sure I can fix
> > these 3 functions and send an independent patch for this.
> 
> Please fix up and resend the whole series properly so that I can apply
> them that way.
> 
> thanks,
> 
> greg k-h
Hello,

I have just sent a revised patchset with requested changes. [1]

[1] https://lore.kernel.org/patchwork/cover/1465322/

Thank you,
Ojaswin
