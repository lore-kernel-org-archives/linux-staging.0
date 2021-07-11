Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB172
	for <linux-staging@lists.linux.dev>; Sun, 11 Jul 2021 11:28:32 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id b14-20020a17090a7aceb029017261c7d206so10949987pjl.5
        for <linux-staging@lists.linux.dev>; Sun, 11 Jul 2021 04:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XJqaYNuAhx03VwNz0nBHeMeBm3MIj1+un/V3SAMY9Y4=;
        b=YbQPULznAFWlcyQEfotPQ6Vd2/Z/zQFWcnjtaVIe0y6OjzI5vyyTvYyFuJd/swEV/r
         G76DopUvMWN4bEGq1s8wxQZpUxEEz9/wtn3Xay2e6MwZ/9hCrQ8dRmmBBksXgSGeTNjb
         wjgHuLgEsIjcWD4J0p1fR+B6IlMNAs/u2I8gEnIMtdej2jUjGP/D3Fmtg8xIgX0weu3V
         5iy7lFlor5kq1zRFNgoS+G/vrM4jb+o7ORle7y9+PU8EGpd6wR9UCCc+5LPCx4rqW8Jj
         t3yrtfBxCKkSaXRFOTyaQOLGVidtuvl1k41T0MXWkvLUXNDiorwfC9WNvw4zrSFBjNND
         qtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XJqaYNuAhx03VwNz0nBHeMeBm3MIj1+un/V3SAMY9Y4=;
        b=CMbIT25zyNTLH4mubn+KxUVSQ7+ITIE2L84C87E1F7OX+IN4Rot1tNmXpzkk/w4YV8
         TfNeaf03CBJ4E20mVHzYaioCDKYJXwIJpTYSYjxx6RgZNN4kA/SFhRa0cERAzK85q4Gd
         05Z+C1NjLT0BzFqpTzzfdpIKBvO0Hb2SQ70RaMw9asfipO/6yKazl+3e5tkgOZoq3hPY
         DhQbyud07fU7W+2zF+g6rJq/xTtZ70IzieLcbHsK26oKiGNwgk+E98pkpDdEt9iEPpsD
         wrIVnbbWjf5TJLb6P2gOzBZlnT/nSEUg6MfONK606HQSkCGRvmR0e+uHwqiK8OvgDisG
         h1Qw==
X-Gm-Message-State: AOAM530MHmD8+w+4Qi99pL/dhnPX7X5H3yy0V9kUvdSDeGeG9T3LZd3d
	aNmeimaTaQSdc6h9eHsCdEQ=
X-Google-Smtp-Source: ABdhPJxo3youatxyZWxLBBreYWrXeVGWLK7TP89pTPaDjT7duO2vlYst58Piv+hlJjZfYK4JBXz5Jg==
X-Received: by 2002:a17:90b:314d:: with SMTP id ip13mr22207735pjb.131.1626002911875;
        Sun, 11 Jul 2021 04:28:31 -0700 (PDT)
Received: from ojas ([122.177.24.64])
        by smtp.gmail.com with ESMTPSA id l6sm12222720pff.74.2021.07.11.04.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 04:28:31 -0700 (PDT)
Date: Sun, 11 Jul 2021 16:58:21 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: nsaenz@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de,
	dan.carpenter@oracle.com, phil@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] staging: vchiq: Combine vchiq platform code into
 single file
Message-ID: <20210711112821.GA5049@ojas>
References: <cover.1625401927.git.ojaswin98@gmail.com>
 <b2e9eaee3e6d8f278a3277aaa284c5ca8b76d756.1625401928.git.ojaswin98@gmail.com>
 <b1b867c1-476c-8a5d-721b-ac19854efcbc@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1b867c1-476c-8a5d-721b-ac19854efcbc@i2se.com>

