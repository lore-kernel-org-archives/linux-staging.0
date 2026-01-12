Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D109230F958;
	Mon, 12 Jan 2026 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768200485; cv=none; b=HMBfBUOuA3UK/v1+REudDWcAkT8PzfZ1yMh7uQP7QTxAP5BzMZT/twLO7IK84528MBFeP17gmVaDbFiV5xXOeOcLzgpx6cQtk89JpWUZS2d5bob1Cx1VQFcK8+L36tt3e1+Zi240cf/RbSzVnx4B+sz2oH0mv2MF0xZXTjaBfac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768200485; c=relaxed/simple;
	bh=hjylcqgfHS52Mn0+Sjznr316HDs1zVo7+Tad9jZNryE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDQruVs11XJ9L0RS4yi3Xh0irS593Nse/RBQ/KnP1c7N9UHFc+j6CVqpoC2pSmjJxx5hAabLBPIEs1ALW8WdE2NLSYRm8kor1BsfyxuDY9HrCC0F/Zq844Dj7faj+OW1X8rWMubOG6CA9d14txh/dJUootIwenYhHUWr28rKncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JyQmK+jO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JyQmK+jO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC021C116D0;
	Mon, 12 Jan 2026 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768200485;
	bh=hjylcqgfHS52Mn0+Sjznr316HDs1zVo7+Tad9jZNryE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyQmK+jOL7l4YR/kK0XGOeOlgb3ulKfORtORQvb+97bqev5z2ZtImcL3wLxk1+Ob6
	 z5S3xebL3srLJcumIufi5z4R6Nk8QN5Z8mDnpWjqkDvzBD8m/IbF9pUX3d5hSHS4/K
	 Le5F02nUyylc7Kkts/RbLIhgAv9X377PfZ93FKaE=
Date: Mon, 12 Jan 2026 07:48:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] staging: rtl8723bs: style cleanups in rtw_mlme.c
Message-ID: <2026011224-errant-obedient-0882@gregkh>
References: <20260111234342.290733-1-lorenzosimonelli02@gmail.com>
 <20260111234342.290733-2-lorenzosimonelli02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111234342.290733-2-lorenzosimonelli02@gmail.com>

On Mon, Jan 12, 2026 at 12:43:42AM +0100, Lorenzo Simonelli wrote:
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 98704179a..d9e6778e1 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -468,11 +468,11 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
>  		&pmlmepriv->cur_network.network,
>  		&pmlmepriv->cur_network.network,
>  		&pmlmepriv->cur_network.network);
> -
> -	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
> +	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) &&
> +	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
>  		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
>  		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
> -								pmlmepriv->cur_network.network.ie_length);
> +				      pmlmepriv->cur_network.network.ie_length);
>  	}
>  }
>  
> @@ -710,7 +710,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
>  	rtw_set_signal_stat_timer(&adapter->recvpriv);
>  
>  	if (pmlmepriv->to_join) {
> -		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
> +		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>  			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
>  				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
>  
> @@ -1386,8 +1386,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
>  
>  	spin_lock_bh(&pmlmepriv->lock);
>  
> -	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
> +	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
> +	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>  		if (adapter->stapriv.asoc_sta_count == 2) {
>  			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
>  			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
> @@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
>  	return ielength;
>  }
>  
> -/* Ported from 8185: IsInPreAuthKeyList(). 
> +/* Ported from 8185: IsInPreAuthKeyList().
>   * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
>   * Added by Annie, 2006-05-07.
>   *
> -- 
> 2.52.0
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
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

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
