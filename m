Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD983C02
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 13:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A22C433EF;
	Sun,  2 Apr 2023 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680441372;
	bh=jnibmCt45iklluBfswBTDC0ZgT3EPyw8KU5oBm/VtLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMXKWtNc6QdQRCKXFeoPGwjiJrBCOu6nqTs8R4fcViysabfnSUE/AKZqbP+7Y3QDv
	 QDs88m36vbnL4IrxzQ0XqU91nXvyQ3+SAA7djzL6DpXyFIXo+R92wslErBbfAHIm9x
	 1XiC04Sa8yx4cdzXWPeyPuGV4tpVfK7xI4waEDis=
Date: Sun, 2 Apr 2023 15:16:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do
 while error.
Message-ID: <2023040252-racoon-daintily-3589@gregkh>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230402122550.70682-1-angelalbertoc.r@gmail.com>

On Sun, Apr 02, 2023 at 02:25:51PM +0200, Angel Alberto Carretero wrote:
> Wrap macro in a do-while statement.
> 
> Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index d7b39f3bb652..371809770ed0 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  static DEVICE_ATTR_RO(name##_avg)
>  
>  #define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +	do {		\
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field);		\
> +	} while (0)
>  
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> -- 
> 2.40.0
> 
> 

Any specific reason why you did not test build your change before
submitting it?

thanks,

greg k-h
