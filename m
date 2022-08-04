Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9578A7F6
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 08:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE67C433D6;
	Thu,  4 Aug 2022 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659601425;
	bh=Xhc5rJ02ivNxgg+cJzHeDv7qIuRBaz1s8ilrV+6MIEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJ3F4v1jdzdKN7FvEIhGvDkNRAJzmb2n5pWQH/YFhDq8qkeVlTOb3TY3KBra1A3Rn
	 FGTGRKeNY/ka8rMKhLpvb2jJPm7bsQfBXssLdLSI1kE+E3cVmgkpRNSVKIbnVCHhOx
	 9xc0JTZsrnNqRYvbLPeLuILgO8l7i5SRsF8HDFEk=
Date: Thu, 4 Aug 2022 10:23:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chen Shi <shichen01@baidu.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: media: imx: imx7-media-utils: Fix a
 coding style problem
Message-ID: <YuuCDsMej1FYrSF7@kroah.com>
References: <20220804071046.31520-1-shichen01@baidu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804071046.31520-1-shichen01@baidu.com>

On Thu, Aug 04, 2022 at 03:10:46PM +0800, Chen Shi wrote:
> Add parentheses to enclose macros with complex values.

Why?

> 
> Signed-off-by: Chen Shi <shichen01@baidu.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 294c808b2ebe..c94013175181 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -7,7 +7,7 @@
>  #include <linux/module.h>
>  #include "imx-media.h"
>  
> -#define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
> +#define IMX_BUS_FMTS(fmt...) {(const u32[]) {fmt, 0}}

What does this change?  Why make this change at all?

confused,

greg k-h
