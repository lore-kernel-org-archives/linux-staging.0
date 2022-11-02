Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21977C
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 07:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6602BC433C1;
	Wed,  2 Nov 2022 07:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667373806;
	bh=6khu+nQVxwlDVEmlDjEDyY2kHW1h0LpwWafoxrIZJTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxFx4okaGASNYvi75VsaH+QpUCPHev2xF+YOhiKX2AVMfZTzrpsvHHi4NL2a8sgPP
	 mBxrVRAIgjMYj9CjFLSpxSdBKDUK9FKZHkc4M63DLYGbWUZxEb77b25tvIIdCsVzhy
	 OlPu2aLOmqtrWxWEE6wnXCd+xjDfFaFta4NWt8Qk=
Date: Wed, 2 Nov 2022 08:24:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jerom van der Sar <jerom.vandersar@gmail.com>
Cc: philipp.g.hortmann@gmail.com, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8192e: space formatting fixes in rtl_cam.c
Message-ID: <Y2IbI8ib5+k+bVRo@kroah.com>
References: <f391a7cd-e57a-0643-1ba1-c859bf2f83a6@gmail.com>
 <20221101222900.4681-1-jerom.vandersar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101222900.4681-1-jerom.vandersar@gmail.com>

On Tue, Nov 01, 2022 at 11:29:00PM +0100, Jerom van der Sar wrote:
> Fixed a few coding style issues in rtl_cam.c such as double blank lines
> and lack of spaces around binary operators.Some other warnings still
> remain. These issues were found by scripts/checkpatch.pl.
> 
> This patch helps clean up the rtl8192e driver in staging, making it
> easier to read and maintain.
> 
> Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>
> ---
> Changes in v3:
>   - Fixed faulty dot at the end of the patch sign-off.
> 
> Changes in v2:
>   - Reverted some formatting fixes to make the diff easier to review.
> 
>  drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> index 41faeb4b9b9b..d5aaf24a0ddb 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> @@ -17,7 +17,7 @@ void rtl92e_cam_reset(struct net_device *dev)
>  {
>  	u32 ulcommand = 0;
>  
> -	ulcommand |= BIT31|BIT30;
> +	ulcommand |= BIT31 | BIT30;

Ok, new spaces, nice!

>  	rtl92e_writel(dev, RWCAM, ulcommand);
>  }
>  
> @@ -40,7 +40,6 @@ void rtl92e_enable_hw_security_config(struct net_device *dev)
>  		SECR_value |= SCR_TxUseDK;
>  	}
>  
> -

You removed a line?

That's a different type of fix, sorry.  Please break this up into a "one
logical change per patch" patch series and resend.

thanks,

greg k-h
