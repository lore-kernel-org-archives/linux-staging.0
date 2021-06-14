Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D372
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 16:56:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13E35A59;
	Mon, 14 Jun 2021 18:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1623689783;
	bh=NKxVcAiJXRYydk66BQhj3l3yAqP0NvgNKvCd+q3k96o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXVIWxT0aQU1nHRv126wh2Uh15t8UeXaZtQzPFs2uDjckx3/P6OJxK6USJXJ3yyjT
	 AxrrrYgHtz8hH4d7MZi/A2N7wuEKPMlG7evGxYHNkGWylNAsPJ/3NYkRxoMmSEP8mW
	 e88piP3bLn/rAQc1prTSSz1NVaMBYTqtKNNq4FLI=
Date: Mon, 14 Jun 2021 19:56:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Liu Shixin <liushixin2@huawei.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 2/8] media: v4l2-core: explicitly clear ioctl input
 data
Message-ID: <YMeKI4OZrtS529BO@pendragon.ideasonboard.com>
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-3-arnd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614103409.3154127-3-arnd@kernel.org>

Hi Arnd,

Thank you for the patch.

On Mon, Jun 14, 2021 at 12:34:03PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As seen from a recent syzbot bug report, mistakes in the compat ioctl
> implementation can lead to uninitialized kernel stack data getting used
> as input for driver ioctl handlers.
> 
> The reported bug is now fixed, but it's possible that other related
> bugs are still present or get added in the future. As the drivers need
> to check user input already, the possible impact is fairly low, but it
> might still cause an information leak.
> 
> To be on the safe side, always clear the entire ioctl buffer before
> calling the conversion handler functions that are meant to initialize
> them.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 58df927aec7e..f19e56116e53 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3124,8 +3124,10 @@ static int video_get_user(void __user *arg, void *parg,
>  		if (copy_from_user(parg, (void __user *)arg, n))
>  			err = -EFAULT;
>  	} else if (in_compat_syscall()) {
> +		memset(parg, 0, n);
>  		err = v4l2_compat_get_user(arg, parg, cmd);
>  	} else {
> +		memset(parg, 0, n);

This could possibly be moved with the #if block by making it cover the
whole switch, but I don't think this code path will be hit when cmd
isn't one of the values handled below, so it shouldn't matter.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		switch (cmd) {
>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>  		case VIDIOC_QUERYBUF_TIME32:

-- 
Regards,

Laurent Pinchart
