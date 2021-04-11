Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037A370
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 06:43:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27F98611C2;
	Sun, 11 Apr 2021 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618123413;
	bh=Bbr3BLJcAz6PnmHODq3pk4i/wOjbWbBc/GjQqP/gWtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RxoHxzixndkBBbIqu5q2+CJuzejo3ntaNbnDIw+qkM3sjF/hVRjQ3yjL06asMXSw7
	 yYe6v386TzxLKC+ITDDwHcmauWd60tKFXFIOejG8eyDPwokAAu8dT3VVsj2sz8rgk8
	 LSp8mmAjSaeHKOi/hCyX5tpvqPTivYAZ1o7SRhkI=
Date: Sun, 11 Apr 2021 08:43:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: dev.dragon@bk.ru
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8192u: ieee80211: remove odd backslash.
Message-ID: <YHKak5rQ6n4peo4B@kroah.com>
References: <20210410192911.47486-1-dev.dragon@bk.ru>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410192911.47486-1-dev.dragon@bk.ru>

On Sat, Apr 10, 2021 at 10:29:12PM +0300, dev.dragon@bk.ru wrote:
> From: Dmitrii Wolf <dev.dragon@bk.ru>
> 
> This backslash should be deleted - looks like leftover and not needed.
> ---
>  drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> index 690b664df8fa..25ea8e1b6b65 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> @@ -2052,7 +2052,7 @@ void ieee80211_softmac_xmit(struct ieee80211_txb *txb, struct ieee80211_device *
>  #else
>  		if ((skb_queue_len(&ieee->skb_waitQ[queue_index]) != 0) ||
>  #endif
> -		    (!ieee->check_nic_enough_desc(ieee->dev, queue_index)) || \
> +		    (!ieee->check_nic_enough_desc(ieee->dev, queue_index)) ||
>  		    (ieee->queue_stop)) {
>  			/* insert the skb packet to the wait queue */
>  			/* as for the completion function, it does not need
> -- 
> 2.25.1
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
