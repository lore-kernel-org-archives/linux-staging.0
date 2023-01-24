Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15CD10F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 10:50:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353540125"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="353540125"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694293025"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="694293025"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2023 02:50:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKGsm-00EIbB-1v;
	Tue, 24 Jan 2023 12:50:28 +0200
Date: Tue, 24 Jan 2023 12:50:28 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 45/57] media: atomisp: ov2680: Cleanup includes
Message-ID: <Y8+39HV1Q53SNvQe@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-46-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-46-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:53PM +0100, Hans de Goede wrote:
> Remove unused includes and sort the remaining ones alphabetically.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
See below.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-ov2680.c        | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 994b6fe40069..1dc821ca4e68 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -15,27 +15,14 @@
>   *
>   */
>  
> -#include <asm/unaligned.h>
> -
> -#include <linux/module.h>
> -#include <linux/types.h>
> -#include <linux/kernel.h>
> -#include <linux/mm.h>
> -#include <linux/string.h>
> -#include <linux/errno.h>
> -#include <linux/init.h>
> -#include <linux/kmod.h>
> +#include <linux/acpi.h>
>  #include <linux/device.h>
> -#include <linux/delay.h>
> -#include <linux/slab.h>
>  #include <linux/i2c.h>
> -#include <linux/moduleparam.h>
> +#include <linux/module.h>
> +#include <linux/types.h>

+ Blank line?

>  #include <media/ovxxxx_16bit_addr_reg_helpers.h>
>  #include <media/v4l2-device.h>
> -#include <linux/io.h>
> -#include <linux/acpi.h>

+ Blank line?

>  #include "../include/linux/atomisp_gmin_platform.h"

> -

I would leave it to make separate groups of headers.

>  #include "ov2680.h"
>  
>  static enum atomisp_bayer_order ov2680_bayer_order_mapping[] = {
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


