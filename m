Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1E435F19B
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 03:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261883; cv=none; b=Py8psPa8bihZA/LtnqvuIlbFLET8qQ8XmtLPJ5UbMhivfOswij6ahpky3IMiAj6+3gEm0M1s8De9stEs2c3lRA/bDq2zhWDxVf/A2jWYP5P8Q4dgqh6KhbHi+PALQn97Hs9QTfM+DIstii5BfdiC49Pz7oNRGSoO/M9LsVCYMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261883; c=relaxed/simple;
	bh=uIDA0cb5rLEijH8Lr3auotElgBS3cmB/npUpEmFYNPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaBRkbqa7BkGBbSZm7g+u/n7fX09Y5+2RN/EIk7hjB3YrKVh1gtfDVU/4rMXnnFKjvTzLL3WDjRB/rVUX1z4ISvjTXit5x+C8xzh6W/rXAeSWcfAymzhmb8scImxUlBCBm93IYWg67Y+CVvcNwL1f/HP+OJmSFuNldbsu0qkeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=XaylQToo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DK+KD1nM; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="XaylQToo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DK+KD1nM"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id A5BD21D000BC;
	Sun, 26 Apr 2026 23:51:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 26 Apr 2026 23:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777261880; x=1777348280; bh=/Jjn5YKcfQ
	ID/W9GH0KkThB/72y/FrItIWw5Zi3imwo=; b=XaylQTooJEP/2sA8cJzJu/ZrOf
	LQeSSYUDISBKEtF+saKhlNA4XASkFdJEQu7hOcCf3V33cy9xVljjjb7YhUcuYNWO
	uBZ6e0oTGwwZqlXsEmY+4AZ4Me1w6VvHo3EVc2VPIhTgjhXe/KWjdd2QKPdr22sP
	FBv5Nxr6HqhRTdD6LNRCS9miloMRwXp1AuPFgOgjY/wZM/UMM0IpQDjzOrCwtXGi
	NSui+xBhTvo5zNy9e9Ekx2MBFeBTrL18hfeIFr6JILI6wUAxuXaexB8/klEc2j5W
	hn22tXpuTYDs4BkY+sXGfE0AZ/0Zftjbih5rh/D0f5sRQHMbPLRuyiEDNmTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777261880; x=1777348280; bh=/Jjn5YKcfQID/W9GH0KkThB/72y/FrItIWw
	5Zi3imwo=; b=DK+KD1nMCEj/e5APvwMo3uof8r11ji5x+FE+/zvBtjP6cy6yMqm
	mlp9IIMAl58X9llOSolLYzCg1eOn3ibQ72isSjE+KjzPHy8rNpXUjciaCzMGiMol
	WNmKd2cATOS5SfBfC/tFnNSlTlqQYuR/Tvnw4YMQ+r5gApOK49MQMPF9uDdbiHDP
	H0GPIu8dCsOKEguHBp3jbzs5mG6zDyKTaWqlV3qLdu3IdtMRHgivv7ynOEB0dBFq
	4Kz4V4ky3N0E/+S+vpdowBZ+1YiDGEAZDLXTIWdjLTFd4ocmMLt3YNFTbjodhPTD
	PXjrIBUn6aW94120zKK8TcdVVpgcq1oeJvw==
X-ME-Sender: <xms:ON3uaWFtTin13XCnogzSX2BLMStDhG7OjQI2jxry6JHYVooF2xmRnA>
    <xme:ON3uaVLGNdkQrR9CUPEG6sVxFu8xXiQgBxCiSBDTCeRqKVjcQ2gD4_LqDuIccn3xf
    lWuPdwJTXja-c1VLjbraBmprCh94eph1jnEZVjV50CdQZFgYA>
X-ME-Received: <xmr:ON3uaalS7GjwXdWBfYIWYvI5zMIgaLXCAAd99OBIFW255wpm09bv8HTo7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejjeeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttd
    dtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecu
    ggftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtd
    eufefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehvrghsihhlihhjvghknhgviigvvhhitgdruggv
    vhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlih
    hsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:ON3uadRVRQ8noIL3SVy8LdLtReLhCU4df9ucoSI6tbr6z7mdgDUu5Q>
    <xmx:ON3uacIW_Uo4gBbTxH8XIle4jFnfUi9QxwxpaX2UFBTNVGpEI5-thg>
    <xmx:ON3uaTDjOaI2bEmLN1WM-CwNDwRivZlA7TYmAF5R74icwZAHh9QfGQ>
    <xmx:ON3uaVBuFcjLUD44cf2as8G129sqZR7Y8BvqjGf43YRq5C3qWQGEag>
    <xmx:ON3uaaC3j2BOHFnneH4UxfvxffU5vdU2AQXVhbPBdX16RrZxz8RgUBIj>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Apr 2026 23:51:19 -0400 (EDT)
Date: Sun, 26 Apr 2026 22:01:21 +0200
From: Greg KH <greg@kroah.com>
To: Vasilije Knezevic <vasilijeknezevic.dev@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] rtl8723bs: improve readability in cmd filter and traffic
 watchdog
Message-ID: <2026042602-unreeling-primal-0e2f@gregkh>
References: <20260419110151.5689-1-vasilijeknezevic.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419110151.5689-1-vasilijeknezevic.dev@gmail.com>

On Sun, Apr 19, 2026 at 01:01:51PM +0200, Vasilije Knezevic wrote:
>  - Rename bAllow to allow_pre_init_cmd
>  - Convert traffic flags to bool where appropriate
>  - Improve comments for traffic detection logic
> 
>  No functional change.
> 
> Signed-off-by: Vasilije Knezevic <vasilijeknezevic.dev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index abb84f8aecbe..e0c57652e0f5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -298,12 +298,13 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>  {
> -	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
> +	/* set to true to allow enqueuing cmd when hw_init_completed is false */
> +	bool allow_pre_init_cmd = false;
>  
>  	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
> -		bAllow = true;
> +		allow_pre_init_cmd = true;
>  
> -	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
> +	if ((!pcmdpriv->padapter->hw_init_completed && !allow_pre_init_cmd) ||
>  	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
>  		return _FAIL;
>  
> @@ -1127,12 +1128,16 @@ static void collect_traffic_statistics(struct adapter *padapter)
>  
>  u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  {
> -	u8 bEnterPS = false;
> +	bool bEnterPS = false;
>  	u16 BusyThresholdHigh = 25;
>  	u16 BusyThresholdLow = 10;
>  	u16 BusyThreshold = BusyThresholdHigh;
> -	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
> -	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
> +	u8 bBusyTraffic = false;
> +	u8 bTxBusyTraffic = false;
> +	u8 bRxBusyTraffic = false;
> +	u8 bHigherBusyTraffic = false;
> +	u8 bHigherBusyRxTraffic = false;
> +	u8 bHigherBusyTxTraffic = false;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
>  	collect_traffic_statistics(padapter);
> @@ -1156,7 +1161,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  				bTxBusyTraffic = true;
>  		}
>  
> -		/*  Higher Tx/Rx data. */
> +		/*  Detect high Tx/Rx traffic load. */
>  		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
>  		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
>  			bHigherBusyTraffic = true;
> @@ -1191,7 +1196,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  				bEnterPS = true;
>  		}
>  
> -		/*  LeisurePS only work in infra mode. */
> +		/*  LeisurePS based on traffic state (infra mode only) */
>  		if (bEnterPS) {
>  			if (!from_timer)
>  				LPS_Enter(padapter, "TRAFFIC_IDLE");
> -- 
> 2.47.3
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
