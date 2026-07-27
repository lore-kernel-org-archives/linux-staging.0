Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB35238237A
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163916; cv=none; b=HPhXLYce3SG61fi1x2urgxoGZ4a3K/QV7IDwGOQnrnISgXV2yCfmOBSLZjBXg48oYeCqkS/wQGhoDlGNs+a1sF6G7p15BNTFcmYK3wiNI8HGfATuf6G9odtvd6g7gowGuW6/FQBhHswrgXQoAGEvge4MD8cXZedtlel5U6J4Ljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163916; c=relaxed/simple;
	bh=oTYpDURKQ1M8ZRszX29j/DH5d/Y6mWLccJmNMqD4PhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B36FJh98RNCeSEXotvIOtBvqRSdmM1OHk/bDhMYK40iQwxbWSufAvD4b737PuREYlHjGjGDer+X6eXxlBIafcyczaBt3kELKHJtGiRGK+VC20jDVH57pRhnH8Po1grzAQ2eTPpIMqg4Qmo19oOi5iuuX49LWFnR61RH+kO4tLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mut9e0xA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mut9e0xA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D311F00A3D;
	Mon, 27 Jul 2026 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785163913;
	bh=lPUDQ4h9Mmq0penVQhzAqLlc4SyDdDRWLB+9olW3szo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mut9e0xAdyPhX/ok/GQkOI1aCQVx88ZfX12rT3ykeLdII5wxx6opuni+Ydbi3QW4W
	 mBsZljNAdmkHTSGg1VuXSAY0cSS27Bi5YUKNiHp9i5li+5GausuTXZ/pY8QVZTgN1Q
	 h6nC9+TnDSNV9lmIQrMCT1NJJtVQehQZGQoKVZSk=
Date: Mon, 27 Jul 2026 16:51:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mariano Baragiola <mbaragiola@linux.com>
Cc: linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: validate monitor transmit frame
 lengths
Message-ID: <2026072751-anointer-remorse-943c@gregkh>
References: <20260717130356.2544481-1-mbaragiola@linux.com>
 <20260717132437.2556215-1-mbaragiola@linux.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717132437.2556215-1-mbaragiola@linux.com>

On Fri, Jul 17, 2026 at 10:24:37AM -0300, Mariano Baragiola wrote:
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
> Changes in v3:
> - Add the below-separator changelog as requested by Greg K-H patch-bot.
> 
> Changes in v2:
> - Add the Fixes tag as requested by Dan Carpenter.
> 
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

Only ever use likely/unlikely if you can measure the difference of it
not being there.  Otherwise the cpu will almost always get it right
instead.

Is that the case here?


>  
>  	dot11_hdr = (struct ieee80211_hdr *)skb->data;
>  	frame_control = le16_to_cpu(dot11_hdr->frame_control);
> @@ -2045,6 +2047,8 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
>  			qos_len = 2;
>  		if ((frame_control & 0x0300) == 0x0300)
>  			dot11_hdr_len += 6;
> +		if (unlikely(skb->len < dot11_hdr_len + qos_len + snap_len))
> +			goto fail;

Same here, is this actually measurable?

thanks,

greg k-h
