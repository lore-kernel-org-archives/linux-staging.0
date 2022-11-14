Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6E6FC1
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 16:20:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [46.183.103.8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F1FE891;
	Mon, 14 Nov 2022 17:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668442828;
	bh=bsJLde+lEx0AtdQ4007vP+gZJnhejTWkkwvxQxA7Wwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T891eZdwVB2V/LLdjtMfPFDIMKRWUeSP/FnU+0PlDbRhdt7ctE+2RIaCIjyYmdwBJ
	 jpkDCgZemKpcx6bZkFhyxUEN1iADQoeukpPWnFmU1EMsAvyPD4O7ySiws4hmR+L9qZ
	 YRhc8Mc8VsakTyW7qHBUUhC7UDZ63mvHncN4RNDU=
Date: Mon, 14 Nov 2022 18:20:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ian Cowan <ian@linux.cowan.aero>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: omap4iss: remove cacheflush import
Message-ID: <Y3Jqt2NX4j9LdCni@pendragon.ideasonboard.com>
References: <20221114161700.14378-1-ian@linux.cowan.aero>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221114161700.14378-1-ian@linux.cowan.aero>

Hi Ian,

Thank you for the patch.

On Mon, Nov 14, 2022 at 11:17:00AM -0500, Ian Cowan wrote:
> The cacheflush import is never used, so it is safe to remove it as an
> import.
> 
> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/omap4iss/iss_video.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index 842509dcfedf..e732f08fad26 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -19,8 +19,6 @@
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
