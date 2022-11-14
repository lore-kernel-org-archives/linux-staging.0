Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD74C78
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 14:07:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-14-120-nat.elisa-mobile.fi [85.76.14.120])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E850891;
	Mon, 14 Nov 2022 15:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668434846;
	bh=/o81K5ZaEIsKIK1E5LeS0R4ufj8imWkNuqxcjDuntt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDBOYzpBZbutDsK3ZdTxIsdQBHQxoQErEEU0x1FeVq8F5uGHiMaQElRqJEsuMEOm7
	 d5ZzzAUoS6QOjt6CdAgH+RHPZGrZ2Y6V6k7dQrZ5nF2oZEq/zu5GMJIpNDVdg6euFZ
	 DMmZwTNgE2rtQg4vwoCIOKKEK1HrDzQ9dSWZ/R24=
Date: Mon, 14 Nov 2022 16:06:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ian Cowan <ian@linux.cowan.aero>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: omap4iss: correct cacheflush import
Message-ID: <Y3JLenvvuRhb0xfZ@pendragon.ideasonboard.com>
References: <20221113003347.93483-1-ian@linux.cowan.aero>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221113003347.93483-1-ian@linux.cowan.aero>

Hi Ian,

Thank you for the patch.

On Sat, Nov 12, 2022 at 07:33:47PM -0500, Ian Cowan wrote:
> Correct the import for cacheflush from the asm directory to the linux
> directory.

Unless I'm mistaken, it looks like the header is actually not needed at
all.

> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
> ---
>  drivers/staging/media/omap4iss/iss_video.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index 842509dcfedf..9f08dd976a24 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -7,6 +7,7 @@
>   * Author: Sergio Aguirre <sergio.a.aguirre@gmail.com>
>   */
>  
> +#include <linux/cacheflush.h>
>  #include <linux/clk.h>
>  #include <linux/mm.h>
>  #include <linux/pagemap.h>
> @@ -19,8 +20,6 @@
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mc.h>
>  
> -#include <asm/cacheflush.h>
> -
>  #include "iss_video.h"
>  #include "iss.h"
>  

-- 
Regards,

Laurent Pinchart
