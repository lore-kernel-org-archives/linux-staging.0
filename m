Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE97DA95;
	Tue, 24 Dec 2024 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735027328; cv=none; b=ZhfVkYDGXD82zKcGUR1igZGerSAwSRxi4bRRtIL3jTa9MjdqDLggUIFdzzs0A3U0ZwvbpI4vIkYCXWePIqMloCZcoiG6VNR26aGpJ2ajn9cqZgl4YchQM89HATQHLZykD8fOgbSBNO2+HO9TkGNamB04enAuU3NO6wABRWgVXHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735027328; c=relaxed/simple;
	bh=JtNkXoVtIUSGKt5sc/WoIY8osLawEGpwTE00XHW2MAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csXLswvF82tzdtWb+Nf6rOLISyRYC97QHlvIIKyp3aod4fITqTNqSZXpb7GZ/bX1RcbNRJHdAoxFK//PXpgzDhY8DaCsxaFZl37mS1BFr+ZmKyiCHkr1WQcnoN8rRKBQwjrTOvj71ghlUAtxaWmOcQktcxS85s3RRL0elHodc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NCeXBxX4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NCeXBxX4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89CCC4CED0;
	Tue, 24 Dec 2024 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735027327;
	bh=JtNkXoVtIUSGKt5sc/WoIY8osLawEGpwTE00XHW2MAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NCeXBxX4FnvZPHCbENjjRM1jxrlN5eCaNjC4Wh3lKHWLtZJB7xhUdPDX/Nk5cKSdg
	 fkYak7W6GW8NgjHOa1er9HwOz38zX5RErN0tenb6Jic4TGsK3zhflEhyYLjv28zTcX
	 gXvvHTfIQTQhfOhnIg0YWvb587phcA6bXYn/v9bo=
Date: Tue, 24 Dec 2024 09:02:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix network selection and A-MPDU
 reordering in rtw_mlme.c
Message-ID: <2024122411--0ad4@gregkh>
References: <20241224072754.2352-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224072754.2352-1-evepolonium@gmail.com>

On Tue, Dec 24, 2024 at 12:57:52PM +0530, Atharva Tiwari wrote:
> this patch fixes the network selection logic to avoid selecting a network with the same ESSID as the oldest scanned network
> if it was scanned within the last second. it also improves A-MPDU reordering bu enabling it only if the AP supports it,and disabling it otherwise

What commit id does this fix?

And please wrap your changelog at 72 columns like your editor asked you
to do when making the commit :)

> and also i have a question what does "new enough" mean on line 481?

This doesn't belong in a changelog, but rather below the --- line,
right?

> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 28 +++++++++++++++--------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 5ded183aa08c..b33846f88680 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -481,7 +481,9 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>  		}
>  
>  		if (rtw_roam_flags(adapter)) {
> -			/* TODO: don't select network in the same ess as oldest if it's new enough*/
> +			if (is_same_ess(&pnetwork->network, &oldest->network) &&
> +				time_after(pnetwork->last_scanned, (unsigned long)msecs_to_jiffies(1000)))

Where did this magic number come from?

> +				continue;
>  		}
>  
>  		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
> @@ -1000,15 +1002,23 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
>  
>  		/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
>  		/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indicate_seq) to default value = 0xffff */
> -		/* todo: check if AP can send A-MPDU packets */
> -		for (i = 0; i < 16 ; i++) {
> -			preorder_ctrl = &psta->recvreorder_ctrl[i];
> -			preorder_ctrl->enable = false;
> -			preorder_ctrl->indicate_seq = 0xffff;
> -			preorder_ctrl->wend_b = 0xffff;
> -			preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
> +		if (rtw_check_ap_supports_ampdu(pnetwork)) {
> +			for (i = 0; i < 16 ; i++) {
> +				preorder_ctrl = &psta->recvreorder_ctrl[i];
> +				preorder_ctrl->enable = true; /* Enable A-MPDU reordering */
> +				preorder_ctrl->indicate_seq = 0; /* Starting sequence number */
> +				preorder_ctrl->wend_b = 0xffff;
> +				preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
> +			}
> +		} else {
> +			for (i = 0; i < 16; i++) {
> +				preorder_ctrl = &psta->recvreorder_ctrl[i];
> +				preorder_ctrl->enable = false;
> +				preorder_ctrl->indicate_seq = 0xffff;

So only two fields are different, right?  Why not just set those in a
separate loop instead?

> +				preorder_ctrl->wend_b = 0xffff;
> +				preorder_ctrl->wsize_b = 64;  /* max_ampdu_sz; adjust as needed */

When is this "needed"?

And you have tested all of this, right?

thanks,

greg k-h
