Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8726E3D64;
	Tue,  4 Jul 2023 12:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C364EC433C7;
	Tue,  4 Jul 2023 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688473915;
	bh=s2gOvhD0O9aB848BRmDyAn7vGh7FJLSnh5v/aAVxXss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nu9+hIY0hmNeet6MYTtxsZMz7DYX38nU+ggkxt77FCJnjqy+9AC4Jbl5F+T/ZJZUC
	 GuL29vf2mloZuFILf6DcOdAR3qOLC+zqWFgEbCU5gS9A4wzkkvGyMDUC8ViD9A8GeI
	 7DnPybwBR/1t/4JRglF5pLrzt28hmLjLNBTHZTJo=
Date: Tue, 4 Jul 2023 13:31:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: wangjinchao <wangjinchao@xfusion.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	xulei <stone.xulei@xfusion.com>
Subject: Re: [PATCH] staging: rtl8192u: Fix assignment in if condition
Message-ID: <2023070401-cried-reroute-f8a9@gregkh>
References: <ZKP/01ECsgmdBFf2@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKP/01ECsgmdBFf2@fedora>

On Tue, Jul 04, 2023 at 12:15:57PM +0000, wangjinchao wrote:
> I just participated in Outreachy of KernelNewbies and fixed one 
> 'ERROR: do not use assignment in if condition' issue reported by 
> checkpatch.pl on drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c.
> 
> Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
> ---
>  drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> index ca09367005e1..52ff9e62ec08 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> @@ -1121,8 +1121,9 @@ int ieee80211_rx(struct ieee80211_device *ieee, struct sk_buff *skb,
>  
>  	/* skb: hdr + (possibly fragmented, possibly encrypted) payload */
>  
> +	keyidx = ieee80211_rx_frame_decrypt(ieee, skb, crypt);
>  	if (ieee->host_decrypt && (fc & IEEE80211_FCTL_WEP) &&
> -	    (keyidx = ieee80211_rx_frame_decrypt(ieee, skb, crypt)) < 0) {
> +	    keyidx < 0) {
>  		netdev_dbg(ieee->dev, "decrypt frame error\n");
>  		goto rx_dropped;
>  	}
> -- 
> 2.40.0
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
