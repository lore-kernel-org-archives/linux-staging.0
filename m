Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556DE2EC0B0;
	Wed,  6 May 2026 05:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043684; cv=none; b=hE+eNCXatqGGzM0snpLUdGcuzN+6NEgo8X6ljsmRJsaZoZRznCylyMlwzaYQLqtwbeLhlobYEev0bIZX/IExjLttpA5wg6HtoMOHNcc4+vya53csrAy9ZraJUzFa6eD4YtsWN1x75nrM3HigBmdFpHoiTLcIeR4AZq0fZc8skl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043684; c=relaxed/simple;
	bh=ABKVpeusn/kNZ6IhzGWCuoLnEaQkmedbQrjB03tmSaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPhh7rvvPayCEUat/Gi4g66w264knFuwOmSr0DAyVNHWhytpveHXjdVU8r25M8B/NqEHEvlapnd1VKgK9dg0fGzUzkYkIv/b7EdNtQlCridd3xGKhr0ooXx/g5we7tI2vUczhxPt7w7lWeUmm5WP7B2WgReHo7cOwFMSR33LAzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yy1jmlzT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yy1jmlzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25CCC2BCC4;
	Wed,  6 May 2026 05:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778043684;
	bh=ABKVpeusn/kNZ6IhzGWCuoLnEaQkmedbQrjB03tmSaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yy1jmlzTPcQMYCHWxxnUbyW9a46FU9SlAFbyyi/WsnnEsb1wEslD1LmBRTdhOMm6+
	 MqEE2xwZx2Yr3tTTbnrjghJnhIswv1dKFzoJ7lM/4ivMQte0BRS/2mGgj/43NldOkf
	 0ZW4jwt4+0zax3hq/ozFWKtBPTdeeOwLZxjfLpDE=
Date: Wed, 6 May 2026 07:01:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mohammed Sohail <mohd.sohail.biz@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: simplify NULL pointer checks
Message-ID: <2026050610-modular-purgatory-ad90@gregkh>
References: <afcUjiVlxZIj3Ma0@archlinux>
 <20260506014959.7966-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506014959.7966-1-mohd.sohail.biz@gmail.com>

On Wed, May 06, 2026 at 07:19:59AM +0530, Mohammed Sohail wrote:
> Replace ptr == NULL with !ptr in rtw_recv.h and ioctl_cfg80211.c.
> 
> Improves readability and follows kernel coding style.
> No functional changes.
> 
> Signed-off-by: Mohammed Sohail <mohd.sohail.biz@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtw_recv.h      | 8 ++++----
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
> index 8e45871f07f0..9c32d480a20a 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
> @@ -349,7 +349,7 @@ s32  rtw_recv_entry(union recv_frame *precv_frame);
>  static inline u8 *get_rxmem(union recv_frame *precvframe)
>  {
>  	/* always return rx_head... */
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	return precvframe->u.hdr.rx_head;
> @@ -362,7 +362,7 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
>  	/* used for extract sz bytes from rx_data, update rx_data and return the updated rx_data to the caller */
>  
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  
> @@ -387,7 +387,7 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
>  	/* after putting, rx_tail must be still larger than rx_end. */
>  	unsigned char *prev_rx_tail;
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	prev_rx_tail = precvframe->u.hdr.rx_tail;
> @@ -414,7 +414,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int s
>  	/* used for extract sz bytes from rx_end, update rx_end and return the updated rx_end to the caller */
>  	/* after pulling, rx_end must be still larger than rx_data. */
>  
> -	if (precvframe == NULL)
> +	if (!precvframe)
>  		return NULL;
>  
>  	precvframe->u.hdr.rx_tail -= sz;
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index fd3bae31b0ed..8ae3adecafd9 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
>  	spin_lock_bh(&pstapriv->asoc_list_lock);
>  	psta = rtw_sta_info_get_by_idx(idx, pstapriv);
>  	spin_unlock_bh(&pstapriv->asoc_list_lock);
> -	if (psta == NULL) {
> +	if (!psta) {
>  		ret = -ENOENT;
>  		goto exit;
>  	}
> -- 
> 2.43.0
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
