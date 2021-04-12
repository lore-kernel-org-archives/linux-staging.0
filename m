Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1118171
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:43:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40196611AD;
	Mon, 12 Apr 2021 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618220586;
	bh=WsiNqKTdYhZHLWI0ixdu86RNc49vtM155yUiz3ZveTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UhKxHYqB4zdIGW991QXkB/gNj9Zf+zhvVKr6EM7AQHnx32mMHyXOS5F/i1/utUORd
	 YpYqn4nqdIan2yPcOclvUZpr5jIUUQCS7PCk5TBESbEnS7voZ8f6/4ryN1I1ZJw0uO
	 3FD25bGNDPi3O2+zNNYCFnuj9+2kyxWn8KIRwoD4=
Date: Mon, 12 Apr 2021 11:43:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8192u: Remove variable
 set but not used
Message-ID: <YHQWKMu/KuhZ9Oxs@kroah.com>
References: <20210411183634.18385-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411183634.18385-1-fmdefrancesco@gmail.com>

On Sun, Apr 11, 2021 at 08:36:34PM +0200, Fabio M. De Francesco wrote:
> Remove variable "int ret", declared but not used.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Changes from v1: Change the text of the subject and log.
> 
>  drivers/staging/rtl8192u/r8192U_core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index f48186a89fa1..30055de66239 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -902,7 +902,6 @@ static void rtl8192_hard_data_xmit(struct sk_buff *skb, struct net_device *dev,
>  				   int rate)
>  {
>  	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
> -	int ret;
>  	unsigned long flags;
>  	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb + MAX_DEV_ADDR_SIZE);
>  	u8 queue_index = tcb_desc->queue_index;
> -- 
> 2.31.1
> 

Breaks the build, why did you not test this patch?

thanks,

greg k-h