On Sun, Jul 11, 2021 at 12:49:35PM +0200, Stefan Wahren wrote:
> Am 04.07.21 um 17:59 schrieb Ojaswin Mujoo:
> > Combine the vchiq platform initialization code into a single file by
> > merging vchiq_2835_arm.c into vchiq_arm.c
> >
> > Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> > ---
> >  drivers/staging/vc04_services/Makefile        |   1 -
> >  .../interface/vchiq_arm/vchiq_2835_arm.c      | 564 ------------------
> >  .../interface/vchiq_arm/vchiq_arm.c           | 549 +++++++++++++++++
> >  3 files changed, 549 insertions(+), 565 deletions(-)
> >  delete mode 100644 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> >
> > diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
> > index 0a04338fc962..1fd191e2e2a5 100644
> > --- a/drivers/staging/vc04_services/Makefile
> > +++ b/drivers/staging/vc04_services/Makefile
> > @@ -4,7 +4,6 @@ obj-$(CONFIG_BCM2835_VCHIQ)	+= vchiq.o
> >  vchiq-objs := \
> >     interface/vchiq_arm/vchiq_core.o  \
> >     interface/vchiq_arm/vchiq_arm.o \
> > -   interface/vchiq_arm/vchiq_2835_arm.o \
> >     interface/vchiq_arm/vchiq_debugfs.o \
> >     interface/vchiq_arm/vchiq_connected.o \
> >  
> ...
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index 0f2de571eba7..9057d01ffd48 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -25,15 +25,32 @@
> >  #include <linux/rcupdate.h>
> >  #include <linux/delay.h>
> >  #include <linux/slab.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/uaccess.h>
> >  #include <soc/bcm2835/raspberrypi-firmware.h>
> >  
> >  #include "vchiq_core.h"
> >  #include "vchiq_ioctl.h"
> >  #include "vchiq_arm.h"
> >  #include "vchiq_debugfs.h"
> > +#include "vchiq_connected.h"
> > +#include "vchiq_pagelist.h"
> >  
> >  #define DEVICE_NAME "vchiq"
> >  
> > +#define TOTAL_SLOTS (VCHIQ_SLOT_ZERO_SLOTS + 2 * 32)
> > +
> > +#define MAX_FRAGMENTS (VCHIQ_NUM_CURRENT_BULKS * 2)
> > +
> > +#define VCHIQ_PLATFORM_FRAGMENTS_OFFSET_IDX 0
> > +#define VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX  1
> > +
> > +#define BELL0	0x00
> > +#define BELL2	0x08
> > +
> > +#define ARM_DS_ACTIVE	BIT(2)
> > +
> >  /* Override the default prefix, which would be vchiq_arm (from the filename) */
> >  #undef MODULE_PARAM_PREFIX
> >  #define MODULE_PARAM_PREFIX DEVICE_NAME "."
> > @@ -59,10 +76,542 @@ static struct vchiq_drvdata bcm2836_drvdata = {
> >  	.cache_line_size = 64,
> >  };
> >  
> > +struct vchiq_2835_state {
> > +	int inited;
> > +	struct vchiq_arm_state arm_state;
> > +};
> > +
> > +struct vchiq_pagelist_info {
> > +	struct pagelist *pagelist;
> > +	size_t pagelist_buffer_size;
> > +	dma_addr_t dma_addr;
> > +	enum dma_data_direction dma_dir;
> > +	unsigned int num_pages;
> > +	unsigned int pages_need_release;
> > +	struct page **pages;
> > +	struct scatterlist *scatterlist;
> > +	unsigned int scatterlist_mapped;
> > +};
> > +
> > +static void __iomem *g_regs;
> > +/* This value is the size of the L2 cache lines as understood by the
> > + * VPU firmware, which determines the required alignment of the
> > + * offsets/sizes in pagelists.
> > + *
> > + * Modern VPU firmware looks for a DT "cache-line-size" property in
> > + * the VCHIQ node and will overwrite it with the actual L2 cache size,
> > + * which the kernel must then respect.  That property was rejected
> > + * upstream, so we have to use the VPU firmware's compatibility value
> > + * of 32.
> > + */
> > +static unsigned int g_cache_line_size = 32;
> > +static unsigned int g_fragments_size;
> > +static char *g_fragments_base;
> > +static char *g_free_fragments;
> > +static struct semaphore g_free_fragments_sema;
> > +static struct device *g_dev;
> > +
> > +static DEFINE_SEMAPHORE(g_free_fragments_mutex);
> > +
> > +static irqreturn_t
> > +vchiq_doorbell_irq(int irq, void *dev_id);
> > +
> > +static struct vchiq_pagelist_info *
> > +create_pagelist(char *buf, char __user *ubuf, size_t count, unsigned short type);
> > +
> > +static void
> > +free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
> > +	      int actual);
> 
> please no forward declarations of these 3 functions. Put them into the
> right order instead ...
> 
> Since this patch is independent from the other ones from the series,
> maybe Greg can merg the rest of the series.
> 
> 
> 

Hello Stefan,

Thanks for the review. As for the forward declerations, sure I can fix
these 3 functions and send an independent patch for this.

Regards,
Ojaswin
