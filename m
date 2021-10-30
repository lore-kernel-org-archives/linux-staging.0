Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9106F2C81
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 09:13:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8CE6101E;
	Sat, 30 Oct 2021 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635585224;
	bh=sw8oZ0/yqEYBk5r/BgrMHwjjS2lg76p5KcBLgIYAHfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYzIQGlf5nM1i3o+omILMaXDZN7Cvq9y/tiQf3zIOwBi+AUly5WmC5anIRpbc1ZJz
	 BA4+1ZwEPrbNqM+UiWQ8MmKHH0hmH2ImGvEm1pfvHCd5b9knM/j/FAOoiruGnQtEMD
	 UD9dwjF0tAIgJp3lUjxH3vqeZcruUnAZ/gTnMxUQ=
Date: Sat, 30 Oct 2021 11:13:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Goller <gabrielgoller123@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: wlan-ng: formatting cleanup in cfg80211.c
Message-ID: <YX0MxpGRL/74vkAh@kroah.com>
References: <YXzyEpmz1RZP4Ssw@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXzyEpmz1RZP4Ssw@desktop>

On Sat, Oct 30, 2021 at 09:19:46AM +0200, Gabriel Goller wrote:
> Fixed bracket alignment and line-length issues.
> 
> Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
> ---
>  drivers/staging/wlan-ng/cfg80211.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
> index 7951bd63816f..b394afe8c3d7 100644
> --- a/drivers/staging/wlan-ng/cfg80211.c
> +++ b/drivers/staging/wlan-ng/cfg80211.c
> @@ -324,12 +324,10 @@ static int prism2_scan(struct wiphy *wiphy,
>  	}
>  	msg1.probedelay.data = 0;
>  
> -	for (i = 0;
> -		(i < request->n_channels) && i < ARRAY_SIZE(prism2_channels);
> -		i++)
> +	for (i = 0; (i < request->n_channels) && i < ARRAY_SIZE(prism2_channels); i++)
>  		msg1.channellist.data.data[i] =
> -			ieee80211_frequency_to_channel(
> -				request->channels[i]->center_freq);
> +			ieee80211_frequency_to_channel(request->channels[i]->center_freq);
> +
>  	msg1.channellist.data.len = request->n_channels;
>  
>  	msg1.maxchanneltime.data = 250;
> @@ -369,7 +367,8 @@ static int prism2_scan(struct wiphy *wiphy,
>  					  msg2->beaconperiod.data,
>  					  ie_buf,
>  					  ie_len,
> -					  (msg2->signal.data - 65536) * 100, /* Conversion to signed type */
> +						/* Conversion to signed type */
> +					  (msg2->signal.data - 65536) * 100,
>  					  GFP_KERNEL);
>  
>  		if (!bss) {
> @@ -476,14 +475,13 @@ static int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>  				return -EINVAL;
>  
>  			result = prism2_domibset_uint32(wlandev,
> -				DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
> -				sme->key_idx);
> +							DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
> +							sme->key_idx);
>  			if (result)
>  				goto exit;
>  
>  			/* send key to driver */
> -			did = didmib_dot11smt_wepdefaultkeystable_key(
> -					sme->key_idx + 1);
> +			did = didmib_dot11smt_wepdefaultkeystable_key(sme->key_idx + 1);
>  			result = prism2_domibset_pstr32(wlandev,
>  							did, sme->key_len,
>  							(u8 *)sme->key);
> @@ -589,8 +587,8 @@ static int prism2_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
>  		data = MBM_TO_DBM(mbm);
>  
>  	result = prism2_domibset_uint32(wlandev,
> -		DIDMIB_DOT11PHY_TXPOWERTABLE_CURRENTTXPOWERLEVEL,
> -		data);
> +					DIDMIB_DOT11PHY_TXPOWERTABLE_CURRENTTXPOWERLEVEL,
> +					data);
>  
>  	if (result) {
>  		err = -EFAULT;
> -- 
> 2.30.2
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
