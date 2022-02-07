Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883F2F27
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 16:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F65BC004E1;
	Mon,  7 Feb 2022 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644252380;
	bh=XQGsi326UEPve0z/EdN0Sb8WFS/rHTPTPvFza9C3uAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZb+qvbEn0meMEbpwK8P+G3w6neBQZG6vSNVffopUfSGmsLmZDRGDLjyiQ/UFTGe7
	 9b+EaH7RAU7yMhX+Oo9PwJGox9wozxu8NttKIR3EOMcfSDPqXygXuzulNd9Hui6oae
	 r+FuXvVpQOhnBeOoa8LfP9k/ibtlvkv0PuyimiAk=
Date: Mon, 7 Feb 2022 17:46:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Leonardo Araujo <leonardo.aa88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: wfx: CHECK: usleep_range is preferred over
 udelay
Message-ID: <YgFM1HHs7rSqp/0Q@kroah.com>
References: <20220207160051.27829-1-leonardo.aa88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207160051.27829-1-leonardo.aa88@gmail.com>

On Mon, Feb 07, 2022 at 01:00:51PM -0300, Leonardo Araujo wrote:
> Fixes the checks reported by checkpatch.pl for usleep_range.
> 
> Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> ---
>  drivers/staging/wfx/bh.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wfx/bh.c b/drivers/staging/wfx/bh.c
> index a0f9d1b53019..ebc7eaf93ef0 100644
> --- a/drivers/staging/wfx/bh.c
> +++ b/drivers/staging/wfx/bh.c
> @@ -312,7 +312,7 @@ void wfx_bh_poll_irq(struct wfx_dev *wdev)
>  			dev_err(wdev->dev, "time out while polling control register\n");
>  			return;
>  		}
> -		udelay(200);
> +		usleep_range(200, 200);

Do you have the hardware to verify that this is the correct fix for
this?

You can not just blindly make this type of change here, sorry, otherwise
we would have done so long ago with a simple search/replace :)

thanks,

greg k-h
