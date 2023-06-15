Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67563A7
	for <linux-staging@lists.linux.dev>; Thu, 15 Jun 2023 10:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05FF3C433C0;
	Thu, 15 Jun 2023 10:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686825972;
	bh=VwYBFTZhYdqEYuSL13LrW74r6u6Zbw9/SlgA2WtY3Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbKFic2eADUeGE1/A5IkYLvrojbFfEQNsu5d6VID4TjaYKiKTauC9RHt/ZMF4QrSr
	 exNbcBBHs2PmueFzCQy3cyhY3cw6/rW9bNxyopXy48feW2Sw5MDYloNX2e32k5PWt2
	 bedfGdmavxN/inll5Fz6kWzajF3cYJwInRVPc6ko=
Date: Thu, 15 Jun 2023 12:46:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8192e: Use standard api to calculate
 frequency to channel
Message-ID: <2023061555-spyglass-most-fccf@gregkh>
References: <cover.1686166624.git.philipp.g.hortmann@gmail.com>
 <fc332e81f6677965e9e51f1fcef9815997effcb5.1686166624.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc332e81f6677965e9e51f1fcef9815997effcb5.1686166624.git.philipp.g.hortmann@gmail.com>

On Thu, Jun 08, 2023 at 08:52:18AM +0200, Philipp Hortmann wrote:
> Use ieee80211_freq_khz_to_channel() to calculate frequency to channel to
> omit proprietary code.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> Tested this code with separate debug code as this part is usually unused.
> ---
>  drivers/staging/rtl8192e/rtllib_softmac_wx.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> index 78a70e5f1974..6fd2e94d5f8a 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> @@ -42,15 +42,8 @@ int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
>  	if (fwrq->e == 1) {
>  		if ((fwrq->m >= (int)2.412e8 &&
>  		     fwrq->m <= (int)2.487e8)) {
> -			int f = fwrq->m / 100000;
> -			int c = 0;
> -
> -			while ((c < 14) && (f != rtllib_wlan_frequencies[c]))
> -				c++;
> -
> -			/* hack to fall through */
> +			fwrq->m = ieee80211_freq_khz_to_channel(fwrq->m / 100);
>  			fwrq->e = 0;
> -			fwrq->m = c + 1;
>  		}
>  	}
>  
> -- 
> 2.40.1
> 
> 

Does not apply to my tree for some reason, can you rebase and resubmit?

thanks,

greg k-h
