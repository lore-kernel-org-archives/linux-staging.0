Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FEB49659
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906754; cv=none; b=tQGmcjuOXrS49t0hniJVeVB0WKzfKcvEmoWFrhYMTLPzJg5Em1BszBG+yAn9zdU5INIaIJV1TVEROVkeiF43AFHZxBM1IJvUESBC/c52BuaewhsTZ8ecTExpuO+FlrSXdI7ShGesUkxIvE7gUc8ZpNxJlW8EDW5q2iWENmCAYsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906754; c=relaxed/simple;
	bh=d2t2jUtqgd1juOxoeK062E91VF8LFE0vF9cv6rz30/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiF4pO2qJidD74s3hq4iJg3ShLCpchD73qmv3Zh25xEDvdY0+3liu3Nu6SfayUEUW3OBf1ER0Aw2vsgvZFl/BnnTPt/pkg4s6KA3SF/ReOd1YX9B7RJE5OhUhElemsy1HMXcvV1J74fQIWiG+uqjT49j17f5r6MID3/JWGAWV4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=C2hhjtcc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=akknzvZ7; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="C2hhjtcc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="akknzvZ7"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0BCA77A00E9;
	Mon,  4 May 2026 10:59:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 04 May 2026 10:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1777906750; x=1777993150; bh=VM0D9cC+fH
	pBpvLJkUiCitWjau5Cr5ieWJVlaANWEPI=; b=C2hhjtccFJM5xGMn9iThmYQeDY
	YT9udf7N4q54ODF/m+iY1nmSFB/N2CQTWTJri1wwQVoXxJbPNLflYflbtb21Bo6H
	gZospj/2iqq5Vmky5nHQvAaPRf4oHZxGl7wv3Ss9MT6Yhyl9oaUps+cVs/Vw49YX
	W23t+xDJoHc9FPptRyRq6YKSdm34lCQ4EqHJA496Uy751m7veknuN3SYztjFZVxE
	4FcFf/wxUvs6XHgY2ig5fhcCzVFLZCh9gZwNErZhPa0UdvgPsccv9rjSkuZKtY+w
	MNvzynHsEcCVbRWhITGL9xVySZkxZDWh1jxCqfm13ew4OYqwe7NYRH4CMNVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1777906750; x=1777993150; bh=VM0D9cC+fHpBpvLJkUiCitWjau5Cr5ieWJV
	laANWEPI=; b=akknzvZ7QAADAV62kDxiUh+BXXR994d6OE+G2mFou2d5aSqiMpH
	uHIX9lzzMZVrkLaqMt49VI3n21HMKa4mXHYZRnaHuED5MvcDbuiz/3Q6T0TSxA7C
	wyB/D7K4nllkG003mr4KEfBl6BaVBi8cho+jTHLKm7tD25JTuG30w6a6ICe3bqZA
	cl8a/I0/8Bnl7Qrc18lRn/PHyY3v9wjucUgT5EZsdYtgBrEpkmVVdDZA8UAXjgc5
	MKS3NAW3oQk7mnbnphpmyvQGsmncxiSLZL09I8io6oLtUND0sNDbWkWYQOtcCAmJ
	CAHGeAYYh8c8Pyss2A3Cl9HWbr3XKb6BB7w==
X-ME-Sender: <xms:PrT4aSyZF0h_OfBJz137IWwED9plM_sTb_JR6B-KArLqbGOEqtpGHA>
    <xme:PrT4aQ2g7XRDQZRIN6x5JzUKGKqTCKGOwuXucnmq-flnlyt0b9PEwYLPx4SahNVsc
    1pGHYBcgO8aEmsgKyx6Zw9LjSbqt0PQznLsbGGqN4Wjn0P5uA>
X-ME-Received: <xmr:PrT4aX-oEqAa7Nd3TgJt5BcyHZWkomLTPF2a_bkDe-5tm0E4XYUp079mvlCA3OC2UT7c3his8Hi0eeiZlXF-Ze8osA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelledugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    uggvnhhishgrrhiiuhgsohhvkeesghhmrghilhdrtghomhdprhgtphhtthhopeguvghnih
    hsrghriihusghovhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsthgr
    ghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PrT4aYqN9G8SpURTz6VwUdXFPhFD5cGTw_6uyzOAZWvrB9VpURj4rw>
    <xmx:PrT4aZRvAgt7NOh-LBs0SsLYXf29xys8UuPjnUQI2OFwNH134Fn-2A>
    <xmx:PrT4aTMwWiZSTkGHZRxjgZoIPExTwanj5xAoQPo-x4vocuKcncSQow>
    <xmx:PrT4afhTv80ulLwm10-etXmSezZVnHqUAma68TFzNo0RZ7s1GMsAxA>
    <xmx:PrT4aUns0Gh60S7a-U2Py3euzO1jGiojIelsDK8ZRqJUJzc-hx6fJF2j>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 10:59:10 -0400 (EDT)
Date: Mon, 4 May 2026 16:54:49 +0200
From: Greg KH <greg@kroah.com>
To: Denis Arzubov <denisarzubov8@gmail.com>
Cc: denisarzubov@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove extra blank line in
 rtw_btcoex_LPS_Leave()
Message-ID: <2026050434-storm-hazily-7d9f@gregkh>
References: <20260503215840.51342-1-denisarzubov8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503215840.51342-1-denisarzubov8@gmail.com>

On Mon, May 04, 2026 at 12:58:40AM +0300, Denis Arzubov wrote:
> Remove unnecessary blank line after variable declaration in
> rtw_btcoex_LPS_Leave() function to improve code readability
> and comply with kernel coding style.
> 
> Signed-off-by: Denis Arzubov <denisarzubov8@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> index 0191a943f..27dfd00b4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> @@ -65,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
>  {
>  	struct pwrctrl_priv *pwrpriv;
>  
> -
>  	pwrpriv = adapter_to_pwrctl(padapter);
>  
>  	if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
