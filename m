Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544FD65A
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 07:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EC9C433D7;
	Fri,  9 Sep 2022 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662710359;
	bh=f09WdUm9Kk1O1iK+auksbbG8fcrMbywkfUx2lZOfwRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7hJzqzWCKdzBIe9zY3magxMZhl6S8G+Csr0VE9UviGqnypPIqTkjR0i/dSqirFq4
	 e3id9dTXVrqS3d8oF0jj65ku7wvCZg29gsM62P1sqEAzGc6m4le4nCF+r2Hv7nslud
	 DV3u9ZW8E64EUcIUU8l/ALRawUOkAXvQJUnhjufo=
Date: Fri, 9 Sep 2022 09:59:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: GUO Zihua <guozihua@huawei.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	dan.carpenter@oracle.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: r8188eu: Fix return type for implementation
 of ndo_start_xmit
Message-ID: <YxryVHd1OOEgbHQu@kroah.com>
References: <20220908011323.22186-1-guozihua@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908011323.22186-1-guozihua@huawei.com>

On Thu, Sep 08, 2022 at 09:13:23AM +0800, GUO Zihua wrote:
> CFI (Control Flow Integrity) is a safety feature allowing the system to
> detect and react should a potential control flow hijacking occurs. In
> particular, the Forward-Edge CFI protects indirect function calls by
> ensuring the prototype of function that is actually called matches the
> definition of the function hook.
> 
> Since Linux now supports CFI, it will be a good idea to fix mismatched
> return type for implementation of hooks. Otherwise this would get
> cought out by CFI and cause a panic.
> 
> Use enums from netdev_tx_t as return value instead, then change return
> type to netdev_tx_t.
> 
> Fixes: cf68fffb66d6 ("add support for Clang CFI")
> Signed-off-by: GUO Zihua <guozihua@huawei.com>
> ---
> 
> v4:
>   Added Fixes tag.
> 
> v3:
>   Provide detail on CFI.
> 
> v2:
>   Fix truncated subject.
> 
> ---
>  drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
>  drivers/staging/r8188eu/os_dep/xmit_linux.c  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
> index 00658681fef9..947242486144 100644
> --- a/drivers/staging/r8188eu/include/xmit_osdep.h
> +++ b/drivers/staging/r8188eu/include/xmit_osdep.h
> @@ -28,7 +28,7 @@ struct sta_xmit_priv;
>  struct xmit_frame;
>  struct xmit_buf;
>  
> -int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
>  
>  void rtw_os_xmit_schedule(struct adapter *padapter);
>  
> diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> index 91a1e4e3219a..0b04010d6d82 100644
> --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> @@ -198,7 +198,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
>  	return true;
>  }
>  
> -int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
> +netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
>  {
>  	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
>  	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
> @@ -233,5 +233,5 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
>  
>  exit:
>  
> -	return 0;
> +	return NETDEV_TX_OK;
>  }
> -- 
> 2.17.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
