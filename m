Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22353FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:48:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8056560F9C;
	Sat, 18 Sep 2021 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631958508;
	bh=J79zVyaYhSHXy2qTFijDe1+CyD3s14qalSH6pbbHD04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZjH089EyKJiEY5cZLLL7rBNxGd7lmFFhUQQh7J8Mhrfb8/hU/5YpTQUkV7G0vdiCx
	 I3RLBxFOYsxRYsndov3r5aS9hkLVjTFcMx+JfBhgL/UrFpQJxOnQtcd5EPtxtJigMJ
	 Hc2UkudJl9S3qL9vNSxKTsCZ0CQ2IH4BjLOEY1w4=
Date: Sat, 18 Sep 2021 11:48:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove unneeded if-null-free check
Message-ID: <YUW12SAg7I2cmzVY@kroah.com>
References: <1631956206-83175-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631956206-83175-1-git-send-email-jiapeng.chong@linux.alibaba.com>

On Sat, Sep 18, 2021 at 05:10:06PM +0800, Jiapeng Chong wrote:
> Eliminate the following coccicheck warning:
> 
> ./drivers/staging/r8188eu/os_dep/usb_intf.c:545:3-8: WARNING: NULL check
> before some freeing functions is not needed.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index d04d2f65..7e42a0a 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -541,9 +541,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>  	if (status != _SUCCESS) {
>  		if (pnetdev)
>  			rtw_free_netdev(pnetdev);
> -		else if (padapter)
> -			vfree(padapter);
> -		padapter = NULL;
> +		vfree(padapter);
>  	}
>  exit:
>  	return padapter;
> -- 
> 1.8.3.1
> 

You just changed how this function works. :(

Please be MUCH more careful, and fix your robot.

greg k-h
