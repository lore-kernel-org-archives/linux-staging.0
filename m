Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB08412E51;
	Sun, 29 Oct 2023 23:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SKXSwHTa"
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3499383F;
	Mon, 30 Oct 2023 00:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698621794;
	bh=b7fAlWnVHD8ub32pUv2JqeBryzHEQYH8d55fVsFUfVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKXSwHTavIpNoVy44Yhm+xz0ENUYRR9sRRNfaMB9/XEkKTzqAJeRoUAw0UvuTGZH8
	 11zwt9Rk+KOoHEegp0bMgiV3oygn7HTScqjMD+OCBqddojgX6rM/bEeMvU2zPNdIWa
	 ose3b9FpRIX/bFPLgYojCnWIwV19gayyS2ccwdt8=
Date: Mon, 30 Oct 2023 01:23:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nancy Nyambura <nicymimz@gmail.com>
Cc: gagallo7+outreachy@gmail.com, nicydaniels@gmail.com,
	outreachy@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Media: omap4iss: Enable RSZB and update resizer control
Message-ID: <20231029232335.GG12144@pendragon.ideasonboard.com>
References: <20231029220710.47063-1-nicymimz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231029220710.47063-1-nicymimz@gmail.com>

Hello Nancy,

On Mon, Oct 30, 2023 at 01:07:09AM +0300, Nancy Nyambura wrote:
> Enable RSZB functionality in the OMAP4 ISS driver. This change sets the RSZB system configuration register to enable the RSZB module. Additionally, it updates the resizer control by setting the RSZ_EN_EN flag as required. This change enhances the driver's capabilities and prepares it for future developments.

You haven't run this through checkpatch, have you ?

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

Or even read the patch before sending it out ?

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

This doesn't even compile.

Has this all been generated by chatgpt by any chance ? It doesn't look
like whoever wrote this understand what they were doing.

>  }
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
