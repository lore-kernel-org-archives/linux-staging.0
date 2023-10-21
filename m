Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D710793
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 20:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0Wk5zLxc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0DAC433C7;
	Sat, 21 Oct 2023 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697921557;
	bh=uCbsWfoeu1x5nqtjpAkFRrXuTJUT9NjOEa7ssGk6ZRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0Wk5zLxcUbfkZzQH6EjWxKkgPBcTXSIy2c+opVRAsjNpwQa4vEqX/QqvjT5W7nXS7
	 iCy8Vg8NUa5FRPYPbLe2dXAxlHIqudlM4cnvSoxeEs8Tt0AklRCAb+X+ae8KOAkz+4
	 Sucldc1aelD5s9YdWqYotYezPRz6NB3rb7M1uQzQ=
Date: Sat, 21 Oct 2023 22:52:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: renamed variable TxCountToDataRate,
 spacing, realignment
Message-ID: <2023102119-briar-caboose-5465@gregkh>
References: <20231021204655.6570-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021204655.6570-1-garyrookard@fastmail.org>

On Sat, Oct 21, 2023 at 04:46:55PM -0400, Gary Rookard wrote:
> 
> 1) Renamed from Pascal/CamelCase to Snake case the variable
>    TxCountToDataRate, TxCountToDataRate -> tx_count_to_data_rate.
> 
> 2) Made a realignment w/open parenthesis adjustment after renaming.
> 
> 3) Corrected spacing.
> 
> Linux kernel coding style (cleanup),checkpatch Avoid CamelCase,
> checkpatch Alignment should match open parenthesis.
> Driver rtl8192e compiles.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
>  drivers/staging/rtl8192e/rtl819x_HTProc.c    | 2 +-
>  drivers/staging/rtl8192e/rtllib.h            | 2 +-
>  drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 00b21542ddc3..304f2ab0be3e 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -114,7 +114,7 @@ static u16 HTMcsToDataRate(struct rtllib_device *ieee, u8 nMcsRate)
>  	return MCS_DATA_RATE[is40MHz][isShortGI][(nMcsRate & 0x7f)];
>  }
>  
> -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate)
> +u16 tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
>  {
>  	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
>  				   0x24, 0x30, 0x48, 0x60, 0x6c};
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 9d141aad8cd5..5c8c7caf2c17 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1784,7 +1784,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
>  u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
>  void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
>  bool IsHTHalfNmodeAPs(struct rtllib_device *ieee);
> -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate);
> +u16 tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
>  int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
>  int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
>  int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> index f32584291704..52c9c2c873b1 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> @@ -208,8 +208,8 @@ int rtllib_wx_get_rate(struct rtllib_device *ieee,
>  {
>  	u32 tmp_rate;
>  
> -	tmp_rate = TxCountToDataRate(ieee,
> -				     ieee->softmac_stats.CurrentShowTxate);
> +	tmp_rate = tx_count_to_data_rate(ieee,
> +					 ieee->softmac_stats.CurrentShowTxate);
>  	wrqu->bitrate.value = tmp_rate * 500000;
>  
>  	return 0;
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
