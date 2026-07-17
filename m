Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082E3C465
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294224; cv=none; b=QYcoGrr4A6mtleKc4pK3DGMZZgVjcddYATaF+/ClIJ2WNxbxm5qVgLXb0OAap3w1ScMWPvWWYpzE+D8ESKRVyRTDfVuS3X0gklqUxOeQvrzZ8tT4xg6rwx1pTP3VxIImr+PmEqFgjS8bge9V8Nh99Iat322I9C9JnM/qdlPQTwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294224; c=relaxed/simple;
	bh=UKWtZKHXQ6YGIenR84otoSUCIl4Q9KOv9bN3z5RzPz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9r0oltB4fBYIeENGoBXjDwy6ceHc4ZWux5zeU9HWFKhR1NML6DYlC9gRqKqxNIJPR3teChFgGv0JYx54W33kY/XXCNzonWqufejyQtaflDvDk5ICa/sITsGiocHam2fgZmQcMdI8IG6+XGL6QKepdt1XA0Qty+h5S3haryoeJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LuvFB60A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LuvFB60A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39A61F000E9;
	Fri, 17 Jul 2026 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784294223;
	bh=sEbgAeRFW2tSscyTRKjUMQALvaEPE/eZIf0rwCIgqNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LuvFB60AwJPmF1VpGfkXFMgI7pPTE8ob+8KgLoTey3e7mRY8y1YlQg5h/hDRHV3yw
	 JoDF5lRiowuNbXumPAG4vpic8L9YsFryrpOcCKxasm9yjU2dvRHzENUGa4Kg6zmy9m
	 FFElvYOoZC8lZvzAaBos/ZZJR1Xs7zZuxs+SlGMo=
Date: Fri, 17 Jul 2026 15:16:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mariano Baragiola <mbaragiola@linux.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: validate monitor transmit frame
 lengths
Message-ID: <2026071745-folk-ripping-e8ef@gregkh>
References: <20260715225938.1403192-1-mbaragiola@linux.com>
 <20260717130356.2544481-1-mbaragiola@linux.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717130356.2544481-1-mbaragiola@linux.com>

On Fri, Jul 17, 2026 at 10:03:56AM -0300, Mariano Baragiola wrote:
> rtw_cfg80211_monitor_if_xmit_entry() removes the radiotap header and
> then reads the 802.11 frame control field without checking that a base
> 802.11 header remains.
> 
> The data path also pulls the calculated 802.11, QoS and SNAP header
> span before confirming that the skb contains it. A truncated frame can
> therefore cause out-of-bounds reads or leave insufficient data for the
> Ethernet address writes.
> 
> Reject frames that do not contain the base 802.11 header and data
> frames that do not contain their complete calculated header span.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Mariano Baragiola <mbaragiola@linux.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 6a97afd89dc7..bed8192ab44f 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2033,6 +2033,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
>  
>  	/* Skip the ratio tap header */
>  	skb_pull(skb, rtap_len);
> +	if (unlikely(skb->len < dot11_hdr_len))
> +		goto fail;
>  
>  	dot11_hdr = (struct ieee80211_hdr *)skb->data;
>  	frame_control = le16_to_cpu(dot11_hdr->frame_control);
> @@ -2045,6 +2047,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
>  			qos_len = 2;
>  		if ((frame_control & 0x0300) == 0x0300)
>  			dot11_hdr_len += 6;
> +		if (unlikely(skb->len < dot11_hdr_len + qos_len + snap_len))
> +			goto fail;
>  
>  		memcpy(dst_mac_addr, dot11_hdr->addr1, sizeof(dst_mac_addr));
>  		memcpy(src_mac_addr, dot11_hdr->addr2, sizeof(src_mac_addr));
> -- 
> 2.55.0
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
