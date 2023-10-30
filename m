Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD5D6107;
	Mon, 30 Oct 2023 06:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="N0UCLpBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UpRT4osgu/w1c0pk9YIMsIv1/UH/MkmAUIraL9fcJ3E=;
  b=N0UCLpBG4yBdHx6p/bTJTBiyPD5+iZzFNeMi2jqhtoFvhKM8oSc390k9
   KpkQdLuiy50QLs10ZWEUQlvEJcENuIDnFrNBxaBn+yq15va0X4m8gLdcQ
   Zcsv8cMgajkEG56q8MPig/bSYePLLP+RyKOHDGvvhKVltDZY54qLc94Y1
   o=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,262,1694728800"; 
   d="scan'208";a="133818454"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 07:31:21 +0100
Date: Mon, 30 Oct 2023 07:31:21 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Nancy Nyambura <nicymimz@gmail.com>
cc: gagallo7+outreachy@gmail.com, nicydaniels@gmail.com, 
    outreachy@lists.linux.dev, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Media: omap4iss: Enable RSZB and update resizer
 control
In-Reply-To: <20231029220710.47063-1-nicymimz@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2310300729480.3533@hadrien>
References: <20231029220710.47063-1-nicymimz@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 30 Oct 2023, Nancy Nyambura wrote:

> Enable RSZB functionality in the OMAP4 ISS driver. This change sets the RSZB system configuration register to enable the RSZB module. Additionally, it updates the resizer control by setting the RSZ_EN_EN flag as required. This change enhances the driver's capabilities and prepares it for future developments.

Could you explain more about your changes?  What information led you to
make these changes.  The current messages says what is done, but not so
much about why.

Also, the log message should be limited to around 70 characters per line,
so that it looks nice in the git history after it has been indented.

julia


>
> Signed-off-by: Nancy Nyambura <nicymimz@gmail.com>
> ---
>  drivers/staging/media/omap4iss/iss_resizer.c | 34 +++++++++++---------
>  1 file changed, 19 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/staging/media/omap4iss/iss_resizer.c b/drivers/staging/media/omap4iss/iss_resizer.c
> index a5f8f9f1ab16..23089eeaf448 100644
> --- a/drivers/staging/media/omap4iss/iss_resizer.c
> +++ b/drivers/staging/media/omap4iss/iss_resizer.c
> @@ -7,17 +7,17 @@
>   * Author: Sergio Aguirre <sergio.a.aguirre@gmail.com>
>   */
>
> -#include <linux/module.h>
> -#include <linux/uaccess.h>
> -#include <linux/delay.h>
> -#include <linux/device.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/mm.h>
> -#include <linux/sched.h>
> -
> -#include "iss.h"
> -#include "iss_regs.h"
> -#include "iss_resizer.h"
> + #include <linux/module.h>
> + #include <linux/uaccess.h>
> + #include <linux/delay.h>
> + #include <linux/device.h>
> + #include <linux/dma-mapping.h>
> + #include <linux/mm.h>
> + #include <linux/sched.h>
> +
> + #include "iss.h"
> + #include "iss_regs.h"
> + #include "iss_resizer.h"
>
>  static const unsigned int resizer_fmts[] = {
>  	MEDIA_BUS_FMT_UYVY8_1X16,
> @@ -30,11 +30,11 @@ static const unsigned int resizer_fmts[] = {
>   *
>   * Also prints other debug information stored in the RESIZER module.
>   */
> -#define RSZ_PRINT_REGISTER(iss, name)\
> + #define RSZ_PRINT_REGISTER(iss, name)\
>  	dev_dbg(iss->dev, "###RSZ " #name "=0x%08x\n", \
>  		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RSZ_##name))
>
> -#define RZA_PRINT_REGISTER(iss, name)\
> + #define RZA_PRINT_REGISTER(iss, name)\
>  	dev_dbg(iss->dev, "###RZA " #name "=0x%08x\n", \
>  		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RZA_##name))
>
> @@ -116,8 +116,12 @@ static void resizer_enable(struct iss_resizer_device *resizer, u8 enable)
>  		       RSZ_SRC_EN_SRC_EN, enable ? RSZ_SRC_EN_SRC_EN : 0);
>
>  	/* TODO: Enable RSZB */
> -	iss_reg_update(iss, OMAP4_ISS_MEM_ISP_RESIZER, RZA_EN, RSZ_EN_EN,
> -		       enable ? RSZ_EN_EN : 0);
> +	u32 reg_value = ioread32(iss->base_addr + OMAP4_ISS_MEM_ISP_RESIZER,
> +		       	+ RZ_SYSCONFIG);
> +	reg_value |= RSZ_SYSCONFIG_RSZB_CLK_EN;
> +	iowrite32(reg_value, iss->base_addr + OMAP4_ISS_MEM_ISP_RESIZER,
> +			+ RSZ_SYSCONFIG);
> +
>  }
>
>  /* -----------------------------------------------------------------------------
> --
> 2.40.1
>
>
>
