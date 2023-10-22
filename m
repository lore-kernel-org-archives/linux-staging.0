Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83B20E0
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="11AKRbkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BA5C433C7;
	Sun, 22 Oct 2023 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697970102;
	bh=qx9fiqBm78EQbsq1jqlRm+HmjDwlk+Z1GmoH3Zto2IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=11AKRbkXNFapEjlnJYoZa08mey4Z7ClTyGtVY7XYGK9YHQDnGO5hwpBQbGemaDjih
	 Tb0zKNmW8TyabZp5rdmLj5uFtNGIqT3FxRtZFT7lFxn436j9ZcerOgY3SJoVIxJa4q
	 csDl9v0CaAxTaYxZU3pQllDM/RwQaW12BA2SaHbE=
Date: Sun, 22 Oct 2023 12:21:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: renamed variable IsHTHalfNmodeAPs
Message-ID: <2023102221-abreast-refold-d300@gregkh>
References: <20231021224051.7443-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021224051.7443-1-garyrookard@fastmail.org>

On Sat, Oct 21, 2023 at 06:40:51PM -0400, Gary Rookard wrote:
> Renamed from Pascal/CamelCase to Snake case the variable
> IsHTHalfNmodeAPs, IsHTHalfNmodeAPs -> is_ht_half_nmode_aps.
> 
> Linux kernel coding style (cleanup) checkpatch Avoid CamelCase.
> Driver rtl8192e compiles.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
>  drivers/staging/rtl8192e/rtllib.h         | 2 +-
>  drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 8070a152712e..f564474fab52 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -139,7 +139,7 @@ u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
>  	return MCS_DATA_RATE[is40MHz][isShortGI][nDataRate & 0xf];
>  }
>  
> -bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
> +bool is_ht_half_nmode_aps(struct rtllib_device *ieee)
>  {
>  	bool			retValue = false;
>  	struct rtllib_network *net = &ieee->current_network;
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 6a9550eaf148..5cae02883a59 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1783,7 +1783,7 @@ extern u8 MCS_FILTER_ALL[];
>  extern u16 MCS_DATA_RATE[2][2][77];
>  u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
>  void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
> -bool IsHTHalfNmodeAPs(struct rtllib_device *ieee);
> +bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
>  u16  tx_count_data_rate(struct rtllib_device *ieee, u8 nDataRate);
>  int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
>  int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
> index ff98b41c94e0..501295f5b75e 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac.c
> @@ -1872,7 +1872,7 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
>  		ieee->softmac_stats.rx_auth_rs_ok++;
>  		if (!(ieee->ht_info->iot_action & HT_IOT_ACT_PURE_N_MODE)) {
>  			if (!ieee->GetNmodeSupportBySecCfg(ieee->dev)) {
> -				if (IsHTHalfNmodeAPs(ieee)) {
> +				if (is_ht_half_nmode_aps(ieee)) {
>  					bSupportNmode = true;
>  					bHalfSupportNmode = true;
>  				} else {
> -- 
> 2.41.0
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

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.  Greg could just guess, but if you are
  receiving this email, he guessed wrong and the patches didn't apply.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for a
  description of how to do this so that Greg has a chance to apply these
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
